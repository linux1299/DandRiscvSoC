// Generator : SpinalHDL v1.8.1    git head : 2a7592004363e5b40ec43e1f122ed8641cd8965b
// Component : DandRiscvSimple
// Git hash  : d47c11b6a2e7388c4cfbf8d348019870e5945145

`timescale 1ns/1ps

module DandRiscvSimple (
  input      [31:0]   slaveBus_datain,
  output     [31:0]   masterBus_dataout,
  input               clk,
  input               reset
);

  wire                iCache_1_flush;
  wire                iCache_1_cpu_cmd_valid;
  wire       [63:0]   iCache_1_cpu_cmd_payload_addr;
  wire                iCache_1_sram_0_ports_rsp_valid;
  wire       [255:0]  iCache_1_sram_0_ports_rsp_payload_data;
  wire                iCache_1_sram_1_ports_rsp_valid;
  wire       [255:0]  iCache_1_sram_1_ports_rsp_payload_data;
  wire                iCache_1_sram_2_ports_rsp_valid;
  wire       [255:0]  iCache_1_sram_2_ports_rsp_payload_data;
  wire                iCache_1_sram_3_ports_rsp_valid;
  wire       [255:0]  iCache_1_sram_3_ports_rsp_payload_data;
  wire                iCache_1_next_level_cmd_ready;
  wire                iCache_1_next_level_rsp_valid;
  wire       [255:0]  iCache_1_next_level_rsp_payload_data;
  wire                iCache_1_cpu_cmd_ready;
  wire                iCache_1_cpu_rsp_valid;
  wire       [31:0]   iCache_1_cpu_rsp_payload_data;
  wire                iCache_1_sram_0_ports_cmd_valid;
  wire       [1:0]    iCache_1_sram_0_ports_cmd_payload_addr;
  wire                iCache_1_sram_0_ports_cmd_payload_wen;
  wire                iCache_1_sram_1_ports_cmd_valid;
  wire       [1:0]    iCache_1_sram_1_ports_cmd_payload_addr;
  wire                iCache_1_sram_1_ports_cmd_payload_wen;
  wire                iCache_1_sram_2_ports_cmd_valid;
  wire       [1:0]    iCache_1_sram_2_ports_cmd_payload_addr;
  wire                iCache_1_sram_2_ports_cmd_payload_wen;
  wire                iCache_1_sram_3_ports_cmd_valid;
  wire       [1:0]    iCache_1_sram_3_ports_cmd_payload_addr;
  wire                iCache_1_sram_3_ports_cmd_payload_wen;
  wire                iCache_1_next_level_cmd_valid;
  wire       [63:0]   iCache_1_next_level_cmd_payload_addr;
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
  wire       [63:0]   ICachePlugin_icache_access_cmd_payload_address;
  wire       [2:0]    ICachePlugin_icache_access_cmd_payload_size;
  wire                ICachePlugin_icache_access_rsp_valid;
  wire       [31:0]   ICachePlugin_icache_access_rsp_payload_data;
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

  ICache iCache_1 (
    .flush                         (iCache_1_flush                               ), //i
    .cpu_cmd_valid                 (iCache_1_cpu_cmd_valid                       ), //i
    .cpu_cmd_ready                 (iCache_1_cpu_cmd_ready                       ), //o
    .cpu_cmd_payload_addr          (iCache_1_cpu_cmd_payload_addr[63:0]          ), //i
    .cpu_rsp_valid                 (iCache_1_cpu_rsp_valid                       ), //o
    .cpu_rsp_payload_data          (iCache_1_cpu_rsp_payload_data[31:0]          ), //o
    .sram_0_ports_cmd_valid        (iCache_1_sram_0_ports_cmd_valid              ), //o
    .sram_0_ports_cmd_payload_addr (iCache_1_sram_0_ports_cmd_payload_addr[1:0]  ), //o
    .sram_0_ports_cmd_payload_wen  (iCache_1_sram_0_ports_cmd_payload_wen        ), //o
    .sram_0_ports_rsp_valid        (iCache_1_sram_0_ports_rsp_valid              ), //i
    .sram_0_ports_rsp_payload_data (iCache_1_sram_0_ports_rsp_payload_data[255:0]), //i
    .sram_1_ports_cmd_valid        (iCache_1_sram_1_ports_cmd_valid              ), //o
    .sram_1_ports_cmd_payload_addr (iCache_1_sram_1_ports_cmd_payload_addr[1:0]  ), //o
    .sram_1_ports_cmd_payload_wen  (iCache_1_sram_1_ports_cmd_payload_wen        ), //o
    .sram_1_ports_rsp_valid        (iCache_1_sram_1_ports_rsp_valid              ), //i
    .sram_1_ports_rsp_payload_data (iCache_1_sram_1_ports_rsp_payload_data[255:0]), //i
    .sram_2_ports_cmd_valid        (iCache_1_sram_2_ports_cmd_valid              ), //o
    .sram_2_ports_cmd_payload_addr (iCache_1_sram_2_ports_cmd_payload_addr[1:0]  ), //o
    .sram_2_ports_cmd_payload_wen  (iCache_1_sram_2_ports_cmd_payload_wen        ), //o
    .sram_2_ports_rsp_valid        (iCache_1_sram_2_ports_rsp_valid              ), //i
    .sram_2_ports_rsp_payload_data (iCache_1_sram_2_ports_rsp_payload_data[255:0]), //i
    .sram_3_ports_cmd_valid        (iCache_1_sram_3_ports_cmd_valid              ), //o
    .sram_3_ports_cmd_payload_addr (iCache_1_sram_3_ports_cmd_payload_addr[1:0]  ), //o
    .sram_3_ports_cmd_payload_wen  (iCache_1_sram_3_ports_cmd_payload_wen        ), //o
    .sram_3_ports_rsp_valid        (iCache_1_sram_3_ports_rsp_valid              ), //i
    .sram_3_ports_rsp_payload_data (iCache_1_sram_3_ports_rsp_payload_data[255:0]), //i
    .next_level_cmd_valid          (iCache_1_next_level_cmd_valid                ), //o
    .next_level_cmd_ready          (iCache_1_next_level_cmd_ready                ), //i
    .next_level_cmd_payload_addr   (iCache_1_next_level_cmd_payload_addr[63:0]   ), //o
    .next_level_rsp_valid          (iCache_1_next_level_rsp_valid                ), //i
    .next_level_rsp_payload_data   (iCache_1_next_level_rsp_payload_data[255:0]  ), //i
    .clk                           (clk                                          ), //i
    .reset                         (reset                                        )  //i
  );
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
  assign masterBus_dataout = 32'h00000002;
  assign ICachePlugin_icache_access_cmd_ready = 1'b1;
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

module ICache (
  input               flush,
  input               cpu_cmd_valid,
  output              cpu_cmd_ready,
  input      [63:0]   cpu_cmd_payload_addr,
  output              cpu_rsp_valid,
  output     [31:0]   cpu_rsp_payload_data,
  output reg          sram_0_ports_cmd_valid,
  output reg [1:0]    sram_0_ports_cmd_payload_addr,
  output reg          sram_0_ports_cmd_payload_wen,
  input               sram_0_ports_rsp_valid,
  input      [255:0]  sram_0_ports_rsp_payload_data,
  output reg          sram_1_ports_cmd_valid,
  output reg [1:0]    sram_1_ports_cmd_payload_addr,
  output reg          sram_1_ports_cmd_payload_wen,
  input               sram_1_ports_rsp_valid,
  input      [255:0]  sram_1_ports_rsp_payload_data,
  output reg          sram_2_ports_cmd_valid,
  output reg [1:0]    sram_2_ports_cmd_payload_addr,
  output reg          sram_2_ports_cmd_payload_wen,
  input               sram_2_ports_rsp_valid,
  input      [255:0]  sram_2_ports_rsp_payload_data,
  output reg          sram_3_ports_cmd_valid,
  output reg [1:0]    sram_3_ports_cmd_payload_addr,
  output reg          sram_3_ports_cmd_payload_wen,
  input               sram_3_ports_rsp_valid,
  input      [255:0]  sram_3_ports_rsp_payload_data,
  output              next_level_cmd_valid,
  input               next_level_cmd_ready,
  output     [63:0]   next_level_cmd_payload_addr,
  input               next_level_rsp_valid,
  input      [255:0]  next_level_rsp_payload_data,
  input               clk,
  input               reset
);

  reg        [53:0]   _zz_icache_tag_0;
  reg                 _zz_icache_hit_0;
  reg                 _zz_icache_replace_info_0;
  reg                 _zz_icache_victim_0;
  reg        [53:0]   _zz_icache_tag_1;
  reg                 _zz_icache_hit_1;
  reg                 _zz_icache_replace_info_1;
  reg                 _zz_icache_victim_1;
  reg        [53:0]   _zz_icache_tag_2;
  reg                 _zz_icache_hit_2;
  reg                 _zz_icache_replace_info_2;
  reg                 _zz_icache_victim_2;
  reg        [53:0]   _zz_icache_tag_3;
  reg                 _zz_icache_hit_3;
  reg                 _zz_icache_replace_info_3;
  reg                 _zz_icache_victim_3;
  reg        [255:0]  _zz__zz_cpu_rsp_payload_data;
  reg        [31:0]   _zz_cpu_rsp_payload_data_1;
  reg                 _zz_cpu_rsp_valid;
  reg                 ways_0_metas_0_valid;
  wire       [53:0]   ways_0_metas_0_tag;
  reg                 ways_0_metas_0_replace_info;
  reg                 ways_0_metas_1_valid;
  wire       [53:0]   ways_0_metas_1_tag;
  reg                 ways_0_metas_1_replace_info;
  reg                 ways_0_metas_2_valid;
  wire       [53:0]   ways_0_metas_2_tag;
  reg                 ways_0_metas_2_replace_info;
  reg                 ways_0_metas_3_valid;
  wire       [53:0]   ways_0_metas_3_tag;
  reg                 ways_0_metas_3_replace_info;
  reg                 ways_0_metas_4_valid;
  wire       [53:0]   ways_0_metas_4_tag;
  reg                 ways_0_metas_4_replace_info;
  reg                 ways_0_metas_5_valid;
  wire       [53:0]   ways_0_metas_5_tag;
  reg                 ways_0_metas_5_replace_info;
  reg                 ways_0_metas_6_valid;
  wire       [53:0]   ways_0_metas_6_tag;
  reg                 ways_0_metas_6_replace_info;
  reg                 ways_0_metas_7_valid;
  wire       [53:0]   ways_0_metas_7_tag;
  reg                 ways_0_metas_7_replace_info;
  reg                 ways_0_metas_8_valid;
  wire       [53:0]   ways_0_metas_8_tag;
  reg                 ways_0_metas_8_replace_info;
  reg                 ways_0_metas_9_valid;
  wire       [53:0]   ways_0_metas_9_tag;
  reg                 ways_0_metas_9_replace_info;
  reg                 ways_0_metas_10_valid;
  wire       [53:0]   ways_0_metas_10_tag;
  reg                 ways_0_metas_10_replace_info;
  reg                 ways_0_metas_11_valid;
  wire       [53:0]   ways_0_metas_11_tag;
  reg                 ways_0_metas_11_replace_info;
  reg                 ways_0_metas_12_valid;
  wire       [53:0]   ways_0_metas_12_tag;
  reg                 ways_0_metas_12_replace_info;
  reg                 ways_0_metas_13_valid;
  wire       [53:0]   ways_0_metas_13_tag;
  reg                 ways_0_metas_13_replace_info;
  reg                 ways_0_metas_14_valid;
  wire       [53:0]   ways_0_metas_14_tag;
  reg                 ways_0_metas_14_replace_info;
  reg                 ways_0_metas_15_valid;
  wire       [53:0]   ways_0_metas_15_tag;
  reg                 ways_0_metas_15_replace_info;
  reg                 ways_1_metas_0_valid;
  wire       [53:0]   ways_1_metas_0_tag;
  reg                 ways_1_metas_0_replace_info;
  reg                 ways_1_metas_1_valid;
  wire       [53:0]   ways_1_metas_1_tag;
  reg                 ways_1_metas_1_replace_info;
  reg                 ways_1_metas_2_valid;
  wire       [53:0]   ways_1_metas_2_tag;
  reg                 ways_1_metas_2_replace_info;
  reg                 ways_1_metas_3_valid;
  wire       [53:0]   ways_1_metas_3_tag;
  reg                 ways_1_metas_3_replace_info;
  reg                 ways_1_metas_4_valid;
  wire       [53:0]   ways_1_metas_4_tag;
  reg                 ways_1_metas_4_replace_info;
  reg                 ways_1_metas_5_valid;
  wire       [53:0]   ways_1_metas_5_tag;
  reg                 ways_1_metas_5_replace_info;
  reg                 ways_1_metas_6_valid;
  wire       [53:0]   ways_1_metas_6_tag;
  reg                 ways_1_metas_6_replace_info;
  reg                 ways_1_metas_7_valid;
  wire       [53:0]   ways_1_metas_7_tag;
  reg                 ways_1_metas_7_replace_info;
  reg                 ways_1_metas_8_valid;
  wire       [53:0]   ways_1_metas_8_tag;
  reg                 ways_1_metas_8_replace_info;
  reg                 ways_1_metas_9_valid;
  wire       [53:0]   ways_1_metas_9_tag;
  reg                 ways_1_metas_9_replace_info;
  reg                 ways_1_metas_10_valid;
  wire       [53:0]   ways_1_metas_10_tag;
  reg                 ways_1_metas_10_replace_info;
  reg                 ways_1_metas_11_valid;
  wire       [53:0]   ways_1_metas_11_tag;
  reg                 ways_1_metas_11_replace_info;
  reg                 ways_1_metas_12_valid;
  wire       [53:0]   ways_1_metas_12_tag;
  reg                 ways_1_metas_12_replace_info;
  reg                 ways_1_metas_13_valid;
  wire       [53:0]   ways_1_metas_13_tag;
  reg                 ways_1_metas_13_replace_info;
  reg                 ways_1_metas_14_valid;
  wire       [53:0]   ways_1_metas_14_tag;
  reg                 ways_1_metas_14_replace_info;
  reg                 ways_1_metas_15_valid;
  wire       [53:0]   ways_1_metas_15_tag;
  reg                 ways_1_metas_15_replace_info;
  reg                 ways_2_metas_0_valid;
  wire       [53:0]   ways_2_metas_0_tag;
  reg                 ways_2_metas_0_replace_info;
  reg                 ways_2_metas_1_valid;
  wire       [53:0]   ways_2_metas_1_tag;
  reg                 ways_2_metas_1_replace_info;
  reg                 ways_2_metas_2_valid;
  wire       [53:0]   ways_2_metas_2_tag;
  reg                 ways_2_metas_2_replace_info;
  reg                 ways_2_metas_3_valid;
  wire       [53:0]   ways_2_metas_3_tag;
  reg                 ways_2_metas_3_replace_info;
  reg                 ways_2_metas_4_valid;
  wire       [53:0]   ways_2_metas_4_tag;
  reg                 ways_2_metas_4_replace_info;
  reg                 ways_2_metas_5_valid;
  wire       [53:0]   ways_2_metas_5_tag;
  reg                 ways_2_metas_5_replace_info;
  reg                 ways_2_metas_6_valid;
  wire       [53:0]   ways_2_metas_6_tag;
  reg                 ways_2_metas_6_replace_info;
  reg                 ways_2_metas_7_valid;
  wire       [53:0]   ways_2_metas_7_tag;
  reg                 ways_2_metas_7_replace_info;
  reg                 ways_2_metas_8_valid;
  wire       [53:0]   ways_2_metas_8_tag;
  reg                 ways_2_metas_8_replace_info;
  reg                 ways_2_metas_9_valid;
  wire       [53:0]   ways_2_metas_9_tag;
  reg                 ways_2_metas_9_replace_info;
  reg                 ways_2_metas_10_valid;
  wire       [53:0]   ways_2_metas_10_tag;
  reg                 ways_2_metas_10_replace_info;
  reg                 ways_2_metas_11_valid;
  wire       [53:0]   ways_2_metas_11_tag;
  reg                 ways_2_metas_11_replace_info;
  reg                 ways_2_metas_12_valid;
  wire       [53:0]   ways_2_metas_12_tag;
  reg                 ways_2_metas_12_replace_info;
  reg                 ways_2_metas_13_valid;
  wire       [53:0]   ways_2_metas_13_tag;
  reg                 ways_2_metas_13_replace_info;
  reg                 ways_2_metas_14_valid;
  wire       [53:0]   ways_2_metas_14_tag;
  reg                 ways_2_metas_14_replace_info;
  reg                 ways_2_metas_15_valid;
  wire       [53:0]   ways_2_metas_15_tag;
  reg                 ways_2_metas_15_replace_info;
  reg                 ways_3_metas_0_valid;
  wire       [53:0]   ways_3_metas_0_tag;
  reg                 ways_3_metas_0_replace_info;
  reg                 ways_3_metas_1_valid;
  wire       [53:0]   ways_3_metas_1_tag;
  reg                 ways_3_metas_1_replace_info;
  reg                 ways_3_metas_2_valid;
  wire       [53:0]   ways_3_metas_2_tag;
  reg                 ways_3_metas_2_replace_info;
  reg                 ways_3_metas_3_valid;
  wire       [53:0]   ways_3_metas_3_tag;
  reg                 ways_3_metas_3_replace_info;
  reg                 ways_3_metas_4_valid;
  wire       [53:0]   ways_3_metas_4_tag;
  reg                 ways_3_metas_4_replace_info;
  reg                 ways_3_metas_5_valid;
  wire       [53:0]   ways_3_metas_5_tag;
  reg                 ways_3_metas_5_replace_info;
  reg                 ways_3_metas_6_valid;
  wire       [53:0]   ways_3_metas_6_tag;
  reg                 ways_3_metas_6_replace_info;
  reg                 ways_3_metas_7_valid;
  wire       [53:0]   ways_3_metas_7_tag;
  reg                 ways_3_metas_7_replace_info;
  reg                 ways_3_metas_8_valid;
  wire       [53:0]   ways_3_metas_8_tag;
  reg                 ways_3_metas_8_replace_info;
  reg                 ways_3_metas_9_valid;
  wire       [53:0]   ways_3_metas_9_tag;
  reg                 ways_3_metas_9_replace_info;
  reg                 ways_3_metas_10_valid;
  wire       [53:0]   ways_3_metas_10_tag;
  reg                 ways_3_metas_10_replace_info;
  reg                 ways_3_metas_11_valid;
  wire       [53:0]   ways_3_metas_11_tag;
  reg                 ways_3_metas_11_replace_info;
  reg                 ways_3_metas_12_valid;
  wire       [53:0]   ways_3_metas_12_tag;
  reg                 ways_3_metas_12_replace_info;
  reg                 ways_3_metas_13_valid;
  wire       [53:0]   ways_3_metas_13_tag;
  reg                 ways_3_metas_13_replace_info;
  reg                 ways_3_metas_14_valid;
  wire       [53:0]   ways_3_metas_14_tag;
  reg                 ways_3_metas_14_replace_info;
  reg                 ways_3_metas_15_valid;
  wire       [53:0]   ways_3_metas_15_tag;
  reg                 ways_3_metas_15_replace_info;
  wire       [53:0]   icache_tag_0;
  wire       [53:0]   icache_tag_1;
  wire       [53:0]   icache_tag_2;
  wire       [53:0]   icache_tag_3;
  wire                icache_hit_0;
  wire                icache_hit_1;
  wire                icache_hit_2;
  wire                icache_hit_3;
  wire                icache_victim_0;
  reg                 icache_victim_1;
  reg                 icache_victim_2;
  reg                 icache_victim_3;
  wire                icache_replace_info_0;
  wire                icache_replace_info_1;
  wire                icache_replace_info_2;
  wire                icache_replace_info_3;
  wire       [1:0]    hit_way_id;
  wire                replace_info_full;
  wire                cpu_cmd_fire;
  wire                is_hit;
  wire                cpu_cmd_fire_1;
  wire                is_miss;
  wire       [53:0]   cpu_tag;
  wire       [3:0]    cpu_set;
  wire       [4:0]    cpu_bank_offset;
  wire       [1:0]    cpu_bank_addr;
  wire       [2:0]    cpu_bank_sel;
  reg        [63:0]   cpu_addr_d1;
  wire       [3:0]    cpu_set_d1;
  reg                 cpu_cmd_ready_1;
  wire       [255:0]  sram_banks_data_0;
  wire       [255:0]  sram_banks_data_1;
  wire       [255:0]  sram_banks_data_2;
  wire       [255:0]  sram_banks_data_3;
  wire                sram_banks_valid_0;
  wire                sram_banks_valid_1;
  wire                sram_banks_valid_2;
  wire                sram_banks_valid_3;
  reg                 next_level_cmd_valid_1;
  wire                next_level_cmd_fire;
  wire                _zz_hit_way_id;
  wire                _zz_hit_way_id_1;
  wire       [15:0]   _zz_1;
  wire                _zz_2;
  wire                _zz_3;
  wire                _zz_4;
  wire                _zz_5;
  wire                _zz_6;
  wire                _zz_7;
  wire                _zz_8;
  wire                _zz_9;
  wire                _zz_10;
  wire                _zz_11;
  wire                _zz_12;
  wire                _zz_13;
  wire                _zz_14;
  wire                _zz_15;
  wire                _zz_16;
  wire                _zz_17;
  wire       [15:0]   _zz_18;
  wire                cpu_cmd_fire_2;
  wire                when_ICache_l179;
  wire       [15:0]   _zz_19;
  wire                _zz_20;
  wire                _zz_21;
  wire                _zz_22;
  wire                _zz_23;
  wire                _zz_24;
  wire                _zz_25;
  wire                _zz_26;
  wire                _zz_27;
  wire                _zz_28;
  wire                _zz_29;
  wire                _zz_30;
  wire                _zz_31;
  wire                _zz_32;
  wire                _zz_33;
  wire                _zz_34;
  wire                _zz_35;
  wire       [15:0]   _zz_36;
  wire                cpu_cmd_fire_3;
  wire                when_ICache_l179_1;
  wire       [15:0]   _zz_37;
  wire                _zz_38;
  wire                _zz_39;
  wire                _zz_40;
  wire                _zz_41;
  wire                _zz_42;
  wire                _zz_43;
  wire                _zz_44;
  wire                _zz_45;
  wire                _zz_46;
  wire                _zz_47;
  wire                _zz_48;
  wire                _zz_49;
  wire                _zz_50;
  wire                _zz_51;
  wire                _zz_52;
  wire                _zz_53;
  wire       [15:0]   _zz_54;
  wire                cpu_cmd_fire_4;
  wire                when_ICache_l179_2;
  wire       [15:0]   _zz_55;
  wire                _zz_56;
  wire                _zz_57;
  wire                _zz_58;
  wire                _zz_59;
  wire                _zz_60;
  wire                _zz_61;
  wire                _zz_62;
  wire                _zz_63;
  wire                _zz_64;
  wire                _zz_65;
  wire                _zz_66;
  wire                _zz_67;
  wire                _zz_68;
  wire                _zz_69;
  wire                _zz_70;
  wire                _zz_71;
  wire       [15:0]   _zz_72;
  wire                cpu_cmd_fire_5;
  wire                when_ICache_l179_3;
  wire       [255:0]  _zz_cpu_rsp_payload_data;

  always @(*) begin
    case(cpu_set)
      4'b0000 : begin
        _zz_icache_tag_0 = ways_0_metas_0_tag;
        _zz_icache_hit_0 = ways_0_metas_0_valid;
        _zz_icache_replace_info_0 = ways_0_metas_0_replace_info;
        _zz_icache_tag_1 = ways_1_metas_0_tag;
        _zz_icache_hit_1 = ways_1_metas_0_valid;
        _zz_icache_replace_info_1 = ways_1_metas_0_replace_info;
        _zz_icache_tag_2 = ways_2_metas_0_tag;
        _zz_icache_hit_2 = ways_2_metas_0_valid;
        _zz_icache_replace_info_2 = ways_2_metas_0_replace_info;
        _zz_icache_tag_3 = ways_3_metas_0_tag;
        _zz_icache_hit_3 = ways_3_metas_0_valid;
        _zz_icache_replace_info_3 = ways_3_metas_0_replace_info;
      end
      4'b0001 : begin
        _zz_icache_tag_0 = ways_0_metas_1_tag;
        _zz_icache_hit_0 = ways_0_metas_1_valid;
        _zz_icache_replace_info_0 = ways_0_metas_1_replace_info;
        _zz_icache_tag_1 = ways_1_metas_1_tag;
        _zz_icache_hit_1 = ways_1_metas_1_valid;
        _zz_icache_replace_info_1 = ways_1_metas_1_replace_info;
        _zz_icache_tag_2 = ways_2_metas_1_tag;
        _zz_icache_hit_2 = ways_2_metas_1_valid;
        _zz_icache_replace_info_2 = ways_2_metas_1_replace_info;
        _zz_icache_tag_3 = ways_3_metas_1_tag;
        _zz_icache_hit_3 = ways_3_metas_1_valid;
        _zz_icache_replace_info_3 = ways_3_metas_1_replace_info;
      end
      4'b0010 : begin
        _zz_icache_tag_0 = ways_0_metas_2_tag;
        _zz_icache_hit_0 = ways_0_metas_2_valid;
        _zz_icache_replace_info_0 = ways_0_metas_2_replace_info;
        _zz_icache_tag_1 = ways_1_metas_2_tag;
        _zz_icache_hit_1 = ways_1_metas_2_valid;
        _zz_icache_replace_info_1 = ways_1_metas_2_replace_info;
        _zz_icache_tag_2 = ways_2_metas_2_tag;
        _zz_icache_hit_2 = ways_2_metas_2_valid;
        _zz_icache_replace_info_2 = ways_2_metas_2_replace_info;
        _zz_icache_tag_3 = ways_3_metas_2_tag;
        _zz_icache_hit_3 = ways_3_metas_2_valid;
        _zz_icache_replace_info_3 = ways_3_metas_2_replace_info;
      end
      4'b0011 : begin
        _zz_icache_tag_0 = ways_0_metas_3_tag;
        _zz_icache_hit_0 = ways_0_metas_3_valid;
        _zz_icache_replace_info_0 = ways_0_metas_3_replace_info;
        _zz_icache_tag_1 = ways_1_metas_3_tag;
        _zz_icache_hit_1 = ways_1_metas_3_valid;
        _zz_icache_replace_info_1 = ways_1_metas_3_replace_info;
        _zz_icache_tag_2 = ways_2_metas_3_tag;
        _zz_icache_hit_2 = ways_2_metas_3_valid;
        _zz_icache_replace_info_2 = ways_2_metas_3_replace_info;
        _zz_icache_tag_3 = ways_3_metas_3_tag;
        _zz_icache_hit_3 = ways_3_metas_3_valid;
        _zz_icache_replace_info_3 = ways_3_metas_3_replace_info;
      end
      4'b0100 : begin
        _zz_icache_tag_0 = ways_0_metas_4_tag;
        _zz_icache_hit_0 = ways_0_metas_4_valid;
        _zz_icache_replace_info_0 = ways_0_metas_4_replace_info;
        _zz_icache_tag_1 = ways_1_metas_4_tag;
        _zz_icache_hit_1 = ways_1_metas_4_valid;
        _zz_icache_replace_info_1 = ways_1_metas_4_replace_info;
        _zz_icache_tag_2 = ways_2_metas_4_tag;
        _zz_icache_hit_2 = ways_2_metas_4_valid;
        _zz_icache_replace_info_2 = ways_2_metas_4_replace_info;
        _zz_icache_tag_3 = ways_3_metas_4_tag;
        _zz_icache_hit_3 = ways_3_metas_4_valid;
        _zz_icache_replace_info_3 = ways_3_metas_4_replace_info;
      end
      4'b0101 : begin
        _zz_icache_tag_0 = ways_0_metas_5_tag;
        _zz_icache_hit_0 = ways_0_metas_5_valid;
        _zz_icache_replace_info_0 = ways_0_metas_5_replace_info;
        _zz_icache_tag_1 = ways_1_metas_5_tag;
        _zz_icache_hit_1 = ways_1_metas_5_valid;
        _zz_icache_replace_info_1 = ways_1_metas_5_replace_info;
        _zz_icache_tag_2 = ways_2_metas_5_tag;
        _zz_icache_hit_2 = ways_2_metas_5_valid;
        _zz_icache_replace_info_2 = ways_2_metas_5_replace_info;
        _zz_icache_tag_3 = ways_3_metas_5_tag;
        _zz_icache_hit_3 = ways_3_metas_5_valid;
        _zz_icache_replace_info_3 = ways_3_metas_5_replace_info;
      end
      4'b0110 : begin
        _zz_icache_tag_0 = ways_0_metas_6_tag;
        _zz_icache_hit_0 = ways_0_metas_6_valid;
        _zz_icache_replace_info_0 = ways_0_metas_6_replace_info;
        _zz_icache_tag_1 = ways_1_metas_6_tag;
        _zz_icache_hit_1 = ways_1_metas_6_valid;
        _zz_icache_replace_info_1 = ways_1_metas_6_replace_info;
        _zz_icache_tag_2 = ways_2_metas_6_tag;
        _zz_icache_hit_2 = ways_2_metas_6_valid;
        _zz_icache_replace_info_2 = ways_2_metas_6_replace_info;
        _zz_icache_tag_3 = ways_3_metas_6_tag;
        _zz_icache_hit_3 = ways_3_metas_6_valid;
        _zz_icache_replace_info_3 = ways_3_metas_6_replace_info;
      end
      4'b0111 : begin
        _zz_icache_tag_0 = ways_0_metas_7_tag;
        _zz_icache_hit_0 = ways_0_metas_7_valid;
        _zz_icache_replace_info_0 = ways_0_metas_7_replace_info;
        _zz_icache_tag_1 = ways_1_metas_7_tag;
        _zz_icache_hit_1 = ways_1_metas_7_valid;
        _zz_icache_replace_info_1 = ways_1_metas_7_replace_info;
        _zz_icache_tag_2 = ways_2_metas_7_tag;
        _zz_icache_hit_2 = ways_2_metas_7_valid;
        _zz_icache_replace_info_2 = ways_2_metas_7_replace_info;
        _zz_icache_tag_3 = ways_3_metas_7_tag;
        _zz_icache_hit_3 = ways_3_metas_7_valid;
        _zz_icache_replace_info_3 = ways_3_metas_7_replace_info;
      end
      4'b1000 : begin
        _zz_icache_tag_0 = ways_0_metas_8_tag;
        _zz_icache_hit_0 = ways_0_metas_8_valid;
        _zz_icache_replace_info_0 = ways_0_metas_8_replace_info;
        _zz_icache_tag_1 = ways_1_metas_8_tag;
        _zz_icache_hit_1 = ways_1_metas_8_valid;
        _zz_icache_replace_info_1 = ways_1_metas_8_replace_info;
        _zz_icache_tag_2 = ways_2_metas_8_tag;
        _zz_icache_hit_2 = ways_2_metas_8_valid;
        _zz_icache_replace_info_2 = ways_2_metas_8_replace_info;
        _zz_icache_tag_3 = ways_3_metas_8_tag;
        _zz_icache_hit_3 = ways_3_metas_8_valid;
        _zz_icache_replace_info_3 = ways_3_metas_8_replace_info;
      end
      4'b1001 : begin
        _zz_icache_tag_0 = ways_0_metas_9_tag;
        _zz_icache_hit_0 = ways_0_metas_9_valid;
        _zz_icache_replace_info_0 = ways_0_metas_9_replace_info;
        _zz_icache_tag_1 = ways_1_metas_9_tag;
        _zz_icache_hit_1 = ways_1_metas_9_valid;
        _zz_icache_replace_info_1 = ways_1_metas_9_replace_info;
        _zz_icache_tag_2 = ways_2_metas_9_tag;
        _zz_icache_hit_2 = ways_2_metas_9_valid;
        _zz_icache_replace_info_2 = ways_2_metas_9_replace_info;
        _zz_icache_tag_3 = ways_3_metas_9_tag;
        _zz_icache_hit_3 = ways_3_metas_9_valid;
        _zz_icache_replace_info_3 = ways_3_metas_9_replace_info;
      end
      4'b1010 : begin
        _zz_icache_tag_0 = ways_0_metas_10_tag;
        _zz_icache_hit_0 = ways_0_metas_10_valid;
        _zz_icache_replace_info_0 = ways_0_metas_10_replace_info;
        _zz_icache_tag_1 = ways_1_metas_10_tag;
        _zz_icache_hit_1 = ways_1_metas_10_valid;
        _zz_icache_replace_info_1 = ways_1_metas_10_replace_info;
        _zz_icache_tag_2 = ways_2_metas_10_tag;
        _zz_icache_hit_2 = ways_2_metas_10_valid;
        _zz_icache_replace_info_2 = ways_2_metas_10_replace_info;
        _zz_icache_tag_3 = ways_3_metas_10_tag;
        _zz_icache_hit_3 = ways_3_metas_10_valid;
        _zz_icache_replace_info_3 = ways_3_metas_10_replace_info;
      end
      4'b1011 : begin
        _zz_icache_tag_0 = ways_0_metas_11_tag;
        _zz_icache_hit_0 = ways_0_metas_11_valid;
        _zz_icache_replace_info_0 = ways_0_metas_11_replace_info;
        _zz_icache_tag_1 = ways_1_metas_11_tag;
        _zz_icache_hit_1 = ways_1_metas_11_valid;
        _zz_icache_replace_info_1 = ways_1_metas_11_replace_info;
        _zz_icache_tag_2 = ways_2_metas_11_tag;
        _zz_icache_hit_2 = ways_2_metas_11_valid;
        _zz_icache_replace_info_2 = ways_2_metas_11_replace_info;
        _zz_icache_tag_3 = ways_3_metas_11_tag;
        _zz_icache_hit_3 = ways_3_metas_11_valid;
        _zz_icache_replace_info_3 = ways_3_metas_11_replace_info;
      end
      4'b1100 : begin
        _zz_icache_tag_0 = ways_0_metas_12_tag;
        _zz_icache_hit_0 = ways_0_metas_12_valid;
        _zz_icache_replace_info_0 = ways_0_metas_12_replace_info;
        _zz_icache_tag_1 = ways_1_metas_12_tag;
        _zz_icache_hit_1 = ways_1_metas_12_valid;
        _zz_icache_replace_info_1 = ways_1_metas_12_replace_info;
        _zz_icache_tag_2 = ways_2_metas_12_tag;
        _zz_icache_hit_2 = ways_2_metas_12_valid;
        _zz_icache_replace_info_2 = ways_2_metas_12_replace_info;
        _zz_icache_tag_3 = ways_3_metas_12_tag;
        _zz_icache_hit_3 = ways_3_metas_12_valid;
        _zz_icache_replace_info_3 = ways_3_metas_12_replace_info;
      end
      4'b1101 : begin
        _zz_icache_tag_0 = ways_0_metas_13_tag;
        _zz_icache_hit_0 = ways_0_metas_13_valid;
        _zz_icache_replace_info_0 = ways_0_metas_13_replace_info;
        _zz_icache_tag_1 = ways_1_metas_13_tag;
        _zz_icache_hit_1 = ways_1_metas_13_valid;
        _zz_icache_replace_info_1 = ways_1_metas_13_replace_info;
        _zz_icache_tag_2 = ways_2_metas_13_tag;
        _zz_icache_hit_2 = ways_2_metas_13_valid;
        _zz_icache_replace_info_2 = ways_2_metas_13_replace_info;
        _zz_icache_tag_3 = ways_3_metas_13_tag;
        _zz_icache_hit_3 = ways_3_metas_13_valid;
        _zz_icache_replace_info_3 = ways_3_metas_13_replace_info;
      end
      4'b1110 : begin
        _zz_icache_tag_0 = ways_0_metas_14_tag;
        _zz_icache_hit_0 = ways_0_metas_14_valid;
        _zz_icache_replace_info_0 = ways_0_metas_14_replace_info;
        _zz_icache_tag_1 = ways_1_metas_14_tag;
        _zz_icache_hit_1 = ways_1_metas_14_valid;
        _zz_icache_replace_info_1 = ways_1_metas_14_replace_info;
        _zz_icache_tag_2 = ways_2_metas_14_tag;
        _zz_icache_hit_2 = ways_2_metas_14_valid;
        _zz_icache_replace_info_2 = ways_2_metas_14_replace_info;
        _zz_icache_tag_3 = ways_3_metas_14_tag;
        _zz_icache_hit_3 = ways_3_metas_14_valid;
        _zz_icache_replace_info_3 = ways_3_metas_14_replace_info;
      end
      default : begin
        _zz_icache_tag_0 = ways_0_metas_15_tag;
        _zz_icache_hit_0 = ways_0_metas_15_valid;
        _zz_icache_replace_info_0 = ways_0_metas_15_replace_info;
        _zz_icache_tag_1 = ways_1_metas_15_tag;
        _zz_icache_hit_1 = ways_1_metas_15_valid;
        _zz_icache_replace_info_1 = ways_1_metas_15_replace_info;
        _zz_icache_tag_2 = ways_2_metas_15_tag;
        _zz_icache_hit_2 = ways_2_metas_15_valid;
        _zz_icache_replace_info_2 = ways_2_metas_15_replace_info;
        _zz_icache_tag_3 = ways_3_metas_15_tag;
        _zz_icache_hit_3 = ways_3_metas_15_valid;
        _zz_icache_replace_info_3 = ways_3_metas_15_replace_info;
      end
    endcase
  end

  always @(*) begin
    case(cpu_set_d1)
      4'b0000 : begin
        _zz_icache_victim_0 = ways_0_metas_0_valid;
        _zz_icache_victim_1 = ways_1_metas_0_valid;
        _zz_icache_victim_2 = ways_2_metas_0_valid;
        _zz_icache_victim_3 = ways_3_metas_0_valid;
      end
      4'b0001 : begin
        _zz_icache_victim_0 = ways_0_metas_1_valid;
        _zz_icache_victim_1 = ways_1_metas_1_valid;
        _zz_icache_victim_2 = ways_2_metas_1_valid;
        _zz_icache_victim_3 = ways_3_metas_1_valid;
      end
      4'b0010 : begin
        _zz_icache_victim_0 = ways_0_metas_2_valid;
        _zz_icache_victim_1 = ways_1_metas_2_valid;
        _zz_icache_victim_2 = ways_2_metas_2_valid;
        _zz_icache_victim_3 = ways_3_metas_2_valid;
      end
      4'b0011 : begin
        _zz_icache_victim_0 = ways_0_metas_3_valid;
        _zz_icache_victim_1 = ways_1_metas_3_valid;
        _zz_icache_victim_2 = ways_2_metas_3_valid;
        _zz_icache_victim_3 = ways_3_metas_3_valid;
      end
      4'b0100 : begin
        _zz_icache_victim_0 = ways_0_metas_4_valid;
        _zz_icache_victim_1 = ways_1_metas_4_valid;
        _zz_icache_victim_2 = ways_2_metas_4_valid;
        _zz_icache_victim_3 = ways_3_metas_4_valid;
      end
      4'b0101 : begin
        _zz_icache_victim_0 = ways_0_metas_5_valid;
        _zz_icache_victim_1 = ways_1_metas_5_valid;
        _zz_icache_victim_2 = ways_2_metas_5_valid;
        _zz_icache_victim_3 = ways_3_metas_5_valid;
      end
      4'b0110 : begin
        _zz_icache_victim_0 = ways_0_metas_6_valid;
        _zz_icache_victim_1 = ways_1_metas_6_valid;
        _zz_icache_victim_2 = ways_2_metas_6_valid;
        _zz_icache_victim_3 = ways_3_metas_6_valid;
      end
      4'b0111 : begin
        _zz_icache_victim_0 = ways_0_metas_7_valid;
        _zz_icache_victim_1 = ways_1_metas_7_valid;
        _zz_icache_victim_2 = ways_2_metas_7_valid;
        _zz_icache_victim_3 = ways_3_metas_7_valid;
      end
      4'b1000 : begin
        _zz_icache_victim_0 = ways_0_metas_8_valid;
        _zz_icache_victim_1 = ways_1_metas_8_valid;
        _zz_icache_victim_2 = ways_2_metas_8_valid;
        _zz_icache_victim_3 = ways_3_metas_8_valid;
      end
      4'b1001 : begin
        _zz_icache_victim_0 = ways_0_metas_9_valid;
        _zz_icache_victim_1 = ways_1_metas_9_valid;
        _zz_icache_victim_2 = ways_2_metas_9_valid;
        _zz_icache_victim_3 = ways_3_metas_9_valid;
      end
      4'b1010 : begin
        _zz_icache_victim_0 = ways_0_metas_10_valid;
        _zz_icache_victim_1 = ways_1_metas_10_valid;
        _zz_icache_victim_2 = ways_2_metas_10_valid;
        _zz_icache_victim_3 = ways_3_metas_10_valid;
      end
      4'b1011 : begin
        _zz_icache_victim_0 = ways_0_metas_11_valid;
        _zz_icache_victim_1 = ways_1_metas_11_valid;
        _zz_icache_victim_2 = ways_2_metas_11_valid;
        _zz_icache_victim_3 = ways_3_metas_11_valid;
      end
      4'b1100 : begin
        _zz_icache_victim_0 = ways_0_metas_12_valid;
        _zz_icache_victim_1 = ways_1_metas_12_valid;
        _zz_icache_victim_2 = ways_2_metas_12_valid;
        _zz_icache_victim_3 = ways_3_metas_12_valid;
      end
      4'b1101 : begin
        _zz_icache_victim_0 = ways_0_metas_13_valid;
        _zz_icache_victim_1 = ways_1_metas_13_valid;
        _zz_icache_victim_2 = ways_2_metas_13_valid;
        _zz_icache_victim_3 = ways_3_metas_13_valid;
      end
      4'b1110 : begin
        _zz_icache_victim_0 = ways_0_metas_14_valid;
        _zz_icache_victim_1 = ways_1_metas_14_valid;
        _zz_icache_victim_2 = ways_2_metas_14_valid;
        _zz_icache_victim_3 = ways_3_metas_14_valid;
      end
      default : begin
        _zz_icache_victim_0 = ways_0_metas_15_valid;
        _zz_icache_victim_1 = ways_1_metas_15_valid;
        _zz_icache_victim_2 = ways_2_metas_15_valid;
        _zz_icache_victim_3 = ways_3_metas_15_valid;
      end
    endcase
  end

  always @(*) begin
    case(hit_way_id)
      2'b00 : begin
        _zz__zz_cpu_rsp_payload_data = sram_banks_data_0;
        _zz_cpu_rsp_valid = sram_banks_valid_0;
      end
      2'b01 : begin
        _zz__zz_cpu_rsp_payload_data = sram_banks_data_1;
        _zz_cpu_rsp_valid = sram_banks_valid_1;
      end
      2'b10 : begin
        _zz__zz_cpu_rsp_payload_data = sram_banks_data_2;
        _zz_cpu_rsp_valid = sram_banks_valid_2;
      end
      default : begin
        _zz__zz_cpu_rsp_payload_data = sram_banks_data_3;
        _zz_cpu_rsp_valid = sram_banks_valid_3;
      end
    endcase
  end

  always @(*) begin
    case(cpu_bank_sel)
      3'b000 : _zz_cpu_rsp_payload_data_1 = _zz_cpu_rsp_payload_data[31 : 0];
      3'b001 : _zz_cpu_rsp_payload_data_1 = _zz_cpu_rsp_payload_data[63 : 32];
      3'b010 : _zz_cpu_rsp_payload_data_1 = _zz_cpu_rsp_payload_data[95 : 64];
      3'b011 : _zz_cpu_rsp_payload_data_1 = _zz_cpu_rsp_payload_data[127 : 96];
      3'b100 : _zz_cpu_rsp_payload_data_1 = _zz_cpu_rsp_payload_data[159 : 128];
      3'b101 : _zz_cpu_rsp_payload_data_1 = _zz_cpu_rsp_payload_data[191 : 160];
      3'b110 : _zz_cpu_rsp_payload_data_1 = _zz_cpu_rsp_payload_data[223 : 192];
      default : _zz_cpu_rsp_payload_data_1 = _zz_cpu_rsp_payload_data[255 : 224];
    endcase
  end

  assign ways_0_metas_0_tag = 54'h0;
  assign ways_0_metas_1_tag = 54'h0;
  assign ways_0_metas_2_tag = 54'h0;
  assign ways_0_metas_3_tag = 54'h0;
  assign ways_0_metas_4_tag = 54'h0;
  assign ways_0_metas_5_tag = 54'h0;
  assign ways_0_metas_6_tag = 54'h0;
  assign ways_0_metas_7_tag = 54'h0;
  assign ways_0_metas_8_tag = 54'h0;
  assign ways_0_metas_9_tag = 54'h0;
  assign ways_0_metas_10_tag = 54'h0;
  assign ways_0_metas_11_tag = 54'h0;
  assign ways_0_metas_12_tag = 54'h0;
  assign ways_0_metas_13_tag = 54'h0;
  assign ways_0_metas_14_tag = 54'h0;
  assign ways_0_metas_15_tag = 54'h0;
  assign ways_1_metas_0_tag = 54'h0;
  assign ways_1_metas_1_tag = 54'h0;
  assign ways_1_metas_2_tag = 54'h0;
  assign ways_1_metas_3_tag = 54'h0;
  assign ways_1_metas_4_tag = 54'h0;
  assign ways_1_metas_5_tag = 54'h0;
  assign ways_1_metas_6_tag = 54'h0;
  assign ways_1_metas_7_tag = 54'h0;
  assign ways_1_metas_8_tag = 54'h0;
  assign ways_1_metas_9_tag = 54'h0;
  assign ways_1_metas_10_tag = 54'h0;
  assign ways_1_metas_11_tag = 54'h0;
  assign ways_1_metas_12_tag = 54'h0;
  assign ways_1_metas_13_tag = 54'h0;
  assign ways_1_metas_14_tag = 54'h0;
  assign ways_1_metas_15_tag = 54'h0;
  assign ways_2_metas_0_tag = 54'h0;
  assign ways_2_metas_1_tag = 54'h0;
  assign ways_2_metas_2_tag = 54'h0;
  assign ways_2_metas_3_tag = 54'h0;
  assign ways_2_metas_4_tag = 54'h0;
  assign ways_2_metas_5_tag = 54'h0;
  assign ways_2_metas_6_tag = 54'h0;
  assign ways_2_metas_7_tag = 54'h0;
  assign ways_2_metas_8_tag = 54'h0;
  assign ways_2_metas_9_tag = 54'h0;
  assign ways_2_metas_10_tag = 54'h0;
  assign ways_2_metas_11_tag = 54'h0;
  assign ways_2_metas_12_tag = 54'h0;
  assign ways_2_metas_13_tag = 54'h0;
  assign ways_2_metas_14_tag = 54'h0;
  assign ways_2_metas_15_tag = 54'h0;
  assign ways_3_metas_0_tag = 54'h0;
  assign ways_3_metas_1_tag = 54'h0;
  assign ways_3_metas_2_tag = 54'h0;
  assign ways_3_metas_3_tag = 54'h0;
  assign ways_3_metas_4_tag = 54'h0;
  assign ways_3_metas_5_tag = 54'h0;
  assign ways_3_metas_6_tag = 54'h0;
  assign ways_3_metas_7_tag = 54'h0;
  assign ways_3_metas_8_tag = 54'h0;
  assign ways_3_metas_9_tag = 54'h0;
  assign ways_3_metas_10_tag = 54'h0;
  assign ways_3_metas_11_tag = 54'h0;
  assign ways_3_metas_12_tag = 54'h0;
  assign ways_3_metas_13_tag = 54'h0;
  assign ways_3_metas_14_tag = 54'h0;
  assign ways_3_metas_15_tag = 54'h0;
  assign replace_info_full = (&{icache_replace_info_3,{icache_replace_info_2,{icache_replace_info_1,icache_replace_info_0}}});
  assign cpu_cmd_fire = (cpu_cmd_valid && cpu_cmd_ready);
  assign is_hit = ((|{icache_hit_3,{icache_hit_2,{icache_hit_1,icache_hit_0}}}) && cpu_cmd_fire);
  assign cpu_cmd_fire_1 = (cpu_cmd_valid && cpu_cmd_ready);
  assign is_miss = ((! (|{icache_hit_3,{icache_hit_2,{icache_hit_1,icache_hit_0}}})) && cpu_cmd_fire_1);
  assign cpu_tag = cpu_cmd_payload_addr[63 : 10];
  assign cpu_set = cpu_cmd_payload_addr[9 : 6];
  assign cpu_bank_offset = cpu_cmd_payload_addr[4 : 0];
  assign cpu_bank_addr = cpu_cmd_payload_addr[6 : 5];
  assign cpu_bank_sel = cpu_cmd_payload_addr[4 : 2];
  assign cpu_set_d1 = cpu_addr_d1[9 : 6];
  assign next_level_cmd_fire = (next_level_cmd_valid && next_level_cmd_ready);
  assign _zz_hit_way_id = (icache_hit_1 || icache_hit_3);
  assign _zz_hit_way_id_1 = (icache_hit_2 || icache_hit_3);
  assign hit_way_id = {_zz_hit_way_id_1,_zz_hit_way_id};
  assign _zz_1 = ({15'd0,1'b1} <<< cpu_set);
  assign _zz_2 = _zz_1[0];
  assign _zz_3 = _zz_1[1];
  assign _zz_4 = _zz_1[2];
  assign _zz_5 = _zz_1[3];
  assign _zz_6 = _zz_1[4];
  assign _zz_7 = _zz_1[5];
  assign _zz_8 = _zz_1[6];
  assign _zz_9 = _zz_1[7];
  assign _zz_10 = _zz_1[8];
  assign _zz_11 = _zz_1[9];
  assign _zz_12 = _zz_1[10];
  assign _zz_13 = _zz_1[11];
  assign _zz_14 = _zz_1[12];
  assign _zz_15 = _zz_1[13];
  assign _zz_16 = _zz_1[14];
  assign _zz_17 = _zz_1[15];
  assign icache_tag_0 = _zz_icache_tag_0;
  assign icache_hit_0 = ((icache_tag_0 == cpu_tag) && _zz_icache_hit_0);
  assign icache_replace_info_0 = _zz_icache_replace_info_0;
  assign _zz_18 = ({15'd0,1'b1} <<< cpu_set_d1);
  assign icache_victim_0 = (! _zz_icache_victim_0);
  assign sram_banks_data_0 = sram_0_ports_rsp_payload_data;
  assign sram_banks_valid_0 = sram_0_ports_rsp_valid;
  always @(*) begin
    if(is_hit) begin
      sram_0_ports_cmd_payload_addr = (icache_hit_0 ? cpu_bank_addr : 2'b00);
    end else begin
      if(next_level_rsp_valid) begin
        sram_0_ports_cmd_payload_addr = cpu_bank_addr;
      end else begin
        sram_0_ports_cmd_payload_addr = 2'b00;
      end
    end
  end

  assign cpu_cmd_fire_2 = (cpu_cmd_valid && cpu_cmd_ready);
  always @(*) begin
    if(is_hit) begin
      sram_0_ports_cmd_valid = (icache_hit_0 && cpu_cmd_fire_2);
    end else begin
      if(next_level_rsp_valid) begin
        sram_0_ports_cmd_valid = 1'b1;
      end else begin
        sram_0_ports_cmd_valid = 1'b0;
      end
    end
  end

  always @(*) begin
    if(is_hit) begin
      sram_0_ports_cmd_payload_wen = 1'b0;
    end else begin
      if(next_level_rsp_valid) begin
        sram_0_ports_cmd_payload_wen = 1'b1;
      end else begin
        sram_0_ports_cmd_payload_wen = 1'b0;
      end
    end
  end

  assign when_ICache_l179 = (is_hit && replace_info_full);
  assign _zz_19 = ({15'd0,1'b1} <<< cpu_set);
  assign _zz_20 = _zz_19[0];
  assign _zz_21 = _zz_19[1];
  assign _zz_22 = _zz_19[2];
  assign _zz_23 = _zz_19[3];
  assign _zz_24 = _zz_19[4];
  assign _zz_25 = _zz_19[5];
  assign _zz_26 = _zz_19[6];
  assign _zz_27 = _zz_19[7];
  assign _zz_28 = _zz_19[8];
  assign _zz_29 = _zz_19[9];
  assign _zz_30 = _zz_19[10];
  assign _zz_31 = _zz_19[11];
  assign _zz_32 = _zz_19[12];
  assign _zz_33 = _zz_19[13];
  assign _zz_34 = _zz_19[14];
  assign _zz_35 = _zz_19[15];
  assign icache_tag_1 = _zz_icache_tag_1;
  assign icache_hit_1 = ((icache_tag_1 == cpu_tag) && _zz_icache_hit_1);
  assign icache_replace_info_1 = _zz_icache_replace_info_1;
  always @(*) begin
    if(icache_victim_0) begin
      icache_victim_1 = 1'b0;
    end else begin
      icache_victim_1 = (! _zz_icache_victim_1);
    end
  end

  assign _zz_36 = ({15'd0,1'b1} <<< cpu_set_d1);
  assign sram_banks_data_1 = sram_1_ports_rsp_payload_data;
  assign sram_banks_valid_1 = sram_1_ports_rsp_valid;
  always @(*) begin
    if(is_hit) begin
      sram_1_ports_cmd_payload_addr = (icache_hit_1 ? cpu_bank_addr : 2'b00);
    end else begin
      if(next_level_rsp_valid) begin
        sram_1_ports_cmd_payload_addr = cpu_bank_addr;
      end else begin
        sram_1_ports_cmd_payload_addr = 2'b00;
      end
    end
  end

  assign cpu_cmd_fire_3 = (cpu_cmd_valid && cpu_cmd_ready);
  always @(*) begin
    if(is_hit) begin
      sram_1_ports_cmd_valid = (icache_hit_1 && cpu_cmd_fire_3);
    end else begin
      if(next_level_rsp_valid) begin
        sram_1_ports_cmd_valid = 1'b1;
      end else begin
        sram_1_ports_cmd_valid = 1'b0;
      end
    end
  end

  always @(*) begin
    if(is_hit) begin
      sram_1_ports_cmd_payload_wen = 1'b0;
    end else begin
      if(next_level_rsp_valid) begin
        sram_1_ports_cmd_payload_wen = 1'b1;
      end else begin
        sram_1_ports_cmd_payload_wen = 1'b0;
      end
    end
  end

  assign when_ICache_l179_1 = (is_hit && replace_info_full);
  assign _zz_37 = ({15'd0,1'b1} <<< cpu_set);
  assign _zz_38 = _zz_37[0];
  assign _zz_39 = _zz_37[1];
  assign _zz_40 = _zz_37[2];
  assign _zz_41 = _zz_37[3];
  assign _zz_42 = _zz_37[4];
  assign _zz_43 = _zz_37[5];
  assign _zz_44 = _zz_37[6];
  assign _zz_45 = _zz_37[7];
  assign _zz_46 = _zz_37[8];
  assign _zz_47 = _zz_37[9];
  assign _zz_48 = _zz_37[10];
  assign _zz_49 = _zz_37[11];
  assign _zz_50 = _zz_37[12];
  assign _zz_51 = _zz_37[13];
  assign _zz_52 = _zz_37[14];
  assign _zz_53 = _zz_37[15];
  assign icache_tag_2 = _zz_icache_tag_2;
  assign icache_hit_2 = ((icache_tag_2 == cpu_tag) && _zz_icache_hit_2);
  assign icache_replace_info_2 = _zz_icache_replace_info_2;
  always @(*) begin
    if(icache_victim_1) begin
      icache_victim_2 = 1'b0;
    end else begin
      icache_victim_2 = (! _zz_icache_victim_2);
    end
  end

  assign _zz_54 = ({15'd0,1'b1} <<< cpu_set_d1);
  assign sram_banks_data_2 = sram_2_ports_rsp_payload_data;
  assign sram_banks_valid_2 = sram_2_ports_rsp_valid;
  always @(*) begin
    if(is_hit) begin
      sram_2_ports_cmd_payload_addr = (icache_hit_2 ? cpu_bank_addr : 2'b00);
    end else begin
      if(next_level_rsp_valid) begin
        sram_2_ports_cmd_payload_addr = cpu_bank_addr;
      end else begin
        sram_2_ports_cmd_payload_addr = 2'b00;
      end
    end
  end

  assign cpu_cmd_fire_4 = (cpu_cmd_valid && cpu_cmd_ready);
  always @(*) begin
    if(is_hit) begin
      sram_2_ports_cmd_valid = (icache_hit_2 && cpu_cmd_fire_4);
    end else begin
      if(next_level_rsp_valid) begin
        sram_2_ports_cmd_valid = 1'b1;
      end else begin
        sram_2_ports_cmd_valid = 1'b0;
      end
    end
  end

  always @(*) begin
    if(is_hit) begin
      sram_2_ports_cmd_payload_wen = 1'b0;
    end else begin
      if(next_level_rsp_valid) begin
        sram_2_ports_cmd_payload_wen = 1'b1;
      end else begin
        sram_2_ports_cmd_payload_wen = 1'b0;
      end
    end
  end

  assign when_ICache_l179_2 = (is_hit && replace_info_full);
  assign _zz_55 = ({15'd0,1'b1} <<< cpu_set);
  assign _zz_56 = _zz_55[0];
  assign _zz_57 = _zz_55[1];
  assign _zz_58 = _zz_55[2];
  assign _zz_59 = _zz_55[3];
  assign _zz_60 = _zz_55[4];
  assign _zz_61 = _zz_55[5];
  assign _zz_62 = _zz_55[6];
  assign _zz_63 = _zz_55[7];
  assign _zz_64 = _zz_55[8];
  assign _zz_65 = _zz_55[9];
  assign _zz_66 = _zz_55[10];
  assign _zz_67 = _zz_55[11];
  assign _zz_68 = _zz_55[12];
  assign _zz_69 = _zz_55[13];
  assign _zz_70 = _zz_55[14];
  assign _zz_71 = _zz_55[15];
  assign icache_tag_3 = _zz_icache_tag_3;
  assign icache_hit_3 = ((icache_tag_3 == cpu_tag) && _zz_icache_hit_3);
  assign icache_replace_info_3 = _zz_icache_replace_info_3;
  always @(*) begin
    if(icache_victim_2) begin
      icache_victim_3 = 1'b0;
    end else begin
      icache_victim_3 = (! _zz_icache_victim_3);
    end
  end

  assign _zz_72 = ({15'd0,1'b1} <<< cpu_set_d1);
  assign sram_banks_data_3 = sram_3_ports_rsp_payload_data;
  assign sram_banks_valid_3 = sram_3_ports_rsp_valid;
  always @(*) begin
    if(is_hit) begin
      sram_3_ports_cmd_payload_addr = (icache_hit_3 ? cpu_bank_addr : 2'b00);
    end else begin
      if(next_level_rsp_valid) begin
        sram_3_ports_cmd_payload_addr = cpu_bank_addr;
      end else begin
        sram_3_ports_cmd_payload_addr = 2'b00;
      end
    end
  end

  assign cpu_cmd_fire_5 = (cpu_cmd_valid && cpu_cmd_ready);
  always @(*) begin
    if(is_hit) begin
      sram_3_ports_cmd_valid = (icache_hit_3 && cpu_cmd_fire_5);
    end else begin
      if(next_level_rsp_valid) begin
        sram_3_ports_cmd_valid = 1'b1;
      end else begin
        sram_3_ports_cmd_valid = 1'b0;
      end
    end
  end

  always @(*) begin
    if(is_hit) begin
      sram_3_ports_cmd_payload_wen = 1'b0;
    end else begin
      if(next_level_rsp_valid) begin
        sram_3_ports_cmd_payload_wen = 1'b1;
      end else begin
        sram_3_ports_cmd_payload_wen = 1'b0;
      end
    end
  end

  assign when_ICache_l179_3 = (is_hit && replace_info_full);
  assign _zz_cpu_rsp_payload_data = _zz__zz_cpu_rsp_payload_data;
  assign cpu_rsp_payload_data = _zz_cpu_rsp_payload_data_1;
  assign cpu_rsp_valid = _zz_cpu_rsp_valid;
  assign cpu_cmd_ready = cpu_cmd_ready_1;
  assign next_level_cmd_payload_addr = cpu_addr_d1;
  assign next_level_cmd_valid = next_level_cmd_valid_1;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      ways_0_metas_0_valid <= 1'b0;
      ways_0_metas_0_replace_info <= 1'b0;
      ways_0_metas_1_valid <= 1'b0;
      ways_0_metas_1_replace_info <= 1'b0;
      ways_0_metas_2_valid <= 1'b0;
      ways_0_metas_2_replace_info <= 1'b0;
      ways_0_metas_3_valid <= 1'b0;
      ways_0_metas_3_replace_info <= 1'b0;
      ways_0_metas_4_valid <= 1'b0;
      ways_0_metas_4_replace_info <= 1'b0;
      ways_0_metas_5_valid <= 1'b0;
      ways_0_metas_5_replace_info <= 1'b0;
      ways_0_metas_6_valid <= 1'b0;
      ways_0_metas_6_replace_info <= 1'b0;
      ways_0_metas_7_valid <= 1'b0;
      ways_0_metas_7_replace_info <= 1'b0;
      ways_0_metas_8_valid <= 1'b0;
      ways_0_metas_8_replace_info <= 1'b0;
      ways_0_metas_9_valid <= 1'b0;
      ways_0_metas_9_replace_info <= 1'b0;
      ways_0_metas_10_valid <= 1'b0;
      ways_0_metas_10_replace_info <= 1'b0;
      ways_0_metas_11_valid <= 1'b0;
      ways_0_metas_11_replace_info <= 1'b0;
      ways_0_metas_12_valid <= 1'b0;
      ways_0_metas_12_replace_info <= 1'b0;
      ways_0_metas_13_valid <= 1'b0;
      ways_0_metas_13_replace_info <= 1'b0;
      ways_0_metas_14_valid <= 1'b0;
      ways_0_metas_14_replace_info <= 1'b0;
      ways_0_metas_15_valid <= 1'b0;
      ways_0_metas_15_replace_info <= 1'b0;
      ways_1_metas_0_valid <= 1'b0;
      ways_1_metas_0_replace_info <= 1'b0;
      ways_1_metas_1_valid <= 1'b0;
      ways_1_metas_1_replace_info <= 1'b0;
      ways_1_metas_2_valid <= 1'b0;
      ways_1_metas_2_replace_info <= 1'b0;
      ways_1_metas_3_valid <= 1'b0;
      ways_1_metas_3_replace_info <= 1'b0;
      ways_1_metas_4_valid <= 1'b0;
      ways_1_metas_4_replace_info <= 1'b0;
      ways_1_metas_5_valid <= 1'b0;
      ways_1_metas_5_replace_info <= 1'b0;
      ways_1_metas_6_valid <= 1'b0;
      ways_1_metas_6_replace_info <= 1'b0;
      ways_1_metas_7_valid <= 1'b0;
      ways_1_metas_7_replace_info <= 1'b0;
      ways_1_metas_8_valid <= 1'b0;
      ways_1_metas_8_replace_info <= 1'b0;
      ways_1_metas_9_valid <= 1'b0;
      ways_1_metas_9_replace_info <= 1'b0;
      ways_1_metas_10_valid <= 1'b0;
      ways_1_metas_10_replace_info <= 1'b0;
      ways_1_metas_11_valid <= 1'b0;
      ways_1_metas_11_replace_info <= 1'b0;
      ways_1_metas_12_valid <= 1'b0;
      ways_1_metas_12_replace_info <= 1'b0;
      ways_1_metas_13_valid <= 1'b0;
      ways_1_metas_13_replace_info <= 1'b0;
      ways_1_metas_14_valid <= 1'b0;
      ways_1_metas_14_replace_info <= 1'b0;
      ways_1_metas_15_valid <= 1'b0;
      ways_1_metas_15_replace_info <= 1'b0;
      ways_2_metas_0_valid <= 1'b0;
      ways_2_metas_0_replace_info <= 1'b0;
      ways_2_metas_1_valid <= 1'b0;
      ways_2_metas_1_replace_info <= 1'b0;
      ways_2_metas_2_valid <= 1'b0;
      ways_2_metas_2_replace_info <= 1'b0;
      ways_2_metas_3_valid <= 1'b0;
      ways_2_metas_3_replace_info <= 1'b0;
      ways_2_metas_4_valid <= 1'b0;
      ways_2_metas_4_replace_info <= 1'b0;
      ways_2_metas_5_valid <= 1'b0;
      ways_2_metas_5_replace_info <= 1'b0;
      ways_2_metas_6_valid <= 1'b0;
      ways_2_metas_6_replace_info <= 1'b0;
      ways_2_metas_7_valid <= 1'b0;
      ways_2_metas_7_replace_info <= 1'b0;
      ways_2_metas_8_valid <= 1'b0;
      ways_2_metas_8_replace_info <= 1'b0;
      ways_2_metas_9_valid <= 1'b0;
      ways_2_metas_9_replace_info <= 1'b0;
      ways_2_metas_10_valid <= 1'b0;
      ways_2_metas_10_replace_info <= 1'b0;
      ways_2_metas_11_valid <= 1'b0;
      ways_2_metas_11_replace_info <= 1'b0;
      ways_2_metas_12_valid <= 1'b0;
      ways_2_metas_12_replace_info <= 1'b0;
      ways_2_metas_13_valid <= 1'b0;
      ways_2_metas_13_replace_info <= 1'b0;
      ways_2_metas_14_valid <= 1'b0;
      ways_2_metas_14_replace_info <= 1'b0;
      ways_2_metas_15_valid <= 1'b0;
      ways_2_metas_15_replace_info <= 1'b0;
      ways_3_metas_0_valid <= 1'b0;
      ways_3_metas_0_replace_info <= 1'b0;
      ways_3_metas_1_valid <= 1'b0;
      ways_3_metas_1_replace_info <= 1'b0;
      ways_3_metas_2_valid <= 1'b0;
      ways_3_metas_2_replace_info <= 1'b0;
      ways_3_metas_3_valid <= 1'b0;
      ways_3_metas_3_replace_info <= 1'b0;
      ways_3_metas_4_valid <= 1'b0;
      ways_3_metas_4_replace_info <= 1'b0;
      ways_3_metas_5_valid <= 1'b0;
      ways_3_metas_5_replace_info <= 1'b0;
      ways_3_metas_6_valid <= 1'b0;
      ways_3_metas_6_replace_info <= 1'b0;
      ways_3_metas_7_valid <= 1'b0;
      ways_3_metas_7_replace_info <= 1'b0;
      ways_3_metas_8_valid <= 1'b0;
      ways_3_metas_8_replace_info <= 1'b0;
      ways_3_metas_9_valid <= 1'b0;
      ways_3_metas_9_replace_info <= 1'b0;
      ways_3_metas_10_valid <= 1'b0;
      ways_3_metas_10_replace_info <= 1'b0;
      ways_3_metas_11_valid <= 1'b0;
      ways_3_metas_11_replace_info <= 1'b0;
      ways_3_metas_12_valid <= 1'b0;
      ways_3_metas_12_replace_info <= 1'b0;
      ways_3_metas_13_valid <= 1'b0;
      ways_3_metas_13_replace_info <= 1'b0;
      ways_3_metas_14_valid <= 1'b0;
      ways_3_metas_14_replace_info <= 1'b0;
      ways_3_metas_15_valid <= 1'b0;
      ways_3_metas_15_replace_info <= 1'b0;
      cpu_addr_d1 <= 64'h0;
      cpu_cmd_ready_1 <= 1'b1;
      next_level_cmd_valid_1 <= 1'b0;
    end else begin
      if(is_miss) begin
        cpu_addr_d1 <= cpu_cmd_payload_addr;
      end
      if(is_miss) begin
        next_level_cmd_valid_1 <= 1'b1;
      end else begin
        if(next_level_cmd_fire) begin
          next_level_cmd_valid_1 <= 1'b0;
        end
      end
      if(when_ICache_l179) begin
        if(icache_hit_0) begin
          if(_zz_2) begin
            ways_0_metas_0_replace_info <= 1'b1;
          end
          if(_zz_3) begin
            ways_0_metas_1_replace_info <= 1'b1;
          end
          if(_zz_4) begin
            ways_0_metas_2_replace_info <= 1'b1;
          end
          if(_zz_5) begin
            ways_0_metas_3_replace_info <= 1'b1;
          end
          if(_zz_6) begin
            ways_0_metas_4_replace_info <= 1'b1;
          end
          if(_zz_7) begin
            ways_0_metas_5_replace_info <= 1'b1;
          end
          if(_zz_8) begin
            ways_0_metas_6_replace_info <= 1'b1;
          end
          if(_zz_9) begin
            ways_0_metas_7_replace_info <= 1'b1;
          end
          if(_zz_10) begin
            ways_0_metas_8_replace_info <= 1'b1;
          end
          if(_zz_11) begin
            ways_0_metas_9_replace_info <= 1'b1;
          end
          if(_zz_12) begin
            ways_0_metas_10_replace_info <= 1'b1;
          end
          if(_zz_13) begin
            ways_0_metas_11_replace_info <= 1'b1;
          end
          if(_zz_14) begin
            ways_0_metas_12_replace_info <= 1'b1;
          end
          if(_zz_15) begin
            ways_0_metas_13_replace_info <= 1'b1;
          end
          if(_zz_16) begin
            ways_0_metas_14_replace_info <= 1'b1;
          end
          if(_zz_17) begin
            ways_0_metas_15_replace_info <= 1'b1;
          end
        end else begin
          if(_zz_2) begin
            ways_0_metas_0_replace_info <= 1'b0;
          end
          if(_zz_3) begin
            ways_0_metas_1_replace_info <= 1'b0;
          end
          if(_zz_4) begin
            ways_0_metas_2_replace_info <= 1'b0;
          end
          if(_zz_5) begin
            ways_0_metas_3_replace_info <= 1'b0;
          end
          if(_zz_6) begin
            ways_0_metas_4_replace_info <= 1'b0;
          end
          if(_zz_7) begin
            ways_0_metas_5_replace_info <= 1'b0;
          end
          if(_zz_8) begin
            ways_0_metas_6_replace_info <= 1'b0;
          end
          if(_zz_9) begin
            ways_0_metas_7_replace_info <= 1'b0;
          end
          if(_zz_10) begin
            ways_0_metas_8_replace_info <= 1'b0;
          end
          if(_zz_11) begin
            ways_0_metas_9_replace_info <= 1'b0;
          end
          if(_zz_12) begin
            ways_0_metas_10_replace_info <= 1'b0;
          end
          if(_zz_13) begin
            ways_0_metas_11_replace_info <= 1'b0;
          end
          if(_zz_14) begin
            ways_0_metas_12_replace_info <= 1'b0;
          end
          if(_zz_15) begin
            ways_0_metas_13_replace_info <= 1'b0;
          end
          if(_zz_16) begin
            ways_0_metas_14_replace_info <= 1'b0;
          end
          if(_zz_17) begin
            ways_0_metas_15_replace_info <= 1'b0;
          end
        end
      end else begin
        if(is_hit) begin
          if(icache_hit_0) begin
            if(_zz_2) begin
              ways_0_metas_0_replace_info <= 1'b1;
            end
            if(_zz_3) begin
              ways_0_metas_1_replace_info <= 1'b1;
            end
            if(_zz_4) begin
              ways_0_metas_2_replace_info <= 1'b1;
            end
            if(_zz_5) begin
              ways_0_metas_3_replace_info <= 1'b1;
            end
            if(_zz_6) begin
              ways_0_metas_4_replace_info <= 1'b1;
            end
            if(_zz_7) begin
              ways_0_metas_5_replace_info <= 1'b1;
            end
            if(_zz_8) begin
              ways_0_metas_6_replace_info <= 1'b1;
            end
            if(_zz_9) begin
              ways_0_metas_7_replace_info <= 1'b1;
            end
            if(_zz_10) begin
              ways_0_metas_8_replace_info <= 1'b1;
            end
            if(_zz_11) begin
              ways_0_metas_9_replace_info <= 1'b1;
            end
            if(_zz_12) begin
              ways_0_metas_10_replace_info <= 1'b1;
            end
            if(_zz_13) begin
              ways_0_metas_11_replace_info <= 1'b1;
            end
            if(_zz_14) begin
              ways_0_metas_12_replace_info <= 1'b1;
            end
            if(_zz_15) begin
              ways_0_metas_13_replace_info <= 1'b1;
            end
            if(_zz_16) begin
              ways_0_metas_14_replace_info <= 1'b1;
            end
            if(_zz_17) begin
              ways_0_metas_15_replace_info <= 1'b1;
            end
          end
        end else begin
          if(next_level_rsp_valid) begin
            if(icache_victim_0) begin
              if(_zz_18[0]) begin
                ways_0_metas_0_valid <= 1'b1;
              end
              if(_zz_18[1]) begin
                ways_0_metas_1_valid <= 1'b1;
              end
              if(_zz_18[2]) begin
                ways_0_metas_2_valid <= 1'b1;
              end
              if(_zz_18[3]) begin
                ways_0_metas_3_valid <= 1'b1;
              end
              if(_zz_18[4]) begin
                ways_0_metas_4_valid <= 1'b1;
              end
              if(_zz_18[5]) begin
                ways_0_metas_5_valid <= 1'b1;
              end
              if(_zz_18[6]) begin
                ways_0_metas_6_valid <= 1'b1;
              end
              if(_zz_18[7]) begin
                ways_0_metas_7_valid <= 1'b1;
              end
              if(_zz_18[8]) begin
                ways_0_metas_8_valid <= 1'b1;
              end
              if(_zz_18[9]) begin
                ways_0_metas_9_valid <= 1'b1;
              end
              if(_zz_18[10]) begin
                ways_0_metas_10_valid <= 1'b1;
              end
              if(_zz_18[11]) begin
                ways_0_metas_11_valid <= 1'b1;
              end
              if(_zz_18[12]) begin
                ways_0_metas_12_valid <= 1'b1;
              end
              if(_zz_18[13]) begin
                ways_0_metas_13_valid <= 1'b1;
              end
              if(_zz_18[14]) begin
                ways_0_metas_14_valid <= 1'b1;
              end
              if(_zz_18[15]) begin
                ways_0_metas_15_valid <= 1'b1;
              end
            end
          end
        end
      end
      if(is_miss) begin
        cpu_cmd_ready_1 <= 1'b0;
      end else begin
        if(next_level_rsp_valid) begin
          cpu_cmd_ready_1 <= 1'b1;
        end
      end
      if(when_ICache_l179_1) begin
        if(icache_hit_1) begin
          if(_zz_20) begin
            ways_1_metas_0_replace_info <= 1'b1;
          end
          if(_zz_21) begin
            ways_1_metas_1_replace_info <= 1'b1;
          end
          if(_zz_22) begin
            ways_1_metas_2_replace_info <= 1'b1;
          end
          if(_zz_23) begin
            ways_1_metas_3_replace_info <= 1'b1;
          end
          if(_zz_24) begin
            ways_1_metas_4_replace_info <= 1'b1;
          end
          if(_zz_25) begin
            ways_1_metas_5_replace_info <= 1'b1;
          end
          if(_zz_26) begin
            ways_1_metas_6_replace_info <= 1'b1;
          end
          if(_zz_27) begin
            ways_1_metas_7_replace_info <= 1'b1;
          end
          if(_zz_28) begin
            ways_1_metas_8_replace_info <= 1'b1;
          end
          if(_zz_29) begin
            ways_1_metas_9_replace_info <= 1'b1;
          end
          if(_zz_30) begin
            ways_1_metas_10_replace_info <= 1'b1;
          end
          if(_zz_31) begin
            ways_1_metas_11_replace_info <= 1'b1;
          end
          if(_zz_32) begin
            ways_1_metas_12_replace_info <= 1'b1;
          end
          if(_zz_33) begin
            ways_1_metas_13_replace_info <= 1'b1;
          end
          if(_zz_34) begin
            ways_1_metas_14_replace_info <= 1'b1;
          end
          if(_zz_35) begin
            ways_1_metas_15_replace_info <= 1'b1;
          end
        end else begin
          if(_zz_20) begin
            ways_1_metas_0_replace_info <= 1'b0;
          end
          if(_zz_21) begin
            ways_1_metas_1_replace_info <= 1'b0;
          end
          if(_zz_22) begin
            ways_1_metas_2_replace_info <= 1'b0;
          end
          if(_zz_23) begin
            ways_1_metas_3_replace_info <= 1'b0;
          end
          if(_zz_24) begin
            ways_1_metas_4_replace_info <= 1'b0;
          end
          if(_zz_25) begin
            ways_1_metas_5_replace_info <= 1'b0;
          end
          if(_zz_26) begin
            ways_1_metas_6_replace_info <= 1'b0;
          end
          if(_zz_27) begin
            ways_1_metas_7_replace_info <= 1'b0;
          end
          if(_zz_28) begin
            ways_1_metas_8_replace_info <= 1'b0;
          end
          if(_zz_29) begin
            ways_1_metas_9_replace_info <= 1'b0;
          end
          if(_zz_30) begin
            ways_1_metas_10_replace_info <= 1'b0;
          end
          if(_zz_31) begin
            ways_1_metas_11_replace_info <= 1'b0;
          end
          if(_zz_32) begin
            ways_1_metas_12_replace_info <= 1'b0;
          end
          if(_zz_33) begin
            ways_1_metas_13_replace_info <= 1'b0;
          end
          if(_zz_34) begin
            ways_1_metas_14_replace_info <= 1'b0;
          end
          if(_zz_35) begin
            ways_1_metas_15_replace_info <= 1'b0;
          end
        end
      end else begin
        if(is_hit) begin
          if(icache_hit_1) begin
            if(_zz_20) begin
              ways_1_metas_0_replace_info <= 1'b1;
            end
            if(_zz_21) begin
              ways_1_metas_1_replace_info <= 1'b1;
            end
            if(_zz_22) begin
              ways_1_metas_2_replace_info <= 1'b1;
            end
            if(_zz_23) begin
              ways_1_metas_3_replace_info <= 1'b1;
            end
            if(_zz_24) begin
              ways_1_metas_4_replace_info <= 1'b1;
            end
            if(_zz_25) begin
              ways_1_metas_5_replace_info <= 1'b1;
            end
            if(_zz_26) begin
              ways_1_metas_6_replace_info <= 1'b1;
            end
            if(_zz_27) begin
              ways_1_metas_7_replace_info <= 1'b1;
            end
            if(_zz_28) begin
              ways_1_metas_8_replace_info <= 1'b1;
            end
            if(_zz_29) begin
              ways_1_metas_9_replace_info <= 1'b1;
            end
            if(_zz_30) begin
              ways_1_metas_10_replace_info <= 1'b1;
            end
            if(_zz_31) begin
              ways_1_metas_11_replace_info <= 1'b1;
            end
            if(_zz_32) begin
              ways_1_metas_12_replace_info <= 1'b1;
            end
            if(_zz_33) begin
              ways_1_metas_13_replace_info <= 1'b1;
            end
            if(_zz_34) begin
              ways_1_metas_14_replace_info <= 1'b1;
            end
            if(_zz_35) begin
              ways_1_metas_15_replace_info <= 1'b1;
            end
          end
        end else begin
          if(next_level_rsp_valid) begin
            if(icache_victim_1) begin
              if(_zz_36[0]) begin
                ways_1_metas_0_valid <= 1'b1;
              end
              if(_zz_36[1]) begin
                ways_1_metas_1_valid <= 1'b1;
              end
              if(_zz_36[2]) begin
                ways_1_metas_2_valid <= 1'b1;
              end
              if(_zz_36[3]) begin
                ways_1_metas_3_valid <= 1'b1;
              end
              if(_zz_36[4]) begin
                ways_1_metas_4_valid <= 1'b1;
              end
              if(_zz_36[5]) begin
                ways_1_metas_5_valid <= 1'b1;
              end
              if(_zz_36[6]) begin
                ways_1_metas_6_valid <= 1'b1;
              end
              if(_zz_36[7]) begin
                ways_1_metas_7_valid <= 1'b1;
              end
              if(_zz_36[8]) begin
                ways_1_metas_8_valid <= 1'b1;
              end
              if(_zz_36[9]) begin
                ways_1_metas_9_valid <= 1'b1;
              end
              if(_zz_36[10]) begin
                ways_1_metas_10_valid <= 1'b1;
              end
              if(_zz_36[11]) begin
                ways_1_metas_11_valid <= 1'b1;
              end
              if(_zz_36[12]) begin
                ways_1_metas_12_valid <= 1'b1;
              end
              if(_zz_36[13]) begin
                ways_1_metas_13_valid <= 1'b1;
              end
              if(_zz_36[14]) begin
                ways_1_metas_14_valid <= 1'b1;
              end
              if(_zz_36[15]) begin
                ways_1_metas_15_valid <= 1'b1;
              end
            end
          end
        end
      end
      if(is_miss) begin
        cpu_cmd_ready_1 <= 1'b0;
      end else begin
        if(next_level_rsp_valid) begin
          cpu_cmd_ready_1 <= 1'b1;
        end
      end
      if(when_ICache_l179_2) begin
        if(icache_hit_2) begin
          if(_zz_38) begin
            ways_2_metas_0_replace_info <= 1'b1;
          end
          if(_zz_39) begin
            ways_2_metas_1_replace_info <= 1'b1;
          end
          if(_zz_40) begin
            ways_2_metas_2_replace_info <= 1'b1;
          end
          if(_zz_41) begin
            ways_2_metas_3_replace_info <= 1'b1;
          end
          if(_zz_42) begin
            ways_2_metas_4_replace_info <= 1'b1;
          end
          if(_zz_43) begin
            ways_2_metas_5_replace_info <= 1'b1;
          end
          if(_zz_44) begin
            ways_2_metas_6_replace_info <= 1'b1;
          end
          if(_zz_45) begin
            ways_2_metas_7_replace_info <= 1'b1;
          end
          if(_zz_46) begin
            ways_2_metas_8_replace_info <= 1'b1;
          end
          if(_zz_47) begin
            ways_2_metas_9_replace_info <= 1'b1;
          end
          if(_zz_48) begin
            ways_2_metas_10_replace_info <= 1'b1;
          end
          if(_zz_49) begin
            ways_2_metas_11_replace_info <= 1'b1;
          end
          if(_zz_50) begin
            ways_2_metas_12_replace_info <= 1'b1;
          end
          if(_zz_51) begin
            ways_2_metas_13_replace_info <= 1'b1;
          end
          if(_zz_52) begin
            ways_2_metas_14_replace_info <= 1'b1;
          end
          if(_zz_53) begin
            ways_2_metas_15_replace_info <= 1'b1;
          end
        end else begin
          if(_zz_38) begin
            ways_2_metas_0_replace_info <= 1'b0;
          end
          if(_zz_39) begin
            ways_2_metas_1_replace_info <= 1'b0;
          end
          if(_zz_40) begin
            ways_2_metas_2_replace_info <= 1'b0;
          end
          if(_zz_41) begin
            ways_2_metas_3_replace_info <= 1'b0;
          end
          if(_zz_42) begin
            ways_2_metas_4_replace_info <= 1'b0;
          end
          if(_zz_43) begin
            ways_2_metas_5_replace_info <= 1'b0;
          end
          if(_zz_44) begin
            ways_2_metas_6_replace_info <= 1'b0;
          end
          if(_zz_45) begin
            ways_2_metas_7_replace_info <= 1'b0;
          end
          if(_zz_46) begin
            ways_2_metas_8_replace_info <= 1'b0;
          end
          if(_zz_47) begin
            ways_2_metas_9_replace_info <= 1'b0;
          end
          if(_zz_48) begin
            ways_2_metas_10_replace_info <= 1'b0;
          end
          if(_zz_49) begin
            ways_2_metas_11_replace_info <= 1'b0;
          end
          if(_zz_50) begin
            ways_2_metas_12_replace_info <= 1'b0;
          end
          if(_zz_51) begin
            ways_2_metas_13_replace_info <= 1'b0;
          end
          if(_zz_52) begin
            ways_2_metas_14_replace_info <= 1'b0;
          end
          if(_zz_53) begin
            ways_2_metas_15_replace_info <= 1'b0;
          end
        end
      end else begin
        if(is_hit) begin
          if(icache_hit_2) begin
            if(_zz_38) begin
              ways_2_metas_0_replace_info <= 1'b1;
            end
            if(_zz_39) begin
              ways_2_metas_1_replace_info <= 1'b1;
            end
            if(_zz_40) begin
              ways_2_metas_2_replace_info <= 1'b1;
            end
            if(_zz_41) begin
              ways_2_metas_3_replace_info <= 1'b1;
            end
            if(_zz_42) begin
              ways_2_metas_4_replace_info <= 1'b1;
            end
            if(_zz_43) begin
              ways_2_metas_5_replace_info <= 1'b1;
            end
            if(_zz_44) begin
              ways_2_metas_6_replace_info <= 1'b1;
            end
            if(_zz_45) begin
              ways_2_metas_7_replace_info <= 1'b1;
            end
            if(_zz_46) begin
              ways_2_metas_8_replace_info <= 1'b1;
            end
            if(_zz_47) begin
              ways_2_metas_9_replace_info <= 1'b1;
            end
            if(_zz_48) begin
              ways_2_metas_10_replace_info <= 1'b1;
            end
            if(_zz_49) begin
              ways_2_metas_11_replace_info <= 1'b1;
            end
            if(_zz_50) begin
              ways_2_metas_12_replace_info <= 1'b1;
            end
            if(_zz_51) begin
              ways_2_metas_13_replace_info <= 1'b1;
            end
            if(_zz_52) begin
              ways_2_metas_14_replace_info <= 1'b1;
            end
            if(_zz_53) begin
              ways_2_metas_15_replace_info <= 1'b1;
            end
          end
        end else begin
          if(next_level_rsp_valid) begin
            if(icache_victim_2) begin
              if(_zz_54[0]) begin
                ways_2_metas_0_valid <= 1'b1;
              end
              if(_zz_54[1]) begin
                ways_2_metas_1_valid <= 1'b1;
              end
              if(_zz_54[2]) begin
                ways_2_metas_2_valid <= 1'b1;
              end
              if(_zz_54[3]) begin
                ways_2_metas_3_valid <= 1'b1;
              end
              if(_zz_54[4]) begin
                ways_2_metas_4_valid <= 1'b1;
              end
              if(_zz_54[5]) begin
                ways_2_metas_5_valid <= 1'b1;
              end
              if(_zz_54[6]) begin
                ways_2_metas_6_valid <= 1'b1;
              end
              if(_zz_54[7]) begin
                ways_2_metas_7_valid <= 1'b1;
              end
              if(_zz_54[8]) begin
                ways_2_metas_8_valid <= 1'b1;
              end
              if(_zz_54[9]) begin
                ways_2_metas_9_valid <= 1'b1;
              end
              if(_zz_54[10]) begin
                ways_2_metas_10_valid <= 1'b1;
              end
              if(_zz_54[11]) begin
                ways_2_metas_11_valid <= 1'b1;
              end
              if(_zz_54[12]) begin
                ways_2_metas_12_valid <= 1'b1;
              end
              if(_zz_54[13]) begin
                ways_2_metas_13_valid <= 1'b1;
              end
              if(_zz_54[14]) begin
                ways_2_metas_14_valid <= 1'b1;
              end
              if(_zz_54[15]) begin
                ways_2_metas_15_valid <= 1'b1;
              end
            end
          end
        end
      end
      if(is_miss) begin
        cpu_cmd_ready_1 <= 1'b0;
      end else begin
        if(next_level_rsp_valid) begin
          cpu_cmd_ready_1 <= 1'b1;
        end
      end
      if(when_ICache_l179_3) begin
        if(icache_hit_3) begin
          if(_zz_56) begin
            ways_3_metas_0_replace_info <= 1'b1;
          end
          if(_zz_57) begin
            ways_3_metas_1_replace_info <= 1'b1;
          end
          if(_zz_58) begin
            ways_3_metas_2_replace_info <= 1'b1;
          end
          if(_zz_59) begin
            ways_3_metas_3_replace_info <= 1'b1;
          end
          if(_zz_60) begin
            ways_3_metas_4_replace_info <= 1'b1;
          end
          if(_zz_61) begin
            ways_3_metas_5_replace_info <= 1'b1;
          end
          if(_zz_62) begin
            ways_3_metas_6_replace_info <= 1'b1;
          end
          if(_zz_63) begin
            ways_3_metas_7_replace_info <= 1'b1;
          end
          if(_zz_64) begin
            ways_3_metas_8_replace_info <= 1'b1;
          end
          if(_zz_65) begin
            ways_3_metas_9_replace_info <= 1'b1;
          end
          if(_zz_66) begin
            ways_3_metas_10_replace_info <= 1'b1;
          end
          if(_zz_67) begin
            ways_3_metas_11_replace_info <= 1'b1;
          end
          if(_zz_68) begin
            ways_3_metas_12_replace_info <= 1'b1;
          end
          if(_zz_69) begin
            ways_3_metas_13_replace_info <= 1'b1;
          end
          if(_zz_70) begin
            ways_3_metas_14_replace_info <= 1'b1;
          end
          if(_zz_71) begin
            ways_3_metas_15_replace_info <= 1'b1;
          end
        end else begin
          if(_zz_56) begin
            ways_3_metas_0_replace_info <= 1'b0;
          end
          if(_zz_57) begin
            ways_3_metas_1_replace_info <= 1'b0;
          end
          if(_zz_58) begin
            ways_3_metas_2_replace_info <= 1'b0;
          end
          if(_zz_59) begin
            ways_3_metas_3_replace_info <= 1'b0;
          end
          if(_zz_60) begin
            ways_3_metas_4_replace_info <= 1'b0;
          end
          if(_zz_61) begin
            ways_3_metas_5_replace_info <= 1'b0;
          end
          if(_zz_62) begin
            ways_3_metas_6_replace_info <= 1'b0;
          end
          if(_zz_63) begin
            ways_3_metas_7_replace_info <= 1'b0;
          end
          if(_zz_64) begin
            ways_3_metas_8_replace_info <= 1'b0;
          end
          if(_zz_65) begin
            ways_3_metas_9_replace_info <= 1'b0;
          end
          if(_zz_66) begin
            ways_3_metas_10_replace_info <= 1'b0;
          end
          if(_zz_67) begin
            ways_3_metas_11_replace_info <= 1'b0;
          end
          if(_zz_68) begin
            ways_3_metas_12_replace_info <= 1'b0;
          end
          if(_zz_69) begin
            ways_3_metas_13_replace_info <= 1'b0;
          end
          if(_zz_70) begin
            ways_3_metas_14_replace_info <= 1'b0;
          end
          if(_zz_71) begin
            ways_3_metas_15_replace_info <= 1'b0;
          end
        end
      end else begin
        if(is_hit) begin
          if(icache_hit_3) begin
            if(_zz_56) begin
              ways_3_metas_0_replace_info <= 1'b1;
            end
            if(_zz_57) begin
              ways_3_metas_1_replace_info <= 1'b1;
            end
            if(_zz_58) begin
              ways_3_metas_2_replace_info <= 1'b1;
            end
            if(_zz_59) begin
              ways_3_metas_3_replace_info <= 1'b1;
            end
            if(_zz_60) begin
              ways_3_metas_4_replace_info <= 1'b1;
            end
            if(_zz_61) begin
              ways_3_metas_5_replace_info <= 1'b1;
            end
            if(_zz_62) begin
              ways_3_metas_6_replace_info <= 1'b1;
            end
            if(_zz_63) begin
              ways_3_metas_7_replace_info <= 1'b1;
            end
            if(_zz_64) begin
              ways_3_metas_8_replace_info <= 1'b1;
            end
            if(_zz_65) begin
              ways_3_metas_9_replace_info <= 1'b1;
            end
            if(_zz_66) begin
              ways_3_metas_10_replace_info <= 1'b1;
            end
            if(_zz_67) begin
              ways_3_metas_11_replace_info <= 1'b1;
            end
            if(_zz_68) begin
              ways_3_metas_12_replace_info <= 1'b1;
            end
            if(_zz_69) begin
              ways_3_metas_13_replace_info <= 1'b1;
            end
            if(_zz_70) begin
              ways_3_metas_14_replace_info <= 1'b1;
            end
            if(_zz_71) begin
              ways_3_metas_15_replace_info <= 1'b1;
            end
          end
        end else begin
          if(next_level_rsp_valid) begin
            if(icache_victim_3) begin
              if(_zz_72[0]) begin
                ways_3_metas_0_valid <= 1'b1;
              end
              if(_zz_72[1]) begin
                ways_3_metas_1_valid <= 1'b1;
              end
              if(_zz_72[2]) begin
                ways_3_metas_2_valid <= 1'b1;
              end
              if(_zz_72[3]) begin
                ways_3_metas_3_valid <= 1'b1;
              end
              if(_zz_72[4]) begin
                ways_3_metas_4_valid <= 1'b1;
              end
              if(_zz_72[5]) begin
                ways_3_metas_5_valid <= 1'b1;
              end
              if(_zz_72[6]) begin
                ways_3_metas_6_valid <= 1'b1;
              end
              if(_zz_72[7]) begin
                ways_3_metas_7_valid <= 1'b1;
              end
              if(_zz_72[8]) begin
                ways_3_metas_8_valid <= 1'b1;
              end
              if(_zz_72[9]) begin
                ways_3_metas_9_valid <= 1'b1;
              end
              if(_zz_72[10]) begin
                ways_3_metas_10_valid <= 1'b1;
              end
              if(_zz_72[11]) begin
                ways_3_metas_11_valid <= 1'b1;
              end
              if(_zz_72[12]) begin
                ways_3_metas_12_valid <= 1'b1;
              end
              if(_zz_72[13]) begin
                ways_3_metas_13_valid <= 1'b1;
              end
              if(_zz_72[14]) begin
                ways_3_metas_14_valid <= 1'b1;
              end
              if(_zz_72[15]) begin
                ways_3_metas_15_valid <= 1'b1;
              end
            end
          end
        end
      end
      if(is_miss) begin
        cpu_cmd_ready_1 <= 1'b0;
      end else begin
        if(next_level_rsp_valid) begin
          cpu_cmd_ready_1 <= 1'b1;
        end
      end
    end
  end


endmodule
