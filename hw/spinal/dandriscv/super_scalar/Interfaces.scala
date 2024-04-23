package dandriscv.super_scalar

import dandriscv.ip._
import spinal.core._
import spinal.lib._
import math._

// ================ cpu and icache ports ===============
case class ICacheAccessCmd(AW: Int) extends Bundle {
  val addr = UInt(AW bits)
}
case class ICacheAccessRsp(DW: Int) extends Bundle {
  val data = Bits(DW bits)
}
case class ICacheAccess(AW: Int, DW: Int) extends Bundle with IMasterSlave{
  val cmd = Stream(ICacheAccessCmd(AW))
  val rsp = Flow(ICacheAccessRsp(DW))
  override def asMaster(): Unit = {
    master(cmd)
    slave(rsp)
  }
  override def asSlave(): Unit = {
    slave(cmd)
    master(rsp)
  }
}

// ================ next level ports as master ==============
case class ICacheNextLevelCmd(p : ICacheConfig) extends Bundle{
  val addr = UInt(p.addressWidth bits)
  val len  = UInt(4 bits)
  val size = UInt(3 bits)
}
case class ICacheNextLevelRsp(p : ICacheConfig) extends Bundle{
  val data = Bits(p.busDataWidth bits)
}
case class ICacheNextLevelPorts(p : ICacheConfig) extends Bundle with IMasterSlave{
  val cmd = Stream(ICacheNextLevelCmd(p))
  val rsp = Flow(ICacheNextLevelRsp(p))

  override def asMaster(): Unit = {
    master(cmd)
    slave(rsp)
  }
}

// ==================== IQ ========================
case class EnQueue(ROB_AW: Int, OP_WIDTH: Int) extends Bundle {
  val rd_addr = UInt(ROB_AW bits)
  val src1_addr = UInt(ROB_AW bits)
  val src2_addr = UInt(ROB_AW bits)
  val micro_op = Bits(OP_WIDTH bits)
  val src1_valid = Bool()
  val src2_valid = Bool()
  val src1_val   = Bits(64 bits)
  val src2_val   = Bits(64 bits)
  val imm_val    = Bits(64 bits)
}

case class DeQueue(ROB_AW: Int, OP_WIDTH: Int) extends Bundle {
  val rd_addr = UInt(ROB_AW bits)
  val src1_addr = UInt(ROB_AW bits)
  val src2_addr = UInt(ROB_AW bits)
  val micro_op = Bits(OP_WIDTH bits)
  val src1_val   = Bits(64 bits)
  val src2_val   = Bits(64 bits)
  val imm_val    = Bits(64 bits)
}


// ========================= ROB =======================
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