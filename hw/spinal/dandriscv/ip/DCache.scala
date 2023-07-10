package dandriscv.ip

import dandriscv.plugin._
import dandriscv.plugin_simple._
import dandriscv._
import spinal.core._
import spinal.lib._
import math._

case class DCacheConfig(cacheSize : Int,
                        bytePerLine : Int,
                        wayCount : Int,
                        addressWidth : Int,
                        cpuDataWidth : Int,
                        bankWidth : Int,
                        busDataWidth : Int){

  def lineCount = cacheSize/bytePerLine
  def wayLineCount = lineCount/wayCount
  def busBurstLen = bytePerLine*8/busDataWidth
  def bankDepth = cacheSize*8/wayCount/bankWidth
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
  def lineBusDataNum = bytePerLine/(bankWidth/8) 
  def nextLevelBankAddrRange = (bankDepthBits+bankOffset-1) downto (offsetWidth)
  
}

// ================ next level ports as master ==============
case class DCacheNextLevelCmd(p : DCacheConfig) extends Bundle{
  val addr = UInt(p.addressWidth bits)
  val len  = UInt(4 bits)
  val wen  = Bool()
  val wdata= Bits(p.busDataWidth bits)
  val wstrb= Bits(p.busDataWidth/8 bits)
  val size = UInt(3 bits)
}
case class DCacheNextLevelRsp(p : DCacheConfig) extends Bundle{
  val data = Bits(p.busDataWidth bits)
}
case class DCacheNextLevelPorts(p : DCacheConfig) extends Bundle with IMasterSlave{
  val cmd = Stream(DCacheNextLevelCmd(p))
  val rsp = Flow(DCacheNextLevelRsp(p))

  override def asMaster(): Unit = {
    master(cmd)
    slave(rsp)
  }
}

