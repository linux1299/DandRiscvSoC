package dandriscv.plugin_simple

import spinal.core._
import spinal.lib._
import spinal.lib.fsm._

import dandriscv._
import dandriscv.plugin._
import dandriscv.plugin_simple._

//case class inoutClass() extends Bundle with IMasterSlave{
//  val dataout = Bits(32 bits)
//  val datain = Bits(32 bits)
//  override def asMaster(): Unit = {
//    out(dataout)
//  }
//  override def asSlave(): Unit = {
//    in(datain)
//  }
//}


class InstructionFetchPlugin(resetVector : BigInt = 0x80000000l, addressWidth : Int = 64) //
extends Plugin[DandRiscvSimple]
with ICacheAccessService
with InterruptService
with BPUService{

  @dontName var icache_access : ICacheAccess = null
  override def newICacheAccess(): ICacheAccess = {
    assert(icache_access == null)
    icache_access = ICacheAccess(addressWidth, 32)
    icache_access
  }

  @dontName var interrupt_ports : IntPorts = null
  override def newIntPorts(): IntPorts = {
    assert(interrupt_ports == null)
    interrupt_ports = IntPorts()
    interrupt_ports
  }
  

  override def setup(pipeline: DandRiscvSimple): Unit = {
    import Riscv._
    import pipeline.config._

    interrupt_ports = pipeline.service(classOf[InterruptService]).newIntPorts
    bpu_ports = pipeline.service(classOf[BPUService]).newBPUPorts
  }
  
  override def build(pipeline: DandRiscvSimple): Unit = {
    import pipeline._
    import pipeline.config._

    //val slaveBus = slave(inoutClass()).setName("slaveBus")
    //val masterBus = master(inoutClass()).setName("masterBus")
    //masterBus.dataout := B(2, 32 bits)

    val fetch_pc = Reg(UInt(this.addressWidth bits)) init(resetVector)
    val pc = RegNextWhen(fetch_pc, icache_access.cmd.fire)
    val pc_next = fetch_pc + 4
    val fetch_valid = RegInit(False)
    val fetch_hold  = fetch.output(LOAD_USE) || interrupt_ports.int_hold
    val int_pc_reg = Reg(UInt(this.addressWidth bits)) init(0)
    val int_pc_valid = RegInit(False)
    val fetch_state_next = UInt(2 bits)
    val fetch_state = RegNext(fetch_state_next) init(0)

    val fetchFSM = new Area{
      def IDLE : UInt = 0
      def FETCH : UInt = 1
      def WAIT : UInt = 2
      switch(fetch_state){
        is(IDLE) {
          when(!fetch_hold){
            fetch_state := FETCH
          }
        }
        is(FETCH) {
          when(icache_access.cmd.isStall){
            fetch_state := WAIT
          }
        }
        is(WAIT) {
          when(icache_access.cmd.fire){
            fetch_state := FETCH
          }
        }
      }

      when(interrupt_ports.int_en & (fetch_state===WAIT || fetch_state_next===WAIT)){
        int_pc_valid := True
        int_pc_reg   := interrupt_ports.int_pc
      }.elsewhen(icache_access.rsp.fire){
        int_pc_valid := False
      }

      when(fetch_state_next===FETCH){
        when(int_pc_valid){
          fetch_pc := int_pc_reg
        }
        when(interrupt_ports.int_en) {
          fetch_pc := interrupt_ports.int_pc
        } .elsewhen(bpu_ports.predict_taken) {
          fetch_pc := bpu_ports.predict_pc_next
        } .otherwise {
          fetch_pc := pc_next
        }
      }

      when(fetch_state_next===FETCH){
        fetch_valid := True
      }
    }

    fetch plug new Area{
      import fetch._
      insert(PC) := pc
    }

    // send cmd to icache
    if(icache_access != null) pipeline plug new Area{
      icache_access.cmd.valid := fetch_valid
      icache_access.cmd.addr := fetch_pc
    }

    if(bpu_ports != null) pipeline plug new Area{
      bpu_ports.predict_pc := fetch_pc
    }


  }
}