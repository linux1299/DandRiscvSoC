
package dandriscv.gensoc
import dandriscv.plugin_simple._
import dandriscv.ip._
import dandriscv.{plugin_simple, DandRiscvSimple, DandRiscvSimpleConfig}
import spinal.lib.misc._

import spinal.core._
import spinal.lib._
import spinal.lib.bus.amba3.apb._
import spinal.lib.bus.amba4.axi._
import spinal.lib.com.jtag.Jtag
import spinal.lib.com.jtag.sim.JtagTcp
import spinal.lib.com.uart.sim.{UartDecoder, UartEncoder}
import spinal.lib.com.uart.{Apb3UartCtrl, Uart, UartCtrlGenerics, UartCtrlMemoryMappedConfig}
import spinal.lib.graphic.RgbConfig
import spinal.lib.graphic.vga.{Axi4VgaCtrl, Axi4VgaCtrlGenerics, Vga}
import spinal.lib.io.TriStateArray
import spinal.lib.memory.sdram.SdramGeneration.SDR
import spinal.lib.memory.sdram._
import spinal.lib.memory.sdram.sdr.sim.SdramModel
import spinal.lib.memory.sdram.sdr.{Axi4SharedSdramCtrl, IS42x320D, SdramInterface, SdramTimings}
import spinal.lib.misc.HexTools
import spinal.lib.soc.pinsec.{PinsecTimerCtrl, PinsecTimerCtrlExternal}
import spinal.lib.system.debugger.{JtagAxi4SharedDebugger, JtagBridge, SystemDebugger, SystemDebuggerConfig}

import scala.collection.mutable.ArrayBuffer
import scala.collection.Seq

case class DandConfig(axiFrequency : HertzNumber,
                       onChipRamSize : BigInt,
                       uartCtrlConfig : UartCtrlMemoryMappedConfig)

object DandConfig{

  def default = {
    val config = DandConfig(
      axiFrequency = 50 MHz,
     onChipRamSize  = 128 kB,
      // onChipRamSize  = 1 GB,
      uartCtrlConfig = UartCtrlMemoryMappedConfig(
        uartCtrlConfig = UartCtrlGenerics(
          dataWidthMax      = 8,
          clockDividerWidth = 20,
          preSamplingSize   = 1,
          samplingSize      = 5,
          postSamplingSize  = 2
        ),
        txFifoDepth = 16,
        rxFifoDepth = 16
      ),
    )
    config
  }
}



class DandSocSimple(val config: DandConfig) extends Component{

  //Legacy constructor
  def this(axiFrequency: HertzNumber) {
    this(DandConfig.default.copy(axiFrequency = axiFrequency))
  }

  import config._

  val io = new Bundle{
    //Clocks / reset
    val asyncResetn = in Bool()
    val axiClk     = in Bool()
    val uart       = master(Uart())
  }

  val resetCtrlClockDomain = ClockDomain(
    clock = io.axiClk,
    reset = io.asyncResetn,
    config = ClockDomainConfig(
      clockEdge        = RISING,
      resetKind        = ASYNC,
      resetActiveLevel = LOW
    )
  )

  val resetCtrl = new ClockingArea(resetCtrlClockDomain) {
    val systemResetUnbuffered  = False
    //Implement an counter to keep the reset axiResetOrder high 64 cycles
    // Also this counter will automaticly do a reset when the system boot.
    val systemResetCounter = Reg(UInt(6 bits)) init(0)
    when(systemResetCounter =/= U(systemResetCounter.range -> true)){
      systemResetCounter := systemResetCounter + 1
      systemResetUnbuffered := True
    }
    when(BufferCC(!io.asyncResetn)){
      systemResetCounter := 0
    }

    //Create all reset used later in the design
    val axiReset     = RegNext(systemResetUnbuffered)
  }

  val axiClockDomain = ClockDomain(
    clock = io.axiClk,
    reset = resetCtrl.axiReset,
    frequency = FixedFrequency(axiFrequency)
  )

  val core = new ClockingArea(axiClockDomain){
    val config = DandRiscvSimpleConfig(
        plugins = List(
          new FetchPlugin(resetVector=0x30000000l),
          new BPUPlugin(p = PredictorConfig(
            predictorType = "GSHARE",
            addressWidth =64, 
            RAS_ENTRIES = 32, 
            BTB_ENTRIES = 16, 
            PHT_ENTRIES = 32
          )),
          new DecodePlugin,
          new ALUPlugin,
          new ControlPlugin,
          new ExcepPlugin,
          new LSUPlugin(AW=64, DW=64),
          new ICachePlugin(config = ICacheConfig(
            // cacheSize = 32*1024, // 32KB
            cacheSize = 4*1024, // 4KB
            bytePerLine =64,
            wayCount = 4,
            addressWidth = 64,
            cpuDataWidth = 32,
            bankWidth = 32,
            busDataWidth = 64,
            directOutput = false,
            noBurst=true
          )),
          new DCachePlugin(config = DCacheConfig(
            // cacheSize = 32*1024, // 32KB
            cacheSize = 1*1024, // 1 KB
            bytePerLine =64,
            wayCount = 4,
            addressWidth = 64,
            cpuDataWidth = 64,
            bankWidth = 64,
            busDataWidth = 64,
            directOutput = false,
            noBurst=true
          ))
        )
      )
    val cpu = new DandRiscvSimple(config)
    var icache_read : Axi4ReadOnly = null
    var dcache_read : Axi4ReadOnly = null
    var dcache_write : Axi4WriteOnly = null
    for(plugin <- config.plugins) plugin match{
      case plugin : ICachePlugin => icache_read = plugin.icacheReader
      case plugin : DCachePlugin => {dcache_write = plugin.dcacheWriter
                                     dcache_read = plugin.dcacheReader}
      case _ =>
    }
  }

  

