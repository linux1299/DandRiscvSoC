package dandriscv

import spinal.core._

object Riscv{
  def funct7Range = 31 downto 25
  def rdRange = 11 downto 7
  def funct3Range = 14 downto 12
  def rs1Range = 19 downto 15
  def rs2Range = 24 downto 20
  def rs3Range = 31 downto 27
  def csrRange = 31 downto 20
  def opcodeRange = 6 downto 0

  def OP_IMM = B"0010011"
  def OP_IMM_WORD = B"0011011"
  def OP_ALU_WORD = B"0111011"
  def OP_LOAD = B"0000011"
  def OP_JALR = B"1100111"
  def OP_JAL = B"1101111"
  def OP_STORE = B"0100011"
  def OP_BRANCH = B"1100011"
  def OP_LUI = B"0110111"
  def OP_AUIPC = B"0010111"
  def OP_FENCE = B"0001111"

  case class IMM_ALL(instruction : Bits, XLEN : Int = 64) extends Area{
    // immediates
    def i = instruction(31 downto 20)
    def h = instruction(31 downto 24)
    def s = instruction(31 downto 25) ## instruction(11 downto 7)
    def b = instruction(31) ## instruction(7) ## instruction(30 downto 25) ## instruction(11 downto 8)
    def u = instruction(31 downto 12) ## U"x000"
    def j = instruction(31) ## instruction(19 downto 12) ## instruction(20) ## instruction(30 downto 21)
    def z = instruction(19 downto 15)

    def i_type_imm = instruction(opcodeRange)===OP_IMM || instruction(opcodeRange)===OP_IMM_WORD || instruction(opcodeRange)===OP_LOAD || instruction(opcodeRange)===OP_JALR
    def s_type_imm = instruction(opcodeRange)===OP_STORE
    def b_type_imm = instruction(opcodeRange)===OP_BRANCH
    def j_type_imm = instruction(opcodeRange)===OP_JAL
    def u_type_imm = instruction(opcodeRange)===OP_LUI || instruction(opcodeRange)===OP_AUIPC

    def i_sext = B((19+(XLEN-32) downto 0) -> i(11)) ## i
    def h_sext = B((23+(XLEN-32) downto 0) -> h(7))  ## h
    def s_sext = B((19+(XLEN-32) downto 0) -> s(11)) ## s
    def b_sext = B((18+(XLEN-32) downto 0) -> b(11)) ## b ## False
    def j_sext = B((10+(XLEN-32) downto 0) -> j(19)) ## j ## False
    def u_sext = if(XLEN==32) u else B(((31) downto 0) -> u(31)) ## u

  }

  def ADD                = M"0000000----------000-----0110011"
  def ADDW               = M"0000000----------000-----0111011"
  def SUB                = M"0100000----------000-----0110011"
  def SUBW               = M"0100000----------000-----0111011"
  def SLL                = M"0000000----------001-----0110011"
  def SLLW               = M"0000000----------001-----0111011"
  def SLT                = M"0000000----------010-----0110011"
  def SLTU               = M"0000000----------011-----0110011"
  def XOR                = M"0000000----------100-----0110011"
  def SRL                = M"0000000----------101-----0110011"
  def SRLW               = M"0000000----------101-----0111011"
  def SRA                = M"0100000----------101-----0110011"
  def SRAW               = M"0100000----------101-----0111011"
  def OR                 = M"0000000----------110-----0110011"
  def AND                = M"0000000----------111-----0110011"

  def ADDI               = M"-----------------000-----0010011"
  def ADDIW              = M"-----------------000-----0011011"
  // def SLLI               = M"0000000----------001-----0010011"
  // def SLLIW              = M"0000000----------001-----0011011"
  def SLLI               = M"000000-----------001-----0010011"
  def SLLIW              = M"000000-----------001-----0011011"
  def SLTI               = M"-----------------010-----0010011"
  def SLTIU              = M"-----------------011-----0010011"
  def XORI               = M"-----------------100-----0010011"
  // def SRLI               = M"0000000----------101-----0010011"
  // def SRLIW              = M"0000000----------101-----0011011"
  def SRLI               = M"000000-----------101-----0010011"
  def SRLIW              = M"000000-----------101-----0011011"
  // def SRAI               = M"0100000----------101-----0010011"
  // def SRAIW              = M"0100000----------101-----0011011"
  def SRAI               = M"010000-----------101-----0010011"
  def SRAIW              = M"010000-----------101-----0011011"
  def ORI                = M"-----------------110-----0010011"
  def ANDI               = M"-----------------111-----0010011"

