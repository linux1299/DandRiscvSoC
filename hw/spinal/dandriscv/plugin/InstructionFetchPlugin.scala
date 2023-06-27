package dandriscv.plugin

import dandriscv._
import spinal.core._
import spinal.lib._

object InstructionFetchPlugin{
  object  extends Stageable(Bits(32 bits))
 
}

class InstructionFetchPlugin extends Plugin[DandRiscv]{
  import InstructionFetchPlugin._

  override def setup(pipeline: DandRiscv): Unit = {
    import Riscv._
    import pipeline.config._
  }
  
  override def build(pipeline: DandRiscv): Unit = {
    import pipeline._
    import pipeline.config._

    fetch plug new Area{
      import fetch._

      insert() := 
    }


  }
}