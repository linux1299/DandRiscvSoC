package dandriscv.super_scalar

import spinal.core._
import spinal.lib._
import math._

import scala.util.Random

case class ALU() extends Component {
  import CpuConfig._
  import AluCtrlEnum._

  // =================== IO ===================
  val flush = in Bool()
  val stall = in Bool()
  val src_ports = slave(Stream(DeQueue("ALU")))
  val dst_ports = master(Stream(ExeDst()))



  // =================== signals ===================
  val src1 = src_ports.src1_data
  val src2 = src_ports.src2_data
  val src1_word = src1(31 downto 0)
  val src2_word = src2(31 downto 0)
  val shift_bits = src2(5 downto 0).asUInt
  val add_result = src1.asSInt + src2.asSInt //SInt(64 bits)
  val sub_result = src1.asSInt - src2.asSInt //SInt(64 bits)
  val slt_result = src1.asSInt < src2.asSInt //Bool()
  val sltu_result = src1.asUInt < src2.asUInt //Bool()
  val xor_result = src1 ^ src2 //Bits(64 bits)
  val sll_result = src1 |<< shift_bits //Bits(64 bits)
  val srl_result = src1 |>> shift_bits //Bits(64 bits)
  val sra_result = src1.asSInt |>> shift_bits //SInt(64 bits)
  val and_result = src1 & src2 //Bits(64 bits)
  val or_result = src1 | src2 //Bits(64 bits)
  val addw_result = B((31 downto 0) -> add_result(31)) ## add_result(31 downto 0)
  val subw_result = B((31 downto 0) -> sub_result(31)) ## sub_result(31 downto 0)
  val sllw_temp = src1_word |<< shift_bits(4 downto 0)
  val sllw_result = B((31 downto 0) -> sllw_temp(31)) ## sllw_temp
  val srlw_temp = src1_word |>> shift_bits(4 downto 0)
  val srlw_result = B((31 downto 0) -> srlw_temp(31)) ## srlw_temp
  val sraw_temp = src1_word.asSInt |>> shift_bits(4 downto 0)
  val sraw_result = B((31 downto 0) -> sraw_temp(31)) ## sraw_temp
  val alu_result = Bits(64 bits)

  val alu_ctrl_op = src_ports.micro_op.alu_ctrl_op
  val alu_is_word = src_ports.micro_op.alu_is_word

  val alu_is_mul =
    (alu_ctrl_op === MUL) ||
    (alu_ctrl_op === MULH) ||
    (alu_ctrl_op === MULHSU) ||
    (alu_ctrl_op === MULHU) ||
    (alu_ctrl_op === MULW)

  val alu_is_quo =
    (alu_ctrl_op === DIV) ||
    (alu_ctrl_op === DIVU) ||
    (alu_ctrl_op === DIVW) ||
    (alu_ctrl_op === DIVUW)

  val alu_is_rem =
    (alu_ctrl_op === REM) ||
    (alu_ctrl_op === REMU) ||
    (alu_ctrl_op === REMW) ||
    (alu_ctrl_op === REMUW)

  val alu_is_div = alu_is_quo || alu_is_rem


  val src_stream = src_ports.haltWhen(stall).throwWhen(flush)
  val dst_stream = Stream(ExeDst())

  // ================= caclulate alu result =====================
  switch(alu_ctrl_op) {
    is(ADD) {
      when(alu_is_word) {
        alu_result := addw_result
      }.otherwise {
        alu_result := add_result.asBits
      }
    }
    is(SUB) {
      when(alu_is_word) {
        alu_result := subw_result
      }.otherwise {
        alu_result := sub_result.asBits
      }
    }
    is(SLT) {
      alu_result := B(64 - 1 bits, (64 - 2 downto 0) -> false) ## slt_result
    }
    is(SLTU) {
      alu_result := B(64 - 1 bits, (64 - 2 downto 0) -> false) ## sltu_result
    }
    is(XOR) {
      alu_result := xor_result
    }
    is(SLL) {
      when(alu_is_word) {
        alu_result := sllw_result
      }.otherwise {
        alu_result := sll_result
      }
    }
    is(SRL) {
      when(alu_is_word) {
        alu_result := srlw_result
      }.otherwise {
        alu_result := srl_result
      }
    }
    is(SRA) {
      when(alu_is_word) {
        alu_result := sraw_result
      }.otherwise {
        alu_result := sra_result.asBits
      }
    }
    is(AND) {
      alu_result := and_result
    }
    is(OR) {
      alu_result := or_result
    }
    is(LUI) {
      alu_result := src2
    }
    default {
      alu_result := B(0)
    }
  }

  // ================= caclulate multiply =====================
  val mul = Multiplier()
  mul.io.op_is_word := alu_is_word
  mul.io.src1_is_signed :=
    (alu_ctrl_op === MUL) ||
    (alu_ctrl_op === MULH) ||
    (alu_ctrl_op === MULHSU)

  mul.io.src2_is_signed :=
    (alu_ctrl_op === MUL) ||
    (alu_ctrl_op === MULH)

  mul.io.src1 := src1
  mul.io.src2 := src2

  val mul_result_low = mul.io.result_low
  val mul_result_high = mul.io.result_high
  val mul_result = Bits(64 bits)
  mul_result := alu_is_word ?
    (B((31 downto 0) -> mul_result_low(31)) ## mul_result_low(31 downto 0)) |
    ((alu_ctrl_op === MUL || alu_ctrl_op === MULH) ?
      mul_result_low | mul_result_high)

  // ================= caclulate div =====================
  val div = Divider()
  div.io.flush := flush
  div.io.start := src_stream.fire && (
    (alu_ctrl_op === DIV)   ||
    (alu_ctrl_op === DIVU)  ||
    (alu_ctrl_op === REM)   ||
    (alu_ctrl_op === REMU)  ||
    (alu_ctrl_op === DIVW)  ||
    (alu_ctrl_op === DIVUW) ||
    (alu_ctrl_op === REMW)  ||
    (alu_ctrl_op === REMUW)
  )
  div.io.done_ready := dst_stream.ready
  div.io.op_is_word := alu_is_word
  div.io.op_is_signed :=
    (alu_ctrl_op === DIV)  ||
    (alu_ctrl_op === REM)  ||
    (alu_ctrl_op === DIVW) ||
    (alu_ctrl_op === REMW)
  div.io.dividend := src1
  div.io.divisor := src2
  val div_result_quotient = div.io.quotient
  val div_result_remainder = div.io.remainder

  // ================= stream control =====================
  src_stream.ready := dst_stream.ready
  dst_stream.valid := (!alu_is_div && !div.io.busy && src_stream.valid) || div.io.done_valid
  dst_stream.rd_wen := src_stream.micro_op.rd_wen
  dst_stream.rd_rob_ptr := src_stream.rd_rob_ptr
  dst_stream.result := alu_is_mul ? mul_result |
    (alu_is_quo ? div_result_quotient |
      (alu_is_rem ? div_result_remainder | alu_result)
      )
  if(DIFFTEST){
    dst_stream.pc := src_stream.pc
    dst_stream.instruction := src_stream.instruction
  }
  dst_stream >-> dst_ports

}

object GenALU extends App {
  GenConfig.spinal.generateVerilog(ALU())
}

import spinal.sim._
import spinal.core.sim._

object TestALU {
  def main(args: Array[String]): Unit = {

    SimConfig.withConfig(GenConfig.spinal).withFstWave.compile(ALU()).doSim { dut =>
      // rst
      fork {
        dut.clockDomain.assertReset()
        dut.clockDomain.fallingEdge()
        sleep(15)
        dut.clockDomain.deassertReset()
      }
      // clk
      fork {
        while (true) {
          dut.clockDomain.clockToggle()
          sleep(5)
        }
      }
      // sim
      for (idx <- 0 until 10) {
        val src1, src2 = Random.nextInt(256)
        // Drive the dut inputs with random values
        dut.flush #= false
        dut.stall #= false
        dut.src_ports.valid #= true
        dut.src_ports.micro_op.alu_ctrl_op #= AluCtrlEnum.MUL
        dut.src_ports.micro_op.src2_is_imm #= false
        dut.src_ports.micro_op.alu_is_word #= false
        dut.src_ports.src1_data #= src1
        dut.src_ports.src2_data #= src2
        dut.dst_ports.ready #= true
        // Wait a rising edge on the clock
        dut.clockDomain.waitRisingEdge()
      }

      SimTimeout(1000 * 100)
    }
  }
}
