package dandriscv.super_scalar

import spinal.core._
import spinal.lib._
import math._
import scala.annotation.switch
import MyUtils._
import CpuConfig._

// ============================================================================
// ===================Predict Target Address Buffer===================
  // ============================================================================
case class PTAB(DEPTH : Int) extends Component{
  var PTR_WIDTH = log2Up(DEPTH)+1
  // =================== IO ===================
  val flush = in Bool()
  val bpu_predict_valid = in Bool() // write valid
  val bpu_predict_taken = in Bool() // write
  val bpu_target_pc = in UInt(PC_WIDTH bits) // write
  val exe_brc_or_jmp = in Bool() // read valid
  val exe_branch_taken = out Bool() //read out
  val exe_target_pc = out UInt(PC_WIDTH bits) //read out

  // =================== Internal Signal ===================
  val read_ptr = Reg(UInt(PTR_WIDTH bits)) init(0)
  val write_ptr= Reg(UInt(PTR_WIDTH bits)) init(0)
  val read_addr = read_ptr(PTR_WIDTH-2 downto 0)
  val write_addr= write_ptr(PTR_WIDTH-2 downto 0)

  // =============== Entries of PTAB =================
  val entry = new Area{
    val branch_taken = Vec(RegInit(False), DEPTH)
    val target_pc = Vec(Reg(UInt(PC_WIDTH bits)) init(0), DEPTH)
  }

  // update read pointer
  when(flush){
    read_ptr := 0
  }.elsewhen(exe_brc_or_jmp){
    read_ptr := read_ptr + 1
  }
  // update write pointer
  when(flush){
    write_ptr := 0
  }.elsewhen(bpu_predict_valid){
    write_ptr := write_ptr + 1
  }

  // update Entries
  for(i <- 0 until DEPTH){
    when(bpu_predict_valid && write_addr===U(i)){
      entry.branch_taken(i) := bpu_predict_taken
      entry.target_pc(i) := bpu_target_pc
    }
  }

  // output
  exe_branch_taken := entry.branch_taken(read_addr)
  exe_target_pc := entry.target_pc(read_addr)
}



// ============================================================================
// ===================Arch Register File===================
  // ============================================================================
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




// ============================================================================
// ===================Registers Alias Table===================
// ============================================================================
case class RAT(p : ReorderBufferConfig) extends Component{
  import p._
  // =================== IO ===================
  // write
  val en_rob_vld_a = in Bool() // write enable a
  val en_rob_rd_addr_a = in UInt(5 bits) // write addr a
  val en_rob_ptr_a = in UInt(PTR_WIDTH bits) // write rob tail ptr a
  val de_rob_vld_a = in Bool() // delete busy bit of a
  val de_rob_rd_addr_a = in UInt(5 bits)// delete busy bit of addr a
  val en_rob_vld_b = in Bool() // write enable b
  val en_rob_rd_addr_b = in UInt(5 bits) // write addr b
  val en_rob_ptr_b = in UInt(PTR_WIDTH bits) // write rob tail ptr b
  val de_rob_vld_b = in Bool() // delete busy bit of b
  val de_rob_rd_addr_b = in UInt(5 bits)// delete busy bit of addr b
  // read port 0
  val rs1_addr_inst0 = in UInt(5 bits)
  val rs2_addr_inst0 = in UInt(5 bits)
  val rs1_ptr_inst0 = out UInt(PTR_WIDTH bits)
  val rs2_ptr_inst0 = out UInt(PTR_WIDTH bits)
  val rs1_busy_inst0 = out Bool()
  val rs2_busy_inst0 = out Bool()
  // read port 1
  val rs1_addr_inst1 = in UInt(5 bits)
  val rs2_addr_inst1 = in UInt(5 bits)
  val rs1_ptr_inst1 = out UInt(PTR_WIDTH bits)
  val rs2_ptr_inst1 = out UInt(PTR_WIDTH bits)
  val rs1_busy_inst1 = out Bool()
  val rs2_busy_inst1 = out Bool()

  // =============== entry =================
  val busy = Vec(RegInit(False), 32)
  val rob_ptr_xn = Vec(Reg(UInt(PTR_WIDTH bits)) init(0), 32)
  val write_enable = Vec(Bool(), 32)
  val write_data = Vec(UInt(PTR_WIDTH bits), 32)
  val clear_enable = Vec(Bool(), 32)
  for(i <- 0 until DEPTH){
    write_enable(i) := (en_rob_vld_a && en_rob_rd_addr_a===U(i)) ||
                       (en_rob_vld_b && en_rob_rd_addr_b===U(i))

    write_data(i) := (en_rob_vld_a && en_rob_rd_addr_a===U(i)) ?
                      en_rob_ptr_a | en_rob_ptr_b

    clear_enable(i) :=(de_rob_vld_a && de_rob_rd_addr_a===U(i)) ||
                      (de_rob_vld_b && de_rob_rd_addr_b===U(i))

    when(clear_enable(i)){
      busy(i) := False
    }
    .elsewhen(write_enable(i)){
      busy(i) := True
    }

    when(write_enable(i)){
      rob_ptr_xn(i) := write_data(i)
    }
  }

  // =============== output =================
  // port 0
  rs1_ptr_inst0 :=  rob_ptr_xn(rs1_addr_inst0)
  rs2_ptr_inst0 :=  rob_ptr_xn(rs2_addr_inst0)

  rs1_ptr_inst1 :=  rob_ptr_xn(rs1_addr_inst1)
  rs2_ptr_inst1 :=  rob_ptr_xn(rs2_addr_inst1)

}