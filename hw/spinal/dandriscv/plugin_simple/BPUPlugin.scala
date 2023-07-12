package dandriscv.plugin_simple

import spinal.core._
import spinal.lib._

import dandriscv._
import dandriscv.ip._
import dandriscv.plugin._
import math._

// ================= Branch predictor plugin ===================
class BPUPlugin() extends Plugin[DandRiscvSimple]{

  override def setup(pipeline: DandRiscvSimple): Unit = {
    import Riscv._
    import pipeline.config._
  }

  override def build(pipeline: DandRiscvSimple): Unit = {
    import Riscv._
    import pipeline._
    import pipeline.config._  

    val predictor = new gshare_predictor(addressWidth)
    
    predictor.predict_pc := fetch.output(PC)
    fetch.insert(BPU_BRANCH_TAKEN) := predictor.predict_taken
    fetch.insert(BPU_PC_NEXT) := predictor.predict_pc_next
    predictor.train_valid := execute.output(BRANCH_OR_JUMP)
    predictor.train_taken := execute.output(BRANCH_TAKEN)
    predictor.train_mispredicted := execute.output(MISPRED)
    predictor.train_history := execute.output(BRANCH_HISTORY)
    predictor.train_pc := execute.output(PC)
    predictor.train_pc_next := execute.output(PC_NEXT)
    predictor.train_is_call := execute.output(IS_CALL)
    predictor.train_is_ret  := execute.output(IS_RET)
    predictor.train_is_jmp  := execute.output(IS_JMP)

  }

}