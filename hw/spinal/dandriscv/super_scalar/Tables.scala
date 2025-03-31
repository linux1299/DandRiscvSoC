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

  for(i <- 0 until 32){
    reg_file_wen_a(i) :=(write_ports_a.rd_wen && write_ports_a.rd_addr===U(i))
    reg_file_wen_b(i) :=(write_ports_b.rd_wen && write_ports_b.rd_addr===U(i))
    reg_file_wdata(i) := reg_file_wen_a(i) ? write_ports_a.rd_data | write_ports_b.rd_data
    when(reg_file_wen_a(i) || reg_file_wen_b(i)){
      reg_file(i) := reg_file_wdata(i)
    }
  }

  // =================== output ===================
  read_ports_a.rs1_data := reg_file(read_ports_a.rs1_addr)
  read_ports_a.rs2_data := reg_file(read_ports_a.rs2_addr)
  read_ports_b.rs1_data := reg_file(read_ports_b.rs1_addr)
  read_ports_b.rs2_data := reg_file(read_ports_b.rs2_addr)
}

case class ARF_1issue() extends Component{
  // =================== IO ===================
  val read_ports     = slave(ARFReadPorts())
  val write_ports    = slave(ARFWritePorts())

  // =================== Internal ===================
  val reg_file       = Vec(Reg(Bits(64 bits)) init(0), 32)
  val reg_file_wen   = Vec(Bool(), 32)
  val reg_file_wdata = Vec(Bits(64 bits), 32)

  for(i <- 0 until 32){
    reg_file_wen(i)   := write_ports.rd_wen && write_ports.rd_addr===U(i)
    reg_file_wdata(i) := write_ports.rd_data
    when(reg_file_wen(i)){
      reg_file(i) := reg_file_wdata(i)
    }
  }

  // =================== output ===================
  read_ports.rs1_data := reg_file(read_ports.rs1_addr)
  read_ports.rs2_data := reg_file(read_ports.rs2_addr)
}




// ============================================================================
// ===================Registers Alias Table===================
// ============================================================================
case class RAT(p : ReorderBufferConfig) extends Component{
  import p._
  // =================== IO ===================
  val flush = in Bool()
  // port a
  val en_rob_vld_a = in Bool() // write enable a
  val en_rob_rd_addr_a = in UInt(5 bits) // write addr a
  val en_rob_ptr_a = in UInt(PTR_WIDTH bits) // write rob tail ptr a
  val de_rob_vld_a = in Bool() // delete busy bit of a
  val de_rob_rd_addr_a = in UInt(5 bits)// delete busy bit of addr a
  val de_rob_ptr_a = in UInt(PTR_WIDTH bits)
  // port b
  val en_rob_vld_b = in Bool() // write enable b
  val en_rob_rd_addr_b = in UInt(5 bits) // write addr b
  val en_rob_ptr_b = in UInt(PTR_WIDTH bits) // write rob tail ptr b
  val de_rob_vld_b = in Bool() // delete busy bit of b
  val de_rob_rd_addr_b = in UInt(5 bits)// delete busy bit of addr b
  val de_rob_ptr_b = in UInt(PTR_WIDTH bits)
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
  for(i <- 0 until 32){
    write_enable(i) := (en_rob_vld_a && en_rob_rd_addr_a===U(i)) ||
                       (en_rob_vld_b && en_rob_rd_addr_b===U(i))

    write_data(i) := (en_rob_vld_b && en_rob_rd_addr_b===U(i)) ?
                      en_rob_ptr_b | en_rob_ptr_a

    clear_enable(i) :=(de_rob_vld_a && de_rob_rd_addr_a===U(i) && de_rob_ptr_a===rob_ptr_xn(i)) ||
                      (de_rob_vld_b && de_rob_rd_addr_b===U(i) && de_rob_ptr_b===rob_ptr_xn(i))

    when(clear_enable(i) || flush){
      busy(i) := False
    }
    .elsewhen(write_enable(i)){
      busy(i) := True
    }

    when(flush){
      rob_ptr_xn(i) := 0
    }
    .elsewhen(write_enable(i)){
      rob_ptr_xn(i) := write_data(i)
    }
  }

  // =============== output =================
  // port 0 rs1
  rs1_busy_inst0 := busy(rs1_addr_inst0)
  rs1_ptr_inst0 :=  rob_ptr_xn(rs1_addr_inst0)
  // port 0 rs1
  rs2_busy_inst0 := busy(rs2_addr_inst0)
  rs2_ptr_inst0 :=  rob_ptr_xn(rs2_addr_inst0)
  
  // port 1 rs1
  rs1_busy_inst1 := ((rs1_addr_inst1===en_rob_rd_addr_a) && en_rob_vld_a) ? True | busy(rs1_addr_inst1) 
  rs1_ptr_inst1 :=  ((rs1_addr_inst1===en_rob_rd_addr_a) && en_rob_vld_a) ? en_rob_ptr_a | rob_ptr_xn(rs1_addr_inst1)// bypass previous en rob ptr
  // port 1 rs2
  rs2_busy_inst1 := ((rs2_addr_inst1===en_rob_rd_addr_a) && en_rob_vld_a) ? True | busy(rs2_addr_inst1)
  rs2_ptr_inst1 :=  ((rs2_addr_inst1===en_rob_rd_addr_a) && en_rob_vld_a) ? en_rob_ptr_a | rob_ptr_xn(rs2_addr_inst1)// bypass previous en rob ptr
}

case class RAT_1issue(p : ReorderBufferConfig) extends Component{
  import p._
  // =================== IO ===================
  val flush = in Bool()
  // port a
  val en_rob_vld     = in Bool() // write enable a
  val en_rob_rd_addr = in UInt(5 bits) // write addr a
  val en_rob_ptr     = in UInt(PTR_WIDTH bits) // write rob tail ptr a
  val de_rob_vld     = in Bool() // delete busy bit of a
  val de_rob_rd_addr = in UInt(5 bits)// delete busy bit of addr a
  val de_rob_ptr     = in UInt(PTR_WIDTH bits)

  // read port 0
  val rs1_addr = in UInt(5 bits)
  val rs2_addr = in UInt(5 bits)
  val rs1_ptr  = out UInt(PTR_WIDTH bits)
  val rs2_ptr  = out UInt(PTR_WIDTH bits)
  val rs1_busy = out Bool()
  val rs2_busy = out Bool()

  // =============== entry =================
  val busy = Vec(RegInit(False), 32)
  val rob_ptr_xn = Vec(Reg(UInt(PTR_WIDTH bits)) init(0), 32)
  val write_enable = Vec(Bool(), 32)
  val clear_enable = Vec(Bool(), 32)
  for(i <- 0 until 32){
    write_enable(i) := (en_rob_vld && en_rob_rd_addr===U(i))

    clear_enable(i) := (de_rob_vld && de_rob_rd_addr===U(i) && de_rob_ptr===rob_ptr_xn(i))

    when(clear_enable(i) || flush){
      busy(i) := False
    }
    .elsewhen(write_enable(i)){
      busy(i) := True
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
  rs1_busy := busy(rs1_addr)
  rs1_ptr  := rob_ptr_xn(rs1_addr)
  // rs2
  rs2_busy := busy(rs2_addr)
  rs2_ptr  := rob_ptr_xn(rs2_addr)
  
}