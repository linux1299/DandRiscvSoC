package dandriscv.super_scalar

import spinal.core._
import spinal.lib._
import math._

// ==================== CACHE =============================
case class ICache(p : ICacheConfig) extends Component{
  import p._

  val flush = in Bool()
  val cpu = slave(ICacheAccess(addressWidth, cpuDataWidth))
  val sram = for(i<-0 until wayCount) yield new Area{
    val ports = master(SramPorts(bankNum, bankDepthBits, bankWidth))
  }
  val next_level = master(ICacheNextLevelPorts(p))

  case class LineMeta() extends Bundle{
    val vld = Reg(Bool()) init(False)
    val tag = Reg(UInt(tagWidth bits)) init(0)
    val mru = Reg(Bool()) init(False)
  }

  val ways = Seq.fill(wayCount)(new Area{
    val metas = Vec(LineMeta(), wayLineCount)
  })

  // cache related
  val cache_tag = Vec(UInt(tagWidth bits), wayCount)
  val cache_hit = Vec(Bool(), wayCount)
  val cache_invld_d1 = Vec(Bool(), wayCount)
  val cache_victim = Vec(Bool(), wayCount)
  val cache_mru = Vec(Bool(), wayCount)
  val cache_lru_d1 = Vec(Bool(), wayCount)
  val hit_id = UInt(log2Up(wayCount) bits)
  val hit_id_d1 = RegNext(hit_id)
  val evict_id  = UInt(log2Up(wayCount) bits)
  val evict_id_d1 = RegNext(evict_id)
  val invld_id  = UInt(log2Up(wayCount) bits)
  val victim_id  = UInt(log2Up(wayCount) bits)
  val mru_full = cache_mru.asBits.andR
  val is_hit = cache_hit.asBits.orR & cpu.cmd.fire
  val is_hit_d1 = RegNext(is_hit)
  val is_miss= !cache_hit.asBits.orR & cpu.cmd.fire
  val is_diff = !cache_victim.asBits.orR
  val flush_busy = RegInit(False)
  val flush_cnt  = Counter(0 to wayLineCount-1)
  val flush_done = flush_busy && flush_cnt===(wayLineCount-1)

  // cpu related
  val cpu_tag = cpu.cmd.addr(tagRange)
  val cpu_set = cpu.cmd.addr(setRange)
  val cpu_bank_addr   = cpu.cmd.addr(bankAddrRange)
  val cpu_bank_index  = cpu.cmd.addr(bankIndexRange)
  val cpu_addr_d1     = RegNextWhen(cpu.cmd.addr, cpu.cmd.fire) init(0)
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
  val bankAddrRange= cpu_addr_d1(nextLevelBankAddrRange)
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
  

  // read metas to decide cache hit, acccess sram, update mru
  hit_id    := OHToUInt(cache_hit)
  invld_id  := OHToUInt(cache_invld_d1)
  victim_id := OHToUInt(cache_victim)
  evict_id  := is_diff ? invld_id | victim_id

  for(wayId <- 0 until wayCount){

    cache_tag(wayId) := ways(wayId).metas(cpu_set).tag
    cache_hit(wayId) := (cache_tag(wayId) === cpu_tag) & ways(wayId).metas(cpu_set).vld
    cache_mru(wayId) := ways(wayId).metas(cpu_set).mru
    
    // replace logic
    cache_invld_d1(wayId) := !ways(wayId).metas(cpu_set_d1).vld
    cache_lru_d1(wayId)   := !ways(wayId).metas(cpu_set_d1).mru
    cache_victim(wayId)   := cache_invld_d1(wayId) & cache_lru_d1(wayId)

    // sram logic
    sram_banks_data(wayId) := sram(wayId).ports.rsp.payload.data
    sram_banks_valid(wayId):= sram(wayId).ports.rsp.valid
    when(is_hit && U(wayId)===hit_id){
      sram(wayId).ports.cmd.payload.addr := cpu_bank_addr
      sram(wayId).ports.cmd.valid        := True
      sram(wayId).ports.cmd.payload.wen  := B(0, bankNum bits)
      sram(wayId).ports.cmd.payload.wdata:= B(0, bankNum*bankWidth bits)
      sram(wayId).ports.cmd.payload.wstrb:= B(0, bankNum*bankWidth/8 bits)
    } 
    .elsewhen(next_level_done && U(wayId)===evict_id){ // when read next level data done, read data from victim way
      sram(wayId).ports.cmd.payload.addr := cpu_bank_addr_d1
      sram(wayId).ports.cmd.valid        := True
      sram(wayId).ports.cmd.payload.wen  := B(0, bankNum bits)
      sram(wayId).ports.cmd.payload.wdata:= B(0, bankNum*bankWidth bits)
      sram(wayId).ports.cmd.payload.wstrb:= B(0, bankNum*bankWidth/8 bits)
    }
    .elsewhen(next_level.rsp.valid && U(wayId)===evict_id){ // when read miss, read next level data, write to banks
      sram(wayId).ports.cmd.payload.addr := bankAddrRange
      sram(wayId).ports.cmd.valid        := True
      sram(wayId).ports.cmd.payload.wen  := B(bankNum bits, (bankNum-1 downto 0) -> True)
      sram(wayId).ports.cmd.payload.wdata:= next_level.rsp.data
      sram(wayId).ports.cmd.payload.wstrb:= (B(0, bankNum*bankWidth/8-busDataWidth/8 bits) ## B(busDataWidth/8 bits, default -> True)) |<< (next_level_data_cnt*busDataWidth/8)
    }
    .otherwise {
      sram(wayId).ports.cmd.payload.addr := U(0, bankDepthBits bits)
      sram(wayId).ports.cmd.valid        := False
      sram(wayId).ports.cmd.payload.wen  := B(0, bankNum bits)
      sram(wayId).ports.cmd.payload.wdata:= B(0, bankNum*bankWidth bits)
      sram(wayId).ports.cmd.payload.wstrb:= B(0, bankNum*bankWidth/8 bits)
    }

    // ================= metas update =================
    when(flush_busy){
      ways(wayId).metas(flush_cnt).mru := False
      ways(wayId).metas(flush_cnt).vld := False
    }
    .otherwise{
      // hit and MRU all 1, set hit way MRU=1, other 0
      when(is_hit && mru_full){
        when(cache_hit(wayId)) {
          ways(wayId).metas(cpu_set).mru := True
        } .otherwise {
          ways(wayId).metas(cpu_set).mru := False
        }
      } // hit and MRU not all 1
      .elsewhen(is_hit && cache_hit(wayId)){
        ways(wayId).metas(cpu_set).mru := True
      } // miss and next_level data read done
      .elsewhen(next_level_done && U(wayId)===evict_id){
        ways(wayId).metas(cpu_set_d1).vld := True
      }
    }
    // tags
    when(next_level_done && U(wayId)===evict_id){
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
  cpu.rsp.payload.data := is_hit_d1 ? sram_banks_data(hit_id_d1).subdivideIn(cpuDataWidth bits)(cpu_bank_index_d1) | sram_banks_data(evict_id).subdivideIn(cpuDataWidth bits)(cpu_bank_index_d1)
  cpu.rsp.valid        := is_hit_d1 ? sram_banks_valid(hit_id_d1) | sram_banks_valid(evict_id_d1)
  cpu.cmd.ready        := cpu_cmd_ready

  // cmd to next level cache
  next_level.cmd.payload.addr := (cpu_addr_d1(addressWidth-1 downto offsetWidth) ## U(0, offsetWidth bits)).asUInt
  next_level.cmd.payload.len  := (busBurstLen-1)
  next_level.cmd.payload.size := busDataSize
  next_level.cmd.valid        := next_level_cmd_valid

}

 class ICacheTop(val config : ICacheConfig, val axiConfig : Axi4Config){

  import config._

  // ====================== IO ==================
  val flush = in Bool()
  val icache_ports = slave(ICacheAccess(addressWidth, cpuDataWidth))
  val next_level = master(ICacheNextLevelPorts(p))
  // next level AXI ports/ direct ports
  if(directOutput){
    val icacheMaster = master(ICacheAccess(config.addressWidth, config.cpuDataWidth)).setName("icache")
  }
  else{
    val icacheReader = master(Axi4ReadOnly(axiConfig)).setName("icache")
  }
  

  // ==================== AXI output, has burst ================
  if (!config.directOutput && !noBurst){
    val icache = new ICache(config)
    val srambanks = new SramBanks(true, config.wayCount, config.bankNum, config.bankWidth, config.bankDepthBits)
    // connect icache and cpu ports
    icache_ports.cmd <> icache.cpu.cmd
    icache_ports.rsp <> icache.cpu.rsp
    icache.flush := False // TODO:
    // sram ports
    val connect_sram = for(i<-0 until config.wayCount) yield new Area{
      icache.sram(i).ports <> srambanks.sram(i).ports
    }
    // ar channel
    icacheReader.ar.valid := icache.next_level.cmd.valid
    icacheReader.ar.payload.id := U(0)
    icacheReader.ar.payload.len := icache.next_level.cmd.payload.len.resized
    icacheReader.ar.payload.size := icache.next_level.cmd.payload.size
    icacheReader.ar.payload.burst := B(1) // INCR
    icacheReader.ar.payload.addr := icache.next_level.cmd.payload.addr.resize(config.addressWidth)
    icache.next_level.cmd.ready := icacheReader.ar.ready
    // r channel
    icacheReader.r.ready := True
    icache.next_level.rsp.valid := icacheReader.r.valid && (icacheReader.r.id===U(0))
    icache.next_level.rsp.payload.data := icacheReader.r.payload.data
  }

  // ======================= AXI noburst output =======================
  else if(!config.directOutput && config.noBurst){
    val icache = new ICache(config)
    val srambanks = new SramBanks(true, config.wayCount, config.bankNum, config.bankWidth, config.bankDepthBits)
    // connect icache and cpu ports
    icache_ports.cmd <> icache.cpu.cmd
    icache_ports.rsp <> icache.cpu.rsp
    icache.flush := False // TODO:
    // sram ports
    val connect_sram = for(i<-0 until config.wayCount) yield new Area{
      icache.sram(i).ports <> srambanks.sram(i).ports
    }

    icacheReader.ar.valid.setAsReg() init(False)
    icacheReader.ar.payload.id.setAsReg() init(0)
    icacheReader.ar.payload.len.setAsReg() init(0)
    icacheReader.ar.payload.size.setAsReg() init(0)
    icacheReader.ar.payload.burst.setAsReg() init(0)
    icacheReader.ar.payload.addr.setAsReg() init(0)
    val ar_len_cnt = (Reg(UInt(4 bits)) init(0)).setName("ar_len_cnt")
    // ar channel
    when(icache.next_level.cmd.valid){
      ar_len_cnt := icache.next_level.cmd.len
    }.elsewhen(icacheReader.ar.fire && ar_len_cnt>U(0)){
      ar_len_cnt := ar_len_cnt - U(1)
    }
    when(icache.next_level.cmd.valid){
      icacheReader.ar.valid      := True
    }
    .elsewhen(icacheReader.ar.fire){
      when(ar_len_cnt>U(0)){
        icacheReader.ar.valid    := True
      }.otherwise{
        icacheReader.ar.valid    := False
      }
    }
    icacheReader.ar.payload.id := U(0)
    icacheReader.ar.payload.len := U(0)
    icacheReader.ar.payload.size := icache.next_level.cmd.payload.size
    icacheReader.ar.payload.burst := B(1) // INCR
    icache.next_level.cmd.ready := icacheReader.ar.ready
    // ar addr unburst
    when(icache.next_level.cmd.valid){
      icacheReader.ar.payload.addr := icache.next_level.cmd.payload.addr.resize(config.addressWidth)
    }.elsewhen(icacheReader.ar.fire){
      icacheReader.ar.payload.addr := icacheReader.ar.payload.addr + U(config.busDataWidth/8)
    }
    // r channel
    icacheReader.r.ready := True
    icache.next_level.rsp.valid := icacheReader.r.valid && (icacheReader.r.id===U(0))
    icache.next_level.rsp.payload.data := icacheReader.r.payload.data
  }

  else {
    // connect icache and cpu ports
    icache_ports.cmd <> icacheMaster.cmd
    icache_ports.rsp <> icacheMaster.rsp
  }
}