  def LB                 = M"-----------------000-----0000011"
  def LH                 = M"-----------------001-----0000011"
  def LW                 = M"-----------------010-----0000011"
  def LWU                = M"-----------------110-----0000011"
  def LD                 = M"-----------------011-----0000011"
  def LBU                = M"-----------------100-----0000011"
  def LHU                = M"-----------------101-----0000011"
  def SB                 = M"-----------------000-----0100011"
  def SH                 = M"-----------------001-----0100011"
  def SW                 = M"-----------------010-----0100011"
  def SD                 = M"-----------------011-----0100011"

  def LR                 = M"00010--00000-----010-----0101111"
  def SC                 = M"00011------------010-----0101111"

  def AMOSWAP            = M"00001------------010-----0101111"
  def AMOADD             = M"00000------------010-----0101111"
  def AMOXOR             = M"00100------------010-----0101111"
  def AMOAND             = M"01100------------010-----0101111"
  def AMOOR              = M"01000------------010-----0101111"
  def AMOMIN             = M"10000------------010-----0101111"
  def AMOMAX             = M"10100------------010-----0101111"
  def AMOMINU            = M"11000------------010-----0101111"
  def AMOMAXU            = M"11100------------010-----0101111"

  def BEQ (rvc : Boolean) = if(rvc) M"-----------------000-----1100011" else M"-----------------000---0-1100011"
  def BNE (rvc : Boolean) = if(rvc) M"-----------------001-----1100011" else M"-----------------001---0-1100011"
  def BLT (rvc : Boolean) = if(rvc) M"-----------------100-----1100011" else M"-----------------100---0-1100011"
  def BGE (rvc : Boolean) = if(rvc) M"-----------------101-----1100011" else M"-----------------101---0-1100011"
  def BLTU(rvc : Boolean) = if(rvc) M"-----------------110-----1100011" else M"-----------------110---0-1100011"
  def BGEU(rvc : Boolean) = if(rvc) M"-----------------111-----1100011" else M"-----------------111---0-1100011"
  def JALR               = M"-----------------000-----1100111"
  def JAL(rvc : Boolean) = if(rvc) M"-------------------------1101111" else M"----------0--------------1101111"
  def LUI                = M"-------------------------0110111"
  def AUIPC              = M"-------------------------0010111"

  def MULX               = M"0000001----------0-------0110011"
  def DIVX               = M"0000001----------1-------0110011"

  def MUL                = M"0000001----------000-----0110011"
  def MULH               = M"0000001----------001-----0110011"
  def MULHSU             = M"0000001----------010-----0110011"
  def MULHU              = M"0000001----------011-----0110011"
  def MULW               = M"0000001----------000-----0111011"


  def DIV                = M"0000001----------100-----0110011"
  def DIVU               = M"0000001----------101-----0110011"
  def DIVW               = M"0000001----------100-----0111011"
  def DIVUW              = M"0000001----------101-----0111011"
  def REM                = M"0000001----------110-----0110011"
  def REMW               = M"0000001----------110-----0111011"
  def REMU               = M"0000001----------111-----0110011"
  def REMUW              = M"0000001----------111-----0111011"

  //乘法单元：
  // INSTPAT("0000001 ????? ????? 000 ????? 01100 11", mul    , R, R(dest) = src1 * src2);
  // INSTPAT("0000001 ????? ????? 001 ????? 01100 11", mulh   , R, temp = (sword_t)src1*(sword_t)src2, R(dest) = temp >> 64);
  // INSTPAT("0000001 ????? ????? 010 ????? 01100 11", mulhsu , R, temp = (sword_t)src1*(word_t )src2, R(dest) = temp >> 64);
  // INSTPAT("0000001 ????? ????? 011 ????? 01100 11", mulhu  , R, temp = (word_t )src1*(word_t )src2, R(dest) = temp >> 64);
  // INSTPAT("0000001 ????? ????? 100 ????? 01100 11", div    , R, R(dest) = (sword_t)src1 / (sword_t)src2);
  // INSTPAT("0000001 ????? ????? 101 ????? 01100 11", divu   , R, R(dest) = (word_t )src1 / (word_t )src2);
  // INSTPAT("0000001 ????? ????? 110 ????? 01100 11", rem    , R, R(dest) = (sword_t)src1 % (sword_t)src2);
  // INSTPAT("0000001 ????? ????? 111 ????? 01100 11", remu   , R, R(dest) = (word_t )src1 % (word_t )src2);
  // INSTPAT("0000001 ????? ????? 000 ????? 01110 11", mulw   , R, R(dest) = SEXT(BITS((int32_t)src1*(int32_t)src2,31,0),32));
  // INSTPAT("0000001 ????? ????? 100 ????? 01110 11", divw   , R, R(dest) = SEXT((int32_t )src1 / (int32_t )src2,32));
  // INSTPAT("0000001 ????? ????? 101 ????? 01110 11", divuw  , R, R(dest) = SEXT((uint32_t)src1 / (uint32_t)src2,32));
  // INSTPAT("0000001 ????? ????? 110 ????? 01110 11", remw   , R, R(dest) = SEXT((int32_t )src1 % (int32_t )src2,32));
  // INSTPAT("0000001 ????? ????? 111 ????? 01110 11", remuw  , R, R(dest) = SEXT((uint32_t)src1 % (uint32_t)src2,32));

