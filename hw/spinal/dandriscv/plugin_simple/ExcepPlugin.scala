package dandriscv.plugin_simple

import spinal.core._
import spinal.lib._

import dandriscv._
import dandriscv.ip._
import dandriscv.plugin._
import dandriscv.Riscv._

// ====================== csr reg file ports ====================
case class CsrCpuPorts(MXLEN : Int = 64) extends Bundle with IMasterSlave{
  val waddr = UInt(12 bits)
  val wen   = Bool()
  val wdata = Bits(MXLEN bits)
  val raddr = UInt(12 bits)
  val rdata = Bits(MXLEN bits)

  override def asMaster(): Unit = {
    in(rdata)
    out(waddr, wen, wdata, raddr)
  }
}
case class CsrClintPorts(MXLEN : Int = 64) extends Bundle with IMasterSlave{
  val mepc_wen = Bool()
  val mepc_wdata = Bits(MXLEN bits)
  val mcause_wen = Bool()
  val mcause_wdata = Bits(MXLEN bits)
  val mstatus_wen = Bool()
  val mstatus_wdata = Bits(MXLEN bits)
  val mtvec = Bits(MXLEN bits)
  val mepc  = Bits(MXLEN bits)
  val mstatus = Bits(MXLEN bits)
  val global_int_en = Bool()
  val mtime_int_en = Bool()
  val mtime_int_pend = Bool()

  override def asMaster(): Unit = {
    out(mtvec, mepc, mstatus, global_int_en, mtime_int_en, mtime_int_pend)
    in(mepc_wen, mepc_wdata, mcause_wen, mcause_wdata, mstatus_wen, mstatus_wdata)
  }
}

