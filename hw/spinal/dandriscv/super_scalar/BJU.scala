package dandriscv.super_scalar

import spinal.core._
import spinal.lib._
import math._

case class BJU() extends Component {
  import CpuConfig._
  import BjuCtrlEnum._
  import ExpCtrlEnum._

  // =================== IO ===================
  val in_valid = in Bool()
  val bju_micro_op = in(IQ_MicroOp("BJU"))
  val pc = in UInt(PC_WIDTH bits)
  val imm = in Bits(64 bits)
  val rs1_val = in Bits(64 bits)
  val rs2_val = in Bits(64 bits)
  val rd_val  = out Bits(64 bits)
  val bpu_pred_taken = in Bool()
  val bpu_pred_pc_next = in UInt(PC_WIDTH bits)
  val redirect_valid = out Bool()
  val redirect_pc = out UInt(PC_WIDTH bits)
  // for BPU train
  val train_valid = out Bool()
  val train_pc = out UInt(PC_WIDTH bits)
  val train_taken = out Bool()
  val train_mispred = out Bool()
  val train_history = out UInt(PredictorHistoryLen bits)
  val train_pc_next = out UInt(PC_WIDTH bits)
  val train_is_call = out Bool()
  val train_is_ret = out Bool()
  val train_is_jmp = out Bool()
  // for PTAB
  val brc_or_jmp = out Bool()

  // --------------branch/jump related signals--------------
  val pc_next = UInt(PC_WIDTH bits)
  val auipc = (bju_micro_op.bju_ctrl_op===AUIPC)
  val jal = (bju_micro_op.bju_ctrl_op===JAL)
  val jalr= (bju_micro_op.bju_ctrl_op===JALR)
  val beq = (bju_micro_op.bju_ctrl_op===BEQ)
  val bne = (bju_micro_op.bju_ctrl_op===BNE)
  val blt = (bju_micro_op.bju_ctrl_op===BLT)
  val bge = (bju_micro_op.bju_ctrl_op===BGE)
  val bltu= (bju_micro_op.bju_ctrl_op===BLTU)
  val bgeu= (bju_micro_op.bju_ctrl_op===BGEU) 
  val branch_or_jalr = jalr || beq || bne || blt || bge || bltu || bgeu
  val branch_or_jump = branch_or_jalr || jal
  val branch_src1 = rs1_val
  val branch_src2 = rs2_val
  val rd_eq_rs1   = bju_micro_op.bju_rd_eq_rs1
  val rd_is_link  = bju_micro_op.bju_rd_is_link
  val rs1_is_link = bju_micro_op.bju_rs1_is_link
  val src2_is_imm = bju_micro_op.src2_is_imm
  val is_call= False
  val is_ret = False
  val is_jmp = False
  
  // ================ for branch and jump ======================
  // decide if should branch or jump
  val beq_result = beq && (branch_src1===branch_src2)
  val bne_result = bne && (branch_src1=/=branch_src2)
  val blt_result = blt && (branch_src1.asSInt < branch_src2.asSInt)
  val bge_result = bge && (branch_src1.asSInt >=branch_src2.asSInt)
  val bltu_result = bltu && (branch_src1.asUInt <  branch_src2.asUInt)
  val bgeu_result = bgeu && (branch_src1.asUInt >= branch_src2.asUInt)
  val branch_taken = beq_result || bne_result || blt_result || bge_result || bltu_result || bgeu_result || jal || jalr
  val branch_history = RegInit(U(0, PredictorHistoryLen bits))
  // real branch history
  when(in_valid){
    branch_history := (branch_history(PredictorHistoryLen-2 downto 0).asBits ## branch_taken).asUInt
  }
  // calculate pc_next
  when(jalr){
    pc_next := (((branch_src1.asSInt + imm.asSInt) & ~S(1, 64 bits)).asUInt).resized // jalr
  }.otherwise{
    pc_next := ((pc.asSInt + imm.asSInt).asUInt).resized // jal or branch
  }
  // redirect if predict wrong
  redirect_valid := False
  redirect_pc := 0
  when(branch_or_jump){
    when(branch_taken){ // real: branch taken; predict: not taken or taken wrong pc
      when(!bpu_pred_taken || (bpu_pred_pc_next=/=pc_next)){
        redirect_valid := in_valid
        redirect_pc := pc_next
      }
    }
    .otherwise{ // real: not taken; predict: taken
      when(bpu_pred_taken){
        redirect_valid := in_valid
        redirect_pc := pc + 4
      }
    }
  }
  // call or return
  when(jal){
    when(rd_is_link){
      is_call := True // A JAL instruction should push the return address onto a return-address stack (RAS) only when rd=x1/x5
      is_ret  := False
      is_jmp  := False
    }.otherwise{
      is_call := False
      is_ret  := False
      is_jmp  := True
    }
  }
  .elsewhen(jalr){
  /* JALR instructions should push/pop a RAS as shown in the Table
  -------------------------------------------------
      rd    |   rs1    | rs1=rd  |   RAS action
  (1) !link |   !link  | -       |   none
  (2) !link |   link   | -       |   pop
  (3) link  |   !link  | -       |   push
  (4) link  |   link   | 0       |   push and pop
  (5) link  |   link   | 1       |   push
  ------------------------------------------------- */
    when(rd_is_link){
      when(rs1_is_link){
        when(rd_eq_rs1){
          is_call := True // (5)
        }.otherwise{
          is_call := True // (4)
          is_ret  := True
        }
      }.otherwise{
        is_call := True // (3)
      }
    }.otherwise{
      when(rs1_is_link){
        is_ret := True // (2)
      }.otherwise{
        is_jmp := True // (1)
      }
    }
  }

  // ================ for rd value ======================
  val src1 = pc
  val src2 = (jal || jalr) ? U(4, 64 bits) | rs2_val.asUInt
  rd_val := (src1 + src2).asBits

  // ================= for BPU ==================
  train_valid := in_valid && branch_or_jump
  train_pc := pc
  train_taken := branch_taken
  train_mispred := redirect_valid
  train_history := branch_history
  train_pc_next := redirect_pc
  train_is_call := is_call
  train_is_ret  := is_ret
  train_is_jmp  := is_jmp

  brc_or_jmp := branch_or_jump



}

object GenBJU extends App {
  GenConfig.spinal.generateVerilog(BJU())
}