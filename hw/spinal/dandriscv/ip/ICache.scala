package dandriscv.ip

import dandriscv.plugin._
import dandriscv.plugin_simple._
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
  def busBurstLen = bytePerLine*8/busDataWidth
  def busDataSize = log2Up(busDataWidth/8)
  def bankNum = bytePerLine/(bankWidth/8)
  def bankDepth = cacheSize*8/wayCount/bankNum/bankWidth
  def bankDepthBits = log2Up(bankDepth)
  def offsetWidth = log2Up(bytePerLine)
  def setWidth = log2Up(wayLineCount)
  def tagWidth = addressWidth-setWidth-offsetWidth
  def cpuDataBytesWidth = log2Up(cpuDataWidth/8)
  def lineBusDataNum = bytePerLine/(bankWidth/8) 
  def bankWriteBits = bankNum/lineBusDataNum
  // range
  def offsetRange = (offsetWidth-1) downto 0
  def setRange = (offsetWidth+setWidth-1) downto offsetWidth
  def tagRange = (addressWidth-1) downto (offsetWidth+setWidth)
  def bankAddrRange  = (bankDepthBits+offsetWidth-1) downto offsetWidth
  def bankIndexRange = (offsetWidth-1) downto cpuDataBytesWidth
  def nextLevelBankAddrRange = bankAddrRange
  def cpuDataOnBusRange = (busDataSize-1) downto (log2Up(cpuDataBytesWidth))

  assert(wayCount>=2)
  assert(bankWidth==cpuDataWidth)
  assert(busDataWidth/bankWidth>=2 && busDataWidth%bankWidth==0)
  assert(bytePerLine*8/busDataWidth>=2 && (bytePerLine*8)%busDataWidth==0)
  
}