// ==================== DCache =============================
case class DCache(p : DCacheConfig) extends Component{
  import p._

  val flush = in Bool()
  val cpu = slave(DCacheAccess(addressWidth, cpuDataWidth))
  val sram = for(i<-0 until bankNum) yield new Area{
    val ports = master(SramPorts(bankDepthBits, bankWidth))
  }
  val next_level = master(DCacheNextLevelPorts(p))

  case class LineMeta() extends Bundle{
    val valid = Reg(Bool()) init(False)
    val tag = Reg(UInt(tagWidth bits)) init(0)
    val replace_info = Reg(Bool()) init(False)
  }

  val ways = Seq.fill(wayCount)(new Area{
    val metas = Vec(LineMeta(), wayLineCount)
  })

  // DCache related
  val dcache_tag = Vec(UInt(tagWidth bits), wayCount)
  val dcache_hit = Vec(Bool(), wayCount)
  val dcache_victim = Vec(Bool(), wayCount)
  val dcache_replace_info = Vec(Bool(), wayCount)
  val hit_way_id = UInt(log2Up(wayCount) bits)
  val replace_info_full = dcache_replace_info.asBits.andR
  val is_hit = dcache_hit.asBits.orR & cpu.cmd.fire
  val is_miss= !dcache_hit.asBits.orR & cpu.cmd.fire

  // cpu related
  val cpu_tag = cpu.cmd.addr(tagRange)
  val cpu_set = cpu.cmd.addr(setRange)
  val cpu_bank_offset = cpu.cmd.addr(bankOffsetRange)
  val cpu_bank_addr   = cpu.cmd.addr(bankAddrRange)
  val cpu_bank_sel    = cpu.cmd.addr(bankDataSelRange)
  val cpu_addr_d1     = RegNextWhen(cpu.cmd.addr, is_miss) init(0)
  val cpu_set_d1      = cpu_addr_d1(setRange)
  val cpu_tag_d1      = cpu_addr_d1(tagRange)
  val cpu_cmd_ready   = RegInit(True)

  // sram related
  val sram_banks_data = Vec(Bits(bankWidth bits), wayCount)
  val sram_banks_valid = Vec(Bool(), wayCount)

  // next level related
  val next_level_cmd_valid = RegInit(False)
  val next_level_data_cnt = Counter(0 to lineBusDataNum-1)
  val next_level_bank_addr= cpu_addr_d1(nextLevelBankAddrRange)
  when(is_miss){
    next_level_cmd_valid := True
  }.elsewhen(next_level.cmd.fire){
    next_level_cmd_valid := False
  }
  when(is_miss){
    next_level_data_cnt.clear()
  }.elsewhen(next_level.rsp.valid && next_level_data_cnt===(lineBusDataNum-1)){
    next_level_data_cnt.clear()
  }.elsewhen(next_level.rsp.valid){
    next_level_data_cnt.increment()
  }
  

  // read metas to decide cache hit, acccess sram, update replace_info
  hit_way_id := OHToUInt(dcache_hit)
  for(wayId <- 0 until wayCount){

    dcache_tag(wayId) := ways(wayId).metas(cpu_set).tag
    dcache_hit(wayId) := (dcache_tag(wayId) === cpu_tag) & ways(wayId).metas(cpu_set).valid
    dcache_replace_info(wayId) := ways(wayId).metas(cpu_set).replace_info
    // replace logic
    if(wayId==0){
      dcache_victim(wayId) := !ways(wayId).metas(cpu_set_d1).valid
    }
    else{
      when(dcache_victim(wayId-1)){
        dcache_victim(wayId) := False
      }.otherwise{
        dcache_victim(wayId) := !ways(wayId).metas(cpu_set_d1).valid
      }
    }

    // sram
    sram_banks_data(wayId) := sram(wayId).ports.rsp.payload.data
    sram_banks_valid(wayId):= sram(wayId).ports.rsp.valid
    when(is_hit){
      sram(wayId).ports.cmd.payload.addr := dcache_hit(wayId) ? cpu_bank_addr | U(0, bankDepthBits bits)
      sram(wayId).ports.cmd.valid        := dcache_hit(wayId) & cpu.cmd.fire
      sram(wayId).ports.cmd.payload.wen  := False
      sram(wayId).ports.cmd.payload.wdata:= B(0, bankWidth bits)
    } 
    .elsewhen(next_level.rsp.valid){
      sram(wayId).ports.cmd.payload.addr := (next_level_bank_addr ## next_level_data_cnt.value).asUInt
      sram(wayId).ports.cmd.valid        := True
      sram(wayId).ports.cmd.payload.wen  := True
      sram(wayId).ports.cmd.payload.wdata:= next_level.rsp.data
    } .otherwise {
      sram(wayId).ports.cmd.payload.addr := U(0, bankDepthBits bits)
      sram(wayId).ports.cmd.valid        := False
      sram(wayId).ports.cmd.payload.wen  := False
      sram(wayId).ports.cmd.payload.wdata:= B(0, bankWidth bits)
    }

    when(flush){
      ways(wayId).metas(cpu_set).replace_info := False
      ways(wayId).metas(cpu_set_d1).valid := False
    }.otherwise{
      when(is_hit && replace_info_full){
        when(dcache_hit(wayId)) {
          ways(wayId).metas(cpu_set).replace_info := True
        } .otherwise {
          ways(wayId).metas(cpu_set).replace_info := False
        }
      }.elsewhen(is_hit){
        when(dcache_hit(wayId)) {
          ways(wayId).metas(cpu_set).replace_info := True
        }
      }.elsewhen(next_level.rsp.valid){
        when(dcache_victim(wayId)) {
          ways(wayId).metas(cpu_set_d1).valid := True
        }
      }
    }

    when(next_level.rsp.valid && next_level_data_cnt===(lineBusDataNum-1)){
      ways(wayId).metas(cpu_set_d1).tag := cpu_tag_d1
    }

    when(flush){
      cpu_cmd_ready := False
    }.otherwise{
      when(is_miss){
        cpu_cmd_ready := False
      }.elsewhen(next_level.rsp.valid && next_level_data_cnt===(lineBusDataNum-1)){
        cpu_cmd_ready := True
      }
    }
  }

  // resp to cpu ports
  cpu.rsp.payload.data := sram_banks_data(hit_way_id).subdivideIn(cpuDataWidth bits)(cpu_bank_sel)
  cpu.rsp.valid := sram_banks_valid(hit_way_id)
  cpu.cmd.ready := cpu_cmd_ready

  // cmd to next level cache
  next_level.cmd.payload.addr := cpu_addr_d1
  next_level.cmd.payload.len  := busBurstLen
  next_level.cmd.valid := next_level_cmd_valid

}

  
