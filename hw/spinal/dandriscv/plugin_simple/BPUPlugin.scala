package dandriscv.plugin_simple

import spinal.core._
import spinal.lib._

import dandriscv._
import dandriscv.ip._
import dandriscv.plugin._
import math._

case class PredictorConfig(predictorType : String = "STATIC",
                          addressWidth : Int=64, 
                          RAS_ENTRIES : Int=4, 
                          BTB_ENTRIES : Int=4, 
                          PHT_ENTRIES : Int=128
                          ){
  def PHT_address_width = log2Up(PHT_ENTRIES)
  def BTB_ENTRIES_WIDTH = log2Up(BTB_ENTRIES)
  def RAS_ENTRIES_WIDTH = log2Up(RAS_ENTRIES)
  def historyLen        = log2Up(PHT_ENTRIES)
}

// ================= Branch predictor plugin ===================
class BPUPlugin(val p : PredictorConfig) extends Plugin[DandRiscvSimple]{

  override def setup(pipeline: DandRiscvSimple): Unit = {
    import Riscv._
    import pipeline.config._
  }

  override def build(pipeline: DandRiscvSimple): Unit = {
    import Riscv._
    import pipeline._
    import pipeline.config._  
    
    val predictor_config = BPUPlugin.this.p

    if(predictor_config.predictorType=="GSHARE"){
      val predictor = new gshare_predictor(predictor_config)
      predictor.predict_pc           := fetch.output(PC_NEXT)
      predictor.predict_valid        := fetch.output(PREDICT_VALID)
      // fetch.insert(BPU_BRANCH_TAKEN) := predictor.predict_taken
      // fetch.insert(BPU_PC_NEXT)      := predictor.predict_pc_next
      fetch.insert(BPU_BRANCH_TAKEN) := False //TODO:
      fetch.insert(BPU_PC_NEXT)      := U(0) //TODO:
      predictor.train_valid          := execute.output(BRANCH_OR_JUMP)
      predictor.train_taken          := execute.output(BRANCH_TAKEN)
      predictor.train_mispredicted   := execute.output(REDIRECT_VALID)
      predictor.train_history        := execute.output(BRANCH_HISTORY)
      predictor.train_pc             := execute.output(PC)
      predictor.train_pc_next        := execute.output(REDIRECT_PC_NEXT)
      predictor.train_is_call        := execute.output(IS_CALL)
      predictor.train_is_ret         := execute.output(IS_RET)
      predictor.train_is_jmp         := execute.output(IS_JMP)
    }
    else if(predictor_config.predictorType=="STATIC"){
      val predictor = new static_predictor(predictor_config)
      predictor.predict_pc           := fetch.output(PC_NEXT)
      predictor.predict_valid        := fetch.output(PREDICT_VALID)
      predictor.predict_imm          := fetch.output(FETCH_DEC_IMM)
      predictor.predict_jal          := fetch.output(FETCH_DEC_JAL)
      predictor.predict_branch       := fetch.output(FETCH_DEC_BRANCH)
      fetch.insert(BPU_BRANCH_TAKEN) := predictor.predict_taken
      fetch.insert(BPU_PC_NEXT)      := predictor.predict_pc_next
    }
    

  }

}