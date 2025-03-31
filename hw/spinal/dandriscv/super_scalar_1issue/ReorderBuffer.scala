package dandriscv.super_scalar_1issue

import spinal.core._
import spinal.lib._
import math._
import scala.annotation.switch
import MyUtils._

case class ReorderBuffer() extends Component{
  // import p._
  import CpuConfig._

  // =================== IO ===================
  val en_rob = slave(Stream(EnROB(PC_WIDTH)))
  // to issue queue
  val en_queue_0 = master(Stream(EnQueue("BJU")))
  val en_queue_1 = master(Stream(EnQueue("ALU")))
  val en_queue_2 = master(Stream(EnQueue("ALU")))
  val en_queue_3 = master(Stream(EnQueue("LSU")))
  // for instruction wake up
  val exe_dst_ports = Vec(slave(Stream(ExeDst())), IQ_NUM)
  // for state trans
  val isq_rob_ptr = in Vec(UInt(ROB_PTR_W bits), IQ_NUM)
  val isq_issued = in Vec(Bool(), IQ_NUM)
  // for wake up
  val isq_wakeup = Vec(master(Flow(Wakeup())), IQ_NUM)
  // for LSU wake up
  val rob_head_ptr = out UInt(ROB_PTR_W bits)
  // when redirect or interrupt, drain out old, then flush all
  val interrupt_vld = in Bool()
  val redirect_vld = in Bool()
  val bju_rob_ptr = in UInt(ROB_PTR_W bits)
  // when drain out end, flush all
  val rob_flush = out Bool()
  val rob_stall = out Bool()

  // ==================== inst =============================
  val arf = new ARF()
  val rat = new RAT()
  val exe_rob_ptr  = Vec(UInt(ROB_PTR_W bits), IQ_NUM)
  val exe_rd_data  = Vec(Bits(64 bits), IQ_NUM)
  val exe_executed = Vec(Bool(), IQ_NUM)
  val exe_rd_wen   = Vec(Bool(), IQ_NUM)

  for(i <- 0 until IQ_NUM){
    exe_rob_ptr(i)  := exe_dst_ports(i).rd_rob_ptr
    exe_rd_data(i)  := exe_dst_ports(i).result
    exe_executed(i) := exe_dst_ports(i).fire
    exe_rd_wen(i)   := exe_dst_ports(i).fire && exe_dst_ports(i).rd_wen
    exe_dst_ports(i).ready := True //TODO:
  }

  // =============== Entries of ROB =================
  val entry = new Area{
    // reg
    val busy = Vec(RegInit(False), ROB_DEPTH)
    val state = Vec(Reg(ROBStateEnum()) init(ROBStateEnum.IDLE), ROB_DEPTH)
    val pc = Vec(Reg(UInt(PC_WIDTH bits)) init(0), ROB_DEPTH)
    val micro_op = Vec(Reg(RobMicroOp()) init(RobMicroOp.IDLE), ROB_DEPTH)
    val rd_addr = Vec(Reg(UInt(5 bits)) init(0), ROB_DEPTH)
    val rd_data = Vec(Reg(Bits(64 bits)) init(0), ROB_DEPTH)
    val rd_wen = Vec(Reg(Bool()) init(false), ROB_DEPTH)
    val rd_valid = Vec(Reg(Bool()) init(false), ROB_DEPTH)
    val exception = Vec(Reg(ExceptionEnum()) init(ExceptionEnum.IDLE), ROB_DEPTH)
    val instruction = ifGen(DIFFTEST){Vec(Reg(Bits(32 bits)) init(0), ROB_DEPTH)}
    // comb logic
    val state_nxt = Vec(ROBStateEnum(), ROB_DEPTH)
    val en_rob = Vec(Bool(), ROB_DEPTH)
    val de_rob = Vec(Bool(), ROB_DEPTH)
    val de_rob_d1 = Vec(Bool(), ROB_DEPTH)
    val isq_rd_equal = Vec(Bits(IQ_NUM bits), ROB_DEPTH)
    val isq_issue_bits = Vec(Bits(IQ_NUM bits), ROB_DEPTH)
    val isq_issued = Vec(Bool(), ROB_DEPTH)
    val exe_rd_equal = Vec(Bits(IQ_NUM bits), ROB_DEPTH)
    val exe_done_bits = Vec(Bits(IQ_NUM bits), ROB_DEPTH)
    val exe_wen_bits = Vec(Bits(IQ_NUM bits), ROB_DEPTH)
    val exe_rd_data = Vec(Bits(64 bits), ROB_DEPTH)
    val exe_done = Vec(Bool(), ROB_DEPTH)
    val exe_wen  = Vec(Bool(), ROB_DEPTH)
    val commit = Vec(Bool(), ROB_DEPTH)
  }

  // =============== Signals =================
  val head_ptr  = Reg(UInt(ROB_PTR_W bits)) init(0)
  val tail_ptr  = Reg(UInt(ROB_PTR_W bits)) init(0)
  val head_addr = head_ptr(ROB_PTR_W-2 downto 0)
  val tail_addr = tail_ptr(ROB_PTR_W-2 downto 0)
  val rob_empty = (head_ptr===tail_ptr)
  val rob_full  = (head_addr===tail_addr) && (head_ptr(ROB_PTR_W-1)=/=tail_ptr(ROB_PTR_W-1))
  val de_rob_comb = Stream(DeROB())
  val de_rob    = Stream(DeROB())
  val rob_stall_reg = RegInit(False)
  val bju_rob_ptr_reg = Reg(UInt(ROB_PTR_W bits)) init(0)
  val change_flow = interrupt_vld || redirect_vld

  // =============== sel issue queue ===============
  val isq_stream_0 = Stream(EnQueue("BJU"))
  val isq_stream_1 = Stream(EnQueue("ALU"))
  val isq_stream_2 = Stream(EnQueue("ALU"))
  val isq_stream_3 = Stream(EnQueue("LSU"))

  val en_rob_is_bju = (en_rob.micro_op===RobMicroOp.BJU)
  val en_rob_is_alu = (en_rob.micro_op===RobMicroOp.ALU)
  val en_rob_is_lsu = (en_rob.micro_op===RobMicroOp.LSU)

  val to_isq_onehot = Bits(4 bits)


  // =============== update head pointer of ROB(oldest) ===============
  when(rob_flush){
    head_ptr := 0
  }
  .elsewhen(rob_stall && (bju_rob_ptr_reg===head_ptr)){
    head_ptr := head_ptr
  }
  .elsewhen(de_rob_comb.fire){
    head_ptr := head_ptr + 1
  }

  // =============== update tail pointer of ROB(next newest index) ===============
  when(rob_flush){
    tail_ptr := 0
  }
  .elsewhen(en_rob.fire){
    tail_ptr := tail_ptr + 1
  }

  // =============== update Entries of ROB ===============
  for(i <- 0 until ROB_DEPTH){

    // ============== comb logic ===============
    entry.de_rob(i) :=  (de_rob_comb.fire && head_addr===U(i))
    entry.de_rob_d1(i) := Delay(entry.de_rob(i), 1)

    entry.en_rob(i) :=  (en_rob.fire && tail_addr===U(i))

    // issue/exe rd equal to rob entry index?
    for(j <- 0 until IQ_NUM){
      entry.isq_rd_equal(i)(j) := isq_rob_ptr(j)(ROB_PTR_W-2 downto 0)===U(i)
      entry.exe_rd_equal(i)(j) := exe_rob_ptr(j)(ROB_PTR_W-2 downto 0)===U(i)
    }
    entry.exe_done_bits(i)  := entry.exe_rd_equal(i) & exe_executed.asBits
    entry.exe_wen_bits(i)   := entry.exe_rd_equal(i) & exe_executed.asBits & exe_rd_wen.asBits
    entry.isq_issue_bits(i) := entry.isq_rd_equal(i) & isq_issued.asBits
    entry.isq_issued(i)     := entry.isq_issue_bits(i).orR
    entry.exe_done(i)       := entry.exe_done_bits(i).orR
    entry.exe_wen(i)        := entry.exe_wen_bits(i).orR
    entry.exe_rd_data(i)    := dataMux(entry.exe_done_bits(i), exe_rd_data.asBits)

    // when become oldest and no exception, commit
    entry.commit(i) :=  (entry.busy(i) && entry.exception(i)===ExceptionEnum.IDLE) &&
                        (head_addr===U(i) && entry.state(i)===ROBStateEnum.COMPLETE)
                          
    

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
        when(entry.en_rob(i) || (en_rob.instruction===B"32'h6b" || en_rob.instruction===B"32'h7b")){
          entry.state_nxt(i) := ROBStateEnum.ENQUEUE
        }
        .otherwise{
          entry.state_nxt(i) := ROBStateEnum.IDLE
        }
      }
      is(ROBStateEnum.ENQUEUE){
        when(entry.isq_issued(i) || (entry.instruction(i)===B"32'h6b" || entry.instruction(i)===B"32'h7b")){
          entry.state_nxt(i) := ROBStateEnum.EXECUTING
        }
        .otherwise{
          entry.state_nxt(i) := ROBStateEnum.ENQUEUE
        }
      }
      is(ROBStateEnum.EXECUTING){
        when(entry.exe_done(i) || (entry.instruction(i)===B"32'h6b" || entry.instruction(i)===B"32'h7b")){
          entry.state_nxt(i) := ROBStateEnum.COMPLETE
        }
        .otherwise{
          entry.state_nxt(i) := ROBStateEnum.EXECUTING
        }
      }
      is(ROBStateEnum.COMPLETE){
        when(entry.commit(i) || (entry.instruction(i)===B"32'h6b" || entry.instruction(i)===B"32'h7b")){
          entry.state_nxt(i) := ROBStateEnum.COMMIT
        }
        .otherwise{
          entry.state_nxt(i) := ROBStateEnum.COMPLETE
        }
      }
      is(ROBStateEnum.COMMIT){
        when(entry.en_rob(i)){
          entry.state_nxt(i) := ROBStateEnum.ENQUEUE
        }
        .otherwise{
          entry.state_nxt(i) := ROBStateEnum.IDLE
        }
      }
    }

    // ============== pc/u_op/rd_addr/exception of ROB entry==============
    when(en_rob.fire && tail_addr===U(i)){
      entry.pc(i)         := en_rob.pc
      entry.micro_op(i)   := en_rob.micro_op
      entry.rd_addr(i)    := en_rob.rd_addr
      entry.rd_wen(i)     := en_rob.bju_micro_op.rd_wen
      entry.exception(i)  := en_rob.exception
      if(DIFFTEST){
        entry.instruction(i)  := en_rob.instruction
      }
    }

    // ============== rd value of ROB entry==============
    // rd data from Exe
    when(entry.exe_wen(i)){
      entry.rd_data(i) := entry.exe_rd_data(i)
    }
    // rd valid
    when(rob_flush){
      entry.rd_valid(i) := False
    }
    .elsewhen(entry.de_rob_d1(i)){
      entry.rd_valid(i) := False
    }
    .elsewhen(entry.exe_wen(i)){
      entry.rd_valid(i) := True
    }

  }

  // ==================== connect =============================
  arf.read_ports.rs1_req  := en_rob.rs1_ren
  arf.read_ports.rs2_req  := en_rob.rs2_ren
  arf.read_ports.rs1_addr := en_rob.rs1_addr
  arf.read_ports.rs2_addr := en_rob.rs2_addr
  arf.write_ports.rd_wen  := de_rob.fire && de_rob.rd_wen
  arf.write_ports.rd_addr := de_rob.rd_addr
  arf.write_ports.rd_data := de_rob.rd_data


  rat.flush          := rob_flush
  rat.en_rob_vld     := en_rob.fire && en_rob.bju_micro_op.rd_wen
  rat.en_rob_rd_addr := en_rob.rd_addr
  rat.en_rob_ptr     := tail_ptr
  rat.de_rob_vld     := de_rob.fire
  rat.de_rob_rd_addr := de_rob.rd_addr
  rat.de_rob_ptr     := de_rob.rob_ptr
  rat.rs1_addr       := en_rob.rs1_addr
  rat.rs2_addr       := en_rob.rs2_addr


  // ============== flow control ==============
  // when int or redirect, stall the newest instruction, continue exe until commit
  rob_stall := rob_stall_reg

  when(change_flow){
    bju_rob_ptr_reg := bju_rob_ptr
  }

  rob_flush := rob_stall_reg && de_rob.fire && (bju_rob_ptr_reg===de_rob.rob_ptr)
  // rob_flush := rob_stall_reg && (entry.state_nxt(bju_rob_ptr_reg(ROB_PTR_W-2 downto 0))===ROBStateEnum.COMMIT)

  when(change_flow){
    rob_stall_reg := True
  }
  .elsewhen(rob_flush){
    rob_stall_reg := False
  }

  // =========================== to issue queue ===========================
  val isq_ready_bits     = Bits(4 bits)
  val isq_fire_bits      = Bits(4 bits)
  val isq_is_ready       = Bool()
  val rob_is_ready       = Bool()
  val en_rob_to_isq      = Vec(Bool(), 4)
  val en_rob_to_isq_fire = Vec(Bool(), 4)
  val alu_sel            = RegInit(False)

  isq_ready_bits  := isq_stream_3.ready ## isq_stream_2.ready ## isq_stream_1.ready ## isq_stream_0.ready
  isq_fire_bits   := isq_stream_3.fire ## isq_stream_2.fire ## isq_stream_1.fire ## isq_stream_0.fire
  isq_is_ready    := dataMux(to_isq_onehot, isq_ready_bits).asBool || (en_rob.instruction===B"32'h6b" || en_rob.instruction===B"32'h7b")
  rob_is_ready    := (!rob_full) && (!rob_stall)
  en_rob.ready    := rob_is_ready && isq_is_ready
 
  when(en_rob.fire && en_rob_is_alu){
    alu_sel := !alu_sel
  }

  to_isq_onehot(0) := en_rob_is_bju
  to_isq_onehot(1) := en_rob_is_alu && (alu_sel===False)
  to_isq_onehot(2) := en_rob_is_alu && (alu_sel===True)
  to_isq_onehot(3) := en_rob_is_lsu


  for(i <- 0 until IQ_NUM){
    en_rob_to_isq(i):= en_rob.valid && to_isq_onehot(i)
    en_rob_to_isq_fire(i):= en_rob_to_isq(i) && en_rob.ready
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
  isq_stream_0.valid        := en_rob_to_isq_fire(0)
  isq_stream_0.rd_rob_ptr   := tail_ptr
  isq_stream_0.src1_rob_ptr := rat.rs1_ptr
  isq_stream_0.src2_rob_ptr := rat.rs2_ptr
  isq_stream_0.micro_op     := en_rob.bju_micro_op
  isq_stream_0.src1_vld     := (rat.rs1_busy && (entry.exe_wen(isq_0_src1_rob_addr) || entry.rd_valid(isq_0_src1_rob_addr))) || !rat.rs1_busy || (en_rob.rs1_addr===U(0))

  isq_stream_0.src1_data    := (en_rob.rs1_addr===U(0)) ? B(0) |
                                (!rat.rs1_busy ? arf.read_ports.rs1_data | 
                                (entry.exe_wen(isq_0_src1_rob_addr) ? entry.exe_rd_data(isq_0_src1_rob_addr) | entry.rd_data(isq_0_src1_rob_addr)))

  isq_stream_0.src2_vld     := (rat.rs2_busy && (entry.exe_wen(isq_0_src2_rob_addr) || entry.rd_valid(isq_0_src2_rob_addr))) || !rat.rs2_busy || (en_rob.rs2_addr===U(0))

  isq_stream_0.src2_data    := (en_rob.rs2_addr===U(0)) ? B(0) |
                                (!rat.rs2_busy ? arf.read_ports.rs2_data | 
                                (entry.exe_wen(isq_0_src2_rob_addr) ? entry.exe_rd_data(isq_0_src2_rob_addr) | entry.rd_data(isq_0_src2_rob_addr)))

  isq_stream_0.imm          := en_rob.imm
  isq_stream_0.pc           := en_rob.pc
  isq_stream_0.pc_next      := en_rob.pc_next
  isq_stream_0.bpu_pred_taken := en_rob.bpu_pred_taken

  // isq 1
  isq_stream_1.valid        := en_rob_to_isq_fire(1)
  isq_stream_1.rd_rob_ptr   := tail_ptr
  isq_stream_1.src1_rob_ptr := rat.rs1_ptr
  isq_stream_1.src2_rob_ptr := rat.rs2_ptr
  isq_stream_1.micro_op     := en_rob.alu_micro_op
  isq_stream_1.src1_vld     := (rat.rs1_busy && (entry.exe_wen(isq_1_src1_rob_addr) || entry.rd_valid(isq_1_src1_rob_addr))) || !rat.rs1_busy || (en_rob.rs1_addr===U(0))

  isq_stream_1.src1_data    := (en_rob.rs1_addr===U(0)) ? B(0) |
                                (!rat.rs1_busy ? arf.read_ports.rs1_data | 
                                (entry.exe_wen(isq_1_src1_rob_addr) ? entry.exe_rd_data(isq_1_src1_rob_addr) | entry.rd_data(isq_1_src1_rob_addr)))

  isq_stream_1.src2_vld     := (rat.rs2_busy && (entry.exe_wen(isq_1_src2_rob_addr) || entry.rd_valid(isq_1_src2_rob_addr))) || !rat.rs2_busy || (en_rob.rs2_addr===U(0))

  isq_stream_1.src2_data    := (en_rob.rs2_addr===U(0)) ? B(0) |
                                (!rat.rs2_busy ? arf.read_ports.rs2_data | 
                                (entry.exe_wen(isq_1_src2_rob_addr) ? entry.exe_rd_data(isq_1_src2_rob_addr) | entry.rd_data(isq_1_src2_rob_addr)))

  isq_stream_1.imm          := en_rob.imm

  // isq 2
  isq_stream_2.valid        := en_rob_to_isq_fire(2)
  isq_stream_2.rd_rob_ptr   := tail_ptr
  isq_stream_2.src1_rob_ptr := rat.rs1_ptr
  isq_stream_2.src2_rob_ptr := rat.rs2_ptr
  isq_stream_2.micro_op     := en_rob.alu_micro_op
  isq_stream_2.src1_vld     := (rat.rs1_busy && (entry.exe_wen(isq_2_src1_rob_addr) || entry.rd_valid(isq_2_src1_rob_addr))) || !rat.rs1_busy || (en_rob.rs1_addr===U(0))

  isq_stream_2.src1_data    := (en_rob.rs1_addr===U(0)) ? B(0) |
                                (!rat.rs1_busy ? arf.read_ports.rs1_data | 
                                (entry.exe_wen(isq_2_src1_rob_addr) ? entry.exe_rd_data(isq_2_src1_rob_addr) | entry.rd_data(isq_2_src1_rob_addr)))

  isq_stream_2.src2_vld     := (rat.rs2_busy && (entry.exe_wen(isq_2_src2_rob_addr) || entry.rd_valid(isq_2_src2_rob_addr))) || !rat.rs2_busy || (en_rob.rs2_addr===U(0))

  isq_stream_2.src2_data    := (en_rob.rs2_addr===U(0)) ? B(0) |
                                (!rat.rs2_busy ? arf.read_ports.rs2_data | 
                                (entry.exe_wen(isq_2_src2_rob_addr) ? entry.exe_rd_data(isq_2_src2_rob_addr) | entry.rd_data(isq_2_src2_rob_addr)))

  isq_stream_2.imm          := en_rob.imm

  // isq 3
  isq_stream_3.valid        := en_rob_to_isq_fire(3)
  isq_stream_3.rd_rob_ptr   := tail_ptr
  isq_stream_3.src1_rob_ptr := rat.rs1_ptr
  isq_stream_3.src2_rob_ptr := rat.rs2_ptr
  isq_stream_3.micro_op     := en_rob.lsu_micro_op
  isq_stream_3.src1_vld     := (rat.rs1_busy && (entry.exe_wen(isq_3_src1_rob_addr) || entry.rd_valid(isq_3_src1_rob_addr))) || !rat.rs1_busy || (en_rob.rs1_addr===U(0))

  isq_stream_3.src1_data    := (en_rob.rs1_addr===U(0)) ? B(0) |
                                (!rat.rs1_busy ? arf.read_ports.rs1_data | 
                                (entry.exe_wen(isq_3_src1_rob_addr) ? entry.exe_rd_data(isq_3_src1_rob_addr) | entry.rd_data(isq_3_src1_rob_addr)))

  isq_stream_3.src2_vld     := (rat.rs2_busy && (entry.exe_wen(isq_3_src2_rob_addr) || entry.rd_valid(isq_3_src2_rob_addr))) || !rat.rs2_busy || (en_rob.rs2_addr===U(0))

  isq_stream_3.src2_data    := (en_rob.rs2_addr===U(0)) ? B(0) |
                                (!rat.rs2_busy ? arf.read_ports.rs2_data | 
                                (entry.exe_wen(isq_3_src2_rob_addr) ? entry.exe_rd_data(isq_3_src2_rob_addr) | entry.rd_data(isq_3_src2_rob_addr)))

  isq_stream_3.imm          := en_rob.imm

  // =========================== for difftest ===========================
  if(DIFFTEST){
    isq_stream_0.instruction := en_rob.instruction
    isq_stream_1.instruction := en_rob.instruction
    isq_stream_2.instruction := en_rob.instruction
    isq_stream_3.instruction := en_rob.instruction
    isq_stream_1.pc          := en_rob.pc
    isq_stream_2.pc          := en_rob.pc
    isq_stream_3.pc          := en_rob.pc
  }

  isq_stream_0 >> en_queue_0
  isq_stream_1 >> en_queue_1
  isq_stream_2 >> en_queue_2
  isq_stream_3 >> en_queue_3


  // =========================== for wake up ===========================
  for(i <- 0 until IQ_NUM){
    isq_wakeup(i).valid       := exe_executed(i)
    isq_wakeup(i).exe_rd_data := exe_rd_data(i)
    isq_wakeup(i).exe_rob_ptr := exe_rob_ptr(i)
  }
  rob_head_ptr := head_ptr

  // =========================== De ROB =================================
  
  de_rob_comb.rd_addr  := entry.rd_addr(head_addr)
  de_rob_comb.rd_data  := entry.rd_data(head_addr)
  de_rob_comb.rd_wen   := entry.rd_wen(head_addr)
  de_rob_comb.rob_ptr  := head_ptr

  if(DIFFTEST){
    // de_rob_comb.valid  := (entry.state_nxt(head_addr) === ROBStateEnum.COMMIT) || (en_rob.valid && en_rob.instruction===B"32'h6b")
    // de_rob_comb.pc     := (en_rob.valid && en_rob.instruction===B"32'h6b") ? en_rob.pc | entry.pc(head_addr)
    // de_rob_comb.instruction := (en_rob.valid && en_rob.instruction===B"32'h6b") ? B"32'h6b" | entry.instruction(head_addr)
    de_rob_comb.valid  := (entry.state_nxt(head_addr) === ROBStateEnum.COMMIT)
    de_rob_comb.pc     := entry.pc(head_addr)
    de_rob_comb.instruction := entry.instruction(head_addr)
  } else {
    de_rob_comb.valid  := (entry.state_nxt(head_addr) === ROBStateEnum.COMMIT)
  }

  de_rob_comb >-> de_rob
  de_rob.ready := True
  
}

object GenROB extends App {
  GenConfig.spinal.generateVerilog(ReorderBuffer())
}