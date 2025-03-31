package dandriscv.super_scalar_1issue

import spinal.core._
import spinal.lib._
import math._
import MyUtils._

case class Control() extends Component{
  import CpuConfig._
  import AluCtrlEnum._
  import BjuCtrlEnum._
  import ExpCtrlEnum._
  import LsuCtrlEnum._

  // =================== IO ===================
  val flush = in Bool()
  val src_ports = slave(Stream(FetchDst(32)))
  val to_ports_alu = master(Stream(DeQueue("ALU")))
  val to_ports_bju = master(Stream(DeQueue("BJU")))
  val to_ports_lsu = master(Stream(DeQueue("LSU")))
  val wb_ports_alu = slave(Stream(ExeDst()))
  val wb_ports_bju = slave(Stream(ExeDst()))
  val wb_ports_lsu = slave(Stream(ExeDst()))

  // =================== INST ===================
  val arf = new ARF()
  val decode = new Decode()
  val stream_alu = Stream(DeQueue("ALU"))
  val stream_bju = Stream(DeQueue("BJU"))
  val stream_lsu = Stream(DeQueue("LSU"))
  val stream_wb  = Stream(DeROB())
  val write_back = Stream(DeROB())
  val src_stream = src_ports.throwWhen(flush)

  // =================== Signals ===================
  val valid  = src_stream.valid
  val ready  = RegInit(True)
  val fire   = valid && ready
  val rs1_addr = decode.rs1_addr
  val rs2_addr = decode.rs2_addr
  val rs1_ren  = decode.rs1_ren
  val rs2_ren  = decode.rs2_ren
  val rd_addr  = decode.rd_addr
  val to_alu = (decode.rob_micro_op===RobMicroOp.ALU)
  val to_bju = (decode.rob_micro_op===RobMicroOp.BJU)
  val to_lsu = (decode.rob_micro_op===RobMicroOp.LSU)
  val src1 = (rs1_addr===U(0)) ? B(0) | arf.read_ports.rs1_data
  val src2 = (rs2_addr===U(0)) ? B(0) | arf.read_ports.rs2_data
  val imm  = decode.imm
  val src2_is_imm  = decode.alu_micro_op.src2_is_imm
  val alu_micro_op = decode.alu_micro_op
  val bju_micro_op = decode.bju_micro_op
  val lsu_micro_op = decode.lsu_micro_op
  val pc = src_stream.pc
  val pc_next = src_stream.pc_next
  val bpu_pred_taken = src_stream.bpu_pred_taken
  val instruction = src_stream.instruction
  val alu_busy = RegInit(False)
  val bju_busy = RegInit(False)
  val lsu_busy = RegInit(False)
  val rd_addr_reg = RegNextWhen(decode.rd_addr, fire)
  val trap_or_print = (DIFFTEST) generate ((src_ports.instruction===B"32'h6b" || src_ports.instruction===B"32'h7b"))

  // ==================== Control ====================
  if(DIFFTEST){
    when(flush){
      ready := True
    }
    .elsewhen(fire && trap_or_print){
      ready := True
    }
    .elsewhen(fire){
      ready := False
    }
    .elsewhen(stream_wb.fire){
      ready := True
    }
  }
  else{
    when(flush){
      ready := True
    }
    .elsewhen(fire){
      ready := False
    }
    .elsewhen(stream_wb.fire){
      ready := True
    }
  }

  when(stream_alu.fire){
    alu_busy := True
  }
  .elsewhen(alu_busy && wb_ports_alu.fire){
    alu_busy := False
  }

  when(stream_bju.fire){
    bju_busy := True
  }
  .elsewhen(bju_busy && wb_ports_bju.fire){
    bju_busy := False
  }

  when(stream_lsu.fire){
    lsu_busy := True
  }
  .elsewhen(lsu_busy && wb_ports_lsu.fire){
    lsu_busy := False
  }

  
  // ==================== connect =============================
  arf.read_ports.rs1_req  := rs1_ren
  arf.read_ports.rs2_req  := rs2_ren
  arf.read_ports.rs1_addr := rs1_addr
  arf.read_ports.rs2_addr := rs2_addr
  arf.write_ports.rd_wen  := write_back.fire && write_back.rd_wen
  arf.write_ports.rd_addr := write_back.rd_addr
  arf.write_ports.rd_data := write_back.rd_data

  decode.pc := pc
  decode.instr := instruction
 
  // ==================== ALU output =============================
  stream_alu.valid := fire && to_alu
  stream_alu.rd_rob_ptr := U(0, ROB_PTR_W bits)
  stream_alu.micro_op := alu_micro_op
  stream_alu.src1_data := src1
  stream_alu.src2_data := src2_is_imm ? imm | src2
  stream_alu >-> to_ports_alu
  if(DIFFTEST){
    stream_alu.pc := pc
    stream_alu.instruction := instruction
  }
  
  // ==================== BJU output =============================
  stream_bju.valid := fire && to_bju
  stream_bju.rd_rob_ptr := U(0, ROB_PTR_W bits)
  stream_bju.micro_op := bju_micro_op
  stream_bju.src1_data := src1
  stream_bju.src2_data := src2_is_imm ? imm | src2
  stream_bju.imm := imm
  stream_bju.pc  := pc
  stream_bju.pc_next  := pc_next
  stream_bju.bpu_pred_taken  := bpu_pred_taken
  stream_bju >-> to_ports_bju
  if(DIFFTEST){
    stream_bju.instruction := instruction
  }

  // ==================== LSU output =============================
  stream_lsu.valid := fire && to_lsu
  stream_lsu.rd_rob_ptr := U(0, ROB_PTR_W bits)
  stream_lsu.micro_op := lsu_micro_op
  stream_lsu.src1_data := src1
  stream_lsu.src2_data := src2
  stream_lsu.imm := imm
  stream_lsu >-> to_ports_lsu
  if(DIFFTEST){
    stream_lsu.pc := pc
    stream_lsu.instruction := instruction
  }

  // ==================== Write Back =============================
  wb_ports_alu.ready := True
  wb_ports_bju.ready := True
  wb_ports_lsu.ready := True
  src_stream.ready := ready

  if(DIFFTEST){
    stream_wb.valid := (fire && trap_or_print) || 
                       (alu_busy && wb_ports_alu.valid) ||
                       (bju_busy && wb_ports_bju.valid) ||
                       (lsu_busy && wb_ports_lsu.valid)
  }                 
  else{
    stream_wb.valid := (alu_busy && wb_ports_alu.valid) ||
                       (bju_busy && wb_ports_bju.valid) ||
                       (lsu_busy && wb_ports_lsu.valid)
  }
  

  stream_wb.rd_addr := rd_addr_reg

  stream_wb.rd_data := alu_busy ? wb_ports_alu.result |
                       (bju_busy ? wb_ports_bju.result |
                       (lsu_busy ? wb_ports_lsu.result | B(0, 64 bits)))
  
  stream_wb.rd_wen := alu_busy ? wb_ports_alu.rd_wen |
                      (bju_busy ? wb_ports_bju.rd_wen |
                      (lsu_busy ? wb_ports_lsu.rd_wen | False))

  stream_wb.rob_ptr := U(0)

  if(DIFFTEST){
    stream_wb.pc := alu_busy ? wb_ports_alu.pc |
                    (bju_busy ? wb_ports_bju.pc |
                    (lsu_busy ? wb_ports_lsu.pc | pc))

    stream_wb.instruction := alu_busy ? wb_ports_alu.instruction |
                             (bju_busy ? wb_ports_bju.instruction |
                             (lsu_busy ? wb_ports_lsu.instruction | instruction))
  }
  stream_wb >-> write_back
  write_back.ready := True

}