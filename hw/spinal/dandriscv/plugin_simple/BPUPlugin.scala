package dandriscv.plugin_simple

import spinal.core._
import spinal.lib._

import dandriscv._
import dandriscv.ip._
import dandriscv.plugin._
import dandriscv.plugin_simple._

// ================ gshare predictor =================
case class gshare_predictor() extends Component {
  val predict_valid = in Bool()
  val predict_pc = in UInt(7 bits)
  val predict_taken = out Bool()
  val predict_history = out UInt(7 bits)

  val train_valid = in Bool()
  val train_taken = in Bool()
  val train_mispredicted = in Bool()
  val train_history = in UInt(7 bits)
  val train_pc = in UInt(7 bits)

  val global_branch_history = RegInit(B"7'b0")
  val PHT_regfile = Vec(RegInit(U"2'b01"), 128)
  val predict_index = predict_pc ^ global_branch_history.asUInt
  val train_index = train_pc ^ train_history

  val PHT_update = new Area {
    when(train_valid) {
      switch(PHT_regfile(train_index)) {
        is(U"2'b00") {
          when(train_taken) {
              PHT_regfile(train_index) := U"2'b01"
          } .otherwise {
              PHT_regfile(train_index) := U"2'b00"
          }
        }
        is(U"2'b01") {
          when(train_taken) {
              PHT_regfile(train_index) := U"2'b10"
          } .otherwise {
              PHT_regfile(train_index) := U"2'b00"
          }
        }
        is(U"2'b10") {
          when(train_taken) {
              PHT_regfile(train_index) := U"2'b11"
          } .otherwise {
              PHT_regfile(train_index) := U"2'b00"
          }
        }
        is(U"2'b11") {
          when(~train_taken) {
              PHT_regfile(train_index) := U"2'b10"
          } .otherwise {
              PHT_regfile(train_index) := U"2'b11"
          }
        }
      }
    }
  }

  when(train_valid & train_mispredicted) {
      global_branch_history := train_history(5 downto 0).asBits ## train_taken
  } .elsewhen(predict_valid) {
      global_branch_history := global_branch_history(5 downto 0) ## predict_taken
  }

  // output
  val predict_taken_tmp = PHT_regfile(predict_index)
  predict_taken := predict_taken_tmp(1)
  predict_history := global_branch_history.asUInt
}

// ================= branch target buffer =================
case class BTB() extends Component {

}

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

    val predictor = new gshare_predictor()

    predictor.predict_valid := decode.output(NEED_PREDICT)
    predictor.predict_pc := decode.output(PC)(6 downto 0)


  }

}