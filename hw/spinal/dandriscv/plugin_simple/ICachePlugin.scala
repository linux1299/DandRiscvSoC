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
trait NextLevelAccessService {
  def newNextLevelAccess() : NextLevelAccess
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
  var nextlevel_access : NextLevelAccess = null

  override def setup(pipeline: DandRiscvSimple): Unit = {
    import Riscv._
    import pipeline.config._

    icache_access = pipeline.service(classOf[ICacheAccessService]).newICacheAccess
    nextlevel_access = pipeline.service(classOf[NextLevelAccessService]).newNextLevelAccess
  }

  override def build(pipeline: DandRiscvSimple): Unit = {
    import pipeline._
    import pipeline.config._

    val icache_config = ICachePlugin.this.config
    val icache = new ICache(icache_config)
    val srambanks = new SramBanks(icache_config.wayCount, icache_config.bankWidth, icache_config.bankDepthBits)

    // connect icache and cpu ports
    icache_access.cmd <> icache.cpu.cmd

    // sram ports
    val connect_sram = for(i<-0 until icache_config.wayCount) yield new Area{
      icache.sram(i).ports <> srambanks.sram(i).ports
    }

    // next level AXI ports
    val axiConfig = Axi4Config(addressWidth=icache_config.addressWidth, dataWidth=icache_config.busDataWidth, idWidth=4,
                               useId=false, useLast=false, useRegion=false, useBurst=false, 
                               useLock=false, useCache=false, useSize=false, useQos=false,
                               useLen=false, useResp=false, useProt=false, useStrb=false)
    val icacheReader = master(Axi4ReadOnly(axiConfig)).setName("icacheReader")
    icacheReader.r.ready := False
    icacheReader.ar.valid := False
    icacheReader.ar.addr := U(32, icache_config.addressWidth bits)

    fetch plug new Area{
      import fetch._
      insert(INSTRUCTION) := icache_access.rsp.payload.data
      arbitration.isValid := icache_access.rsp.valid
    }

    
   }
  
}