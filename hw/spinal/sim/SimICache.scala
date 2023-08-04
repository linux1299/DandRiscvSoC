package sim

import spinal.core._
import spinal.core.sim._

import dandriscv.ip._

object SimICache extends App {
  val icache_config = ICacheConfig(
          cacheSize = 4096,
          bytePerLine =64,
          wayCount = 4,
          addressWidth = 64,
          cpuDataWidth = 32,
          bankWidth = 256,
          busDataWidth = 256,
          directOutput = true
        )

  Config.sim.compile(ICache(icache_config)).doSim { dut =>
    // Fork a process to generate the reset and the clock on the dut
    //dut.clockDomain.forkStimulus(period = 10)
    fork {
      dut.clockDomain.assertReset()
      dut.clockDomain.fallingEdge()
      sleep(15)
      dut.clockDomain.deassertReset()
      
    }
    fork {
    while(true) {
        dut.clockDomain.clockToggle()
        sleep(5)
      }
    }

    //for (idx <- 0 until 10) {
      // Drive the dut inputs with random values
      dut.flush #= false
      dut.cpu.cmd.valid #= true
      dut.cpu.cmd.addr #= 0
      dut.next_level.rsp.valid #= false

      // Wait a rising edge on the clock
      dut.clockDomain.waitRisingEdge(5)
      dut.next_level.rsp.valid #= true

      dut.clockDomain.waitRisingEdge()
      dut.next_level.rsp.valid #= false
      dut.clockDomain.waitRisingEdge(5)
    //}

    SimTimeout(1000 * 100)
  }

  Config.spinal.generateVerilog(ICache(icache_config))
}
