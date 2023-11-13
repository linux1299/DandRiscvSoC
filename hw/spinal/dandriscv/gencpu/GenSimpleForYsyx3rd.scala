package dandriscv.gencpu

import dandriscv.plugin_simple._
import dandriscv.ip._

import spinal.core._
import spinal.lib._

import spinal.lib.bus.amba4.axi._
import dandriscv.{plugin_simple, DandRiscvSimple, DandRiscvSimpleConfig}

case class ysyx_210238() extends Component{
  val axiConfig = Axi4Config(addressWidth=64, dataWidth=64, idWidth=4,
                             useId=true, useLast=true, useRegion=false, useBurst=true, 
                             useLock=false, useCache=false, useSize=true, useQos=false,
                             useLen=true, useResp=true, useProt=false, useStrb=true)
  val clock = in Bool()
  val reset = in Bool()
  val coreClockDomain = ClockDomain(clock, reset)

  val  io_interrupt = in Bool()

  val  io_master_awready = in Bool()
  val  io_master_awvalid = out Bool()
  val  io_master_awaddr = out UInt(32 bits)
  val  io_master_awid = out UInt(4 bits)
  val  io_master_awlen = out UInt(8 bits)
  val  io_master_awsize = out UInt(3 bits)
  val  io_master_awburst = out Bits(2 bits)
  val  io_master_wready = in Bool()
  val  io_master_wvalid = out Bool()
  val  io_master_wdata = out Bits(64 bits)
  val  io_master_wstrb = out Bits(8 bits)
  val  io_master_wlast = out Bool()
  val  io_master_bready = out Bool()
  val  io_master_bvalid = in Bool()
  val  io_master_bresp = in Bits(2 bits)
  val  io_master_bid = in UInt(4 bits)
  val  io_master_arready = in Bool()
  val  io_master_arvalid = out Bool()
  val  io_master_araddr = out UInt(32 bits)
  val  io_master_arid = out UInt(4 bits)
  val  io_master_arlen = out UInt(8 bits)
  val  io_master_arsize = out UInt(3 bits)
  val  io_master_arburst = out Bits(2 bits)
  val  io_master_rready = out Bool()
  val  io_master_rvalid = in Bool()
  val  io_master_rresp = in Bits(2 bits)
  val  io_master_rdata = in Bits(64 bits)
  val  io_master_rlast = in Bool()
  val  io_master_rid = in UInt(4 bits)

  val  io_slave_awready = out Bool()
  val  io_slave_awvalid = in Bool()
  val  io_slave_awaddr = in UInt(32 bits)
  val  io_slave_awid = in UInt(4 bits)
  val  io_slave_awlen = in UInt(8 bits)
  val  io_slave_awsize = in UInt(3 bits)
  val  io_slave_awburst = in UInt(2 bits)
  val  io_slave_wready = out Bool()
  val  io_slave_wvalid = in Bool()
  val  io_slave_wdata = in Bits(64 bits)
  val  io_slave_wstrb = in Bits(8 bits)
  val  io_slave_wlast = in Bool()
  val  io_slave_bready = in Bool()
  val  io_slave_bvalid = out Bool()
  val  io_slave_bresp = out Bits(2 bits)
  val  io_slave_bid = out UInt(4 bits)
  val  io_slave_arready = out Bool()
  val  io_slave_arvalid = in Bool()
  val  io_slave_araddr = in UInt(32 bits)
  val  io_slave_arid = in UInt(4 bits)
  val  io_slave_arlen = in UInt(8 bits)
  val  io_slave_arsize = in UInt(3 bits)
  val  io_slave_arburst = in UInt(2 bits)
  val  io_slave_rready = in Bool()
  val  io_slave_rvalid = out Bool()
  val  io_slave_rresp = out UInt(2 bits)
  val  io_slave_rdata = out Bits(64 bits)
  val  io_slave_rlast = out Bool()
  val  io_slave_rid = out UInt(4 bits)

  val core = new ClockingArea(coreClockDomain){
    val config = DandRiscvSimpleConfig(
        plugins = List(
          // new FetchPlugin(resetVector=0x80000000l),
          new FetchPlugin(resetVector=0x30000000l),
          new BPUPlugin(p = PredictorConfig(
            predictorType = "GSHARE",
            addressWidth =64, 
            RAS_ENTRIES = 64, 
            BTB_ENTRIES = 64, 
            PHT_ENTRIES = 128
          )),
          new DecodePlugin,
          new ALUPlugin,
          new ControlPlugin,
          new ExcepPlugin,
          new LSUPlugin(AW=64, DW=64),
          new ICachePlugin(config = ICacheConfig(
            cacheSize = 32*1024, // 32KB
            bytePerLine =64,
            wayCount = 4,
            addressWidth = 64,
            cpuDataWidth = 32,
            bankWidth = 32,
            // busDataWidth = 64,
            busDataWidth = 32,
            directOutput = false,
            noBurst=true
          )),
          new DCachePlugin(config = DCacheConfig(
            cacheSize = 32*1024, // 32KB
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
    
    val word_sel = Reg(UInt(1 bits)) init(0)

    val icache_rsp_cnt = Reg(UInt(4 bits)) init(0)
    val dcache_rsp_cnt = Reg(UInt(4 bits)) init(0)
    val icache_finish = Bool()
    val dcache_finish = Bool()
    val state_next = UInt(2 bits)
    val state = RegNext(state_next) init(0)
    val icache_valid = Reg(Bool()) init(False)
    val dcache_valid = Reg(Bool()) init(False)
    
    when(icache_finish){
      icache_rsp_cnt := U(0)
    }.elsewhen(icache_read.r.valid){
      icache_rsp_cnt := icache_rsp_cnt + 1
    }
    // icache_finish := icache_rsp_cnt===U(15) && icache_read.r.valid
    icache_finish := icache_rsp_cnt===U(0) && icache_read.r.valid

    when(dcache_finish){
      dcache_rsp_cnt := U(0)
    }.elsewhen(dcache_read.r.valid){
      dcache_rsp_cnt := dcache_rsp_cnt + 1
    }
    // dcache_finish := dcache_rsp_cnt===U(7) && dcache_read.r.valid
    dcache_finish := dcache_rsp_cnt===U(0) && dcache_read.r.valid

    switch(state){
      is(U(0)){ // IDLE
        when(dcache_read.ar.valid){
          state_next := U(2)
        }
        .elsewhen(icache_read.ar.valid){
          state_next := U(1)
        }
        .otherwise{
          state_next := U(0)
        }
      }
      is(U(1)){ // ICACHE
        when(icache_finish){
          state_next := U(0)
        }.otherwise{
          state_next := U(1)
        }
      }
      is(U(2)){ // DCACHE
        when(dcache_finish){
          state_next := U(0)
        }.otherwise{
          state_next := U(2)
        }
      }
      default{
        state_next := U(0)
      }
    }

    when(state_next===U(1)){
      icache_valid := True
    }
    .otherwise{
      icache_valid := False
    }

    when(state_next===U(2)){
      dcache_valid := True
    }
    .otherwise{
      dcache_valid := False
    }
  }

  // slave
  io_slave_awready := True
  io_slave_wready  := True
  io_slave_bvalid  := False
  io_slave_bresp   := B(0)
  io_slave_bid     := U(0)
  io_slave_arready := True
  io_slave_rvalid  := False
  io_slave_rresp   := U(0)
  io_slave_rdata   := B(0)
  io_slave_rlast   := False
  io_slave_rid     := U(0)

  // master write
  io_master_awvalid := core.dcache_write.aw.valid
  io_master_awaddr  := core.dcache_write.aw.payload.addr.resize(32)
  io_master_awid    := core.dcache_write.aw.payload.id
  io_master_awlen   := core.dcache_write.aw.payload.len
  io_master_awsize  := core.dcache_write.aw.payload.size
  io_master_awburst := core.dcache_write.aw.payload.burst
  io_master_wvalid  := core.dcache_write.w.valid
  io_master_wdata   := core.dcache_write.w.payload.data
  io_master_wstrb   := core.dcache_write.w.payload.strb
  io_master_wlast   := core.dcache_write.w.payload.last
  io_master_bready  := True
  core.dcache_write.aw.ready := io_master_awready
  core.dcache_write.w.ready  := io_master_wready
  core.dcache_write.b.valid  := io_master_bvalid
  core.dcache_write.b.payload.resp := io_master_bresp
  core.dcache_write.b.payload.id   := io_master_bid
  
  // master read
  
  io_master_arvalid := (core.dcache_read.ar.valid & core.dcache_valid) | (core.icache_read.ar.valid & core.icache_valid)
  io_master_araddr  := (core.dcache_read.ar.payload.addr(31 downto 0) & U(32 bits, default -> core.dcache_valid)) | (core.icache_read.ar.payload.addr(31 downto 0) & U(32 bits, default -> core.icache_valid))
  io_master_arid    := (core.dcache_read.ar.payload.id & U(4 bits, default -> core.dcache_valid)) | (core.icache_read.ar.payload.id & U(4 bits, default -> core.icache_valid))
  io_master_arlen   := (core.dcache_read.ar.payload.len & U(8 bits, default -> core.dcache_valid)) | (core.icache_read.ar.payload.len & U(8 bits, default -> core.icache_valid))
  io_master_arsize  := (core.dcache_read.ar.payload.size & U(3 bits, default -> core.dcache_valid)) | (core.icache_read.ar.payload.size & U(3 bits, default -> core.icache_valid))
  io_master_arburst := (core.dcache_read.ar.payload.burst & B(2 bits, default -> core.dcache_valid)) | (core.icache_read.ar.payload.burst & B(2 bits, default -> core.icache_valid))
  io_master_rready  := True

  
  when(core.icache_read.ar.fire){
    core.word_sel := core.icache_read.ar.addr(2 downto 2)
  }
  core.icache_read.ar.ready  := core.icache_valid ? io_master_arready | False
  core.icache_read.r.valid   := io_master_rvalid && (io_master_rid===U(0))
  core.icache_read.r.payload.resp := io_master_rresp
  core.icache_read.r.payload.data := io_master_rdata.subdivideIn(32 bits)(core.word_sel)
  core.icache_read.r.payload.last := io_master_rlast
  core.icache_read.r.payload.id   := io_master_rid
  
  core.dcache_read.ar.ready  := core.dcache_valid ? io_master_arready | False
  core.dcache_read.r.valid   := io_master_rvalid && (io_master_rid===U(1))
  core.dcache_read.r.payload.resp := io_master_rresp
  core.dcache_read.r.payload.data := io_master_rdata
  core.dcache_read.r.payload.last := io_master_rlast
  core.dcache_read.r.payload.id   := io_master_rid

}

object GenSimpleForYsyx3rd extends App{
  SpinalVerilog(ysyx_210238())
}
