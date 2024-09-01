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
  val en_queue = slave(Stream(EnQueue(ROB_PTR_W, IQ_Type)))
  val de_queue = master(Stream(DeQueue(ROB_PTR_W, IQ_Type)))
  // for instruction wake up
  val exe_rob_ptr  = in Vec(UInt(ROB_PTR_W bits), IQ_NUM)
  val exe_rd_val   = in Vec(Bits(64 bits), IQ_NUM)
  val exe_executed = in Vec(Bool(), IQ_NUM)

  // =============== Entries of IQ =================
  val entry = new Area{
    val busy = Vec(RegInit(False), DEPTH)
    val rd_rob_ptr = Vec(Reg(UInt(ROB_PTR_W bits)) init(0), DEPTH)
    val src1_rob_ptr = Vec(Reg(UInt(ROB_PTR_W bits)) init(0), DEPTH)
    val src2_rob_ptr = Vec(Reg(UInt(ROB_PTR_W bits)) init(0), DEPTH)
    val micro_op = Vec(Reg(IQ_MicroOp(IQ_Type)), DEPTH)
    val src1_vld = Vec(RegInit(False), DEPTH)
    val src2_vld = Vec(RegInit(False), DEPTH)
    val src1_val = Vec(Reg(Bits(64 bits)) init(0), DEPTH)
    val src2_val = Vec(Reg(Bits(64 bits)) init(0), DEPTH)
    val imm_val = Vec(Reg(Bits(64 bits)) init(0), DEPTH)
    val pc = (IQ_Type == "BJU") generate Vec(Reg(UInt(PC_WIDTH bits)) init(0), DEPTH)
    // comb logic
    val exe_rd_equal_src1 = Vec(Bits(IQ_NUM bits), DEPTH)
    val exe_done_bits_src1 = Vec(Bits(IQ_NUM bits), DEPTH)
    val exe_rd_val_src1 = Vec(Bits(64 bits), DEPTH)
    val exe_done_src1 = Vec(Bool(), DEPTH)
    val exe_rd_equal_src2 = Vec(Bits(IQ_NUM bits), DEPTH)
    val exe_done_bits_src2 = Vec(Bits(IQ_NUM bits), DEPTH)
    val exe_rd_val_src2 = Vec(Bits(64 bits), DEPTH)
    val exe_done_src2 = Vec(Bool(), DEPTH)
  }
  val read_ptr = Reg(UInt(PTR_WIDTH bits)) init(0)
  val write_ptr= Reg(UInt(PTR_WIDTH bits)) init(0)
  val read_addr = read_ptr(PTR_WIDTH-2 downto 0)
  val write_addr= write_ptr(PTR_WIDTH-2 downto 0)
  val iq_empty = (read_ptr===write_ptr)
  val iq_full = (read_addr===write_addr) && (read_ptr(PTR_WIDTH-1)=/=write_ptr(PTR_WIDTH-1))
  
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
      entry.micro_op(i)  := en_queue.micro_op
      entry.imm_val(i)   := en_queue.imm_val
      if(IQ_Type == "BJU"){
        entry.pc(i)      := en_queue.pc
      }
    }

    // exe rd ptr equal to src ptr?
    for(j <- 0 until IQ_NUM){
      entry.exe_rd_equal_src1(i)(j) := exe_rob_ptr(j)===entry.src1_rob_ptr(i)
      entry.exe_rd_equal_src2(i)(j) := exe_rob_ptr(j)===entry.src2_rob_ptr(i)
    }
    entry.exe_done_bits_src1(i)  := entry.exe_rd_equal_src1(i) & exe_executed.asBits
    entry.exe_done_src1(i)       := entry.exe_done_bits_src1(i).orR
    entry.exe_rd_val_src1(i)     := dataMux(entry.exe_done_bits_src1(i), exe_rd_val.asBits)
    entry.exe_done_bits_src2(i)  := entry.exe_rd_equal_src2(i) & exe_executed.asBits
    entry.exe_done_src2(i)       := entry.exe_done_bits_src2(i).orR
    entry.exe_rd_val_src2(i)     := dataMux(entry.exe_done_bits_src2(i), exe_rd_val.asBits)
    
    // src1_vld /src2_vld of iq entry
    when(en_queue.fire && (write_addr===U(i))){
      entry.src1_vld(i) := en_queue.src1_vld
      entry.src1_val(i) := en_queue.src1_val
    }
    .elsewhen(entry.busy(i) && (read_addr===U(i)) && entry.exe_done_src1(i)){
      entry.src1_vld(i) := True
      entry.src1_val(i) := entry.exe_rd_val_src1(i)
    }

    when(en_queue.fire && (write_addr===U(i))){
      entry.src2_vld(i) := en_queue.src2_vld
      entry.src2_val(i) := en_queue.micro_op.src2_is_imm ? en_queue.imm_val | en_queue.src2_val
    }
    .elsewhen(entry.busy(i) && (read_addr===U(i)) && entry.exe_done_src2(i)){
      entry.src2_vld(i) := True
      entry.src2_val(i) := entry.exe_rd_val_src2(i)
    }
    
  }

  // output
  en_queue.ready := !iq_full
  de_queue.valid := !iq_empty && entry.busy(read_addr) && entry.src1_vld(read_addr) && entry.src2_vld(read_addr)
  de_queue.rd_rob_ptr := entry.rd_rob_ptr(read_addr)
//  de_queue.src1_rob_ptr := entry.src1_rob_ptr(read_addr)
//  de_queue.src2_rob_ptr := entry.src2_rob_ptr(read_addr)
  de_queue.micro_op := entry.micro_op(read_addr)
  de_queue.src1_val := entry.src1_val(read_addr)
  de_queue.src2_val := entry.src2_val(read_addr)
  if(IQ_Type != "ALU"){
    de_queue.imm_val  := entry.imm_val(read_addr)
  }
  if(IQ_Type == "BJU"){
    de_queue.pc := entry.pc(read_addr)
  }
  
}