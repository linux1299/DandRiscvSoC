package dandriscv.plugin

import dandriscv._
import spinal.core._
import spinal.lib._
import dandriscv.plugin._

object IntAluPlugin{
  object RESULT_XOR extends Stageable(Bits(32 bits))
}

class IntAluPlugin extends Plugin[DandRiscvSimple]{
  import IntAluPlugin._

  override def setup(pipeline: DandRiscvSimple): Unit = {
    import Riscv._
    import pipeline.config._
  }
  
  override def build(pipeline: DandRiscvSimple): Unit = {
    import pipeline._
    import pipeline.config._
  }
}