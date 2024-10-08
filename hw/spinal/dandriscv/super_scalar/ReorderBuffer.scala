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
  // to issue queue
  val en_queue_0 = master(Stream(EnQueue(ROB_PTR_W, "BJU")))
  val en_queue_1 = master(Stream(EnQueue(ROB_PTR_W, "ALU")))
  val en_queue_2 = master(Stream(EnQueue(ROB_PTR_W, "ALU")))
  val en_queue_3 = master(Stream(EnQueue(ROB_PTR_W, "LSU")))
  // for instruction wake up
  val exe_rob_ptr = in Vec(UInt(PTR_WIDTH bits), IQ_NUM)
  val exe_rd_val  = in Vec(Bits(64 bits), IQ_NUM)
  val exe_executed= in Vec(Bool(), IQ_NUM)
  // for state trans
  val isq_rob_ptr = in Vec(UInt(PTR_WIDTH bits), IQ_NUM)
  val isq_issued = in Vec(Bool(), IQ_NUM)
  // interrupt flush all
  val interrupt_vld = in Bool()
  // // redirect, flush newest instruction which is newer than redirect_rob_ptr
  // val redirect_vld = in Bool()
  // val redirect_rob_ptr = in UInt(PTR_WIDTH bits)
  // 2024 08 31: redirect flush all
  val redirect_vld = in Bool()

  // ==================== inst =============================
  val arf = new ARF()
  val rat = new RAT(p)

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
    // val flush = Vec(Bool(), DEPTH)
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
  val de_rob_a = Stream(DeROB())
  val de_rob_b = Stream(DeROB())

  // =============== flush logic ===============
  // val flush_new = redirect_vld
  // val flush_all = interrupt_vld
  // val flush_start_ptr = redirect_rob_ptr
  // val entry_flush_len =  UInt(PTR_WIDTH bits)
  // val entry_flush_bits = Bits(DEPTH*2 bits)
  // val entry_flush_bits_full = Bits(DEPTH*4 bits)
  // val entry_flush_bits_full_end = UInt(PTR_WIDTH+1 bits)
  // // when need flush, count length of flush, compute end position. entry_flush_len=0 means flush 1 entry
  // entry_flush_len :=  (tail_ptr_sub_one >= flush_start_ptr) ? 
  //                     (tail_ptr_sub_one - flush_start_ptr) |
  //                     (U(DEPTH*2, PTR_WIDTH+1 bits) - (flush_start_ptr - tail_ptr_sub_one).resize(PTR_WIDTH+1)).resized

  // entry_flush_bits_full_end := (flush_start_ptr + entry_flush_len).resized

  // for(i <- 0 until DEPTH*4){
  //   entry_flush_bits_full(i) := (U(i, PTR_WIDTH+1 bits) > flush_start_ptr.resize(PTR_WIDTH+1)) && 
  //                               (U(i, PTR_WIDTH+1 bits) <= entry_flush_bits_full_end)
  // }
  // for(i <- 0 until DEPTH*2){
  //   entry_flush_bits(i) := flush_new && (entry_flush_bits_full(i) || entry_flush_bits_full(i+DEPTH*2))
  // }
  // 2024 08 31: redirect flush all
  val flush_all = redirect_vld || interrupt_vld

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
  // .elsewhen(flush_new){
  //   tail_ptr := redirect_rob_ptr + 1
  // }
  .elsewhen(en_rob_a.fire && en_rob_b.fire){
    tail_ptr := tail_ptr_add_two
  }
  .elsewhen((en_rob_a.fire && !en_rob_b.fire) || 
            (!en_rob_a.fire && en_rob_b.fire)){
    tail_ptr := tail_ptr_add_one
  }

  // =============== count of empty entry ===============
  // empty_entry_cnt_next := flush_all ? U(DEPTH, PTR_WIDTH bits) |
  //                         (flush_new ? (empty_entry_cnt + entry_flush_len) |
  //                           (empty_entry_cnt.resized + 
  //                           de_rob_a.fire.asUInt.resized + 
  //                           de_rob_b.fire.asUInt.resized - 
  //                           en_rob_a.fire.asUInt.resized - 
  //                           en_rob_b.fire.asUInt.resized)
  //                         )

  empty_entry_cnt_next := flush_all ? U(DEPTH, PTR_WIDTH bits) |
                                      (empty_entry_cnt.resized + 
                                      de_rob_a.fire.asUInt.resized + 
                                      de_rob_b.fire.asUInt.resized - 
                                      en_rob_a.fire.asUInt.resized - 
                                      en_rob_b.fire.asUInt.resized)


  // =============== update Entries of ROB ===============
  for(i <- 0 until DEPTH){

    // ============== comb logic ===============
    entry.en_rob(i) :=  (en_rob_a.fire && tail_addr===U(i)) || 
                        (en_rob_b.fire && tail_addr_add_one===U(i))
    entry.de_rob(i) :=  (de_rob_a.fire && head_addr===U(i)) || 
                        (de_rob_b.fire && head_addr_add_one===U(i))
    // entry.flush(i)  := entry_flush_bits(i) || entry_flush_bits(i+DEPTH)

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
    when(flush_all){
      entry.busy(i) := False
    }
    .elsewhen(entry.en_rob(i)){
      entry.busy(i) := True
    }
    .elsewhen(entry.de_rob(i)){
      entry.busy(i) := False
    }

    // ============== state trans of ROB entry ==============
    when(flush_all){
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
    // when(en_rob_a.fire && tail_addr===U(i)){
    //   entry.rd_val(i) := en_rob_a.rd_val
    // }
    // .elsewhen(en_rob_b.fire && tail_addr_add_one===U(i)){
    //   entry.rd_val(i) := en_rob_b.rd_val
    // }
    // .elsewhen(entry.exe_done(i)){
    //   entry.rd_val(i) := entry.exe_rd_val(i)
    // }
    // rd not from EnROB
    when(entry.exe_done(i)){
      entry.rd_val(i) := entry.exe_rd_val(i)
    }

  }

  // ==================== connect =============================
  arf.read_ports_a.rs1_req := en_rob_a.rs1_rd_en
  arf.read_ports_a.rs2_req := en_rob_a.rs2_rd_en
  arf.read_ports_a.rs1_addr := en_rob_a.rs1_addr
  arf.read_ports_a.rs2_addr := en_rob_a.rs2_addr
  arf.write_ports_a.rd_wen := de_rob_a.fire
  arf.write_ports_a.rd_addr := de_rob_a.rd_addr
  arf.write_ports_a.rd_value := de_rob_a.rd_val

  arf.read_ports_b.rs1_req := en_rob_b.rs1_rd_en
  arf.read_ports_b.rs2_req := en_rob_b.rs2_rd_en
  arf.read_ports_b.rs1_addr := en_rob_b.rs1_addr
  arf.read_ports_b.rs2_addr := en_rob_b.rs2_addr
  arf.write_ports_b.rd_wen := de_rob_b.valid
  arf.write_ports_b.rd_addr := de_rob_b.rd_addr
  arf.write_ports_b.rd_value := de_rob_b.rd_val

  rat.en_rob_vld_a := en_rob_a.fire
  rat.en_rob_rd_addr_a := en_rob_a.rd_addr
  rat.en_rob_ptr_a := tail_ptr
  rat.de_rob_vld_a := de_rob_a.fire
  rat.de_rob_rd_addr_a := de_rob_a.rd_addr
  rat.en_rob_vld_b := en_rob_b.fire
  rat.en_rob_rd_addr_b := en_rob_b.rd_addr
  rat.en_rob_ptr_b := tail_ptr_add_one
  rat.de_rob_vld_b := de_rob_b.fire
  rat.de_rob_rd_addr_b := de_rob_b.rd_addr
  rat.rs1_addr_inst0 := en_rob_a.rs1_addr
  rat.rs2_addr_inst0 := en_rob_a.rs2_addr
  rat.rs1_addr_inst1 := en_rob_b.rs1_addr
  rat.rs2_addr_inst1 := en_rob_b.rs2_addr


  // ============== output ==============
  en_rob_a.ready    := !rob_full
  en_rob_b.ready    := (empty_entry_cnt >= U(2))

  de_rob_a.valid    := (entry.state(head_addr) === ROBStateEnum.COMMIT)
  de_rob_a.rd_addr  := entry.rd_addr(head_addr)
  de_rob_a.rd_val   := entry.rd_val(head_addr)
  de_rob_a.ready := True

  de_rob_b.valid    := (entry.state(head_addr_add_one) === ROBStateEnum.COMMIT)
  de_rob_b.rd_addr  := entry.rd_addr(head_addr_add_one)
  de_rob_b.rd_val   := entry.rd_val(head_addr_add_one)
  de_rob_b.ready := True

  // ============== to issue queue ==============
  val iq_stream_0 = Stream(EnQueue(ROB_PTR_W, "BJU"))
  val iq_stream_1 = Stream(EnQueue(ROB_PTR_W, "ALU"))
  val iq_stream_2 = Stream(EnQueue(ROB_PTR_W, "ALU"))
  val iq_stream_3 = Stream(EnQueue(ROB_PTR_W, "LSU"))

  val en_rob_a_is_bju = (en_rob_a.micro_op===RobMicroOp.BJU)
  val en_rob_a_is_alu = (en_rob_a.micro_op===RobMicroOp.ALU)
  val en_rob_a_is_lsu = (en_rob_a.micro_op===RobMicroOp.LSU)
  val en_rob_b_is_bju = (en_rob_a.micro_op===RobMicroOp.BJU)
  val en_rob_b_is_alu = (en_rob_a.micro_op===RobMicroOp.ALU)
  val en_rob_b_is_lsu = (en_rob_a.micro_op===RobMicroOp.LSU)

  val iq_sel_bits_a = Bits(4 bits)
  val iq_sel_bits_b = Bits(4 bits)
  val alu_sel_a = RegInit(False) // False sel ALU iq 1, True sel ALU iq 2
  val alu_sel_b = RegInit(False) // False sel ALU iq 1, True sel ALU iq 2

  when(en_rob_a.fire && en_rob_a_is_alu){
    alu_sel_a := !alu_sel_a
  }

  when(en_rob_b.fire && en_rob_b_is_alu){
    alu_sel_b := !alu_sel_b
  }

  iq_sel_bits_a(0) := en_rob_a_is_bju
  iq_sel_bits_a(1) := en_rob_a_is_alu && (alu_sel_a===False)
  iq_sel_bits_a(2) := en_rob_a_is_alu && (alu_sel_a===True)
  iq_sel_bits_a(3) := en_rob_a_is_lsu

  iq_sel_bits_b(0) := en_rob_b_is_bju
  iq_sel_bits_b(1) := en_rob_b_is_alu && (alu_sel_b===False)
  iq_sel_bits_b(2) := en_rob_b_is_alu && (alu_sel_b===True)
  iq_sel_bits_b(3) := en_rob_b_is_lsu

  iq_stream_0.valid := (en_rob_a.valid && iq_sel_bits_a(0)) || (en_rob_b.valid && iq_sel_bits_b(0))
  iq_stream_0.rd_rob_ptr := iq_sel_bits_a(0) ? tail_ptr | tail_ptr_add_one
  iq_stream_0.src1_rob_ptr := iq_sel_bits_a(0) ? rat.rs1_ptr_inst0 | rat.rs1_ptr_inst1
  iq_stream_0.src2_rob_ptr := iq_sel_bits_a(0) ? rat.rs2_ptr_inst0 | rat.rs2_ptr_inst1
  iq_stream_0.micro_op := iq_sel_bits_a(0) ? en_rob_a.bju_micro_op | en_rob_b.bju_micro_op
  iq_stream_0.src1_vld := iq_sel_bits_a(0) ? !rat.rs1_busy_inst0 | !rat.rs1_busy_inst1
  iq_stream_0.src1_val := iq_sel_bits_a(0) ? arf.read_ports_a.rs1_value | arf.read_ports_b.rs1_value
  iq_stream_0.src2_vld := iq_sel_bits_a(0) ? !rat.rs2_busy_inst0 | !rat.rs2_busy_inst1
  iq_stream_0.src2_val := iq_sel_bits_a(0) ? arf.read_ports_a.rs2_value | arf.read_ports_b.rs2_value
  iq_stream_0.imm_val := iq_sel_bits_a(0) ? en_rob_a.imm_val | en_rob_b.imm_val
  iq_stream_0.pc := iq_sel_bits_a(0) ? en_rob_a.pc | en_rob_b.pc

  iq_stream_1.valid := (en_rob_a.valid && iq_sel_bits_a(1)) || (en_rob_b.valid && iq_sel_bits_b(1))
  iq_stream_1.rd_rob_ptr := iq_sel_bits_a(1) ? tail_ptr | tail_ptr_add_one
  iq_stream_1.src1_rob_ptr := iq_sel_bits_a(1) ? rat.rs1_ptr_inst0 | rat.rs1_ptr_inst1
  iq_stream_1.src2_rob_ptr := iq_sel_bits_a(1) ? rat.rs2_ptr_inst0 | rat.rs2_ptr_inst1
  iq_stream_1.micro_op := iq_sel_bits_a(1) ? en_rob_a.alu_micro_op | en_rob_b.alu_micro_op
  iq_stream_1.src1_vld := iq_sel_bits_a(1) ? !rat.rs1_busy_inst0 | !rat.rs1_busy_inst1
  iq_stream_1.src1_val := iq_sel_bits_a(1) ? arf.read_ports_a.rs1_value | arf.read_ports_b.rs1_value
  iq_stream_1.src2_vld := iq_sel_bits_a(1) ? !rat.rs2_busy_inst0 | !rat.rs2_busy_inst1
  iq_stream_1.src2_val := iq_sel_bits_a(1) ? arf.read_ports_a.rs2_value | arf.read_ports_b.rs2_value
  iq_stream_1.imm_val := iq_sel_bits_a(1) ? en_rob_a.imm_val | en_rob_b.imm_val

  iq_stream_2.valid := (en_rob_a.valid && iq_sel_bits_a(2)) || (en_rob_b.valid && iq_sel_bits_b(2))
  iq_stream_2.rd_rob_ptr := iq_sel_bits_a(2) ? tail_ptr | tail_ptr_add_one
  iq_stream_2.src1_rob_ptr := iq_sel_bits_a(2) ? rat.rs1_ptr_inst0 | rat.rs1_ptr_inst1
  iq_stream_2.src2_rob_ptr := iq_sel_bits_a(2) ? rat.rs2_ptr_inst0 | rat.rs2_ptr_inst1
  iq_stream_2.micro_op := iq_sel_bits_a(2) ? en_rob_a.alu_micro_op | en_rob_b.alu_micro_op
  iq_stream_2.src1_vld := iq_sel_bits_a(2) ? !rat.rs1_busy_inst0 | !rat.rs1_busy_inst1
  iq_stream_2.src1_val := iq_sel_bits_a(2) ? arf.read_ports_a.rs1_value | arf.read_ports_b.rs1_value
  iq_stream_2.src2_vld := iq_sel_bits_a(2) ? !rat.rs2_busy_inst0 | !rat.rs2_busy_inst1
  iq_stream_2.src2_val := iq_sel_bits_a(2) ? arf.read_ports_a.rs2_value | arf.read_ports_b.rs2_value
  iq_stream_2.imm_val := iq_sel_bits_a(2) ? en_rob_a.imm_val | en_rob_b.imm_val

  iq_stream_3.valid := (en_rob_a.valid && iq_sel_bits_a(3)) || (en_rob_b.valid && iq_sel_bits_b(3))
  iq_stream_3.rd_rob_ptr := iq_sel_bits_a(3) ? tail_ptr | tail_ptr_add_one
  iq_stream_3.src1_rob_ptr := iq_sel_bits_a(3) ? rat.rs1_ptr_inst0 | rat.rs1_ptr_inst1
  iq_stream_3.src2_rob_ptr := iq_sel_bits_a(3) ? rat.rs2_ptr_inst0 | rat.rs2_ptr_inst1
  iq_stream_3.micro_op := iq_sel_bits_a(3) ? en_rob_a.lsu_micro_op | en_rob_b.lsu_micro_op
  iq_stream_3.src1_vld := iq_sel_bits_a(3) ? !rat.rs1_busy_inst0 | !rat.rs1_busy_inst1
  iq_stream_3.src1_val := iq_sel_bits_a(3) ? arf.read_ports_a.rs1_value | arf.read_ports_b.rs1_value
  iq_stream_3.src2_vld := iq_sel_bits_a(3) ? !rat.rs2_busy_inst0 | !rat.rs2_busy_inst1
  iq_stream_3.src2_val := iq_sel_bits_a(3) ? arf.read_ports_a.rs2_value | arf.read_ports_b.rs2_value
  iq_stream_3.imm_val := iq_sel_bits_a(3) ? en_rob_a.imm_val | en_rob_b.imm_val

  iq_stream_0 >-> en_queue_0
  iq_stream_1 >-> en_queue_1
  iq_stream_2 >-> en_queue_2
  iq_stream_3 >-> en_queue_3

  
}

object GenROB extends App {
  val ROBConfig = ReorderBufferConfig(DEPTH=8)
  GenConfig.spinal.generateVerilog(ReorderBuffer(ROBConfig))
}