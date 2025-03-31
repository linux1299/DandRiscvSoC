package dandriscv.super_scalar_1issue

import dandriscv.super_scalar_1issue._
import spinal.core._
import spinal.lib.bus.amba4.axi._
import spinal.lib._

case class DandMaxFreq() extends Component {
  import CpuConfig._

  

  // ================= Config ===============
  val icache_config = ICacheConfig(
    cacheSize = 16*1024, // 16 KB
    bytePerLine = 64,
    wayCount = 2,
    addressWidth = 32,
    cpuDataWidth = 32,
    bankWidth = 32,
    busDataWidth = 64,
    directOutput = false,
    noBurst=true
  )
  val dcache_config = DCacheConfig(
    cacheSize = 32*1024, // 16 KB
    bytePerLine =64,
    wayCount = 2,
    addressWidth = 32,
    cpuDataWidth = 64,
    bankWidth = 64,
    busDataWidth = 64,
    directOutput = false,
    noBurst=true
  )
  val icache_axi_config = Axi4Config(
    addressWidth=icache_config.addressWidth, 
    dataWidth=icache_config.busDataWidth, 
    idWidth=2,
    useId=true, 
    useLast=true, 
    useRegion=false, 
    useBurst=true, 
    useLock=false, 
    useCache=false, 
    useSize=true, 
    useQos=false,
    useLen=true, 
    useResp=true, 
    useProt=false, 
    useStrb=false
  )
  val dcache_axi_config = Axi4Config(
    addressWidth=dcache_config.addressWidth, 
    dataWidth=dcache_config.busDataWidth, 
    idWidth=2,
    useId=true, 
    useLast=true, 
    useRegion=false, 
    useBurst=true, 
    useLock=false, 
    useCache=false, 
    useSize=true, 
    useQos=false,
    useLen=true, 
    useResp=true, 
    useProt=false, 
    useStrb=true
  )
  val gshare_config = PredictorConfig(
    addressWidth = 32,
    RAS_ENTRIES = 4, 
    BTB_ENTRIES = 4, 
    PHT_ENTRIES = 32
  )

  // ================= IO ===============
  // icache next level AXI ports/ direct ports
  val icacheMaster = ifGen(icache_config.directOutput){master(ICacheAccess(icache_config.addressWidth, icache_config.cpuDataWidth)).setName("icache")}
  val icacheReader = ifGen(!icache_config.directOutput){master(Axi4ReadOnly(icache_axi_config)).setName("icache")}
  // dcache next level AXI ports/ or direct ports
  val dcacheMaster = ifGen(dcache_config.directOutput){master(DCacheAccess(dcache_config.addressWidth, dcache_config.cpuDataWidth)).setName("dcache")}
  val dcacheReader = ifGen(!dcache_config.directOutput){master(Axi4ReadOnly(dcache_axi_config)).setName("dcache")}
  val dcacheWriter = ifGen(!dcache_config.directOutput){master(Axi4WriteOnly(dcache_axi_config)).setName("dcache")}


  // ================= Instance ===============
  val fetch = new FetchStage(0x80000000l, icache_config)
  val icache = new ICacheTop(icache_config, icache_axi_config)
  val bpu = new static_predictor(gshare_config)
  val control = new Control()
  val bju = new BJU()
  val alu = new ALU()
  val lsu = new LSU(AW=MEM_AW, DW=64)
  val dcache = new DCacheTop(dcache_config, dcache_axi_config)
  val timer = new Timer(MXLEN=64, addressWidth=MEM_AW)

  val change_flow = bju.interrupt_valid || bju.redirect_valid

  // ================= Fetch ===============
  fetch.flush             := change_flow
  fetch.stall             := False
  fetch.interrupt_vld     := bju.interrupt_valid
  fetch.interrupt_pc      := bju.interrupt_pc
  fetch.redirect_vld      := bju.redirect_valid
  fetch.redirect_pc       := bju.redirect_pc
  fetch.icache_ports.cmd  >> icache.icache_ports.cmd
  icache.icache_ports.rsp >> fetch.icache_ports.rsp
  fetch.bpu_predict_taken := bpu.predict_taken
  fetch.bpu_target_pc     := bpu.target_pc

  // ================= ICache ===============
  icache.flush := False
  
  // ================= BPU ===============
  if(BPU_TYPE=="static"){
    // static
    bpu.predict_imm := fetch.bpu_predict_imm(31 downto 0)
    bpu.predict_jal := fetch.bpu_predict_jal
    bpu.predict_branch := fetch.bpu_predict_branch
  }
  // else if(BPU_TYPE=="gshare"){
  //   bpu.train_valid        := bju.train_valid
  //   bpu.train_taken        := bju.train_taken
  //   bpu.train_mispredicted := bju.train_mispred
  //   bpu.train_history      := bju.train_history
  //   bpu.train_pc           := bju.train_pc
  //   bpu.train_pc_next      := bju.train_pc_next
  //   bpu.train_is_call      := bju.train_is_call
  //   bpu.train_is_ret       := bju.train_is_ret
  //   bpu.train_is_jmp       := bju.train_is_jmp
  // }
  bpu.predict_pc         := fetch.bpu_predict_pc
  bpu.predict_valid      := fetch.bpu_predict_valid

  // ================= Control ===============
  control.flush := change_flow
  control.src_ports <> fetch.dst_ports
  control.wb_ports_alu <> alu.dst_ports
  control.wb_ports_bju <> bju.dst_ports
  control.wb_ports_lsu <> lsu.dst_ports

  // ================= BJU ===============
  bju.flush          := False
  bju.stall          := False
  bju.src_ports      <> control.to_ports_bju
  bju.timer_int      := timer.timer_int

  // ================= ALU 0 ===============
  alu.flush     := False
  alu.stall     := False
  alu.src_ports <> control.to_ports_alu

  // ================= LSU ===============
  lsu.flush     := False
  lsu.stall     := False
  lsu.src_ports <> control.to_ports_lsu

  // ================= DCache ===============
  dcache.flush            := False
  dcache.dcache_ports.cmd << lsu.dcache_ports.cmd
  dcache.dcache_ports.rsp >> lsu.dcache_ports.rsp

  // ================= Timer ===============
  timer.cen   := lsu.timer_cen
  timer.wen   := lsu.timer_wen
  timer.addr  := lsu.timer_addr
  timer.wdata := lsu.timer_wdata

  // ================= Top AXI IF ===============
  if(icache_config.directOutput){
    icacheMaster.cmd <> icache.icacheMaster.cmd
    icacheMaster.rsp <> icache.icacheMaster.rsp
  }
  else if(icacheReader!=null){
    icacheReader.ar << icache.icacheReader.ar
    icacheReader.r  >> icache.icacheReader.r
  }

  if(dcache_config.directOutput){
    dcacheMaster.cmd <> dcache.dcacheMaster.cmd
    dcacheMaster.rsp <> dcache.dcacheMaster.rsp
  }
  else if((dcacheReader!=null) && (dcacheWriter!=null)){
    dcacheReader.ar << dcache.dcacheReader.ar
    dcacheReader.r  >> dcache.dcacheReader.r
    dcacheWriter.aw << dcache.dcacheWriter.aw
    dcacheWriter.w  << dcache.dcacheWriter.w
    dcacheWriter.b  >> dcache.dcacheWriter.b
  }

}


object GenDandMaxFreq extends App {
  GenConfig.spinal.generateVerilog(DandMaxFreq())
}