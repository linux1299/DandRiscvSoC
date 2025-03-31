package dandriscv.super_scalar

import spinal.core._
import spinal.lib._
import math._
import MyUtils._

// issue 1 instructino/cycle in FIFO order
case class IssueQueue(p : IssueQueueConfig) extends Component{
  import p._
  import CpuConfig._

  // =================== IO ===================
  val flush = in Bool()
  val en_queue = slave(Stream(EnQueue(IQ_Type)))
  val de_queue = master(Stream(DeQueue(IQ_Type)))
  val wakeup = Vec(slave(Flow(Wakeup())), IQ_NUM)
  val rob_head_ptr = in UInt(ROB_PTR_W bits)
  // read ROB rd data
  val rob_addr_src1  = out UInt(ROB_PTR_W-1 bits)
  val rob_addr_src2  = out UInt(ROB_PTR_W-1 bits)
  val rob_src1_data  = in Bits(64 bits)
  val rob_src1_valid = in Bool()
  val rob_src2_data  = in Bits(64 bits)
  val rob_src2_valid = in Bool()

  // =============== Entries of IQ =================
  val entry = new Area{
    val busy = Vec(RegInit(False), DEPTH)
    val rd_rob_ptr = Vec(Reg(UInt(ROB_PTR_W bits)) init(0), DEPTH)
    val src1_rob_ptr = Vec(Reg(UInt(ROB_PTR_W bits)) init(0), DEPTH)
    val src2_rob_ptr = Vec(Reg(UInt(ROB_PTR_W bits)) init(0), DEPTH)
    val micro_op = Vec(Reg(IQ_MicroOp(IQ_Type)), DEPTH)
    val src1_vld = Vec(RegInit(False), DEPTH)
    val src2_vld = Vec(RegInit(False), DEPTH)
    val src1_data = Vec(Reg(Bits(64 bits)) init(0), DEPTH)
    val src2_data = Vec(Reg(Bits(64 bits)) init(0), DEPTH)
    val imm = Vec(Reg(Bits(64 bits)) init(0), DEPTH)
    val pc = ((IQ_Type=="BJU") || DIFFTEST) generate Vec(Reg(UInt(PC_WIDTH bits)) init(0), DEPTH)
    val instruction = (DIFFTEST) generate Vec(Reg(Bits(32 bits)) init(0), DEPTH)
    // comb logic
    val exe_rd_equal_src1 = Vec(Bits(IQ_NUM bits), DEPTH)
    val exe_done_bits_src1 = Vec(Bits(IQ_NUM bits), DEPTH)
    val exe_rd_data_src1 = Vec(Bits(64 bits), DEPTH)
    val exe_done_src1 = Vec(Bool(), DEPTH)
    val exe_rd_equal_src2 = Vec(Bits(IQ_NUM bits), DEPTH)
    val exe_done_bits_src2 = Vec(Bits(IQ_NUM bits), DEPTH)
    val exe_rd_data_src2 = Vec(Bits(64 bits), DEPTH)
    val exe_done_src2 = Vec(Bool(), DEPTH)
  }
  val read_ptr = Reg(UInt(PTR_WIDTH bits)) init(0)
  val write_ptr= Reg(UInt(PTR_WIDTH bits)) init(0)
  val read_addr = read_ptr(PTR_WIDTH-2 downto 0)
  val write_addr= write_ptr(PTR_WIDTH-2 downto 0)
  val iq_empty = (read_ptr===write_ptr)
  val iq_full = (read_addr===write_addr) && (read_ptr(PTR_WIDTH-1)=/=write_ptr(PTR_WIDTH-1))

  val exe_rd_data   = Vec(Bits(64 bits), IQ_NUM)
  val exe_executed = Vec(Bool(), IQ_NUM)
  for(i <- 0 until IQ_NUM){
    exe_rd_data(i)  := wakeup(i).exe_rd_data
    exe_executed(i) := wakeup(i).valid
  }
  
  // update pointer, read/write iq
  when(flush){
    read_ptr := 0
  }
  .elsewhen(de_queue.fire){
    read_ptr := read_ptr + 1
  }
  when(flush){
    write_ptr := 0
  }
  .elsewhen(en_queue.fire){
    write_ptr := write_ptr + 1
  }
  
  // update Entries of IQ
  for(i <- 0 until DEPTH){
    // busy of iq entry
    when(flush){
      entry.busy(i) := False
    }
    .elsewhen(en_queue.fire && (write_addr===U(i))){
      entry.busy(i) := True
    }
    .elsewhen(de_queue.fire && (read_addr===U(i))){
      entry.busy(i) := False
    }

    // rd_rob_ptr/micro_op of iq entry
    when(en_queue.fire && (write_addr===U(i))){
      entry.rd_rob_ptr(i)   := en_queue.rd_rob_ptr
      entry.src1_rob_ptr(i) := en_queue.src1_rob_ptr
      entry.src2_rob_ptr(i) := en_queue.src2_rob_ptr
      entry.micro_op(i)     := en_queue.micro_op
      entry.imm(i)          := en_queue.imm
      if((IQ_Type=="BJU") || DIFFTEST){
        entry.pc(i)      := en_queue.pc
      }
      if(DIFFTEST){
        entry.instruction(i) := en_queue.instruction
      }
    }

    // exe rd ptr equal to src ptr?
    for(j <- 0 until IQ_NUM){
      entry.exe_rd_equal_src1(i)(j) := wakeup(j).exe_rob_ptr===entry.src1_rob_ptr(i)
      entry.exe_rd_equal_src2(i)(j) := wakeup(j).exe_rob_ptr===entry.src2_rob_ptr(i)
    }

    entry.exe_done_bits_src1(i)  := entry.exe_rd_equal_src1(i) & exe_executed.asBits
    entry.exe_done_src1(i)       := entry.exe_done_bits_src1(i).orR
    entry.exe_rd_data_src1(i)    := dataMux(entry.exe_done_bits_src1(i), exe_rd_data.asBits)
    entry.exe_done_bits_src2(i)  := entry.exe_rd_equal_src2(i) & exe_executed.asBits
    entry.exe_done_src2(i)       := entry.exe_done_bits_src2(i).orR
    entry.exe_rd_data_src2(i)    := dataMux(entry.exe_done_bits_src2(i), exe_rd_data.asBits)
    
    // when enter isq, write one entry
    when(en_queue.fire && (write_addr===U(i))){
      entry.src1_vld(i) := en_queue.src1_vld
      entry.src1_data(i) := en_queue.src1_data
    }
    // when wake up, write all equal entry
    .elsewhen(entry.busy(i) && (!entry.src1_vld(i)) && entry.exe_done_src1(i)){
      entry.src1_vld(i) := True
      entry.src1_data(i) := entry.exe_rd_data_src1(i)
    }
    // when rob rd is valid
    .elsewhen(entry.busy(i) && (!entry.src1_vld(i)) && rob_src1_valid){
      entry.src1_vld(i) := True
      entry.src1_data(i) := rob_src1_data
    }

    // when enter isq, write one entry
    when(en_queue.fire && (write_addr===U(i))){
      entry.src2_vld(i) := en_queue.micro_op.src2_is_imm ? True | en_queue.src2_vld
      entry.src2_data(i) := en_queue.micro_op.src2_is_imm ? en_queue.imm | en_queue.src2_data
    }
    // when wake up, write all equal entry
    .elsewhen(entry.busy(i) && (!entry.src2_vld(i)) && entry.exe_done_src2(i)){
      entry.src2_vld(i) := True
      entry.src2_data(i) := entry.exe_rd_data_src2(i)
    }
    // when rob rd is valid
    .elsewhen(entry.busy(i) && (!entry.src2_vld(i)) && rob_src2_valid){
      entry.src2_vld(i) := True
      entry.src2_data(i) := rob_src2_data
    }
    
  }

  // output
  en_queue.ready := !iq_full
  if(IQ_Type=="LSU"){
    de_queue.valid := !iq_empty && entry.busy(read_addr) && entry.src1_vld(read_addr) && entry.src2_vld(read_addr) && (rob_head_ptr===entry.rd_rob_ptr(read_addr))
  }
  else{
    de_queue.valid := !iq_empty && entry.busy(read_addr) && entry.src1_vld(read_addr) && entry.src2_vld(read_addr)
  }

  rob_addr_src1 := entry.src1_rob_ptr(read_addr)(ROB_PTR_W-2 downto 0)
  rob_addr_src2 := entry.src2_rob_ptr(read_addr)(ROB_PTR_W-2 downto 0)
  
  de_queue.rd_rob_ptr := entry.rd_rob_ptr(read_addr)
  de_queue.micro_op := entry.micro_op(read_addr)
  de_queue.src1_data := entry.src1_data(read_addr)
  de_queue.src2_data := entry.src2_data(read_addr)
  if(IQ_Type != "ALU"){
    de_queue.imm  := entry.imm(read_addr)
  }
  if((IQ_Type=="BJU") || DIFFTEST){
    de_queue.pc := entry.pc(read_addr)
  }
  if(DIFFTEST){
    de_queue.instruction := entry.instruction(read_addr)
  }
  
}