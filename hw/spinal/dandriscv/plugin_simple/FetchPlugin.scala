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
      val pc_next_d1 = Reg(UInt(pipeline.config.addressWidth bits)).setName("pc_next_d1") init(0)
      val pc_next_d1_valid = RegInit(False).setName("pc_next_d1_valid")
      val fetch_flush = (output(INT_EN) || pc_next_d1_valid || arbitration.flushIt)
      val fetch_flush_d1 = RegInit(False)
      
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
        val BUSY  = U(2 , 2 bits).setName("BUSY")
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
            when(icache_access.cmd.isStall){
              fetch_state_next := BUSY
            }
            .elsewhen(arbitration.isStuck){
              fetch_state_next := HALT
            }
            .otherwise{
              fetch_state_next := FETCH
            }
          }
          is(BUSY) {
            when(arbitration.isStuck){
              fetch_state_next := BUSY
            }
            .elsewhen(icache_access.cmd.fire){
              fetch_state_next := FETCH
            }
            .otherwise{
              fetch_state_next := BUSY
            }
          }
          is(HALT){
            when(!arbitration.isStuck){
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

        // when icache is busy, interrupt or redirect is high, use reg store these pc
        when(fetch_state===BUSY || fetch_state_next===BUSY){
          pc_next_d1_valid := True
          when(output(INT_EN)){
            pc_next_d1 := output(INT_PC)
          }
          .elsewhen(execute.output(REDIRECT_VALID)){
            pc_next_d1 := execute.output(REDIRECT_PC_NEXT)
          }
          .elsewhen(input(BPU_BRANCH_TAKEN)){
            pc_next_d1 := input(BPU_PC_NEXT)
          }
        }
        .elsewhen(icache_access.rsp.fire){
          pc_next_d1_valid := False
        }

        // use pc_next to fetch instrution
        when(fetch_state_next===FETCH){
          fetch_valid := True
        }
        .elsewhen(fetch_state_next===BUSY){
          fetch_valid := True
        }
        .otherwise{
          fetch_valid := False
        }

        when(fetch_state===FETCH || fetch_state===HALT){
          when(pc_next_d1_valid){
            pc_next := pc_next_d1
          }
          .elsewhen(output(INT_EN)) {
            pc_next := output(INT_PC)
          }
          .elsewhen(execute.output(REDIRECT_VALID)){
            pc_next := execute.output(REDIRECT_PC_NEXT)
          }
          .elsewhen(input(BPU_BRANCH_TAKEN)) {
            pc_next := input(BPU_PC_NEXT)
          }
          .elsewhen(icache_access.cmd.fire){
            pc_next := pc_next + 4
          }
        }

      }

      // rsp is delayed 1 or more cycle, fetch_flush is also needed to delay
      when(fetch_flush){
        fetch_flush_d1 := True
      }.elsewhen(icache_access.rsp.valid){
        fetch_flush_d1 := False
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

      instruction_in_stream.valid   := icache_access.rsp.valid && !pc_next_d1_valid
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