package dandriscv.super_scalar

import spinal.core._
import spinal.lib._
import math._

case class Fetch(resetVector : Int = 0x30000000, p : ICacheConfig) extends Component {
  import p._
  import CpuConfig._

  // ==================== IO =============================
  val flush = in Bool()
  val stall = in Bool()
  val interrupt_vld = in Bool()
  val interrupt_pc = in UInt(PC_WIDTH bits)
  val redirect_vld = in Bool()
  val redirect_pc = in UInt(PC_WIDTH bits)
  val icache_ports = master(Stream(ICacheAccess(PC_WIDTH, cpuDataWidth)))
  val bpu_predict_pc = out UInt(PC_WIDTH bits)
  val bpu_predict_valid = out Bool()
  val bpu_predict_taken = in Bool()
  val bpu_target_pc = in UInt(PC_WIDTH bits)
  val dst_ports = master(Stream(FetchDst()))
  

  // ==================== internal signals =============================
  val pc = Reg(UInt(PC_WIDTH bits)) init(resetVector)
  val fetch_valid = RegInit(False)
  val rsp_flush = RegInit(False)
  
  val pc_in_stream =  Stream(UInt(PC_WIDTH bits))
  val pc_out_stream = Stream(UInt(PC_WIDTH bits))
  val pc_stream_fifo = FIFO(UInt(PC_WIDTH bits), 4)
  val instr_in_stream = Stream(Bits(32 bits))
  val instr_out_stream =Stream(Bits(32 bits))
  val instr_stream_fifo = FIFO(Bits(32 bits), 4)
  val fifo_all_valid = pc_out_stream.valid && instr_out_stream.valid

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
        when(icache_ports.cmd.isStall || dst_ports.isStall){
          state_next := HALT
        }
        .otherwise{
          state_next := FETCH
        }
      }
      is(HALT){
        when(icache_ports.cmd.ready && !dst_ports.isStall){
          state_next := FETCH
        }
        .otherwise{
          state_next := HALT
        }
      }
      default{
        state_next := IDLE
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
    .elsewhen(bpu_predict_taken) {
      pc := bpu_target_pc
    }
    .elsewhen(icache_ports.cmd.fire){
      pc := pc + 4
    }

  }

  // output pc and instruction from FIFO or icache_ports
  pc_in_stream.valid   := icache_ports.cmd.fire //all pc stream into FIFO
  pc_in_stream.payload := pc
  pc_out_stream.ready  := dst_ports.fire
  pc_in_stream <> pc_stream_fifo.ports.s_ports
  pc_out_stream <> pc_stream_fifo.ports.m_ports
  pc_stream_fifo.flush := flush

  instr_in_stream.valid   := icache_ports.rsp.valid && !rsp_flush && !flush
  instr_in_stream.payload := icache_ports.rsp.payload.data
  instr_out_stream.ready  := dst_ports.fire
  instr_in_stream <> instr_stream_fifo.ports.s_ports
  instr_out_stream <> instr_stream_fifo.ports.m_ports
  instr_stream_fifo.flush := flush

  // output
  dst_ports.pc := pc_out_stream.payload
  dst_ports.pc := pc_stream_fifo.next_payload // for exe redirect
  dst_ports.instruction := instr_out_stream.payload
  bpu_predict_valid := icache_ports.cmd.fire // for BPU
  bpu_predict_pc := pc // for BPU
  dst_ports.predict_taken := bpu_predict_taken //for exe redirect
  dst_ports.pc := pc_stream_fifo.next_payload
  dst_ports.valid := fifo_all_valid && !dst_ports.isStall && !flush

  // send cmd to icache_ports
  icache_ports.cmd.valid := fetch_valid && !flush
  icache_ports.cmd.addr  := pc

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