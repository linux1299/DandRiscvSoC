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
  val en_queue_0 = master(Stream(EnQueue("BJU")))
  val en_queue_1 = master(Stream(EnQueue("ALU")))
  val en_queue_2 = master(Stream(EnQueue("ALU")))
  val en_queue_3 = master(Stream(EnQueue("LSU")))
  // for instruction wake up
  val exe_dst_ports = Vec(slave(Stream(ExeDst())), IQ_NUM)
  // for state trans
  val isq_rob_ptr = in Vec(UInt(PTR_WIDTH bits), IQ_NUM)
  val isq_issued = in Vec(Bool(), IQ_NUM)
  // for wake up
  val isq_wakeup = Vec(master(Flow(Wakeup())), IQ_NUM)
  // for LSU wake up
  val rob_head_ptr = out UInt(PTR_WIDTH bits)
  // when redirect or interrupt, drain out old, then flush all
  val interrupt_vld = in Bool()
  val redirect_vld = in Bool()
  val bju_rob_ptr = in UInt(PTR_WIDTH bits)
  // when drain out end, flush all
  val rob_flush = out Bool()
  val rob_stall = out Bool()
  // add for difftest
  val de_rob_a_ready = ifGen(DIFFTEST){in Bool()}
  val de_rob_b_ready = ifGen(DIFFTEST){in Bool()}

  // ==================== inst =============================
  val arf = new ARF()
  val rat = new RAT(p)
  val exe_rob_ptr = Vec(UInt(PTR_WIDTH bits), IQ_NUM)
  val exe_rd_data  = Vec(Bits(64 bits), IQ_NUM)
  val exe_executed= Vec(Bool(), IQ_NUM)

  for(i <- 0 until IQ_NUM){
    exe_rob_ptr(i)  := exe_dst_ports(i).rd_rob_ptr
    exe_rd_data(i)  := exe_dst_ports(i).result
    exe_executed(i) := exe_dst_ports(i).fire
    exe_dst_ports(i).ready := True //TODO:
  }

  // =============== Entries of ROB =================
  val entry = new Area{
    val busy = Vec(RegInit(False), DEPTH)
    val state = Vec(Reg(ROBStateEnum()) init(ROBStateEnum.IDLE), DEPTH)
    val pc = Vec(Reg(UInt(PC_WIDTH bits)) init(0), DEPTH)
    val micro_op = Vec(Reg(RobMicroOp()) init(RobMicroOp.IDLE), DEPTH)
    val rd_addr = Vec(Reg(UInt(5 bits)) init(0), DEPTH)
    val rd_data = Vec(Reg(Bits(64 bits)) init(0), DEPTH)
    val rd_wen = Vec(Reg(Bool()) init(false), DEPTH)
    val rd_valid = Vec(Reg(Bool()) init(false), DEPTH)
    val exception = Vec(Reg(ExceptionEnum()) init(ExceptionEnum.IDLE), DEPTH)
    val instruction = ifGen(DIFFTEST){Vec(Reg(Bits(32 bits)) init(0), DEPTH)}
    // comb logic
    val state_nxt = Vec(ROBStateEnum(), DEPTH)
    val en_rob = Vec(Bool(), DEPTH)
    val de_rob = Vec(Bool(), DEPTH)
    val isq_rd_equal = Vec(Bits(IQ_NUM bits), DEPTH)
    val isq_issue_bits = Vec(Bits(IQ_NUM bits), DEPTH)
    val isq_issued = Vec(Bool(), DEPTH)
    val exe_rd_equal = Vec(Bits(IQ_NUM bits), DEPTH)
    val exe_done_bits = Vec(Bits(IQ_NUM bits), DEPTH)
    val exe_rd_data = Vec(Bits(64 bits), DEPTH)
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
  val empty_entry_cnt_next = UInt(PTR_WIDTH bits)
  val empty_entry_cnt = RegNext(empty_entry_cnt_next) init(DEPTH)
  // val busy_entry_cnt = U(DEPTH, PTR_WIDTH bits) - empty_entry_cnt
  // val busy_entry_cnt_next = U(DEPTH, PTR_WIDTH bits) - empty_entry_cnt_next
  val de_rob_a = Stream(DeROB())
  val de_rob_b = Stream(DeROB())

  // =============== sel issue queue ===============
  val isq_stream_0 = Stream(EnQueue("BJU"))
  val isq_stream_1 = Stream(EnQueue("ALU"))
  val isq_stream_2 = Stream(EnQueue("ALU"))
  val isq_stream_3 = Stream(EnQueue("LSU"))

  val en_rob_a_is_bju = (en_rob_a.micro_op===RobMicroOp.BJU)
  val en_rob_a_is_alu = (en_rob_a.micro_op===RobMicroOp.ALU)
  val en_rob_a_is_lsu = (en_rob_a.micro_op===RobMicroOp.LSU)
  val en_rob_b_is_bju = (en_rob_b.micro_op===RobMicroOp.BJU)
  val en_rob_b_is_alu = (en_rob_b.micro_op===RobMicroOp.ALU)
  val en_rob_b_is_lsu = (en_rob_b.micro_op===RobMicroOp.LSU)

  val a_to_isq_onehot = Bits(4 bits)
  val b_to_isq_onehot = Bits(4 bits)
  val alu_sel_a = RegInit(False) // False sel ALU iq 1, True sel ALU iq 2
  val alu_sel_b = RegInit(False) // False sel ALU iq 1, True sel ALU iq 2

  // =============== update head pointer of ROB(oldest) ===============
  when(rob_flush){
    head_ptr := 0
  }
  .elsewhen(de_rob_a.fire && de_rob_b.fire){
    head_ptr := head_ptr_add_two
  }
  .elsewhen(de_rob_a.fire){
    head_ptr := head_ptr_add_one
  }

  // =============== update tail pointer of ROB(next newest index) ===============
  when(rob_flush){
    tail_ptr := 0
  }
  .elsewhen(en_rob_a.fire && en_rob_b.fire){
    tail_ptr := tail_ptr_add_two
  }
  .elsewhen((en_rob_a.fire && !en_rob_b.fire) || 
            (!en_rob_a.fire && en_rob_b.fire)){
    tail_ptr := tail_ptr_add_one
  }

  // =============== count of empty entry ===============
  empty_entry_cnt_next := rob_flush ? U(DEPTH, PTR_WIDTH bits) |
                                      (empty_entry_cnt.resized + 
                                      de_rob_a.fire.asUInt.resized + 
                                      de_rob_b.fire.asUInt.resized - 
                                      en_rob_a.fire.asUInt.resized - 
                                      en_rob_b.fire.asUInt.resized)


  // =============== update Entries of ROB ===============
  for(i <- 0 until DEPTH){

    // ============== comb logic ===============
    // entry.en_rob(i) :=  (en_rob_a.fire && tail_addr===U(i)) || 
    //                     (en_rob_b.fire && tail_addr_add_one===U(i))
    entry.de_rob(i) :=  (de_rob_a.fire && head_addr===U(i)) || 
                        (de_rob_b.fire && head_addr_add_one===U(i))

    entry.en_rob(i) :=  (en_rob_a.fire && en_rob_b.fire && (tail_addr===U(i) || tail_addr_add_one===U(i))) ||
                        ((en_rob_a.fire ^  en_rob_b.fire) && tail_addr===U(i))
    // entry.de_rob(i) :=  (de_rob_a.fire && de_rob_b.fire && (head_addr===U(i) || head_addr_add_one===U(i))) ||
    //                     (de_rob_a.fire ^  de_rob_b.fire &&  head_addr===U(i))
    // issue/exe rd equal to rob entry index?
    for(j <- 0 until IQ_NUM){
      entry.isq_rd_equal(i)(j) := isq_rob_ptr(j)(PTR_WIDTH-2 downto 0)===U(i)
      entry.exe_rd_equal(i)(j) := exe_rob_ptr(j)(PTR_WIDTH-2 downto 0)===U(i)
    }
    entry.exe_done_bits(i)  := entry.exe_rd_equal(i) & exe_executed.asBits
    entry.isq_issue_bits(i) := entry.isq_rd_equal(i) & isq_issued.asBits
    entry.isq_issued(i)     := entry.isq_issue_bits(i).orR
    entry.exe_done(i)       := entry.exe_done_bits(i).orR
    entry.exe_rd_data(i)    := dataMux(entry.exe_done_bits(i), exe_rd_data.asBits)

    // when become oldest and no exception, commit
    entry.commit(i) :=  (entry.busy(i) && entry.exception(i)===ExceptionEnum.IDLE) &&
                          ((head_addr===U(i)         && entry.state(i)===ROBStateEnum.COMPLETE) ||
                           (head_addr_add_one===U(i) && entry.state(i)===ROBStateEnum.COMPLETE)
                          )
    

    // ============== busy of ROB entry ==============
    when(rob_flush){
      entry.busy(i) := False
    }
    .elsewhen(entry.en_rob(i)){
      entry.busy(i) := True
    }
    .elsewhen(entry.de_rob(i)){
      entry.busy(i) := False
    }

    // ============== state trans of ROB entry ==============
    when(rob_flush){
      entry.state(i) := ROBStateEnum.IDLE
    }
    .otherwise{
      entry.state(i) := entry.state_nxt(i)
    }
    
    switch(entry.state(i)){
      is(ROBStateEnum.IDLE){
        when(entry.en_rob(i)){
          entry.state_nxt(i) := ROBStateEnum.ENQUEUE
        }
        .otherwise{
          entry.state_nxt(i) := ROBStateEnum.IDLE
        }
      }
      is(ROBStateEnum.ENQUEUE){
        when(entry.isq_issued(i)){
          entry.state_nxt(i) := ROBStateEnum.EXECUTING
        }
        .otherwise{
          entry.state_nxt(i) := ROBStateEnum.ENQUEUE
        }
      }
      is(ROBStateEnum.EXECUTING){
        when(entry.exe_done(i)){
          entry.state_nxt(i) := ROBStateEnum.COMPLETE
        }
        .otherwise{
          entry.state_nxt(i) := ROBStateEnum.EXECUTING
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
    when(en_rob_a.fire && en_rob_b.fire){
      when(tail_addr===U(i)){
        entry.pc(i)         := en_rob_a.pc
        entry.micro_op(i)   := en_rob_a.micro_op
        entry.rd_addr(i)    := en_rob_a.rd_addr
        entry.rd_wen(i)     := en_rob_a.bju_micro_op.rd_wen
        entry.exception(i)  := en_rob_a.exception
        if(DIFFTEST){
          entry.instruction(i)  := en_rob_a.instruction
        }
      }
      .elsewhen(tail_addr_add_one===U(i)){
        entry.pc(i)         := en_rob_b.pc
        entry.micro_op(i)   := en_rob_b.micro_op
        entry.rd_addr(i)    := en_rob_b.rd_addr
        entry.rd_wen(i)     := en_rob_b.bju_micro_op.rd_wen
        entry.exception(i)  := en_rob_b.exception
        if(DIFFTEST){
          entry.instruction(i)  := en_rob_b.instruction
        }
      }
    }
    .elsewhen(en_rob_a.fire ^ en_rob_b.fire){
      when(en_rob_a.fire && tail_addr===U(i)){
        entry.pc(i)         := en_rob_a.pc
        entry.micro_op(i)   := en_rob_a.micro_op
        entry.rd_addr(i)    := en_rob_a.rd_addr
        entry.rd_wen(i)     := en_rob_a.bju_micro_op.rd_wen
        entry.exception(i)  := en_rob_a.exception
        if(DIFFTEST){
          entry.instruction(i)  := en_rob_a.instruction
        }
      }
      .elsewhen(en_rob_b.fire && tail_addr===U(i)){
        entry.pc(i)         := en_rob_b.pc
        entry.micro_op(i)   := en_rob_b.micro_op
        entry.rd_addr(i)    := en_rob_b.rd_addr
        entry.rd_wen(i)     := en_rob_b.bju_micro_op.rd_wen
        entry.exception(i)  := en_rob_b.exception
        if(DIFFTEST){
          entry.instruction(i)  := en_rob_b.instruction
        }
      }
    }

    // ============== rd value of ROB entry==============
    // rd data from Exe
    when(entry.exe_done(i)){
      entry.rd_data(i) := entry.exe_rd_data(i)
    }
    // rd valid
    when(entry.de_rob(i)){
      entry.rd_valid(i) := False
    }
    .elsewhen(entry.exe_done(i)){
      entry.rd_valid(i) := True
    }

  }

  // ==================== connect =============================
  arf.read_ports_a.rs1_req  := en_rob_a.rs1_ren
  arf.read_ports_a.rs2_req  := en_rob_a.rs2_ren
  arf.read_ports_a.rs1_addr := en_rob_a.rs1_addr
  arf.read_ports_a.rs2_addr := en_rob_a.rs2_addr
  arf.write_ports_a.rd_wen  := de_rob_a.fire && de_rob_a.rd_wen
  arf.write_ports_a.rd_addr := de_rob_a.rd_addr
  arf.write_ports_a.rd_data := de_rob_a.rd_data

  arf.read_ports_b.rs1_req  := en_rob_b.rs1_ren
  arf.read_ports_b.rs2_req  := en_rob_b.rs2_ren
  arf.read_ports_b.rs1_addr := en_rob_b.rs1_addr
  arf.read_ports_b.rs2_addr := en_rob_b.rs2_addr
  arf.write_ports_b.rd_wen  := de_rob_b.fire && de_rob_b.rd_wen
  arf.write_ports_b.rd_addr := de_rob_b.rd_addr
  arf.write_ports_b.rd_data := de_rob_b.rd_data

  rat.flush            := rob_flush
  rat.en_rob_vld_a     := en_rob_a.fire
  rat.en_rob_rd_addr_a := en_rob_a.rd_addr
  rat.en_rob_ptr_a     := tail_ptr
  rat.de_rob_vld_a     := de_rob_a.fire
  rat.de_rob_rd_addr_a := de_rob_a.rd_addr
  rat.de_rob_ptr_a     := de_rob_a.rob_ptr
  rat.en_rob_vld_b     := en_rob_b.fire
  rat.en_rob_rd_addr_b := en_rob_b.rd_addr
  rat.en_rob_ptr_b     := tail_ptr_add_one
  rat.de_rob_vld_b     := de_rob_b.fire
  rat.de_rob_rd_addr_b := de_rob_b.rd_addr
  rat.de_rob_ptr_b     := de_rob_b.rob_ptr
  rat.rs1_addr_inst0   := en_rob_a.rs1_addr
  rat.rs2_addr_inst0   := en_rob_a.rs2_addr
  rat.rs1_addr_inst1   := en_rob_b.rs1_addr
  rat.rs2_addr_inst1   := en_rob_b.rs2_addr

  // ============== flow control ==============
  // when int or redirect, stall the newest instruction, continue exe until commit
  val rob_stall_reg = RegInit(False)
  val bju_rob_ptr_reg = Reg(UInt(ROB_PTR_W bits)) init(0)
  val change_flow = interrupt_vld || redirect_vld
  rob_stall := rob_stall_reg

  when(change_flow){
    bju_rob_ptr_reg := bju_rob_ptr
  }

  rob_flush := rob_stall_reg &&
                ((de_rob_a.fire && (bju_rob_ptr_reg===de_rob_a.rob_ptr))|| 
                 (de_rob_b.fire && (bju_rob_ptr_reg===de_rob_b.rob_ptr))  )

  when(change_flow){
    rob_stall_reg := True
  }
  .elsewhen(rob_flush){
    rob_stall_reg := False
  }

  // =========================== to issue queue ===========================
  val isq_ready_bits = Bits(4 bits)
  val isq_fire_bits  = Bits(4 bits)
  val isq_to_a_ready = Bool()
  val isq_to_b_ready = Bool()
  val rob_space_nlt_1 = Bool() // not less than 1
  val rob_space_nlt_2 = Bool() // not less than 2
  val en_rob_a_to_isq = Vec(Bool(), 4)
  val en_rob_b_to_isq = Vec(Bool(), 4)
  val en_rob_a_to_isq_fire = Vec(Bool(), 4)
  val en_rob_b_to_isq_fire = Vec(Bool(), 4)
  val en_rob_b_to_isq_halt = Vec(RegInit(False), 4)
  val en_rob_b_to_isq_is_halt = en_rob_b_to_isq_halt.asBits.orR
  // val en_rob_b_is_older = RegInit(False)

  // when(rob_flush){
  //   en_rob_b_is_older := False
  // }
  // .elsewhen((en_rob_b_is_older===False) && ()){

  // }

  isq_ready_bits     := isq_stream_3.ready ## isq_stream_2.ready ## isq_stream_1.ready ## isq_stream_0.ready
  isq_fire_bits      := isq_stream_3.fire ## isq_stream_2.fire ## isq_stream_1.fire ## isq_stream_0.fire
  isq_to_a_ready     := dataMux(a_to_isq_onehot, isq_ready_bits).asBool
  isq_to_b_ready     := dataMux(b_to_isq_onehot, isq_ready_bits).asBool
  rob_space_nlt_1  := (!rob_full) && (!rob_stall)
  rob_space_nlt_2  := (empty_entry_cnt >= U(2)) && (!rob_stall)

  en_rob_a.ready    :=  !en_rob_b_to_isq_is_halt && rob_space_nlt_1 && isq_to_a_ready 
  en_rob_b.ready    :=  isq_to_b_ready &&
                        ((en_rob_b_to_isq_is_halt && rob_space_nlt_1) ||
                        (!en_rob_b_to_isq_is_halt && rob_space_nlt_2 && en_rob_a.ready && (en_rob_a_to_isq.asBits=/=en_rob_b_to_isq.asBits)))

  when(en_rob_a.fire && en_rob_a_is_alu){
    alu_sel_a := !alu_sel_a
  }

  when(en_rob_b.fire && en_rob_b_is_alu){
    alu_sel_b := !alu_sel_b
  }

  a_to_isq_onehot(0) := en_rob_a_is_bju
  a_to_isq_onehot(1) := en_rob_a_is_alu && (alu_sel_a===False)
  a_to_isq_onehot(2) := en_rob_a_is_alu && (alu_sel_a===True)
  a_to_isq_onehot(3) := en_rob_a_is_lsu

  b_to_isq_onehot(0) := en_rob_b_is_bju
  b_to_isq_onehot(1) := en_rob_b_is_alu && (alu_sel_b===False)
  b_to_isq_onehot(2) := en_rob_b_is_alu && (alu_sel_b===True)
  b_to_isq_onehot(3) := en_rob_b_is_lsu

  for(i <- 0 until IQ_NUM){
    en_rob_a_to_isq(i):= en_rob_a.valid && a_to_isq_onehot(i)
    en_rob_b_to_isq(i):= en_rob_b.valid && b_to_isq_onehot(i)
    en_rob_a_to_isq_fire(i):= en_rob_a_to_isq(i) && en_rob_a.ready
    en_rob_b_to_isq_fire(i):= en_rob_b_to_isq(i) && en_rob_b.ready

    when(rob_flush){
      en_rob_b_to_isq_halt(i) := False
    }
    // en_rob_b is to isq(i), but en_rob_a wins
    .elsewhen(isq_fire_bits(i) && en_rob_b_to_isq(i) && !en_rob_b.ready){
      en_rob_b_to_isq_halt(i) := True
    }
    .elsewhen(en_rob_b_to_isq_halt(i) && en_rob_b.fire){
      en_rob_b_to_isq_halt(i) := False
    }
  }

  val isq_0_src1_rob_addr = isq_stream_0.src1_rob_ptr(ROB_PTR_W-2 downto 0)
  val isq_1_src1_rob_addr = isq_stream_1.src1_rob_ptr(ROB_PTR_W-2 downto 0)
  val isq_2_src1_rob_addr = isq_stream_2.src1_rob_ptr(ROB_PTR_W-2 downto 0)
  val isq_3_src1_rob_addr = isq_stream_3.src1_rob_ptr(ROB_PTR_W-2 downto 0)
  val isq_0_src2_rob_addr = isq_stream_0.src2_rob_ptr(ROB_PTR_W-2 downto 0)
  val isq_1_src2_rob_addr = isq_stream_1.src2_rob_ptr(ROB_PTR_W-2 downto 0)
  val isq_2_src2_rob_addr = isq_stream_2.src2_rob_ptr(ROB_PTR_W-2 downto 0)
  val isq_3_src2_rob_addr = isq_stream_3.src2_rob_ptr(ROB_PTR_W-2 downto 0)

  // isq 0
  isq_stream_0.valid        := en_rob_a_to_isq_fire(0) || en_rob_b_to_isq_fire(0)
  isq_stream_0.rd_rob_ptr   := (en_rob_a.fire && en_rob_b.fire && en_rob_b_to_isq_fire(0)) ? tail_ptr_add_one | tail_ptr
  isq_stream_0.src1_rob_ptr := en_rob_a_to_isq_fire(0) ? rat.rs1_ptr_inst0 | rat.rs1_ptr_inst1
  isq_stream_0.src2_rob_ptr := en_rob_a_to_isq_fire(0) ? rat.rs2_ptr_inst0 | rat.rs2_ptr_inst1
  isq_stream_0.micro_op     := en_rob_a_to_isq_fire(0) ? en_rob_a.bju_micro_op | en_rob_b.bju_micro_op
  isq_stream_0.src1_vld     :=  entry.exe_done(isq_0_src1_rob_addr) ? True | 
                                (entry.rd_valid(isq_0_src1_rob_addr) ? True | 
                                  (en_rob_a_to_isq_fire(0) ? !rat.rs1_busy_inst0 | !rat.rs1_busy_inst1))
  isq_stream_0.src1_data    := entry.exe_done(isq_0_src1_rob_addr) ? entry.exe_rd_data(isq_0_src1_rob_addr) | 
                                (entry.rd_valid(isq_0_src1_rob_addr) ? entry.rd_data(isq_0_src1_rob_addr) | 
                                  (en_rob_a_to_isq_fire(0) ? arf.read_ports_a.rs1_data | arf.read_ports_b.rs1_data))
  isq_stream_0.src2_vld     := entry.exe_done(isq_0_src2_rob_addr) ? True | 
                                (entry.rd_valid(isq_0_src2_rob_addr) ? True | 
                                  (en_rob_a_to_isq_fire(0) ? !rat.rs2_busy_inst0 | !rat.rs2_busy_inst1))
  isq_stream_0.src2_data    := entry.exe_done(isq_0_src2_rob_addr) ? entry.exe_rd_data(isq_0_src2_rob_addr) | 
                                (entry.rd_valid(isq_0_src2_rob_addr) ? entry.rd_data(isq_0_src2_rob_addr) | 
                                  (en_rob_a_to_isq_fire(0) ? arf.read_ports_a.rs2_data | arf.read_ports_b.rs2_data))
  isq_stream_0.imm          := en_rob_a_to_isq_fire(0) ? en_rob_a.imm | en_rob_b.imm
  isq_stream_0.pc           := en_rob_a_to_isq_fire(0) ? en_rob_a.pc | en_rob_b.pc

  // isq 1
  isq_stream_1.valid        := en_rob_a_to_isq_fire(1) || en_rob_b_to_isq_fire(1)
  isq_stream_1.rd_rob_ptr   := (en_rob_a.fire && en_rob_b.fire && en_rob_b_to_isq_fire(1)) ? tail_ptr_add_one | tail_ptr
  isq_stream_1.src1_rob_ptr := en_rob_a_to_isq_fire(1) ? rat.rs1_ptr_inst0 | rat.rs1_ptr_inst1
  isq_stream_1.src2_rob_ptr := en_rob_a_to_isq_fire(1) ? rat.rs2_ptr_inst0 | rat.rs2_ptr_inst1
  isq_stream_1.micro_op     := en_rob_a_to_isq_fire(1) ? en_rob_a.alu_micro_op | en_rob_b.alu_micro_op
  isq_stream_1.src1_vld     :=  entry.exe_done(isq_1_src1_rob_addr) ? True | 
                                (entry.rd_valid(isq_1_src1_rob_addr) ? True | 
                                  (en_rob_a_to_isq_fire(1) ? !rat.rs1_busy_inst0 | !rat.rs1_busy_inst1))
  isq_stream_1.src1_data    := entry.exe_done(isq_1_src1_rob_addr) ? entry.exe_rd_data(isq_1_src1_rob_addr) | 
                                (entry.rd_valid(isq_1_src1_rob_addr) ? entry.rd_data(isq_1_src1_rob_addr) | 
                                  (en_rob_a_to_isq_fire(1) ? arf.read_ports_a.rs1_data | arf.read_ports_b.rs1_data))
  isq_stream_1.src2_vld     := entry.exe_done(isq_1_src2_rob_addr) ? True | 
                                (entry.rd_valid(isq_1_src2_rob_addr) ? True | 
                                  (en_rob_a_to_isq_fire(1) ? !rat.rs2_busy_inst0 | !rat.rs2_busy_inst1))
  isq_stream_1.src2_data    := entry.exe_done(isq_1_src2_rob_addr) ? entry.exe_rd_data(isq_1_src2_rob_addr) | 
                                (entry.rd_valid(isq_1_src2_rob_addr) ? entry.rd_data(isq_1_src2_rob_addr) | 
                                  (en_rob_a_to_isq_fire(1) ? arf.read_ports_a.rs2_data | arf.read_ports_b.rs2_data))
  isq_stream_1.imm          := en_rob_a_to_isq_fire(1) ? en_rob_a.imm | en_rob_b.imm

  // isq 2
  isq_stream_2.valid        := en_rob_a_to_isq_fire(2) || en_rob_b_to_isq_fire(2)
  isq_stream_2.rd_rob_ptr   := (en_rob_a.fire && en_rob_b.fire && en_rob_b_to_isq_fire(2)) ? tail_ptr_add_one | tail_ptr
  isq_stream_2.src1_rob_ptr := en_rob_a_to_isq_fire(2) ? rat.rs1_ptr_inst0 | rat.rs1_ptr_inst1
  isq_stream_2.src2_rob_ptr := en_rob_a_to_isq_fire(2) ? rat.rs2_ptr_inst0 | rat.rs2_ptr_inst1
  isq_stream_2.micro_op     := en_rob_a_to_isq_fire(2) ? en_rob_a.alu_micro_op | en_rob_b.alu_micro_op
  isq_stream_2.src1_vld     :=  entry.exe_done(isq_2_src1_rob_addr) ? True | 
                                (entry.rd_valid(isq_2_src1_rob_addr) ? True | 
                                  (en_rob_a_to_isq_fire(2) ? !rat.rs1_busy_inst0 | !rat.rs1_busy_inst1))
  isq_stream_2.src1_data    := entry.exe_done(isq_2_src1_rob_addr) ? entry.exe_rd_data(isq_2_src1_rob_addr) | 
                                (entry.rd_valid(isq_2_src1_rob_addr) ? entry.rd_data(isq_2_src1_rob_addr) | 
                                  (en_rob_a_to_isq_fire(2) ? arf.read_ports_a.rs1_data | arf.read_ports_b.rs1_data))
  isq_stream_2.src2_vld     := entry.exe_done(isq_2_src2_rob_addr) ? True | 
                                (entry.rd_valid(isq_2_src2_rob_addr) ? True | 
                                  (en_rob_a_to_isq_fire(2) ? !rat.rs2_busy_inst0 | !rat.rs2_busy_inst1))
  isq_stream_2.src2_data    := entry.exe_done(isq_2_src2_rob_addr) ? entry.exe_rd_data(isq_2_src2_rob_addr) | 
                                (entry.rd_valid(isq_2_src2_rob_addr) ? entry.rd_data(isq_2_src2_rob_addr) | 
                                  (en_rob_a_to_isq_fire(2) ? arf.read_ports_a.rs2_data | arf.read_ports_b.rs2_data))
  isq_stream_2.imm          := en_rob_a_to_isq_fire(2) ? en_rob_a.imm | en_rob_b.imm

  // isq 3
  isq_stream_3.valid        := en_rob_a_to_isq_fire(3) || en_rob_b_to_isq_fire(3)
  isq_stream_3.rd_rob_ptr   := (en_rob_a.fire && en_rob_b.fire && en_rob_b_to_isq_fire(3)) ? tail_ptr_add_one | tail_ptr
  isq_stream_3.src1_rob_ptr := en_rob_a_to_isq_fire(3) ? rat.rs1_ptr_inst0 | rat.rs1_ptr_inst1
  isq_stream_3.src2_rob_ptr := en_rob_a_to_isq_fire(3) ? rat.rs2_ptr_inst0 | rat.rs2_ptr_inst1
  isq_stream_3.micro_op     := en_rob_a_to_isq_fire(3) ? en_rob_a.lsu_micro_op | en_rob_b.lsu_micro_op
  isq_stream_3.src1_vld     :=  entry.exe_done(isq_3_src1_rob_addr) ? True | 
                                (entry.rd_valid(isq_3_src1_rob_addr) ? True | 
                                  (en_rob_a_to_isq_fire(3) ? !rat.rs1_busy_inst0 | !rat.rs1_busy_inst1))
  isq_stream_3.src1_data    := entry.exe_done(isq_3_src1_rob_addr) ? entry.exe_rd_data(isq_3_src1_rob_addr) | 
                                (entry.rd_valid(isq_3_src1_rob_addr) ? entry.rd_data(isq_3_src1_rob_addr) | 
                                  (en_rob_a_to_isq_fire(3) ? arf.read_ports_a.rs1_data | arf.read_ports_b.rs1_data))
  isq_stream_3.src2_vld     := entry.exe_done(isq_3_src2_rob_addr) ? True | 
                                (entry.rd_valid(isq_3_src2_rob_addr) ? True | 
                                  (en_rob_a_to_isq_fire(3) ? !rat.rs2_busy_inst0 | !rat.rs2_busy_inst1))
  isq_stream_3.src2_data    := entry.exe_done(isq_3_src2_rob_addr) ? entry.exe_rd_data(isq_3_src2_rob_addr) | 
                                (entry.rd_valid(isq_3_src2_rob_addr) ? entry.rd_data(isq_3_src2_rob_addr) | 
                                  (en_rob_a_to_isq_fire(3) ? arf.read_ports_a.rs2_data | arf.read_ports_b.rs2_data))
  isq_stream_3.imm          := en_rob_a_to_isq_fire(3) ? en_rob_a.imm | en_rob_b.imm

  // =========================== for difftest ===========================
  if(DIFFTEST){
    isq_stream_0.instruction := a_to_isq_onehot(0) ? en_rob_a.instruction | en_rob_b.instruction
    isq_stream_1.instruction := a_to_isq_onehot(1) ? en_rob_a.instruction | en_rob_b.instruction
    isq_stream_2.instruction := a_to_isq_onehot(2) ? en_rob_a.instruction | en_rob_b.instruction
    isq_stream_3.instruction := a_to_isq_onehot(3) ? en_rob_a.instruction | en_rob_b.instruction
    isq_stream_1.pc          := a_to_isq_onehot(1) ? en_rob_a.pc | en_rob_b.pc
    isq_stream_2.pc          := a_to_isq_onehot(2) ? en_rob_a.pc | en_rob_b.pc
    isq_stream_3.pc          := a_to_isq_onehot(3) ? en_rob_a.pc | en_rob_b.pc
  }

  isq_stream_0 >> en_queue_0
  isq_stream_1 >> en_queue_1
  isq_stream_2 >> en_queue_2
  isq_stream_3 >> en_queue_3


  // =========================== for wake up ===========================
  val exe_executed_reg = Vec(RegInit(False), IQ_NUM)
  val exe_rd_data_reg = Vec(Reg(Bits(64 bits)) init(0), IQ_NUM)
  val exe_rob_ptr_reg = Vec(Reg(UInt(ROB_PTR_W bits)) init(0), IQ_NUM)

  for(i <- 0 until IQ_NUM){
    // when(exe_executed(i)){
    //   exe_executed_reg(i) := True
    //   exe_rd_data_reg(i)  := exe_rd_data(i)
    //   exe_rob_ptr_reg(i)  := exe_rob_ptr(i)
    // }
    // .elsewhen((de_rob_a.fire && de_rob_a.rob_ptr===exe_rob_ptr_reg(i)) ||
    //           (de_rob_b.fire && de_rob_b.rob_ptr===exe_rob_ptr_reg(i))){
    //   exe_executed_reg(i) := False
    // }
    
    // isq_wakeup(i).valid       := exe_executed(i) || exe_executed_reg(i)
    // isq_wakeup(i).exe_rd_data := exe_executed(i) ? exe_rd_data(i)  | exe_rd_data_reg(i)
    // isq_wakeup(i).exe_rob_ptr := exe_executed(i) ? exe_rob_ptr(i)  | exe_rob_ptr_reg(i)

    isq_wakeup(i).valid       := exe_executed(i)
    isq_wakeup(i).exe_rd_data := exe_rd_data(i)
    isq_wakeup(i).exe_rob_ptr := exe_rob_ptr(i)
  }
  rob_head_ptr := head_ptr

  // =========================== De ROB =================================
  de_rob_a.valid    := (entry.state(head_addr) === ROBStateEnum.COMMIT)
  de_rob_a.rd_addr  := entry.rd_addr(head_addr)
  de_rob_a.rd_data  := entry.rd_data(head_addr)
  de_rob_a.rd_wen   := entry.rd_wen(head_addr)
  de_rob_a.rob_ptr  := head_ptr
  if(DIFFTEST){
    de_rob_a.ready  := de_rob_a_ready
    de_rob_a.pc     := entry.pc(head_addr)
    de_rob_a.instruction := entry.instruction(head_addr)
  }else{
    de_rob_a.ready  := True
  }
  

  de_rob_b.valid    := (entry.state(head_addr_add_one) === ROBStateEnum.COMMIT)
  de_rob_b.rd_addr  := entry.rd_addr(head_addr_add_one)
  de_rob_b.rd_data   := entry.rd_data(head_addr_add_one)
  de_rob_b.rd_wen   := entry.rd_wen(head_addr_add_one)
  de_rob_b.rob_ptr  := head_ptr_add_one
  if(DIFFTEST){
    de_rob_b.ready  := de_rob_b_ready
    de_rob_b.pc     := entry.pc(head_addr_add_one)
    de_rob_b.instruction := entry.instruction(head_addr_add_one)
  }else{
    de_rob_b.ready  := True
  }
}

object GenROB extends App {
  val ROBConfig = ReorderBufferConfig(DEPTH=8)
  GenConfig.spinal.generateVerilog(ReorderBuffer(ROBConfig))
}