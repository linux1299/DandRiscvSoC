package dandriscv.plugin_simple

import spinal.core._
import spinal.lib._

import dandriscv._
import dandriscv.ip._
import dandriscv.plugin._
import dandriscv.plugin_simple._

case class DecodeModule()  extends Component{

}

case class RegFileModule() extends Component{

}

class DecodePlugin() extends Plugin[DandRiscvSimple]{
  override def setup(pipeline: DandRiscvSimple): Unit = {
    import Riscv._
    import pipeline.config._

  }

   override def build(pipeline: DandRiscvSimple): Unit = {
    import pipeline._
    import pipeline.config._  

    decode plug new Area{
      import decode._
      insert(RS1) := input(INSTRUCTION)
    }

    execute plug new Area{
      import execute._
      output(RS1) := input(RS1)
    }
   }
}