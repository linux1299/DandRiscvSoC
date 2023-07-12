package dandriscv.plugin_simple

import spinal.core._
import spinal.lib._

import dandriscv._
import dandriscv.ip._
import dandriscv.plugin._
import dandriscv.plugin_simple._

// ==================== exe stage ======================
class ALUPlugin() extends Plugin[DandRiscvSimple]{
  override def setup(pipeline: DandRiscvSimple): Unit = {
    import Riscv._
    import pipeline.config._

  }

  override def build(pipeline: DandRiscvSimple): Unit = {
    import Riscv._
    import pipeline._
    import pipeline.config._  

    execute plug new Area{
      import execute._

      val src1 = Bits(XLEN bits) 
      val src2 = Bits(XLEN bits)
      val src1_word = src1(31 downto 0)
      val src2_word = src2(31 downto 0)
      val shift_bits = if(XLEN==32) src2(4 downto 0).asUInt else src2(5 downto 0).asUInt
      val add_result = src1.asSInt + src2.asSInt //SInt(XLEN bits)
      val sub_result = src1.asSInt - src2.asSInt //SInt(XLEN bits)
      val slt_result = src1.asSInt < src2.asSInt //Bool()
      val sltu_result= src1.asUInt < src2.asUInt //Bool()
      val xor_result = src1 ^ src2 //Bits(XLEN bits)
      val sll_result = src1 |<< shift_bits //Bits(XLEN bits)
      val srl_result = src1 |>> shift_bits //Bits(XLEN bits)
      val sra_result = src1.asSInt |>> shift_bits //SInt(XLEN bits)
      val and_result = src1 & src2 //Bits(XLEN bits)
      val or_result  = src1 | src2 //Bits(XLEN bits)
      val addw_result= B((31 downto 0) -> add_result(31)) ## add_result(31 downto 0)
      val subw_result= B((31 downto 0) -> sub_result(31)) ## sub_result(31 downto 0)
      val sllw_temp  = src1_word |<< shift_bits(4 downto 0)
      val sllw_result= B((31 downto 0) -> sllw_temp(31)) ## sllw_temp
      val srlw_temp  = src1_word |>> shift_bits(4 downto 0)
      val srlw_result= B((31 downto 0) -> srlw_temp(31)) ## srlw_temp
      val sraw_temp  = src1_word.asSInt |>> shift_bits(4 downto 0)
      val sraw_result= B((31 downto 0) -> sraw_temp(31)) ## sraw_temp
      val alu_result  = Bits(XLEN bits)

      val pc_next = UInt(addressWidth bits)
      val jal = (input(ALU_CTRL)===AluCtrlEnum.JAL.asBits)
      val jalr= (input(ALU_CTRL)===AluCtrlEnum.JALR.asBits)
      val beq = (input(ALU_CTRL)===AluCtrlEnum.BEQ.asBits)
      val bne = (input(ALU_CTRL)===AluCtrlEnum.BNE.asBits)
      val blt = (input(ALU_CTRL)===AluCtrlEnum.BLT.asBits)
      val bge = (input(ALU_CTRL)===AluCtrlEnum.BGE.asBits)
      val bltu= (input(ALU_CTRL)===AluCtrlEnum.BLTU.asBits)
      val bgeu= (input(ALU_CTRL)===AluCtrlEnum.BGEU.asBits) 
      val branch_or_jump = jal || jalr || beq || bne || blt || bge || bltu || bgeu
      val branch_history = RegInit(U"7'b0")
      val branch_src1 = Bits(XLEN bits)
      val branch_src2 = Bits(XLEN bits)
      val rd_is_link  = input(RD_ADDR)===U"5'd0" || input(RD_ADDR)===U"5'd5"
      val rs1_is_link = input(RS1_ADDR)===U"5'd0"|| input(RS1_ADDR)===U"5'd5"
      val is_call= False
      val is_ret = False
      val is_jmp = False
      val redirect_pc_next = U(0, addressWidth bits)
      val redirect_valid = False

      // ================= select op's source data ==================
      when(input(ALU_CTRL)===AluCtrlEnum.AUIPC.asBits || jal || jalr){
        src1 := input(PC).asBits
      }.otherwise{
        when(input(RS1_FROM_MEM)){
          src1 := memaccess.input(ALU_RESULT)
        }.elsewhen(input(RS1_FROM_WB)){
          src1 := writebackStage.output(RD)
        }.otherwise{
          src1 := input(RS1).asBits
        }
      }
      when(input(SRC2_IS_IMM)){
        src2 := input(IMM)
      }.elsewhen(jal || jalr){
        src2 := B(4, XLEN bits)
      }.otherwise{
        when(input(RS2_FROM_MEM)){
          src2 := memaccess.input(ALU_RESULT)
        }.elsewhen(input(RS2_FROM_WB)){
          src2 := writebackStage.output(RD)
        }.otherwise{
          src2 := input(RS2).asBits
        }
      }

      // ================= select branch op's source data ==================
      when(input(CTRL_RS1_FROM_MEM)){
        branch_src1 := memaccess.output(RS1).asBits
      }.elsewhen(input(CTRL_RS1_FROM_WB)){
        branch_src1 := writeback.output(RS1).asBits
      }.otherwise{
        branch_src1 := input(RS1).asBits
      }
      when(input(CTRL_RS2_FROM_MEM)){
        branch_src2 := memaccess.output(RS2).asBits
      }.elsewhen(input(CTRL_RS1_FROM_WB)){
        branch_src2 := writeback.output(RS2).asBits
      }.otherwise{
        branch_src2 := input(RS2).asBits
      }

      // ================= caclulate alu result =====================
      switch(input(ALU_CTRL)){
        is(AluCtrlEnum.ADD.asBits, AluCtrlEnum.AUIPC.asBits){
          when(input(ALU_WORD)===True){
            alu_result := addw_result
          }.otherwise{
            alu_result := add_result.asBits
          }
        }
        is(AluCtrlEnum.SUB.asBits){
          when(input(ALU_WORD)===True){
            alu_result := subw_result
          }.otherwise{
            alu_result := sub_result.asBits
          }
        }
        is(AluCtrlEnum.SLT.asBits){
          alu_result := B(XLEN-1 bits, (XLEN-2 downto 0) -> false) ## slt_result
        }
        is(AluCtrlEnum.SLTU.asBits){
          alu_result := B(XLEN-1 bits, (XLEN-2 downto 0) -> false) ## sltu_result
        }
        is(AluCtrlEnum.XOR.asBits){
          alu_result := xor_result
        }
        is(AluCtrlEnum.SLL.asBits){
          when(input(ALU_WORD)===True){
            alu_result := sllw_result
          }.otherwise{
            alu_result := sll_result
          }
        }
        is(AluCtrlEnum.SRL.asBits){
          when(input(ALU_WORD)===True){
            alu_result := srlw_result
          }.otherwise{
            alu_result := srl_result
          }
        }
        is(AluCtrlEnum.SRA.asBits){
          when(input(ALU_WORD)===True){
            alu_result := sraw_result
          }.otherwise{
            alu_result := sra_result.asBits
          }
        }
        is(AluCtrlEnum.AND.asBits){
          alu_result := and_result
        }
        is(AluCtrlEnum.OR.asBits){
          alu_result := or_result
        }
        is(AluCtrlEnum.LUI.asBits){
          alu_result := input(IMM)
        }
        default{
          alu_result := B(0, XLEN bits)
        }
      }

      // ================ for branch and jump ======================
      // decide if should branch or jump
      val beq_result = beq && (branch_src1===branch_src2)
      val bne_result = bne && (branch_src1=/=branch_src2)
      val blt_result = blt && (branch_src1.asSInt < branch_src2.asSInt)
      val bge_result = bge && (branch_src1.asSInt >=branch_src2.asSInt)
      val bltu_result = bltu && (branch_src1.asUInt <  branch_src2.asUInt)
      val bgeu_result = bgeu && (branch_src1.asUInt >= branch_src2.asUInt)
      val branch_taken = beq_result || bne_result || blt_result || bge_result || bltu_result || bgeu_result || jal || jalr
      // branch history
      branch_history := (branch_history(5 downto 0).asBits ## branch_taken).asUInt

      // calculate pc
      when(input(ALU_CTRL)===AluCtrlEnum.JALR.asBits){
        pc_next := ((src1.asSInt + input(IMM).asSInt) & ~S(1, XLEN bits)).asUInt // jalr
      }.otherwise{
        pc_next := (input(PC).asSInt + input(IMM).asSInt).asUInt // jal or branch
      }
      // redirect
      when(branch_or_jump){
        when(branch_taken){
          when(!input(BPU_BRANCH_TAKEN) || (input(BPU_PC_NEXT)=/=pc_next)){
            redirect_valid := True
            redirect_pc_next := pc_next
          }
        }.otherwise{
          when(input(BPU_BRANCH_TAKEN)){
            redirect_valid := True
            redirect_pc_next := input(PC) + 4
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
            when(input(RD_ADDR)===input(RS1_ADDR)){
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
      

      // insert to stage
      insert(ALU_RESULT) := alu_result
      insert(MEM_WDATA) := output(RS2_FROM_WB) ? writebackStage.output(RD) | (output(RS2_FROM_MEM) ? memaccess.output(ALU_RESULT) | output(RS2))
      insert(PC_NEXT) := pc_next
      insert(BRANCH_OR_JUMP) := branch_or_jump
      insert(BRANCH_TAKEN) := branch_taken
      insert(BRANCH_HISTORY):= branch_history
      insert(IS_JMP) := is_jmp
      insert(IS_CALL):= is_call
      insert(IS_RET) := is_ret
      insert(MISPRED):= redirect_valid
      insert(REDIRECT_PC_NEXT) := redirect_pc_next

    }

  }

}