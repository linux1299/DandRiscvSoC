package dandriscv.super_scalar

import spinal.core._
import spinal.lib._
import scala.math._


case class Sram(bankWidth : Int = 64, bankDepthBits : Int = 6) extends Component{

  val wordCount = pow(2, bankDepthBits.toDouble).toInt
  val ports = slave(SramPorts(bankDepthBits, bankWidth))
  val mem = Mem(Bits(bankWidth bits), wordCount)

  mem.write(
    enable  = ports.cmd.valid && ports.cmd.wen,
    address = ports.cmd.addr,
    data    = ports.cmd.wdata,
    mask    = ports.cmd.wstrb
  )

  ports.rsp.data := mem.readSync(
    enable  = ports.cmd.valid,
    address = ports.cmd.addr
  )

  val rsp_valid = RegInit(False)
  when(ports.cmd.valid && !ports.cmd.wen){
    rsp_valid := True
  }.otherwise{
    rsp_valid := False
  }
  ports.rsp.valid := rsp_valid


}