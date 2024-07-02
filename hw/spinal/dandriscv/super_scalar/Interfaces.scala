package dandriscv.super_scalar

import spinal.core._
import spinal.lib._
import math._
import CpuConfig._

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

// ========================= Fetch =======================
case class FetchDst() extends Bundle {
  val pc = UInt(PC_WIDTH bits)
  val pc_next = UInt(PC_WIDTH bits)
  val instruction = Bits(32 bits)
  val predict_taken = Bool()
}

// ==================== IQ ========================
case class IQ_MicroOp(IQ_Type: String) extends Bundle {

  // common
  val rd_wen = Bool()
  val src2_is_imm = Bool()

  // alu
  val alu_ctrl_op     = (IQ_Type == "ALU") generate AluCtrlEnum()
  val alu_is_word     = (IQ_Type == "ALU") generate Bool()
  // bju
  val bju_ctrl_op = (IQ_Type == "BJU") generate BjuCtrlEnum()
  val exp_ctrl_op = (IQ_Type == "BJU") generate ExpCtrlEnum()
  val bju_rd_eq_rs1 = (IQ_Type == "BJU") generate Bool()
  val bju_rd_is_link = (IQ_Type == "BJU") generate Bool()
  val bju_rs1_is_link = (IQ_Type == "BJU") generate Bool()
  // lsu
  val lsu_ctrl_op  = (IQ_Type == "LSU") generate LsuCtrlEnum()
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
  val src1_val = Bits(64 bits)
  val src2_val = Bits(64 bits)
  val imm_val  = Bits(64 bits)
}



case class DeQueue(ROB_AW: Int, IQ_Type: String) extends Bundle {
  val rd_addr = UInt(ROB_AW bits)
  val src1_addr = UInt(ROB_AW bits)
  val src2_addr = UInt(ROB_AW bits)
  val micro_op = IQ_MicroOp(IQ_Type)
  val src1_val   = Bits(64 bits)
  val src2_val   = Bits(64 bits)
  val imm_val    = (IQ_Type != "ALU") generate Bits(64 bits)
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
  val micro_op = IQ_MicroOp("ALU")
  val rd_wen = Bool()
  val rd_rob_ptr = UInt(ROB_PTR_W bits)
}

case class AluDst() extends Bundle {
  val result = Bits(64 bits)
  val rd_wen = Bool()
  val rd_rob_ptr = UInt(ROB_PTR_W bits)
}

// ========================= LSU =======================
case class LsuSrc() extends Bundle {
  val src1 = Bits(64 bits)
  val src2 = Bits(64 bits)
  val imm  = Bits(64 bits)
  val micro_op = IQ_MicroOp("LSU")
  val rd_wen = Bool()
  val rd_rob_ptr = UInt(ROB_PTR_W bits)
}

case class LsuDst() extends Bundle {
  val result = Bits(64 bits)
  val rd_wen = Bool()
  val rd_rob_ptr = UInt(ROB_PTR_W bits)
}

// ================ Dcache next level ports ==============
case class DCacheNextLevelCmd(p : DCacheConfig) extends Bundle{
  val addr = UInt(p.addressWidth bits)
  val len  = UInt(4 bits)
  val size = UInt(3 bits)
  val wen  = Bool()
  val wdata= Bits(p.busDataWidth bits)
  val wstrb= Bits(p.busDataWidth/8 bits)
}
case class DCacheNextLevelRsp(p : DCacheConfig) extends Bundle{
  val data = Bits(p.busDataWidth bits)
  val bresp= Bits(2 bits)
  val rvalid = Bool()
}
case class DCacheNextLevelPorts(p : DCacheConfig) extends Bundle with IMasterSlave{
  val cmd = Stream(DCacheNextLevelCmd(p))
  val rsp = Flow(DCacheNextLevelRsp(p))

  override def asMaster(): Unit = {
    master(cmd)
    slave(rsp)
  }
}

// ================ cpu and dcache ports ===============
case class DCacheAccessCmd(AW: Int, DW: Int) extends Bundle {
  val addr = UInt(AW bits)
  val wen  = Bool()
  val wdata= Bits(DW bits)
  val wstrb= Bits(DW/8 bits)
  val size = UInt(3 bits)
}
case class DCacheAccessRsp(DW: Int) extends Bundle {
  val data = Bits(DW bits)
}
case class DCacheAccess(AW: Int, DW: Int) extends Bundle with IMasterSlave{
  val cmd = Stream(DCacheAccessCmd(AW, DW))
  val rsp = Flow(DCacheAccessRsp(DW))
  val stall = Bool()
  override def asMaster(): Unit = {
    master(cmd)
    slave(rsp)
  }
  override def asSlave(): Unit = {
    slave(cmd)
    master(rsp)
  }
}