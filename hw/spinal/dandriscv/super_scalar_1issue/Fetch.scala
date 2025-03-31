package dandriscv.super_scalar_1issue

import spinal.core._
import spinal.lib._
import math._
import dandriscv.Riscv._

case class Fetch(resetVector : BigInt, p : ICacheConfig, fifoDepth : Int = 4) extends Component {
  import p._
  import CpuConfig._

  // ==================== IO =============================
  val flush = in Bool()
  val stall = in Bool()
  val interrupt_vld = in Bool()
  val interrupt_pc = in UInt(PC_WIDTH bits)
  val redirect_vld = in Bool()
  val redirect_pc = in UInt(PC_WIDTH bits)
  val icache_ports = master(ICacheAccess(PC_WIDTH, cpuDataWidth))
  val bpu_predict_pc = out UInt(PC_WIDTH bits)
  val bpu_predict_valid = out Bool()
  val bpu_predict_taken = in Bool()
  val bpu_target_pc = in UInt(PC_WIDTH bits)
  val dst_ports = master(Stream(FetchDst(DW=cpuDataWidth)))
  // static BP
  val bpu_predict_imm = (BPU_TYPE=="static") generate out Bits(64 bits)
  val bpu_predict_jal = (BPU_TYPE=="static") generate out Bool()
  val bpu_predict_branch = (BPU_TYPE=="static") generate out Bool()
  

  // ==================== internal signals =============================
  val pc = Reg(UInt(32 bits)) init(resetVector)
  val fetch_valid = RegInit(False)
  val rsp_flush = RegInit(False)
  val pc_in_stream =  Stream(UInt(PC_WIDTH bits))
  val pc_out_stream = Stream(UInt(PC_WIDTH bits))
  val pc_stream_fifo = FIFO(UInt(PC_WIDTH bits), fifoDepth, true)
  val pc_next_in_stream =  (BPU_TYPE=="static") generate Stream(UInt(PC_WIDTH bits))
  val pc_next_out_stream = (BPU_TYPE=="static") generate Stream(UInt(PC_WIDTH bits))
  val pc_next_stream_fifo = (BPU_TYPE=="static") generate FIFO(UInt(PC_WIDTH bits), fifoDepth, true)
  val bpu_pred_taken_in  = Stream(Bool()) // input(BPU_BRANCH_TAKEN)
  val bpu_pred_taken_out = Stream(Bool())
  val bpu_pred_taken_fifo = FIFO(Bool(), fifoDepth)
  val instr_in_stream = Stream(Bits(cpuDataWidth bits))
  val instr_out_stream =Stream(Bits(cpuDataWidth bits))
  val instr_stream_fifo = FIFO(Bits(cpuDataWidth bits), fifoDepth)
  val fifo_all_valid = Bool()
  if(BPU_TYPE=="gshare"){
    fifo_all_valid := pc_out_stream.valid && instr_out_stream.valid && pc_stream_fifo.next_valid
  }
  else if(BPU_TYPE=="static"){
    fifo_all_valid := pc_out_stream.valid && instr_out_stream.valid && pc_next_out_stream.valid
  }
  
  val fifo_all_ready = pc_stream_fifo.has_space && bpu_pred_taken_fifo.has_space && instr_stream_fifo.has_space

  val fetchFSM = new Area{
    object FetchEnum extends SpinalEnum(binarySequential) {
      val IDLE, FETCH, HALT = newElement()
    }
    import FetchEnum._

    val state_next = FetchEnum()
    val state_curr = RegNext(state_next) init(IDLE)

    switch(state_curr){
      is(IDLE) {
        when(!dst_ports.isStall){
          state_next := FETCH
        }
        .otherwise{
          state_next := IDLE
        }
      }
      is(FETCH) {
        when(icache_ports.cmd.isStall || !fifo_all_ready){
          state_next := HALT
        }
        .otherwise{
          state_next := FETCH
        }
      }
      is(HALT){
        when(icache_ports.cmd.ready && fifo_all_ready){
          state_next := FETCH
        }
        .otherwise{
          state_next := HALT
        }
      }
    }

    // when fetch is stalling and need jump, invalid prev rsp
    when(!icache_ports.cmd.ready){
      when(interrupt_vld){
        rsp_flush := True
      }
      .elsewhen(redirect_vld){
        rsp_flush := True
      }
      .elsewhen(bpu_predict_taken){
        rsp_flush := True
      }
    }
    .elsewhen(icache_ports.rsp.fire){
      rsp_flush := False
    }
    
    // use pc to fetch instrution
    when(state_next===FETCH){
      fetch_valid := True
    }
    .otherwise{
      fetch_valid := False
    }

    when(interrupt_vld){
      pc := interrupt_pc
    }
    .elsewhen(redirect_vld){
      pc := redirect_pc
    }
    // .elsewhen(bpu_predict_taken && state_next=/=HALT) {
    .elsewhen(bpu_predict_taken) {
      pc := bpu_target_pc
    }
    .elsewhen(icache_ports.cmd.fire){
      pc := pc + 4
    }

  }

  // PC FIFO
  pc_in_stream.valid   := icache_ports.cmd.fire //all pc stream into FIFO
  pc_in_stream.payload := pc
  pc_out_stream.ready  := dst_ports.fire
  pc_in_stream <> pc_stream_fifo.ports.s_ports
  pc_out_stream <> pc_stream_fifo.ports.m_ports
  pc_stream_fifo.flush := flush

  // PC NEXT FIFO
  if(BPU_TYPE=="static"){
    // pc_next_in_stream.valid   := icache_ports.rsp.valid // static
    pc_next_in_stream.valid   := instr_in_stream.valid // static
    pc_next_in_stream.payload := bpu_target_pc
    pc_next_out_stream.ready  := dst_ports.fire
    pc_next_in_stream <> pc_next_stream_fifo.ports.s_ports
    pc_next_out_stream <> pc_next_stream_fifo.ports.m_ports
    pc_next_stream_fifo.flush := flush

    // bpu_pred_taken_in.valid := icache_ports.rsp.valid //static
    bpu_pred_taken_in.valid := instr_in_stream.valid //static
  }
  else if(BPU_TYPE=="gshare"){
    bpu_pred_taken_in.valid := icache_ports.cmd.fire
  }
  
  // BPU taken FIFO
  bpu_pred_taken_in.payload := bpu_predict_taken
  bpu_pred_taken_out.ready := dst_ports.fire
  bpu_pred_taken_in <> bpu_pred_taken_fifo.ports.s_ports
  bpu_pred_taken_out <> bpu_pred_taken_fifo.ports.m_ports
  bpu_pred_taken_fifo.flush := flush

  // Instruction FIFO
  instr_in_stream.valid   := icache_ports.rsp.valid && !rsp_flush && !flush
  instr_in_stream.payload := icache_ports.rsp.data
  instr_out_stream.ready  := dst_ports.fire
  instr_in_stream <> instr_stream_fifo.ports.s_ports
  instr_out_stream <> instr_stream_fifo.ports.m_ports
  instr_stream_fifo.flush := flush

  // output
  dst_ports.pc := pc_out_stream.payload
  dst_ports.bpu_pred_taken := bpu_pred_taken_out.payload
  dst_ports.instruction    := instr_out_stream.payload
  dst_ports.valid := fifo_all_valid && !flush
  icache_ports.cmd.addr  := pc

  if(BPU_TYPE=="static"){
    val op_is_jal = (icache_ports.rsp.data(opcodeRange)===OP_JAL)
    val op_is_branch = (icache_ports.rsp.data(opcodeRange)===OP_BRANCH)
    val imm_all = IMM_ALL(icache_ports.rsp.data, 64)
    bpu_predict_imm    := op_is_jal ? imm_all.j_sext | (op_is_branch ? imm_all.b_sext | B(0))
    bpu_predict_jal    := op_is_jal
    bpu_predict_branch := op_is_branch

    val pc_reg = RegNextWhen(pc, icache_ports.cmd.fire)
    dst_ports.pc_next := pc_next_out_stream.payload // static BP
    // bpu_predict_valid := icache_ports.rsp.valid // for static BPU
    bpu_predict_valid := instr_in_stream.valid // for static BPU
    bpu_predict_pc := pc_reg // for static BPU
    icache_ports.cmd.valid := fetch_valid && !flush && !bpu_predict_taken
  }
  else if(BPU_TYPE=="gshare"){
    dst_ports.pc_next := pc_stream_fifo.next_payload
    bpu_predict_valid := icache_ports.cmd.fire
    bpu_predict_pc := pc
    icache_ports.cmd.valid := fetch_valid && !flush
  }
  

}

