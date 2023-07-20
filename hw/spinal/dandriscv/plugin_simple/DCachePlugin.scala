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
  def newDCacheNextLevelPorts() : DCacheNextLevelPorts
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


class DCachePlugin(val config : DCacheConfig) extends Plugin[DandRiscvSimple]{

  import config._

  var dcache_access : DCacheAccess = null
  var nextlevel_access : DCacheNextLevelPorts = null

  override def setup(pipeline: DandRiscvSimple): Unit = {
    import Riscv._
    import pipeline.config._

    dcache_access = pipeline.service(classOf[DCacheAccessService]).newDCacheAccess
    nextlevel_access = pipeline.service(classOf[NextLevelDataService]).newDCacheNextLevelPorts
  }

   override def build(pipeline: DandRiscvSimple): Unit = {
    import pipeline._
    import pipeline.config._

    val dcache_config = DCachePlugin.this.config
    val dcache = new DCache(dcache_config)
    val srambanks   = new SramBanks(.wayCount, dcache_config.bankWidth, dcache_config.bankDepthBits)

    // impl dcache access logic
    dcache_access.cmd <> dcache.cpu.cmd

    // sram ports
    val connect_sram = for(i<-0 until dcache_config.wayCount) yield new Area{
      dcache.sram(i).ports <> srambanks.sram(i).ports
    }

    // next level AXI ports
     val axiConfig = Axi4Config(addressWidth=dcache_config.addressWidth, dataWidth=dcache_config.busDataWidth, idWidth=4,
                               useId=false, useLast=false, useRegion=false, useBurst=false, 
                               useLock=false, useCache=false, useSize=false, useQos=false,
                               useLen=false, useResp=false, useProt=false, useStrb=false)
    val dcacheReader = master(Axi4ReadOnly(axiConfig)).setName("dcacheReader")
    dcacheReader.r.ready := False
    dcacheReader.ar.valid := False
    dcacheReader.ar.addr := U(32, dcache_config.addressWidth bits)

    memaccess plug new Area{
      import memaccess._
      
    }

    
   }
  
}