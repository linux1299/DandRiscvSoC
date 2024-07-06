package dandriscv.super_scalar

import spinal.core._
import spinal.lib._
import math._
import scala.annotation.switch
import MyUtils._

case class ReorderBuffer(p : ReorderBufferConfig) extends Component{
  import p._
  import CpuConfig._

  // =================== IO ===================
  val en_rob_a = slave(Stream(EnROB(PC_WIDTH)))
  val en_rob_b = slave(Stream(EnROB(PC_WIDTH)))
  val de_rob_a = master(Stream(DeROB()))
  val de_rob_b = master(Stream(DeROB()))
  // for instruction wake up
  val exe_rob_ptr = in Vec(UInt(PTR_WIDTH bits), IQ_NUM)
  val exe_rd_val  = in Vec(Bits(64 bits), IQ_NUM)
  val exe_executed= in Vec(Bool(), IQ_NUM)
  // for state trans
  val isq_rob_ptr = in Vec(UInt(PTR_WIDTH bits), IQ_NUM)
  val isq_issued = in Vec(Bool(), IQ_NUM)
  // interrupt or redirect, flush newest instruction
  val interrupt_vld = in Bool()
  val redirect_vld = in Bool()
  val redirect_rob_ptr = in UInt(PTR_WIDTH bits)

  // =============== Entries of ROB =================
  val entry = new Area{
    val busy = Vec(RegInit(False), DEPTH)
    val state = Vec(Reg(ROBStateEnum()) init(ROBStateEnum.IDLE), DEPTH)
    val pc = Vec(Reg(UInt(PC_WIDTH bits)) init(0), DEPTH)
    val micro_op = Vec(Reg(RobMicroOp()) init(RobMicroOp.IDLE), DEPTH)
    val rd_addr = Vec(Reg(UInt(5 bits)) init(0), DEPTH)
    val rd_val = Vec(Reg(Bits(64 bits)) init(0), DEPTH)
    val exception = Vec(Reg(ExceptionEnum()) init(ExceptionEnum.IDLE), DEPTH)
    // comb logic
    val state_nxt = Vec(ROBStateEnum(), DEPTH)
    val en_rob = Vec(Bool(), DEPTH)
    val de_rob = Vec(Bool(), DEPTH)
    val isq_rd_equal = Vec(Bits(IQ_NUM bits), DEPTH)
    val isq_issue_bits = Vec(Bits(IQ_NUM bits), DEPTH)
    val isq_issue = Vec(Bool(), DEPTH)
    val exe_rd_equal = Vec(Bits(IQ_NUM bits), DEPTH)
    val exe_done_bits = Vec(Bits(IQ_NUM bits), DEPTH)
    val exe_rd_val = Vec(Bits(64 bits), DEPTH)
    val exe_done = Vec(Bool(), DEPTH)
    val commit = Vec(Bool(), DEPTH)
    val flush = Vec(Bool(), DEPTH)
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
  val empty_entry_cnt_next = UInt(PTR_WIDTH bits)
  val empty_entry_cnt = RegNext(empty_entry_cnt_next) init(DEPTH)
  val busy_entry_cnt = U(DEPTH, PTR_WIDTH bits) - empty_entry_cnt
  val busy_entry_cnt_next = U(DEPTH, PTR_WIDTH bits) - empty_entry_cnt_next

  // =============== flush logic ===============
  val flush = redirect_vld
  val flush_all = interrupt_vld
  val flush_start_ptr = redirect_rob_ptr
  val entry_flush_len =  UInt(PTR_WIDTH bits)
  val entry_flush_bits = Bits(DEPTH*2 bits)
  val entry_flush_bits_full = Bits(DEPTH*4 bits)
  val entry_flush_bits_full_end = UInt(PTR_WIDTH+1 bits)

  // when need flush, count length of flush, compute end position
  // entry_flush_len=0 means flush 1 entry
  entry_flush_len :=  (tail_ptr_sub_one >= flush_start_ptr) ? 
                      (tail_ptr_sub_one - flush_start_ptr) |
                      (U(DEPTH*2, PTR_WIDTH+1 bits) - (flush_start_ptr - tail_ptr_sub_one).resize(PTR_WIDTH+1)).resized

  entry_flush_bits_full_end := (flush_start_ptr + entry_flush_len).resized

  for(i <- 0 until DEPTH*4){
    entry_flush_bits_full(i) := (U(i, PTR_WIDTH+1 bits) > flush_start_ptr.resize(PTR_WIDTH+1)) && 
                                (U(i, PTR_WIDTH+1 bits) <= entry_flush_bits_full_end)
  }
  for(i <- 0 until DEPTH*2){
    entry_flush_bits(i) := flush && (entry_flush_bits_full(i) || entry_flush_bits_full(i+DEPTH*2))
  }

  // =============== update head pointer of ROB(oldest) ===============
  when(de_rob_a.fire && de_rob_b.fire){
    head_ptr := head_ptr_add_two
  }
  .elsewhen(de_rob_a.fire){
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
  empty_entry_cnt_next := flush_all ? U(DEPTH, PTR_WIDTH bits) |
                          (flush ? (empty_entry_cnt + entry_flush_len) |
                            (empty_entry_cnt.resized + 
                            de_rob_a.fire.asUInt.resized + 
                            de_rob_b.fire.asUInt.resized - 
                            en_rob_a.fire.asUInt.resized - 
                            en_rob_b.fire.asUInt.resized)
                          )

  // =============== update Entries of ROB ===============
  for(i <- 0 until DEPTH){

    // ============== comb logic ===============
    entry.en_rob(i) :=  (en_rob_a.fire && tail_addr===U(i)) || 
                        (en_rob_b.fire && tail_addr_add_one===U(i))
    entry.de_rob(i) :=  (de_rob_a.fire && head_addr===U(i)) || 
                        (de_rob_b.fire && head_addr_add_one===U(i))
    entry.flush(i)  := entry_flush_bits(i) || entry_flush_bits(i+DEPTH)

    // issue/exe rd equal to rob entry index?
    for(j <- 0 until IQ_NUM){
      entry.isq_rd_equal(i)(j) := isq_rob_ptr(j)(PTR_WIDTH-2 downto 0)===U(i)
      entry.exe_rd_equal(i)(j) := exe_rob_ptr(j)(PTR_WIDTH-2 downto 0)===U(i)
    }
    entry.exe_done_bits(i)  := entry.exe_rd_equal(i) & exe_executed.asBits
    entry.isq_issue_bits(i) := entry.isq_rd_equal(i)  & isq_issued.asBits
    entry.isq_issue(i)      := entry.isq_issue_bits(i).orR
    entry.exe_done(i)       := entry.exe_done_bits(i).orR
    entry.exe_rd_val(i)     := dataMux(entry.exe_done_bits(i), exe_rd_val.asBits)

    // when become oldest and no exception, commit
    entry.commit(i) :=  (entry.busy(i) && entry.exception(i)===ExceptionEnum.IDLE) &&
                          ((head_addr===U(i) && 
                            entry.state(i)===ROBStateEnum.COMPLETE) ||
                           (head_addr_add_one===U(i) && 
                            entry.state(i)===ROBStateEnum.COMMIT)
                          )
    

    // ============== busy of ROB entry ==============
    when(flush_all || entry.flush(i)){
      entry.busy(i) := False
    }
    .elsewhen(entry.en_rob(i)){
      entry.busy(i) := True
    }
    .elsewhen(entry.de_rob(i)){
      entry.busy(i) := False
    }

    // ============== state trans of ROB entry ==============
    when(flush_all || entry.flush(i)){
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
        when(entry.isq_issue(i)){
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
        .otherwise{
          entry.state_nxt(i) := ROBStateEnum.COMPLETE
        }
      }
      is(ROBStateEnum.COMMIT){
        when(entry.de_rob(i)){
          entry.state_nxt(i) := ROBStateEnum.IDLE
        }
        .otherwise{
          entry.state_nxt(i) := ROBStateEnum.COMMIT
        }
      }
    }

    // ============== pc/u_op/rd_addr/exception of ROB entry==============
    when(en_rob_a.fire && tail_addr===U(i)){
      entry.pc(i)         := en_rob_a.pc
      entry.micro_op(i)   := en_rob_a.micro_op
      entry.rd_addr(i)    := en_rob_a.rd_addr
      entry.exception(i)  := en_rob_a.exception
    }
    .elsewhen(en_rob_b.fire && tail_addr_add_one===U(i)){
      entry.pc(i)         := en_rob_b.pc
      entry.micro_op(i)   := en_rob_b.micro_op
      entry.rd_addr(i)    := en_rob_b.rd_addr
      entry.exception(i)  := en_rob_b.exception
    }

    // ============== rd value of ROB entry==============
    when(en_rob_a.fire && tail_addr===U(i)){
      entry.rd_val(i) := en_rob_a.rd_val
    }
    .elsewhen(en_rob_b.fire && tail_addr_add_one===U(i)){
      entry.rd_val(i) := en_rob_b.rd_val
    }
    .elsewhen(entry.exe_done(i)){
      entry.rd_val(i) := entry.exe_rd_val(i)
    }

  }

  // ============== output ==============
  en_rob_a.ready    := !rob_full
  en_rob_b.ready    := (empty_entry_cnt >= U(2))

  de_rob_a.valid    := (entry.state(head_addr) === ROBStateEnum.COMMIT)
  de_rob_a.rd_addr  := entry.rd_addr(head_addr)
  de_rob_a.rd_val   := entry.rd_val(head_addr)

  de_rob_b.valid    := (entry.state(head_addr_add_one) === ROBStateEnum.COMMIT)
  de_rob_b.rd_addr  := entry.rd_addr(head_addr_add_one)
  de_rob_b.rd_val   := entry.rd_val(head_addr_add_one)
  
}

object GenROB extends App {
  val ROBConfig = ReorderBufferConfig(DEPTH=8)
  GenConfig.spinal.generateVerilog(ReorderBuffer(ROBConfig))
}