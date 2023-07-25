package dandriscv.ip

import spinal.core._
import spinal.lib._

import dandriscv._
import math._

// ================ gshare predictor =================
case class gshare_predictor(addressWidth : Int=64, 
                            RAS_ENTRIES : Int=4, 
                            BTB_ENTRIES : Int=4, 
                            PHT_ENTRIES: Int=128) extends Component {
  def historyLen = log2Up(PHT_ENTRIES)
  def BTB_ENTRIES_WIDTH = log2Up(BTB_ENTRIES)
  def RAS_ENTRIES_WIDTH = log2Up(RAS_ENTRIES)

  val predict_pc = in UInt(addressWidth bits)
  val predict_valid = in Bool()
  val predict_taken = out Bool()
  val predict_history = out UInt(historyLen bits)
  val predict_pc_next = out UInt(addressWidth bits)

  val train_valid = in Bool()
  val train_taken = in Bool()
  val train_mispredicted = in Bool()
  val train_history = in UInt(historyLen bits)
  val train_pc = in UInt(addressWidth bits)
  val train_pc_next = in UInt(addressWidth bits)
  val train_is_call = in Bool()
  val train_is_ret  = in Bool()
  val train_is_jmp  = in Bool()

  val GSHARE = new Area {
    val global_branch_history = Reg(Bits(historyLen bits)) init(0)
    val PHT = Vec(RegInit(U"2'b01"), PHT_ENTRIES)
    val predict_index = predict_pc(historyLen+1 downto 2) ^ global_branch_history.asUInt
    val train_index = train_pc(historyLen+1 downto 2) ^ train_history
    val pht_predict_taken = PHT(predict_index)(1)

    when(train_valid) {
      switch(PHT(train_index)) {
        is(U"2'b00") {
          when(train_taken) {
              PHT(train_index) := U"2'b01"
          } .otherwise {
              PHT(train_index) := U"2'b00"
          }
        }
        is(U"2'b01") {
          when(train_taken) {
              PHT(train_index) := U"2'b10"
          } .otherwise {
              PHT(train_index) := U"2'b00"
          }
        }
        is(U"2'b10") {
          when(train_taken) {
              PHT(train_index) := U"2'b11"
          } .otherwise {
              PHT(train_index) := U"2'b00"
          }
        }
        is(U"2'b11") {
          when(~train_taken) {
              PHT(train_index) := U"2'b10"
          } .otherwise {
              PHT(train_index) := U"2'b11"
          }
        }
      }
    }

    when(train_valid & train_mispredicted) {
      global_branch_history := train_history(historyLen-2 downto 0).asBits ## train_taken
    } .elsewhen(predict_valid) {
      global_branch_history := global_branch_history(historyLen-2 downto 0) ## predict_taken
    }
  }

  

  val BTB = new Area{
    val btb_valid = Reg(Bits(BTB_ENTRIES bits)) init(0)
    val btb_source_pc = Vec(Reg(UInt(addressWidth bits)) init(0), BTB_ENTRIES)
    val btb_call = Reg(Bits(BTB_ENTRIES bits)) init(0)
    val btb_ret = Reg(Bits(BTB_ENTRIES bits)) init(0)
    val btb_jmp = Reg(Bits(BTB_ENTRIES bits)) init(0)
    val btb_target_pc = Vec(Reg(UInt(addressWidth bits)) init(0), BTB_ENTRIES)

    val btb_is_matched = Bool()
    val btb_is_call = Bool()
    val btb_is_ret  = Bool()
    val btb_is_jmp  = Bool()
    val btb_read_target_pc = UInt(addressWidth bits)

    val readBTB = for(i <- 0 until BTB_ENTRIES) yield new Area {
      when(btb_source_pc(i)===predict_pc && btb_valid(i)){
        btb_is_matched := True
        btb_is_call    := btb_call(i)
        btb_is_ret     := btb_ret(i)
        btb_is_jmp     := btb_jmp(i)
        btb_read_target_pc := btb_target_pc(i)
      } .otherwise {
        btb_is_matched := False
        btb_is_call    := False
        btb_is_ret     := False
        btb_is_jmp     := False
        btb_read_target_pc := U(0, addressWidth bits)
      }
    }

    val btb_write_index = UInt(BTB_ENTRIES_WIDTH bits)
    val btb_alloc_index = Counter(0 to BTB_ENTRIES-1)
    val btb_is_hit_vec  = Vec(Bool(), BTB_ENTRIES)
    val btb_is_miss_vec = Vec(Bool(), BTB_ENTRIES)
    val btb_is_hit = btb_is_hit_vec.asBits.orR
    val btb_is_miss = btb_is_miss_vec.asBits.orR

    val writeBTB = for(i <- 0 until BTB_ENTRIES) yield new Area {
      when(train_valid && train_taken){
        when(btb_source_pc(i)===train_pc && btb_valid(i)){
          btb_is_hit_vec(i) := True
        }.otherwise{
          btb_is_hit_vec(i) := False
        }
        when(btb_source_pc(i)=/=train_pc || !btb_valid(i)){
          btb_is_miss_vec(i) := True
        }.otherwise{
          btb_is_miss_vec(i) := False
        }
      }.otherwise{
        btb_is_hit_vec(i) := False
        btb_is_miss_vec(i) := False
      }
    }
    btb_write_index := OHToUInt(btb_is_hit_vec)


    when(btb_is_miss){
      when(btb_alloc_index.willOverflowIfInc){
        btb_alloc_index.clear()
      }.otherwise{
        btb_alloc_index.increment()
      }
    }

    when(btb_is_hit){
      btb_source_pc(btb_write_index) := train_pc
      btb_call(btb_write_index)      := train_is_call
      btb_ret(btb_write_index)       := train_is_ret
      btb_jmp(btb_write_index)       := train_is_jmp
      btb_target_pc(btb_write_index) := train_pc_next
    }
    .elsewhen(btb_is_miss){
      btb_valid(btb_alloc_index)     := True
      btb_source_pc(btb_alloc_index) := train_pc
      btb_call(btb_alloc_index)      := train_is_call
      btb_ret(btb_alloc_index)       := train_is_ret
      btb_jmp(btb_alloc_index)       := train_is_jmp
      btb_target_pc(btb_alloc_index) := train_pc_next
    }
  }

  val RAS = new Area{
    val ras_regfile = Vec(Reg(UInt(addressWidth bits)), RAS_ENTRIES)
    val ras_next_index = UInt(RAS_ENTRIES_WIDTH bits)
    val ras_curr_index = Reg(UInt(RAS_ENTRIES_WIDTH bits)) init(0)
    val ras_next_index_exe = UInt(RAS_ENTRIES_WIDTH bits)
    val ras_curr_index_exe = RegNext(ras_next_index) init(0)
    val ras_predict_pc = UInt(addressWidth bits)
    val ras_call_matched = BTB.btb_is_matched && BTB.btb_is_call
    val ras_ret_matched = BTB.btb_is_matched && BTB.btb_is_ret
    
    // true ras index at exe stage
    when(train_valid && train_is_call){
      ras_next_index_exe := ras_curr_index_exe + 1
    }.elsewhen(train_valid && train_is_ret){
      ras_next_index_exe := ras_curr_index_exe - 1
    }.otherwise{
      ras_next_index_exe := ras_curr_index_exe
    }

    // ras index
    when(train_mispredicted && train_valid && train_is_call){
      ras_next_index := ras_curr_index + 1
    }
    .elsewhen(train_mispredicted && train_valid && train_is_ret){
      ras_next_index := ras_curr_index - 1
    }
    .elsewhen(ras_call_matched){
      ras_next_index := ras_curr_index + 1
    }
    .elsewhen(ras_ret_matched){
      ras_next_index := ras_curr_index - 1
    }
    .otherwise{
      ras_next_index := ras_curr_index
    }

    // update RAS
    when(train_mispredicted && train_valid && train_is_call){
      ras_regfile(ras_next_index) := train_pc + 4
      ras_curr_index := ras_next_index
    }
    .elsewhen(ras_call_matched){
      ras_regfile(ras_next_index) := predict_pc + 4
      ras_curr_index := ras_next_index
    }
    .elsewhen(train_mispredicted && train_valid && train_is_ret){
      ras_curr_index := ras_next_index
    }
    .elsewhen(ras_ret_matched){
      ras_curr_index := ras_next_index
    }

    // ras return addr
    ras_predict_pc := ras_regfile(ras_curr_index)

  }

  // output
  predict_history := GSHARE.global_branch_history.asUInt
  predict_taken   := BTB.btb_is_matched && (GSHARE.pht_predict_taken || BTB.btb_is_jmp || BTB.btb_is_call || BTB.btb_is_ret)
  predict_pc_next := RAS.ras_ret_matched ? RAS.ras_predict_pc | ((BTB.btb_is_matched && (GSHARE.pht_predict_taken || BTB.btb_is_jmp || BTB.btb_is_call)) ? BTB.btb_read_target_pc | (predict_pc+4))
}