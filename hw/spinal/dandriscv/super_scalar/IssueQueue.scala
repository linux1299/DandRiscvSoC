package dandriscv.super_scalar

// import dandriscv.ip._
import spinal.core._
import spinal.lib._
import math._

// issue 1 instructino/cycle in FIFO order
case class IssueQueue(p : IssueQueueConfig) extends Component{
  import p._

  // =================== IO ===================
  val flush = in Bool()
  val en_queue = slave(Stream(EnQueue(ROB_AW, OP_WIDTH)))
  val de_queue = master(Stream(DeQueue(ROB_AW, OP_WIDTH)))
  // for instruction wake up
  val exe_rd_addr = in UInt(ROB_AW bits)
  val exe_rd_val   = in Bits(64 bits)
  val exe_rd_vld = in Bool()

  // =============== Entries of IQ =================
  val entry = new Area{
    val busy = Vec(RegInit(False), DEPTH)
    val rd_addr = Vec(Reg(UInt(ROB_AW bits)) init(0), DEPTH)
    val src1_addr = Vec(Reg(UInt(ROB_AW bits)) init(0), DEPTH)
    val src2_addr = Vec(Reg(UInt(ROB_AW bits)) init(0), DEPTH)
    val micro_op = Vec(Reg(Bits(OP_WIDTH bits)) init(0), DEPTH)
    val src1_vld = Vec(RegInit(False), DEPTH)
    val src2_vld = Vec(RegInit(False), DEPTH)
    val src1_val = Vec(Reg(Bits(64 bits)) init(0), DEPTH)
    val src2_val = Vec(Reg(Bits(64 bits)) init(0), DEPTH)
    val imm_val = Vec(Reg(Bits(64 bits)) init(0), DEPTH)
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

    // rd_addr/micro_op of iq entry
    when(en_queue.fire && (write_addr===U(i))){
      entry.rd_addr(i) := en_queue.payload.rd_addr
      entry.src1_addr(i) := en_queue.payload.src1_addr
      entry.src2_addr(i) := en_queue.payload.src2_addr
      entry.micro_op(i) := en_queue.payload.micro_op
      entry.imm_val(i) := en_queue.payload.imm_val
    }
    
    // src1_vld /src2_vld of iq entry
    when(en_queue.fire && (write_addr===U(i))){
      entry.src1_vld(i) := en_queue.payload.src1_vld
      entry.src1_val(i) := en_queue.payload.src1_val
    }
    .elsewhen(entry.busy(i) && (read_addr===U(i)) && (exe_rd_addr===entry.src1_addr(i) && exe_rd_vld)){
      entry.src1_vld(i) := True
      entry.src1_val(i) := exe_rd_val
    }

    when(en_queue.fire && (write_addr===U(i))){
      entry.src2_vld(i) := en_queue.payload.src2_vld
      entry.src2_val(i) := en_queue.payload.src2_val
    }
    .elsewhen(entry.busy(i) && (read_addr===U(i)) && (exe_rd_addr===entry.src2_addr(i) && exe_rd_vld)){
      entry.src2_vld(i) := True
      entry.src2_val(i) := exe_rd_val
    }
    
  }

  // output
  en_queue.ready := !iq_full
  de_queue.valid := !iq_empty && entry.busy(read_addr) && entry.src1_vld(read_addr) && entry.src2_vld(read_addr)
  de_queue.payload.rd_addr := entry.rd_addr(read_addr)
  de_queue.payload.src1_addr := entry.src1_addr(read_addr)
  de_queue.payload.src2_addr := entry.src2_addr(read_addr)
  de_queue.payload.micro_op := entry.micro_op(read_addr)
  de_queue.payload.src1_val := entry.src1_val(read_addr)
  de_queue.payload.src2_val := entry.src2_val(read_addr)

}