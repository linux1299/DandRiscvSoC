package dandriscv.plugin_simple

import spinal.core._
import spinal.lib._

import dandriscv._
import dandriscv.ip._
import dandriscv.plugin._
import dandriscv.plugin_simple._

trait DCacheAccessService {
  def newDCacheAccess() : DCacheAccess
}
trait NextLevelDataService {
  def newNextLevelData() : NextLevelData
}

// ================ next level ports as master ==============
case class DCacheNextLevelCmd(p : DCacheConfig) extends Bundle{
  val addr = UInt(p.addressWidth bits)
  val len  = UInt(4 bits)
  val size = UInt(3 bits)
  val wen  = Bool()
  val wdata= Bits(p.busDataWidth bits)
  val wstrb= Bits(p.busDataWidth/8 bits)
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

// ================ cpu and dcache ports ===============
case class DCacheAccessCmd(AW: Int, DW: Int) extends Bundle {
  val addr = UInt(AW bits)
  val wen  = Bool()
  val wdata= Bits(DW bits)
  val wstrb= Bits(DW/8 bits)
  val size = UInt(3 bits)
}
case class DCacheAccessRsp(DW: Int) extends Bundle {
  val data = Bits(DW bits)
}
case class DCacheAccess(AW: Int, DW: Int) extends Bundle with IMasterSlave{
  val cmd = Stream(DCacheAccessCmd(AW, DW))
  val rsp = Flow(DCacheAccessRsp(DW))
  override def asMaster(): Unit = {
    master(cmd)
    slave(rsp)
  }
  override def asSlave(): Unit = {
    slave(cmd)
    master(rsp)
  }
}
// ================ next level and dcache ports ===============
case class NextLevelData(AW: Int, DW: Int) extends Bundle {
  val cmd = Stream(DCacheAccessCmd(AW, DW))
  val rsp = Flow(DCacheAccessRsp(DW))
}


class DCachePlugin(val config : DCacheConfig) extends Plugin[DandRiscvSimple]{

  import config._

  var dcache_access : DCacheAccess = null
  //var service_test : IntIF = null
  //var nextlevel_access : NextLevelData = null

  override def setup(pipeline: DandRiscvSimple): Unit = {
    import Riscv._
    import pipeline.config._

    dcache_access = pipeline.service(classOf[DCacheAccessService]).newDCacheAccess
    //service_test = pipeline.service(classOf[IntrruptService]).newIntIF
    //nextlevel_access = pipeline.service(classOf[NextLevelDataService]).newNextLevelData
  }

   override def build(pipeline: DandRiscvSimple): Unit = {
    import pipeline._
    import pipeline.config._

    val dcache = new DCache(DCachePlugin.this.config)
    val srambanks   = new SramBanks(DCachePlugin.this.config.wayCount, 
    DCachePlugin.this.config.bankWidth, 
    DCachePlugin.this.config.bankDepthBits)

    // impl dcache access logic
    dcache_access.cmd <> dcache.cpu.cmd

    // sram ports
    val connect_sram = for(i<-0 until DCachePlugin.this.config.wayCount) yield new Area{
      dcache.sram(i).ports <> srambanks.sram(i).ports
    }

    memaccess plug new Area{
      import memaccess._
      
    }

    
   }
  
}