  def CSRRW              = M"-----------------001-----1110011"
  def CSRRS              = M"-----------------010-----1110011"
  def CSRRC              = M"-----------------011-----1110011"
  def CSRRWI             = M"-----------------101-----1110011"
  def CSRRSI             = M"-----------------110-----1110011"
  def CSRRCI             = M"-----------------111-----1110011"

  def ECALL              = M"00000000000000000000000001110011"
  def EBREAK             = M"00000000000100000000000001110011"
  def FENCEI             = M"00000000000000000001000000001111"
  def MRET               = M"00110000001000000000000001110011"
  def SRET               = M"00010000001000000000000001110011"
  def WFI                = M"00010000010100000000000001110011"

  def FENCE              = M"-----------------000-----0001111"
  def FENCE_I            = M"-----------------001-----0001111"
  def SFENCE_VMA         = M"0001001----------000000001110011"

  def FMV_W_X            = M"111100000000-----000-----1010011"
  def FADD_S             = M"0000000------------------1010011"
  def FSUB_S             = M"0000100------------------1010011"
  def FMUL_S             = M"0001000------------------1010011"
  def FDIV_S             = M"0001100------------------1010011"
  def FSGNJ_S            = M"0010000----------000-----1010011"
  def FSGNJN_S           = M"0010000----------001-----1010011"
  def FSGNJX_S           = M"0010000----------010-----1010011"
  def FMIN_S             = M"0010100----------000-----1010011"
  def FMAX_S             = M"0010100----------001-----1010011"
  def FSQRT_S            = M"010110000000-------------1010011"
  def FCVT_S_W           = M"110100000000-------------1010011"
  def FCVT_S_WU          = M"110100000001-------------1010011"
  def FCVT_S_L           = M"110100000010-------------1010011"
  def FCVT_S_LU          = M"110100000011-------------1010011"
  def FCVT_W_S           = M"110000000000-------------1010011"
  def FCVT_WU_S          = M"110000000001-------------1010011"
  def FCVT_L_S           = M"110000000010-------------1010011"
  def FCVT_LU_S          = M"110000000011-------------1010011"
  def FCLASS_S           = M"111000000000-----001-----1010011"
  def FMADD_S            = M"-----00------------------1000011"
  def FMSUB_S            = M"-----00------------------1000111"
  def FNMSUB_S           = M"-----00------------------1001011"
  def FNMADD_S           = M"-----00------------------1001111"

  def FLE_S              = M"1010000----------000-----1010011"
  def FLT_S              = M"1010000----------001-----1010011"
  def FEQ_S              = M"1010000----------010-----1010011"
  def FADD_D             = M"0000001------------------1010011"
  def FSUB_D             = M"0000101------------------1010011"
  def FMUL_D             = M"0001001------------------1010011"
  def FDIV_D             = M"0001101------------------1010011"
  def FSGNJ_D            = M"0010001----------000-----1010011"
  def FSGNJN_D           = M"0010001----------001-----1010011"
  def FSGNJX_D           = M"0010001----------010-----1010011"
  def FMIN_D             = M"0010101----------000-----1010011"
  def FMAX_D             = M"0010101----------001-----1010011"
  def FSQRT_D            = M"010110100000-------------1010011"
  def FMV_X_W            = M"111000000000-----000-----1010011"
  def FCVT_W_D           = M"110000100000-------------1010011"
  def FCVT_WU_D          = M"110000100001-------------1010011"
  def FCVT_L_D           = M"110000100010-------------1010011"
  def FCVT_LU_D          = M"110000100011-------------1010011"
  def FMV_X_D            = M"111000100000-----000-----1010011"
  def FCLASS_D           = M"111000100000-----001-----1010011"
  def FCVT_D_W           = M"110100100000-------------1010011"
  def FCVT_D_WU          = M"110100100001-------------1010011"
  def FCVT_D_L           = M"110100100010-------------1010011"
  def FCVT_D_LU          = M"110100100011-------------1010011"
  def FMV_D_X            = M"111100100000-----000-----1010011"
  def FMADD_D            = M"-----01------------------1000011"
  def FMSUB_D            = M"-----01------------------1000111"
  def FNMSUB_D           = M"-----01------------------1001011"
  def FNMADD_D           = M"-----01------------------1001111"
  def FLE_D              = M"1010001----------000-----1010011"
  def FLT_D              = M"1010001----------001-----1010011"
  def FEQ_D              = M"1010001----------010-----1010011"

