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


class InstructionFetchPlugin(resetVector : BigInt = 0x80000000l) 
extends Plugin[DandRiscvSimple]
with ICacheAccessService
with ControlService
with InterruptService
with BPUService{

  @dontName var icache_access : ICacheAccess = null
  override def newICacheAccess(): ICacheAccess = {
    assert(icache_access == null)
    icache_access = ICacheAccess(64, 32)
    icache_access
  }
  @dontName var control_ports : ControlPorts = null
  override def newControlPorts(): ControlPorts = {
    assert(control_ports == null)
    control_ports = ControlPorts()
    control_ports
  }
  @dontName var interrupt_ports : IntPorts = null
  override def newIntPorts(): IntPorts = {
    assert(interrupt_ports == null)
    interrupt_ports = IntPorts()
    interrupt_ports
  }
  @dontName var bpu_ports : BPUPorts = null
  override def newBPUPorts(): BPUPorts = {
    assert(bpu_ports == null)
    bpu_ports = BPUPorts()
    bpu_ports
  }

  override def setup(pipeline: DandRiscvSimple): Unit = {
    import Riscv._
    import pipeline.config._

    control_ports = pipeline.service(classOf[ControlService]).newControlPorts
    interrupt_ports = pipeline.service(classOf[InterruptService]).newIntPorts
    bpu_ports = pipeline.service(classOf[BPUService]).newBPUPorts
  }
  
  override def build(pipeline: DandRiscvSimple): Unit = {
    import pipeline._
    import pipeline.config._

    //val slaveBus = slave(inoutClass()).setName("slaveBus")
    //val masterBus = master(inoutClass()).setName("masterBus")
    //masterBus.dataout := B(2, 32 bits)

    val fetch_pc = Reg(UInt(addressWidth bits)) init(resetVector)
    val pc = RegNextWhen(fetch_pc, icache_access.cmd.fire)
    val pc_next = fetch_pc + 4
    val fetch_valid = RegInit(False)
    val fetch_hold  = control_ports.hold || interrupt_ports.int_hold
    val int_pc_reg = Reg(UInt(addressWidth bits)) init(0)
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
        } .elsewhen(bpu_ports.branch_taken) {
          fetch_pc := bpu_ports.branch_pc
        } .otherwise {
          fetch_pc := pc_next
        }
      }

      when(fetch_state_next===FETCH){
        fetch_valid := True
      }
    }

    // another way FSM
    /*
    val fetchFSM = new StateMachine {
      val IDLE = makeInstantEntry()
      val FETCH= new State
      val WAIT = new State

      IDLE
        .whenIsActive {
          when(!fetch_hold){
            goto(FETCH)
          }
        }
      FETCH
        .whenIsActive {
          when(icache_access.cmd.isStall){
            goto(WAIT)
          }
        }
        .whenIsNext{
          fetch_valid := True
          when(interrupt_ports.int_en) {
            fetch_pc := interrupt_ports.int_pc
          } .elsewhen(bpu_ports.branch_taken) {
            fetch_pc := bpu_ports.branch_pc
          } .otherwise {
            fetch_pc := pc_next
          }
        }
      WAIT
        .whenIsActive {
          when(icache_access.cmd.fire){
            goto(FETCH)
          }
          when(interrupt_ports.int_en){
            int_pc_valid := True
            int_pc_reg   := interrupt_ports.int_pc
          }.elsewhen(icache_access.rsp.fire){
            int_pc_valid := False
          }
        }
        .whenIsNext{
          fetch_valid := True
          fetch_pc := fetch_pc
        }
    }
    */

    fetch plug new Area{
      import fetch._
      insert(PC) := pc
    }

    // send cmd to icache
    if(icache_access != null) pipeline plug new Area{
      icache_access.cmd.valid := fetch_valid
      icache_access.cmd.addr := fetch_pc
    }


  }
}