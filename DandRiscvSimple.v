// Generator : SpinalHDL v1.8.1    git head : 2a7592004363e5b40ec43e1f122ed8641cd8965b
// Component : DandRiscvSimple
// Git hash  : 7c5f83d9f14502b51f686446e974a9b78700b1bb

`timescale 1ns/1ps

module DandRiscvSimple (
  input      [31:0]   slaveBus_datain,
  output     [31:0]   masterBus_dataout,
  input               clk,
  input               reset
);

  wire       [31:0]   decode_INST_TEST;
  wire       [31:0]   fetch_INSTRUCTION;
  wire       [31:0]   decode_INSTRUCTION;
  wire       [31:0]   execute_INST_TEST;
  wire                fetch_arbitration_haltItself;
  wire                fetch_arbitration_haltByOther;
  reg                 fetch_arbitration_removeIt;
  wire                fetch_arbitration_flushIt;
  wire                fetch_arbitration_flushNext;
  wire                fetch_arbitration_isValid;
  wire                fetch_arbitration_isStuck;
  wire                fetch_arbitration_isStuckByOthers;
  wire                fetch_arbitration_isFlushed;
  wire                fetch_arbitration_isMoving;
  wire                fetch_arbitration_isFiring;
  wire                decode_arbitration_haltItself;
  wire                decode_arbitration_haltByOther;
  reg                 decode_arbitration_removeIt;
  wire                decode_arbitration_flushIt;
  wire                decode_arbitration_flushNext;
  reg                 decode_arbitration_isValid;
  wire                decode_arbitration_isStuck;
  wire                decode_arbitration_isStuckByOthers;
  wire                decode_arbitration_isFlushed;
  wire                decode_arbitration_isMoving;
  wire                decode_arbitration_isFiring;
  wire                execute_arbitration_haltItself;
  wire                execute_arbitration_haltByOther;
  reg                 execute_arbitration_removeIt;
  wire                execute_arbitration_flushIt;
  wire                execute_arbitration_flushNext;
  reg                 execute_arbitration_isValid;
  wire                execute_arbitration_isStuck;
  wire                execute_arbitration_isStuckByOthers;
  wire                execute_arbitration_isFlushed;
  wire                execute_arbitration_isMoving;
  wire                execute_arbitration_isFiring;
  wire                memaccess_arbitration_haltItself;
  wire                memaccess_arbitration_haltByOther;
  reg                 memaccess_arbitration_removeIt;
  wire                memaccess_arbitration_flushIt;
  wire                memaccess_arbitration_flushNext;
  reg                 memaccess_arbitration_isValid;
  wire                memaccess_arbitration_isStuck;
  wire                memaccess_arbitration_isStuckByOthers;
  wire                memaccess_arbitration_isFlushed;
  wire                memaccess_arbitration_isMoving;
  wire                memaccess_arbitration_isFiring;
  wire                writeback_arbitration_haltItself;
  wire                writeback_arbitration_haltByOther;
  reg                 writeback_arbitration_removeIt;
  wire                writeback_arbitration_flushIt;
  wire                writeback_arbitration_flushNext;
  reg                 writeback_arbitration_isValid;
  wire                writeback_arbitration_isStuck;
  wire                writeback_arbitration_isStuckByOthers;
  wire                writeback_arbitration_isFlushed;
  wire                writeback_arbitration_isMoving;
  wire                writeback_arbitration_isFiring;
  wire                ICachePlugin_icache_access_cmd_valid;
  wire                ICachePlugin_icache_access_cmd_ready;
  wire       [7:0]    ICachePlugin_icache_access_cmd_payload;
  wire                ICachePlugin_icache_access_rsp_valid;
  wire       [7:0]    ICachePlugin_icache_access_rsp_payload;
  wire       [31:0]   slaveBus_dataout;
  wire       [31:0]   masterBus_datain;
  wire                when_Pipeline_l124;
  reg        [31:0]   fetch_to_decode_INSTRUCTION;
  wire                when_Pipeline_l124_1;
  reg        [31:0]   decode_to_execute_INST_TEST;
  wire                when_Pipeline_l151;
  wire                when_Pipeline_l154;
  wire                when_Pipeline_l151_1;
  wire                when_Pipeline_l154_1;
  wire                when_Pipeline_l151_2;
  wire                when_Pipeline_l154_2;
  wire                when_Pipeline_l151_3;
  wire                when_Pipeline_l154_3;

  assign decode_INST_TEST = decode_INSTRUCTION;
  assign fetch_INSTRUCTION = slaveBus_datain;
  assign decode_INSTRUCTION = fetch_to_decode_INSTRUCTION;
  assign execute_INST_TEST = decode_to_execute_INST_TEST;
  assign fetch_arbitration_haltItself = 1'b0;
  assign fetch_arbitration_haltByOther = 1'b0;
  always @(*) begin
    fetch_arbitration_removeIt = 1'b0;
    if(fetch_arbitration_isFlushed) begin
      fetch_arbitration_removeIt = 1'b1;
    end
  end

  assign fetch_arbitration_flushIt = 1'b0;
  assign fetch_arbitration_flushNext = 1'b0;
  assign decode_arbitration_haltItself = 1'b0;
  assign decode_arbitration_haltByOther = 1'b0;
  always @(*) begin
    decode_arbitration_removeIt = 1'b0;
    if(decode_arbitration_isFlushed) begin
      decode_arbitration_removeIt = 1'b1;
    end
  end

  assign decode_arbitration_flushIt = 1'b0;
  assign decode_arbitration_flushNext = 1'b0;
  assign execute_arbitration_haltItself = 1'b0;
  assign execute_arbitration_haltByOther = 1'b0;
  always @(*) begin
    execute_arbitration_removeIt = 1'b0;
    if(execute_arbitration_isFlushed) begin
      execute_arbitration_removeIt = 1'b1;
    end
  end

  assign execute_arbitration_flushIt = 1'b0;
  assign execute_arbitration_flushNext = 1'b0;
  assign memaccess_arbitration_haltItself = 1'b0;
  assign memaccess_arbitration_haltByOther = 1'b0;
  always @(*) begin
    memaccess_arbitration_removeIt = 1'b0;
    if(memaccess_arbitration_isFlushed) begin
      memaccess_arbitration_removeIt = 1'b1;
    end
  end

  assign memaccess_arbitration_flushIt = 1'b0;
  assign memaccess_arbitration_flushNext = 1'b0;
  assign writeback_arbitration_haltItself = 1'b0;
  assign writeback_arbitration_haltByOther = 1'b0;
  always @(*) begin
    writeback_arbitration_removeIt = 1'b0;
    if(writeback_arbitration_isFlushed) begin
      writeback_arbitration_removeIt = 1'b1;
    end
  end

  assign writeback_arbitration_flushIt = 1'b0;
  assign writeback_arbitration_flushNext = 1'b0;
  assign masterBus_dataout = 32'h00000001;
  assign ICachePlugin_icache_access_cmd_ready = 1'b1;
  assign ICachePlugin_icache_access_cmd_valid = 1'b0;
  assign ICachePlugin_icache_access_cmd_payload = 8'h01;
  assign ICachePlugin_icache_access_rsp_valid = 1'b0;
  assign ICachePlugin_icache_access_rsp_payload = 8'h01;
  assign when_Pipeline_l124 = (! decode_arbitration_isStuck);
  assign when_Pipeline_l124_1 = (! execute_arbitration_isStuck);
  assign fetch_arbitration_isFlushed = (({writeback_arbitration_flushNext,{memaccess_arbitration_flushNext,{execute_arbitration_flushNext,decode_arbitration_flushNext}}} != 4'b0000) || ({writeback_arbitration_flushIt,{memaccess_arbitration_flushIt,{execute_arbitration_flushIt,{decode_arbitration_flushIt,fetch_arbitration_flushIt}}}} != 5'h0));
  assign decode_arbitration_isFlushed = (({writeback_arbitration_flushNext,{memaccess_arbitration_flushNext,execute_arbitration_flushNext}} != 3'b000) || ({writeback_arbitration_flushIt,{memaccess_arbitration_flushIt,{execute_arbitration_flushIt,decode_arbitration_flushIt}}} != 4'b0000));
  assign execute_arbitration_isFlushed = (({writeback_arbitration_flushNext,memaccess_arbitration_flushNext} != 2'b00) || ({writeback_arbitration_flushIt,{memaccess_arbitration_flushIt,execute_arbitration_flushIt}} != 3'b000));
  assign memaccess_arbitration_isFlushed = ((writeback_arbitration_flushNext != 1'b0) || ({writeback_arbitration_flushIt,memaccess_arbitration_flushIt} != 2'b00));
  assign writeback_arbitration_isFlushed = (1'b0 || (writeback_arbitration_flushIt != 1'b0));
  assign fetch_arbitration_isStuckByOthers = (fetch_arbitration_haltByOther || ((((1'b0 || decode_arbitration_isStuck) || execute_arbitration_isStuck) || memaccess_arbitration_isStuck) || writeback_arbitration_isStuck));
  assign fetch_arbitration_isStuck = (fetch_arbitration_haltItself || fetch_arbitration_isStuckByOthers);
  assign fetch_arbitration_isMoving = ((! fetch_arbitration_isStuck) && (! fetch_arbitration_removeIt));
  assign fetch_arbitration_isFiring = ((fetch_arbitration_isValid && (! fetch_arbitration_isStuck)) && (! fetch_arbitration_removeIt));
  assign decode_arbitration_isStuckByOthers = (decode_arbitration_haltByOther || (((1'b0 || execute_arbitration_isStuck) || memaccess_arbitration_isStuck) || writeback_arbitration_isStuck));
  assign decode_arbitration_isStuck = (decode_arbitration_haltItself || decode_arbitration_isStuckByOthers);
  assign decode_arbitration_isMoving = ((! decode_arbitration_isStuck) && (! decode_arbitration_removeIt));
  assign decode_arbitration_isFiring = ((decode_arbitration_isValid && (! decode_arbitration_isStuck)) && (! decode_arbitration_removeIt));
  assign execute_arbitration_isStuckByOthers = (execute_arbitration_haltByOther || ((1'b0 || memaccess_arbitration_isStuck) || writeback_arbitration_isStuck));
  assign execute_arbitration_isStuck = (execute_arbitration_haltItself || execute_arbitration_isStuckByOthers);
  assign execute_arbitration_isMoving = ((! execute_arbitration_isStuck) && (! execute_arbitration_removeIt));
  assign execute_arbitration_isFiring = ((execute_arbitration_isValid && (! execute_arbitration_isStuck)) && (! execute_arbitration_removeIt));
  assign memaccess_arbitration_isStuckByOthers = (memaccess_arbitration_haltByOther || (1'b0 || writeback_arbitration_isStuck));
  assign memaccess_arbitration_isStuck = (memaccess_arbitration_haltItself || memaccess_arbitration_isStuckByOthers);
  assign memaccess_arbitration_isMoving = ((! memaccess_arbitration_isStuck) && (! memaccess_arbitration_removeIt));
  assign memaccess_arbitration_isFiring = ((memaccess_arbitration_isValid && (! memaccess_arbitration_isStuck)) && (! memaccess_arbitration_removeIt));
  assign writeback_arbitration_isStuckByOthers = (writeback_arbitration_haltByOther || 1'b0);
  assign writeback_arbitration_isStuck = (writeback_arbitration_haltItself || writeback_arbitration_isStuckByOthers);
  assign writeback_arbitration_isMoving = ((! writeback_arbitration_isStuck) && (! writeback_arbitration_removeIt));
  assign writeback_arbitration_isFiring = ((writeback_arbitration_isValid && (! writeback_arbitration_isStuck)) && (! writeback_arbitration_removeIt));
  assign when_Pipeline_l151 = ((! decode_arbitration_isStuck) || decode_arbitration_removeIt);
  assign when_Pipeline_l154 = ((! fetch_arbitration_isStuck) && (! fetch_arbitration_removeIt));
  assign when_Pipeline_l151_1 = ((! execute_arbitration_isStuck) || execute_arbitration_removeIt);
  assign when_Pipeline_l154_1 = ((! decode_arbitration_isStuck) && (! decode_arbitration_removeIt));
  assign when_Pipeline_l151_2 = ((! memaccess_arbitration_isStuck) || memaccess_arbitration_removeIt);
  assign when_Pipeline_l154_2 = ((! execute_arbitration_isStuck) && (! execute_arbitration_removeIt));
  assign when_Pipeline_l151_3 = ((! writeback_arbitration_isStuck) || writeback_arbitration_removeIt);
  assign when_Pipeline_l154_3 = ((! memaccess_arbitration_isStuck) && (! memaccess_arbitration_removeIt));
  always @(posedge clk) begin
    if(when_Pipeline_l124) begin
      fetch_to_decode_INSTRUCTION <= fetch_INSTRUCTION;
    end
    if(when_Pipeline_l124_1) begin
      decode_to_execute_INST_TEST <= decode_INST_TEST;
    end
  end

  always @(posedge clk or posedge reset) begin
    if(reset) begin
      decode_arbitration_isValid <= 1'b0;
      execute_arbitration_isValid <= 1'b0;
      memaccess_arbitration_isValid <= 1'b0;
      writeback_arbitration_isValid <= 1'b0;
    end else begin
      if(when_Pipeline_l151) begin
        decode_arbitration_isValid <= 1'b0;
      end
      if(when_Pipeline_l154) begin
        decode_arbitration_isValid <= fetch_arbitration_isValid;
      end
      if(when_Pipeline_l151_1) begin
        execute_arbitration_isValid <= 1'b0;
      end
      if(when_Pipeline_l154_1) begin
        execute_arbitration_isValid <= decode_arbitration_isValid;
      end
      if(when_Pipeline_l151_2) begin
        memaccess_arbitration_isValid <= 1'b0;
      end
      if(when_Pipeline_l154_2) begin
        memaccess_arbitration_isValid <= execute_arbitration_isValid;
      end
      if(when_Pipeline_l151_3) begin
        writeback_arbitration_isValid <= 1'b0;
      end
      if(when_Pipeline_l154_3) begin
        writeback_arbitration_isValid <= memaccess_arbitration_isValid;
      end
    end
  end


endmodule
