package dandriscv.gencpu

import dandriscv.super_scalar._
import spinal.core._
import spinal.lib.bus.amba4.axi._

case class SuperScalar() extends Component {

  // ================= Config ===============
  val icache_config = ICacheConfig(
    cacheSize = 16*1024, // 16 KB
    bytePerLine = 64,
    wayCount = 2,
    addressWidth = 32,
    cpuDataWidth = 64,
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
    // noBurst=false
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
    addressWidth = 64, 
    RAS_ENTRIES = 4, 
    BTB_ENTRIES = 4, 
    PHT_ENTRIES = 128
  )
  val rob_config = ReorderBufferConfig(
    DEPTH = 8
  )
  val iq_bju_config = IssueQueueConfig(
    DEPTH = 2,
    ROB_PTR_W = rob_config.PTR_WIDTH,
    IQ_Type = "BJU"
  )
  val iq_alu_config = IssueQueueConfig(
    DEPTH = 2,
    ROB_PTR_W = rob_config.PTR_WIDTH,
    IQ_Type = "ALU"
  )
  val iq_lsu_config = IssueQueueConfig(
    DEPTH = 2,
    ROB_PTR_W = rob_config.PTR_WIDTH,
    IQ_Type = "LSU"
  )

  // ================= Instance ===============
  val fetch = new FetchStage(0x30000000, icache_config)
  val icache = new ICacheTop(icache_config, icache_axi_config)
  val dcache = new DCacheTop(dcache_config, dcache_axi_config)
  val bpu = new gshare_predictor(gshare_config)
  val ptab = new PTAB(DEPTH=4)
  
  val rob = new ReorderBuffer(rob_config)
  
  val iq_bju = new IssueQueue(iq_bju_config)
  val iq_alu_0 = new IssueQueue(iq_alu_config)
  val iq_alu_1 = new IssueQueue(iq_alu_config)
  val iq_lsu = new IssueQueue(iq_lsu_config)
  val bju = new BJU()
  val alu_0 = new ALU()
  val alu_1 = new ALU()
  val lsu = new LSU(AW=MEM_AW, DW=64)
  val csr_regfile = new CsrRegfile(MXLEN=64)
  val clint = Clint(MXLEN=64, addressWidth=PC_WIDTH)
  val timer = (MXLEN=64, addressWidth=MEM_AW)

  // ================= Connect ===============
  fetch.flush := False // TODO:
  fetch.stall := False // TODO:
  fetch.interrupt_vld := clint.int_en
  fetch.interrupt_pc  := clint.int_pc
  fetch.redirect_vld  := bju.redirect_valid
  fetch.redirect_pc   := bju.redirect_pc
  fetch.bpu_predict_taken := bpu.predict_taken
  fetch.bpu_target_pc     := bpu.target_pc

  icache.flush := False // TODO:
  icache.icache_ports <> fetch.icache_ports
  
  dcache.flush := False // TODO:
  dcache.dcache_ports <> lsu.dcache_ports

  bpu.predict_pc := fetch.bpu_predict_pc
  bpu.predict_valid := fetch.bpu_predict_valid
  bpu.train_valid := bju.train_valid
  bpu.train_taken := bju.train_taken
  bpu.train_mispredicted := bju.train_mispred
  bpu.train_history := bju.train_history
  bpu.train_pc := bju.train_pc
  bpu.train_pc_next := bju.train_pc_next
  bpu.train_is_call := bju.train_is_call
  bpu.train_is_ret  := bju.train_is_ret
  bpu.train_is_jmp  := bju.train_is_jmp

  ptab.flush := False // TODO:
  ptab.bpu_predict_pc := fetch.bpu_predict_pc
  ptab.bpu_predict_taken := bpu.predict_taken
  ptab.bpu_target_pc := bpu.predict_pc_next
  ptab.exe_brc_or_jmp := bju.brc_or_jmp


}