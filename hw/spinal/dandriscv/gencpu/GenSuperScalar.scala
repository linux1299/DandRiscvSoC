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
    DEPTH = 8
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


  // ================= Instance ===============
  val fetch = new FetchStage(0x30000000, icache_config)
  val icache = new ICacheTop(icache_config, icache_axi_config)
  val bpu = new gshare_predictor(gshare_config)
  val ptab = new PTAB(DEPTH=4)
  val decode = new DecodeStage(rob_config)
  val rob = new ReorderBuffer(rob_config)
  
  val iq_bju = new IssueQueue(iq_bju_config)
  val iq_alu_0 = new IssueQueue(iq_alu_config)
  val iq_alu_1 = new IssueQueue(iq_alu_config)
  val iq_lsu = new IssueQueue(iq_lsu_config)
  val bju = new BJU()
  val alu_0 = new ALU()
  val alu_1 = new ALU()
  val lsu = new LSU(AW=MEM_AW, DW=64)
  val dcache = new DCacheTop(dcache_config, dcache_axi_config)
  val timer = new Timer(MXLEN=64, addressWidth=MEM_AW)

  // ================= Connect ===============
  fetch.flush := False // TODO:
  fetch.stall := False // TODO:
  fetch.interrupt_vld := bju.interrupt_valid
  fetch.interrupt_pc  := bju.interrupt_pc
  fetch.redirect_vld  := bju.redirect_valid
  fetch.redirect_pc   := bju.redirect_pc
  fetch.icache_ports.cmd >> icache.icache_ports.cmd
  icache.icache_ports.rsp >> fetch.icache_ports.rsp
  fetch.bpu_predict_taken := bpu.predict_taken
  fetch.bpu_target_pc := bpu.target_pc

  icache.flush := False // TODO:
  
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
  ptab.bpu_predict_valid := fetch.bpu_predict_valid
  ptab.bpu_predict_taken := bpu.predict_taken
  ptab.bpu_target_pc := bpu.target_pc
  ptab.exe_brc_or_jmp := bju.brc_or_jmp

  decode.flush := False // TODO:
  decode.stall := False // TODO:
  decode.src_ports_0 <> fetch.dst_ports_0
  decode.src_ports_1 <> fetch.dst_ports_1

  rob.en_rob_a <> decode.en_rob_ports_0
  rob.en_rob_b <> decode.en_rob_ports_1
  rob.exe_rob_ptr(0) := bju.dst_ports.rd_rob_ptr
  rob.exe_rd_val(0)  := bju.dst_ports.result
  rob.exe_executed(0):= bju.dst_ports.fire && bju.dst_ports.rd_wen
  rob.exe_rob_ptr(1) := alu_0.dst_ports.rd_rob_ptr
  rob.exe_rd_val(1)  := alu_0.dst_ports.result
  rob.exe_executed(1):= alu_0.dst_ports.fire && alu_0.dst_ports.rd_wen
  rob.exe_rob_ptr(2) := alu_1.dst_ports.rd_rob_ptr
  rob.exe_rd_val(2)  := alu_1.dst_ports.result
  rob.exe_executed(2):= alu_1.dst_ports.fire && alu_1.dst_ports.rd_wen
  rob.exe_rob_ptr(3) := lsu.dst_ports.rd_rob_ptr
  rob.exe_rd_val(3)  := lsu.dst_ports.result
  rob.exe_executed(3):= lsu.dst_ports.fire && lsu.dst_ports.rd_wen
  rob.isq_rob_ptr(0) := iq_bju.de_queue.rd_rob_ptr
  rob.isq_issued(0)  := iq_bju.de_queue.fire
  rob.isq_rob_ptr(1) := iq_alu_0.de_queue.rd_rob_ptr
  rob.isq_issued(1)  := iq_alu_0.de_queue.fire
  rob.isq_rob_ptr(2) := iq_alu_1.de_queue.rd_rob_ptr
  rob.isq_issued(2)  := iq_alu_1.de_queue.fire
  rob.isq_rob_ptr(3) := iq_lsu.de_queue.rd_rob_ptr
  rob.isq_issued(3)  := iq_lsu.de_queue.fire
  rob.interrupt_vld  := bju.interrupt_valid
  rob.redirect_vld   := bju.redirect_valid

  iq_bju.flush := False // TODO:
  iq_bju.en_queue <> rob.en_queue_0
  iq_bju.exe_rob_ptr(0) := bju.dst_ports.rd_rob_ptr
  iq_bju.exe_rd_val(0)  := bju.dst_ports.result
  iq_bju.exe_executed(0):= bju.dst_ports.fire && bju.dst_ports.rd_wen
  iq_bju.exe_rob_ptr(1) := alu_0.dst_ports.rd_rob_ptr
  iq_bju.exe_rd_val(1) := alu_0.dst_ports.result
  iq_bju.exe_executed(1) := alu_0.dst_ports.fire && alu_0.dst_ports.rd_wen
  iq_bju.exe_rob_ptr(2) := alu_1.dst_ports.rd_rob_ptr
  iq_bju.exe_rd_val(2) := alu_1.dst_ports.result
  iq_bju.exe_executed(2) := alu_1.dst_ports.fire && alu_1.dst_ports.rd_wen
  iq_bju.exe_rob_ptr(3) := lsu.dst_ports.rd_rob_ptr
  iq_bju.exe_rd_val(3) := lsu.dst_ports.result
  iq_bju.exe_executed(3) := lsu.dst_ports.fire && lsu.dst_ports.rd_wen
  iq_bju.de_queue.ready := bju.src_ports.ready

  iq_alu_0.flush := False // TODO:
  iq_alu_0.en_queue <> rob.en_queue_1
  iq_alu_0.exe_rob_ptr(0) := bju.dst_ports.rd_rob_ptr
  iq_alu_0.exe_rd_val(0) := bju.dst_ports.result
  iq_alu_0.exe_executed(0) := bju.dst_ports.fire && bju.dst_ports.rd_wen
  iq_alu_0.exe_rob_ptr(1) := alu_0.dst_ports.rd_rob_ptr
  iq_alu_0.exe_rd_val(1) := alu_0.dst_ports.result
  iq_alu_0.exe_executed(1) := alu_0.dst_ports.fire && alu_0.dst_ports.rd_wen
  iq_alu_0.exe_rob_ptr(2) := alu_1.dst_ports.rd_rob_ptr
  iq_alu_0.exe_rd_val(2) := alu_1.dst_ports.result
  iq_alu_0.exe_executed(2) := alu_1.dst_ports.fire && alu_1.dst_ports.rd_wen
  iq_alu_0.exe_rob_ptr(3) := lsu.dst_ports.rd_rob_ptr
  iq_alu_0.exe_rd_val(3) := lsu.dst_ports.result
  iq_alu_0.exe_executed(3) := lsu.dst_ports.fire && lsu.dst_ports.rd_wen
  iq_alu_0.de_queue.ready := alu_0.src_ports.ready

  iq_alu_1.flush := False // TODO:
  iq_alu_1.en_queue <> rob.en_queue_2
  iq_alu_1.exe_rob_ptr(0) := bju.dst_ports.rd_rob_ptr
  iq_alu_1.exe_rd_val(0) := bju.dst_ports.result
  iq_alu_1.exe_executed(0) := bju.dst_ports.fire && bju.dst_ports.rd_wen
  iq_alu_1.exe_rob_ptr(1) := alu_0.dst_ports.rd_rob_ptr
  iq_alu_1.exe_rd_val(1) := alu_0.dst_ports.result
  iq_alu_1.exe_executed(1) := alu_0.dst_ports.fire && alu_0.dst_ports.rd_wen
  iq_alu_1.exe_rob_ptr(2) := alu_1.dst_ports.rd_rob_ptr
  iq_alu_1.exe_rd_val(2) := alu_1.dst_ports.result
  iq_alu_1.exe_executed(2) := alu_1.dst_ports.fire && alu_1.dst_ports.rd_wen
  iq_alu_1.exe_rob_ptr(3) := lsu.dst_ports.rd_rob_ptr
  iq_alu_1.exe_rd_val(3) := lsu.dst_ports.result
  iq_alu_1.exe_executed(3) := lsu.dst_ports.fire && lsu.dst_ports.rd_wen
  iq_alu_1.de_queue.ready := alu_1.src_ports.ready

  iq_lsu.flush := False // TODO:
  iq_lsu.en_queue <> rob.en_queue_3
  iq_lsu.exe_rob_ptr(0) := bju.dst_ports.rd_rob_ptr
  iq_lsu.exe_rd_val(0) := bju.dst_ports.result
  iq_lsu.exe_executed(0) := bju.dst_ports.fire && bju.dst_ports.rd_wen
  iq_lsu.exe_rob_ptr(1) := alu_0.dst_ports.rd_rob_ptr
  iq_lsu.exe_rd_val(1) := alu_0.dst_ports.result
  iq_lsu.exe_executed(1) := alu_0.dst_ports.fire && alu_0.dst_ports.rd_wen
  iq_lsu.exe_rob_ptr(2) := alu_1.dst_ports.rd_rob_ptr
  iq_lsu.exe_rd_val(2) := alu_1.dst_ports.result
  iq_lsu.exe_executed(2) := alu_1.dst_ports.fire && alu_1.dst_ports.rd_wen
  iq_lsu.exe_rob_ptr(3) := lsu.dst_ports.rd_rob_ptr
  iq_lsu.exe_rd_val(3) := lsu.dst_ports.result
  iq_lsu.exe_executed(3) := lsu.dst_ports.fire && lsu.dst_ports.rd_wen
  iq_lsu.de_queue.ready := lsu.src_ports.ready


  bju.flush := False // TODO:
  bju.stall := False // TODO:
  bju.src_ports.valid := iq_bju.de_queue.valid
  bju.src_ports.src1  := iq_bju.de_queue.src1_val
  bju.src_ports.src2  := iq_bju.de_queue.src2_val
  bju.src_ports.imm   := iq_bju.de_queue.imm_val
  bju.src_ports.pc    := iq_bju.de_queue.pc
  bju.src_ports.micro_op := iq_bju.de_queue.micro_op
  bju.src_ports.rd_rob_ptr:= iq_bju.de_queue.rd_rob_ptr
  bju.bpu_pred_taken := ptab.exe_branch_taken
  bju.bpu_target_pc := ptab.exe_target_pc
  bju.timer_int := timer.timer_int
  bju.dst_ports.ready := True


  alu_0.flush := False // TODO:
  alu_0.stall := False // TODO:
  alu_0.src_ports.valid := iq_alu_0.de_queue.valid
  alu_0.src_ports.src1  := iq_alu_0.de_queue.src1_val
  alu_0.src_ports.src2  := iq_alu_0.de_queue.src2_val
  alu_0.src_ports.micro_op := iq_alu_0.de_queue.micro_op
  alu_0.src_ports.rd_rob_ptr := iq_alu_0.de_queue.rd_rob_ptr
  alu_0.dst_ports.ready := True

  alu_1.flush := False // TODO:
  alu_1.stall := False // TODO:
  alu_1.src_ports.valid := iq_alu_1.de_queue.valid
  alu_1.src_ports.src1  := iq_alu_1.de_queue.src1_val
  alu_1.src_ports.src2  := iq_alu_1.de_queue.src2_val
  alu_1.src_ports.micro_op := iq_alu_1.de_queue.micro_op
  alu_1.src_ports.rd_rob_ptr := iq_alu_1.de_queue.rd_rob_ptr
  alu_1.dst_ports.ready := True

  lsu.flush := False // TODO:
  lsu.stall := False // TODO:
  lsu.src_ports.valid := iq_lsu.de_queue.valid
  lsu.src_ports.src1  := iq_lsu.de_queue.src1_val
  lsu.src_ports.src2  := iq_lsu.de_queue.src2_val
  lsu.src_ports.imm   := iq_lsu.de_queue.imm_val
  lsu.src_ports.micro_op := iq_lsu.de_queue.micro_op
  lsu.src_ports.rd_rob_ptr := iq_lsu.de_queue.rd_rob_ptr
  lsu.dst_ports.ready := True

  dcache.flush := False // TODO:
  dcache.dcache_ports.cmd << lsu.dcache_ports.cmd
  dcache.dcache_ports.rsp >> lsu.dcache_ports.rsp

  timer.cen := lsu.timer_cen
  timer.wen := lsu.timer_wen
  timer.addr := lsu.timer_addr
  timer.wdata := lsu.timer_wdata

  if(icache_config.directOutput){
    icacheMaster.cmd <> icache.icacheMaster.cmd
    icacheMaster.rsp <> icache.icacheMaster.rsp
  }
  else if(icacheReader!=null){
    icacheReader.ar << icache.icacheReader.ar
    icacheReader.r >> icache.icacheReader.r
  }

  if(dcache_config.directOutput){
    dcacheMaster.cmd <> dcache.dcacheMaster.cmd
    dcacheMaster.rsp <> dcache.dcacheMaster.rsp
  }
  else if((dcacheReader!=null) && (dcacheWriter!=null)){
    dcacheReader.ar << dcache.dcacheReader.ar
    dcacheReader.r >> dcache.dcacheReader.r
    dcacheWriter.aw << dcache.dcacheWriter.aw
    dcacheWriter.w << dcache.dcacheWriter.w
    dcacheWriter.b >> dcache.dcacheWriter.b
  }
  


}


object GenSuperScalar extends App {
  GenConfig.spinal.generateVerilog(SuperScalar())
}