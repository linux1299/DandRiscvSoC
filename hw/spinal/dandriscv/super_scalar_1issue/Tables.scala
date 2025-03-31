package dandriscv.super_scalar_1issue

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
  var ROB_PTR_W = log2Up(DEPTH)+1
  // =================== IO ===================
  val flush = in Bool()
  val bpu_predict_valid = in Bool() // write valid
  val bpu_predict_taken = in Bool() // write
  val bpu_target_pc = in UInt(PC_WIDTH bits) // write
  val exe_brc_or_jmp = in Bool() // read valid
  val exe_branch_taken = out Bool() //read out
  val exe_target_pc = out UInt(PC_WIDTH bits) //read out

  // =================== Internal Signal ===================
  val read_ptr = Reg(UInt(ROB_PTR_W bits)) init(0)
  val write_ptr= Reg(UInt(ROB_PTR_W bits)) init(0)
  val read_addr = read_ptr(ROB_PTR_W-2 downto 0)
  val write_addr= write_ptr(ROB_PTR_W-2 downto 0)

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
  val read_ports     = slave(ARFReadPorts())
  val write_ports    = slave(ARFWritePorts())

  // =================== Internal ===================
  val reg_file       = Vec(Reg(Bits(64 bits)) init(0), 32)
  val reg_file_wen   = Vec(Bool(), 32)
  val reg_file_wdata = Vec(Bits(64 bits), 32)

  for(i <- 0 until 32){
    reg_file_wen(i)   := write_ports.rd_wen && write_ports.rd_addr===U(i) && write_ports.rd_addr=/=U(0, 5 bits)
    reg_file_wdata(i) := write_ports.rd_data
    when(reg_file_wen(i)){
      reg_file(i) := reg_file_wdata(i)
    }
  }

  // =================== output ===================
  read_ports.rs1_data := (write_ports.rd_wen && write_ports.rd_addr===read_ports.rs1_addr) ? write_ports.rd_data | reg_file(read_ports.rs1_addr)
  read_ports.rs2_data := (write_ports.rd_wen && write_ports.rd_addr===read_ports.rs2_addr) ? write_ports.rd_data | reg_file(read_ports.rs2_addr)
}




// ============================================================================
// ===================Registers Alias Table===================
// ============================================================================
case class RAT() extends Component{

  // =================== IO ===================
  val flush = in Bool()
  // port a
  val en_rob_vld     = in Bool() // write enable a
  val en_rob_rd_addr = in UInt(5 bits) // write addr a
  val en_rob_ptr     = in UInt(ROB_PTR_W bits) // write rob tail ptr a
  val de_rob_vld     = in Bool() // delete busy bit of a
  val de_rob_rd_addr = in UInt(5 bits)// delete busy bit of addr a
  val de_rob_ptr     = in UInt(ROB_PTR_W bits)

  // read port 0
  val rs1_addr = in UInt(5 bits)
  val rs2_addr = in UInt(5 bits)
  val rs1_ptr  = out UInt(ROB_PTR_W bits)
  val rs2_ptr  = out UInt(ROB_PTR_W bits)
  val rs1_busy = out Bool()
  val rs2_busy = out Bool()

  // =============== entry =================
  val busy = Vec(RegInit(False), 32)
  val rob_ptr_xn = Vec(Reg(UInt(ROB_PTR_W bits)) init(0), 32)
  val write_enable = Vec(Bool(), 32)
  val clear_enable = Vec(Bool(), 32)
  for(i <- 0 until 32){
    write_enable(i) := (en_rob_vld && en_rob_rd_addr===U(i))

    clear_enable(i) := (de_rob_vld && de_rob_rd_addr===U(i) && de_rob_ptr===rob_ptr_xn(i))

    when(flush){
      busy(i) := False
    }
    .elsewhen(write_enable(i)){
      busy(i) := True
    }
    .elsewhen(clear_enable(i)){
      busy(i) := False
    }

    when(flush){
      rob_ptr_xn(i) := 0
    }
    .elsewhen(write_enable(i)){
      rob_ptr_xn(i) := en_rob_ptr
    }
  }

  // =============== output =================
  // rs1
  rs1_busy := clear_enable(rs1_addr) ? False | busy(rs1_addr)
  rs1_ptr  := rob_ptr_xn(rs1_addr)
  // rs2
  rs2_busy := clear_enable(rs2_addr) ? False | busy(rs2_addr)
  rs2_ptr  := rob_ptr_xn(rs2_addr)
  
}