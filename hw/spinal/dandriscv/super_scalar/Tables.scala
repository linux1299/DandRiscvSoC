package dandriscv.super_scalar

import spinal.core._
import spinal.lib._
import math._
import scala.annotation.switch
import MyUtils._
import dandriscv.ip._

// Predict Target Address Buffer
case class PTAB(DEPTH : Int) extends Component{
  var PTR_WIDTH = log2Up(DEPTH)+1
  // =================== IO ===================
  val flush = in Bool()
  val bpu_predict_pc = in UInt(PC_WIDTH bits)
  val bpu_predict_taken = in Bool()
  val bpu_target_pc = in UInt(PC_WIDTH bits)
  val exe_brc_or_jmp = in Bool()
  val exe_target_pc = in UInt(PC_WIDTH bits)
  val redirect_vld = out Bool()
  val redirect_pc = out UInt(PC_WIDTH bits)

  // =================== Internal Signal ===================
  val read_ptr = Reg(UInt(PTR_WIDTH bits)) init(0)
  val write_ptr= Reg(UInt(PTR_WIDTH bits)) init(0)
  val read_addr = read_ptr(PTR_WIDTH-2 downto 0)
  val write_addr= write_ptr(PTR_WIDTH-2 downto 0)

  // =============== Entries of PTAB =================
  val entry = new Area{
    val busy = Vec(RegInit(False), DEPTH)
    val target_pc = Vec(Reg(UInt(PC_WIDTH bits)) init(0), DEPTH)
    val next_pc = Vec(Reg(UInt(PC_WIDTH bits)) init(0), DEPTH)
  }

  // update Entries
  for(i <- 0 until DEPTH){
    when(flush){
      entry.busy(i) := False
    }
    .elsewhen(bpu_predict_taken && write_addr===U(i)){
      entry.busy(i) := True
      entry.target_pc(i) := bpu_target_pc
    }
    .elsewhen(exe_brc_or_jmp && read_addr===U(i)){
      entry.busy(i) := False
      entry.next_pc(i) := bpu_predict_pc + 4
    }
  }

  // output
  redirect_vld := exe_brc_or_jmp && 
                  entry.busy(read_addr) && 
                  (entry.target_pc(read_addr) =/= exe_target_pc)
  redirect_pc := entry.next_pc(read_addr)
}

// Arch Register File
case class ARF() extends Component{
  // =================== IO ===================
  val read_ports_a = slave(ARFReadPorts())
  val write_ports_a= slave(ARFWritePorts())
  val read_ports_b = slave(ARFReadPorts())
  val write_ports_b= slave(ARFWritePorts())

  // =================== Internal ===================
  val reg_file = Vec(Reg(Bits(64 bits)) init(0), 32)
  val reg_file_wen_a = Vec(Bool(), 32)
  val reg_file_wen_b = Vec(Bool(), 32)
  val reg_file_wdata = Vec(Bits(64 bits), 32)

  reg_file_wen(0) := False
  for(i <- 1 until 32){
    reg_file_wen_a(i) :=(write_ports_a.rd_wen && write_ports_a.rd_addr===U(i))
    reg_file_wen_b(i) :=(write_ports_b.rd_wen && write_ports_b.rd_addr===U(i))
    reg_file_wdata(i) :=  (B(reg_file_wen_a(i), 64 bits) & write_ports_a.rd_value) |
                          (B(reg_file_wen_b(i), 64 bits) & write_ports_b.rd_value)
    when(reg_file_wen_a(i) || reg_file_wen_b(i)){
      reg_file(i) := reg_file_wdata(i)
    }
  }

  // =================== output ===================
  read_ports_a.rs1_value := reg_file(read_ports_a.rs1_addr)
  read_ports_a.rs2_value := reg_file(read_ports_a.rs2_addr)
  read_ports_b.rs1_value := reg_file(read_ports_b.rs1_addr)
  read_ports_b.rs2_value := reg_file(read_ports_b.rs2_addr)
}

// Regsters Alias Table