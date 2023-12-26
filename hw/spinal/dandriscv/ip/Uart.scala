package dandriscv.ip

import dandriscv.plugin._
import dandriscv._
import spinal.core._
import spinal.lib._
import scala.math._
import spinal.lib.bus.amba4.apb.{Apb4, Apb4Config, Apb4SlaveFactory}
import spinal.lib.bus.amba3.apb.{Apb3, Apb3Config, Apb3SlaveFactory}
import spinal.lib.com.uart._

case class Apb4Uart() extends Component{
  
  val apbConfig = Apb4Config(
    addressWidth = 32,
    dataWidth    = 32,
    useSlaveError= true
  )

  val io = new Bundle{
    val apb =  slave(Apb4(apbConfig))
    val uart = master(Uart(false, false))
    val clock = in Bool()
    val resetn  = in Bool()
  }

  val uartCtrl = new uart_apb()
  io.uart.txd := uartCtrl.io.uart_tx
  uartCtrl.io.uart_rx := io.uart.rxd

  // apb
  uartCtrl.io.clk := io.clock
  uartCtrl.io.resetn := io.resetn
  uartCtrl.io.in_psel := io.apb.PSEL
  uartCtrl.io.in_penable := io.apb.PENABLE 
  uartCtrl.io.in_pprot := io.apb.PPROT
  io.apb.PREADY := uartCtrl.io.in_pready
  io.apb.PSLVERR := uartCtrl.io.in_pslverr
  uartCtrl.io.in_paddr := io.apb.PADDR
  uartCtrl.io.in_pwrite := io.apb.PWRITE
  io.apb.PRDATA := uartCtrl.io.in_prdata
  uartCtrl.io.in_pwdata := io.apb.PWDATA
  uartCtrl.io.in_pstrb := io.apb.PSTRB
  
}

case class Apb3Uart() extends Component{
  
  val apbConfig = Apb3Config(
    addressWidth = 16,
    dataWidth    = 32
  )

  val io = new Bundle{
    val apb =  slave(Apb3(apbConfig))
    val uart = master(Uart(false, false))
    val clock = in Bool()
    val resetn  = in Bool()
  }

  val uartCtrl = new uart_apb()
  io.uart.txd := uartCtrl.io.uart_tx
  uartCtrl.io.uart_rx := io.uart.rxd

  // apb
  uartCtrl.io.clk := io.clock
  uartCtrl.io.resetn := io.resetn
  uartCtrl.io.in_psel := io.apb.PSEL
  uartCtrl.io.in_penable := io.apb.PENABLE 
  // uartCtrl.io.in_pprot := io.apb.PPROT
  uartCtrl.io.in_pprot := B(0, 3 bits)
  io.apb.PREADY := uartCtrl.io.in_pready
  io.apb.PSLVERROR := uartCtrl.io.in_pslverr
  uartCtrl.io.in_paddr := io.apb.PADDR.resized
  uartCtrl.io.in_pwrite := io.apb.PWRITE && io.apb.PENABLE && io.apb.PSEL.asBool
  io.apb.PRDATA := uartCtrl.io.in_prdata
  uartCtrl.io.in_pwdata := io.apb.PWDATA
  // uartCtrl.io.in_pstrb := io.apb.PSTRB
  uartCtrl.io.in_pstrb := B(15, 4 bits)
  
}

case class uart_apb() extends BlackBox {
  
  val io = new Bundle{
    val clk = in Bool()
    val resetn = in Bool()
    val in_psel = in Bits(1 bits)
    val in_penable = in Bool()
    val in_pprot = in Bits(3 bits)
    val in_pready = out Bool()
    val in_pslverr = out Bool()
    val in_paddr = in UInt(32 bits)
    val in_pwrite = in Bool()
    val in_prdata = out Bits(32 bits)
    val in_pwdata = in Bits(32 bits)
    val in_pstrb = in Bits(4 bits)
    val uart_rx = in Bool()
    val uart_tx = out Bool()
  }
  noIoPrefix()
  // addRTLPath("/home/lin/SpinalProjects/DandRiscvSoC/hw/verilog/uart16550/rtl/raminfr.v")
  // addRTLPath("/home/lin/SpinalProjects/DandRiscvSoC/hw/verilog/uart16550/rtl/uart_apb.v")
  // addRTLPath("/home/lin/SpinalProjects/DandRiscvSoC/hw/verilog/uart16550/rtl/uart_defines.v")
  // addRTLPath("/home/lin/SpinalProjects/DandRiscvSoC/hw/verilog/uart16550/rtl/uart_receiver.v")
  // addRTLPath("/home/lin/SpinalProjects/DandRiscvSoC/hw/verilog/uart16550/rtl/uart_regs.v")
  // addRTLPath("/home/lin/SpinalProjects/DandRiscvSoC/hw/verilog/uart16550/rtl/uart_rfifo.v")
  // addRTLPath("/home/lin/SpinalProjects/DandRiscvSoC/hw/verilog/uart16550/rtl/uart_sync_flops.v")
  // addRTLPath("/home/lin/SpinalProjects/DandRiscvSoC/hw/verilog/uart16550/rtl/uart_tfifo.v")
  // addRTLPath("/home/lin/SpinalProjects/DandRiscvSoC/hw/verilog/uart16550/rtl/uart_transmitter.v")
  addRTLPath("/home/lin/SpinalProjects/DandRiscvSoC/hw/verilog/uart_simple/uart_simple.v")
  addRTLPath("/home/lin/SpinalProjects/DandRiscvSoC/hw/verilog/uart_simple/uart_send_data.v")
  addRTLPath("/home/lin/SpinalProjects/DandRiscvSoC/hw/verilog/uart_simple/uart_send.v")
  addRTLPath("/home/lin/SpinalProjects/DandRiscvSoC/hw/verilog/uart_simple/uart_recv.v")
  
}


object Apb4Uart extends App {
  SpinalVerilog(Apb4Uart())
}

object Apb3Uart extends App {
  SpinalVerilog(Apb3Uart())
}