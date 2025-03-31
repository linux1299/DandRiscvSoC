package dandriscv.super_scalar

import spinal.core._
import spinal.lib._
import math._
import MyUtils._

// issue 1 instructino/cycle in FIFO order
case class IssueQueue_1entry(p : IssueQueueConfig) extends Component{
  import p._
  import CpuConfig._

  // =================== IO ===================
  val flush = in Bool()
  val en_queue = slave(Stream(EnQueue(IQ_Type)))
  val de_queue = master(Stream(DeQueue(IQ_Type)))
  val wakeup = Vec(slave(Flow(Wakeup())), IQ_NUM)
  val rob_head_ptr = in UInt(ROB_PTR_W bits)

  // =============== Entries of IQ =================
  val entry = new Area{
    val busy = RegInit(False)
    val rd_rob_ptr = Reg(UInt(ROB_PTR_W bits)) init(0)
    val src1_rob_ptr = Reg(UInt(ROB_PTR_W bits)) init(0)
    val src2_rob_ptr = Reg(UInt(ROB_PTR_W bits)) init(0)
    val micro_op = Reg(IQ_MicroOp(IQ_Type))
    val src1_vld = RegInit(False)
    val src2_vld = RegInit(False)
    val src1_data = Reg(Bits(64 bits)) init(0)
    val src2_data = Reg(Bits(64 bits)) init(0)
    val imm = Reg(Bits(64 bits)) init(0)
    val pc = ((IQ_Type=="BJU") || DIFFTEST) generate Reg(UInt(PC_WIDTH bits)) init(0)
    val instruction = (DIFFTEST) generate Reg(Bits(32 bits)) init(0)
    // comb logic
    val exe_rd_equal_src1 = Bits(IQ_NUM bits)
    val exe_done_bits_src1 = Bits(IQ_NUM bits)
    val exe_rd_data_src1 = Bits(64 bits)
    val exe_done_src1 = Bool()
    val exe_rd_equal_src2 = Bits(IQ_NUM bits)
    val exe_done_bits_src2 = Bits(IQ_NUM bits)
    val exe_rd_data_src2 = Bits(64 bits)
    val exe_done_src2 = Bool()
  }

  val exe_rd_data  = Vec(Bits(64 bits), IQ_NUM)
  val exe_executed = Vec(Bool(), IQ_NUM)
  for(i <- 0 until IQ_NUM){
    exe_rd_data(i)  := wakeup(i).exe_rd_data
    exe_executed(i) := wakeup(i).valid
    // exe rd ptr equal to src ptr?
    entry.exe_rd_equal_src1(i) := wakeup(i).exe_rob_ptr===entry.src1_rob_ptr
    entry.exe_rd_equal_src2(i) := wakeup(i).exe_rob_ptr===entry.src2_rob_ptr
  }
  
  // update Entries of IQ
  // busy of iq entry
  when(flush){
    entry.busy := False
  }
  .elsewhen(en_queue.fire){
    entry.busy := True
  }
  .elsewhen(de_queue.fire){
    entry.busy := False
  }

  // rd_rob_ptr/micro_op of iq entry
  when(en_queue.fire){
    entry.rd_rob_ptr    := en_queue.rd_rob_ptr
    entry.src1_rob_ptr  := en_queue.src1_rob_ptr
    entry.src2_rob_ptr  := en_queue.src2_rob_ptr
    entry.micro_op      := en_queue.micro_op
    entry.imm           := en_queue.imm
    if((IQ_Type=="BJU") || DIFFTEST){
      entry.pc          := en_queue.pc
    }
    if(DIFFTEST){
      entry.instruction := en_queue.instruction
    }
  }

  entry.exe_done_bits_src1  := entry.exe_rd_equal_src1 & exe_executed.asBits
  entry.exe_done_src1       := entry.exe_done_bits_src1.orR
  entry.exe_rd_data_src1    := dataMux(entry.exe_done_bits_src1, exe_rd_data.asBits)
  entry.exe_done_bits_src2  := entry.exe_rd_equal_src2 & exe_executed.asBits
  entry.exe_done_src2       := entry.exe_done_bits_src2.orR
  entry.exe_rd_data_src2    := dataMux(entry.exe_done_bits_src2, exe_rd_data.asBits)
  
  // when enter isq, write one entry
  when(en_queue.fire){
    entry.src1_vld  := en_queue.src1_vld
    entry.src1_data := en_queue.src1_data
  }
  // when wake up, write all equal entry
  .elsewhen(entry.busy && (!entry.src1_vld) && entry.exe_done_src1){
    entry.src1_vld  := True
    entry.src1_data := entry.exe_rd_data_src1
  }

  // when enter isq, write one entry
  when(en_queue.fire){
    entry.src2_vld  := en_queue.micro_op.src2_is_imm ? True | en_queue.src2_vld
    entry.src2_data := en_queue.micro_op.src2_is_imm ? en_queue.imm | en_queue.src2_data
  }
  // when wake up, write all equal entry
  .elsewhen(entry.busy && (!entry.src2_vld) && entry.exe_done_src2){
    entry.src2_vld  := True
    entry.src2_data := entry.exe_rd_data_src2
  }

  // output
  en_queue.ready := !entry.busy || de_queue.fire
  if(IQ_Type=="LSU"){
    de_queue.valid := entry.busy && entry.src1_vld && entry.src2_vld && (rob_head_ptr===entry.rd_rob_ptr)
  }
  else{
    de_queue.valid := entry.busy && entry.src1_vld && entry.src2_vld
  }
  
  de_queue.rd_rob_ptr := entry.rd_rob_ptr
  de_queue.micro_op   := entry.micro_op
  de_queue.src1_data  := entry.src1_data
  de_queue.src2_data  := entry.src2_data

  if(IQ_Type != "ALU"){
    de_queue.imm  := entry.imm
  }
  if((IQ_Type=="BJU") || DIFFTEST){
    de_queue.pc := entry.pc
  }
  if(DIFFTEST){
    de_queue.instruction := entry.instruction
  }
  
}