  def FCVT_S_D           = M"010000000001-------------1010011"
  def FCVT_D_S           = M"010000100000-------------1010011"

  def FLW                = M"-----------------010-----0000111"
  def FLD                = M"-----------------011-----0000111"
  def FSW                = M"-----------------010-----0100111"
  def FSD                = M"-----------------011-----0100111"



  object CSR{
    def MTIME     = 0x200bff8
    def MTIMECMP  = 0x2004000
    
    def MVENDORID = 0xF11 // MRO Vendor ID.
    def MARCHID   = 0xF12 // MRO Architecture ID.
    def MIMPID    = 0xF13 // MRO Implementation ID.
    def MHARTID   = 0xF14 // MRO Hardware thread ID.Machine Trap Setup
    def MSTATUS   = 0x300 // MRW Machine status register.
    def MISA      = 0x301 // MRW ISA and extensions
    def MEDELEG   = 0x302 // MRW Machine exception delegation register.
    def MIDELEG   = 0x303 // MRW Machine interrupt delegation register.
    def MIE       = 0x304 // MRW Machine interrupt-enable register.
    def MTVEC     = 0x305 // MRW Machine trap-handler base address. Machine Trap Handling
    def MSCRATCH  = 0x340 // MRW Scratch register for machine trap handlers.
    def MEPC      = 0x341 // MRW Machine exception program counter.
    def MCAUSE    = 0x342 // MRW Machine trap cause.
    def MBADADDR  = 0x343 // MRW Machine bad address.(MTVAL)
    def MIP       = 0x344 // MRW Machine interrupt pending.
    def MBASE     = 0x380 // MRW Base register.
    def MBOUND    = 0x381 // MRW Bound register.
    def MIBASE    = 0x382 // MRW Instruction base register.
    def MIBOUND   = 0x383 // MRW Instruction bound register.
    def MDBASE    = 0x384 // MRW Data base register.
    def MDBOUND   = 0x385 // MRW Data bound register.
    def MCYCLE    = 0xB00 // MRW Machine cycle counter.
    def MINSTRET  = 0xB02 // MRW Machine instructions-retired counter.
    def MCYCLEH   = 0xB80 // MRW Upper 32 bits of mcycle, RV32I only.
    def MINSTRETH = 0xB82 // MRW Upper 32 bits of minstret, RV32I only.
    val MCOUNTEREN  = 0x306

    val SSTATUS     = 0x100
    val SIE         = 0x104
    val STVEC       = 0x105
    val SCOUNTEREN  = 0x106
    val SSCRATCH    = 0x140
    val SEPC        = 0x141
    val SCAUSE      = 0x142
    val SBADADDR    = 0x143
    val SIP         = 0x144
    val SATP        = 0x180

    def UCYCLE   = 0xC00 // UR Machine ucycle counter.
    def UCYCLEH  = 0xC80
    def UTIME    = 0xC01 // rdtime
    def UTIMEH   = 0xC81
    def UINSTRET  = 0xC02 // UR Machine instructions-retired counter.
    def UINSTRETH = 0xC82 // UR Upper 32 bits of minstret, RV32I only.

    val FFLAGS = 0x1
    val FRM = 0x2
    val FCSR = 0x3

    val DCSR      = 0x7B0
    val DPC       = 0x7B1
    val TSELECT   = 0x7A0
    val TDATA1    = 0x7A1
    val TDATA2    = 0x7A2
    val TINFO     = 0x7a4
    val TCONTROL  = 0x7A5
  }
}