  val axi = new ClockingArea(axiClockDomain) {
    val masterAxi4Cfg64 = Axi4Config(
      addressWidth = 32,
      dataWidth = 64,
      idWidth = 4
    )
    val slaveAxi4Cfg32 = masterAxi4Cfg64.copy(idWidth = 4, dataWidth = 32)
    val downsizer = Axi4Downsizer(masterAxi4Cfg64, slaveAxi4Cfg32)

    val ram = Axi4SharedOnChipRam(
      dataWidth = 64,
      byteCount = onChipRamSize,
      idWidth = 4
    )
    val bootram = Axi4SharedOnChipRam(
      dataWidth = 32,
//      byteCount = onChipRamSize,
      byteCount = 128 kB,
      idWidth = 4
    )
    val apbBridge = Axi4SharedToApb3Bridge(
      addressWidth = 20,
      dataWidth    = 32,
      idWidth      = 4
    )
    // val uartCtrl = Apb3UartCtrl(uartCtrlConfig)
    val uartCtrl = Apb3Uart()
    uartCtrl.io.apb.addAttribute(Verilator.public)
    uartCtrl.io.clock := axiClockDomain.clock
    uartCtrl.io.resetn := ~axiClockDomain.reset
    
    val axiCrossbar = Axi4CrossbarFactory()

    axiCrossbar.addSlaves(
      ram.io.axi       -> (0x80000000L,   onChipRamSize),
      downsizer.io.input -> (0x10000000L,   768 MB) // 0x1000_0000 ~ 0x3fff_ffff
    )

    axiCrossbar.addConnections(
      core.icache_read       -> List(ram.io.axi, downsizer.io.input),
      core.dcache_read       -> List(ram.io.axi, downsizer.io.input),
      core.dcache_write      -> List(ram.io.axi, downsizer.io.input)
    )

    val axiCrossbar32 = Axi4CrossbarFactory()

    axiCrossbar32.addSlaves(
      bootram.io.axi   -> (0x30000000L,   onChipRamSize),
      apbBridge.io.axi -> (0x10000000L,   512 MB) // 0x1000_0000 ~ 0x2fff_ffff
    )

    axiCrossbar32.addConnections(
      downsizer.io.output -> List(bootram.io.axi, apbBridge.io.axi)
    )

    // axiCrossbar.addPipelining(apbBridge.io.axi)((crossbar,bridge) => {
    //   crossbar.sharedCmd.halfPipe() >> bridge.sharedCmd
    //   crossbar.writeData.halfPipe() >> bridge.writeData
    //   crossbar.writeRsp             << bridge.writeRsp
    //   crossbar.readRsp              << bridge.readRsp
    // })

    // axiCrossbar.addPipelining(ram.io.axi)((crossbar,ctrl) => {
    //   crossbar.sharedCmd.halfPipe()  >>  ctrl.sharedCmd
    //   crossbar.writeData            >/-> ctrl.writeData
    //   crossbar.writeRsp              <<  ctrl.writeRsp
    //   crossbar.readRsp               <<  ctrl.readRsp
    // })

    // axiCrossbar.addPipelining(core.dBus)((cpu,crossbar) => {
    //   cpu.sharedCmd             >>  crossbar.sharedCmd
    //   cpu.writeData             >>  crossbar.writeData
    //   cpu.writeRsp              <<  crossbar.writeRsp
    //   cpu.readRsp               <-< crossbar.readRsp
    // })

    axiCrossbar.build()
    axiCrossbar32.build()

    val apbDecoder = Apb3Decoder(
      master = apbBridge.io.apb,
      slaves = List(
        uartCtrl.io.apb  -> (0x0, 4 kB),
      )
    )
  }
  io.uart           <> axi.uartCtrl.io.uart
}

object GenDandSocSimpleConfig {
  def spinal = SpinalConfig(
    targetDirectory = "hw/gen",
    defaultConfigForClockDomains = ClockDomainConfig(
      resetActiveLevel = HIGH
    ),
    onlyStdLogicVectorAtTopLevelIo = true,
    nameWhenByFile = false,
    genLineComments = true
    // anonymSignalPrefix = "tmp"
  )
}

//Artix7-SoC with memory init
object DandSocSimpleWithMemoryInit{
  def main(args: Array[String]) {
    // val config = SpinalConfig()
    GenDandSocSimpleConfig.spinal.generateVerilog({
      val toplevel = new DandSocSimple(DandConfig.default)
    //  BinTools.initRam(toplevel.axi.bootram.ram, "/home/lin/oscpu/libraries/ysyxSoC/ysyx/program/bin/flash/hello-flash.bin", false)
      // BinTools.initRam(toplevel.axi.bootram.ram, "/home/lin/oscpu/libraries/ysyxSoC/ysyx/program/bin/flash/rtthread-flash.bin", false)
      BinTools.initRam(toplevel.axi.bootram.ram, "/home/lin/SpinalProjects/DandRiscvSoC/ysyx-workbench/am-kernels/kernels/hello/build/hello-riscv64-nemu.bin", false)
      toplevel
    })
  }
}