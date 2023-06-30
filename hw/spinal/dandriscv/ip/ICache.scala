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

  def busBurstSize = bytePerLine*8/busDataWidth
  def bankDepth = cacheSize/wayCount/bankWidth
  def bankDepthBits = log2Up(bankDepth)
  def offsetWidth = log(bytePerLine)
  def offsetRange = (offsetWidth-1) downto 0
  def setWidth = offsetRange
  def setRange = (offsetWidth+setWidth-1) downto offsetWidth
  def tagWidth = addressWidth-setRange-offsetWidth
  def tagRange = (addressWidth-1) downto (offsetWidth+setWidth)
  def bankNum = wayCount
  def bankOffset = log2Up(bankWidth/8)
  def bankOffsetRange = (bankOffset-1) : 0
  def bankAddrRange  = (bankDepthBits+bankOffset-1) downto bankOffset
  def lineCount = cacheSize/bytePerLine
  def wayLineConut = lineCount/wayCount
}

// ================= sram ports as master================
case class ICacheSramCmd(p : ICacheConfig) extends Bundle{
  val addr = UInt(p.bankDepthBits bit)
  val wen = Bool()
}
case class ICacheSramRsp(p : ICacheConfig) extends Bundle{
  val data = Bits(p.bankWidth bit)
}
case class ICacheSramPorts(p : ICacheConfig) extends Bundle{
  val cmd = Flow(ICacheSramCmd(p))
  val rsp = Flow(ICacheSramRsp(p))

  override asMaster(): Unit = {
    master(cmd)
    slave(rsp)
  }
}

// ================ cpu ports as slave ==============
case class ICacheCpuCmd(p : ICacheConfig) extends Bundle{
  val addr = UInt(p.addressWidth bit)
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

  val flush = in Bool()
  val cpu = slave(ICacheCpuPorts(p))
  val sram = for(i<-0 until bankNum) yield new Area{
    master(ICacheSramPorts(p))
  }
  val next_level = master(ICacheNextLevelPorts(p))

  case class LineMeta() extends Bundle{
    val valid = Bool
    val tag = Bool
    val replace_info = Bits(wayCount bits)
  }

  val ways = Seq.fill(wayCount)(new Area{
    val metas = Mem(LineMeta(), wayLineConut)
    metas.initBigInt(List.fill(wayLineCount)(BigInt(0)))
  })

  val cpu_tag = cpu.cmd.addr(tagRange)

  val cpu_bank_offset = cpu.cmd.addr(bankOffsetRange)
  val cpu_bank_addr   = cpu.cmd.addr(bankAddrRange)
  val cpu_bank_sel    = cpu.cmd.addr

  val icache_tag = Vec(UInt(tagWidth bits), wayCount)
  val icache_hit = Vec(Bool(), wayCount)

  // read metas to decide cache hit, acccess sram
  for(wayId <- 0 until wayCount){
    icache_tag(wayId) := ways(wayId).metas.mem(cpu_set)
    icache_hit(wayId) := (icache_tag === cpu_tag) & cpu.cmd.valid
    sram(wayId).cmd.payload.addr := icache_hit(wayId) ? cpu_bank_addr : U(0, bankDepthBits bits)
    sram(wayId).cmd.valid        := icache_hit(wayId)
    sram(wayId).cmd.payload.wen  := False
  }

  // resp to cpu ports
  cpu.rsp.payload.data := sram(waySel).rsp.payload.data()
  cpu.rsp.valid := sram(waySel).rsp.valid

  // cmd to next level cache


  // write metas 


}