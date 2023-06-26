// Generator : SpinalHDL v1.8.1    git head : 2a7592004363e5b40ec43e1f122ed8641cd8965b
// Component : DandRiscv
// Git hash  : a628215626e85f9ed4fdc9c16ccfb6378c9dbe7b

`timescale 1ns/1ps

module DandRiscv (
  input      [31:0]   slaveBus_datain,
  output     [31:0]   masterBus_dataout,
  input               clk,
  input               reset
);

  wire       [31:0]   stage_2_RESULT_AND;
  wire       [31:0]   stage_1_RESULT_XOR;
  wire       [31:0]   stage_3_RESULT_AND;
  wire       [31:0]   stage_2_RESULT_XOR;
  wire                stage_1_arbitration_haltItself;
  wire                stage_1_arbitration_haltByOther;
  reg                 stage_1_arbitration_removeIt;
  wire                stage_1_arbitration_flushIt;
  wire                stage_1_arbitration_flushNext;
  wire                stage_1_arbitration_isValid;
  wire                stage_1_arbitration_isStuck;
  wire                stage_1_arbitration_isStuckByOthers;
  wire                stage_1_arbitration_isFlushed;
  wire                stage_1_arbitration_isMoving;
  wire                stage_1_arbitration_isFiring;
  wire                stage_2_arbitration_haltItself;
  wire                stage_2_arbitration_haltByOther;
  reg                 stage_2_arbitration_removeIt;
  wire                stage_2_arbitration_flushIt;
  wire                stage_2_arbitration_flushNext;
  reg                 stage_2_arbitration_isValid;
  wire                stage_2_arbitration_isStuck;
  wire                stage_2_arbitration_isStuckByOthers;
  wire                stage_2_arbitration_isFlushed;
  wire                stage_2_arbitration_isMoving;
  wire                stage_2_arbitration_isFiring;
  wire                stage_3_arbitration_haltItself;
  wire                stage_3_arbitration_haltByOther;
  reg                 stage_3_arbitration_removeIt;
  wire                stage_3_arbitration_flushIt;
  wire                stage_3_arbitration_flushNext;
  reg                 stage_3_arbitration_isValid;
  wire                stage_3_arbitration_isStuck;
  wire                stage_3_arbitration_isStuckByOthers;
  wire                stage_3_arbitration_isFlushed;
  wire                stage_3_arbitration_isMoving;
  wire                stage_3_arbitration_isFiring;
  wire       [31:0]   slaveBus_dataout;
  wire       [31:0]   masterBus_datain;
  wire                when_Pipeline_l124;
  reg        [31:0]   stage_1_to_stage_2_RESULT_XOR;
  wire                when_Pipeline_l124_1;
  reg        [31:0]   stage_2_to_stage_3_RESULT_AND;
  wire                when_Pipeline_l151;
  wire                when_Pipeline_l154;
  wire                when_Pipeline_l151_1;
  wire                when_Pipeline_l154_1;

  assign stage_2_RESULT_AND = (stage_2_RESULT_XOR & stage_2_RESULT_XOR);
  assign stage_1_RESULT_XOR = (slaveBus_datain[31 : 0] ^ slaveBus_datain[31 : 0]);
  assign stage_3_RESULT_AND = stage_2_to_stage_3_RESULT_AND;
  assign stage_2_RESULT_XOR = stage_1_to_stage_2_RESULT_XOR;
  assign stage_1_arbitration_haltItself = 1'b0;
  assign stage_1_arbitration_haltByOther = 1'b0;
  always @(*) begin
    stage_1_arbitration_removeIt = 1'b0;
    if(stage_1_arbitration_isFlushed) begin
      stage_1_arbitration_removeIt = 1'b1;
    end
  end

  assign stage_1_arbitration_flushIt = 1'b0;
  assign stage_1_arbitration_flushNext = 1'b0;
  assign stage_2_arbitration_haltItself = 1'b0;
  assign stage_2_arbitration_haltByOther = 1'b0;
  always @(*) begin
    stage_2_arbitration_removeIt = 1'b0;
    if(stage_2_arbitration_isFlushed) begin
      stage_2_arbitration_removeIt = 1'b1;
    end
  end

  assign stage_2_arbitration_flushIt = 1'b0;
  assign stage_2_arbitration_flushNext = 1'b0;
  assign stage_3_arbitration_haltItself = 1'b0;
  assign stage_3_arbitration_haltByOther = 1'b0;
  always @(*) begin
    stage_3_arbitration_removeIt = 1'b0;
    if(stage_3_arbitration_isFlushed) begin
      stage_3_arbitration_removeIt = 1'b1;
    end
  end

  assign stage_3_arbitration_flushIt = 1'b0;
  assign stage_3_arbitration_flushNext = 1'b0;
  assign masterBus_dataout = 32'h0;
  assign when_Pipeline_l124 = (! stage_2_arbitration_isStuck);
  assign when_Pipeline_l124_1 = (! stage_3_arbitration_isStuck);
  assign stage_1_arbitration_isFlushed = (({stage_3_arbitration_flushNext,stage_2_arbitration_flushNext} != 2'b00) || ({stage_3_arbitration_flushIt,{stage_2_arbitration_flushIt,stage_1_arbitration_flushIt}} != 3'b000));
  assign stage_2_arbitration_isFlushed = ((stage_3_arbitration_flushNext != 1'b0) || ({stage_3_arbitration_flushIt,stage_2_arbitration_flushIt} != 2'b00));
  assign stage_3_arbitration_isFlushed = (1'b0 || (stage_3_arbitration_flushIt != 1'b0));
  assign stage_1_arbitration_isStuckByOthers = (stage_1_arbitration_haltByOther || ((1'b0 || stage_2_arbitration_isStuck) || stage_3_arbitration_isStuck));
  assign stage_1_arbitration_isStuck = (stage_1_arbitration_haltItself || stage_1_arbitration_isStuckByOthers);
  assign stage_1_arbitration_isMoving = ((! stage_1_arbitration_isStuck) && (! stage_1_arbitration_removeIt));
  assign stage_1_arbitration_isFiring = ((stage_1_arbitration_isValid && (! stage_1_arbitration_isStuck)) && (! stage_1_arbitration_removeIt));
  assign stage_2_arbitration_isStuckByOthers = (stage_2_arbitration_haltByOther || (1'b0 || stage_3_arbitration_isStuck));
  assign stage_2_arbitration_isStuck = (stage_2_arbitration_haltItself || stage_2_arbitration_isStuckByOthers);
  assign stage_2_arbitration_isMoving = ((! stage_2_arbitration_isStuck) && (! stage_2_arbitration_removeIt));
  assign stage_2_arbitration_isFiring = ((stage_2_arbitration_isValid && (! stage_2_arbitration_isStuck)) && (! stage_2_arbitration_removeIt));
  assign stage_3_arbitration_isStuckByOthers = (stage_3_arbitration_haltByOther || 1'b0);
  assign stage_3_arbitration_isStuck = (stage_3_arbitration_haltItself || stage_3_arbitration_isStuckByOthers);
  assign stage_3_arbitration_isMoving = ((! stage_3_arbitration_isStuck) && (! stage_3_arbitration_removeIt));
  assign stage_3_arbitration_isFiring = ((stage_3_arbitration_isValid && (! stage_3_arbitration_isStuck)) && (! stage_3_arbitration_removeIt));
  assign when_Pipeline_l151 = ((! stage_2_arbitration_isStuck) || stage_2_arbitration_removeIt);
  assign when_Pipeline_l154 = ((! stage_1_arbitration_isStuck) && (! stage_1_arbitration_removeIt));
  assign when_Pipeline_l151_1 = ((! stage_3_arbitration_isStuck) || stage_3_arbitration_removeIt);
  assign when_Pipeline_l154_1 = ((! stage_2_arbitration_isStuck) && (! stage_2_arbitration_removeIt));
  always @(posedge clk) begin
    if(when_Pipeline_l124) begin
      stage_1_to_stage_2_RESULT_XOR <= stage_1_RESULT_XOR;
    end
    if(when_Pipeline_l124_1) begin
      stage_2_to_stage_3_RESULT_AND <= stage_2_RESULT_AND;
    end
  end

  always @(posedge clk or posedge reset) begin
    if(reset) begin
      stage_2_arbitration_isValid <= 1'b0;
      stage_3_arbitration_isValid <= 1'b0;
    end else begin
      if(when_Pipeline_l151) begin
        stage_2_arbitration_isValid <= 1'b0;
      end
      if(when_Pipeline_l154) begin
        stage_2_arbitration_isValid <= stage_1_arbitration_isValid;
      end
      if(when_Pipeline_l151_1) begin
        stage_3_arbitration_isValid <= 1'b0;
      end
      if(when_Pipeline_l154_1) begin
        stage_3_arbitration_isValid <= stage_2_arbitration_isValid;
      end
    end
  end


endmodule
