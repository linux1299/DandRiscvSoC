package dandriscv.ip

import dandriscv.plugin._
import dandriscv._
import spinal.core._
import spinal.lib._
import scala.math._

// ================= sram ports as master================
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

case class SramBanks(syncRead: Boolean, wayNum: Int = 2, bankNum : Int = 2, bankWidth : Int = 64, bankDepthBits : Int = 6) extends Component{

  val wordCount = pow(2, bankDepthBits.toDouble).toInt
  val sram = for(i<-0 until wayNum) yield new Area{
    val ports = slave(SramPorts(bankNum, bankDepthBits, bankWidth))

    val banks = for(j<-0 until bankNum) yield new Area{
      val bank = Mem(Bits(bankWidth bits), wordCount)

      bank.write(
        enable  = ports.cmd.valid && ports.cmd.payload.wen(j),
        address = ports.cmd.payload.addr,
        data    = ports.cmd.payload.wdata((j+1)*bankWidth-1 downto j*bankWidth),
        mask    = ports.cmd.payload.wstrb((j+1)*bankWidth/8-1 downto j*bankWidth/8)
      )

      if(syncRead){
        ports.rsp.data((j+1)*bankWidth-1 downto j*bankWidth) := bank.readSync(
        enable  = ports.cmd.valid,
        address = ports.cmd.payload.addr
      )
      }
      else{
        ports.rsp.data((j+1)*bankWidth-1 downto j*bankWidth) := bank.readAsync(
        address = ports.cmd.payload.addr
      )
      }
      
    }

    if (syncRead){
      val rsp_valid = RegInit(False)
      when(ports.cmd.valid && ports.cmd.payload.wen===B(0, bankNum bits)){
        rsp_valid := True
      }.otherwise{
        rsp_valid := False
      }
      ports.rsp.valid := rsp_valid
    }
    else{
      val rsp_valid = Bool()
      when(ports.cmd.valid && ports.cmd.payload.wen===B(0, bankNum bits)){
        rsp_valid := True
      }.otherwise{
        rsp_valid := False
      }
      ports.rsp.valid := rsp_valid
    }
    
    
  }
}
