package dandriscv.super_scalar

import spinal.core._
import spinal.lib._
import math._

// ================ ICache ==================
case class ICacheConfig(cacheSize : Int,
                        bytePerLine : Int,
                        wayCount : Int,
                        addressWidth : Int,
                        cpuDataWidth : Int,
                        bankWidth : Int,
                        busDataWidth : Int){

  def lineCount = cacheSize/bytePerLine
  def wayLineCount = lineCount/wayCount
  def busBurstLen = bytePerLine*8/busDataWidth
  def busDataSize = log2Up(busDataWidth/8)
  def bankNum = bytePerLine/(bankWidth/8)
  def bankDepth = cacheSize*8/wayCount/bankNum/bankWidth
  def bankDepthBits = log2Up(bankDepth)
  def offsetWidth = log2Up(bytePerLine)
  def setWidth = log2Up(wayLineCount)
  def tagWidth = addressWidth-setWidth-offsetWidth
  def cpuDataBytesWidth = log2Up(cpuDataWidth/8)
  def lineBusDataNum = bytePerLine/(busDataWidth/8) 
  def bankWriteBits = bankNum/lineBusDataNum
  // range
  def offsetRange = (offsetWidth-1) downto 0
  def setRange = (offsetWidth+setWidth-1) downto offsetWidth
  def tagRange = (addressWidth-1) downto (offsetWidth+setWidth)
  def bankAddrRange  = (bankDepthBits+offsetWidth-1) downto offsetWidth
  def bankIndexRange = (offsetWidth-1) downto cpuDataBytesWidth
  def nextLevelBankAddrRange = bankAddrRange
  def cpuDataOnBusRange = (busDataSize-1) downto cpuDataBytesWidth

  assert(wayCount>=2)
  assert(bankWidth==cpuDataWidth)
  assert(busDataWidth/bankWidth>=2 && busDataWidth%bankWidth==0)
  assert(bytePerLine*8/busDataWidth>=2 && (bytePerLine*8)%busDataWidth==0)
  
}

// ================ IQ ==================
case class IssueQueueConfig(
  DEPTH : Int,
  ROB_AW : Int,
  IQ_Type: String
){
  def PTR_WIDTH = log2Up(DEPTH)+1
}

object AluMicroOp extends SpinalEnum(binarySequential){
  val IDLE, ADD, SUB, SLT, SLTU, XOR, SLL, SRL, SRA, AND, OR, LUI, 
      MUL, MULH, MULHSU, MULHU, DIV, DIVU, REM, REMU, MULW, DIVW, DIVUW, REMW, REMUW = newElement()
}

object BjuMicroOp extends SpinalEnum(binarySequential){
  val IDLE, AUIPC, JAL, JALR, BEQ, BNE, BLT, BGE, BLTU, BGEU, CSR = newElement()
}

object LsuMicroOp extends SpinalEnum(binarySequential){
  val IDLE, LB, LBU, LH, LHU, LW, LWU, LD, SB, SH, SW, SD = newElement()
}

object ExpMicroOp extends SpinalEnum(binarySequential){
  val IDLE, ECALL, EBREAK, MRET, CSRRW, CSRRS, CSRRC, CSRRWI, CSRRSI, CSRRCI = newElement()
}

// ============== ROB ===============
object ROBStateEnum extends SpinalEnum(binarySequential){
  val IDLE, ISSUE, EXECUTE, COMPLETE, COMMIT = newElement()
}

object ExceptionEnum extends SpinalEnum(binarySequential){
  val IDLE, ECALL, EBREAK, MRET, TIME = newElement()
}

object RobMicroOp extends SpinalEnum(binarySequential){
  val IDLE, ALU, BLU, LSU = newElement()
}

case class ReorderBufferConfig(
  DEPTH : Int,
  PC_WIDTH : Int
){
  def PTR_WIDTH = log2Up(DEPTH)+1
}

// ================ Cpu ===============
object CpuConfig{

  def IQ_NUM = 4
  def XLEN = 64

}

object GenConfig {
  def spinal = SpinalConfig(
    targetDirectory = "hw/gen",
    defaultConfigForClockDomains = ClockDomainConfig(
      resetActiveLevel = LOW
    ),
    onlyStdLogicVectorAtTopLevelIo = true,
    nameWhenByFile = false,
    genLineComments = true,
    anonymSignalPrefix = "tmp"
  )
}