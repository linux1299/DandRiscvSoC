package dandriscv.super_scalar

// import dandriscv.ip._
import spinal.core._
import spinal.lib._
import math._

case class ReorderBuffer(p : ReorderBufferConfig) extends Component{
  import p._

  // =================== IO ===================
  val en_rob_a = slave(Stream(EnROB(PC_WIDTH, OP_WIDTH, EXCPT_WIDTH)))
  val en_rob_b = slave(Stream(EnROB(PC_WIDTH, OP_WIDTH, EXCPT_WIDTH)))
  val de_rob_a = master(Stream(DeROB()))
  val de_rob_b = master(Stream(DeROB()))
  // for instruction wake up
  val exe_rd_addr = in UInt(PTR_WIDTH-1 bits)
  val exe_rd_val  = in Bits(64 bits)
  val exe_rd_vld  = in Bool()
  // for state trans
  val iq_rd_addr = in Vec(UInt(PTR_WIDTH-1 bits), IQ_NUM)
  val iq_issue = in Vec(Bool(), IQ_NUM)
  // interrupt or redirect, flush newest instruction
  val interrupt_vld = in Bool()
  val interrupt_rob_ptr = in UInt(PTR_WIDTH bits)
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
    val exception = Vec(Reg(Bits(EXCPT_WIDTH bits)) init(0), DEPTH)
  }
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
  val flush = (interrupt_vld || redirect_vld)
  val flush_ptr = interrupt_vld ? interrupt_rob_ptr | redirect_rob_ptr
  val entry_flush = Vec(Bool(), DEPTH*2)
  val entry_flush_len =  UInt(PTR_WIDTH bits)
  val entry_flush_bits = Bits(DEPTH*2 bits)
  val entry_flush_bits_full = Bits(DEPTH*4 bits)

  // when need flush, count length of flush
  entry_flush_len :=  (tail_ptr_sub_one === flush_ptr) ? U(0) |
                      ((tail_ptr_sub_one > flush_ptr) ? 
                      (tail_ptr_sub_one - flush_ptr) | 
                      (U(DEPTH*2, PTR_WIDTH+1 bits) - (flush_ptr - tail_ptr).resized).resized)

  for(i <- 0 until DEPTH*4){
    entry_flush_bits_full(i) := (U(i) > flush_ptr) && (U(i) <= (flush_ptr + entry_flush_len))
  }
  for(i <- 0 until DEPTH*2){
    // flush
    entry_flush_bits(i) := entry_flush_bits_full(i) || entry_flush_bits_full(i+DEPTH*2)
    entry_flush(i) := flush && entry_flush_bits(i)
  }

  // update head pointer of ROB(oldest)
  when(de_rob_a.fire && de_rob_b.fire){
    head_ptr := head_ptr_add_two
  }
  .elsewhen((de_rob_a.fire && !de_rob_b.fire) || 
            (!de_rob_a.fire && de_rob_b.fire)){
    head_ptr := head_ptr_add_one
  }

  // update tail pointer of ROB(newest)
  when(interrupt_vld){
    tail_ptr := interrupt_rob_ptr
  }
  .elsewhen(redirect_vld){
    tail_ptr := redirect_rob_ptr
  }
  .elsewhen(en_rob_a.fire && en_rob_b.fire){
    tail_ptr := tail_ptr_add_two
  }
  .elsewhen((en_rob_a.fire && !en_rob_b.fire) || 
            (!en_rob_a.fire && en_rob_b.fire)){
    tail_ptr := tail_ptr_add_one
  }

  // count of empty entry
  empty_entry_cnt_next := empty_entry_cnt.resized + 
                          de_rob_a.fire.asUInt.resized + 
                          de_rob_b.fire.asUInt.resized - 
                          en_rob_a.fire.asUInt.resized - 
                          en_rob_b.fire.asUInt.resized
  when(flush){
    empty_entry_cnt := empty_entry_cnt + 
  }
  .otherwise{
    empty_entry_cnt := empty_entry_cnt_next
  }

  // update Entries of ROB
  for(i <- 0 until DEPTH){
    
    // busy of ROB entry
    when(entry_flush(i) || entry_flush(i+DEPTH)){
      entry.busy(i) := False
    }
    .elsewhen((en_rob_a.fire && tail_addr===U(i)) || 
              (en_rob_b.fire && tail_addr_add_one===U(i))){
      entry.busy(i) := True
    }
    .elsewhen((de_rob_a.fire && head_addr===U(i)) || 
              (de_rob_b.fire && head_addr_add_one===U(i))){
      entry.busy(i) := False
    }

    // state trans

  }
}

object GenROB extends App {
  val ROBConfig = ReorderBufferConfig(8, 32, 1, 1)
  GenConfig.spinal.generateVerilog(ReorderBuffer(ROBConfig))
}