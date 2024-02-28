package dandriscv.ip

import dandriscv.plugin._
import dandriscv._
import spinal.core._
import spinal.lib._
import scala.math._
import spinal.lib.bus.amba4.apb.{Apb4, Apb4Config, Apb4SlaveFactory}
import spinal.lib.bus.amba3.apb.{Apb3, Apb3Config, Apb3SlaveFactory}
import spinal.lib.com.uart._
import spinal.lib.misc.{HexTools, InterruptCtrl, Prescaler, Timer}

class Apb3Timer extends Component{
  val io = new Bundle {
    val apb = slave(Apb3(
      addressWidth = 8,
      dataWidth = 32
    ))
  }

  // val prescaler = Prescaler(16)
  // val timerA,timerB = Timer(16)

  // val busCtrl = Apb3SlaveFactory(io.apb)
  // val prescalerBridge = prescaler.driveFrom(busCtrl,0x00)

  // val timerABridge = timerA.driveFrom(busCtrl,0x10)(
  //   ticks  = List(True, prescaler.io.overflow),
  //   clears = List(timerA.io.full)
  // )

  // val timerBBridge = timerB.driveFrom(busCtrl,0x20)(
  //   ticks  = List(True, prescaler.io.overflow),
  //   clears = List(timerB.io.full)
  // )

  var CyclesPerUs = 100 // 100 MHz
  println(CyclesPerUs)

  val timer = Reg(UInt(64 bits)) init(0) // us
  val cycle_cnt = Reg(UInt(32 bits)) init(0)
  when(cycle_cnt===U(CyclesPerUs-1, 32 bits)){
    cycle_cnt := U(0)
    timer := timer + 1
  }.otherwise{
    cycle_cnt := cycle_cnt + 1
  }
  

  io.apb.PREADY := True
  when(io.apb.PADDR===U"8'h40"){
    io.apb.PRDATA := timer(31 downto 0).asBits
  }.elsewhen(io.apb.PADDR===U"8'h44"){
    io.apb.PRDATA := timer(63 downto 32).asBits
  }.otherwise{
    io.apb.PRDATA := B(0, 32 bits)
  }  
  io.apb.PSLVERROR := False

}