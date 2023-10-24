package dandriscv.plugin_simple

import spinal.core._
import spinal.lib._

import dandriscv._
import dandriscv.ip._
import dandriscv.plugin._
import dandriscv.plugin_simple._
import spinal.lib.bus.amba4.axi._

trait DCacheAccessService {
  def newDCacheAccess() : DCacheAccess
}

// ================ next level ports as master ==============
case class DCacheNextLevelCmd(p : DCacheConfig) extends Bundle{
  val addr = UInt(p.addressWidth bits)
  val len  = UInt(4 bits)
  val size = UInt(3 bits)
  val wen  = Bool()
  val wdata= Bits(p.busDataWidth bits)
  val wstrb= Bits(p.busDataWidth/8 bits)
}
case class DCacheNextLevelRsp(p : DCacheConfig) extends Bundle{
  val data = Bits(p.busDataWidth bits)
  val bresp= Bits(2 bits)
  val rvalid = Bool()
}
case class DCacheNextLevelPorts(p : DCacheConfig) extends Bundle with IMasterSlave{
  val cmd = Stream(DCacheNextLevelCmd(p))
  val rsp = Flow(DCacheNextLevelRsp(p))

  override def asMaster(): Unit = {
    master(cmd)
    slave(rsp)
  }
}

// ================ cpu and dcache ports ===============
case class DCacheAccessCmd(AW: Int, DW: Int) extends Bundle {
  val addr = UInt(AW bits)
  val wen  = Bool()
  val wdata= Bits(DW bits)
  val wstrb= Bits(DW/8 bits)
  val size = UInt(3 bits)
}
case class DCacheAccessRsp(DW: Int) extends Bundle {
  val data = Bits(DW bits)
}
case class DCacheAccess(AW: Int, DW: Int) extends Bundle with IMasterSlave{
  val cmd = Stream(DCacheAccessCmd(AW, DW))
  val rsp = Flow(DCacheAccessRsp(DW))
  val stall = Bool()
  override def asMaster(): Unit = {
    master(cmd)
    slave(rsp)
  }
  override def asSlave(): Unit = {
    slave(cmd)
    master(rsp)
  }
}


class DCachePlugin(val config : DCacheConfig) extends Plugin[DandRiscvSimple]{

  import config._

  var dcache_access : DCacheAccess = null
  var dcacheReader : Axi4ReadOnly = null
  var dcacheWriter : Axi4WriteOnly = null

  override def setup(pipeline: DandRiscvSimple): Unit = {
    import Riscv._
    import pipeline.config._
    dcache_access = pipeline.service(classOf[DCacheAccessService]).newDCacheAccess
  }

