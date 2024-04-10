package dandriscv.super_scalar

// import dandriscv.ip._
import spinal.core._
import spinal.lib._
import math._

case class ReorderBufferConfig(
  DEPTH : Int,
  PC_WIDTH : Int,
  OP_WIDTH : Int,
  EXCPT_WIDTH : Int,
  STATE_WIDTH : Int
){
  def PTR_WIDTH = log2Up(DEPTH)+1
}

case class EnROB(PC_WIDTH: Int, OP_WIDTH: Int, EXCPT_WIDTH: Int) extends Bundle {
  val pc = UInt(PC_WIDTH bits)
  val micro_op = Bits(OP_WIDTH bits)
  val rd_addr = UInt(5 bits)
  val rd_val = Bits(64 bits)
  val exception = Bits(EXCPT_WIDTH bits)
}

case class DeROB() extends Bundle {
  val rd_addr = UInt(5 bits)
  val rd_val = Bits(64 bits)
}

case class ReorderBuffer(p : ReorderBufferConfig) extends Component{
  import p._

  // =================== IO ===================
  val flush = in Bool()
  val en_rob_a = slave(Stream(EnROB(PC_WIDTH, OP_WIDTH, EXCPT_WIDTH)))
  val en_rob_b = slave(Stream(EnROB(PC_WIDTH, OP_WIDTH, EXCPT_WIDTH)))
  val de_rob_a = master(Stream(DeROB()))
  val de_rob_b = master(Stream(DeROB()))
  // for instruction wake up
  val exe_rd_addr = in(UInt(PTR_WIDTH-1 bits))
  val exe_rd_val   = in Bits(64 bits)
  val exe_rd_valid = in(Bool())

  // =============== Entries of ROB =================
  val entry = new Area{
    val busy = Vec(RegInit(False), DEPTH)
    val state = Vec(Reg(UInt(STATE_WIDTH bits)) init(0), DEPTH)
    val pc = Vec(Reg(UInt(PC_WIDTH bits)) init(0), DEPTH)
    val micro_op = Vec(Reg(Bits(OP_WIDTH bits)) init(0), DEPTH)
    val rd_addr = Vec(Reg(UInt(5 bits)) init(0), DEPTH)
    val rd_val = Vec(Reg(Bits(64 bits)) init(0), DEPTH)
    val exception = Vec(Reg(Bits(EXCPT_WIDTH bits)) init(0), DEPTH)
  }
  val head_ptr = Reg(UInt(PTR_WIDTH bits)) init(0)
  val head_ptr_add_one = head_ptr + 1
  val head_ptr_add_two = head_ptr + 2
  val tail_ptr = Reg(UInt(PTR_WIDTH bits)) init(0)
  val tail_ptr_add_one = tail_ptr + 1
  val tail_ptr_add_two = tail_ptr + 2
  val head_addr = head_ptr(PTR_WIDTH-2 downto 0)
  val head_addr_add_one = head_ptr_add_one(PTR_WIDTH-2 downto 0)
  val tail_addr = tail_ptr(PTR_WIDTH-2 downto 0)
  val tail_addr_add_one = tail_ptr_add_one(PTR_WIDTH-2 downto 0)
  val rob_empty = (head_ptr===tail_ptr)
  val rob_full = (head_addr===tail_addr) && (head_ptr(PTR_WIDTH-1)=/=tail_ptr(PTR_WIDTH-1))
  val empty_entry_cnt = Reg(UInt(PTR_WIDTH-1 bits)) init(DEPTH)
  val empty_entry_cnt_next = UInt(PTR_WIDTH-1 bits)

  // update head pointer of ROB(oldest)
  when(flush){
    head_ptr := 0
  }
  .elsewhen(de_rob_a.fire && de_rob_b.fire){
    head_ptr := head_ptr_add_two
  }
  .elsewhen((de_rob_a.fire && !de_rob_b.fire) || (!de_rob_a.fire && de_rob_b.fire)){
    head_ptr := head_ptr_add_one
  }

  // update tail pointer of ROB(newest)
  when(flush){
    tail_ptr := 0
  }
  .elsewhen(en_rob_a.fire && en_rob_b.fire){
    tail_ptr := tail_ptr_add_two
  }
  .elsewhen((en_rob_a.fire && !en_rob_b.fire) || (!en_rob_a.fire && en_rob_b.fire)){
    tail_ptr := tail_ptr_add_one
  }

  // count of empty entry
  empty_entry_cnt_next := de_rob_a.fire.asUInt + de_rob_b.fire.asUInt - en_rob_a.fire.asUInt - en_rob_b.fire.asUInt
  when(flush){
    empty_entry_cnt := U(DEPTH, PTR_WIDTH-1 bits)
  }
  .otherwise{
    empty_entry_cnt := empty_entry_cnt_next
  }

  // update Entries of ROB
  for(i <- 0 until DEPTH){
    // busy of ROB entry
    when(flush){
      entry.busy(i) := False
    }
    .elsewhen((en_rob_a.fire && tail_addr===U(i)) || (en_rob_b.fire && tail_addr_add_one===U(i))){
      entry.busy(i) := True
    }
    .elsewhen((de_rob_a.fire && head_addr===U(i)) || (de_rob_b.fire && head_addr_add_one===U(i))){
      entry.busy(i) := False
    }
  }
}