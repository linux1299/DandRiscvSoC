// Generator : SpinalHDL v1.8.1    git head : 2a7592004363e5b40ec43e1f122ed8641cd8965b
// Component : Bju
// Git hash  : 18119d788dc0be80a01b6f7e3353d83903c3293f

`timescale 1ns/1ps

module Bju (
  input               in_valid,
  input               bju_micro_op_rd_wen,
  input               bju_micro_op_src2_is_imm,
  input      [3:0]    bju_micro_op_bju_ctrl_op,
  input      [3:0]    bju_micro_op_exp_ctrl_op,
  input               bju_micro_op_bju_rd_eq_rs1,
  input               bju_micro_op_bju_rd_is_link,
  input               bju_micro_op_bju_rs1_is_link,
  input      [31:0]   pc,
  input      [63:0]   imm,
  input      [63:0]   rs1_val,
  input      [63:0]   rs2_val,
  output     [63:0]   rd_val,
  input               bpu_pred_taken,
  input      [31:0]   bpu_pred_pc_next,
  output reg          redirect_valid,
  output reg [31:0]   redirect_pc_next,
  input               clk,
  input               resetn
);
  localparam BjuCtrlEnum_IDLE = 4'd0;
  localparam BjuCtrlEnum_AUIPC = 4'd1;
  localparam BjuCtrlEnum_JAL = 4'd2;
  localparam BjuCtrlEnum_JALR = 4'd3;
  localparam BjuCtrlEnum_BEQ = 4'd4;
  localparam BjuCtrlEnum_BNE = 4'd5;
  localparam BjuCtrlEnum_BLT = 4'd6;
  localparam BjuCtrlEnum_BGE = 4'd7;
  localparam BjuCtrlEnum_BLTU = 4'd8;
  localparam BjuCtrlEnum_BGEU = 4'd9;
  localparam BjuCtrlEnum_CSR = 4'd10;
  localparam ExpCtrlEnum_IDLE = 4'd0;
  localparam ExpCtrlEnum_ECALL = 4'd1;
  localparam ExpCtrlEnum_EBREAK = 4'd2;
  localparam ExpCtrlEnum_MRET = 4'd3;
  localparam ExpCtrlEnum_CSRRW = 4'd4;
  localparam ExpCtrlEnum_CSRRS = 4'd5;
  localparam ExpCtrlEnum_CSRRC = 4'd6;
  localparam ExpCtrlEnum_CSRRWI = 4'd7;
  localparam ExpCtrlEnum_CSRRSI = 4'd8;
  localparam ExpCtrlEnum_CSRRCI = 4'd9;

  wire       [63:0]   tmp_blt_result;
  wire       [63:0]   tmp_blt_result_1;
  wire       [63:0]   tmp_bge_result;
  wire       [63:0]   tmp_bge_result_1;
  wire       [63:0]   tmp_pc_next;
  wire       [63:0]   tmp_pc_next_1;
  wire       [63:0]   tmp_pc_next_2;
  wire       [63:0]   tmp_pc_next_3;
  wire       [63:0]   tmp_pc_next_4;
  wire       [63:0]   tmp_pc_next_5;
  wire       [63:0]   tmp_pc_next_6;
  wire       [63:0]   tmp_pc_next_7;
  wire       [63:0]   tmp_pc_next_8;
  wire       [63:0]   tmp_pc_next_9;
  wire       [31:0]   tmp_pc_next_10;
  wire       [63:0]   tmp_pc_next_11;
  wire                tmp_when;
  wire       [63:0]   tmp_rd_val;
  wire       [63:0]   tmp_rd_val_1;
  reg        [31:0]   pc_next;
  wire                auipc;
  wire                jal;
  wire                jalr;
  wire                beq;
  wire                bne;
  wire                blt;
  wire                bge;
  wire                bltu;
  wire                bgeu;
  wire                branch_or_jalr;
  wire                branch_or_jump;
  reg                 is_call;
  reg                 is_ret;
  reg                 is_jmp;
  wire                beq_result;
  wire                bne_result;
  wire                blt_result;
  wire                bge_result;
  wire                bltu_result;
  wire                bgeu_result;
  wire                branch_taken;
  reg        [4:0]    branch_history;
  wire       [63:0]   src2;
  `ifndef SYNTHESIS
  reg [39:0] bju_micro_op_bju_ctrl_op_string;
  reg [47:0] bju_micro_op_exp_ctrl_op_string;
  `endif


  assign tmp_when = ((! bpu_pred_taken) || (bpu_pred_pc_next != pc_next));
  assign tmp_blt_result = rs1_val;
  assign tmp_blt_result_1 = rs2_val;
  assign tmp_bge_result = rs2_val;
  assign tmp_bge_result_1 = rs1_val;
  assign tmp_pc_next = tmp_pc_next_1;
  assign tmp_pc_next_1 = (tmp_pc_next_2 & tmp_pc_next_5);
  assign tmp_pc_next_2 = ($signed(tmp_pc_next_3) + $signed(tmp_pc_next_4));
  assign tmp_pc_next_3 = rs1_val;
  assign tmp_pc_next_4 = imm;
  assign tmp_pc_next_5 = (~ tmp_pc_next_6);
  assign tmp_pc_next_6 = 64'h0000000000000001;
  assign tmp_pc_next_7 = tmp_pc_next_8;
  assign tmp_pc_next_8 = ($signed(tmp_pc_next_9) + $signed(tmp_pc_next_11));
  assign tmp_pc_next_10 = pc;
  assign tmp_pc_next_9 = {{32{tmp_pc_next_10[31]}}, tmp_pc_next_10};
  assign tmp_pc_next_11 = imm;
  assign tmp_rd_val = (tmp_rd_val_1 + src2);
  assign tmp_rd_val_1 = {32'd0, pc};
  `ifndef SYNTHESIS
  always @(*) begin
    case(bju_micro_op_bju_ctrl_op)
      BjuCtrlEnum_IDLE : bju_micro_op_bju_ctrl_op_string = "IDLE ";
      BjuCtrlEnum_AUIPC : bju_micro_op_bju_ctrl_op_string = "AUIPC";
      BjuCtrlEnum_JAL : bju_micro_op_bju_ctrl_op_string = "JAL  ";
      BjuCtrlEnum_JALR : bju_micro_op_bju_ctrl_op_string = "JALR ";
      BjuCtrlEnum_BEQ : bju_micro_op_bju_ctrl_op_string = "BEQ  ";
      BjuCtrlEnum_BNE : bju_micro_op_bju_ctrl_op_string = "BNE  ";
      BjuCtrlEnum_BLT : bju_micro_op_bju_ctrl_op_string = "BLT  ";
      BjuCtrlEnum_BGE : bju_micro_op_bju_ctrl_op_string = "BGE  ";
      BjuCtrlEnum_BLTU : bju_micro_op_bju_ctrl_op_string = "BLTU ";
      BjuCtrlEnum_BGEU : bju_micro_op_bju_ctrl_op_string = "BGEU ";
      BjuCtrlEnum_CSR : bju_micro_op_bju_ctrl_op_string = "CSR  ";
      default : bju_micro_op_bju_ctrl_op_string = "?????";
    endcase
  end
  always @(*) begin
    case(bju_micro_op_exp_ctrl_op)
      ExpCtrlEnum_IDLE : bju_micro_op_exp_ctrl_op_string = "IDLE  ";
      ExpCtrlEnum_ECALL : bju_micro_op_exp_ctrl_op_string = "ECALL ";
      ExpCtrlEnum_EBREAK : bju_micro_op_exp_ctrl_op_string = "EBREAK";
      ExpCtrlEnum_MRET : bju_micro_op_exp_ctrl_op_string = "MRET  ";
      ExpCtrlEnum_CSRRW : bju_micro_op_exp_ctrl_op_string = "CSRRW ";
      ExpCtrlEnum_CSRRS : bju_micro_op_exp_ctrl_op_string = "CSRRS ";
      ExpCtrlEnum_CSRRC : bju_micro_op_exp_ctrl_op_string = "CSRRC ";
      ExpCtrlEnum_CSRRWI : bju_micro_op_exp_ctrl_op_string = "CSRRWI";
      ExpCtrlEnum_CSRRSI : bju_micro_op_exp_ctrl_op_string = "CSRRSI";
      ExpCtrlEnum_CSRRCI : bju_micro_op_exp_ctrl_op_string = "CSRRCI";
      default : bju_micro_op_exp_ctrl_op_string = "??????";
    endcase
  end
  `endif

  assign auipc = (bju_micro_op_bju_ctrl_op == BjuCtrlEnum_AUIPC); // @ BaseType.scala l305
  assign jal = (bju_micro_op_bju_ctrl_op == BjuCtrlEnum_JAL); // @ BaseType.scala l305
  assign jalr = (bju_micro_op_bju_ctrl_op == BjuCtrlEnum_JALR); // @ BaseType.scala l305
  assign beq = (bju_micro_op_bju_ctrl_op == BjuCtrlEnum_BEQ); // @ BaseType.scala l305
  assign bne = (bju_micro_op_bju_ctrl_op == BjuCtrlEnum_BNE); // @ BaseType.scala l305
  assign blt = (bju_micro_op_bju_ctrl_op == BjuCtrlEnum_BLT); // @ BaseType.scala l305
  assign bge = (bju_micro_op_bju_ctrl_op == BjuCtrlEnum_BGE); // @ BaseType.scala l305
  assign bltu = (bju_micro_op_bju_ctrl_op == BjuCtrlEnum_BLTU); // @ BaseType.scala l305
  assign bgeu = (bju_micro_op_bju_ctrl_op == BjuCtrlEnum_BGEU); // @ BaseType.scala l305
  assign branch_or_jalr = ((((((jalr || beq) || bne) || blt) || bge) || bltu) || bgeu); // @ BaseType.scala l305
  assign branch_or_jump = (branch_or_jalr || jal); // @ BaseType.scala l305
  always @(*) begin
    is_call = 1'b0; // @ Bju.scala l44
    if(jal) begin
      if(bju_micro_op_bju_rd_is_link) begin
        is_call = 1'b1; // @ Bju.scala l88
      end else begin
        is_call = 1'b0; // @ Bju.scala l92
      end
    end else begin
      if(jalr) begin
        if(bju_micro_op_bju_rd_is_link) begin
          if(bju_micro_op_bju_rs1_is_link) begin
            if(bju_micro_op_bju_rd_eq_rs1) begin
              is_call = 1'b1; // @ Bju.scala l110
            end else begin
              is_call = 1'b1; // @ Bju.scala l112
            end
          end else begin
            is_call = 1'b1; // @ Bju.scala l116
          end
        end
      end
    end
  end

  always @(*) begin
    is_ret = 1'b0; // @ Bju.scala l45
    if(jal) begin
      if(bju_micro_op_bju_rd_is_link) begin
        is_ret = 1'b0; // @ Bju.scala l89
      end else begin
        is_ret = 1'b0; // @ Bju.scala l93
      end
    end else begin
      if(jalr) begin
        if(bju_micro_op_bju_rd_is_link) begin
          if(bju_micro_op_bju_rs1_is_link) begin
            if(!bju_micro_op_bju_rd_eq_rs1) begin
              is_ret = 1'b1; // @ Bju.scala l113
            end
          end
        end else begin
          if(bju_micro_op_bju_rs1_is_link) begin
            is_ret = 1'b1; // @ Bju.scala l120
          end
        end
      end
    end
  end

  always @(*) begin
    is_jmp = 1'b0; // @ Bju.scala l46
    if(jal) begin
      if(bju_micro_op_bju_rd_is_link) begin
        is_jmp = 1'b0; // @ Bju.scala l90
      end else begin
        is_jmp = 1'b1; // @ Bju.scala l94
      end
    end else begin
      if(jalr) begin
        if(!bju_micro_op_bju_rd_is_link) begin
          if(!bju_micro_op_bju_rs1_is_link) begin
            is_jmp = 1'b1; // @ Bju.scala l122
          end
        end
      end
    end
  end

  assign beq_result = (beq && (rs1_val == rs2_val)); // @ BaseType.scala l305
  assign bne_result = (bne && (rs1_val != rs2_val)); // @ BaseType.scala l305
  assign blt_result = (blt && ($signed(tmp_blt_result) < $signed(tmp_blt_result_1))); // @ BaseType.scala l305
  assign bge_result = (bge && ($signed(tmp_bge_result) <= $signed(tmp_bge_result_1))); // @ BaseType.scala l305
  assign bltu_result = (bltu && (rs1_val < rs2_val)); // @ BaseType.scala l305
  assign bgeu_result = (bgeu && (rs2_val <= rs1_val)); // @ BaseType.scala l305
  assign branch_taken = (((((((beq_result || bne_result) || blt_result) || bge_result) || bltu_result) || bgeu_result) || jal) || jalr); // @ BaseType.scala l305
  always @(*) begin
    if(jalr) begin
      pc_next = tmp_pc_next[31:0]; // @ Bju.scala l64
    end else begin
      pc_next = tmp_pc_next_7[31:0]; // @ Bju.scala l66
    end
  end

  always @(*) begin
    redirect_valid = 1'b0; // @ Bju.scala l69
    if(branch_or_jump) begin
      if(branch_taken) begin
        if(tmp_when) begin
          redirect_valid = in_valid; // @ Bju.scala l74
        end
      end else begin
        if(bpu_pred_taken) begin
          redirect_valid = in_valid; // @ Bju.scala l80
        end
      end
    end
  end

  always @(*) begin
    redirect_pc_next = 32'h0; // @ Bju.scala l70
    if(branch_or_jump) begin
      if(branch_taken) begin
        if(tmp_when) begin
          redirect_pc_next = pc_next; // @ Bju.scala l75
        end
      end else begin
        if(bpu_pred_taken) begin
          redirect_pc_next = (pc + 32'h00000004); // @ Bju.scala l81
        end
      end
    end
  end

  assign src2 = ((jal || jalr) ? 64'h0000000000000004 : rs2_val); // @ Expression.scala l1431
  assign rd_val = tmp_rd_val; // @ Bju.scala l130
  always @(posedge clk or negedge resetn) begin
    if(!resetn) begin
      branch_history <= 5'h0; // @ Data.scala l400
    end else begin
      if(in_valid) begin
        branch_history <= {branch_history[3 : 0],branch_taken}; // @ Bju.scala l60
      end
    end
  end


endmodule
