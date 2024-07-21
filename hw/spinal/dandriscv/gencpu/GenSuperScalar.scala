package dandriscv.gencpu

import dandriscv.ip._
import dandriscv.super_scalar._
import spinal.core._


case class SuperScalar() extends Component {

  // ================= Config ===============
  val icache_config = ICacheConfig(
    cacheSize = 32*1024, // 32KB
    bytePerLine = 64,
    wayCount = 4,
    addressWidth = 32,
    cpuDataWidth = 32,
    bankWidth = 32,
    busDataWidth = 64,
    directOutput = false,
    noBurst=true
  )
  val dcache_config = DCacheConfig(
    // cacheSize = 32*1024, // 32KB
    // cacheSize = 1*1024, // 1KB
    cacheSize = 512, // 512B
    bytePerLine =64,
    wayCount = 2,
    // addressWidth = 64,
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

  // ================= Instance ===============
  val fetch = new Fetch(0x30000000, icache_config)
  val icache = new ICacheTop(icache_config, icache_axi_config)
  val dcache = new DCacheTop(dcache_config, dcache_axi_config)
  val bpu = new gshare_predictor(gshare_config)
  val PTAB = new PTAB(4)
  val decode_0 = new Decode()
  val decode_1 = new Decode()
  
}