package dandriscv.plugin_simple

import dandriscv._
import spinal.core._
import spinal.lib._
import dandriscv.plugin_simple._
import dandriscv.plugin._

object ICachePlugin{
  object INST_TEST extends Stageable(Bits(32 bits))
  object INSTRUCTION extends Stageable(Bits(32 bits))
}

trait ICacheAccessService {
    def newICacheAccess() : ICacheAccess
}

case class ICacheAccess() extends Bundle {
  val cmd = Stream(Bits(8 bits))
  val rsp = Flow(Bits(8 bits))
}


class ICachePlugin extends Plugin[DandRiscvSimple]{
  import ICachePlugin._

  var icache_access : ICacheAccess = null

  override def setup(pipeline: DandRiscvSimple): Unit = {
    import Riscv._
    import pipeline.config._
    icache_access = pipeline.service(classOf[ICacheAccessService]).newICacheAccess
  }

   override def build(pipeline: DandRiscvSimple): Unit = {
    import pipeline._
    import pipeline.config._
    import Riscv._

    icache_access.cmd.valid := False
    icache_access.cmd.payload := B(1, 8 bits)
    icache_access.rsp.valid := False
    icache_access.rsp.payload := B(1, 8 bits)

    decode plug new Area{
      import decode._
      insert(INST_TEST) := input(INSTRUCTION)
      //insert(INST_TEST) := B(0, 32 bits)
    }

   }
  
}