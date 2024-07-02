package dandriscv.super_scalar

import spinal.core._
import spinal.lib._
import math._
import dandriscv.ip._

case class Fetch(resetVector : BigInt = 0x80000000l, p : ICacheConfig) extends Component {
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
  val bpu_predict_pc_next = in UInt(PC_WIDTH bits)
  val dst_ports = master(Stream(FetchDst()))
  

  // ==================== internal signals =============================
  val pc_next = Reg(UInt(PC_WIDTH bits)) init(resetVector)
  val fetch_valid = RegInit(False)
  val rsp_flush = RegInit(False)
  
  val pc_in_stream =  Stream(UInt(PC_WIDTH bits))
  val pc_out_stream = Stream(UInt(PC_WIDTH bits))
  val pc_stream_fifo = FIFO(UInt(PC_WIDTH bits), 4, true)
  val predict_taken_in  = Stream(Bool())
  val predict_taken_out = Stream(Bool())
  val predict_taken_fifo = FIFO(Bool(), 4)
  val instruction_in_stream = Stream(Bits(32 bits))
  val instruction_out_stream =Stream(Bits(32 bits))
  val instruction_stream_fifo = FIFO(Bits(32 bits), 4)
  val fifo_all_valid = pc_out_stream.valid && instruction_out_stream.valid && pc_stream_fifo.next_valid

  val fetchFSM = new Area{
    object FetchEnum extends SpinalEnum(binarySequential) {
      val IDLE, FETCH, HALT = newElement()
    }
    import FetchEnum._

    val fetch_state_next = FetchEnum()
    val fetch_state = RegNext(fetch_state_next) init(IDLE)

    switch(fetch_state){
      is(IDLE) {
        when(!dst_ports.isStall){
          fetch_state_next := FETCH
        }
        .otherwise{
          fetch_state_next := IDLE
        }
      }
      is(FETCH) {
        when(icache_ports.cmd.isStall || dst_ports.isStall){
          fetch_state_next := HALT
        }
        .otherwise{
          fetch_state_next := FETCH
        }
      }
      is(HALT){
        when(icache_ports.cmd.ready && !dst_ports.isStall){
          fetch_state_next := FETCH
        }
        .otherwise{
          fetch_state_next := HALT
        }
      }
      default{
        fetch_state_next := IDLE
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
    
    // use pc_next to fetch instrution
    when(fetch_state_next===FETCH){
      fetch_valid := True
    }
    .otherwise{
      fetch_valid := False
    }

    when(interrupt_vld){
      pc_next := interrupt_pc
    }
    .elsewhen(redirect_vld){
      pc_next := redirect_pc
    }
    .elsewhen(bpu_predict_taken) {
      pc_next := bpu_predict_pc_next
    }
    .elsewhen(icache_ports.cmd.fire){
      pc_next := pc_next + 4
    }

  }

  // output pc and instruction from FIFO or icache_ports
  pc_in_stream.valid   := icache_ports.cmd.fire //all pc stream into FIFO
  pc_in_stream.payload := pc_next
  pc_out_stream.ready  := dst_ports.fire
  pc_in_stream <> pc_stream_fifo.ports.s_ports
  pc_out_stream <> pc_stream_fifo.ports.m_ports
  pc_stream_fifo.flush := flush

  predict_taken_in.valid := icache_ports.cmd.fire
  predict_taken_in.payload := bpu_predict_taken
  predict_taken_out.ready := dst_ports.fire
  predict_taken_in <> predict_taken_fifo.ports.s_ports
  predict_taken_out <> predict_taken_fifo.ports.m_ports
  predict_taken_fifo.flush := flush

  instruction_in_stream.valid   := icache_ports.rsp.valid && !rsp_flush && !flush
  instruction_in_stream.payload := icache_ports.rsp.payload.data
  instruction_out_stream.ready  := dst_ports.fire
  instruction_in_stream <> instruction_stream_fifo.ports.s_ports
  instruction_out_stream <> instruction_stream_fifo.ports.m_ports
  instruction_stream_fifo.flush := flush

  // output
  dst_ports.pc := pc_out_stream.payload
  dst_ports.pc_next := pc_stream_fifo.next_payload // for exe redirect
  dst_ports.instruction := instruction_out_stream.payload
  bpu_predict_valid := icache_ports.cmd.fire // for BPU
  bpu_predict_pc := pc_next // for BPU
  dst_ports.predict_taken := predict_taken_out.payload //for exe redirect
  dst_ports.pc_next := pc_stream_fifo.next_payload
  dst_ports.valid := fifo_all_valid && !dst_ports.isStall && !flush

  // send cmd to icache_ports
  icache_ports.cmd.valid := fetch_valid && !flush
  icache_ports.cmd.addr  := pc_next

}

object GenFetch extends App {
  GenConfig.spinal.generateVerilog(Fetch())
}