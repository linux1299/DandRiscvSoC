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

  def lineCount = cacheSize/bytePerLine
  def wayLineCount = lineCount/wayCount
  def busBurstSize = bytePerLine*8/busDataWidth
  def bankDepth = cacheSize/wayCount/bankWidth
  def bankDepthBits = log2Up(bankDepth)
  def offsetWidth = log2Up(bytePerLine)
  def offsetRange = (offsetWidth-1) downto 0
  def setWidth = log2Up(wayLineCount)
  def setRange = (offsetWidth+setWidth-1) downto offsetWidth
  def tagWidth = addressWidth-setWidth-offsetWidth
  def tagRange = (addressWidth-1) downto (offsetWidth+setWidth)
  def bankNum = wayCount
  def bankOffset = log2Up(bankWidth/8)
  def bankOffsetRange = (bankOffset-1) downto 0
  def bankAddrRange  = (bankDepthBits+bankOffset-1) downto bankOffset
  def cpuDataBytesWidth = log2Up(cpuDataWidth/8)
  def bankDataSelRange = (bankOffset-1) downto cpuDataBytesWidth
  
}

// ================= sram ports as master================
case class ICacheSramCmd(p : ICacheConfig) extends Bundle{
  val addr = UInt(p.bankDepthBits bit)
  val wen = Bool()
}
case class ICacheSramRsp(p : ICacheConfig) extends Bundle{
  val data = Bits(p.bankWidth bit)
}
case class ICacheSramPorts(p : ICacheConfig) extends Bundle with IMasterSlave{
  val cmd = Flow(ICacheSramCmd(p))
  val rsp = Flow(ICacheSramRsp(p))

  override def asMaster(): Unit = {
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
case class ICacheCpuPorts(p : ICacheConfig) extends Bundle with IMasterSlave{
  val cmd = Stream(ICacheCpuCmd(p))
  val rsp = Flow(ICacheCpuRsp(p))

  override def asMaster(): Unit = {
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
case class ICacheNextLevelPorts(p : ICacheConfig) extends Bundle with IMasterSlave{
  val cmd = Stream(ICacheNextLevelCmd(p))
  val rsp = Flow(ICacheNextLevelRsp(p))

  override def asMaster(): Unit = {
    master(cmd)
    slave(rsp)
  }
}

case class ICache(p : ICacheConfig) extends Component{
  import p._

  val flush = in Bool()
  val cpu = slave(ICacheCpuPorts(p))
  val sram = for(i<-0 until bankNum) yield new Area{
    val ports = master(ICacheSramPorts(p))
  }
  val next_level = master(ICacheNextLevelPorts(p))

  case class LineMeta() extends Bundle{
    val valid = Bool
    val tag = UInt(tagWidth bits)
    val replace_info = Bool()
  }

  val ways = Seq.fill(wayCount)(new Area{
    val metas = Mem(LineMeta(), wayLineCount)
    metas.initBigInt(List.fill(wayLineCount)(BigInt(0)))
  })

  val cpu_tag = cpu.cmd.addr(tagRange)
  val cpu_set = cpu.cmd.addr(setRange)
  val cpu_bank_offset = cpu.cmd.addr(bankOffsetRange)
  val cpu_bank_addr   = cpu.cmd.addr(bankAddrRange)
  val cpu_bank_sel    = cpu.cmd.addr(bankDataSelRange)

  val icache_tag = Vec(UInt(tagWidth bits), wayCount)
  val icache_hit = Vec(Bool(), wayCount)
  val icache_replace_info = Vec(Bool(), wayCount)

  var hitWayId = 0
  val replaceWayId = 0
  val replace_info_full = icache_replace_info.asBits.andR
  val is_hit = icache_hit.asBits.orR & cpu.cmd.fire
  val is_miss= !icache_hit.asBits.orR & cpu.cmd.fire
  val sram_to_cpu_data = sram(hitWayId).ports.rsp.payload.data.subdivideIn(cpuDataWidth bits)(cpu_bank_sel)
  

  // read metas to decide cache hit, acccess sram, update replace_info
  for(wayId <- 0 until wayCount){
    icache_tag(wayId) := ways(wayId).metas(cpu_set).tag
    icache_hit(wayId) := (icache_tag(wayId) === cpu_tag) & ways(wayId).metas(cpu_set).valid
    icache_replace_info(wayId) := ways(wayId).metas(cpu_set).replace_info
    when(icache_hit(wayId)){
      hitWayId = wayId
    }

    when(is_hit){
      sram(wayId).ports.cmd.payload.addr := icache_hit(wayId) ? cpu_bank_addr | U(0, bankDepthBits bits)
      sram(wayId).ports.cmd.valid        := icache_hit(wayId) & cpu.cmd.fire
      sram(wayId).ports.cmd.payload.wen  := False
    } 
    .elsewhen(next_level.rsp.valid){
      sram(wayId).ports.cmd.payload.addr := cpu_bank_addr
      sram(wayId).ports.cmd.valid        := True
      sram(wayId).ports.cmd.payload.wen  := True
    } .otherwise {
      sram(wayId).ports.cmd.payload.addr := U(0, bankDepthBits bits)
      sram(wayId).ports.cmd.valid        := False
      sram(wayId).ports.cmd.payload.wen  := False
    }

    when(is_hit && replace_info_full){
      if(wayId==hitWayId)
        ways(wayId).metas(cpu_set).replace_info := True
      else 
        ways(wayId).metas(cpu_set).replace_info := False
    }
    .elsewhen(is_hit){
      ways(hitWayId).metas(cpu_set).replace_info := True
    }
  }

  // resp to cpu ports
  //cpu.rsp.payload.data := sram_to_cpu_data
  //cpu.rsp.valid := sram(hitWayId).ports.rsp.valid

  // cmd to next level cache
  next_level.cmd.payload.addr := cpu.cmd.addr
  next_level.cmd.valid := cpu.cmd.valid

}

  