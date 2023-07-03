package dandriscv.ip

import dandriscv.plugin._
import dandriscv._
import spinal.core._
import spinal.lib._
import scala.math._

// ================= sram ports as master================
case class SramCmd(bankDepthBits : Int, bankWidth : Int) extends Bundle{
  val addr = UInt(bankDepthBits bits)
  val wen = Bool()
  val wdata = Bits(bankWidth bits)
}
case class SramRsp(bankWidth : Int) extends Bundle{
  val data = Bits(bankWidth bits)
}
case class SramPorts(bankDepthBits : Int, bankWidth : Int) extends Bundle with IMasterSlave{
  val cmd = Flow(SramCmd(bankDepthBits, bankWidth))
  val rsp = Flow(SramRsp(bankWidth))

  override def asMaster(): Unit = {
    master(cmd)
    slave(rsp)
  }

  override def asSlave(): Unit = {
    master(rsp)
    slave(cmd)
  }
}

case class SramBanks(bankNum : Int = 1, bankWidth : Int = 64, bankDepthBits : Int = 6) extends Component{

  val wordCount = pow(2, bankDepthBits.toDouble).toInt
  val sram = for(i<-0 until bankNum) yield new Area{
    val ports = slave(SramPorts(bankDepthBits, bankWidth))
    val banks = Mem(Bits(bankWidth bits), wordCount)

    banks.write(
      enable  = ports.cmd.valid,
      address = ports.cmd.addr,
      data    = ports.cmd.wdata
    )

    ports.rsp.data := banks.readSync(
      enable  = ports.cmd.valid,
      address = ports.cmd.addr
    )

    val rsp_valid = RegInit(False)
    when(ports.cmd.valid){
      rsp_valid := True
    }.otherwise{
      rsp_valid := False
    }
    ports.rsp.valid := rsp_valid
  }
}
