package dandriscv.super_scalar

import spinal.core._
import spinal.lib._
import math._

// ================ ICache ===============
// cpu and icache ports
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
// next level ports as master
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
// sram ports as master
case class SramCmd(bankNum : Int, bankDepthBits : Int, bankWidth : Int) extends Bundle{
  val addr = UInt(bankDepthBits bits)
  val wen = Bits(bankNum bits)
  val wdata = Bits(bankNum*bankWidth bits)
  val wstrb = Bits(bankNum*bankWidth/8 bits)
}
case class SramRsp(bankNum : Int, bankWidth : Int) extends Bundle{
  val data = Bits(bankNum*bankWidth bits)
}
case class SramPorts(bankNum : Int, bankDepthBits : Int, bankWidth : Int) extends Bundle with IMasterSlave{
  val cmd = Flow(SramCmd(bankNum, bankDepthBits, bankWidth))
  val rsp = Flow(SramRsp(bankNum, bankWidth))

  override def asMaster(): Unit = {
    master(cmd)
    slave(rsp)
  }

  override def asSlave(): Unit = {
    master(rsp)
    slave(cmd)
  }
}

// ==================== IQ ========================
case class IQ_MicroOp(IQ_Type: String) extends Bundle {
  val alu_micro_op    = (IQ_Type == "ALU") generate AluMicroOp()
  val alu_is_word     = (IQ_Type == "ALU") generate Bool()
  val alu_src2_is_imm = (IQ_Type == "ALU") generate Bool()

  val bju_micro_op = (IQ_Type == "BJU") generate BjuMicroOp()
  val exp_micro_op = (IQ_Type == "BJU") generate ExpMicroOp()

  val lsu_micro_op = (IQ_Type == "LSU") generate LsuMicroOp()
  val lsu_is_load  = (IQ_Type == "LSU") generate Bool()
  val lsu_is_store = (IQ_Type == "LSU") generate Bool()

  
}

case class EnQueue(ROB_AW: Int, IQ_Type: String) extends Bundle {
  val rd_addr = UInt(ROB_AW bits)
  val src1_addr = UInt(ROB_AW bits)
  val src2_addr = UInt(ROB_AW bits)
  val micro_op = IQ_MicroOp(IQ_Type)
  val src1_vld = Bool()
  val src2_vld = Bool()
  val src1_val   = Bits(64 bits)
  val src2_val   = Bits(64 bits)
  val imm_val    = Bits(64 bits)
}



case class DeQueue(ROB_AW: Int, IQ_Type: String) extends Bundle {
  val rd_addr = UInt(ROB_AW bits)
  val src1_addr = UInt(ROB_AW bits)
  val src2_addr = UInt(ROB_AW bits)
  val micro_op = IQ_MicroOp(IQ_Type)
  val src1_val   = Bits(64 bits)
  val src2_val   = Bits(64 bits)
  val imm_val    = Bits(64 bits)
}


// ========================= ROB =======================
case class EnROB(PC_WIDTH: Int) extends Bundle {
  val pc = UInt(PC_WIDTH bits)
  val micro_op = RobMicroOp()
  val rd_addr = UInt(5 bits)
  val rd_val = Bits(64 bits)
  val exception = ExceptionEnum()
}

case class DeROB() extends Bundle {
  val rd_addr = UInt(5 bits)
  val rd_val = Bits(64 bits)
}

// ========================= ALU =======================
case class AluSrc() extends Bundle {
  val src1 = Bits(64 bits)
  val src2 = Bits(64 bits)
  val imm  = Bits(64 bits)
  val micro_op = IQ_MicroOp("ALU")
}

case class AluDst() extends Bundle {
  val result = Bits(64 bits)
}