   override def build(pipeline: DandRiscvSimple): Unit = {
    import pipeline._
    import pipeline.config._

    val dcache_config = DCachePlugin.this.config

    if (!dcache_config.directOutput && !noBurst){
      val dcache = new DCache(dcache_config)
      val srambanks   = new SramBanks(false, dcache_config.wayCount, dcache_config.bankNum, dcache_config.bankWidth, dcache_config.bankDepthBits)

      // impl dcache access logic
      dcache_access.cmd <> dcache.cpu.cmd
      dcache_access.rsp <> dcache.cpu.rsp
      dcache.flush := False // TODO:
      dcache_access.stall <> dcache.stall

      // sram ports
      val connect_sram = for(i<-0 until dcache_config.wayCount) yield new Area{
        dcache.sram(i).ports <> srambanks.sram(i).ports
      }

      // next level AXI ports
      val axiConfig = Axi4Config(addressWidth=dcache_config.addressWidth, dataWidth=dcache_config.busDataWidth, idWidth=4,
                                 useId=true, useLast=true, useRegion=false, useBurst=true, 
                                 useLock=false, useCache=false, useSize=true, useQos=false,
                                 useLen=true, useResp=true, useProt=false, useStrb=true)
      dcacheReader = master(Axi4ReadOnly(axiConfig)).setName("dcache")
      dcacheWriter = master(Axi4WriteOnly(axiConfig)).setName("dcache")
      val handshake_cnt = RegInit(False)
      val nextlevel_read = dcache.next_level.cmd.valid && !dcache.next_level.cmd.payload.wen
      val nextlevel_write= dcache.next_level.cmd.valid && dcache.next_level.cmd.payload.wen
      val bypass_read = dcache.cpu_bypass.cmd.valid && !dcache.cpu_bypass.cmd.wen
      val bypass_write = dcache.cpu_bypass.cmd.valid && dcache.cpu_bypass.cmd.wen
      
      // ar channel
      dcacheReader.ar.valid.setAsReg() init(False)
      dcacheReader.ar.payload.id.setAsReg() init(0)
      dcacheReader.ar.payload.len.setAsReg() init(0)
      dcacheReader.ar.payload.size.setAsReg() init(0)
      dcacheReader.ar.payload.burst.setAsReg() init(0)
      dcacheReader.ar.payload.addr.setAsReg() init(0)
      
      when(nextlevel_read || bypass_read){
        dcacheReader.ar.valid      := True
      }
      .elsewhen(dcacheReader.ar.fire){
        dcacheReader.ar.valid      := False
      }
      dcacheReader.ar.payload.id   := U(1)
      dcacheReader.ar.payload.len  := bypass_read ? U(0, 8 bits) | dcache.next_level.cmd.payload.len.resized
      dcacheReader.ar.payload.size := bypass_read ? dcache.cpu_bypass.cmd.size | dcache.next_level.cmd.payload.size
      dcacheReader.ar.payload.burst := B(1) // INCR
      dcacheReader.ar.payload.addr := bypass_read ? dcache.cpu_bypass.cmd.addr | dcache.next_level.cmd.payload.addr

      // r channel
      dcacheReader.r.ready := True

      // aw channel      
      dcacheWriter.aw.valid.setAsReg() init(False)
      dcacheWriter.aw.payload.id.setAsReg() init(0)
      dcacheWriter.aw.payload.len.setAsReg() init(0)
      dcacheWriter.aw.payload.size.setAsReg() init(0)
      dcacheWriter.aw.payload.burst.setAsReg() init(0)
      dcacheWriter.aw.payload.addr.setAsReg() init(0)

      when(nextlevel_write || bypass_write){
        dcacheWriter.aw.valid := True
      }
      .elsewhen(dcacheWriter.aw.fire){
        dcacheWriter.aw.valid := False
      }
      dcacheWriter.aw.payload.id := U(2)
      dcacheWriter.aw.payload.len := bypass_write ? U(0, 8 bits) | dcache.next_level.cmd.payload.len.resized
      dcacheWriter.aw.payload.size := bypass_write ? dcache.cpu_bypass.cmd.size | dcache.next_level.cmd.payload.size
      dcacheWriter.aw.payload.burst := B(1) // INCR
      dcacheWriter.aw.payload.addr := bypass_write ? dcache.cpu_bypass.cmd.addr | dcache.next_level.cmd.payload.addr

      // w channel
      dcacheWriter.w.valid.setAsReg() init(False)
      dcacheWriter.w.payload.data.setAsReg() init(0)
      dcacheWriter.w.payload.strb.setAsReg() init(0)
      dcacheWriter.w.payload.last.setAsReg() init(False)

      when(dcache.next_level.cmd.valid && dcache.next_level.cmd.payload.wen){
        dcacheWriter.w.valid := True
      }
      .elsewhen(dcacheWriter.w.fire){
        dcacheWriter.w.valid := False
      }
      dcacheWriter.w.payload.data := bypass_write ? dcache.cpu_bypass.cmd.wdata | dcache.next_level.cmd.payload.wdata
      dcacheWriter.w.payload.strb := bypass_write ? dcache.cpu_bypass.cmd.wstrb | dcache.next_level.cmd.payload.wstrb
      dcacheWriter.w.payload.last := True

      // b channel
      dcacheWriter.b.ready := True

      // to dcache signal
      when(handshake_cnt===False){
        when(dcacheWriter.aw.fire && dcacheWriter.w.fire){
          handshake_cnt := False
        }.elsewhen(dcacheWriter.aw.fire || dcacheWriter.w.fire){
          handshake_cnt := True
        }
      }
      .elsewhen(handshake_cnt===True){
        when(dcacheWriter.aw.fire || dcacheWriter.w.fire){
          handshake_cnt := False
        }
      }
      val aw_and_w_fire = ((dcacheWriter.aw.fire && dcacheWriter.w.fire) || (handshake_cnt && (dcacheWriter.aw.fire || dcacheWriter.w.fire)))
      
      dcache.next_level.cmd.ready := dcache.next_level.cmd.wen ? aw_and_w_fire | dcacheReader.ar.ready
      dcache.next_level.rsp.valid := dcache.next_level.cmd.wen ? dcacheWriter.b.valid | dcacheReader.r.valid
      dcache.next_level.rsp.payload.bresp := dcacheWriter.b.payload.resp
      dcache.next_level.rsp.payload.data := dcacheReader.r.payload.data
      dcache.next_level.rsp.payload.rvalid := dcacheReader.r.valid && (dcacheReader.r.id===U(1))

      dcache.cpu_bypass.cmd.ready := dcache.cpu_bypass.cmd.wen ? aw_and_w_fire | dcacheReader.ar.ready
      dcache.cpu_bypass.rsp.valid := dcache.cpu_bypass.cmd.wen ? dcacheWriter.b.valid | dcacheReader.r.valid
      dcache.cpu_bypass.rsp.data  := dcacheReader.r.payload.data
    }

    // ======================= AXI noburst output =======================
    else if(!dcache_config.directOutput && noBurst){
      val dcache = new DCache(dcache_config)
      val srambanks   = new SramBanks(false, dcache_config.wayCount, dcache_config.bankNum, dcache_config.bankWidth, dcache_config.bankDepthBits)

      // impl dcache access logic
      dcache_access.cmd <> dcache.cpu.cmd
      dcache_access.rsp <> dcache.cpu.rsp
      dcache.flush := False // TODO:
      dcache_access.stall <> dcache.stall

      // sram ports
      val connect_sram = for(i<-0 until dcache_config.wayCount) yield new Area{
        dcache.sram(i).ports <> srambanks.sram(i).ports
      }

      // next level AXI ports
      val axiConfig = Axi4Config(addressWidth=dcache_config.addressWidth, dataWidth=dcache_config.busDataWidth, idWidth=4,
                                 useId=true, useLast=true, useRegion=false, useBurst=true, 
                                 useLock=false, useCache=false, useSize=true, useQos=false,
                                 useLen=true, useResp=true, useProt=false, useStrb=true)
      dcacheReader = master(Axi4ReadOnly(axiConfig)).setName("dcache")
      dcacheWriter = master(Axi4WriteOnly(axiConfig)).setName("dcache")
      val handshake_cnt = RegInit(False)
      val ar_len_cnt = Reg(UInt(4 bits)) init(0)
      val nextlevel_read = dcache.next_level.cmd.valid && !dcache.next_level.cmd.payload.wen
      val nextlevel_write= dcache.next_level.cmd.valid && dcache.next_level.cmd.payload.wen
      val bypass_read = dcache.cpu_bypass.cmd.valid && !dcache.cpu_bypass.cmd.wen
      val bypass_write = dcache.cpu_bypass.cmd.valid && dcache.cpu_bypass.cmd.wen
      val bypass_write_reg = RegInit(False)
      val bypass_reg = RegInit(False)
      when(bypass_write){
        bypass_write_reg := True
      }
      .elsewhen(dcache.cpu_bypass.rsp.valid){
        bypass_write_reg := False
      }
      when(bypass_read || bypass_write){
        bypass_reg := True
      }
      .elsewhen(dcache.cpu_bypass.rsp.valid){
        bypass_reg := False
      }
      
      // ar channel
      dcacheReader.ar.valid.setAsReg() init(False)
      dcacheReader.ar.payload.id.setAsReg() init(0)
      dcacheReader.ar.payload.len.setAsReg() init(0)
      dcacheReader.ar.payload.size.setAsReg() init(0)
      dcacheReader.ar.payload.burst.setAsReg() init(0)
      dcacheReader.ar.payload.addr.setAsReg() init(0)
      
      when(nextlevel_read || bypass_read){
        dcacheReader.ar.valid      := True
      }
      .elsewhen(dcacheReader.ar.fire){
        when(ar_len_cnt>U(0)){
          dcacheReader.ar.valid    := True
        }.otherwise{
          dcacheReader.ar.valid    := False
        }
      }

      when(nextlevel_read){
        ar_len_cnt               := dcache.next_level.cmd.len
      }.elsewhen(bypass_read){
        ar_len_cnt               := U(0)
      }.elsewhen(dcacheReader.ar.fire && ar_len_cnt>U(0)){
        ar_len_cnt               := ar_len_cnt - U(1)
      }

      dcacheReader.ar.payload.id   := U(1)
      dcacheReader.ar.payload.len  := U(0)
      dcacheReader.ar.payload.size := bypass_read ? dcache.cpu_bypass.cmd.size | dcache.next_level.cmd.payload.size
      dcacheReader.ar.payload.burst := B(1) // INCR
      // ar addr unburst
      when(nextlevel_read){
        dcacheReader.ar.payload.addr := dcache.next_level.cmd.payload.addr
      }.elsewhen(bypass_read){
        dcacheReader.ar.payload.addr := dcache.cpu_bypass.cmd.addr
      }.elsewhen(dcacheReader.ar.fire){
        dcacheReader.ar.payload.addr := dcacheReader.ar.payload.addr + U(dcache_config.busDataWidth/8)
      }

      // r channel
      dcacheReader.r.ready := True

      // aw channel      
      dcacheWriter.aw.valid.setAsReg() init(False)
      dcacheWriter.aw.payload.id.setAsReg() init(0)
      dcacheWriter.aw.payload.len.setAsReg() init(0)
      dcacheWriter.aw.payload.size.setAsReg() init(0)
      dcacheWriter.aw.payload.burst.setAsReg() init(0)
      dcacheWriter.aw.payload.addr.setAsReg() init(0)

      when(nextlevel_write || bypass_write){
        dcacheWriter.aw.valid := True
      }
      .elsewhen(dcacheWriter.aw.fire){
        dcacheWriter.aw.valid := False
      }
      dcacheWriter.aw.payload.id := U(2)
      dcacheWriter.aw.payload.len := bypass_write ? U(0, 8 bits) | dcache.next_level.cmd.payload.len.resized
      dcacheWriter.aw.payload.size := bypass_write ? dcache.cpu_bypass.cmd.size | dcache.next_level.cmd.payload.size
      dcacheWriter.aw.payload.burst := B(1) // INCR
      dcacheWriter.aw.payload.addr := bypass_write ? dcache.cpu_bypass.cmd.addr | dcache.next_level.cmd.payload.addr

      // w channel
      dcacheWriter.w.valid.setAsReg() init(False)
      dcacheWriter.w.payload.data.setAsReg() init(0)
      dcacheWriter.w.payload.strb.setAsReg() init(0)
      dcacheWriter.w.payload.last.setAsReg() init(False)

      when(nextlevel_write || bypass_write){
        dcacheWriter.w.valid := True
      }
      .elsewhen(dcacheWriter.w.fire){
        dcacheWriter.w.valid := False
      }
      dcacheWriter.w.payload.data := bypass_write ? dcache.cpu_bypass.cmd.wdata | dcache.next_level.cmd.payload.wdata
      dcacheWriter.w.payload.strb := bypass_write ? dcache.cpu_bypass.cmd.wstrb | dcache.next_level.cmd.payload.wstrb
      dcacheWriter.w.payload.last := True

      // b channel
      dcacheWriter.b.ready := True

      // to dcache signal
      when(handshake_cnt===False){
        when(dcacheWriter.aw.fire && dcacheWriter.w.fire){
          handshake_cnt := False
        }.elsewhen(dcacheWriter.aw.fire || dcacheWriter.w.fire){
          handshake_cnt := True
        }
      }
      .elsewhen(handshake_cnt===True){
        when(dcacheWriter.aw.fire || dcacheWriter.w.fire){
          handshake_cnt := False
        }
      }
      val aw_and_w_fire = ((dcacheWriter.aw.fire && dcacheWriter.w.fire) || (handshake_cnt && (dcacheWriter.aw.fire || dcacheWriter.w.fire)))
      
      dcache.next_level.cmd.ready := True
      dcache.next_level.rsp.valid := dcache.next_level.cmd.wen ? dcacheWriter.b.valid | (dcacheReader.r.valid && (dcacheReader.r.id===U(1)))
      dcache.next_level.rsp.payload.bresp := dcacheWriter.b.payload.resp
      dcache.next_level.rsp.payload.data := dcacheReader.r.payload.data
      dcache.next_level.rsp.payload.rvalid := dcacheReader.r.valid && (dcacheReader.r.id===U(1))

      // dcache.cpu_bypass.cmd.ready := dcache.cpu_bypass.cmd.wen ? aw_and_w_fire | dcacheReader.ar.ready
      dcache.cpu_bypass.cmd.ready := True
      dcache.cpu_bypass.rsp.valid := bypass_reg ? (bypass_write_reg ? dcacheWriter.b.valid | (dcacheReader.r.valid && (dcacheReader.r.id===U(1)))) | False
      dcache.cpu_bypass.rsp.data  := dcacheReader.r.payload.data
    }

    else { // direct output, no cache
      val dcacheMaster = master(DCacheAccess(dcache_config.addressWidth, dcache_config.cpuDataWidth)).setName("dcache")
      // connect dcache and cpu ports
      dcache_access.cmd <> dcacheMaster.cmd
      dcache_access.rsp <> dcacheMaster.rsp
      dcache_access.stall := False
    }

    
   }
  
}