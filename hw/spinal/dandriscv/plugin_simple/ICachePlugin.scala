package dandriscv.plugin_simple

import spinal.core._
import spinal.lib._

import dandriscv._
import dandriscv.ip._
import dandriscv.plugin._
import dandriscv.plugin_simple._
import spinal.lib.bus.amba4.axi._

trait ICacheAccessService {
  def newICacheAccess() : ICacheAccess
}

// ================ next level ports as master ==============
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

// ================ cpu and icache ports ===============
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

class ICachePlugin(val config : ICacheConfig) extends Plugin[DandRiscvSimple]{

  import config._

  var icache_access : ICacheAccess = null
  var icacheReader : Axi4ReadOnly = null

  override def setup(pipeline: DandRiscvSimple): Unit = {
    import Riscv._
    import pipeline.config._
    icache_access = pipeline.service(classOf[ICacheAccessService]).newICacheAccess
  }

  override def build(pipeline: DandRiscvSimple): Unit = {
    import pipeline._
    import pipeline.config._

    val icache_config = ICachePlugin.this.config

    if (!icache_config.directOutput && !noBurst){
      val icache = new ICache(icache_config)
      val srambanks = new SramBanks(true, icache_config.wayCount, icache_config.bankNum, icache_config.bankWidth, icache_config.bankDepthBits)

      // connect icache and cpu ports
      icache_access.cmd <> icache.cpu.cmd
      icache_access.rsp <> icache.cpu.rsp
      icache.flush := False // TODO:

      // sram ports
      val connect_sram = for(i<-0 until icache_config.wayCount) yield new Area{
        icache.sram(i).ports <> srambanks.sram(i).ports
      }

      // next level AXI ports
      val axiConfig = Axi4Config(addressWidth=icache_config.addressWidth, dataWidth=icache_config.busDataWidth, idWidth=4,
                                 useId=true, useLast=true, useRegion=false, useBurst=true, 
                                 useLock=false, useCache=false, useSize=true, useQos=false,
                                 useLen=true, useResp=true, useProt=false, useStrb=false)
      icacheReader = master(Axi4ReadOnly(axiConfig)).setName("icache")
      // ar channel
      icacheReader.ar.valid := icache.next_level.cmd.valid
      icacheReader.ar.payload.id := U(0)
      icacheReader.ar.payload.len := icache.next_level.cmd.payload.len.resized
      icacheReader.ar.payload.size := icache.next_level.cmd.payload.size
      icacheReader.ar.payload.burst := B(1) // INCR
      icacheReader.ar.payload.addr := icache.next_level.cmd.payload.addr
      icache.next_level.cmd.ready := icacheReader.ar.ready

      // r channel
      icacheReader.r.ready := True
      icache.next_level.rsp.valid := icacheReader.r.valid && (icacheReader.r.id===U(0))
      icache.next_level.rsp.payload.data := icacheReader.r.payload.data
    }

    // ======================= AXI noburst output =======================
    else if(!icache_config.directOutput && icache_config.noBurst){
      val icache = new ICache(icache_config)
      val srambanks = new SramBanks(true, icache_config.wayCount, icache_config.bankNum, icache_config.bankWidth, icache_config.bankDepthBits)

      // connect icache and cpu ports
      icache_access.cmd <> icache.cpu.cmd
      icache_access.rsp <> icache.cpu.rsp
      icache.flush := False // TODO:

      // sram ports
      val connect_sram = for(i<-0 until icache_config.wayCount) yield new Area{
        icache.sram(i).ports <> srambanks.sram(i).ports
      }

      // next level AXI ports
      val axiConfig = Axi4Config(addressWidth=icache_config.addressWidth, dataWidth=icache_config.busDataWidth, idWidth=4,
                                 useId=true, useLast=true, useRegion=false, useBurst=true, 
                                 useLock=false, useCache=false, useSize=true, useQos=false,
                                 useLen=true, useResp=true, useProt=false, useStrb=false)
      icacheReader = master(Axi4ReadOnly(axiConfig)).setName("icache")
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
        icacheReader.ar.payload.addr := icache.next_level.cmd.payload.addr
      }.elsewhen(icacheReader.ar.fire){
        icacheReader.ar.payload.addr := icacheReader.ar.payload.addr + U(icache_config.busDataWidth/8)
      }

      // r channel
      icacheReader.r.ready := True
      icache.next_level.rsp.valid := icacheReader.r.valid && (icacheReader.r.id===U(0))
      icache.next_level.rsp.payload.data := icacheReader.r.payload.data
    }
    else {
      val icacheMaster = master(ICacheAccess(icache_config.addressWidth, icache_config.cpuDataWidth)).setName("icache")
      // connect icache and cpu ports
      icache_access.cmd <> icacheMaster.cmd
      icache_access.rsp <> icacheMaster.rsp
    }
  }
  
}