// ========================= csr register file moudle =========================
case class CsrRegfile(MXLEN : Int = 64) extends Component{
  val cpu_ports = slave(CsrCpuPorts(MXLEN))
  val clint_ports= slave(CsrClintPorts(MXLEN))
  val timer_int = in Bool()

  mstatus = Reg(Bits(MXLEN bits)) init(B"51'b0" ## B"13'b11000_1000_0000")
  mie     = Reg(Bits(MXLEN bits)) init(0)
  mtvec   = Reg(Bits(MXLEN bits)) init(0)
  mepc    = Reg(Bits(MXLEN bits)) init(0)
  mcause  = Reg(Bits(MXLEN bits)) init(0)
  mtval   = Reg(Bits(MXLEN bits)) init(0)
  mip     = Reg(Bits(MXLEN bits)) init(0)
  mcycle  = Reg(Bits(MXLEN bits)) init(0)
  mhartid = Reg(Bits(MXLEN bits)) init(0)
  mscratch= Reg(Bits(MXLEN bits)) init(0)

  mcycle := mcycle + 1
  mip    := B"52'b0" ## B"1'b0" ## B"3'b0" ## timer_int ## B"7'b0"

  when(cpu_ports.wen){
    switch(cpu_ports.waddr){
      is(MSTATUS){
        mstatus := (cpu_ports.wdata(16 downto 15)===B"2'b11" || cpu_ports.wdata(14 downto 13)===B"2'b11") ## B"50'b0" ## B"2'b11" ## B"3'b0" ## cpu_ports.wdata(7) ## B"3'b0" ## cpu_ports.wdata(3) ## B"3'b0"
                    //                                       SD                                                           MPP                       MPIE                                MIE
      }is(MIE){
        mie     := B"52'b0" ## cpu_ports.wdata(11) ## B"3'b0" ## cpu_ports.wdata(7) ## B"3'b0" ## cpu_ports.wdata(3) ## B"3'b0"
      }is(MTVEC){
        mtvec   := cpu_ports.wdata
      }is(MEPC){
        mepc    := cpu_ports.wdata
      }is(MCAUSE){
        mcause  := cpu_ports.wdata
      }is(MTVAL){
        mtval   := cpu_ports.wdata
      }is(MHARTID){
        mhartid := cpu_ports.wdata
      }is(MSCRATCH){
        mscratch:= cpu_ports.wdata
      }
    }
  }.otherwise{
    when(clint_ports.mepc_wen){
      mepc := clint_ports.mepc_wdata
    }
    when(clint_ports.mcause_wen){
      mcause := clint_ports.mcause_wdata
    }
    when(clint_ports.mstatus_wen){
      mstatus := clint_ports.mstatus_wdata
    }
    mtvec := clint_ports.(MXLEN-1 downto 2) ## B"2'b0"
  }

  // cpu read csr
  when(cpu_ports.wen && cpu_ports.raddr===cpu_ports.waddr){
    cpu_ports.rdata := cpu_ports.wdata
  }.otherwise{
    switch(cpu_ports.raddr){
      is(MSTATUS){
        cpu_ports.rdata := mstatus
      }is(MIE){
        cpu_ports.rdata := mie
      }is(MTVEC){
        cpu_ports.rdata := mtvec
      }is(MEPC){
        cpu_ports.rdata := mepc
      }is(MCAUSE){
        cpu_ports.rdata := mcause
      }is(MTVAL){
        cpu_ports.rdata := mtval
      }is(MIP){
        cpu_ports.rdata := mip
      }is(MCYCLE){
        cpu_ports.rdata := mcycle
      }is(MHARTID){
        cpu_ports.rdata := mhartid
      }default{
        cpu_ports.rdata := 0
      }
    }
  }

  // clint ports
  clint_ports.mtvec := mtvec
  clint_ports.mepc  := mepc
  clint_ports.mstatus := mstatus
  clint_ports.global_int_en := mstatus(3)
  clint_ports.mtime_int_en := mie(7)
  clint_ports.mtime_int_pend := mip(7)
}

// =========================clint moudle =========================
case class Clint(MXLEN : Int = 64, addressWidth : Int = 64) extends Component{
  val pc = in UInt(addressWidth bits)
  val pc_next = in UInt(addressWidth bits)
  val pc_next_valid = in Bool()
  val csr_ports= master(CsrClintPorts(MXLEN))
  val timer_int= in Bool()
  val int_en = out Bool()
  val int_pc = out UInt(addressWidth bits)
  val int_hold = out Bool()
  val ecall = in Bool()
  val ebreak = in Bool()
  val mret = in Bool()

  object IntTypeEnum extends SpinalEnum(binarySequential){
    val IDLE, EXPT, TIME, MRET= newElement()
  }
  object CsrEnum extends SpinalEnum(binarySequential){
    val IDLE, EXPT_TIME, MRET, WRITE= newElement()
  }

  val int_state = Bits(IntTypeEnum.asBits.getWidth bits)
  val csr_state = Reg(Bits(CsrEnum.asBits.getWidth bits)) init(CsrEnum.IDLE.asBits)
  val mepc_wen = Reg(Bool()) init(False)
  val mepc_wdata = Reg(Bits(MXLEN bits)) init(0)
  val mcause_wen = Reg(Bool()) init(0)
  val mcause_wdata = Reg(Bits(MXLEN bits)) init(0)
  val mstatus_wen = Reg(Bool()) init(0)
  val mstatus_wdata = Reg(Bits(MXLEN bits)) init(0)

  // interrupt type
  when(ecall || ebreak){
    int_state := IntTypeEnum.EXPT.asBits
  }.elsewhen(csr_ports.global_int_en && csr_ports.mtime_int_en && timer_int){
    int_state := IntTypeEnum.TIME.asBits
  }.elsewhen(mret){
    int_state := IntTypeEnum.MRET.asBits
  }.otherwise{
    int_state := IntTypeEnum.IDLE.asBits
  }
  // csr state
  switch(csr_state){
    is(CsrEnum.IDLE.asBits){
      when(int_state===IntTypeEnum.EXPT.asBits || int_state===IntTypeEnum.TIME.asBits){
        csr_state := CsrEnum.EXPT_TIME.asBits
      }.elsewhen(int_state===IntTypeEnum.MRET.asBits){
        csr_state := CsrEnum.MRET.asBits
      }
    }
    is(CsrEnum.EXPT_TIME.asBits){
      csr_state := CsrEnum.WRITE.asBits
    }
    is(CsrEnum.MRET.asBits, CsrEnum.WRITE.asBits){
      csr_state := CsrEnum.IDLE.asBits
    }
  }
  // mepc wdata
  when(csr_state===CsrEnum.IDLE.asBits){
    when(pc_next_valid){
      mepc_wdata := pc_next
    }.otherwise{
      mepc_wdata := pc
    }
  }
  // mcause wdata
  when(csr_state===CsrEnum.IDLE.asBits){
    when(int_state===IntTypeEnum.EXPT.asBits){
      when(ecall){
        mcause_wdata := B(11, MXLEN bits)
      }.elsewhen(ebreak){
        mcause_wdata := B(3, MXLEN bits)
      }.otherwise{
        mcause_wdata := B(10, MXLEN bits)
      }
    }.elsewhen(int_state===IntTypeEnum.TIME.asBits){
      mcause_wdata := B"64'h8000_0000_0000_0007"
    }
  }
  // write to csr
  switch(csr_state){
    is(CsrEnum.WRITE.asBits){
      mepc_wen := True
      mcause_wen := True
      mstatus_wdata := True
      
    }
  }
}

// ==================== Exception handle ======================
class ExcepPlugin() extends Plugin[DandRiscvSimple]
{

  override def setup(pipeline: DandRiscvSimple): Unit = {
    import Riscv._
    import pipeline.config._
  }

  override def build(pipeline: DandRiscvSimple): Unit = {
    import Riscv._
    import pipeline._
    import pipeline.config._  

    val csr_regfile = new CsrRegfile(MXLEN)

    decode plug new Area{
      import decode._

    }
  }
}