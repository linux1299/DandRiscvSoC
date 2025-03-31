package dandriscv.gencpu

import dandriscv.super_scalar._
import spinal.core._
import spinal.lib.bus.amba4.axi._
import spinal.lib._

case class SuperScalar() extends Component {
  import CpuConfig._

  

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
    addressWidth = 32,
    RAS_ENTRIES = 4, 
    BTB_ENTRIES = 4, 
    PHT_ENTRIES = 32
  )
  val rob_config = ReorderBufferConfig(
    DEPTH = 4
  )
  val iq_bju_config = IssueQueueConfig(
    DEPTH = 2,
    IQ_Type = "BJU"
  )
  val iq_alu_config = IssueQueueConfig(
    DEPTH = 2,
    IQ_Type = "ALU"
  )
  val iq_lsu_config = IssueQueueConfig(
    DEPTH = 2,
    IQ_Type = "LSU"
  )

  // ================= IO ===============
  // icache next level AXI ports/ direct ports
  val icacheMaster = ifGen(icache_config.directOutput){master(ICacheAccess(icache_config.addressWidth, icache_config.cpuDataWidth)).setName("icache")}
  val icacheReader = ifGen(!icache_config.directOutput){master(Axi4ReadOnly(icache_axi_config)).setName("icache")}
  // dcache next level AXI ports/ or direct ports
  val dcacheMaster = ifGen(dcache_config.directOutput){master(DCacheAccess(dcache_config.addressWidth, dcache_config.cpuDataWidth)).setName("dcache")}
  val dcacheReader = ifGen(!dcache_config.directOutput){master(Axi4ReadOnly(dcache_axi_config)).setName("dcache")}
  val dcacheWriter = ifGen(!dcache_config.directOutput){master(Axi4WriteOnly(dcache_axi_config)).setName("dcache")}
  // add for difftest
  val de_rob_a_ready = ifGen(DIFFTEST){in Bool()}
  val de_rob_b_ready = ifGen(DIFFTEST){in Bool()}


  // ================= Instance ===============
  val fetch = new FetchStage(0x80000000l, icache_config)
  val icache = new ICacheTop(icache_config, icache_axi_config)
  val bpu = new gshare_predictor(gshare_config)
  val ptab = new PTAB(DEPTH=4)
  val decode = new DecodeStage(rob_config)
  val rob = new ReorderBuffer(rob_config)
  
  val isq_bju_0 = new IssueQueue_1entry(iq_bju_config)
  val isq_alu_0 = new IssueQueue_1entry(iq_alu_config)
  val isq_alu_1 = new IssueQueue_1entry(iq_alu_config)
  val isq_lsu_0 = new IssueQueue_1entry(iq_lsu_config)
  val bju_0 = new BJU()
  val alu_0 = new ALU()
  val alu_1 = new ALU()
  val lsu_0 = new LSU(AW=MEM_AW, DW=64)
  val dcache = new DCacheTop(dcache_config, dcache_axi_config)
  val timer = new Timer(MXLEN=64, addressWidth=MEM_AW)

  val change_flow = bju_0.interrupt_valid || bju_0.redirect_valid

  // ================= Fetch ===============
  fetch.flush             := change_flow
  fetch.stall             := False
  fetch.interrupt_vld     := bju_0.interrupt_valid
  fetch.interrupt_pc      := bju_0.interrupt_pc
  fetch.redirect_vld      := bju_0.redirect_valid
  fetch.redirect_pc       := bju_0.redirect_pc
  fetch.icache_ports.cmd  >> icache.icache_ports.cmd
  icache.icache_ports.rsp >> fetch.icache_ports.rsp
  fetch.bpu_predict_taken := bpu.predict_taken
  fetch.bpu_target_pc     := bpu.target_pc

  // ================= ICache ===============
  icache.flush := False
  
  // ================= BPU ===============
  bpu.predict_pc         := fetch.bpu_predict_pc
  bpu.predict_valid      := fetch.bpu_predict_valid
  bpu.train_valid        := bju_0.train_valid
  bpu.train_taken        := bju_0.train_taken
  bpu.train_mispredicted := bju_0.train_mispred
  bpu.train_history      := bju_0.train_history
  bpu.train_pc           := bju_0.train_pc
  bpu.train_pc_next      := bju_0.train_pc_next
  bpu.train_is_call      := bju_0.train_is_call
  bpu.train_is_ret       := bju_0.train_is_ret
  bpu.train_is_jmp       := bju_0.train_is_jmp

  // ================= PTAB ===============
  ptab.flush             := change_flow
  ptab.bpu_predict_valid := fetch.bpu_predict_valid
  ptab.bpu_predict_taken := bpu.predict_taken
  ptab.bpu_target_pc     := bpu.target_pc
  ptab.exe_brc_or_jmp    := bju_0.brc_or_jmp

  // ================= Decode ===============
  decode.flush       := change_flow
  decode.stall       := False
  decode.src_ports_0 <> fetch.dst_ports_0.throwWhen(change_flow)
  decode.src_ports_1 <> fetch.dst_ports_1.throwWhen(change_flow)

  // ================= ROB ===============
  rob.en_rob_a         <> decode.en_rob_ports_0.throwWhen(change_flow)
  rob.en_rob_b         <> decode.en_rob_ports_1.throwWhen(change_flow)
  rob.exe_dst_ports(0) <> bju_0.dst_ports
  rob.exe_dst_ports(1) <> alu_0.dst_ports
  rob.exe_dst_ports(2) <> alu_1.dst_ports
  rob.exe_dst_ports(3) <> lsu_0.dst_ports
  rob.isq_rob_ptr(0)   := isq_bju_0.de_queue.rd_rob_ptr
  rob.isq_issued(0)    := isq_bju_0.de_queue.fire
  rob.isq_rob_ptr(1)   := isq_alu_0.de_queue.rd_rob_ptr
  rob.isq_issued(1)    := isq_alu_0.de_queue.fire
  rob.isq_rob_ptr(2)   := isq_alu_1.de_queue.rd_rob_ptr
  rob.isq_issued(2)    := isq_alu_1.de_queue.fire
  rob.isq_rob_ptr(3)   := isq_lsu_0.de_queue.rd_rob_ptr
  rob.isq_issued(3)    := isq_lsu_0.de_queue.fire
  rob.interrupt_vld    := bju_0.interrupt_valid
  rob.redirect_vld     := bju_0.redirect_valid
  rob.bju_rob_ptr      := isq_bju_0.de_queue.rd_rob_ptr
  if(DIFFTEST){
    rob.de_rob_a_ready := de_rob_a_ready
    rob.de_rob_b_ready := de_rob_b_ready
  }

  // ================= Wake up ===============
  for(i <- 0 until IQ_NUM){
    isq_bju_0.wakeup(i) <> rob.isq_wakeup(i)
    isq_alu_0.wakeup(i) <> rob.isq_wakeup(i)
    isq_alu_1.wakeup(i) <> rob.isq_wakeup(i)
    isq_lsu_0.wakeup(i) <> rob.isq_wakeup(i)
  }

  // ================= Issue queue of BJU ===============
  isq_bju_0.flush    := rob.rob_flush
  isq_bju_0.en_queue <> rob.en_queue_0

  // ================= Issue queue of ALU 0 ===============
  isq_alu_0.flush    := rob.rob_flush
  isq_alu_0.en_queue <> rob.en_queue_1

  // ================= Issue queue of ALU 1 ===============
  isq_alu_1.flush    := rob.rob_flush
  isq_alu_1.en_queue <> rob.en_queue_2

  // ================= Issue queue of LSU ===============
  isq_lsu_0.flush    := rob.rob_flush
  isq_lsu_0.en_queue <> rob.en_queue_3
  isq_lsu_0.rob_head_ptr := rob.rob_head_ptr


  // ================= BJU ===============
  bju_0.flush          := rob.rob_flush
  bju_0.stall          := rob.rob_stall
  bju_0.src_ports      <> isq_bju_0.de_queue
  bju_0.bpu_pred_taken := ptab.exe_branch_taken
  bju_0.bpu_target_pc  := ptab.exe_target_pc
  bju_0.timer_int      := timer.timer_int

  // ================= ALU 0 ===============
  alu_0.flush     := rob.rob_flush
  alu_0.stall     := False
  alu_0.src_ports <> isq_alu_0.de_queue

  // ================= ALU 1 ===============
  alu_1.flush     := rob.rob_flush
  alu_1.stall     := False
  alu_1.src_ports <> isq_alu_1.de_queue

  // ================= LSU ===============
  lsu_0.flush     := rob.rob_flush
  lsu_0.stall     := False
  lsu_0.src_ports <> isq_lsu_0.de_queue

  // ================= DCache ===============
  dcache.flush            := False
  dcache.dcache_ports.cmd << lsu_0.dcache_ports.cmd
  dcache.dcache_ports.rsp >> lsu_0.dcache_ports.rsp

  // ================= Timer ===============
  timer.cen   := lsu_0.timer_cen
  timer.wen   := lsu_0.timer_wen
  timer.addr  := lsu_0.timer_addr
  timer.wdata := lsu_0.timer_wdata

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


object GenSuperScalar extends App {
  GenConfig.spinal.generateVerilog(SuperScalar())
}