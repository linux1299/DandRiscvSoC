package dandriscv.plugin

import dandriscv._
import spinal.core._
import spinal.lib._

class InstructionFetchPlugin extends Plugin[DandRiscv]{

  override def setup(pipeline: DandRiscv): Unit = {
    import Riscv._
    import pipeline.config._
  }
  
  override def build(pipeline: DandRiscv): Unit = {
    import pipeline._
    import pipeline.config._

  }
}