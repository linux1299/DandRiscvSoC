package dandriscv.ip

import dandriscv.plugin._
import dandriscv._
import spinal.core._
import spinal.lib._
import math._

case class ICacheConfig(cacheSize : Int,
                        bytePerLine : Int,
                        wayCount : Int,
                        addressWidth : Int,
                        cpuDataWidth : Int,
                        bankWidth : Int,
                        busDataWidth : Int){

  def burstSize = bytePerLine*8/bankWidth  
  def bankDepth = cacheSize/wayCount/bankWidth
  def offsetWidth = log(bytePerLine)
  def offsetRange = (offsetWidth-1) downto 0
  def setWidth = offsetRange
  def setRange = (offsetWidth+setWidth-1) downto offsetWidth
  def tagRange = (addressWidth-1) downto (offsetWidth+setWidth)
  def bankNum = wayCount
  def bankAddrWidth = log2Up(bankDepth)
  def lineCount = cacheSize/bytePerLine
  def wayLineConut = lineCount/wayCount
}

// ================= sram ports as master================
case class ICacheSramCmd(p : ICacheConfig) extends Bundle{
  val addr = UInt(p.bankAddrWidth bit)
  val cen = Bool()
  val wen = Bool()
}
case class ICacheSramRsp(p : ICacheConfig) extends Bundle{
  val data = Bits(p.bankWidth bit)
}
case class ICacheSramPorts(p : ICacheConfig) extends Bundle{
  val cmd = Stream(ICacheSramCmd(p))
  val rsp = Flow(ICacheSramRsp(p))

  override asMaster(): Unit = {
    master(cmd)
    slave(rsp)
  }
}

// ================ cpu ports as slave ==============
case class ICacheCpuCmd(p : ICacheConfig) extends Bundle{
  val addr = UInt(p.addressWidth bit)
  val cen = Bool()
}
case class ICacheCpuRsp(p : ICacheConfig) extends Bundle{
  val data = Bits(p.cpuDataWidth bit)
}
case class ICacheCpuPorts(p : ICacheConfig) extends Bundle{
  val cmd = Stream(ICacheCpuCmd(p))
  val rsp = Flow(ICacheCpuRsp(p))

  override asMaster(): Unit = {
    slave(cmd)
    master(rsp)
  }
}

// ================ next level ports as master ==============
case class ICacheNextLevelCmd(p : ICacheConfig) extends Bundle{
  val addr = UInt(p.addressWidth bit)
  val valid = Bool()
}
case class ICacheNextLevelRsp(p : ICacheConfig) extends Bundle{
  val data = Bits(p.busDataWidth bit)
}
case class ICacheNextLevelPorts(p : ICacheConfig) extends Bundle{
  val cmd = Stream(ICacheNextLevelCmd(p))
  val rsp = Flow(ICacheNextLevelRsp(p))

  override asMaster(): Unit = {
    master(cmd)
    slave(rsp)
  }
}

case class ICache(p : ICacheConfig) extends Component{
  import p._
  val io = new Bundle{
    val flush = in Bool()
    val cpu = slave(ICacheCpuPorts(p))
    val sram = master(ICacheSramPorts(p))
    val next_level = master(ICacheNextLevelPorts(p))
  }

  case class LineMeta() extends Bundle{
    val valid = Bool
    val tag = Bool
    val replace_info = Bits(wayCount bits)
  }

  val ways = Seq.fill(wayCount)(new Area{
    val metas = Mem(LineMeta(), wayLineConut)
    metas.initBigInt(List.fill(wayLineCount)(BigInt(0)))
  })


}