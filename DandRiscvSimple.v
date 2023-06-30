// Generator : SpinalHDL v1.8.1    git head : 2a7592004363e5b40ec43e1f122ed8641cd8965b
// Component : DandRiscvSimple
// Git hash  : 0cdf215407779b0779cd7be4a7cf65ac016d4114

`timescale 1ns/1ps

module DandRiscvSimple (
  input      [31:0]   slaveBus_datain,
  output     [31:0]   masterBus_dataout,
  input               clk,
  input               reset
);

  wire                iCache_1_flush;
  wire                iCache_1_cpu_cmd_ready;
  wire                iCache_1_cpu_rsp_valid;
  wire       [31:0]   iCache_1_cpu_rsp_payload_data;
  wire                iCache_1_next_level_cmd_ready;
  wire                iCache_1_next_level_rsp_valid;
  wire       [255:0]  iCache_1_next_level_rsp_payload_data;
  wire                iCache_1_cpu_cmd_valid;
  wire       [63:0]   iCache_1_cpu_cmd_payload_addr;
  wire                iCache_1_sram_0_ports_cmd_valid;
  wire       [2:0]    iCache_1_sram_0_ports_cmd_payload_addr;
  wire                iCache_1_sram_0_ports_cmd_payload_wen;
  wire                iCache_1_sram_1_ports_cmd_valid;
  wire       [2:0]    iCache_1_sram_1_ports_cmd_payload_addr;
  wire                iCache_1_sram_1_ports_cmd_payload_wen;
  wire                iCache_1_next_level_cmd_valid;
  wire       [63:0]   iCache_1_next_level_cmd_payload_addr;
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
  wire                when_Pipeline_l151;
  wire                when_Pipeline_l154;
  wire                when_Pipeline_l151_1;
  wire                when_Pipeline_l154_1;
  wire                when_Pipeline_l151_2;
  wire                when_Pipeline_l154_2;
  wire                when_Pipeline_l151_3;
  wire                when_Pipeline_l154_3;

  ICache iCache_1 (
    .flush                         (iCache_1_flush                             ), //i
    .cpu_cmd_valid                 (iCache_1_cpu_cmd_valid                     ), //o
    .cpu_cmd_ready                 (iCache_1_cpu_cmd_ready                     ), //i
    .cpu_cmd_payload_addr          (iCache_1_cpu_cmd_payload_addr[63:0]        ), //o
    .cpu_rsp_valid                 (iCache_1_cpu_rsp_valid                     ), //i
    .cpu_rsp_payload_data          (iCache_1_cpu_rsp_payload_data[31:0]        ), //i
    .sram_0_ports_cmd_valid        (iCache_1_sram_0_ports_cmd_valid            ), //o
    .sram_0_ports_cmd_payload_addr (iCache_1_sram_0_ports_cmd_payload_addr[2:0]), //o
    .sram_0_ports_cmd_payload_wen  (iCache_1_sram_0_ports_cmd_payload_wen      ), //o
    .sram_0_ports_rsp_valid        (1'b1                                       ), //i
    .sram_0_ports_rsp_payload_data (256'h0                                     ), //i
    .sram_1_ports_cmd_valid        (iCache_1_sram_1_ports_cmd_valid            ), //o
    .sram_1_ports_cmd_payload_addr (iCache_1_sram_1_ports_cmd_payload_addr[2:0]), //o
    .sram_1_ports_cmd_payload_wen  (iCache_1_sram_1_ports_cmd_payload_wen      ), //o
    .sram_1_ports_rsp_valid        (1'b1                                       ), //i
    .sram_1_ports_rsp_payload_data (256'h0                                     ), //i
    .next_level_cmd_valid          (iCache_1_next_level_cmd_valid              ), //o
    .next_level_cmd_ready          (iCache_1_next_level_cmd_ready              ), //i
    .next_level_cmd_payload_addr   (iCache_1_next_level_cmd_payload_addr[63:0] ), //o
    .next_level_rsp_valid          (iCache_1_next_level_rsp_valid              ), //i
    .next_level_rsp_payload_data   (iCache_1_next_level_rsp_payload_data[255:0])  //i
  );
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
  output              cpu_cmd_valid,
  input               cpu_cmd_ready,
  output     [63:0]   cpu_cmd_payload_addr,
  input               cpu_rsp_valid,
  input      [31:0]   cpu_rsp_payload_data,
  output reg          sram_0_ports_cmd_valid,
  output reg [2:0]    sram_0_ports_cmd_payload_addr,
  output reg          sram_0_ports_cmd_payload_wen,
  input               sram_0_ports_rsp_valid,
  input      [255:0]  sram_0_ports_rsp_payload_data,
  output reg          sram_1_ports_cmd_valid,
  output reg [2:0]    sram_1_ports_cmd_payload_addr,
  output reg          sram_1_ports_cmd_payload_wen,
  input               sram_1_ports_rsp_valid,
  input      [255:0]  sram_1_ports_rsp_payload_data,
  output              next_level_cmd_valid,
  input               next_level_cmd_ready,
  output     [63:0]   next_level_cmd_payload_addr,
  input               next_level_rsp_valid,
  input      [255:0]  next_level_rsp_payload_data
);

  wire       [54:0]   _zz_ways_0_metas_port0;
  wire       [54:0]   _zz_ways_0_metas_port1;
  wire       [54:0]   _zz_ways_0_metas_port2;
  wire       [54:0]   _zz_ways_1_metas_port0;
  wire       [54:0]   _zz_ways_1_metas_port1;
  wire       [54:0]   _zz_ways_1_metas_port2;
  reg        [31:0]   _zz_sram_to_cpu_data;
  wire       [52:0]   cpu_tag;
  wire       [4:0]    cpu_set;
  wire       [4:0]    cpu_bank_offset;
  wire       [2:0]    cpu_bank_addr;
  wire       [2:0]    cpu_bank_sel;
  wire       [52:0]   icache_tag_0;
  wire       [52:0]   icache_tag_1;
  wire                icache_hit_0;
  wire                icache_hit_1;
  wire                icache_replace_info_0;
  wire                icache_replace_info_1;
  wire                replace_info_full;
  wire                cpu_cmd_fire;
  wire                is_hit;
  wire                cpu_cmd_fire_1;
  wire                is_miss;
  wire       [31:0]   sram_to_cpu_data;
  wire                cpu_cmd_fire_2;
  wire                cpu_cmd_fire_3;
  reg [54:0] ways_0_metas [0:31];
  reg [54:0] ways_1_metas [0:31];

  initial begin
    $readmemb("DandRiscvSimple.v_toplevel_iCache_1_ways_0_metas.bin",ways_0_metas);
  end
  assign _zz_ways_0_metas_port0 = ways_0_metas[cpu_set];
  assign _zz_ways_0_metas_port1 = ways_0_metas[cpu_set];
  assign _zz_ways_0_metas_port2 = ways_0_metas[cpu_set];
  initial begin
    $readmemb("DandRiscvSimple.v_toplevel_iCache_1_ways_1_metas.bin",ways_1_metas);
  end
  assign _zz_ways_1_metas_port0 = ways_1_metas[cpu_set];
  assign _zz_ways_1_metas_port1 = ways_1_metas[cpu_set];
  assign _zz_ways_1_metas_port2 = ways_1_metas[cpu_set];
  always @(*) begin
    case(cpu_bank_sel)
      3'b000 : _zz_sram_to_cpu_data = sram_0_ports_rsp_payload_data[31 : 0];
      3'b001 : _zz_sram_to_cpu_data = sram_0_ports_rsp_payload_data[63 : 32];
      3'b010 : _zz_sram_to_cpu_data = sram_0_ports_rsp_payload_data[95 : 64];
      3'b011 : _zz_sram_to_cpu_data = sram_0_ports_rsp_payload_data[127 : 96];
      3'b100 : _zz_sram_to_cpu_data = sram_0_ports_rsp_payload_data[159 : 128];
      3'b101 : _zz_sram_to_cpu_data = sram_0_ports_rsp_payload_data[191 : 160];
      3'b110 : _zz_sram_to_cpu_data = sram_0_ports_rsp_payload_data[223 : 192];
      default : _zz_sram_to_cpu_data = sram_0_ports_rsp_payload_data[255 : 224];
    endcase
  end

  assign cpu_tag = cpu_cmd_payload_addr[63 : 11];
  assign cpu_set = cpu_cmd_payload_addr[10 : 6];
  assign cpu_bank_offset = cpu_cmd_payload_addr[4 : 0];
  assign cpu_bank_addr = cpu_cmd_payload_addr[7 : 5];
  assign cpu_bank_sel = cpu_cmd_payload_addr[4 : 2];
  assign replace_info_full = (&{icache_replace_info_1,icache_replace_info_0});
  assign cpu_cmd_fire = (cpu_cmd_valid && cpu_cmd_ready);
  assign is_hit = ((|{icache_hit_1,icache_hit_0}) && cpu_cmd_fire);
  assign cpu_cmd_fire_1 = (cpu_cmd_valid && cpu_cmd_ready);
  assign is_miss = ((! (|{icache_hit_1,icache_hit_0})) && cpu_cmd_fire_1);
  assign sram_to_cpu_data = _zz_sram_to_cpu_data;
  assign icache_tag_0 = _zz_ways_0_metas_port0[53 : 1];
  assign icache_hit_0 = ((icache_tag_0 == cpu_tag) && _zz_ways_0_metas_port1[0]);
  assign icache_replace_info_0 = _zz_ways_0_metas_port2[54];
  always @(*) begin
    if(is_hit) begin
      sram_0_ports_cmd_payload_addr = (icache_hit_0 ? cpu_bank_addr : 3'b000);
    end else begin
      if(next_level_rsp_valid) begin
        sram_0_ports_cmd_payload_addr = cpu_bank_addr;
      end else begin
        sram_0_ports_cmd_payload_addr = 3'b000;
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

  assign icache_tag_1 = _zz_ways_1_metas_port0[53 : 1];
  assign icache_hit_1 = ((icache_tag_1 == cpu_tag) && _zz_ways_1_metas_port1[0]);
  assign icache_replace_info_1 = _zz_ways_1_metas_port2[54];
  always @(*) begin
    if(is_hit) begin
      sram_1_ports_cmd_payload_addr = (icache_hit_1 ? cpu_bank_addr : 3'b000);
    end else begin
      if(next_level_rsp_valid) begin
        sram_1_ports_cmd_payload_addr = cpu_bank_addr;
      end else begin
        sram_1_ports_cmd_payload_addr = 3'b000;
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

  assign next_level_cmd_payload_addr = cpu_cmd_payload_addr;
  assign next_level_cmd_valid = cpu_cmd_valid;

endmodule