case class FetchStage(resetVector : BigInt, p : ICacheConfig) extends Component {
  import p._
  import CpuConfig._

  // ==================== IO =============================
  val flush = in Bool()
  val stall = in Bool()
  val interrupt_vld = in Bool()
  val interrupt_pc = in UInt(PC_WIDTH bits)
  val redirect_vld = in Bool()
  val redirect_pc = in UInt(PC_WIDTH bits)
  val icache_ports = master(ICacheAccess(PC_WIDTH, cpuDataWidth))
  val bpu_predict_pc = out UInt(PC_WIDTH bits)
  val bpu_predict_valid = out Bool()
  val bpu_predict_taken = in Bool()
  val bpu_target_pc = in UInt(PC_WIDTH bits)
  val dst_ports = master(Stream(FetchDst(DW=32)))
  // static BP
  val bpu_predict_imm = out Bits(64 bits)
  val bpu_predict_jal = out Bool()
  val bpu_predict_branch = out Bool()

  // ==================== inst =============================
  val fetch = new Fetch(resetVector, p)
  fetch.flush := flush
  fetch.stall := stall
  fetch.interrupt_vld := interrupt_vld
  fetch.interrupt_pc := interrupt_pc
  fetch.redirect_vld := redirect_vld
  fetch.redirect_pc := redirect_pc
  icache_ports.cmd <> fetch.icache_ports.cmd
  icache_ports.rsp <> fetch.icache_ports.rsp
  fetch.bpu_target_pc := bpu_target_pc
  fetch.bpu_predict_taken := bpu_predict_taken
  bpu_predict_pc := fetch.bpu_predict_pc
  bpu_predict_valid := fetch.bpu_predict_valid
  bpu_predict_imm := fetch.bpu_predict_imm
  bpu_predict_jal := fetch.bpu_predict_jal
  bpu_predict_branch := fetch.bpu_predict_branch

  // ==================== to stream =============================
  val src_stream = fetch.dst_ports.haltWhen(stall).throwWhen(flush)
  src_stream >-> dst_ports

}

object GenFetch extends App {
  GenConfig.spinal.generateVerilog(Fetch(0x30000000, ICacheConfig(
    cacheSize = 32*1024, // 32 KB
    bytePerLine = 64,
    wayCount = 2,
    addressWidth = 32,
    cpuDataWidth = 64,
    bankWidth = 32,
    busDataWidth = 64,
    directOutput = false,
    noBurst=true
  )))
}