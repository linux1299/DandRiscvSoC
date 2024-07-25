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
  val fetch = new Fetch(0x30000000, icache_config)
  val icache = new ICacheTop(icache_config, icache_axi_config)
  // val dcache = new DCacheTop(dcache_config, dcache_axi_config)
  val bpu = new gshare_predictor(gshare_config)
  val PTAB = new PTAB(4)
  val decode_0 = new Decode()
  val decode_1 = new Decode()
  val rob = new ReorderBuffer(rob_config)
  val ARF = new ARF()
  val RAT = new RAT(rob_config)
  val iq_bju = new IssueQueue(iq_bju_config)
  val iq_alu_0 = new IssueQueue(iq_alu_config)
  val iq_alu_1 = new IssueQueue(iq_alu_config)
  val iq_lsu = new IssueQueue(iq_lsu_config)
  val bju = new BJU()
  val alu_0 = new ALU()
  val alu_1 = new ALU()
  val lsu = new LSU()

  // ================= Connect ===============
  
}