// Generator : SpinalHDL v1.8.1    git head : 2a7592004363e5b40ec43e1f122ed8641cd8965b
// Component : ICache
// Git hash  : d47c11b6a2e7388c4cfbf8d348019870e5945145

`timescale 1ns/1ps

module ICache (
  input               flush,
  input               cpu_cmd_valid,
  output              cpu_cmd_ready,
  input      [63:0]   cpu_cmd_payload_addr,
  output              cpu_rsp_valid,
  output     [31:0]   cpu_rsp_payload_data,
  output reg          sram_0_ports_cmd_valid,
  output reg [4:0]    sram_0_ports_cmd_payload_addr,
  output reg          sram_0_ports_cmd_payload_wen,
  output reg [255:0]  sram_0_ports_cmd_payload_wdata,
  input               sram_0_ports_rsp_valid,
  input      [255:0]  sram_0_ports_rsp_payload_data,
  output reg          sram_1_ports_cmd_valid,
  output reg [4:0]    sram_1_ports_cmd_payload_addr,
  output reg          sram_1_ports_cmd_payload_wen,
  output reg [255:0]  sram_1_ports_cmd_payload_wdata,
  input               sram_1_ports_rsp_valid,
  input      [255:0]  sram_1_ports_rsp_payload_data,
  output reg          sram_2_ports_cmd_valid,
  output reg [4:0]    sram_2_ports_cmd_payload_addr,
  output reg          sram_2_ports_cmd_payload_wen,
  output reg [255:0]  sram_2_ports_cmd_payload_wdata,
  input               sram_2_ports_rsp_valid,
  input      [255:0]  sram_2_ports_rsp_payload_data,
  output reg          sram_3_ports_cmd_valid,
  output reg [4:0]    sram_3_ports_cmd_payload_addr,
  output reg          sram_3_ports_cmd_payload_wen,
  output reg [255:0]  sram_3_ports_cmd_payload_wdata,
  input               sram_3_ports_rsp_valid,
  input      [255:0]  sram_3_ports_rsp_payload_data,
  output              next_level_cmd_valid,
  input               next_level_cmd_ready,
  output     [63:0]   next_level_cmd_payload_addr,
  output     [3:0]    next_level_cmd_payload_len,
  input               next_level_rsp_valid,
  input      [255:0]  next_level_rsp_payload_data,
  input               clk,
  input               resetn
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
  reg        [53:0]   ways_0_metas_0_tag;
  reg                 ways_0_metas_0_replace_info;
  reg                 ways_0_metas_1_valid;
  reg        [53:0]   ways_0_metas_1_tag;
  reg                 ways_0_metas_1_replace_info;
  reg                 ways_0_metas_2_valid;
  reg        [53:0]   ways_0_metas_2_tag;
  reg                 ways_0_metas_2_replace_info;
  reg                 ways_0_metas_3_valid;
  reg        [53:0]   ways_0_metas_3_tag;
  reg                 ways_0_metas_3_replace_info;
  reg                 ways_0_metas_4_valid;
  reg        [53:0]   ways_0_metas_4_tag;
  reg                 ways_0_metas_4_replace_info;
  reg                 ways_0_metas_5_valid;
  reg        [53:0]   ways_0_metas_5_tag;
  reg                 ways_0_metas_5_replace_info;
  reg                 ways_0_metas_6_valid;
  reg        [53:0]   ways_0_metas_6_tag;
  reg                 ways_0_metas_6_replace_info;
  reg                 ways_0_metas_7_valid;
  reg        [53:0]   ways_0_metas_7_tag;
  reg                 ways_0_metas_7_replace_info;
  reg                 ways_0_metas_8_valid;
  reg        [53:0]   ways_0_metas_8_tag;
  reg                 ways_0_metas_8_replace_info;
  reg                 ways_0_metas_9_valid;
  reg        [53:0]   ways_0_metas_9_tag;
  reg                 ways_0_metas_9_replace_info;
  reg                 ways_0_metas_10_valid;
  reg        [53:0]   ways_0_metas_10_tag;
  reg                 ways_0_metas_10_replace_info;
  reg                 ways_0_metas_11_valid;
  reg        [53:0]   ways_0_metas_11_tag;
  reg                 ways_0_metas_11_replace_info;
  reg                 ways_0_metas_12_valid;
  reg        [53:0]   ways_0_metas_12_tag;
  reg                 ways_0_metas_12_replace_info;
  reg                 ways_0_metas_13_valid;
  reg        [53:0]   ways_0_metas_13_tag;
  reg                 ways_0_metas_13_replace_info;
  reg                 ways_0_metas_14_valid;
  reg        [53:0]   ways_0_metas_14_tag;
  reg                 ways_0_metas_14_replace_info;
  reg                 ways_0_metas_15_valid;
  reg        [53:0]   ways_0_metas_15_tag;
  reg                 ways_0_metas_15_replace_info;
  reg                 ways_1_metas_0_valid;
  reg        [53:0]   ways_1_metas_0_tag;
  reg                 ways_1_metas_0_replace_info;
  reg                 ways_1_metas_1_valid;
  reg        [53:0]   ways_1_metas_1_tag;
  reg                 ways_1_metas_1_replace_info;
  reg                 ways_1_metas_2_valid;
  reg        [53:0]   ways_1_metas_2_tag;
  reg                 ways_1_metas_2_replace_info;
  reg                 ways_1_metas_3_valid;
  reg        [53:0]   ways_1_metas_3_tag;
  reg                 ways_1_metas_3_replace_info;
  reg                 ways_1_metas_4_valid;
  reg        [53:0]   ways_1_metas_4_tag;
  reg                 ways_1_metas_4_replace_info;
  reg                 ways_1_metas_5_valid;
  reg        [53:0]   ways_1_metas_5_tag;
  reg                 ways_1_metas_5_replace_info;
  reg                 ways_1_metas_6_valid;
  reg        [53:0]   ways_1_metas_6_tag;
  reg                 ways_1_metas_6_replace_info;
  reg                 ways_1_metas_7_valid;
  reg        [53:0]   ways_1_metas_7_tag;
  reg                 ways_1_metas_7_replace_info;
  reg                 ways_1_metas_8_valid;
  reg        [53:0]   ways_1_metas_8_tag;
  reg                 ways_1_metas_8_replace_info;
  reg                 ways_1_metas_9_valid;
  reg        [53:0]   ways_1_metas_9_tag;
  reg                 ways_1_metas_9_replace_info;
  reg                 ways_1_metas_10_valid;
  reg        [53:0]   ways_1_metas_10_tag;
  reg                 ways_1_metas_10_replace_info;
  reg                 ways_1_metas_11_valid;
  reg        [53:0]   ways_1_metas_11_tag;
  reg                 ways_1_metas_11_replace_info;
  reg                 ways_1_metas_12_valid;
  reg        [53:0]   ways_1_metas_12_tag;
  reg                 ways_1_metas_12_replace_info;
  reg                 ways_1_metas_13_valid;
  reg        [53:0]   ways_1_metas_13_tag;
  reg                 ways_1_metas_13_replace_info;
  reg                 ways_1_metas_14_valid;
  reg        [53:0]   ways_1_metas_14_tag;
  reg                 ways_1_metas_14_replace_info;
  reg                 ways_1_metas_15_valid;
  reg        [53:0]   ways_1_metas_15_tag;
  reg                 ways_1_metas_15_replace_info;
  reg                 ways_2_metas_0_valid;
  reg        [53:0]   ways_2_metas_0_tag;
  reg                 ways_2_metas_0_replace_info;
  reg                 ways_2_metas_1_valid;
  reg        [53:0]   ways_2_metas_1_tag;
  reg                 ways_2_metas_1_replace_info;
  reg                 ways_2_metas_2_valid;
  reg        [53:0]   ways_2_metas_2_tag;
  reg                 ways_2_metas_2_replace_info;
  reg                 ways_2_metas_3_valid;
  reg        [53:0]   ways_2_metas_3_tag;
  reg                 ways_2_metas_3_replace_info;
  reg                 ways_2_metas_4_valid;
  reg        [53:0]   ways_2_metas_4_tag;
  reg                 ways_2_metas_4_replace_info;
  reg                 ways_2_metas_5_valid;
  reg        [53:0]   ways_2_metas_5_tag;
  reg                 ways_2_metas_5_replace_info;
  reg                 ways_2_metas_6_valid;
  reg        [53:0]   ways_2_metas_6_tag;
  reg                 ways_2_metas_6_replace_info;
  reg                 ways_2_metas_7_valid;
  reg        [53:0]   ways_2_metas_7_tag;
  reg                 ways_2_metas_7_replace_info;
  reg                 ways_2_metas_8_valid;
  reg        [53:0]   ways_2_metas_8_tag;
  reg                 ways_2_metas_8_replace_info;
  reg                 ways_2_metas_9_valid;
  reg        [53:0]   ways_2_metas_9_tag;
  reg                 ways_2_metas_9_replace_info;
  reg                 ways_2_metas_10_valid;
  reg        [53:0]   ways_2_metas_10_tag;
  reg                 ways_2_metas_10_replace_info;
  reg                 ways_2_metas_11_valid;
  reg        [53:0]   ways_2_metas_11_tag;
  reg                 ways_2_metas_11_replace_info;
  reg                 ways_2_metas_12_valid;
  reg        [53:0]   ways_2_metas_12_tag;
  reg                 ways_2_metas_12_replace_info;
  reg                 ways_2_metas_13_valid;
  reg        [53:0]   ways_2_metas_13_tag;
  reg                 ways_2_metas_13_replace_info;
  reg                 ways_2_metas_14_valid;
  reg        [53:0]   ways_2_metas_14_tag;
  reg                 ways_2_metas_14_replace_info;
  reg                 ways_2_metas_15_valid;
  reg        [53:0]   ways_2_metas_15_tag;
  reg                 ways_2_metas_15_replace_info;
  reg                 ways_3_metas_0_valid;
  reg        [53:0]   ways_3_metas_0_tag;
  reg                 ways_3_metas_0_replace_info;
  reg                 ways_3_metas_1_valid;
  reg        [53:0]   ways_3_metas_1_tag;
  reg                 ways_3_metas_1_replace_info;
  reg                 ways_3_metas_2_valid;
  reg        [53:0]   ways_3_metas_2_tag;
  reg                 ways_3_metas_2_replace_info;
  reg                 ways_3_metas_3_valid;
  reg        [53:0]   ways_3_metas_3_tag;
  reg                 ways_3_metas_3_replace_info;
  reg                 ways_3_metas_4_valid;
  reg        [53:0]   ways_3_metas_4_tag;
  reg                 ways_3_metas_4_replace_info;
  reg                 ways_3_metas_5_valid;
  reg        [53:0]   ways_3_metas_5_tag;
  reg                 ways_3_metas_5_replace_info;
  reg                 ways_3_metas_6_valid;
  reg        [53:0]   ways_3_metas_6_tag;
  reg                 ways_3_metas_6_replace_info;
  reg                 ways_3_metas_7_valid;
  reg        [53:0]   ways_3_metas_7_tag;
  reg                 ways_3_metas_7_replace_info;
  reg                 ways_3_metas_8_valid;
  reg        [53:0]   ways_3_metas_8_tag;
  reg                 ways_3_metas_8_replace_info;
  reg                 ways_3_metas_9_valid;
  reg        [53:0]   ways_3_metas_9_tag;
  reg                 ways_3_metas_9_replace_info;
  reg                 ways_3_metas_10_valid;
  reg        [53:0]   ways_3_metas_10_tag;
  reg                 ways_3_metas_10_replace_info;
  reg                 ways_3_metas_11_valid;
  reg        [53:0]   ways_3_metas_11_tag;
  reg                 ways_3_metas_11_replace_info;
  reg                 ways_3_metas_12_valid;
  reg        [53:0]   ways_3_metas_12_tag;
  reg                 ways_3_metas_12_replace_info;
  reg                 ways_3_metas_13_valid;
  reg        [53:0]   ways_3_metas_13_tag;
  reg                 ways_3_metas_13_replace_info;
  reg                 ways_3_metas_14_valid;
  reg        [53:0]   ways_3_metas_14_tag;
  reg                 ways_3_metas_14_replace_info;
  reg                 ways_3_metas_15_valid;
  reg        [53:0]   ways_3_metas_15_tag;
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
  wire       [4:0]    cpu_bank_addr;
  wire       [2:0]    cpu_bank_sel;
  reg        [63:0]   cpu_addr_d1;
  wire       [3:0]    cpu_set_d1;
  wire       [53:0]   cpu_tag_d1;
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
  reg                 next_level_data_cnt_willIncrement;
  reg                 next_level_data_cnt_willClear;
  reg        [0:0]    next_level_data_cnt_valueNext;
  reg        [0:0]    next_level_data_cnt_value;
  wire                next_level_data_cnt_willOverflowIfInc;
  wire                next_level_data_cnt_willOverflow;
  wire       [3:0]    next_level_bank_addr;
  wire                next_level_cmd_fire;
  wire                when_ICache_l150;
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
  wire                _zz_19;
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
  wire                cpu_cmd_fire_2;
  wire                when_ICache_l201;
  wire                when_ICache_l218;
  wire                when_ICache_l227;
  wire       [15:0]   _zz_35;
  wire                _zz_36;
  wire                _zz_37;
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
  wire       [15:0]   _zz_52;
  wire                _zz_53;
  wire                _zz_54;
  wire                _zz_55;
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
  wire                cpu_cmd_fire_3;
  wire                when_ICache_l201_1;
  wire                when_ICache_l218_1;
  wire                when_ICache_l227_1;
  wire       [15:0]   _zz_69;
  wire                _zz_70;
  wire                _zz_71;
  wire                _zz_72;
  wire                _zz_73;
  wire                _zz_74;
  wire                _zz_75;
  wire                _zz_76;
  wire                _zz_77;
  wire                _zz_78;
  wire                _zz_79;
  wire                _zz_80;
  wire                _zz_81;
  wire                _zz_82;
  wire                _zz_83;
  wire                _zz_84;
  wire                _zz_85;
  wire       [15:0]   _zz_86;
  wire                _zz_87;
  wire                _zz_88;
  wire                _zz_89;
  wire                _zz_90;
  wire                _zz_91;
  wire                _zz_92;
  wire                _zz_93;
  wire                _zz_94;
  wire                _zz_95;
  wire                _zz_96;
  wire                _zz_97;
  wire                _zz_98;
  wire                _zz_99;
  wire                _zz_100;
  wire                _zz_101;
  wire                _zz_102;
  wire                cpu_cmd_fire_4;
  wire                when_ICache_l201_2;
  wire                when_ICache_l218_2;
  wire                when_ICache_l227_2;
  wire       [15:0]   _zz_103;
  wire                _zz_104;
  wire                _zz_105;
  wire                _zz_106;
  wire                _zz_107;
  wire                _zz_108;
  wire                _zz_109;
  wire                _zz_110;
  wire                _zz_111;
  wire                _zz_112;
  wire                _zz_113;
  wire                _zz_114;
  wire                _zz_115;
  wire                _zz_116;
  wire                _zz_117;
  wire                _zz_118;
  wire                _zz_119;
  wire       [15:0]   _zz_120;
  wire                _zz_121;
  wire                _zz_122;
  wire                _zz_123;
  wire                _zz_124;
  wire                _zz_125;
  wire                _zz_126;
  wire                _zz_127;
  wire                _zz_128;
  wire                _zz_129;
  wire                _zz_130;
  wire                _zz_131;
  wire                _zz_132;
  wire                _zz_133;
  wire                _zz_134;
  wire                _zz_135;
  wire                _zz_136;
  wire                cpu_cmd_fire_5;
  wire                when_ICache_l201_3;
  wire                when_ICache_l218_3;
  wire                when_ICache_l227_3;
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

  assign replace_info_full = (&{icache_replace_info_3,{icache_replace_info_2,{icache_replace_info_1,icache_replace_info_0}}});
  assign cpu_cmd_fire = (cpu_cmd_valid && cpu_cmd_ready);
  assign is_hit = ((|{icache_hit_3,{icache_hit_2,{icache_hit_1,icache_hit_0}}}) && cpu_cmd_fire);
  assign cpu_cmd_fire_1 = (cpu_cmd_valid && cpu_cmd_ready);
  assign is_miss = ((! (|{icache_hit_3,{icache_hit_2,{icache_hit_1,icache_hit_0}}})) && cpu_cmd_fire_1);
  assign cpu_tag = cpu_cmd_payload_addr[63 : 10];
  assign cpu_set = cpu_cmd_payload_addr[9 : 6];
  assign cpu_bank_offset = cpu_cmd_payload_addr[4 : 0];
  assign cpu_bank_addr = cpu_cmd_payload_addr[9 : 5];
  assign cpu_bank_sel = cpu_cmd_payload_addr[4 : 2];
  assign cpu_set_d1 = cpu_addr_d1[9 : 6];
  assign cpu_tag_d1 = cpu_addr_d1[63 : 10];
  always @(*) begin
    next_level_data_cnt_willIncrement = 1'b0;
    if(!is_miss) begin
      if(!when_ICache_l150) begin
        if(next_level_rsp_valid) begin
          next_level_data_cnt_willIncrement = 1'b1;
        end
      end
    end
  end

  always @(*) begin
    next_level_data_cnt_willClear = 1'b0;
    if(is_miss) begin
      next_level_data_cnt_willClear = 1'b1;
    end else begin
      if(when_ICache_l150) begin
        next_level_data_cnt_willClear = 1'b1;
      end
    end
  end

  assign next_level_data_cnt_willOverflowIfInc = (next_level_data_cnt_value == 1'b1);
  assign next_level_data_cnt_willOverflow = (next_level_data_cnt_willOverflowIfInc && next_level_data_cnt_willIncrement);
  always @(*) begin
    next_level_data_cnt_valueNext = (next_level_data_cnt_value + next_level_data_cnt_willIncrement);
    if(next_level_data_cnt_willClear) begin
      next_level_data_cnt_valueNext = 1'b0;
    end
  end

  assign next_level_bank_addr = cpu_addr_d1[9 : 6];
  assign next_level_cmd_fire = (next_level_cmd_valid && next_level_cmd_ready);
  assign when_ICache_l150 = (next_level_rsp_valid && (next_level_data_cnt_value == 1'b1));
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
  assign _zz_19 = _zz_18[0];
  assign _zz_20 = _zz_18[1];
  assign _zz_21 = _zz_18[2];
  assign _zz_22 = _zz_18[3];
  assign _zz_23 = _zz_18[4];
  assign _zz_24 = _zz_18[5];
  assign _zz_25 = _zz_18[6];
  assign _zz_26 = _zz_18[7];
  assign _zz_27 = _zz_18[8];
  assign _zz_28 = _zz_18[9];
  assign _zz_29 = _zz_18[10];
  assign _zz_30 = _zz_18[11];
  assign _zz_31 = _zz_18[12];
  assign _zz_32 = _zz_18[13];
  assign _zz_33 = _zz_18[14];
  assign _zz_34 = _zz_18[15];
  assign icache_victim_0 = (! _zz_icache_victim_0);
  assign sram_banks_data_0 = sram_0_ports_rsp_payload_data;
  assign sram_banks_valid_0 = sram_0_ports_rsp_valid;
  always @(*) begin
    if(is_hit) begin
      sram_0_ports_cmd_payload_addr = (icache_hit_0 ? cpu_bank_addr : 5'h0);
    end else begin
      if(next_level_rsp_valid) begin
        sram_0_ports_cmd_payload_addr = {next_level_bank_addr,next_level_data_cnt_value};
      end else begin
        sram_0_ports_cmd_payload_addr = 5'h0;
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

  always @(*) begin
    if(is_hit) begin
      sram_0_ports_cmd_payload_wdata = 256'h0;
    end else begin
      if(next_level_rsp_valid) begin
        sram_0_ports_cmd_payload_wdata = next_level_rsp_payload_data;
      end else begin
        sram_0_ports_cmd_payload_wdata = 256'h0;
      end
    end
  end

  assign when_ICache_l201 = (is_hit && replace_info_full);
  assign when_ICache_l218 = (next_level_rsp_valid && (next_level_data_cnt_value == 1'b1));
  assign when_ICache_l227 = (next_level_rsp_valid && (next_level_data_cnt_value == 1'b1));
  assign _zz_35 = ({15'd0,1'b1} <<< cpu_set);
  assign _zz_36 = _zz_35[0];
  assign _zz_37 = _zz_35[1];
  assign _zz_38 = _zz_35[2];
  assign _zz_39 = _zz_35[3];
  assign _zz_40 = _zz_35[4];
  assign _zz_41 = _zz_35[5];
  assign _zz_42 = _zz_35[6];
  assign _zz_43 = _zz_35[7];
  assign _zz_44 = _zz_35[8];
  assign _zz_45 = _zz_35[9];
  assign _zz_46 = _zz_35[10];
  assign _zz_47 = _zz_35[11];
  assign _zz_48 = _zz_35[12];
  assign _zz_49 = _zz_35[13];
  assign _zz_50 = _zz_35[14];
  assign _zz_51 = _zz_35[15];
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

  assign _zz_52 = ({15'd0,1'b1} <<< cpu_set_d1);
  assign _zz_53 = _zz_52[0];
  assign _zz_54 = _zz_52[1];
  assign _zz_55 = _zz_52[2];
  assign _zz_56 = _zz_52[3];
  assign _zz_57 = _zz_52[4];
  assign _zz_58 = _zz_52[5];
  assign _zz_59 = _zz_52[6];
  assign _zz_60 = _zz_52[7];
  assign _zz_61 = _zz_52[8];
  assign _zz_62 = _zz_52[9];
  assign _zz_63 = _zz_52[10];
  assign _zz_64 = _zz_52[11];
  assign _zz_65 = _zz_52[12];
  assign _zz_66 = _zz_52[13];
  assign _zz_67 = _zz_52[14];
  assign _zz_68 = _zz_52[15];
  assign sram_banks_data_1 = sram_1_ports_rsp_payload_data;
  assign sram_banks_valid_1 = sram_1_ports_rsp_valid;
  always @(*) begin
    if(is_hit) begin
      sram_1_ports_cmd_payload_addr = (icache_hit_1 ? cpu_bank_addr : 5'h0);
    end else begin
      if(next_level_rsp_valid) begin
        sram_1_ports_cmd_payload_addr = {next_level_bank_addr,next_level_data_cnt_value};
      end else begin
        sram_1_ports_cmd_payload_addr = 5'h0;
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

  always @(*) begin
    if(is_hit) begin
      sram_1_ports_cmd_payload_wdata = 256'h0;
    end else begin
      if(next_level_rsp_valid) begin
        sram_1_ports_cmd_payload_wdata = next_level_rsp_payload_data;
      end else begin
        sram_1_ports_cmd_payload_wdata = 256'h0;
      end
    end
  end

  assign when_ICache_l201_1 = (is_hit && replace_info_full);
  assign when_ICache_l218_1 = (next_level_rsp_valid && (next_level_data_cnt_value == 1'b1));
  assign when_ICache_l227_1 = (next_level_rsp_valid && (next_level_data_cnt_value == 1'b1));
  assign _zz_69 = ({15'd0,1'b1} <<< cpu_set);
  assign _zz_70 = _zz_69[0];
  assign _zz_71 = _zz_69[1];
  assign _zz_72 = _zz_69[2];
  assign _zz_73 = _zz_69[3];
  assign _zz_74 = _zz_69[4];
  assign _zz_75 = _zz_69[5];
  assign _zz_76 = _zz_69[6];
  assign _zz_77 = _zz_69[7];
  assign _zz_78 = _zz_69[8];
  assign _zz_79 = _zz_69[9];
  assign _zz_80 = _zz_69[10];
  assign _zz_81 = _zz_69[11];
  assign _zz_82 = _zz_69[12];
  assign _zz_83 = _zz_69[13];
  assign _zz_84 = _zz_69[14];
  assign _zz_85 = _zz_69[15];
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

  assign _zz_86 = ({15'd0,1'b1} <<< cpu_set_d1);
  assign _zz_87 = _zz_86[0];
  assign _zz_88 = _zz_86[1];
  assign _zz_89 = _zz_86[2];
  assign _zz_90 = _zz_86[3];
  assign _zz_91 = _zz_86[4];
  assign _zz_92 = _zz_86[5];
  assign _zz_93 = _zz_86[6];
  assign _zz_94 = _zz_86[7];
  assign _zz_95 = _zz_86[8];
  assign _zz_96 = _zz_86[9];
  assign _zz_97 = _zz_86[10];
  assign _zz_98 = _zz_86[11];
  assign _zz_99 = _zz_86[12];
  assign _zz_100 = _zz_86[13];
  assign _zz_101 = _zz_86[14];
  assign _zz_102 = _zz_86[15];
  assign sram_banks_data_2 = sram_2_ports_rsp_payload_data;
  assign sram_banks_valid_2 = sram_2_ports_rsp_valid;
  always @(*) begin
    if(is_hit) begin
      sram_2_ports_cmd_payload_addr = (icache_hit_2 ? cpu_bank_addr : 5'h0);
    end else begin
      if(next_level_rsp_valid) begin
        sram_2_ports_cmd_payload_addr = {next_level_bank_addr,next_level_data_cnt_value};
      end else begin
        sram_2_ports_cmd_payload_addr = 5'h0;
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

  always @(*) begin
    if(is_hit) begin
      sram_2_ports_cmd_payload_wdata = 256'h0;
    end else begin
      if(next_level_rsp_valid) begin
        sram_2_ports_cmd_payload_wdata = next_level_rsp_payload_data;
      end else begin
        sram_2_ports_cmd_payload_wdata = 256'h0;
      end
    end
  end

  assign when_ICache_l201_2 = (is_hit && replace_info_full);
  assign when_ICache_l218_2 = (next_level_rsp_valid && (next_level_data_cnt_value == 1'b1));
  assign when_ICache_l227_2 = (next_level_rsp_valid && (next_level_data_cnt_value == 1'b1));
  assign _zz_103 = ({15'd0,1'b1} <<< cpu_set);
  assign _zz_104 = _zz_103[0];
  assign _zz_105 = _zz_103[1];
  assign _zz_106 = _zz_103[2];
  assign _zz_107 = _zz_103[3];
  assign _zz_108 = _zz_103[4];
  assign _zz_109 = _zz_103[5];
  assign _zz_110 = _zz_103[6];
  assign _zz_111 = _zz_103[7];
  assign _zz_112 = _zz_103[8];
  assign _zz_113 = _zz_103[9];
  assign _zz_114 = _zz_103[10];
  assign _zz_115 = _zz_103[11];
  assign _zz_116 = _zz_103[12];
  assign _zz_117 = _zz_103[13];
  assign _zz_118 = _zz_103[14];
  assign _zz_119 = _zz_103[15];
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

  assign _zz_120 = ({15'd0,1'b1} <<< cpu_set_d1);
  assign _zz_121 = _zz_120[0];
  assign _zz_122 = _zz_120[1];
  assign _zz_123 = _zz_120[2];
  assign _zz_124 = _zz_120[3];
  assign _zz_125 = _zz_120[4];
  assign _zz_126 = _zz_120[5];
  assign _zz_127 = _zz_120[6];
  assign _zz_128 = _zz_120[7];
  assign _zz_129 = _zz_120[8];
  assign _zz_130 = _zz_120[9];
  assign _zz_131 = _zz_120[10];
  assign _zz_132 = _zz_120[11];
  assign _zz_133 = _zz_120[12];
  assign _zz_134 = _zz_120[13];
  assign _zz_135 = _zz_120[14];
  assign _zz_136 = _zz_120[15];
  assign sram_banks_data_3 = sram_3_ports_rsp_payload_data;
  assign sram_banks_valid_3 = sram_3_ports_rsp_valid;
  always @(*) begin
    if(is_hit) begin
      sram_3_ports_cmd_payload_addr = (icache_hit_3 ? cpu_bank_addr : 5'h0);
    end else begin
      if(next_level_rsp_valid) begin
        sram_3_ports_cmd_payload_addr = {next_level_bank_addr,next_level_data_cnt_value};
      end else begin
        sram_3_ports_cmd_payload_addr = 5'h0;
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

  always @(*) begin
    if(is_hit) begin
      sram_3_ports_cmd_payload_wdata = 256'h0;
    end else begin
      if(next_level_rsp_valid) begin
        sram_3_ports_cmd_payload_wdata = next_level_rsp_payload_data;
      end else begin
        sram_3_ports_cmd_payload_wdata = 256'h0;
      end
    end
  end

  assign when_ICache_l201_3 = (is_hit && replace_info_full);
  assign when_ICache_l218_3 = (next_level_rsp_valid && (next_level_data_cnt_value == 1'b1));
  assign when_ICache_l227_3 = (next_level_rsp_valid && (next_level_data_cnt_value == 1'b1));
  assign _zz_cpu_rsp_payload_data = _zz__zz_cpu_rsp_payload_data;
  assign cpu_rsp_payload_data = _zz_cpu_rsp_payload_data_1;
  assign cpu_rsp_valid = _zz_cpu_rsp_valid;
  assign cpu_cmd_ready = cpu_cmd_ready_1;
  assign next_level_cmd_payload_addr = cpu_addr_d1;
  assign next_level_cmd_payload_len = 4'b0010;
  assign next_level_cmd_valid = next_level_cmd_valid_1;
  always @(posedge clk or negedge resetn) begin
    if(!resetn) begin
      ways_0_metas_0_valid <= 1'b0;
      ways_0_metas_0_tag <= 54'h0;
      ways_0_metas_0_replace_info <= 1'b0;
      ways_0_metas_1_valid <= 1'b0;
      ways_0_metas_1_tag <= 54'h0;
      ways_0_metas_1_replace_info <= 1'b0;
      ways_0_metas_2_valid <= 1'b0;
      ways_0_metas_2_tag <= 54'h0;
      ways_0_metas_2_replace_info <= 1'b0;
      ways_0_metas_3_valid <= 1'b0;
      ways_0_metas_3_tag <= 54'h0;
      ways_0_metas_3_replace_info <= 1'b0;
      ways_0_metas_4_valid <= 1'b0;
      ways_0_metas_4_tag <= 54'h0;
      ways_0_metas_4_replace_info <= 1'b0;
      ways_0_metas_5_valid <= 1'b0;
      ways_0_metas_5_tag <= 54'h0;
      ways_0_metas_5_replace_info <= 1'b0;
      ways_0_metas_6_valid <= 1'b0;
      ways_0_metas_6_tag <= 54'h0;
      ways_0_metas_6_replace_info <= 1'b0;
      ways_0_metas_7_valid <= 1'b0;
      ways_0_metas_7_tag <= 54'h0;
      ways_0_metas_7_replace_info <= 1'b0;
      ways_0_metas_8_valid <= 1'b0;
      ways_0_metas_8_tag <= 54'h0;
      ways_0_metas_8_replace_info <= 1'b0;
      ways_0_metas_9_valid <= 1'b0;
      ways_0_metas_9_tag <= 54'h0;
      ways_0_metas_9_replace_info <= 1'b0;
      ways_0_metas_10_valid <= 1'b0;
      ways_0_metas_10_tag <= 54'h0;
      ways_0_metas_10_replace_info <= 1'b0;
      ways_0_metas_11_valid <= 1'b0;
      ways_0_metas_11_tag <= 54'h0;
      ways_0_metas_11_replace_info <= 1'b0;
      ways_0_metas_12_valid <= 1'b0;
      ways_0_metas_12_tag <= 54'h0;
      ways_0_metas_12_replace_info <= 1'b0;
      ways_0_metas_13_valid <= 1'b0;
      ways_0_metas_13_tag <= 54'h0;
      ways_0_metas_13_replace_info <= 1'b0;
      ways_0_metas_14_valid <= 1'b0;
      ways_0_metas_14_tag <= 54'h0;
      ways_0_metas_14_replace_info <= 1'b0;
      ways_0_metas_15_valid <= 1'b0;
      ways_0_metas_15_tag <= 54'h0;
      ways_0_metas_15_replace_info <= 1'b0;
      ways_1_metas_0_valid <= 1'b0;
      ways_1_metas_0_tag <= 54'h0;
      ways_1_metas_0_replace_info <= 1'b0;
      ways_1_metas_1_valid <= 1'b0;
      ways_1_metas_1_tag <= 54'h0;
      ways_1_metas_1_replace_info <= 1'b0;
      ways_1_metas_2_valid <= 1'b0;
      ways_1_metas_2_tag <= 54'h0;
      ways_1_metas_2_replace_info <= 1'b0;
      ways_1_metas_3_valid <= 1'b0;
      ways_1_metas_3_tag <= 54'h0;
      ways_1_metas_3_replace_info <= 1'b0;
      ways_1_metas_4_valid <= 1'b0;
      ways_1_metas_4_tag <= 54'h0;
      ways_1_metas_4_replace_info <= 1'b0;
      ways_1_metas_5_valid <= 1'b0;
      ways_1_metas_5_tag <= 54'h0;
      ways_1_metas_5_replace_info <= 1'b0;
      ways_1_metas_6_valid <= 1'b0;
      ways_1_metas_6_tag <= 54'h0;
      ways_1_metas_6_replace_info <= 1'b0;
      ways_1_metas_7_valid <= 1'b0;
      ways_1_metas_7_tag <= 54'h0;
      ways_1_metas_7_replace_info <= 1'b0;
      ways_1_metas_8_valid <= 1'b0;
      ways_1_metas_8_tag <= 54'h0;
      ways_1_metas_8_replace_info <= 1'b0;
      ways_1_metas_9_valid <= 1'b0;
      ways_1_metas_9_tag <= 54'h0;
      ways_1_metas_9_replace_info <= 1'b0;
      ways_1_metas_10_valid <= 1'b0;
      ways_1_metas_10_tag <= 54'h0;
      ways_1_metas_10_replace_info <= 1'b0;
      ways_1_metas_11_valid <= 1'b0;
      ways_1_metas_11_tag <= 54'h0;
      ways_1_metas_11_replace_info <= 1'b0;
      ways_1_metas_12_valid <= 1'b0;
      ways_1_metas_12_tag <= 54'h0;
      ways_1_metas_12_replace_info <= 1'b0;
      ways_1_metas_13_valid <= 1'b0;
      ways_1_metas_13_tag <= 54'h0;
      ways_1_metas_13_replace_info <= 1'b0;
      ways_1_metas_14_valid <= 1'b0;
      ways_1_metas_14_tag <= 54'h0;
      ways_1_metas_14_replace_info <= 1'b0;
      ways_1_metas_15_valid <= 1'b0;
      ways_1_metas_15_tag <= 54'h0;
      ways_1_metas_15_replace_info <= 1'b0;
      ways_2_metas_0_valid <= 1'b0;
      ways_2_metas_0_tag <= 54'h0;
      ways_2_metas_0_replace_info <= 1'b0;
      ways_2_metas_1_valid <= 1'b0;
      ways_2_metas_1_tag <= 54'h0;
      ways_2_metas_1_replace_info <= 1'b0;
      ways_2_metas_2_valid <= 1'b0;
      ways_2_metas_2_tag <= 54'h0;
      ways_2_metas_2_replace_info <= 1'b0;
      ways_2_metas_3_valid <= 1'b0;
      ways_2_metas_3_tag <= 54'h0;
      ways_2_metas_3_replace_info <= 1'b0;
      ways_2_metas_4_valid <= 1'b0;
      ways_2_metas_4_tag <= 54'h0;
      ways_2_metas_4_replace_info <= 1'b0;
      ways_2_metas_5_valid <= 1'b0;
      ways_2_metas_5_tag <= 54'h0;
      ways_2_metas_5_replace_info <= 1'b0;
      ways_2_metas_6_valid <= 1'b0;
      ways_2_metas_6_tag <= 54'h0;
      ways_2_metas_6_replace_info <= 1'b0;
      ways_2_metas_7_valid <= 1'b0;
      ways_2_metas_7_tag <= 54'h0;
      ways_2_metas_7_replace_info <= 1'b0;
      ways_2_metas_8_valid <= 1'b0;
      ways_2_metas_8_tag <= 54'h0;
      ways_2_metas_8_replace_info <= 1'b0;
      ways_2_metas_9_valid <= 1'b0;
      ways_2_metas_9_tag <= 54'h0;
      ways_2_metas_9_replace_info <= 1'b0;
      ways_2_metas_10_valid <= 1'b0;
      ways_2_metas_10_tag <= 54'h0;
      ways_2_metas_10_replace_info <= 1'b0;
      ways_2_metas_11_valid <= 1'b0;
      ways_2_metas_11_tag <= 54'h0;
      ways_2_metas_11_replace_info <= 1'b0;
      ways_2_metas_12_valid <= 1'b0;
      ways_2_metas_12_tag <= 54'h0;
      ways_2_metas_12_replace_info <= 1'b0;
      ways_2_metas_13_valid <= 1'b0;
      ways_2_metas_13_tag <= 54'h0;
      ways_2_metas_13_replace_info <= 1'b0;
      ways_2_metas_14_valid <= 1'b0;
      ways_2_metas_14_tag <= 54'h0;
      ways_2_metas_14_replace_info <= 1'b0;
      ways_2_metas_15_valid <= 1'b0;
      ways_2_metas_15_tag <= 54'h0;
      ways_2_metas_15_replace_info <= 1'b0;
      ways_3_metas_0_valid <= 1'b0;
      ways_3_metas_0_tag <= 54'h0;
      ways_3_metas_0_replace_info <= 1'b0;
      ways_3_metas_1_valid <= 1'b0;
      ways_3_metas_1_tag <= 54'h0;
      ways_3_metas_1_replace_info <= 1'b0;
      ways_3_metas_2_valid <= 1'b0;
      ways_3_metas_2_tag <= 54'h0;
      ways_3_metas_2_replace_info <= 1'b0;
      ways_3_metas_3_valid <= 1'b0;
      ways_3_metas_3_tag <= 54'h0;
      ways_3_metas_3_replace_info <= 1'b0;
      ways_3_metas_4_valid <= 1'b0;
      ways_3_metas_4_tag <= 54'h0;
      ways_3_metas_4_replace_info <= 1'b0;
      ways_3_metas_5_valid <= 1'b0;
      ways_3_metas_5_tag <= 54'h0;
      ways_3_metas_5_replace_info <= 1'b0;
      ways_3_metas_6_valid <= 1'b0;
      ways_3_metas_6_tag <= 54'h0;
      ways_3_metas_6_replace_info <= 1'b0;
      ways_3_metas_7_valid <= 1'b0;
      ways_3_metas_7_tag <= 54'h0;
      ways_3_metas_7_replace_info <= 1'b0;
      ways_3_metas_8_valid <= 1'b0;
      ways_3_metas_8_tag <= 54'h0;
      ways_3_metas_8_replace_info <= 1'b0;
      ways_3_metas_9_valid <= 1'b0;
      ways_3_metas_9_tag <= 54'h0;
      ways_3_metas_9_replace_info <= 1'b0;
      ways_3_metas_10_valid <= 1'b0;
      ways_3_metas_10_tag <= 54'h0;
      ways_3_metas_10_replace_info <= 1'b0;
      ways_3_metas_11_valid <= 1'b0;
      ways_3_metas_11_tag <= 54'h0;
      ways_3_metas_11_replace_info <= 1'b0;
      ways_3_metas_12_valid <= 1'b0;
      ways_3_metas_12_tag <= 54'h0;
      ways_3_metas_12_replace_info <= 1'b0;
      ways_3_metas_13_valid <= 1'b0;
      ways_3_metas_13_tag <= 54'h0;
      ways_3_metas_13_replace_info <= 1'b0;
      ways_3_metas_14_valid <= 1'b0;
      ways_3_metas_14_tag <= 54'h0;
      ways_3_metas_14_replace_info <= 1'b0;
      ways_3_metas_15_valid <= 1'b0;
      ways_3_metas_15_tag <= 54'h0;
      ways_3_metas_15_replace_info <= 1'b0;
      cpu_addr_d1 <= 64'h0;
      cpu_cmd_ready_1 <= 1'b1;
      next_level_cmd_valid_1 <= 1'b0;
      next_level_data_cnt_value <= 1'b0;
    end else begin
      if(is_miss) begin
        cpu_addr_d1 <= cpu_cmd_payload_addr;
      end
      next_level_data_cnt_value <= next_level_data_cnt_valueNext;
      if(is_miss) begin
        next_level_cmd_valid_1 <= 1'b1;
      end else begin
        if(next_level_cmd_fire) begin
          next_level_cmd_valid_1 <= 1'b0;
        end
      end
      if(flush) begin
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
        if(_zz_19) begin
          ways_0_metas_0_valid <= 1'b0;
        end
        if(_zz_20) begin
          ways_0_metas_1_valid <= 1'b0;
        end
        if(_zz_21) begin
          ways_0_metas_2_valid <= 1'b0;
        end
        if(_zz_22) begin
          ways_0_metas_3_valid <= 1'b0;
        end
        if(_zz_23) begin
          ways_0_metas_4_valid <= 1'b0;
        end
        if(_zz_24) begin
          ways_0_metas_5_valid <= 1'b0;
        end
        if(_zz_25) begin
          ways_0_metas_6_valid <= 1'b0;
        end
        if(_zz_26) begin
          ways_0_metas_7_valid <= 1'b0;
        end
        if(_zz_27) begin
          ways_0_metas_8_valid <= 1'b0;
        end
        if(_zz_28) begin
          ways_0_metas_9_valid <= 1'b0;
        end
        if(_zz_29) begin
          ways_0_metas_10_valid <= 1'b0;
        end
        if(_zz_30) begin
          ways_0_metas_11_valid <= 1'b0;
        end
        if(_zz_31) begin
          ways_0_metas_12_valid <= 1'b0;
        end
        if(_zz_32) begin
          ways_0_metas_13_valid <= 1'b0;
        end
        if(_zz_33) begin
          ways_0_metas_14_valid <= 1'b0;
        end
        if(_zz_34) begin
          ways_0_metas_15_valid <= 1'b0;
        end
      end else begin
        if(when_ICache_l201) begin
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
                if(_zz_19) begin
                  ways_0_metas_0_valid <= 1'b1;
                end
                if(_zz_20) begin
                  ways_0_metas_1_valid <= 1'b1;
                end
                if(_zz_21) begin
                  ways_0_metas_2_valid <= 1'b1;
                end
                if(_zz_22) begin
                  ways_0_metas_3_valid <= 1'b1;
                end
                if(_zz_23) begin
                  ways_0_metas_4_valid <= 1'b1;
                end
                if(_zz_24) begin
                  ways_0_metas_5_valid <= 1'b1;
                end
                if(_zz_25) begin
                  ways_0_metas_6_valid <= 1'b1;
                end
                if(_zz_26) begin
                  ways_0_metas_7_valid <= 1'b1;
                end
                if(_zz_27) begin
                  ways_0_metas_8_valid <= 1'b1;
                end
                if(_zz_28) begin
                  ways_0_metas_9_valid <= 1'b1;
                end
                if(_zz_29) begin
                  ways_0_metas_10_valid <= 1'b1;
                end
                if(_zz_30) begin
                  ways_0_metas_11_valid <= 1'b1;
                end
                if(_zz_31) begin
                  ways_0_metas_12_valid <= 1'b1;
                end
                if(_zz_32) begin
                  ways_0_metas_13_valid <= 1'b1;
                end
                if(_zz_33) begin
                  ways_0_metas_14_valid <= 1'b1;
                end
                if(_zz_34) begin
                  ways_0_metas_15_valid <= 1'b1;
                end
              end
            end
          end
        end
      end
      if(when_ICache_l218) begin
        if(_zz_19) begin
          ways_0_metas_0_tag <= cpu_tag_d1;
        end
        if(_zz_20) begin
          ways_0_metas_1_tag <= cpu_tag_d1;
        end
        if(_zz_21) begin
          ways_0_metas_2_tag <= cpu_tag_d1;
        end
        if(_zz_22) begin
          ways_0_metas_3_tag <= cpu_tag_d1;
        end
        if(_zz_23) begin
          ways_0_metas_4_tag <= cpu_tag_d1;
        end
        if(_zz_24) begin
          ways_0_metas_5_tag <= cpu_tag_d1;
        end
        if(_zz_25) begin
          ways_0_metas_6_tag <= cpu_tag_d1;
        end
        if(_zz_26) begin
          ways_0_metas_7_tag <= cpu_tag_d1;
        end
        if(_zz_27) begin
          ways_0_metas_8_tag <= cpu_tag_d1;
        end
        if(_zz_28) begin
          ways_0_metas_9_tag <= cpu_tag_d1;
        end
        if(_zz_29) begin
          ways_0_metas_10_tag <= cpu_tag_d1;
        end
        if(_zz_30) begin
          ways_0_metas_11_tag <= cpu_tag_d1;
        end
        if(_zz_31) begin
          ways_0_metas_12_tag <= cpu_tag_d1;
        end
        if(_zz_32) begin
          ways_0_metas_13_tag <= cpu_tag_d1;
        end
        if(_zz_33) begin
          ways_0_metas_14_tag <= cpu_tag_d1;
        end
        if(_zz_34) begin
          ways_0_metas_15_tag <= cpu_tag_d1;
        end
      end
      if(flush) begin
        cpu_cmd_ready_1 <= 1'b0;
      end else begin
        if(is_miss) begin
          cpu_cmd_ready_1 <= 1'b0;
        end else begin
          if(when_ICache_l227) begin
            cpu_cmd_ready_1 <= 1'b1;
          end
        end
      end
      if(flush) begin
        if(_zz_36) begin
          ways_1_metas_0_replace_info <= 1'b0;
        end
        if(_zz_37) begin
          ways_1_metas_1_replace_info <= 1'b0;
        end
        if(_zz_38) begin
          ways_1_metas_2_replace_info <= 1'b0;
        end
        if(_zz_39) begin
          ways_1_metas_3_replace_info <= 1'b0;
        end
        if(_zz_40) begin
          ways_1_metas_4_replace_info <= 1'b0;
        end
        if(_zz_41) begin
          ways_1_metas_5_replace_info <= 1'b0;
        end
        if(_zz_42) begin
          ways_1_metas_6_replace_info <= 1'b0;
        end
        if(_zz_43) begin
          ways_1_metas_7_replace_info <= 1'b0;
        end
        if(_zz_44) begin
          ways_1_metas_8_replace_info <= 1'b0;
        end
        if(_zz_45) begin
          ways_1_metas_9_replace_info <= 1'b0;
        end
        if(_zz_46) begin
          ways_1_metas_10_replace_info <= 1'b0;
        end
        if(_zz_47) begin
          ways_1_metas_11_replace_info <= 1'b0;
        end
        if(_zz_48) begin
          ways_1_metas_12_replace_info <= 1'b0;
        end
        if(_zz_49) begin
          ways_1_metas_13_replace_info <= 1'b0;
        end
        if(_zz_50) begin
          ways_1_metas_14_replace_info <= 1'b0;
        end
        if(_zz_51) begin
          ways_1_metas_15_replace_info <= 1'b0;
        end
        if(_zz_53) begin
          ways_1_metas_0_valid <= 1'b0;
        end
        if(_zz_54) begin
          ways_1_metas_1_valid <= 1'b0;
        end
        if(_zz_55) begin
          ways_1_metas_2_valid <= 1'b0;
        end
        if(_zz_56) begin
          ways_1_metas_3_valid <= 1'b0;
        end
        if(_zz_57) begin
          ways_1_metas_4_valid <= 1'b0;
        end
        if(_zz_58) begin
          ways_1_metas_5_valid <= 1'b0;
        end
        if(_zz_59) begin
          ways_1_metas_6_valid <= 1'b0;
        end
        if(_zz_60) begin
          ways_1_metas_7_valid <= 1'b0;
        end
        if(_zz_61) begin
          ways_1_metas_8_valid <= 1'b0;
        end
        if(_zz_62) begin
          ways_1_metas_9_valid <= 1'b0;
        end
        if(_zz_63) begin
          ways_1_metas_10_valid <= 1'b0;
        end
        if(_zz_64) begin
          ways_1_metas_11_valid <= 1'b0;
        end
        if(_zz_65) begin
          ways_1_metas_12_valid <= 1'b0;
        end
        if(_zz_66) begin
          ways_1_metas_13_valid <= 1'b0;
        end
        if(_zz_67) begin
          ways_1_metas_14_valid <= 1'b0;
        end
        if(_zz_68) begin
          ways_1_metas_15_valid <= 1'b0;
        end
      end else begin
        if(when_ICache_l201_1) begin
          if(icache_hit_1) begin
            if(_zz_36) begin
              ways_1_metas_0_replace_info <= 1'b1;
            end
            if(_zz_37) begin
              ways_1_metas_1_replace_info <= 1'b1;
            end
            if(_zz_38) begin
              ways_1_metas_2_replace_info <= 1'b1;
            end
            if(_zz_39) begin
              ways_1_metas_3_replace_info <= 1'b1;
            end
            if(_zz_40) begin
              ways_1_metas_4_replace_info <= 1'b1;
            end
            if(_zz_41) begin
              ways_1_metas_5_replace_info <= 1'b1;
            end
            if(_zz_42) begin
              ways_1_metas_6_replace_info <= 1'b1;
            end
            if(_zz_43) begin
              ways_1_metas_7_replace_info <= 1'b1;
            end
            if(_zz_44) begin
              ways_1_metas_8_replace_info <= 1'b1;
            end
            if(_zz_45) begin
              ways_1_metas_9_replace_info <= 1'b1;
            end
            if(_zz_46) begin
              ways_1_metas_10_replace_info <= 1'b1;
            end
            if(_zz_47) begin
              ways_1_metas_11_replace_info <= 1'b1;
            end
            if(_zz_48) begin
              ways_1_metas_12_replace_info <= 1'b1;
            end
            if(_zz_49) begin
              ways_1_metas_13_replace_info <= 1'b1;
            end
            if(_zz_50) begin
              ways_1_metas_14_replace_info <= 1'b1;
            end
            if(_zz_51) begin
              ways_1_metas_15_replace_info <= 1'b1;
            end
          end else begin
            if(_zz_36) begin
              ways_1_metas_0_replace_info <= 1'b0;
            end
            if(_zz_37) begin
              ways_1_metas_1_replace_info <= 1'b0;
            end
            if(_zz_38) begin
              ways_1_metas_2_replace_info <= 1'b0;
            end
            if(_zz_39) begin
              ways_1_metas_3_replace_info <= 1'b0;
            end
            if(_zz_40) begin
              ways_1_metas_4_replace_info <= 1'b0;
            end
            if(_zz_41) begin
              ways_1_metas_5_replace_info <= 1'b0;
            end
            if(_zz_42) begin
              ways_1_metas_6_replace_info <= 1'b0;
            end
            if(_zz_43) begin
              ways_1_metas_7_replace_info <= 1'b0;
            end
            if(_zz_44) begin
              ways_1_metas_8_replace_info <= 1'b0;
            end
            if(_zz_45) begin
              ways_1_metas_9_replace_info <= 1'b0;
            end
            if(_zz_46) begin
              ways_1_metas_10_replace_info <= 1'b0;
            end
            if(_zz_47) begin
              ways_1_metas_11_replace_info <= 1'b0;
            end
            if(_zz_48) begin
              ways_1_metas_12_replace_info <= 1'b0;
            end
            if(_zz_49) begin
              ways_1_metas_13_replace_info <= 1'b0;
            end
            if(_zz_50) begin
              ways_1_metas_14_replace_info <= 1'b0;
            end
            if(_zz_51) begin
              ways_1_metas_15_replace_info <= 1'b0;
            end
          end
        end else begin
          if(is_hit) begin
            if(icache_hit_1) begin
              if(_zz_36) begin
                ways_1_metas_0_replace_info <= 1'b1;
              end
              if(_zz_37) begin
                ways_1_metas_1_replace_info <= 1'b1;
              end
              if(_zz_38) begin
                ways_1_metas_2_replace_info <= 1'b1;
              end
              if(_zz_39) begin
                ways_1_metas_3_replace_info <= 1'b1;
              end
              if(_zz_40) begin
                ways_1_metas_4_replace_info <= 1'b1;
              end
              if(_zz_41) begin
                ways_1_metas_5_replace_info <= 1'b1;
              end
              if(_zz_42) begin
                ways_1_metas_6_replace_info <= 1'b1;
              end
              if(_zz_43) begin
                ways_1_metas_7_replace_info <= 1'b1;
              end
              if(_zz_44) begin
                ways_1_metas_8_replace_info <= 1'b1;
              end
              if(_zz_45) begin
                ways_1_metas_9_replace_info <= 1'b1;
              end
              if(_zz_46) begin
                ways_1_metas_10_replace_info <= 1'b1;
              end
              if(_zz_47) begin
                ways_1_metas_11_replace_info <= 1'b1;
              end
              if(_zz_48) begin
                ways_1_metas_12_replace_info <= 1'b1;
              end
              if(_zz_49) begin
                ways_1_metas_13_replace_info <= 1'b1;
              end
              if(_zz_50) begin
                ways_1_metas_14_replace_info <= 1'b1;
              end
              if(_zz_51) begin
                ways_1_metas_15_replace_info <= 1'b1;
              end
            end
          end else begin
            if(next_level_rsp_valid) begin
              if(icache_victim_1) begin
                if(_zz_53) begin
                  ways_1_metas_0_valid <= 1'b1;
                end
                if(_zz_54) begin
                  ways_1_metas_1_valid <= 1'b1;
                end
                if(_zz_55) begin
                  ways_1_metas_2_valid <= 1'b1;
                end
                if(_zz_56) begin
                  ways_1_metas_3_valid <= 1'b1;
                end
                if(_zz_57) begin
                  ways_1_metas_4_valid <= 1'b1;
                end
                if(_zz_58) begin
                  ways_1_metas_5_valid <= 1'b1;
                end
                if(_zz_59) begin
                  ways_1_metas_6_valid <= 1'b1;
                end
                if(_zz_60) begin
                  ways_1_metas_7_valid <= 1'b1;
                end
                if(_zz_61) begin
                  ways_1_metas_8_valid <= 1'b1;
                end
                if(_zz_62) begin
                  ways_1_metas_9_valid <= 1'b1;
                end
                if(_zz_63) begin
                  ways_1_metas_10_valid <= 1'b1;
                end
                if(_zz_64) begin
                  ways_1_metas_11_valid <= 1'b1;
                end
                if(_zz_65) begin
                  ways_1_metas_12_valid <= 1'b1;
                end
                if(_zz_66) begin
                  ways_1_metas_13_valid <= 1'b1;
                end
                if(_zz_67) begin
                  ways_1_metas_14_valid <= 1'b1;
                end
                if(_zz_68) begin
                  ways_1_metas_15_valid <= 1'b1;
                end
              end
            end
          end
        end
      end
      if(when_ICache_l218_1) begin
        if(_zz_53) begin
          ways_1_metas_0_tag <= cpu_tag_d1;
        end
        if(_zz_54) begin
          ways_1_metas_1_tag <= cpu_tag_d1;
        end
        if(_zz_55) begin
          ways_1_metas_2_tag <= cpu_tag_d1;
        end
        if(_zz_56) begin
          ways_1_metas_3_tag <= cpu_tag_d1;
        end
        if(_zz_57) begin
          ways_1_metas_4_tag <= cpu_tag_d1;
        end
        if(_zz_58) begin
          ways_1_metas_5_tag <= cpu_tag_d1;
        end
        if(_zz_59) begin
          ways_1_metas_6_tag <= cpu_tag_d1;
        end
        if(_zz_60) begin
          ways_1_metas_7_tag <= cpu_tag_d1;
        end
        if(_zz_61) begin
          ways_1_metas_8_tag <= cpu_tag_d1;
        end
        if(_zz_62) begin
          ways_1_metas_9_tag <= cpu_tag_d1;
        end
        if(_zz_63) begin
          ways_1_metas_10_tag <= cpu_tag_d1;
        end
        if(_zz_64) begin
          ways_1_metas_11_tag <= cpu_tag_d1;
        end
        if(_zz_65) begin
          ways_1_metas_12_tag <= cpu_tag_d1;
        end
        if(_zz_66) begin
          ways_1_metas_13_tag <= cpu_tag_d1;
        end
        if(_zz_67) begin
          ways_1_metas_14_tag <= cpu_tag_d1;
        end
        if(_zz_68) begin
          ways_1_metas_15_tag <= cpu_tag_d1;
        end
      end
      if(flush) begin
        cpu_cmd_ready_1 <= 1'b0;
      end else begin
        if(is_miss) begin
          cpu_cmd_ready_1 <= 1'b0;
        end else begin
          if(when_ICache_l227_1) begin
            cpu_cmd_ready_1 <= 1'b1;
          end
        end
      end
      if(flush) begin
        if(_zz_70) begin
          ways_2_metas_0_replace_info <= 1'b0;
        end
        if(_zz_71) begin
          ways_2_metas_1_replace_info <= 1'b0;
        end
        if(_zz_72) begin
          ways_2_metas_2_replace_info <= 1'b0;
        end
        if(_zz_73) begin
          ways_2_metas_3_replace_info <= 1'b0;
        end
        if(_zz_74) begin
          ways_2_metas_4_replace_info <= 1'b0;
        end
        if(_zz_75) begin
          ways_2_metas_5_replace_info <= 1'b0;
        end
        if(_zz_76) begin
          ways_2_metas_6_replace_info <= 1'b0;
        end
        if(_zz_77) begin
          ways_2_metas_7_replace_info <= 1'b0;
        end
        if(_zz_78) begin
          ways_2_metas_8_replace_info <= 1'b0;
        end
        if(_zz_79) begin
          ways_2_metas_9_replace_info <= 1'b0;
        end
        if(_zz_80) begin
          ways_2_metas_10_replace_info <= 1'b0;
        end
        if(_zz_81) begin
          ways_2_metas_11_replace_info <= 1'b0;
        end
        if(_zz_82) begin
          ways_2_metas_12_replace_info <= 1'b0;
        end
        if(_zz_83) begin
          ways_2_metas_13_replace_info <= 1'b0;
        end
        if(_zz_84) begin
          ways_2_metas_14_replace_info <= 1'b0;
        end
        if(_zz_85) begin
          ways_2_metas_15_replace_info <= 1'b0;
        end
        if(_zz_87) begin
          ways_2_metas_0_valid <= 1'b0;
        end
        if(_zz_88) begin
          ways_2_metas_1_valid <= 1'b0;
        end
        if(_zz_89) begin
          ways_2_metas_2_valid <= 1'b0;
        end
        if(_zz_90) begin
          ways_2_metas_3_valid <= 1'b0;
        end
        if(_zz_91) begin
          ways_2_metas_4_valid <= 1'b0;
        end
        if(_zz_92) begin
          ways_2_metas_5_valid <= 1'b0;
        end
        if(_zz_93) begin
          ways_2_metas_6_valid <= 1'b0;
        end
        if(_zz_94) begin
          ways_2_metas_7_valid <= 1'b0;
        end
        if(_zz_95) begin
          ways_2_metas_8_valid <= 1'b0;
        end
        if(_zz_96) begin
          ways_2_metas_9_valid <= 1'b0;
        end
        if(_zz_97) begin
          ways_2_metas_10_valid <= 1'b0;
        end
        if(_zz_98) begin
          ways_2_metas_11_valid <= 1'b0;
        end
        if(_zz_99) begin
          ways_2_metas_12_valid <= 1'b0;
        end
        if(_zz_100) begin
          ways_2_metas_13_valid <= 1'b0;
        end
        if(_zz_101) begin
          ways_2_metas_14_valid <= 1'b0;
        end
        if(_zz_102) begin
          ways_2_metas_15_valid <= 1'b0;
        end
      end else begin
        if(when_ICache_l201_2) begin
          if(icache_hit_2) begin
            if(_zz_70) begin
              ways_2_metas_0_replace_info <= 1'b1;
            end
            if(_zz_71) begin
              ways_2_metas_1_replace_info <= 1'b1;
            end
            if(_zz_72) begin
              ways_2_metas_2_replace_info <= 1'b1;
            end
            if(_zz_73) begin
              ways_2_metas_3_replace_info <= 1'b1;
            end
            if(_zz_74) begin
              ways_2_metas_4_replace_info <= 1'b1;
            end
            if(_zz_75) begin
              ways_2_metas_5_replace_info <= 1'b1;
            end
            if(_zz_76) begin
              ways_2_metas_6_replace_info <= 1'b1;
            end
            if(_zz_77) begin
              ways_2_metas_7_replace_info <= 1'b1;
            end
            if(_zz_78) begin
              ways_2_metas_8_replace_info <= 1'b1;
            end
            if(_zz_79) begin
              ways_2_metas_9_replace_info <= 1'b1;
            end
            if(_zz_80) begin
              ways_2_metas_10_replace_info <= 1'b1;
            end
            if(_zz_81) begin
              ways_2_metas_11_replace_info <= 1'b1;
            end
            if(_zz_82) begin
              ways_2_metas_12_replace_info <= 1'b1;
            end
            if(_zz_83) begin
              ways_2_metas_13_replace_info <= 1'b1;
            end
            if(_zz_84) begin
              ways_2_metas_14_replace_info <= 1'b1;
            end
            if(_zz_85) begin
              ways_2_metas_15_replace_info <= 1'b1;
            end
          end else begin
            if(_zz_70) begin
              ways_2_metas_0_replace_info <= 1'b0;
            end
            if(_zz_71) begin
              ways_2_metas_1_replace_info <= 1'b0;
            end
            if(_zz_72) begin
              ways_2_metas_2_replace_info <= 1'b0;
            end
            if(_zz_73) begin
              ways_2_metas_3_replace_info <= 1'b0;
            end
            if(_zz_74) begin
              ways_2_metas_4_replace_info <= 1'b0;
            end
            if(_zz_75) begin
              ways_2_metas_5_replace_info <= 1'b0;
            end
            if(_zz_76) begin
              ways_2_metas_6_replace_info <= 1'b0;
            end
            if(_zz_77) begin
              ways_2_metas_7_replace_info <= 1'b0;
            end
            if(_zz_78) begin
              ways_2_metas_8_replace_info <= 1'b0;
            end
            if(_zz_79) begin
              ways_2_metas_9_replace_info <= 1'b0;
            end
            if(_zz_80) begin
              ways_2_metas_10_replace_info <= 1'b0;
            end
            if(_zz_81) begin
              ways_2_metas_11_replace_info <= 1'b0;
            end
            if(_zz_82) begin
              ways_2_metas_12_replace_info <= 1'b0;
            end
            if(_zz_83) begin
              ways_2_metas_13_replace_info <= 1'b0;
            end
            if(_zz_84) begin
              ways_2_metas_14_replace_info <= 1'b0;
            end
            if(_zz_85) begin
              ways_2_metas_15_replace_info <= 1'b0;
            end
          end
        end else begin
          if(is_hit) begin
            if(icache_hit_2) begin
              if(_zz_70) begin
                ways_2_metas_0_replace_info <= 1'b1;
              end
              if(_zz_71) begin
                ways_2_metas_1_replace_info <= 1'b1;
              end
              if(_zz_72) begin
                ways_2_metas_2_replace_info <= 1'b1;
              end
              if(_zz_73) begin
                ways_2_metas_3_replace_info <= 1'b1;
              end
              if(_zz_74) begin
                ways_2_metas_4_replace_info <= 1'b1;
              end
              if(_zz_75) begin
                ways_2_metas_5_replace_info <= 1'b1;
              end
              if(_zz_76) begin
                ways_2_metas_6_replace_info <= 1'b1;
              end
              if(_zz_77) begin
                ways_2_metas_7_replace_info <= 1'b1;
              end
              if(_zz_78) begin
                ways_2_metas_8_replace_info <= 1'b1;
              end
              if(_zz_79) begin
                ways_2_metas_9_replace_info <= 1'b1;
              end
              if(_zz_80) begin
                ways_2_metas_10_replace_info <= 1'b1;
              end
              if(_zz_81) begin
                ways_2_metas_11_replace_info <= 1'b1;
              end
              if(_zz_82) begin
                ways_2_metas_12_replace_info <= 1'b1;
              end
              if(_zz_83) begin
                ways_2_metas_13_replace_info <= 1'b1;
              end
              if(_zz_84) begin
                ways_2_metas_14_replace_info <= 1'b1;
              end
              if(_zz_85) begin
                ways_2_metas_15_replace_info <= 1'b1;
              end
            end
          end else begin
            if(next_level_rsp_valid) begin
              if(icache_victim_2) begin
                if(_zz_87) begin
                  ways_2_metas_0_valid <= 1'b1;
                end
                if(_zz_88) begin
                  ways_2_metas_1_valid <= 1'b1;
                end
                if(_zz_89) begin
                  ways_2_metas_2_valid <= 1'b1;
                end
                if(_zz_90) begin
                  ways_2_metas_3_valid <= 1'b1;
                end
                if(_zz_91) begin
                  ways_2_metas_4_valid <= 1'b1;
                end
                if(_zz_92) begin
                  ways_2_metas_5_valid <= 1'b1;
                end
                if(_zz_93) begin
                  ways_2_metas_6_valid <= 1'b1;
                end
                if(_zz_94) begin
                  ways_2_metas_7_valid <= 1'b1;
                end
                if(_zz_95) begin
                  ways_2_metas_8_valid <= 1'b1;
                end
                if(_zz_96) begin
                  ways_2_metas_9_valid <= 1'b1;
                end
                if(_zz_97) begin
                  ways_2_metas_10_valid <= 1'b1;
                end
                if(_zz_98) begin
                  ways_2_metas_11_valid <= 1'b1;
                end
                if(_zz_99) begin
                  ways_2_metas_12_valid <= 1'b1;
                end
                if(_zz_100) begin
                  ways_2_metas_13_valid <= 1'b1;
                end
                if(_zz_101) begin
                  ways_2_metas_14_valid <= 1'b1;
                end
                if(_zz_102) begin
                  ways_2_metas_15_valid <= 1'b1;
                end
              end
            end
          end
        end
      end
      if(when_ICache_l218_2) begin
        if(_zz_87) begin
          ways_2_metas_0_tag <= cpu_tag_d1;
        end
        if(_zz_88) begin
          ways_2_metas_1_tag <= cpu_tag_d1;
        end
        if(_zz_89) begin
          ways_2_metas_2_tag <= cpu_tag_d1;
        end
        if(_zz_90) begin
          ways_2_metas_3_tag <= cpu_tag_d1;
        end
        if(_zz_91) begin
          ways_2_metas_4_tag <= cpu_tag_d1;
        end
        if(_zz_92) begin
          ways_2_metas_5_tag <= cpu_tag_d1;
        end
        if(_zz_93) begin
          ways_2_metas_6_tag <= cpu_tag_d1;
        end
        if(_zz_94) begin
          ways_2_metas_7_tag <= cpu_tag_d1;
        end
        if(_zz_95) begin
          ways_2_metas_8_tag <= cpu_tag_d1;
        end
        if(_zz_96) begin
          ways_2_metas_9_tag <= cpu_tag_d1;
        end
        if(_zz_97) begin
          ways_2_metas_10_tag <= cpu_tag_d1;
        end
        if(_zz_98) begin
          ways_2_metas_11_tag <= cpu_tag_d1;
        end
        if(_zz_99) begin
          ways_2_metas_12_tag <= cpu_tag_d1;
        end
        if(_zz_100) begin
          ways_2_metas_13_tag <= cpu_tag_d1;
        end
        if(_zz_101) begin
          ways_2_metas_14_tag <= cpu_tag_d1;
        end
        if(_zz_102) begin
          ways_2_metas_15_tag <= cpu_tag_d1;
        end
      end
      if(flush) begin
        cpu_cmd_ready_1 <= 1'b0;
      end else begin
        if(is_miss) begin
          cpu_cmd_ready_1 <= 1'b0;
        end else begin
          if(when_ICache_l227_2) begin
            cpu_cmd_ready_1 <= 1'b1;
          end
        end
      end
      if(flush) begin
        if(_zz_104) begin
          ways_3_metas_0_replace_info <= 1'b0;
        end
        if(_zz_105) begin
          ways_3_metas_1_replace_info <= 1'b0;
        end
        if(_zz_106) begin
          ways_3_metas_2_replace_info <= 1'b0;
        end
        if(_zz_107) begin
          ways_3_metas_3_replace_info <= 1'b0;
        end
        if(_zz_108) begin
          ways_3_metas_4_replace_info <= 1'b0;
        end
        if(_zz_109) begin
          ways_3_metas_5_replace_info <= 1'b0;
        end
        if(_zz_110) begin
          ways_3_metas_6_replace_info <= 1'b0;
        end
        if(_zz_111) begin
          ways_3_metas_7_replace_info <= 1'b0;
        end
        if(_zz_112) begin
          ways_3_metas_8_replace_info <= 1'b0;
        end
        if(_zz_113) begin
          ways_3_metas_9_replace_info <= 1'b0;
        end
        if(_zz_114) begin
          ways_3_metas_10_replace_info <= 1'b0;
        end
        if(_zz_115) begin
          ways_3_metas_11_replace_info <= 1'b0;
        end
        if(_zz_116) begin
          ways_3_metas_12_replace_info <= 1'b0;
        end
        if(_zz_117) begin
          ways_3_metas_13_replace_info <= 1'b0;
        end
        if(_zz_118) begin
          ways_3_metas_14_replace_info <= 1'b0;
        end
        if(_zz_119) begin
          ways_3_metas_15_replace_info <= 1'b0;
        end
        if(_zz_121) begin
          ways_3_metas_0_valid <= 1'b0;
        end
        if(_zz_122) begin
          ways_3_metas_1_valid <= 1'b0;
        end
        if(_zz_123) begin
          ways_3_metas_2_valid <= 1'b0;
        end
        if(_zz_124) begin
          ways_3_metas_3_valid <= 1'b0;
        end
        if(_zz_125) begin
          ways_3_metas_4_valid <= 1'b0;
        end
        if(_zz_126) begin
          ways_3_metas_5_valid <= 1'b0;
        end
        if(_zz_127) begin
          ways_3_metas_6_valid <= 1'b0;
        end
        if(_zz_128) begin
          ways_3_metas_7_valid <= 1'b0;
        end
        if(_zz_129) begin
          ways_3_metas_8_valid <= 1'b0;
        end
        if(_zz_130) begin
          ways_3_metas_9_valid <= 1'b0;
        end
        if(_zz_131) begin
          ways_3_metas_10_valid <= 1'b0;
        end
        if(_zz_132) begin
          ways_3_metas_11_valid <= 1'b0;
        end
        if(_zz_133) begin
          ways_3_metas_12_valid <= 1'b0;
        end
        if(_zz_134) begin
          ways_3_metas_13_valid <= 1'b0;
        end
        if(_zz_135) begin
          ways_3_metas_14_valid <= 1'b0;
        end
        if(_zz_136) begin
          ways_3_metas_15_valid <= 1'b0;
        end
      end else begin
        if(when_ICache_l201_3) begin
          if(icache_hit_3) begin
            if(_zz_104) begin
              ways_3_metas_0_replace_info <= 1'b1;
            end
            if(_zz_105) begin
              ways_3_metas_1_replace_info <= 1'b1;
            end
            if(_zz_106) begin
              ways_3_metas_2_replace_info <= 1'b1;
            end
            if(_zz_107) begin
              ways_3_metas_3_replace_info <= 1'b1;
            end
            if(_zz_108) begin
              ways_3_metas_4_replace_info <= 1'b1;
            end
            if(_zz_109) begin
              ways_3_metas_5_replace_info <= 1'b1;
            end
            if(_zz_110) begin
              ways_3_metas_6_replace_info <= 1'b1;
            end
            if(_zz_111) begin
              ways_3_metas_7_replace_info <= 1'b1;
            end
            if(_zz_112) begin
              ways_3_metas_8_replace_info <= 1'b1;
            end
            if(_zz_113) begin
              ways_3_metas_9_replace_info <= 1'b1;
            end
            if(_zz_114) begin
              ways_3_metas_10_replace_info <= 1'b1;
            end
            if(_zz_115) begin
              ways_3_metas_11_replace_info <= 1'b1;
            end
            if(_zz_116) begin
              ways_3_metas_12_replace_info <= 1'b1;
            end
            if(_zz_117) begin
              ways_3_metas_13_replace_info <= 1'b1;
            end
            if(_zz_118) begin
              ways_3_metas_14_replace_info <= 1'b1;
            end
            if(_zz_119) begin
              ways_3_metas_15_replace_info <= 1'b1;
            end
          end else begin
            if(_zz_104) begin
              ways_3_metas_0_replace_info <= 1'b0;
            end
            if(_zz_105) begin
              ways_3_metas_1_replace_info <= 1'b0;
            end
            if(_zz_106) begin
              ways_3_metas_2_replace_info <= 1'b0;
            end
            if(_zz_107) begin
              ways_3_metas_3_replace_info <= 1'b0;
            end
            if(_zz_108) begin
              ways_3_metas_4_replace_info <= 1'b0;
            end
            if(_zz_109) begin
              ways_3_metas_5_replace_info <= 1'b0;
            end
            if(_zz_110) begin
              ways_3_metas_6_replace_info <= 1'b0;
            end
            if(_zz_111) begin
              ways_3_metas_7_replace_info <= 1'b0;
            end
            if(_zz_112) begin
              ways_3_metas_8_replace_info <= 1'b0;
            end
            if(_zz_113) begin
              ways_3_metas_9_replace_info <= 1'b0;
            end
            if(_zz_114) begin
              ways_3_metas_10_replace_info <= 1'b0;
            end
            if(_zz_115) begin
              ways_3_metas_11_replace_info <= 1'b0;
            end
            if(_zz_116) begin
              ways_3_metas_12_replace_info <= 1'b0;
            end
            if(_zz_117) begin
              ways_3_metas_13_replace_info <= 1'b0;
            end
            if(_zz_118) begin
              ways_3_metas_14_replace_info <= 1'b0;
            end
            if(_zz_119) begin
              ways_3_metas_15_replace_info <= 1'b0;
            end
          end
        end else begin
          if(is_hit) begin
            if(icache_hit_3) begin
              if(_zz_104) begin
                ways_3_metas_0_replace_info <= 1'b1;
              end
              if(_zz_105) begin
                ways_3_metas_1_replace_info <= 1'b1;
              end
              if(_zz_106) begin
                ways_3_metas_2_replace_info <= 1'b1;
              end
              if(_zz_107) begin
                ways_3_metas_3_replace_info <= 1'b1;
              end
              if(_zz_108) begin
                ways_3_metas_4_replace_info <= 1'b1;
              end
              if(_zz_109) begin
                ways_3_metas_5_replace_info <= 1'b1;
              end
              if(_zz_110) begin
                ways_3_metas_6_replace_info <= 1'b1;
              end
              if(_zz_111) begin
                ways_3_metas_7_replace_info <= 1'b1;
              end
              if(_zz_112) begin
                ways_3_metas_8_replace_info <= 1'b1;
              end
              if(_zz_113) begin
                ways_3_metas_9_replace_info <= 1'b1;
              end
              if(_zz_114) begin
                ways_3_metas_10_replace_info <= 1'b1;
              end
              if(_zz_115) begin
                ways_3_metas_11_replace_info <= 1'b1;
              end
              if(_zz_116) begin
                ways_3_metas_12_replace_info <= 1'b1;
              end
              if(_zz_117) begin
                ways_3_metas_13_replace_info <= 1'b1;
              end
              if(_zz_118) begin
                ways_3_metas_14_replace_info <= 1'b1;
              end
              if(_zz_119) begin
                ways_3_metas_15_replace_info <= 1'b1;
              end
            end
          end else begin
            if(next_level_rsp_valid) begin
              if(icache_victim_3) begin
                if(_zz_121) begin
                  ways_3_metas_0_valid <= 1'b1;
                end
                if(_zz_122) begin
                  ways_3_metas_1_valid <= 1'b1;
                end
                if(_zz_123) begin
                  ways_3_metas_2_valid <= 1'b1;
                end
                if(_zz_124) begin
                  ways_3_metas_3_valid <= 1'b1;
                end
                if(_zz_125) begin
                  ways_3_metas_4_valid <= 1'b1;
                end
                if(_zz_126) begin
                  ways_3_metas_5_valid <= 1'b1;
                end
                if(_zz_127) begin
                  ways_3_metas_6_valid <= 1'b1;
                end
                if(_zz_128) begin
                  ways_3_metas_7_valid <= 1'b1;
                end
                if(_zz_129) begin
                  ways_3_metas_8_valid <= 1'b1;
                end
                if(_zz_130) begin
                  ways_3_metas_9_valid <= 1'b1;
                end
                if(_zz_131) begin
                  ways_3_metas_10_valid <= 1'b1;
                end
                if(_zz_132) begin
                  ways_3_metas_11_valid <= 1'b1;
                end
                if(_zz_133) begin
                  ways_3_metas_12_valid <= 1'b1;
                end
                if(_zz_134) begin
                  ways_3_metas_13_valid <= 1'b1;
                end
                if(_zz_135) begin
                  ways_3_metas_14_valid <= 1'b1;
                end
                if(_zz_136) begin
                  ways_3_metas_15_valid <= 1'b1;
                end
              end
            end
          end
        end
      end
      if(when_ICache_l218_3) begin
        if(_zz_121) begin
          ways_3_metas_0_tag <= cpu_tag_d1;
        end
        if(_zz_122) begin
          ways_3_metas_1_tag <= cpu_tag_d1;
        end
        if(_zz_123) begin
          ways_3_metas_2_tag <= cpu_tag_d1;
        end
        if(_zz_124) begin
          ways_3_metas_3_tag <= cpu_tag_d1;
        end
        if(_zz_125) begin
          ways_3_metas_4_tag <= cpu_tag_d1;
        end
        if(_zz_126) begin
          ways_3_metas_5_tag <= cpu_tag_d1;
        end
        if(_zz_127) begin
          ways_3_metas_6_tag <= cpu_tag_d1;
        end
        if(_zz_128) begin
          ways_3_metas_7_tag <= cpu_tag_d1;
        end
        if(_zz_129) begin
          ways_3_metas_8_tag <= cpu_tag_d1;
        end
        if(_zz_130) begin
          ways_3_metas_9_tag <= cpu_tag_d1;
        end
        if(_zz_131) begin
          ways_3_metas_10_tag <= cpu_tag_d1;
        end
        if(_zz_132) begin
          ways_3_metas_11_tag <= cpu_tag_d1;
        end
        if(_zz_133) begin
          ways_3_metas_12_tag <= cpu_tag_d1;
        end
        if(_zz_134) begin
          ways_3_metas_13_tag <= cpu_tag_d1;
        end
        if(_zz_135) begin
          ways_3_metas_14_tag <= cpu_tag_d1;
        end
        if(_zz_136) begin
          ways_3_metas_15_tag <= cpu_tag_d1;
        end
      end
      if(flush) begin
        cpu_cmd_ready_1 <= 1'b0;
      end else begin
        if(is_miss) begin
          cpu_cmd_ready_1 <= 1'b0;
        end else begin
          if(when_ICache_l227_3) begin
            cpu_cmd_ready_1 <= 1'b1;
          end
        end
      end
    end
  end


endmodule