// ==================== CACHE =============================
case class ICache(p : ICacheConfig) extends Component{
  import p._

  val flush = in Bool()
  val cpu = slave(ICacheAccess(addressWidth, cpuDataWidth))
  val sram = for(i<-0 until bankNum) yield new Area{
    val ports = master(SramPorts(bankNum, bankDepthBits, bankWidth))
  }
  val next_level = master(ICacheNextLevelPorts(p))

  case class LineMeta() extends Bundle{
    val valid = Reg(Bool()) init(False)
    val tag = Reg(UInt(tagWidth bits)) init(0)
    val replace_info = Reg(Bool()) init(False)
  }

  val ways = Seq.fill(wayCount)(new Area{
    val metas = Vec(LineMeta(), wayLineCount)
  })

  // cache related
  val cache_tag = Vec(UInt(tagWidth bits), wayCount)
  val cache_hit = Vec(Bool(), wayCount)
  val cache_victim = Vec(Bool(), wayCount)
  val cache_replace_info = Vec(Bool(), wayCount)
  val hit_way_id = UInt(log2Up(wayCount) bits)
  val victim_id  = UInt(log2Up(wayCount) bits)
  val replace_info_full = cache_replace_info.asBits.andR
  val is_hit = cache_hit.asBits.orR & cpu.cmd.fire
  val is_miss= !cache_hit.asBits.orR & cpu.cmd.fire
  val flush_busy = RegInit(False)
  val flush_cnt  = Counter(0 to wayLineCount-1)
  val flush_done = flush_busy && flush_cnt===(wayLineCount-1)

  // cpu related
  val cpu_tag = cpu.cmd.addr(tagRange)
  val cpu_set = cpu.cmd.addr(setRange)
  val cpu_bank_addr   = cpu.cmd.addr(bankAddrRange)
  val cpu_bank_index  = cpu.cmd.addr(bankIndexRange)
  val cpu_addr_d1     = RegNextWhen(cpu.cmd.addr, is_miss) init(0)
  val cpu_set_d1      = cpu_addr_d1(setRange)
  val cpu_tag_d1      = cpu_addr_d1(tagRange)
  val cpu_bank_addr_d1= cpu_addr_d1(bankAddrRange)
  val cpu_bank_index_d1 = cpu_addr_d1(bankIndexRange)
  val cpu_cmd_ready   = RegInit(True)

  // sram related
  val sram_banks_data = Vec(Bits(bankNum*bankWidth bits), wayCount)
  val sram_banks_valid = Vec(Bool(), wayCount)

  // next level related
  val next_level_cmd_valid = RegInit(False)
  val next_level_data_cnt = Counter(0 to lineBusDataNum-1)
  val next_level_bank_addr= cpu_addr_d1(nextLevelBankAddrRange)
  val next_level_done = RegNext(next_level.rsp.valid && next_level_data_cnt===(lineBusDataNum-1))

  when(is_miss){
    next_level_cmd_valid := True
  }
  .elsewhen(next_level.cmd.fire){
    next_level_cmd_valid := False
  }

  when(is_miss){
    next_level_data_cnt.clear()
  }
  .elsewhen(next_level_done){
    next_level_data_cnt.clear()
  }
  .elsewhen(next_level.rsp.valid){
    next_level_data_cnt.increment()
  }

  // flush
  when(flush){
    flush_busy := True
  }
  .elsewhen(flush_done){
    flush_busy := False
  }

  when(flush_busy && flush_cnt===(wayLineCount-1)){
    flush_cnt.clear()
  }
  .elsewhen(flush_busy){
    flush_cnt.increment()
  }
  

  // read metas to decide cache hit, acccess sram, update replace_info
  hit_way_id := OHToUInt(cache_hit)
  victim_id  := OHToUInt(cache_victim)
  for(wayId <- 0 until wayCount){

    cache_tag(wayId) := ways(wayId).metas(cpu_set).tag
    cache_hit(wayId) := (cache_tag(wayId) === cpu_tag) & ways(wayId).metas(cpu_set).valid
    cache_replace_info(wayId) := ways(wayId).metas(cpu_set).replace_info
    // replace logic
    if(wayId==0){
      cache_victim(0) := !ways(0).metas(cpu_set_d1).valid
    }
    else{
      when(cache_victim(wayId-1)){
        cache_victim(wayId) := False
      }.otherwise{
        cache_victim(wayId) := !ways(wayId).metas(cpu_set_d1).valid
      }
    }

    // sram
    sram_banks_data(wayId) := sram(wayId).ports.rsp.payload.data
    sram_banks_valid(wayId):= sram(wayId).ports.rsp.valid
    when(is_hit){
      sram(wayId).ports.cmd.payload.addr := cpu_bank_addr
      sram(wayId).ports.cmd.valid        := cache_hit(wayId)
      sram(wayId).ports.cmd.payload.wen  := B(0, bankNum bits)
      sram(wayId).ports.cmd.payload.wdata:= B(0, bankNum*bankWidth bits)
      sram(wayId).ports.cmd.payload.wstrb:= B(0, bankNum*bankWidth/8 bits)
    } 
    .elsewhen(next_level_done){ // when read next level data done, read data from cache
      sram(wayId).ports.cmd.payload.addr := cpu_bank_addr_d1
      sram(wayId).ports.cmd.valid        := cache_victim(wayId)
      sram(wayId).ports.cmd.payload.wen  := B(0, bankNum bits)
      sram(wayId).ports.cmd.payload.wdata:= B(0, bankNum*bankWidth bits)
      sram(wayId).ports.cmd.payload.wstrb:= B(0, bankNum*bankWidth/8 bits)
    }
    .elsewhen(next_level.rsp.valid){ // when read miss, read next level data, write to banks
      sram(wayId).ports.cmd.payload.addr := next_level_bank_addr
      sram(wayId).ports.cmd.valid        := True
      sram(wayId).ports.cmd.payload.wen  := B(bankNum bits, (bankWriteBits-1 downto 0) -> True, default -> False) |<< (next_level_data_cnt*bankWriteBits)
      sram(wayId).ports.cmd.payload.wdata:= (B(0, bankNum*bankWidth-busDataWidth bits) ## next_level.rsp.data) |<< (next_level_data_cnt*busDataWidth)
      sram(wayId).ports.cmd.payload.wstrb:= (B(0, bankNum*bankWidth/8-busDataWidth/8 bits) ## B(busDataWidth/8 bits, default -> True)) |<< (next_level_data_cnt*busDataWidth/8)
    }
    .otherwise {
      sram(wayId).ports.cmd.payload.addr := U(0, bankDepthBits bits)
      sram(wayId).ports.cmd.valid        := False
      sram(wayId).ports.cmd.payload.wen  := B(0, bankNum bits)
      sram(wayId).ports.cmd.payload.wdata:= B(0, bankNum*bankWidth bits)
      sram(wayId).ports.cmd.payload.wstrb:= B(0, bankNum*bankWidth/8 bits)
    }

    // metas
    when(flush){
      ways(wayId).metas(flush_cnt).replace_info := False
      ways(wayId).metas(flush_cnt).valid := False
    }.otherwise{
      when(is_hit && replace_info_full){
        when(cache_hit(wayId)) {
          ways(wayId).metas(cpu_set).replace_info := True
        } .otherwise {
          ways(wayId).metas(cpu_set).replace_info := False
        }
      }.elsewhen(is_hit){
        when(cache_hit(wayId)) {
          ways(wayId).metas(cpu_set).replace_info := True
        }
      }.elsewhen(next_level.rsp.valid){
        when(cache_victim(wayId)) {
          ways(wayId).metas(cpu_set_d1).valid := True
        }
      }
    }
    // tags
    when(next_level_done){
      ways(wayId).metas(cpu_set_d1).tag := cpu_tag_d1
    }
    // to cpu ready
    when(flush || is_miss){
      cpu_cmd_ready := False
    }
    .elsewhen(flush_done || next_level_done){
      cpu_cmd_ready := True
    }
  }

  // resp to cpu ports
  cpu.rsp.payload.data := is_hit ? sram_banks_data(hit_way_id).subdivideIn(cpuDataWidth bits)(cpu_bank_index) | sram_banks_data(victim_id).subdivideIn(cpuDataWidth bits)(cpu_bank_index_d1)
  cpu.rsp.valid := is_hit ? sram_banks_valid(hit_way_id) | sram_banks_valid(victim_id)
  cpu.cmd.ready := cpu_cmd_ready

  // cmd to next level cache
  next_level.cmd.payload.addr := (cpu_addr_d1(addressWidth-1 downto busDataSize) ## U(0, busDataSize bits)).asUInt
  next_level.cmd.payload.len  := busBurstLen
  next_level.cmd.payload.size := busDataSize
  next_level.cmd.valid := next_level_cmd_valid

}

  
