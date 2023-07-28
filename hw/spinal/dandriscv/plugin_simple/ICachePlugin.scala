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
  val size = UInt(3 bits)
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

  override def setup(pipeline: DandRiscvSimple): Unit = {
    import Riscv._
    import pipeline.config._
    icache_access = pipeline.service(classOf[ICacheAccessService]).newICacheAccess
  }

  override def build(pipeline: DandRiscvSimple): Unit = {
    import pipeline._
    import pipeline.config._

    val icache_config = ICachePlugin.this.config
    val icache = new ICache(icache_config)
    val srambanks = new SramBanks(icache_config.wayCount, icache_config.bankWidth, icache_config.bankDepthBits)

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
    val icacheReader = master(Axi4ReadOnly(axiConfig)).setName("icache")
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
    icache.next_level.rsp.valid := icacheReader.r.valid
    icache.next_level.rsp.payload.data := icacheReader.r.payload.data

    
   }
  
}