package dandriscv.plugin_simple

import spinal.core._
import spinal.lib._

import dandriscv._
import dandriscv.plugin._
import dandriscv.plugin_simple._

trait ICacheAccessService {
  def newICacheAccess() : ICacheAccess
}
trait NextLevelAccessService {
  def newNextLevelAccessService() : NextLevelAccess
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


class ICachePlugin extends Plugin[DandRiscvSimple]{
  import ICachePlugin._

  var icache_access : ICacheAccess = null

  override def setup(pipeline: DandRiscvSimple): Unit = {
    import Riscv._
    import pipeline.config._

    icache_access = pipeline.service(classOf[ICacheAccessService]).newICacheAccess
    nextlevel_access = pipeline.service(classOf[NextLevelAccessService]).newNextLevelAccessService
  }

   override def build(pipeline: DandRiscvSimple): Unit = {
    import pipeline._
    import pipeline.config._
    import Riscv._

    icache_access.cmd.valid := False
    icache_access.cmd.payload := B(1, 8 bits)
    icache_access.rsp.valid := False
    icache_access.rsp.payload := B(1, 8 bits)
    

   }
  
}