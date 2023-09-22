package dandriscv.plugin_simple

import spinal.core._
import spinal.lib._
import spinal.lib.fsm._

import dandriscv._
import dandriscv.ip._
import dandriscv.plugin._
import dandriscv.plugin_simple._
import scala.tools.reflect.FastTrack


class FetchPlugin(resetVector : BigInt = 0x80000000l, addressWidth : Int = 64) //
extends Plugin[DandRiscvSimple]
with ICacheAccessService
{

  @dontName var icache_access : ICacheAccess = null
  override def newICacheAccess(): ICacheAccess = {
    assert(icache_access == null)
    icache_access = ICacheAccess(addressWidth, 32)
    icache_access
  }

  override def setup(pipeline: DandRiscvSimple): Unit = {
    import Riscv._
    import pipeline.config._
  }
  
  override def build(pipeline: DandRiscvSimple): Unit = {
    import pipeline._
    import pipeline.config._

    fetch plug new Area{
      import fetch._

      val pc_next = Reg(UInt(pipeline.config.addressWidth bits)).setName("pc_next") init(resetVector)
      val fetch_valid = RegInit(False).setName("fetch_valid")
      val rsp_flush = RegInit(False).setName("rsp_flush")
      val fetch_flush = (output(INT_EN) || arbitration.flushIt)
      val bpu_predict_taken = input(BPU_BRANCH_TAKEN) && icache_access.cmd.fire
      
      val pc_in_stream =  Stream(UInt(pipeline.config.addressWidth bits))
      val pc_out_stream = Stream(UInt(pipeline.config.addressWidth bits))
      val pc_stream_fifo = FIFO(UInt(pipeline.config.addressWidth bits), 4, true)
      val predict_taken_in  = Stream(Bool()) // input(BPU_BRANCH_TAKEN)
      val predict_taken_out = Stream(Bool())
      val predict_taken_fifo = FIFO(Bool(), 4)
      val instruction_in_stream = Stream(Bits(32 bits))
      val instruction_out_stream =Stream(Bits(32 bits))
      val instruction_stream_fifo = FIFO(Bits(32 bits), 4)
      val fifo_all_valid = pc_out_stream.valid && instruction_out_stream.valid && pc_stream_fifo.next_valid

      val fetchFSM = new Area{
        val IDLE  = U(0 , 2 bits).setName("IDLE")
        val FETCH = U(1 , 2 bits).setName("FETCH")
        val HALT  = U(3 , 2 bits).setName("HALT")
        val fetch_state_next = UInt(2 bits).setName("fetch_state_next")
        val fetch_state = RegNext(fetch_state_next).setName("fetch_state") init(IDLE)

        switch(fetch_state){
          is(IDLE) {
            when(!arbitration.isStuck){
              fetch_state_next := FETCH
            }
            .otherwise{
              fetch_state_next := IDLE
            }
          }
          is(FETCH) {
            when(icache_access.cmd.isStall || arbitration.isStuck){
              fetch_state_next := HALT
            }
            .otherwise{
              fetch_state_next := FETCH
            }
          }
          is(HALT){
            when(icache_access.cmd.ready && !arbitration.isStuck){
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
        when(!icache_access.cmd.ready){
          when(output(INT_EN)){
            rsp_flush := True
          }
          .elsewhen(execute.output(REDIRECT_VALID)){
            rsp_flush := True
          }
          .elsewhen(bpu_predict_taken){
            rsp_flush := True
          }
        }
        .elsewhen(icache_access.rsp.fire){
          rsp_flush := False
        }
        
        // use pc_next to fetch instrution
        when(fetch_state_next===FETCH){
          fetch_valid := True
        }
        .otherwise{
          fetch_valid := False
        }

        when(output(INT_EN)){
          pc_next := output(INT_PC)
        }
        .elsewhen(execute.output(REDIRECT_VALID)){
          pc_next := execute.output(REDIRECT_PC_NEXT)
        }
        .elsewhen(bpu_predict_taken) {
          pc_next := input(BPU_PC_NEXT)
        }
        .elsewhen(icache_access.cmd.fire){
          pc_next := pc_next + 4
        }

      }

      // output pc and instruction from FIFO or icache
      pc_in_stream.valid   := icache_access.cmd.fire //all pc stream into FIFO
      pc_in_stream.payload := pc_next
      pc_out_stream.ready  := arbitration.isFiring
      pc_in_stream <> pc_stream_fifo.ports.s_ports
      pc_out_stream <> pc_stream_fifo.ports.m_ports
      pc_stream_fifo.flush := fetch_flush

      predict_taken_in.valid := icache_access.cmd.fire
      predict_taken_in.payload := input(BPU_BRANCH_TAKEN)
      predict_taken_out.ready := arbitration.isFiring
      predict_taken_in <> predict_taken_fifo.ports.s_ports
      predict_taken_out <> predict_taken_fifo.ports.m_ports
      predict_taken_fifo.flush := fetch_flush

      instruction_in_stream.valid   := icache_access.rsp.valid && !rsp_flush && !fetch_flush
      instruction_in_stream.payload := icache_access.rsp.payload.data
      instruction_out_stream.ready  := arbitration.isFiring
      instruction_in_stream <> instruction_stream_fifo.ports.s_ports
      instruction_out_stream <> instruction_stream_fifo.ports.m_ports
      instruction_stream_fifo.flush := fetch_flush

      // insert to stage
      insert(PC) := pc_out_stream.payload
      insert(PC_NEXT) := pc_stream_fifo.next_payload // for exe redirect
      insert(INSTRUCTION) := instruction_out_stream.payload
      insert(PREDICT_VALID) := icache_access.cmd.fire // for BPU
      insert(PREDICT_TAKEN) := predict_taken_out.payload //for exe redirect
      insert(PREDICT_PC)    := pc_next // for BPU
      arbitration.isValid := fifo_all_valid && !arbitration.isStuck && !fetch_flush

      // send cmd to icache
      icache_access.cmd.valid := fetch_valid && !fetch_flush
      icache_access.cmd.addr  := pc_next
    }

  }
}