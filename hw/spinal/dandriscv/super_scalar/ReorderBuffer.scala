package dandriscv.super_scalar

import spinal.core._
import spinal.lib._
import math._
import scala.annotation.switch


case class ReorderBuffer(p : ReorderBufferConfig) extends Component{
  import p._
  import CpuConfig._

  // =================== IO ===================
  val en_rob_a = slave(Stream(EnROB(PC_WIDTH, OP_WIDTH)))
  val en_rob_b = slave(Stream(EnROB(PC_WIDTH, OP_WIDTH)))
  val de_rob_a = master(Stream(DeROB()))
  val de_rob_b = master(Stream(DeROB()))
  // for instruction wake up
  val exe_rd_addr = in Vec(UInt(PTR_WIDTH-1 bits), IQ_NUM)
  val exe_rd_val  = in Vec(Bits(64 bits), IQ_NUM)
  val exe_executed= in Vec(Bool(), IQ_NUM)
  // for state trans
  val iq_rd_addr = in Vec(UInt(PTR_WIDTH-1 bits), IQ_NUM)
  val iq_issued = in Vec(Bool(), IQ_NUM)
  // interrupt or redirect, flush newest instruction
  val interrupt_vld = in Bool()
  val redirect_vld = in Bool()
  val redirect_rob_ptr = in UInt(PTR_WIDTH bits)

  // =============== Entries of ROB =================
  val entry = new Area{
    val busy = Vec(RegInit(False), DEPTH)
    val state = Vec(Reg(ROBStateEnum()) init(ROBStateEnum.IDLE), DEPTH)
    val pc = Vec(Reg(UInt(PC_WIDTH bits)) init(0), DEPTH)
    val micro_op = Vec(Reg(Bits(OP_WIDTH bits)) init(0), DEPTH)
    val rd_addr = Vec(Reg(UInt(5 bits)) init(0), DEPTH)
    val rd_val = Vec(Reg(Bits(64 bits)) init(0), DEPTH)
    val exception = Vec(Reg(ExceptionEnum()) init(ExceptionEnum.IDLE), DEPTH)
    // comb logic
    val state_nxt = Vec(ROBStateEnum(), DEPTH)
    val en_rob = Vec(Bool(), DEPTH)
    val de_rob = Vec(Bool(), DEPTH)
    val iq_rd_equal = Vec(Bits(IQ_NUM bits), DEPTH)
    val iq_issue = Vec(Bool(), DEPTH)
    val exe_rd_equal = Vec(Bits(IQ_NUM bits), DEPTH)
    val exe_done = Vec(Bool(), DEPTH)
    val commit = Vec(Bool(), DEPTH)
  }

  // =============== Signals =================
  val head_ptr = Reg(UInt(PTR_WIDTH bits)) init(0)
  val head_ptr_add_one = head_ptr + 1
  val head_ptr_add_two = head_ptr + 2
  val tail_ptr = Reg(UInt(PTR_WIDTH bits)) init(0)
  val tail_ptr_sub_one = tail_ptr - 1
  val tail_ptr_add_one = tail_ptr + 1
  val tail_ptr_add_two = tail_ptr + 2
  val head_addr = head_ptr(PTR_WIDTH-2 downto 0)
  val head_addr_add_one = head_ptr_add_one(PTR_WIDTH-2 downto 0)
  val tail_addr = tail_ptr(PTR_WIDTH-2 downto 0)
  val tail_addr_add_one = tail_ptr_add_one(PTR_WIDTH-2 downto 0)
  val rob_empty = (head_ptr===tail_ptr)
  val rob_full = (head_addr===tail_addr) && (head_ptr(PTR_WIDTH-1)=/=tail_ptr(PTR_WIDTH-1))
  val empty_entry_cnt = Reg(UInt(PTR_WIDTH bits)) init(DEPTH)
  val empty_entry_cnt_next = UInt(PTR_WIDTH bits)
  val busy_entry_cnt = U(DEPTH, PTR_WIDTH bits) - empty_entry_cnt
  val busy_entry_cnt_next = U(DEPTH, PTR_WIDTH bits) - empty_entry_cnt_next

  // =============== flush logic ===============
  val flush = redirect_vld
  val flush_all = interrupt_vld
  val flush_ptr = redirect_rob_ptr
  val entry_flush = Vec(Bool(), DEPTH*2)
  val entry_flush_real = Vec(Bool(), DEPTH)
  val entry_flush_len =  UInt(PTR_WIDTH bits)
  val entry_flush_bits = Bits(DEPTH*2 bits)
  val entry_flush_bits_full = Bits(DEPTH*4 bits)

  // when need flush, count length of flush
  entry_flush_len :=  (tail_ptr_sub_one >= flush_ptr) ? 
                      (tail_ptr_sub_one - flush_ptr) |
                      (U(DEPTH*2, PTR_WIDTH+1 bits) - (flush_ptr - tail_ptr_sub_one).resized).resized

  for(i <- 0 until DEPTH*4){
    entry_flush_bits_full(i) := (U(i) > flush_ptr) && (U(i) <= (flush_ptr + entry_flush_len))
  }
  for(i <- 0 until DEPTH*2){
    // flush
    entry_flush_bits(i) := entry_flush_bits_full(i) || entry_flush_bits_full(i+DEPTH*2)
    entry_flush(i) := flush && entry_flush_bits(i)
  }

  // =============== update head pointer of ROB(oldest) ===============
  when(de_rob_a.fire && de_rob_b.fire){
    head_ptr := head_ptr_add_two
  }
  .elsewhen((de_rob_a.fire && !de_rob_b.fire) || 
            (!de_rob_a.fire && de_rob_b.fire)){
    head_ptr := head_ptr_add_one
  }

  // =============== update tail pointer of ROB(next newest index) ===============
  when(flush_all){
    tail_ptr := head_ptr
  }
  .elsewhen(flush){
    tail_ptr := redirect_rob_ptr + 1
  }
  .elsewhen(en_rob_a.fire && en_rob_b.fire){
    tail_ptr := tail_ptr_add_two
  }
  .elsewhen((en_rob_a.fire && !en_rob_b.fire) || 
            (!en_rob_a.fire && en_rob_b.fire)){
    tail_ptr := tail_ptr_add_one
  }

  // =============== count of empty entry ===============
  empty_entry_cnt_next := empty_entry_cnt.resized + 
                          de_rob_a.fire.asUInt.resized + 
                          de_rob_b.fire.asUInt.resized - 
                          en_rob_a.fire.asUInt.resized - 
                          en_rob_b.fire.asUInt.resized
  when(flush_all){
    empty_entry_cnt := U(DEPTH, PTR_WIDTH bits)
  }
  .elsewhen(flush){
    empty_entry_cnt := empty_entry_cnt + entry_flush_len
  }
  .otherwise{
    empty_entry_cnt := empty_entry_cnt_next
  }

  // =============== update Entries of ROB ===============
  for(i <- 0 until DEPTH){

    // ============== comb logic ===============
    entry.en_rob(i) :=  (en_rob_a.fire && tail_addr===U(i)) || 
                        (en_rob_b.fire && tail_addr_add_one===U(i))
    entry.de_rob(i) :=  (de_rob_a.fire && head_addr===U(i)) || 
                        (de_rob_b.fire && head_addr_add_one===U(i))
    entry_flush_real(i) := entry_flush(i) || entry_flush(i+DEPTH)

    // issue/exe rd equal to rob entry index?
    for(j <- 0 until IQ_NUM){
      entry.iq_rd_equal(i)(j) := iq_rd_addr(j)===U(i)
      exe_rd_equal(i)(j)      := exe_rd_addr(j)===U(i)
    }
    entry.iq_issue(i) := (entry.iq_rd_equal(i) & iq_issued.asBits).orR
    entry.exe_done(i) := (exe_rd_equal(i)(j) & exe_executed.asBits).orR

    // when become oldest and no exception, commit
    entry.commit(i) :=  (entry.busy(i) && 
                          head_addr===U(i) && 
                          entry.state(i)===ROBStateEnum.COMPLETE && 
                          entry.exception(i)===ExceptionEnum.IDLE) ||
                        (entry.busy(i) && 
                          head_addr_add_one===U(i) && 
                          entry.state_nxt(head_addr)===ROBStateEnum.COMMIT &&
                          entry.exception(i)===ExceptionEnum.IDLE)
    

    // ============== busy of ROB entry ==============
    when(entry_flush_real(i)){
      entry.busy(i) := False
    }
    .elsewhen(entry.en_rob(i)){
      entry.busy(i) := True
    }
    .elsewhen(entry.de_rob(i)){
      entry.busy(i) := False
    }

    // ============== state trans of ROB entry ==============
    when(flush_all || entry_flush_real(i)){
      entry.state(i) := ROBStateEnum.IDLE
    }
    .otherwise{
      entry.state(i) := entry.state_nxt(i)
    }
    
    switch(entry.state(i)){
      is(ROBStateEnum.IDLE){
        when(entry.en_rob(i)){
          entry.state_nxt(i) := ROBStateEnum.ISSUE
        }
        .otherwise{
          entry.state_nxt(i) := ROBStateEnum.IDLE
        }
      }
      is(ROBStateEnum.ISSUE){
        when(entry.iq_issue(i)){
          entry.state_nxt(i) := ROBStateEnum.EXECUTE
        }
        .otherwise{
          entry.state_nxt(i) := ROBStateEnum.ISSUE
        }
      }
      is(ROBStateEnum.EXECUTE){
        when(entry.exe_done(i)){
          entry.state_nxt(i) := ROBStateEnum.COMPLETE
        }
        .otherwise{
          entry.state_nxt(i) := ROBStateEnum.EXECUTE
        }
      }
      is(ROBStateEnum.COMPLETE){
        when(entry.commit(i)){
          entry.state_nxt(i) := ROBStateEnum.COMMIT
        }
      }
      is(ROBStateEnum.COMMIT){
        entry.state_nxt(i) := ROBStateEnum.IDLE
      }
    }

    // ============== pc of ROB entry==============
    when(entry.en_rob(i)){
      when(en_rob_a.fire && tail_addr===U(i)){
        entry.pc(i) := en_rob_a.pc
      }
      .elsewhen(en_rob_b.fire && tail_addr_add_one===U(i)){
        entry.pc(i) := en_rob_b.pc
      }
    }
  }

  
}

object GenROB extends App {
  val ROBConfig = ReorderBufferConfig(8, 32, 1, 1)
  GenConfig.spinal.generateVerilog(ReorderBuffer(ROBConfig))
}