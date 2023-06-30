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

case class ICacheAccessCmd(AW: Int) extends Bundle {
  val address = UInt(AW bits)
  val size    = UInt(3 bits)
}
case class ICacheAccessRsp(DW: Int) extends Bundle {
  val data = Bits(DW bits)
}

case class ICacheAccess(AW: Int, DW: Int) extends Bundle {
  val cmd = Stream(ICacheAccessCmd(AW))
  val rsp = Flow(ICacheAccessRsp(DW))
}

case class NextLevelAccess(AW: Int, DW: Int) extends Bundle {
  val cmd = Stream(ICacheAccessCmd(AW))
  val rsp = Flow(ICacheAccessRsp(DW))
}


class ICachePlugin(val config : ICacheConfig) extends Plugin[DandRiscvSimple] with NextLevelAccessService{

  import config._

  var icache_access : ICacheAccess = null
  //var nextlevel_access : NextLevelAccess = null

  @dontName var nextlevel_access : NextLevelAccess = null
  override def newNextLevelAccess(): NextLevelAccess = {
    nextlevel_access = NextLevelAccess(64, 256)
    nextlevel_access
  }

  override def setup(pipeline: DandRiscvSimple): Unit = {
    import Riscv._
    import pipeline.config._

    //icache_access = pipeline.service(classOf[ICacheAccessService]).newICacheAccess
    //nextlevel_access = pipeline.service(classOf[NextLevelAccessService]).newNextLevelAccess
  }

   override def build(pipeline: DandRiscvSimple): Unit = {
    import pipeline._
    import pipeline.config._

    val icache = new ICache(ICachePlugin.this.config)
    icache.sram(0).ports.rsp.data := B(0, 256 bits)
    icache.sram(1).ports.rsp.data := B(0, 256 bits)
    
    icache.sram(0).ports.rsp.valid := True
    icache.sram(1).ports.rsp.valid := True

    decode plug new Area{
      import decode._
      //input(INSTRUCTION) := B(0, 32 bits)
    }
    
   }
  
}