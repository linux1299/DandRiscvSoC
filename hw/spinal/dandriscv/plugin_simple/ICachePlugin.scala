package dandriscv.plugin_simple

import spinal.core._
import spinal.lib._

import dandriscv._
import dandriscv.ip._
import dandriscv.plugin._
import dandriscv.plugin_simple._

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
// ================ next level and icache ports ===============
case class NextLevelAccess(AW: Int, DW: Int) extends Bundle {
  val cmd = Stream(ICacheAccessCmd(AW))
  val rsp = Flow(ICacheAccessRsp(DW))
}


class ICachePlugin(val config : ICacheConfig) extends Plugin[DandRiscvSimple]{

  import config._

  var icache_access : ICacheAccess = null
  //var nextlevel_access : NextLevelAccess = null

  override def setup(pipeline: DandRiscvSimple): Unit = {
    import Riscv._
    import pipeline.config._

    icache_access = pipeline.service(classOf[ICacheAccessService]).newICacheAccess
    //nextlevel_access = pipeline.service(classOf[NextLevelAccessService]).newNextLevelAccess
  }

   override def build(pipeline: DandRiscvSimple): Unit = {
    import pipeline._
    import pipeline.config._

    val icache = new ICache(ICachePlugin.this.config)
    val srambanks   = new SramBanks(ICachePlugin.this.config.wayCount, 
    ICachePlugin.this.config.bankWidth, 
    ICachePlugin.this.config.bankDepthBits)

    // impl icache access logic
    icache_access.cmd <> icache.cpu.cmd

    // sram ports
    val connect_sram = for(i<-0 until ICachePlugin.this.config.wayCount) yield new Area{
      icache.sram(i).ports <> srambanks.sram(i).ports
    }

    fetch plug new Area{
      import fetch._
      insert(INSTRUCTION) := icache_access.rsp.payload.data
      arbitration.isValid := icache_access.rsp.valid
    }

    
   }
  
}