package dandriscv.plugin_simple

import spinal.core._
import spinal.lib._
import spinal.lib.fsm._

import dandriscv._
import dandriscv.ip._
import dandriscv.plugin._
import dandriscv.plugin_simple._


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
      val pc = RegNextWhen(pc_next, icache_access.cmd.fire).setName("pc")
      val fetch_valid = RegInit(False).setName("fetch_valid")
      val int_pc_reg = Reg(UInt(pipeline.config.addressWidth bits)).setName("int_pc_reg") init(0)
      val int_en_reg = RegInit(False).setName("int_en_reg")
      val fetch_flush = (output(INT_EN) || int_en_reg || arbitration.flushIt)
      val predict_taken = RegNext(input(BPU_BRANCH_TAKEN))

      // val pc_FIFO = StreamFifo(
      //   dataType = UInt(pipeline.config.addressWidth bits),
      //   depth    = 2
      // )
      // val instruction_FIFO = StreamFifo(
      //   dataType = Bits(32 bits),
      //   depth    = 2
      // )
      val pc_in_stream =  Stream(UInt(pipeline.config.addressWidth bits))
      val pc_out_stream = Stream(UInt(pipeline.config.addressWidth bits))
      val pc_stream_fifo = FIFO(UInt(pipeline.config.addressWidth bits), 2)
      val instruction_in_stream = Stream(Bits(32 bits))
      val instruction_out_stream =Stream(Bits(32 bits))
      val instruction_stream_fifo = FIFO(Bits(32 bits), 2)

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

        // when icache is busy, interrupt is high, use reg store interrupt's pc
        when(output(INT_EN) & (fetch_state===BUSY || fetch_state_next===BUSY)){
          int_en_reg := True
          int_pc_reg := output(INT_PC)
        }
        .elsewhen(icache_access.rsp.fire){
          int_en_reg := False
        }

        // pc_next used to fetch instruction
        when(output(INT_EN)) {
          pc_next := output(INT_PC)
        }
        .elsewhen(execute.output(REDIRECT_VALID)){
          pc_next := execute.output(REDIRECT_PC_NEXT)
        }
        .elsewhen(input(BPU_BRANCH_TAKEN)) {
          pc_next := input(BPU_PC_NEXT)
        }
        .elsewhen(icache_access.cmd.fire) {
          when(int_en_reg){
            pc_next := int_pc_reg
          }
          .otherwise{
            pc_next := pc_next + 4
          }
        }

        when(fetch_state_next===FETCH || fetch_state_next===BUSY){
          fetch_valid := True
        }
        .otherwise{
          fetch_valid := False
        }
      }

      // output pc and instruction from FIFO or icache
      pc_in_stream.valid   := icache_access.rsp.valid && (arbitration.isStuck || fetchFSM.fetch_state===fetchFSM.HALT) //TODO:all pc stream into FIFO
      pc_in_stream.payload := pc
      pc_out_stream.ready  := !arbitration.isStuck
      // pc_stream_fifo.ports.s_ports.valid := pc_in_stream.valid
      // pc_stream_fifo.ports.s_ports.payload := pc_in_stream.payload
      // pc_stream_fifo.ports.m_ports.ready := pc_out_stream.ready
      // pc_FIFO.io.push << pc_in_stream
      // pc_FIFO.io.pop  >> pc_out_stream

      instruction_in_stream.valid   := icache_access.rsp.valid && arbitration.isStuck
      instruction_in_stream.payload := icache_access.rsp.payload.data
      instruction_out_stream.ready  := !arbitration.isStuck
      // instruction_FIFO.io.push << instruction_in_stream
      // instruction_FIFO.io.pop  >> instruction_out_stream
      // instruction_stream_fifo.ports.s_ports.valid := instruction_in_stream.valid
      // instruction_stream_fifo.ports.s_ports.payload := instruction_in_stream.payload
      // instruction_stream_fifo.ports.m_ports.ready := instruction_out_stream.ready

      // insert to stage
      insert(PC) := pc_out_stream.valid ? pc_out_stream.payload | pc
      insert(PC_NEXT) := pc_next
      insert(PREDICT_VALID) := icache_access.cmd.fire
      insert(PREDICT_TAKEN) := predict_taken
      insert(INSTRUCTION) := instruction_out_stream.valid ? instruction_out_stream.payload | icache_access.rsp.payload.data
      arbitration.isValid := (pc_out_stream.valid || (icache_access.rsp.valid && !(arbitration.isStuck || fetchFSM.fetch_state===fetchFSM.HALT))) && !fetch_flush

      // send cmd to icache
      icache_access.cmd.valid := fetch_valid && !fetch_flush
      icache_access.cmd.addr  := pc_next
    }

  }
}