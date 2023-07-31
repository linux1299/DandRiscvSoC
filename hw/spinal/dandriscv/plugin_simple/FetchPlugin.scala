package dandriscv.plugin_simple

import spinal.core._
import spinal.lib._
import spinal.lib.fsm._

import dandriscv._
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

      val fetchFSM = new Area{
        def IDLE : UInt = 0
        def FETCH : UInt = 1
        def WAIT : UInt = 2
        def HALT : UInt  = 3
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
              fetch_state_next := WAIT
            }
            .elsewhen(arbitration.isStuck){
              fetch_state_next := HALT
            }
            .otherwise{
              fetch_state_next := FETCH
            }
          }
          is(WAIT) {
            when(arbitration.isStuck){
              fetch_state_next := WAIT
            }
            .elsewhen(icache_access.cmd.fire){
              fetch_state_next := FETCH
            }
            .otherwise{
              fetch_state_next := WAIT
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
        }

        // when icache is busy, interrupt is high, use reg store interrupt's pc
        when(fetch.output(INT_EN) & (fetch_state===WAIT || fetch_state_next===WAIT)){
          int_en_reg := True
          int_pc_reg := fetch.output(INT_PC)
        }
        .elsewhen(icache_access.rsp.fire){
          int_en_reg := False
        }

        // pc_next used to fetch instruction
        when(fetch_state_next===FETCH){
          when(int_en_reg){
            pc_next := int_pc_reg
          }
          .elsewhen(fetch.output(INT_EN)) {
            pc_next := fetch.output(INT_PC)
          } 
          .elsewhen(execute.output(REDIRECT_VALID)){
            pc_next := execute.output(REDIRECT_PC_NEXT)
          }
          .elsewhen(fetch.input(BPU_BRANCH_TAKEN)) {
            pc_next := fetch.input(BPU_PC_NEXT)
          } 
          .otherwise {
            pc_next := pc_next + 4
          }
        }

        when(fetch_state_next===FETCH || fetch_state_next===WAIT){
          fetch_valid := True
        }
        .otherwise{
          fetch_valid := False
        }
      }

      // insert to stage
      insert(PC) := pc
      insert(INSTRUCTION) := icache_access.rsp.payload.data
      arbitration.isValid := icache_access.rsp.valid && !(output(INT_EN) || int_en_reg)

      // send cmd to icache
      icache_access.cmd.valid := fetch_valid
      icache_access.cmd.addr := pc_next
    }

  }
}