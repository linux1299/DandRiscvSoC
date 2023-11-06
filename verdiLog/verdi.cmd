debImport "./simWorkspace/tb_DandRiscvSimple/tb_DandRiscvSimple.fsdb" "-f" \
          "./hw/verilog/tb/tb_DandRiscvSimple.f" "-sv" "-v2k"
wvCreateWindow
wvSetPosition -win $_nWave2 {("G1" 0)}
wvOpenFile -win $_nWave2 \
           {/home/lin/SpinalProjects/DandRiscvSoC/simWorkspace/tb_DandRiscvSimple/tb_DandRiscvSimple.fsdb}
srcHBSelect "tb_DandRiscvSimple.u_DandRiscvSimple" -win $_nTrace1
srcSetScope -win $_nTrace1 "tb_DandRiscvSimple.u_DandRiscvSimple" -delim "."
srcHBSelect "tb_DandRiscvSimple.u_DandRiscvSimple" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {8 50 5 1 10 1}
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvZoom -win $_nWave2 0.000000 5848448.466938
wvZoom -win $_nWave2 0.000000 600616.429187
wvZoom -win $_nWave2 39937.553474 207453.402767
wvZoom -win $_nWave2 50766.985918 95508.012530
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 0.000000 2462504.617658
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollUp -win $_nWave2 8
srcHBSelect "tb_DandRiscvSimple.u_DandRiscvSimple" -win $_nTrace1
srcSetScope -win $_nTrace1 "tb_DandRiscvSimple.u_DandRiscvSimple" -delim "."
srcHBSelect "tb_DandRiscvSimple.u_DandRiscvSimple" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "icache_r_payload_data" -line 17 -pos 1 -win $_nTrace1
srcHBSelect "tb_DandRiscvSimple" -win $_nTrace1
srcSetScope -win $_nTrace1 "tb_DandRiscvSimple" -delim "."
srcHBSelect "tb_DandRiscvSimple" -win $_nTrace1
srcSearchString "instrCnt" -win $_nTrace1 -next -case
srcDeselectAll -win $_nTrace1
srcSelect -signal "instrCnt" -line 424 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSelectSignal -win $_nWave2 {( "G1" 43 )} 
wvSetRadix -win $_nWave2 -format UDec
wvSetCursor -win $_nWave2 2335149.373302 -snap {("G1" 43)}
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 37717362.393794 41123827.114887
wvZoom -win $_nWave2 39302935.186024 39592365.140162
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 33981427.488596 34953108.103005
wvZoom -win $_nWave2 34363710.404861 34422937.335551
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSetSearchMode -win $_nWave2 -value 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSetSearchMode -win $_nWave2 -value 2008
wvSearchNext -win $_nWave2
wvZoom -win $_nWave2 14455904.827864 14651942.248987
wvZoom -win $_nWave2 14475747.551683 14499066.373109
srcSearchString "fetch_PC" -win $_nTrace1 -next -case
srcSearchString "fetch_PC" -win $_nTrace1 -next -case
srcHBSelect "tb_DandRiscvSimple.u_DandRiscvSimple" -win $_nTrace1
srcSetScope -win $_nTrace1 "tb_DandRiscvSimple.u_DandRiscvSimple" -delim "."
srcHBSelect "tb_DandRiscvSimple.u_DandRiscvSimple" -win $_nTrace1
srcSearchString "fetch_PC" -win $_nTrace1 -next -case
srcDeselectAll -win $_nTrace1
srcSelect -signal "fetch_PC" -line 307 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
srcSearchString "fetch_arb" -win $_nTrace1 -next -case
srcDeselectAll -win $_nTrace1
srcSelect -signal "fetch_arbitration_isValid" -line 372 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvSetMarker -win $_nWave2 14485000.000000
wvZoom -win $_nWave2 14480562.927069 14490822.519355
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 14 )} 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 14474913.897767 14506507.529573
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
srcHBSelect "tb_DandRiscvSimple.u_DandRiscvSimple.dCache_1" -win $_nTrace1
srcSetScope -win $_nTrace1 "tb_DandRiscvSimple.u_DandRiscvSimple.dCache_1" -delim \
           "."
srcHBSelect "tb_DandRiscvSimple.u_DandRiscvSimple.dCache_1" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {5217 5228 4 1 1 1}
wvSetPosition -win $_nWave2 {("G1" 5)}
wvSetPosition -win $_nWave2 {("G1" 13)}
wvSetPosition -win $_nWave2 {("G1" 15)}
wvSetPosition -win $_nWave2 {("G1" 18)}
wvSetPosition -win $_nWave2 {("G1" 21)}
wvSetPosition -win $_nWave2 {("G1" 0)}
wvSetPosition -win $_nWave2 {("G1" 38)}
wvSetPosition -win $_nWave2 {("G1" 39)}
wvSetPosition -win $_nWave2 {("G1" 40)}
wvSetPosition -win $_nWave2 {("G1" 41)}
wvSetPosition -win $_nWave2 {("G1" 42)}
wvSetPosition -win $_nWave2 {("G1" 43)}
wvSetPosition -win $_nWave2 {("G1" 44)}
wvSetPosition -win $_nWave2 {("G1" 45)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G1" 45)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvAddSignal -win $_nWave2 "/tb_DandRiscvSimple/u_DandRiscvSimple/dCache_1/stall" \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/dCache_1/flush" \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/dCache_1/cpu_cmd_valid" \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/dCache_1/cpu_cmd_ready" \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/dCache_1/cpu_cmd_payload_addr\[63:0\]" \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/dCache_1/cpu_cmd_payload_wen" \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/dCache_1/cpu_cmd_payload_wdata\[63:0\]" \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/dCache_1/cpu_cmd_payload_wstrb\[7:0\]" \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/dCache_1/cpu_cmd_payload_size\[2:0\]" \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/dCache_1/cpu_rsp_valid" \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/dCache_1/cpu_rsp_payload_data\[63:0\]"
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G2" 11)}
wvSetPosition -win $_nWave2 {("G2" 11)}
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvZoom -win $_nWave2 14473554.216154 14520845.459625
wvSetCursor -win $_nWave2 14491041.668945 -snap {("G2" 11)}
srcActiveTrace \
           "tb_DandRiscvSimple.u_DandRiscvSimple.dCache_1.cpu_rsp_payload_data\[63:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 14491000 -TraceValue \
           0000000000000000000000000000000010000000000000000100000110101000
srcDeselectAll -win $_nTrace1
srcSelect -signal "is_hit" -line 11605 -pos 1 -win $_nTrace1
srcSelect -signal "hit_data" -line 11605 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvSetCursor -win $_nWave2 14491094.078893 -snap {("G2" 13)}
srcActiveTrace "tb_DandRiscvSimple.u_DandRiscvSimple.dCache_1.hit_data\[63:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 14491000 -TraceValue \
           0000000000000000000000000000000010000000000000000100000110101000
srcDeselectAll -win $_nTrace1
srcSelect -signal "_zz_hit_data_1" -line 11602 -pos 1 -win $_nTrace1
srcAction -pos 11601 7 6 -win $_nTrace1 -name "_zz_hit_data_1" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "_zz_hit_data\[63 : 0\]" -line 9990 -pos 1 -win $_nTrace1
srcAction -pos 9989 5 5 -win $_nTrace1 -name "_zz_hit_data\[63 : 0\]" -ctrlKey \
          off
srcDeselectAll -win $_nTrace1
srcSelect -signal "_zz__zz_hit_data" -line 11601 -pos 1 -win $_nTrace1
srcAction -pos 11600 7 6 -win $_nTrace1 -name "_zz__zz_hit_data" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "hit_id" -line 9967 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
srcHBSelect "tb_DandRiscvSimple.u_DandRiscvSimple.dCache_1" -win $_nTrace1
srcSetScope -win $_nTrace1 "tb_DandRiscvSimple.u_DandRiscvSimple.dCache_1" -delim \
           "."
srcHBSelect "tb_DandRiscvSimple.u_DandRiscvSimple.dCache_1" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {5228 5235 5 1 10 1}
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 14469562.325075 14513726.441623
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 13972964.814335 14178661.593590
wvSelectSignal -win $_nWave2 {( "G2" 16 )} 
wvSetSearchMode -win $_nWave2 -value 38
wvSearchNext -win $_nWave2
wvSearchPrev -win $_nWave2
wvSearchPrev -win $_nWave2
wvSearchPrev -win $_nWave2
wvZoom -win $_nWave2 11456009.911975 11476222.451052
wvZoom -win $_nWave2 11458421.677807 11464977.499496
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSearchPrev -win $_nWave2
wvZoom -win $_nWave2 11451475.687640 11462961.794273
wvZoom -win $_nWave2 11452932.565126 11456437.516783
wvZoom -win $_nWave2 11454709.201920 11455234.300376
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSearchPrev -win $_nWave2
wvSearchPrev -win $_nWave2
wvSearchPrev -win $_nWave2
wvSearchPrev -win $_nWave2
wvSearchPrev -win $_nWave2
wvZoom -win $_nWave2 11422106.765427 11425906.007196
wvSetCursor -win $_nWave2 11423011.180510 -snap {("G2" 15)}
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 11414368.603875 11431521.063039
wvSelectSignal -win $_nWave2 {( "G2" 18 )} 
wvSetCursor -win $_nWave2 11416985.615103 -snap {("G2" 18)}
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvZoomOut -win $_nWave2
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvZoom -win $_nWave2 11408910.110535 11435664.250437
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G1" 17 )} {( "G2" 18 )} 
wvSelectSignal -win $_nWave2 {( "G2" 18 )} 
wvSelectSignal -win $_nWave2 {( "G1" 21 )} {( "G2" 18 )} 
wvSelectSignal -win $_nWave2 {( "G1" 21 22 )} {( "G2" 18 )} 
wvSelectSignal -win $_nWave2 {( "G1" 21 22 23 )} {( "G2" 18 )} 
wvSelectSignal -win $_nWave2 {( "G1" 23 )} 
wvSetSearchMode -win $_nWave2 -value 800041a8
wvSearchNext -win $_nWave2
wvSearchPrev -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoom -win $_nWave2 11410289.922428 11436781.766841
wvSelectSignal -win $_nWave2 {( "G1" 8 23 )} 
wvSelectSignal -win $_nWave2 {( "G1" 8 9 23 )} 
wvSelectSignal -win $_nWave2 {( "G1" 8 9 10 23 )} 
wvSelectSignal -win $_nWave2 {( "G1" 8 9 23 )} 
wvSelectSignal -win $_nWave2 {( "G1" 8 9 10 23 )} 
wvSelectSignal -win $_nWave2 {( "G1" 9 10 23 )} 
wvSelectSignal -win $_nWave2 {( "G1" 9 10 14 23 )} 
wvSelectSignal -win $_nWave2 {( "G1" 10 14 23 )} 
wvSelectSignal -win $_nWave2 {( "G1" 14 23 )} 
wvSelectSignal -win $_nWave2 {( "G1" 14 15 23 )} 
wvSelectSignal -win $_nWave2 {( "G1" 14 15 16 23 )} 
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 16
srcHBSelect "tb_DandRiscvSimple.u_axi_slave_mem_d" -win $_nTrace1
srcSetScope -win $_nTrace1 "tb_DandRiscvSimple.u_axi_slave_mem_d" -delim "."
srcHBSelect "tb_DandRiscvSimple.u_axi_slave_mem_d" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "axi_mem_rden" -line 76 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "axi_mem_rdaddr" -line 75 -pos 1 -win $_nTrace1
srcSelect -signal "axi_mem_rden" -line 76 -pos 1 -win $_nTrace1
srcSelect -signal "axi_mem_rdata" -line 80 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave2 {("G1" 9)}
wvSetPosition -win $_nWave2 {("G1" 10)}
wvSetPosition -win $_nWave2 {("G1" 11)}
wvSetPosition -win $_nWave2 {("G1" 12)}
wvSetPosition -win $_nWave2 {("G1" 13)}
wvSetPosition -win $_nWave2 {("G1" 14)}
wvSetPosition -win $_nWave2 {("G1" 15)}
wvSetPosition -win $_nWave2 {("G1" 16)}
wvSetPosition -win $_nWave2 {("G1" 17)}
wvSetPosition -win $_nWave2 {("G1" 18)}
wvSetPosition -win $_nWave2 {("G1" 0)}
wvSetPosition -win $_nWave2 {("G1" 28)}
wvSetPosition -win $_nWave2 {("G1" 29)}
wvSetPosition -win $_nWave2 {("G1" 30)}
wvSetPosition -win $_nWave2 {("G1" 31)}
wvSetPosition -win $_nWave2 {("G1" 32)}
wvSetPosition -win $_nWave2 {("G1" 33)}
wvSetPosition -win $_nWave2 {("G1" 34)}
wvSetPosition -win $_nWave2 {("G1" 35)}
wvSetPosition -win $_nWave2 {("G1" 36)}
wvSetPosition -win $_nWave2 {("G1" 37)}
wvSetPosition -win $_nWave2 {("G1" 38)}
wvSetPosition -win $_nWave2 {("G1" 39)}
wvSetPosition -win $_nWave2 {("G1" 40)}
wvSetPosition -win $_nWave2 {("G1" 41)}
wvSetPosition -win $_nWave2 {("G1" 42)}
wvSetPosition -win $_nWave2 {("G1" 43)}
wvSetPosition -win $_nWave2 {("G1" 44)}
wvSetPosition -win $_nWave2 {("G1" 45)}
wvAddSignal -win $_nWave2 \
           "/tb_DandRiscvSimple/u_axi_slave_mem_d/axi_mem_rdaddr\[17:0\]" \
           "/tb_DandRiscvSimple/u_axi_slave_mem_d/axi_mem_rden" \
           "/tb_DandRiscvSimple/u_axi_slave_mem_d/axi_mem_rdata\[63:0\]"
wvSetPosition -win $_nWave2 {("G1" 45)}
wvSetPosition -win $_nWave2 {("G1" 48)}
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 46 )} 
wvSetSearchMode -win $_nWave2 -value 590
wvSearchPrev -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchPrev -win $_nWave2
wvZoom -win $_nWave2 11164702.361963 12071806.860865
wvZoom -win $_nWave2 11378773.941883 11496608.594927
wvZoom -win $_nWave2 11408851.484621 11446520.615654
wvSetMarker -win $_nWave2 11415000.000000
wvSetCursor -win $_nWave2 11415037.346824 -snap {("G1" 46)}
srcActiveTrace "tb_DandRiscvSimple.u_axi_slave_mem_d.axi_mem_rdaddr\[17:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 11415000 -TraceValue \
           000001100111000000
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G1" 21 )} 
wvZoom -win $_nWave2 11220031.008479 11682612.158189
wvZoom -win $_nWave2 11395118.621508 11517404.604712
wvZoom -win $_nWave2 11432540.872663 11465552.950061
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoom -win $_nWave2 11391160.187405 11548360.555970
wvZoom -win $_nWave2 11412296.371409 11461063.712637
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 12720483.193277 15638025.210084
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvScrollUp -win $_nWave2 8
wvScrollDown -win $_nWave2 29
wvZoom -win $_nWave2 0.000000 3987307.422969
wvZoom -win $_nWave2 168930.041379 1213224.842633
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 128708.602956 718866.799463
wvZoom -win $_nWave2 167763.189489 333693.522751
wvSelectSignal -win $_nWave2 {( "G2" 6 )} 
wvSelectSignal -win $_nWave2 {( "G2" 4 6 )} 
wvSelectSignal -win $_nWave2 {( "G2" 4 )} 
wvSelectSignal -win $_nWave2 {( "G2" 1 4 )} 
wvZoom -win $_nWave2 183275.584090 239166.683739
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 4 )} 
wvSelectSignal -win $_nWave2 {( "G2" 4 6 )} 
wvZoom -win $_nWave2 245795.592294 550143.765173
wvSelectSignal -win $_nWave2 {( "G2" 6 )} 
wvSelectSignal -win $_nWave2 {( "G2" 3 6 )} 
wvZoom -win $_nWave2 294388.998048 454022.598528
wvSelectSignal -win $_nWave2 {( "G2" 4 )} 
wvSelectSignal -win $_nWave2 {( "G2" 1 4 )} 
wvSelectSignal -win $_nWave2 {( "G2" 1 4 10 )} 
wvSelectSignal -win $_nWave2 {( "G2" 1 3 4 10 )} 
wvSelectSignal -win $_nWave2 {( "G2" 1 3 4 10 11 )} 
wvSetCursor -win $_nWave2 363194.657078 -snap {("G2" 10)}
wvZoom -win $_nWave2 352071.727633 403047.163081
wvSetCursor -win $_nWave2 365101.163164 -snap {("G2" 4)}
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 301738.839691 351357.785960
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvScrollUp -win $_nWave2 2
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvZoom -win $_nWave2 354276.547505 400281.789004
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 355049.744841 387878.415070
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 298634.088859 431328.125668
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 286089.484539 445731.189887
wvZoom -win $_nWave2 359761.672091 386592.210805
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 367032.973549 -snap {("G2" 5)}
wvSetMarker -win $_nWave2 367000.000000
wvZoom -win $_nWave2 360982.950114 388771.722353
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 2 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 48)}
wvSelectSignal -win $_nWave2 {( "G2" 1 )} 
wvSetCursor -win $_nWave2 364913.854870 -snap {("G2" 1)}
srcActiveTrace "tb_DandRiscvSimple.u_DandRiscvSimple.dCache_1.stall" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 311000 -TraceValue 1
srcDeselectAll -win $_nTrace1
srcSelect -signal "is_miss" -line 11608 -pos 1 -win $_nTrace1
srcSelect -signal "is_write" -line 11608 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {11608 11609 9 1 1 1}
wvSetPosition -win $_nWave2 {("G1" 27)}
wvSetPosition -win $_nWave2 {("G1" 26)}
wvSetPosition -win $_nWave2 {("G1" 29)}
wvSetPosition -win $_nWave2 {("G1" 30)}
wvSetPosition -win $_nWave2 {("G1" 31)}
wvSetPosition -win $_nWave2 {("G1" 32)}
wvSetPosition -win $_nWave2 {("G1" 33)}
wvSetPosition -win $_nWave2 {("G1" 0)}
wvSetPosition -win $_nWave2 {("G1" 43)}
wvSetPosition -win $_nWave2 {("G1" 44)}
wvSetPosition -win $_nWave2 {("G1" 45)}
wvSetPosition -win $_nWave2 {("G1" 46)}
wvSetPosition -win $_nWave2 {("G1" 47)}
wvSetPosition -win $_nWave2 {("G1" 48)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvAddSignal -win $_nWave2 \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/dCache_1/is_miss" \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/dCache_1/is_write" \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/dCache_1/cpu_cmd_ready_1" \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/dCache_1/next_level_wdone"
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G2" 4)}
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G2" 1 2 3 4 5 )} 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 293612.691365 451315.919816
wvZoom -win $_nWave2 302392.387907 366997.702083
wvSelectSignal -win $_nWave2 {( "G2" 5 )} 
wvSelectSignal -win $_nWave2 {( "G2" 5 7 )} 
wvSelectSignal -win $_nWave2 {( "G2" 5 6 7 )} 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 295425.148143 422102.234763
wvZoom -win $_nWave2 356856.438398 382848.305611
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 5 6 7 8 )} 
wvZoom -win $_nWave2 291512.738613 414628.277707
wvZoom -win $_nWave2 357165.737927 380357.670711
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 5 6 7 8 13 )} 
wvSelectSignal -win $_nWave2 {( "G2" 5 6 7 8 13 14 )} 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 298796.125582 421447.019412
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 368367.010738 443263.074757
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 529173.265839 629454.270324
wvZoom -win $_nWave2 544025.809570 593218.277107
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 2555252.431364 2848478.120209
wvZoom -win $_nWave2 2595807.104715 2700633.235076
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
srcHBSelect "tb_DandRiscvSimple.u_DandRiscvSimple" -win $_nTrace1
srcSetScope -win $_nTrace1 "tb_DandRiscvSimple.u_DandRiscvSimple" -delim "."
srcHBSelect "tb_DandRiscvSimple.u_DandRiscvSimple" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSearchString "writeback" -win $_nTrace1 -next -case
srcDeselectAll -win $_nTrace1
srcSelect -signal "writeback_RD" -line 251 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave2 {("G1" 29)}
wvSetPosition -win $_nWave2 {("G1" 28)}
wvSetPosition -win $_nWave2 {("G1" 31)}
wvSetPosition -win $_nWave2 {("G1" 32)}
wvSetPosition -win $_nWave2 {("G1" 33)}
wvSetPosition -win $_nWave2 {("G1" 34)}
wvSetPosition -win $_nWave2 {("G1" 36)}
wvSetPosition -win $_nWave2 {("G1" 0)}
wvSetPosition -win $_nWave2 {("G1" 45)}
wvSetPosition -win $_nWave2 {("G1" 46)}
wvSetPosition -win $_nWave2 {("G1" 47)}
wvSetPosition -win $_nWave2 {("G1" 48)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvAddSignal -win $_nWave2 \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/writeback_RD\[63:0\]"
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G2" 1)}
srcSearchString "writeback_arb" -win $_nTrace1 -next -case
srcDeselectAll -win $_nTrace1
srcSelect -signal "writeback_arbitration_isFiring" -line 421 -pos 1 -win \
          $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvZoom -win $_nWave2 2630015.071625 2640328.847057
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSetMarker -win $_nWave2 2633000.000000
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSetCursor -win $_nWave2 2632973.998886 -snap {("G2" 1)}
srcActiveTrace "tb_DandRiscvSimple.u_DandRiscvSimple.writeback_RD\[63:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 2577000 -TraceValue \
           0000000000000000000000000000000010000000000000000011101000011000
srcDeselectAll -win $_nTrace1
srcSelect -signal "writeback_IS_LOAD" -line 1283 -pos 1 -win $_nTrace1
srcSelect -signal "writeback_LSU_RDATA" -line 1283 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvSetCursor -win $_nWave2 2633075.114332 -snap {("G2" 4)}
srcActiveTrace "tb_DandRiscvSimple.u_DandRiscvSimple.writeback_LSU_RDATA\[63:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 2633000 -TraceValue \
           0000000000000000000000000000000000000111111111110010110111000000
srcDeselectAll -win $_nTrace1
srcSelect -signal "memaccess_to_writeback_LSU_RDATA" -line 1343 -pos 1 -win \
          $_nTrace1
srcAction -pos 1342 7 5 -win $_nTrace1 -name "memaccess_to_writeback_LSU_RDATA" \
          -ctrlKey off
srcSelect -signal "when_Pipeline_l127_40" -line 3479 -pos 1 -win $_nTrace1
srcSelect -signal "_zz_execute_MEM_WDATA" -line 3480 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 6 )} 
wvSetCursor -win $_nWave2 2631038.360360 -snap {("G2" 6)}
srcActiveTrace "tb_DandRiscvSimple.u_DandRiscvSimple.when_Pipeline_l127_40" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 2631000 -TraceValue 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G2" 12 )} 
wvSelectSignal -win $_nWave2 {( "G2" 13 )} 
wvSelectSignal -win $_nWave2 {( "G2" 14 )} 
wvSelectSignal -win $_nWave2 {( "G2" 20 )} 
wvSelectSignal -win $_nWave2 {( "G2" 3 )} 
wvSelectSignal -win $_nWave2 {( "G2" 4 )} 
wvSelectSignal -win $_nWave2 {( "G2" 5 )} 
wvSelectSignal -win $_nWave2 {( "G2" 4 )} 
wvSelectSignal -win $_nWave2 {( "G2" 3 )} 
wvSelectSignal -win $_nWave2 {( "G2" 2 )} 
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvSetCursor -win $_nWave2 2632973.998886 -snap {("G2" 2)}
srcActiveTrace \
           "tb_DandRiscvSimple.u_DandRiscvSimple.writeback_arbitration_isFiring" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 2571000 -TraceValue 0
srcDeselectAll -win $_nTrace1
srcSelect -signal "writeback_arbitration_isValid" -line 3121 -pos 1 -win \
          $_nTrace1
srcSelect -signal "writeback_arbitration_isStuck" -line 3121 -pos 1 -win \
          $_nTrace1
srcSelect -signal "writeback_arbitration_removeIt" -line 3121 -pos 1 -win \
          $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 2545104.676830 2715787.548671
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G2" 8 9 10 16 )} 
wvSelectSignal -win $_nWave2 {( "G2" 8 9 10 16 17 )} 
wvZoom -win $_nWave2 2570085.573338 2676583.079508
wvSelectSignal -win $_nWave2 {( "G2" 8 9 10 15 16 17 )} 
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G2" 8 9 10 15 16 17 23 )} 
wvSelectSignal -win $_nWave2 {( "G2" 8 9 10 15 16 17 23 24 )} 
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSetCursor -win $_nWave2 2576946.757208 -snap {("G2" 16)}
wvZoom -win $_nWave2 2626354.738887 2650145.148178
wvSelectSignal -win $_nWave2 {( "G2" 18 )} 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 17 )} 
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
srcDeselectAll -win $_nTrace1
debReload
srcDeselectAll -win $_nTrace1
wvZoom -win $_nWave2 2623189.348295 2659308.120944
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 23 )} 
wvSelectSignal -win $_nWave2 {( "G2" 8 )} 
wvSelectSignal -win $_nWave2 {( "G2" 9 )} 
wvSelectSignal -win $_nWave2 {( "G2" 2 )} 
wvZoom -win $_nWave2 2625845.140400 2654957.680540
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 2 15 )} 
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G2" 2 8 15 )} 
wvSelectSignal -win $_nWave2 {( "G2" 2 )} 
wvSetCursor -win $_nWave2 2632899.019173 -snap {("G2" 2)}
srcActiveTrace \
           "tb_DandRiscvSimple.u_DandRiscvSimple.writeback_arbitration_isFiring" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 2571000 -TraceValue 0
srcDeselectAll -win $_nTrace1
srcSelect -signal "writeback_arbitration_isValid" -line 3121 -pos 1 -win \
          $_nTrace1
srcSelect -signal "writeback_arbitration_isStuck" -line 3121 -pos 1 -win \
          $_nTrace1
srcSelect -signal "writeback_arbitration_removeIt" -line 3121 -pos 1 -win \
          $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 11 )} 
wvSetCursor -win $_nWave2 2632899.019173 -snap {("G2" 11)}
srcActiveTrace \
           "tb_DandRiscvSimple.u_DandRiscvSimple.writeback_arbitration_isValid" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 2571000 -TraceValue 0
srcDeselectAll -win $_nTrace1
srcSelect -signal "when_Pipeline_l163_3" -line 3348 -pos 1 -win $_nTrace1
srcSelect -signal "memaccess_arbitration_isValid" -line 3349 -pos 1 -win \
          $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
srcDeselectAll -win $_nTrace1
srcSelect -signal "when_Pipeline_l163_3" -line 3348 -pos 1 -win $_nTrace1
srcAction -pos 3347 3 11 -win $_nTrace1 -name "when_Pipeline_l163_3" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "memaccess_arbitration_isStuck" -line 3128 -pos 1 -win \
          $_nTrace1
srcSelect -signal "memaccess_arbitration_removeIt" -line 3128 -pos 1 -win \
          $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvScrollUp -win $_nWave2 3
srcDeselectAll -win $_nTrace1
srcBackwardHistory -win $_nTrace1
srcHBSelect "tb_DandRiscvSimple.u_DandRiscvSimple" -win $_nTrace1
srcHBSelect "tb_DandRiscvSimple.u_DandRiscvSimple" -win $_nTrace1
srcSelect -signal "writeback_arbitration_isValid" -line 3349 -pos 1 -win \
          $_nTrace1
srcSelect -signal "memaccess_arbitration_isValid" -line 3349 -pos 1 -win \
          $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvSetPosition -win $_nWave2 {("G2" 18)}
wvSetPosition -win $_nWave2 {("G2" 17)}
wvSetPosition -win $_nWave2 {("G2" 16)}
wvSetPosition -win $_nWave2 {("G2" 15)}
wvSetPosition -win $_nWave2 {("G2" 14)}
wvSetPosition -win $_nWave2 {("G2" 13)}
wvSetPosition -win $_nWave2 {("G2" 12)}
wvSetPosition -win $_nWave2 {("G2" 11)}
wvSetPosition -win $_nWave2 {("G2" 10)}
wvSetPosition -win $_nWave2 {("G2" 9)}
wvSetPosition -win $_nWave2 {("G2" 8)}
wvSetPosition -win $_nWave2 {("G2" 7)}
wvSetPosition -win $_nWave2 {("G2" 6)}
wvSetPosition -win $_nWave2 {("G2" 5)}
wvSetPosition -win $_nWave2 {("G2" 4)}
wvSetPosition -win $_nWave2 {("G2" 3)}
wvSetPosition -win $_nWave2 {("G2" 2)}
wvSetPosition -win $_nWave2 {("G2" 1)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G2" 3)}
wvScrollDown -win $_nWave2 2
wvSelectSignal -win $_nWave2 {( "G2" 25 )} 
wvSetPosition -win $_nWave2 {("G2" 25)}
wvSetPosition -win $_nWave2 {("G2" 24)}
wvSetPosition -win $_nWave2 {("G2" 23)}
wvSetPosition -win $_nWave2 {("G2" 22)}
wvSetPosition -win $_nWave2 {("G2" 21)}
wvSetPosition -win $_nWave2 {("G2" 20)}
wvSetPosition -win $_nWave2 {("G2" 19)}
wvSetPosition -win $_nWave2 {("G2" 18)}
wvSetPosition -win $_nWave2 {("G2" 17)}
wvSetPosition -win $_nWave2 {("G2" 15)}
wvSetPosition -win $_nWave2 {("G2" 14)}
wvSetPosition -win $_nWave2 {("G2" 13)}
wvSetPosition -win $_nWave2 {("G2" 12)}
wvSetPosition -win $_nWave2 {("G2" 11)}
wvSetPosition -win $_nWave2 {("G2" 10)}
wvSetPosition -win $_nWave2 {("G2" 9)}
wvSetPosition -win $_nWave2 {("G2" 8)}
wvSetPosition -win $_nWave2 {("G2" 7)}
wvSetPosition -win $_nWave2 {("G2" 6)}
wvSetPosition -win $_nWave2 {("G2" 5)}
wvSetPosition -win $_nWave2 {("G2" 4)}
wvSetPosition -win $_nWave2 {("G2" 3)}
wvSetPosition -win $_nWave2 {("G2" 2)}
wvSetPosition -win $_nWave2 {("G2" 1)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G2" 1)}
wvSelectSignal -win $_nWave2 {( "G2" 2 )} 
wvSelectSignal -win $_nWave2 {( "G2" 3 )} 
wvSelectSignal -win $_nWave2 {( "G2" 1 )} 
wvSetMarker -win $_nWave2 2631000.000000
wvSelectSignal -win $_nWave2 {( "G2" 2 )} 
wvSelectSignal -win $_nWave2 {( "G2" 3 )} 
wvSelectSignal -win $_nWave2 {( "G2" 2 )} 
wvSelectSignal -win $_nWave2 {( "G2" 3 )} 
wvSelectSignal -win $_nWave2 {( "G2" 4 )} 
wvSelectSignal -win $_nWave2 {( "G2" 3 )} 
wvSelectSignal -win $_nWave2 {( "G2" 4 )} 
wvSelectSignal -win $_nWave2 {( "G2" 3 )} 
wvSelectSignal -win $_nWave2 {( "G2" 4 )} 
wvSelectSignal -win $_nWave2 {( "G2" 3 )} 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
srcDeselectAll -win $_nTrace1
srcSelect -signal "when_Pipeline_l163_3" -line 3348 -pos 1 -win $_nTrace1
srcAction -pos 3347 3 7 -win $_nTrace1 -name "when_Pipeline_l163_3" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "memaccess_arbitration_isStuck" -line 3128 -pos 1 -win \
          $_nTrace1
srcSelect -signal "memaccess_arbitration_removeIt" -line 3128 -pos 1 -win \
          $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 5 )} 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoom -win $_nWave2 2627027.582506 2666496.684545
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvScrollUp -win $_nWave2 13
wvSelectSignal -win $_nWave2 {( "G2" 1 )} 
wvScrollDown -win $_nWave2 4
wvSetPosition -win $_nWave2 {("G2" 1)}
wvSetPosition -win $_nWave2 {("G2" 2)}
wvSetPosition -win $_nWave2 {("G2" 3)}
wvSetPosition -win $_nWave2 {("G2" 4)}
wvSetPosition -win $_nWave2 {("G2" 5)}
wvSetPosition -win $_nWave2 {("G2" 6)}
wvSetPosition -win $_nWave2 {("G2" 7)}
wvSetPosition -win $_nWave2 {("G2" 8)}
wvSetPosition -win $_nWave2 {("G2" 9)}
wvSetPosition -win $_nWave2 {("G2" 10)}
wvSetPosition -win $_nWave2 {("G2" 11)}
wvSetPosition -win $_nWave2 {("G2" 12)}
wvSetPosition -win $_nWave2 {("G2" 13)}
wvSetPosition -win $_nWave2 {("G2" 14)}
wvSetPosition -win $_nWave2 {("G2" 15)}
wvSetPosition -win $_nWave2 {("G2" 16)}
wvSetPosition -win $_nWave2 {("G2" 17)}
wvSetPosition -win $_nWave2 {("G2" 18)}
wvSetPosition -win $_nWave2 {("G2" 19)}
wvSetPosition -win $_nWave2 {("G2" 20)}
wvSetPosition -win $_nWave2 {("G2" 21)}
wvSetPosition -win $_nWave2 {("G2" 22)}
wvSetPosition -win $_nWave2 {("G2" 23)}
wvSetPosition -win $_nWave2 {("G2" 24)}
wvSetPosition -win $_nWave2 {("G2" 25)}
wvSetPosition -win $_nWave2 {("G2" 26)}
wvSetPosition -win $_nWave2 {("G2" 27)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G2" 27)}
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G2" 27 28 )} 
wvSelectSignal -win $_nWave2 {( "G2" 27 28 29 )} 
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G2" 27 28 29 35 )} 
wvSelectSignal -win $_nWave2 {( "G2" 27 28 29 35 36 )} 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvSetCursor -win $_nWave2 2577110.776986 -snap {("G2" 28)}
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 2642560.940591 2722383.606338
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 2335008.904918 2810814.598783
wvZoom -win $_nWave2 2384988.494609 2591737.397300
wvZoom -win $_nWave2 2409456.677069 2549967.748541
wvSelectSignal -win $_nWave2 {( "G2" 27 28 29 31 35 36 )} 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 3019715.546305 3880887.043170
wvZoom -win $_nWave2 3297425.262206 3600463.551543
wvZoom -win $_nWave2 3309945.751750 3429208.719963
wvSetCursor -win $_nWave2 3317712.877831 -snap {("G2" 28)}
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 3371741.715211 -snap {("G2" 29)}
wvZoom -win $_nWave2 3347688.679606 3518732.488359
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 3353078.715595 3460879.435397
wvSetCursor -win $_nWave2 3379009.771093 -snap {("G2" 30)}
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 3366893.513720 3479450.147632
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoom -win $_nWave2 3373948.008633 3461163.635679
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 3432763.589057 -snap {("G2" 27)}
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 9
wvSelectSignal -win $_nWave2 {( "G2" 17 )} 
wvSelectAll -win $_nWave2
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSelectGroup -win $_nWave2 {G3}
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSelectGroup -win $_nWave2 {G2}
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 0)}
srcHBSelect "tb_DandRiscvSimple.u_DandRiscvSimple.dCache_1" -win $_nTrace1
srcHBSelect "tb_DandRiscvSimple.u_DandRiscvSimple.dCache_1" -win $_nTrace1
srcSetScope -win $_nTrace1 "tb_DandRiscvSimple.u_DandRiscvSimple.dCache_1" -delim \
           "."
srcHBSelect "tb_DandRiscvSimple.u_DandRiscvSimple.dCache_1" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {5217 5227 3 12 14 1}
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoom -win $_nWave2 3427572.182685 3473134.408019
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSetMarker -win $_nWave2 3435000.000000
srcHBSelect "tb_DandRiscvSimple.u_DandRiscvSimple" -win $_nTrace1
srcSetScope -win $_nTrace1 "tb_DandRiscvSimple.u_DandRiscvSimple" -delim "."
srcHBSelect "tb_DandRiscvSimple.u_DandRiscvSimple" -win $_nTrace1
srcSearchString "writeback_arb" -win $_nTrace1 -next -case
srcDeselectAll -win $_nTrace1
srcSelect -signal "memaccess_arbitration_isFiring" -line 410 -pos 1 -win \
          $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "writeback_arbitration_isValid" -line 416 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave2 {("G1" 0)}
wvSetPosition -win $_nWave2 {("G1" 3)}
wvSetPosition -win $_nWave2 {("G1" 4)}
wvSetPosition -win $_nWave2 {("G1" 5)}
wvSetPosition -win $_nWave2 {("G1" 6)}
wvSetPosition -win $_nWave2 {("G1" 9)}
wvSetPosition -win $_nWave2 {("G1" 10)}
wvSetPosition -win $_nWave2 {("G1" 11)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvAddSignal -win $_nWave2 \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/writeback_arbitration_isValid"
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G2" 1)}
wvSetPosition -win $_nWave2 {("G2" 1)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "writeback_arbitration_isFiring" -line 421 -pos 1 -win \
          $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
srcSearchString "writeback_PC" -win $_nTrace1 -next -case
srcSearchString "writeback_PC" -win $_nTrace1 -next -case
srcDeselectAll -win $_nTrace1
srcSelect -signal "writeback_PC" -line 1341 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvZoom -win $_nWave2 3429486.561901 3468093.209418
wvZoomOut -win $_nWave2
srcSearchString "writeback_RD" -win $_nTrace1 -next -case
srcDeselectAll -win $_nTrace1
srcSelect -signal "writeback_RD" -line 1388 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
srcDeselectAll -win $_nTrace1
srcSelect -signal "writeback_RD_ADDR" -line 1389 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
srcDeselectAll -win $_nTrace1
srcSelect -signal "writeback_RD_WEN" -line 1390 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvZoom -win $_nWave2 3428675.497877 3458495.618473
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
srcSearchString "writeback_arb" -win $_nTrace1 -next -case
srcSearchString "writeback_arb" -win $_nTrace1 -prev -case
srcSelect -win $_nTrace1 -range {421 421 4 4 1 14}
srcSearchString "writeback_arb" -win $_nTrace1 -prev -case
srcSelect -win $_nTrace1 -range {420 420 4 4 1 14}
srcSearchString "writeback_arb" -win $_nTrace1 -prev -case
srcSelect -win $_nTrace1 -range {419 419 4 4 1 14}
srcSearchString "writeback_arb" -win $_nTrace1 -prev -case
srcSelect -win $_nTrace1 -range {418 418 4 4 1 14}
srcDeselectAll -win $_nTrace1
srcSelect -signal "writeback_arbitration_isStuck" -line 417 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvZoom -win $_nWave2 3425939.898578 3450560.292263
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 3364526.843740 3500732.102924
wvSetCursor -win $_nWave2 3379024.882532 -snap {("G1" 5)}
wvSelectSignal -win $_nWave2 {( "G1" 3 )} {( "G2" 7 )} 
wvSelectSignal -win $_nWave2 {( "G1" 3 4 )} {( "G2" 7 )} 
wvSetCursor -win $_nWave2 3432867.927916 -snap {("G1" 1)}
wvSelectSignal -win $_nWave2 {( "G1" 10 )} 
wvSelectSignal -win $_nWave2 {( "G1" 10 11 )} 
wvZoom -win $_nWave2 3428337.290794 3454710.367940
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 3442779.690182 3488803.295398
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 3 )} 
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 3365106.799027 3428921.041553
wvZoom -win $_nWave2 3375452.035123 3389551.050191
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 3 )} 
wvSetSearchMode -win $_nWave2 -value 590
wvSetSearchMode -win $_nWave2 -value 80003ac0
wvSearchNext -win $_nWave2
wvSearchPrev -win $_nWave2
wvZoom -win $_nWave2 3368086.583273 3403590.825699
wvSetMarker -win $_nWave2 3373000.000000
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 3301304.793948 3472660.003190
wvSelectSignal -win $_nWave2 {( "G1" 4 )} 
wvSetCursor -win $_nWave2 3316964.356137 -snap {("G1" 1)}
wvSelectSignal -win $_nWave2 {( "G1" 3 )} 
wvSelectSignal -win $_nWave2 {( "G1" 3 4 )} 
wvZoom -win $_nWave2 3360283.145028 3411461.714175
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 3364942.258465 3396265.836500
wvSelectSignal -win $_nWave2 {( "G1" 3 4 10 )} 
wvSelectSignal -win $_nWave2 {( "G1" 3 4 10 )} {( "G2" 2 )} 
wvSelectSignal -win $_nWave2 {( "G1" 3 4 10 )} {( "G2" 2 4 )} 
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvSetCursor -win $_nWave2 3370985.427757 -snap {("G2" 2)}
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 3 4 10 11 )} {( "G2" 2 4 )} 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 3 4 10 11 )} {( "G2" 2 4 6 )} 
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 3 )} 
wvSearchNext -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 1 )} 
wvSetCursor -win $_nWave2 3370985.427757 -snap {("G1" 4)}
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 3328398.084090 3410436.026563
wvZoom -win $_nWave2 3362523.110580 3393746.935324
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 3310527.133520 3436996.742987
wvSetCursor -win $_nWave2 3317125.162865 -snap {("G1" 4)}
srcSearchString "memaccess" -win $_nTrace1 -next -case
srcSearchString "memaccess_arb" -win $_nTrace1 -next -case
srcDeselectAll -win $_nTrace1
srcSelect -signal "memaccess_arbitration_isFiring" -line 1285 -pos 1 -win \
          $_nTrace1
wvSetPosition -win $_nWave2 {("G1" 0)}
wvAddSignal -win $_nWave2 \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/memaccess_arbitration_isFiring"
wvSetPosition -win $_nWave2 {("G1" 0)}
wvSetPosition -win $_nWave2 {("G1" 1)}
srcSearchString "memaccess_PC" -win $_nTrace1 -next -case
srcDeselectAll -win $_nTrace1
srcSelect -signal "memaccess_PC" -line 1338 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
srcSearchString "memaccess_arb" -win $_nTrace1 -next -case
srcSearchString "memaccess_arb" -win $_nTrace1 -prev -case
srcSelect -win $_nTrace1 -range {1285 1285 19 19 1 14}
srcSearchString "memaccess_arb" -win $_nTrace1 -prev -case
srcSelect -win $_nTrace1 -range {410 410 4 4 1 14}
srcDeselectAll -win $_nTrace1
srcSelect -signal "memaccess_arbitration_isValid" -line 405 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 2)}
wvSetPosition -win $_nWave2 {("G1" 1)}
wvSetPosition -win $_nWave2 {("G1" 0)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 0)}
wvSetPosition -win $_nWave2 {("G1" 1)}
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 3305301.848534 3421675.144640
wvSelectSignal -win $_nWave2 {( "G2" 6 )} 
wvSelectSignal -win $_nWave2 {( "G1" 4 )} 
wvSetCursor -win $_nWave2 3373104.777358 -snap {("G2" 6)}
srcActiveTrace "tb_DandRiscvSimple.u_DandRiscvSimple.writeback_RD_WEN" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 3373000 -TraceValue 1
srcDeselectAll -win $_nTrace1
srcSelect -signal "memaccess_to_writeback_RD_WEN" -line 1312 -pos 1 -win \
          $_nTrace1
srcAction -pos 1311 7 8 -win $_nTrace1 -name "memaccess_to_writeback_RD_WEN" \
          -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "_zz_DecodePlugin_hazard_rs1_from_mem_3" -line 3432 -pos 1 -win \
          $_nTrace1
srcAction -pos 3431 5 5 -win $_nTrace1 -name \
          "_zz_DecodePlugin_hazard_rs1_from_mem_3" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "memaccess_RD_WEN" -line 1359 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave2 {("G1" 0)}
wvSetPosition -win $_nWave2 {("G1" 1)}
wvSetPosition -win $_nWave2 {("G1" 2)}
wvSetPosition -win $_nWave2 {("G1" 3)}
wvAddSignal -win $_nWave2 \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/memaccess_RD_WEN"
wvSetPosition -win $_nWave2 {("G1" 3)}
wvSetPosition -win $_nWave2 {("G1" 4)}
wvSelectSignal -win $_nWave2 {( "G1" 1 4 )} 
wvSelectSignal -win $_nWave2 {( "G1" 1 2 4 )} 
wvSelectSignal -win $_nWave2 {( "G1" 1 2 3 4 )} 
wvSetPosition -win $_nWave2 {("G1" 1)}
wvSetPosition -win $_nWave2 {("G1" 2)}
wvSetPosition -win $_nWave2 {("G1" 3)}
wvSetPosition -win $_nWave2 {("G1" 4)}
wvSetPosition -win $_nWave2 {("G1" 5)}
wvSetPosition -win $_nWave2 {("G1" 6)}
wvSetPosition -win $_nWave2 {("G1" 7)}
wvSetPosition -win $_nWave2 {("G1" 8)}
wvSetPosition -win $_nWave2 {("G1" 9)}
wvSetPosition -win $_nWave2 {("G1" 10)}
wvSetPosition -win $_nWave2 {("G1" 11)}
wvSetPosition -win $_nWave2 {("G1" 12)}
wvSetPosition -win $_nWave2 {("G1" 13)}
wvSetPosition -win $_nWave2 {("G1" 14)}
wvSetPosition -win $_nWave2 {("G1" 15)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 15)}
wvSelectSignal -win $_nWave2 {( "G1" 13 )} 
wvSetCursor -win $_nWave2 3317444.440355 -snap {("G1" 4)}
wvSelectSignal -win $_nWave2 {( "G1" 3 )} 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 3248908.066387 -snap {("G1" 3)}
srcActiveTrace "tb_DandRiscvSimple.u_DandRiscvSimple.dCache_1.cpu_cmd_valid" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 3247000 -TraceValue 1
wvZoom -win $_nWave2 3231468.370752 3458999.353055
wvZoom -win $_nWave2 3356387.341428 3402514.946033
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 3316655.581158 -snap {("G1" 4)}
wvSetMarker -win $_nWave2 3317000.000000
wvSelectSignal -win $_nWave2 {( "G1" 13 )} 
wvZoom -win $_nWave2 3311422.617610 3400512.206897
wvSelectSignal -win $_nWave2 {( "G1" 12 )} 
wvSelectSignal -win $_nWave2 {( "G1" 10 )} 
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 3294515.559699 3434451.098053
wvSelectSignal -win $_nWave2 {( "G1" 13 )} 
wvSelectSignal -win $_nWave2 {( "G1" 4 )} 
wvSetCursor -win $_nWave2 3316858.208679 -snap {("G1" 13)}
srcActiveTrace \
           "tb_DandRiscvSimple.u_DandRiscvSimple.memaccess_arbitration_isFiring" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 3315000 -TraceValue 1
wvSelectSignal -win $_nWave2 {( "G1" 1 )} 
wvSetCursor -win $_nWave2 3371342.914089 -snap {("G1" 2)}
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 3066822.554868 3894676.496059
wvZoom -win $_nWave2 3263350.906452 3462488.041466
wvSetCursor -win $_nWave2 3371635.209910 -snap {("G1" 4)}
wvZoom -win $_nWave2 3364453.443486 3393947.493945
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoom -win $_nWave2 3283530.691597 3459338.364920
wvSelectSignal -win $_nWave2 {( "G1" 14 )} 
debExit
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 14603574.218750 22523789.062500
wvZoom -win $_nWave2 16283526.039124 17678845.138550
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G3" 20 )} 
wvZoom -win $_nWave2 16305872.946572 16408341.692936
wvSetSearchMode -win $_nWave2 -value 800041a8
wvSearchPrev -win $_nWave2
wvSearchNext -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 16906720.900497 16993018.797826
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 16908608.666998 16953308.281005
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 16902078.332760 16932914.082110
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 16888491.330698 17001523.624409
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvZoom -win $_nWave2 16872242.938476 16966730.871500
wvZoom -win $_nWave2 16903062.244749 16921295.463075
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G3" 20 )} 
wvSearchPrev -win $_nWave2
wvSearchNext -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G3" 13 )} 
wvZoom -win $_nWave2 16284956.143503 16645062.205437
wvZoom -win $_nWave2 16326734.073342 16376811.322579
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G3" 13 )} 
wvSetSearchMode -win $_nWave2 -value 8000ce00
wvSearchPrev -win $_nWave2
wvSearchPrev -win $_nWave2
wvZoom -win $_nWave2 12970339.646132 13012357.588070
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 12966728.729244 12994467.136227
wvZoomOut -win $_nWave2
wvSetMarker -win $_nWave2 12973000.000000
wvZoom -win $_nWave2 12969177.510483 12987705.899522
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G3" 18 )} 
wvSelectSignal -win $_nWave2 {( "G3" 18 19 )} 
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvZoom -win $_nWave2 12970422.386618 12988096.732725
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollUp -win $_nWave2 2
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 32
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvZoom -win $_nWave2 12963904.971488 13011625.705977
wvSelectSignal -win $_nWave2 {( "G4" 1 )} 
wvSelectSignal -win $_nWave2 {( "G4" 2 )} 
wvSelectSignal -win $_nWave2 {( "G4" 3 )} 
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G4" 21 )} 
wvSelectSignal -win $_nWave2 {( "G4" 21 22 )} 
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvSelectSignal -win $_nWave2 {( "G4" 21 22 23 )} 
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSetCursor -win $_nWave2 12975089.518626 -snap {("G4" 21)}
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G4" 22 )} 
wvSetCursor -win $_nWave2 12972945.813756 -snap {("G4" 22)}
srcActiveTrace "tb_DandRiscvYsyx3rd.u_ysyx_210238.io_master_arvalid" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 12801000 -TraceValue 0
wvScrollUp -win $_nWave2 10
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSetCursor -win $_nWave2 12973039.018316 -snap {("G4" 22)}
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 30
wvSelectSignal -win $_nWave2 {( "G2" 1 )} {( "G4" 22 )} 
wvSelectSignal -win $_nWave2 {( "G4" 22 )} 
wvSelectSignal -win $_nWave2 {( "G2" 1 )} {( "G4" 22 )} 
wvSelectSignal -win $_nWave2 {( "G4" 22 )} 
wvSelectSignal -win $_nWave2 {( "G2" 1 )} {( "G4" 22 )} 
wvSelectSignal -win $_nWave2 {( "G4" 22 )} 
wvSelectSignal -win $_nWave2 {( "G2" 1 )} {( "G4" 22 )} 
wvSelectSignal -win $_nWave2 {( "G4" 22 )} 
wvSelectSignal -win $_nWave2 {( "G2" 1 )} {( "G4" 22 )} 
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSetCursor -win $_nWave2 12974977.673154 -snap {("G4" 3)}
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollUp -win $_nWave2 33
wvSelectSignal -win $_nWave2 {( "G3" 11 )} 
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 10
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 44
wvScrollDown -win $_nWave2 7
wvSelectSignal -win $_nWave2 {( "G4" 5 )} 
wvSelectSignal -win $_nWave2 {( "G4" 7 )} 
wvSelectSignal -win $_nWave2 {( "G4" 6 7 )} 
wvScrollDown -win $_nWave2 4
wvScrollDown -win $_nWave2 2
wvSelectSignal -win $_nWave2 {( "G4" 25 )} 
wvSelectSignal -win $_nWave2 {( "G4" 23 )} 
wvSelectSignal -win $_nWave2 {( "G4" 22 23 )} 
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvSetCursor -win $_nWave2 12976953.704906 -snap {("G4" 29)}
wvSetMarker -win $_nWave2 12975000.000000
wvZoom -win $_nWave2 12968173.771415 12992817.236542
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G4" 29 )} 
wvSelectSignal -win $_nWave2 {( "G4" 30 )} 
wvSelectSignal -win $_nWave2 {( "G4" 29 )} 
wvSelectSignal -win $_nWave2 {( "G4" 30 )} 
wvSelectSignal -win $_nWave2 {( "G4" 29 )} 
wvSelectSignal -win $_nWave2 {( "G4" 30 )} 
wvSelectSignal -win $_nWave2 {( "G4" 31 )} 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvSetCursor -win $_nWave2 12979006.487406 -snap {("G4" 31)}
srcActiveTrace "tb_DandRiscvYsyx3rd.u_ysyx_210238.io_master_rdata\[63:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 12803000 -TraceValue \
           0000000000001000000010101001001100000000000001111000110010010011
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 12769084.064384 12943332.734503
wvZoom -win $_nWave2 12797091.965600 12832050.732816
wvSetCursor -win $_nWave2 12803039.194272 -snap {("G4" 31)}
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 12947789.271673 13026101.285210
wvZoom -win $_nWave2 12969197.209668 12992289.606308
srcDeselectAll -win $_nTrace1
srcSelect -signal "axi_mem_rdata" -line 114 -pos 1 -win $_nTrace1
srcAction -pos 113 7 6 -win $_nTrace1 -name "axi_mem_rdata" -ctrlKey off
srcHBSelect "tb_DandRiscvYsyx3rd.u_axi_slave_mem" -win $_nTrace1
srcSetScope -win $_nTrace1 "tb_DandRiscvYsyx3rd.u_axi_slave_mem" -delim "."
srcHBSelect "tb_DandRiscvYsyx3rd.u_axi_slave_mem" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "axi_mem_rdaddr" -line 75 -pos 1 -win $_nTrace1
srcSelect -signal "axi_mem_rden" -line 76 -pos 1 -win $_nTrace1
srcSelect -signal "axi_mem_rdata" -line 80 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvSetPosition -win $_nWave2 {("G3" 51)}
wvSetPosition -win $_nWave2 {("G3" 52)}
wvSetPosition -win $_nWave2 {("G3" 53)}
wvSetPosition -win $_nWave2 {("G4" 0)}
wvSetPosition -win $_nWave2 {("G4" 1)}
wvSetPosition -win $_nWave2 {("G4" 2)}
wvSetPosition -win $_nWave2 {("G4" 3)}
wvSetPosition -win $_nWave2 {("G4" 4)}
wvSetPosition -win $_nWave2 {("G4" 5)}
wvSetPosition -win $_nWave2 {("G4" 6)}
wvSetPosition -win $_nWave2 {("G4" 7)}
wvSetPosition -win $_nWave2 {("G4" 8)}
wvSetPosition -win $_nWave2 {("G4" 9)}
wvSetPosition -win $_nWave2 {("G4" 10)}
wvSetPosition -win $_nWave2 {("G4" 11)}
wvSetPosition -win $_nWave2 {("G4" 12)}
wvSetPosition -win $_nWave2 {("G4" 13)}
wvSetPosition -win $_nWave2 {("G4" 14)}
wvSetPosition -win $_nWave2 {("G4" 15)}
wvSetPosition -win $_nWave2 {("G4" 16)}
wvSetPosition -win $_nWave2 {("G4" 17)}
wvSetPosition -win $_nWave2 {("G4" 18)}
wvSetPosition -win $_nWave2 {("G4" 19)}
wvSetPosition -win $_nWave2 {("G4" 20)}
wvSetPosition -win $_nWave2 {("G4" 21)}
wvSetPosition -win $_nWave2 {("G4" 22)}
wvSetPosition -win $_nWave2 {("G4" 23)}
wvSetPosition -win $_nWave2 {("G4" 24)}
wvSetPosition -win $_nWave2 {("G4" 25)}
wvSetPosition -win $_nWave2 {("G4" 26)}
wvSetPosition -win $_nWave2 {("G4" 27)}
wvSetPosition -win $_nWave2 {("G4" 28)}
wvSetPosition -win $_nWave2 {("G4" 29)}
wvSetPosition -win $_nWave2 {("G4" 30)}
wvSetPosition -win $_nWave2 {("G4" 31)}
wvSetPosition -win $_nWave2 {("G4" 32)}
wvSetPosition -win $_nWave2 {("G4" 33)}
wvSetPosition -win $_nWave2 {("G5" 0)}
wvSetPosition -win $_nWave2 {("G4" 33)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G4" 36)}
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
srcDeselectAll -win $_nTrace1
srcSelect -signal "axi_mem_rdata" -line 80 -pos 1 -win $_nTrace1
srcAction -pos 79 11 8 -win $_nTrace1 -name "axi_mem_rdata" -ctrlKey off
wvSelectSignal -win $_nWave2 {( "G4" 30 )} 
wvSelectSignal -win $_nWave2 {( "G4" 29 )} 
wvSetCursor -win $_nWave2 12977018.099566 -snap {("G4" 29)}
srcActiveTrace "tb_DandRiscvYsyx3rd.u_ysyx_210238.io_master_rvalid" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 12977000 -TraceValue 1
srcDeselectAll -win $_nTrace1
srcSelect -signal "sig_r_valid" -line 118 -pos 1 -win $_nTrace1
srcAction -pos 117 7 5 -win $_nTrace1 -name "sig_r_valid" -ctrlKey off
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSelectSignal -win $_nWave2 {( "G4" 34 )} 
wvSelectSignal -win $_nWave2 {( "G4" 34 )} 
wvSetCursor -win $_nWave2 12979050.085973 -snap {("G4" 34)}
srcActiveTrace "tb_DandRiscvYsyx3rd.u_axi_slave_mem.axi_mem_rdaddr\[17:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 12979000 -TraceValue \
           000000010110010001
srcDeselectAll -win $_nTrace1
srcSelect -signal "sig_ar_addr\[AXI_RD_ADDR_BITS+ADDR_LSB-1:ADDR_LSB\]" -line 346 \
          -pos 1 -win $_nTrace1
srcAction -pos 345 7 5 -win $_nTrace1 -name \
          "sig_ar_addr\[AXI_RD_ADDR_BITS+ADDR_LSB-1:ADDR_LSB\]" -ctrlKey off
wvSelectSignal -win $_nWave2 {( "G4" 22 )} 
wvSelectSignal -win $_nWave2 {( "G4" 23 )} 
srcDeselectAll -win $_nTrace1
srcSelect -signal "sig_ar_burst" -line 293 -pos 1 -win $_nTrace1
srcAction -pos 292 4 6 -win $_nTrace1 -name "sig_ar_burst" -ctrlKey off
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSetCursor -win $_nWave2 12975094.485767 -snap {("G4" 23)}
wvSetCursor -win $_nWave2 12972972.188852 -snap {("G4" 22)}
wvSelectSignal -win $_nWave2 {( "G4" 22 )} 
wvSetCursor -win $_nWave2 12972908.971498 -snap {("G4" 22)}
srcActiveTrace "tb_DandRiscvYsyx3rd.u_ysyx_210238.io_master_arvalid" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 12801000 -TraceValue 0
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G3" 41 )} 
wvSelectSignal -win $_nWave2 {( "G3" 39 )} 
wvScrollDown -win $_nWave2 10
wvSelectSignal -win $_nWave2 {( "G4" 9 )} 
wvSelectSignal -win $_nWave2 {( "G4" 8 )} 
wvSelectSignal -win $_nWave2 {( "G4" 9 )} 
wvSelectSignal -win $_nWave2 {( "G4" 11 )} 
srcDeselectAll -win $_nTrace1
debReload
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvZoom -win $_nWave2 0.000000 2476613.218616
wvZoom -win $_nWave2 80390.651993 570483.060526
wvScrollDown -win $_nWave2 47
wvSelectSignal -win $_nWave2 {( "G4" 1 )} 
wvSelectSignal -win $_nWave2 {( "G4" 1 2 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G5" 0)}
wvSelectSignal -win $_nWave2 {( "G4" 1 )} 
wvScrollUp -win $_nWave2 4
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
srcDeselectAll -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G3" 22 )} 
wvUndo -win $_nWave2
wvSetPosition -win $_nWave2 {("G4" 34)}
wvSetPosition -win $_nWave2 {("G5" 0)}
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 134933.537586 -snap {("G4" 2)}
wvZoom -win $_nWave2 113466.838425 604134.247828
wvZoom -win $_nWave2 141099.261950 216128.967494
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 129578.091390 313616.540030
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G3" 1 )} 
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G4" 3 )} 
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G3" 2 )} 
wvSelectSignal -win $_nWave2 {( "G3" 3 )} 
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G4" 12 )} 
wvSelectSignal -win $_nWave2 {( "G4" 13 )} 
wvSelectSignal -win $_nWave2 {( "G4" 12 )} 
wvScrollDown -win $_nWave2 4
wvSelectSignal -win $_nWave2 {( "G4" 22 )} 
wvSetCursor -win $_nWave2 146251.907563 -snap {("G4" 22)}
srcActiveTrace "tb_DandRiscvYsyx3rd.u_ysyx_210238.io_master_araddr\[31:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 57000 -TraceValue \
           10000000000000000000000000000000
srcDeselectAll -win $_nTrace1
srcSelect -signal "core_dcache_valid" -line 228 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "core_dcache_valid" -line 228 -pos 1 -win $_nTrace1
srcAction -pos 227 14 7 -win $_nTrace1 -name "core_dcache_valid" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "when_GenSimpleForYsyx3rd_l199" -line 269 -pos 1 -win $_nTrace1
srcAction -pos 268 3 14 -win $_nTrace1 -name "when_GenSimpleForYsyx3rd_l199" \
          -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "core_state_next" -line 204 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave2 {("G3" 26)}
wvSetPosition -win $_nWave2 {("G3" 25)}
wvSetPosition -win $_nWave2 {("G3" 24)}
wvSetPosition -win $_nWave2 {("G3" 26)}
wvSetPosition -win $_nWave2 {("G3" 27)}
wvSetPosition -win $_nWave2 {("G3" 28)}
wvSetPosition -win $_nWave2 {("G3" 29)}
wvSetPosition -win $_nWave2 {("G3" 30)}
wvSetPosition -win $_nWave2 {("G4" 2)}
wvSetPosition -win $_nWave2 {("G3" 46)}
wvSetPosition -win $_nWave2 {("G3" 47)}
wvSetPosition -win $_nWave2 {("G3" 48)}
wvSetPosition -win $_nWave2 {("G3" 49)}
wvSetPosition -win $_nWave2 {("G3" 50)}
wvSetPosition -win $_nWave2 {("G4" 0)}
wvAddSignal -win $_nWave2 \
           "/tb_DandRiscvYsyx3rd/u_ysyx_210238/core_state_next\[1:0\]"
wvSetPosition -win $_nWave2 {("G4" 0)}
wvSetPosition -win $_nWave2 {("G4" 1)}
wvZoom -win $_nWave2 134160.214418 217650.476609
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
srcDeselectAll -win $_nTrace1
debReload
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSetCursor -win $_nWave2 2194192.412984 -snap {("G3" 1)}
wvZoom -win $_nWave2 0.000000 3519397.731717
wvZoomOut -win $_nWave2
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvZoom -win $_nWave2 1907659.466625 2846349.045440
wvZoom -win $_nWave2 2122416.370655 2257144.206175
wvZoom -win $_nWave2 2162144.484843 2197815.483923
wvZoom -win $_nWave2 2170891.343045 2180000.909881
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 2
wvScrollDown -win $_nWave2 4
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 2
wvScrollDown -win $_nWave2 4
wvScrollDown -win $_nWave2 2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 4
wvScrollDown -win $_nWave2 4
wvScrollDown -win $_nWave2 4
wvScrollDown -win $_nWave2 6
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 8
wvScrollDown -win $_nWave2 2
wvScrollDown -win $_nWave2 4
wvScrollDown -win $_nWave2 3
wvScrollDown -win $_nWave2 3
wvScrollDown -win $_nWave2 2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 1984567.408402 2677706.760602
wvSelectSignal -win $_nWave2 {( "G4" 3 )} 
wvSelectSignal -win $_nWave2 {( "G4" 2 )} 
wvZoom -win $_nWave2 2091371.047341 2336694.126629
wvSelectSignal -win $_nWave2 {( "G4" 4 )} 
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 2
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 3
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 4
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 3
wvScrollUp -win $_nWave2 2
wvScrollUp -win $_nWave2 2
wvScrollUp -win $_nWave2 2
wvScrollUp -win $_nWave2 2
wvScrollUp -win $_nWave2 2
wvScrollUp -win $_nWave2 3
wvScrollUp -win $_nWave2 2
wvScrollUp -win $_nWave2 2
wvScrollUp -win $_nWave2 3
wvScrollUp -win $_nWave2 2
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 5
wvScrollUp -win $_nWave2 2
wvScrollUp -win $_nWave2 3
wvScrollUp -win $_nWave2 3
wvScrollUp -win $_nWave2 2
wvScrollUp -win $_nWave2 2
wvScrollUp -win $_nWave2 3
wvScrollUp -win $_nWave2 2
wvScrollUp -win $_nWave2 2
wvScrollUp -win $_nWave2 1
wvZoom -win $_nWave2 2156899.269144 2212641.431470
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G3" 1 )} 
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G3" 2 )} 
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G4" 1 )} 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G3" 25 )} 
wvSelectSignal -win $_nWave2 {( "G3" 26 )} 
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvSetCursor -win $_nWave2 2175222.025278 -snap {("G3" 33)}
wvSetCursor -win $_nWave2 2172257.248557 -snap {("G3" 7)}
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G3" 2 )} 
wvZoom -win $_nWave2 2154555.787545 2210799.345934
wvSetCursor -win $_nWave2 2172966.369621 -snap {("G3" 2)}
srcActiveTrace \
           "tb_DandRiscvYsyx3rd.u_ysyx_210238.core_cpu.dCache_1.cpu_cmd_valid" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 2171000 -TraceValue 1
srcDeselectAll -win $_nTrace1
srcSelect -signal "memaccess_arbitration_isValid" -line 3277 -pos 1 -win \
          $_nTrace1
srcAction -pos 3276 22 10 -win $_nTrace1 -name "memaccess_arbitration_isValid" \
          -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "execute_arbitration_isValid" -line 3618 -pos 1 -win $_nTrace1
srcAction -pos 3617 5 8 -win $_nTrace1 -name "execute_arbitration_isValid" \
          -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "decode_arbitration_isValid" -line 3611 -pos 1 -win $_nTrace1
srcAction -pos 3610 5 8 -win $_nTrace1 -name "decode_arbitration_isValid" \
          -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "fetch_arbitration_isValid" -line 3604 -pos 1 -win $_nTrace1
wvScrollUp -win $_nWave2 16
wvSetCursor -win $_nWave2 2172966.369621 -snap {("G1" 1)}
srcActiveTrace \
           "tb_DandRiscvYsyx3rd.u_ysyx_210238.core_cpu.fetch_arbitration_isValid" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 2155000 -TraceValue 1
srcDeselectAll -win $_nTrace1
srcSelect -signal "fetch_FetchPlugin_fifo_all_valid" -line 1779 -pos 1 -win \
          $_nTrace1
srcSelect -signal "fetch_arbitration_isStuck" -line 1779 -pos 1 -win $_nTrace1
srcSelect -signal "fetch_FetchPlugin_fetch_flush" -line 1779 -pos 1 -win \
          $_nTrace1
wvSetPosition -win $_nWave2 {("G1" 0)}
wvSetPosition -win $_nWave2 {("G1" 1)}
wvSetPosition -win $_nWave2 {("G1" 2)}
wvSetPosition -win $_nWave2 {("G1" 8)}
wvSetPosition -win $_nWave2 {("G1" 10)}
wvSetPosition -win $_nWave2 {("G1" 11)}
wvSetPosition -win $_nWave2 {("G4" 2)}
wvSetPosition -win $_nWave2 {("G2" 4)}
wvSetPosition -win $_nWave2 {("G2" 3)}
wvSetPosition -win $_nWave2 {("G2" 2)}
wvSetPosition -win $_nWave2 {("G2" 1)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G1" 15)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G2" 1)}
wvSetPosition -win $_nWave2 {("G2" 2)}
wvSetPosition -win $_nWave2 {("G2" 3)}
wvSetPosition -win $_nWave2 {("G2" 4)}
wvSetPosition -win $_nWave2 {("G2" 5)}
wvSetPosition -win $_nWave2 {("G2" 6)}
wvSetPosition -win $_nWave2 {("G2" 7)}
wvSetPosition -win $_nWave2 {("G2" 8)}
wvSetPosition -win $_nWave2 {("G2" 9)}
wvSetPosition -win $_nWave2 {("G2" 10)}
wvSetPosition -win $_nWave2 {("G2" 11)}
wvSetPosition -win $_nWave2 {("G2" 12)}
wvSetPosition -win $_nWave2 {("G2" 13)}
wvAddSignal -win $_nWave2 \
           "/tb_DandRiscvYsyx3rd/u_ysyx_210238/core_cpu/fetch_FetchPlugin_fifo_all_valid" \
           "/tb_DandRiscvYsyx3rd/u_ysyx_210238/core_cpu/fetch_arbitration_isStuck" \
           "/tb_DandRiscvYsyx3rd/u_ysyx_210238/core_cpu/fetch_FetchPlugin_fetch_flush"
wvSetPosition -win $_nWave2 {("G2" 13)}
wvSetPosition -win $_nWave2 {("G2" 16)}
wvSetCursor -win $_nWave2 2172944.373705 -snap {("G2" 15)}
srcActiveTrace \
           "tb_DandRiscvYsyx3rd.u_ysyx_210238.core_cpu.fetch_arbitration_isStuck" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 1533000 -TraceValue 0
srcDeselectAll -win $_nTrace1
srcSelect -signal "fetch_arbitration_haltItself" -line 3379 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "fetch_arbitration_isStuckByOthers" -line 3379 -pos 1 -win \
          $_nTrace1
srcAction -pos 3378 12 9 -win $_nTrace1 -name "fetch_arbitration_isStuckByOthers" \
          -ctrlKey off
wvSetCursor -win $_nWave2 2172988.365538 -snap {("G2" 15)}
srcActiveTrace \
           "tb_DandRiscvYsyx3rd.u_ysyx_210238.core_cpu.fetch_arbitration_isStuck" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 1533000 -TraceValue 0
srcDeselectAll -win $_nTrace1
srcSelect -signal "fetch_arbitration_haltByOther" -line 3378 -pos 1 -win \
          $_nTrace1
srcSelect -signal "decode_arbitration_isStuck" -line 3378 -pos 1 -win $_nTrace1
srcSelect -signal "execute_arbitration_isStuck" -line 3378 -pos 1 -win $_nTrace1
srcSelect -signal "memaccess_arbitration_isStuck" -line 3378 -pos 1 -win \
          $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {3378 3378 9 40 1 51}
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 21 )} 
wvSelectSignal -win $_nWave2 {( "G2" 19 )} 
wvSelectSignal -win $_nWave2 {( "G2" 20 )} 
wvSetCursor -win $_nWave2 2173010.361454 -snap {("G2" 20)}
srcActiveTrace \
           "tb_DandRiscvYsyx3rd.u_ysyx_210238.core_cpu.memaccess_arbitration_isStuck" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 1533000 -TraceValue 0
srcDeselectAll -win $_nTrace1
srcSelect -signal "memaccess_arbitration_haltItself" -line 3391 -pos 1 -win \
          $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvSetCursor -win $_nWave2 2173340.300201 -snap {("G2" 22)}
srcActiveTrace \
           "tb_DandRiscvYsyx3rd.u_ysyx_210238.core_cpu.memaccess_arbitration_haltItself" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 2173000 -TraceValue x
srcDeselectAll -win $_nTrace1
srcSelect -signal "_zz_memaccess_arbitration_haltItself" -line 2850 -pos 1 -win \
          $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "_zz_memaccess_arbitration_haltItself" -line 2850 -pos 1 -win \
          $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "_zz_memaccess_arbitration_haltItself" -line 2850 -pos 1 -win \
          $_nTrace1
srcAction -pos 2849 7 9 -win $_nTrace1 -name \
          "_zz_memaccess_arbitration_haltItself" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "memaccess_LSU_HOLD" -line 1629 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "memaccess_LSU_HOLD" -line 1629 -pos 1 -win $_nTrace1
srcAction -pos 1628 7 5 -win $_nTrace1 -name "memaccess_LSU_HOLD" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "DCachePlugin_dcache_access_stall" -line 1560 -pos 1 -win \
          $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "DCachePlugin_dcache_access_stall" -line 1560 -pos 1 -win \
          $_nTrace1
srcAction -pos 1559 7 6 -win $_nTrace1 -name "DCachePlugin_dcache_access_stall" \
          -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "dCache_1_stall" -line 3296 -pos 1 -win $_nTrace1
srcAction -pos 3295 7 3 -win $_nTrace1 -name "dCache_1_stall" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "is_miss" -line 11884 -pos 1 -win $_nTrace1
srcSelect -signal "is_write" -line 11884 -pos 1 -win $_nTrace1
srcSelect -signal "cpu_cmd_ready_1" -line 11884 -pos 1 -win $_nTrace1
srcSelect -signal "next_level_wdone" -line 11884 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 23 )} 
wvSetCursor -win $_nWave2 2172966.369621 -snap {("G2" 23)}
srcActiveTrace "tb_DandRiscvYsyx3rd.u_ysyx_210238.core_cpu.dCache_1.is_miss" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 1415000 -TraceValue 0
srcDeselectAll -win $_nTrace1
srcSelect -signal "cache_hit_3" -line 10340 -pos 1 -win $_nTrace1
srcSelect -signal "cache_hit_2" -line 10340 -pos 1 -win $_nTrace1
srcSelect -signal "cache_hit_1" -line 10340 -pos 1 -win $_nTrace1
srcSelect -signal "cache_hit_0" -line 10340 -pos 1 -win $_nTrace1
srcSelect -signal "cpu_cmd_fire_2" -line 10340 -pos 1 -win $_nTrace1
srcSelect -signal "bypass" -line 10340 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSetCursor -win $_nWave2 2173010.361454 -snap {("G2" 31)}
srcActiveTrace \
           "tb_DandRiscvYsyx3rd.u_ysyx_210238.core_cpu.dCache_1.cpu_cmd_fire_2" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 2171000 -TraceValue 1
srcDeselectAll -win $_nTrace1
srcSelect -signal "cpu_cmd_valid" -line 10339 -pos 1 -win $_nTrace1
srcSelect -signal "cpu_cmd_ready" -line 10339 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvSetCursor -win $_nWave2 2172878.385955 -snap {("G2" 33)}
srcActiveTrace \
           "tb_DandRiscvYsyx3rd.u_ysyx_210238.core_cpu.dCache_1.cpu_cmd_valid" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 2171000 -TraceValue 1
srcDeselectAll -win $_nTrace1
srcSelect -signal "memaccess_LSUPlugin_is_timer" -line 3277 -pos 1 -win $_nTrace1
srcSelect -signal "memaccess_LSUPlugin_is_mem" -line 3277 -pos 1 -win $_nTrace1
srcSelect -signal "memaccess_arbitration_isValid" -line 3277 -pos 1 -win \
          $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSetCursor -win $_nWave2 2172922.377788 -snap {("G2" 35)}
srcActiveTrace \
           "tb_DandRiscvYsyx3rd.u_ysyx_210238.core_cpu.memaccess_LSUPlugin_is_timer" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 2169000 -TraceValue 0
srcDeselectAll -win $_nTrace1
srcSelect -signal "memaccess_LSUPlugin_cpu_addr" -line 2883 -pos 1 -win $_nTrace1
srcSelect -signal "memaccess_LSUPlugin_cpu_addr" -line 2883 -pos 2 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSetCursor -win $_nWave2 2173032.357371 -snap {("G2" 38)}
srcActiveTrace \
           "tb_DandRiscvYsyx3rd.u_ysyx_210238.core_cpu.memaccess_LSUPlugin_cpu_addr\[63:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 2171000 -TraceValue \
           0000000000000000000000000000000000000000000000000000000001100000
srcDeselectAll -win $_nTrace1
srcSelect -signal "memaccess_ALU_RESULT" -line 2880 -pos 1 -win $_nTrace1
srcAction -pos 2879 7 6 -win $_nTrace1 -name "memaccess_ALU_RESULT" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "execute_to_memaccess_ALU_RESULT" -line 1658 -pos 1 -win \
          $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvSetCursor -win $_nWave2 2172988.365538 -snap {("G2" 39)}
srcActiveTrace \
           "tb_DandRiscvYsyx3rd.u_ysyx_210238.core_cpu.execute_to_memaccess_ALU_RESULT\[63:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 2171000 -TraceValue \
           0000000000000000000000000000000000000000000000000000000001100000
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "when_Pipeline_l127_37" -line 3746 -pos 1 -win $_nTrace1
srcSelect -signal "execute_ALU_RESULT" -line 3747 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvZoom -win $_nWave2 2170458.835145 2177079.605999
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
srcDeselectAll -win $_nTrace1
srcSelect -signal "execute_ALU_RESULT" -line 3747 -pos 1 -win $_nTrace1
srcAction -pos 3746 5 6 -win $_nTrace1 -name "execute_ALU_RESULT" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "execute_ALUPlugin_alu_result" -line 1574 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "execute_ALUPlugin_alu_result" -line 1574 -pos 1 -win $_nTrace1
srcAction -pos 1573 7 11 -win $_nTrace1 -name "execute_ALUPlugin_alu_result" \
          -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "execute_ALUPlugin_add_result" -line 2802 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvSetCursor -win $_nWave2 2171045.305460 -snap {("G2" 42)}
srcActiveTrace \
           "tb_DandRiscvYsyx3rd.u_ysyx_210238.core_cpu.execute_ALUPlugin_add_result\[63:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 2171000 -TraceValue \
           xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvZoom -win $_nWave2 2167399.609190 2187761.651427
wvZoomOut -win $_nWave2
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSetCursor -win $_nWave2 2170995.018681 -snap {("G2" 42)}
srcActiveTrace \
           "tb_DandRiscvYsyx3rd.u_ysyx_210238.core_cpu.execute_ALUPlugin_add_result\[63:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 2169000 -TraceValue \
           0000000000000000000000000000000000000000000000000000000001100000
srcDeselectAll -win $_nTrace1
srcSelect -signal "_zz_execute_ALUPlugin_add_result" -line 2366 -pos 1 -win \
          $_nTrace1
srcSelect -signal "_zz_execute_ALUPlugin_add_result_1" -line 2366 -pos 1 -win \
          $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvSetCursor -win $_nWave2 2170979.092172 -snap {("G2" 43)}
srcActiveTrace \
           "tb_DandRiscvYsyx3rd.u_ysyx_210238.core_cpu._zz_execute_ALUPlugin_add_result\[63:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 2169000 -TraceValue \
           0000000000000000000000000000000000000000000000000000000000000000
srcDeselectAll -win $_nTrace1
srcSelect -signal "execute_ALUPlugin_src1" -line 1235 -pos 1 -win $_nTrace1
srcAction -pos 1234 7 8 -win $_nTrace1 -name "execute_ALUPlugin_src1" -ctrlKey \
          off
srcDeselectAll -win $_nTrace1
srcSelect -signal "execute_RS1" -line 2689 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvSetCursor -win $_nWave2 2170931.312644 -snap {("G2" 45)}
srcActiveTrace "tb_DandRiscvYsyx3rd.u_ysyx_210238.core_cpu.execute_RS1\[63:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 2169000 -TraceValue \
           0000000000000000000000000000000000000000000000000000000000000000
srcDeselectAll -win $_nTrace1
srcSelect -signal "decode_to_execute_RS1" -line 1654 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvSetCursor -win $_nWave2 2170979.092172 -snap {("G2" 46)}
srcActiveTrace \
           "tb_DandRiscvYsyx3rd.u_ysyx_210238.core_cpu.decode_to_execute_RS1\[63:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 2169000 -TraceValue \
           0000000000000000000000000000000000000000000000000000000000000000
srcDeselectAll -win $_nTrace1
srcSelect -signal "decode_RS1" -line 3675 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvSetCursor -win $_nWave2 2168972.351990 -snap {("G2" 47)}
srcActiveTrace "tb_DandRiscvYsyx3rd.u_ysyx_210238.core_cpu.decode_RS1\[63:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 2167000 -TraceValue \
           0000000000000000000000000000000000000000000000000000000000000000
srcDeselectAll -win $_nTrace1
srcSelect -signal "decode_DecodePlugin_rs1" -line 1601 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvSetCursor -win $_nWave2 2168844.939915 -snap {("G2" 48)}
srcActiveTrace \
           "tb_DandRiscvYsyx3rd.u_ysyx_210238.core_cpu.decode_DecodePlugin_rs1\[63:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 2167000 -TraceValue \
           0000000000000000000000000000000000000000000000000000000000000000
srcDeselectAll -win $_nTrace1
srcSelect -signal "regFileModule_1_read_ports_rs1_value" -line 2355 -pos 1 -win \
          $_nTrace1
srcAction -pos 2354 7 7 -win $_nTrace1 -name \
          "regFileModule_1_read_ports_rs1_value" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "write_ports_rd_wen" -line 48747 -pos 1 -win $_nTrace1
srcSelect -signal "write_ports_rd_addr" -line 48747 -pos 1 -win $_nTrace1
srcSelect -signal "read_ports_rs1_addr" -line 48747 -pos 1 -win $_nTrace1
srcSelect -signal "write_ports_rd_addr" -line 48747 -pos 2 -win $_nTrace1
srcSelect -signal "read_ports_rs1_req" -line 48747 -pos 1 -win $_nTrace1
srcSelect -signal "write_ports_rd_value" -line 48747 -pos 1 -win $_nTrace1
srcSelect -signal "read_value_1" -line 48747 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvSetCursor -win $_nWave2 2168940.498972 -snap {("G2" 49)}
srcActiveTrace \
           "tb_DandRiscvYsyx3rd.u_ysyx_210238.core_cpu.regFileModule_1.write_ports_rd_wen" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 2163000 -TraceValue 1
srcDeselectAll -win $_nTrace1
srcSelect -signal "writeback_arbitration_isFiring" -line 2362 -pos 1 -win \
          $_nTrace1
srcSelect -signal "_zz_DecodePlugin_hazard_rs1_from_wb_1" -line 2362 -pos 1 -win \
          $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvSetCursor -win $_nWave2 2168972.351990 -snap {("G2" 56)}
srcActiveTrace \
           "tb_DandRiscvYsyx3rd.u_ysyx_210238.core_cpu._zz_DecodePlugin_hazard_rs1_from_wb_1" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 2163000 -TraceValue 1
srcDeselectAll -win $_nTrace1
srcSelect -signal "writeback_RD_WEN" -line 1666 -pos 1 -win $_nTrace1
srcAction -pos 1665 7 5 -win $_nTrace1 -name "writeback_RD_WEN" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "memaccess_to_writeback_RD_WEN" -line 1588 -pos 1 -win \
          $_nTrace1
srcAction -pos 1587 7 7 -win $_nTrace1 -name "memaccess_to_writeback_RD_WEN" \
          -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "_zz_DecodePlugin_hazard_rs1_from_mem_3" -line 3708 -pos 1 -win \
          $_nTrace1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvScrollDown -win $_nWave2 33
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 53 )} 
wvSetCursor -win $_nWave2 2098058.145461 -snap {("G2" 52)}
wvSelectSignal -win $_nWave2 {( "G2" 53 )} 
wvSelectSignal -win $_nWave2 {( "G2" 52 )} 
wvSetCursor -win $_nWave2 2098949.982675 -snap {("G2" 52)}
srcActiveTrace \
           "tb_DandRiscvYsyx3rd.u_ysyx_210238.core_cpu.regFileModule_1.read_ports_rs1_req" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 159000 -TraceValue 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
srcDeselectAll -win $_nTrace1
srcSelect -signal "decode_INSTRUCTION\[6 : 0\]" -line 1782 -pos 1 -win $_nTrace1
srcSelect -signal "decode_INSTRUCTION\[6 : 0\]" -line 1782 -pos 2 -win $_nTrace1
srcSelect -signal "decode_INSTRUCTION\[6 : 0\]" -line 1782 -pos 3 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvZoom -win $_nWave2 2094235.985971 2113219.378103
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvSetCursor -win $_nWave2 2098965.272301 -snap {("G2" 57)}
srcActiveTrace \
           "tb_DandRiscvYsyx3rd.u_ysyx_210238.core_cpu.decode_INSTRUCTION\[6:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 2085000 -TraceValue \
           1100011
srcDeselectAll -win $_nTrace1
srcSelect -signal "fetch_to_decode_INSTRUCTION" -line 1667 -pos 1 -win $_nTrace1
srcAction -pos 1666 7 6 -win $_nTrace1 -name "fetch_to_decode_INSTRUCTION" \
          -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "fetch_INSTRUCTION" -line 3654 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvSetCursor -win $_nWave2 2097080.918526 -snap {("G2" 58)}
srcActiveTrace \
           "tb_DandRiscvYsyx3rd.u_ysyx_210238.core_cpu.fetch_INSTRUCTION\[31:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 2097000 -TraceValue \
           xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 2
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 2
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 3
wvScrollUp -win $_nWave2 2
wvScrollUp -win $_nWave2 2
wvScrollUp -win $_nWave2 2
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 2
wvScrollUp -win $_nWave2 3
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 2
wvScrollUp -win $_nWave2 2
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 2
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 2
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 35
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollUp -win $_nWave2 80
wvSelectSignal -win $_nWave2 {( "G2" 7 )} 
wvSelectSignal -win $_nWave2 {( "G2" 8 )} 
wvSelectSignal -win $_nWave2 {( "G2" 9 )} 
wvSelectSignal -win $_nWave2 {( "G2" 8 )} 
srcHBSelect "tb_DandRiscvYsyx3rd.u_ysyx_210238.core_cpu.iCache_1" -win $_nTrace1
srcSetScope -win $_nTrace1 "tb_DandRiscvYsyx3rd.u_ysyx_210238.core_cpu.iCache_1" \
           -delim "."
srcHBSelect "tb_DandRiscvYsyx3rd.u_ysyx_210238.core_cpu.iCache_1" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {27146 27151 3 1 14 1}
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 2089020.848850 2112486.717897
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
srcDeselectAll -win $_nTrace1
debReload
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvZoom -win $_nWave2 12279926.442122 18323112.659698
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvZoom -win $_nWave2 12862486.785975 13325727.541329
wvZoom -win $_nWave2 13040932.218249 13100653.151866
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 13078353.174911 13091948.184190
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 13083655.912748 -snap {("G3" 18)}
wvSetCursor -win $_nWave2 13088961.282223 -snap {("G3" 18)}
wvSelectSignal -win $_nWave2 {( "G3" 18 )} 
wvSelectSignal -win $_nWave2 {( "G3" 19 )} 
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvZoom -win $_nWave2 13053002.666895 13124414.624268
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G3" 18 19 )} 
wvZoom -win $_nWave2 11247638.404955 34280565.234224
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
srcDeselectAll -win $_nTrace1
debReload
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 0.000000 4150658.149439
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 47
wvZoom -win $_nWave2 57848.894069 486894.858413
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 54149.819735 178063.210908
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 38378.131219 320073.614366
wvZoom -win $_nWave2 48520.477302 113518.738222
wvScrollDown -win $_nWave2 3
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 53146.080938 955018.969581
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 11173.028431 544685.135998
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvZoom -win $_nWave2 487452.022400 736961.362679
wvZoom -win $_nWave2 517300.410377 569366.045070
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G3" 2 )} 
wvZoom -win $_nWave2 488062.623648 548453.115920
wvSetCursor -win $_nWave2 496759.976774 -snap {("G3" 2)}
wvSetMarker -win $_nWave2 507000.000000
wvSelectSignal -win $_nWave2 {( "G3" 4 )} 
wvSelectSignal -win $_nWave2 {( "G3" 5 )} 
wvSelectSignal -win $_nWave2 {( "G3" 7 )} 
wvSelectSignal -win $_nWave2 {( "G3" 9 )} 
wvSetMarker -win $_nWave2 505000.000000
wvSelectSignal -win $_nWave2 {( "G3" 11 )} 
wvSelectSignal -win $_nWave2 {( "G3" 10 )} 
wvZoom -win $_nWave2 497484.756202 524909.474527
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 11
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G3" 3 )} 
wvSelectSignal -win $_nWave2 {( "G3" 4 )} 
wvSelectSignal -win $_nWave2 {( "G3" 2 )} 
wvSelectSignal -win $_nWave2 {( "G3" 3 )} 
wvSelectSignal -win $_nWave2 {( "G3" 9 )} 
wvScrollUp -win $_nWave2 40
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 5
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
srcDeselectAll -win $_nTrace1
debReload
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G3" 9 )} 
wvSelectSignal -win $_nWave2 {( "G3" 10 )} 
wvSelectSignal -win $_nWave2 {( "G3" 9 )} 
wvSelectSignal -win $_nWave2 {( "G3" 2 9 )} 
wvSelectSignal -win $_nWave2 {( "G3" 2 3 9 )} 
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 42
wvSelectSignal -win $_nWave2 {( "G1" 6 )} 
wvSelectSignal -win $_nWave2 {( "G1" 6 7 )} 
wvSelectSignal -win $_nWave2 {( "G1" 6 7 8 )} 
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoom -win $_nWave2 496289.238090 508265.653991
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 563888.988621 585625.511169
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 8 )} 
srcHBSelect "tb_DandRiscvYsyx3rd.u_ysyx_210238" -win $_nTrace1
srcSetScope -win $_nTrace1 "tb_DandRiscvYsyx3rd.u_ysyx_210238" -delim "."
srcHBSelect "tb_DandRiscvYsyx3rd.u_ysyx_210238" -win $_nTrace1
srcHBSelect "tb_DandRiscvYsyx3rd.u_ysyx_210238.core_cpu" -win $_nTrace1
srcSetScope -win $_nTrace1 "tb_DandRiscvYsyx3rd.u_ysyx_210238.core_cpu" -delim \
           "."
srcHBSelect "tb_DandRiscvYsyx3rd.u_ysyx_210238.core_cpu" -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G1" 6 8 )} 
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 488114.107752 541029.033723
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 562549.409152 581724.155845
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 560541.368509 581594.245637
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 475673.740519 601387.862402
wvZoom -win $_nWave2 489349.957417 537825.089201
wvSetCursor -win $_nWave2 492990.753223 -snap {("G1" 3)}
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 488270.855568 515745.727008
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 493605.214076 516027.602383
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 535719.893468 621555.191795
wvSetCursor -win $_nWave2 564896.584111 -snap {("G1" 5)}
wvSelectSignal -win $_nWave2 {( "G1" 2 6 8 )} 
wvSelectSignal -win $_nWave2 {( "G1" 6 8 )} 
wvSelectSignal -win $_nWave2 {( "G1" 1 6 8 )} 
wvSelectSignal -win $_nWave2 {( "G1" 6 8 )} 
srcSearchString "memaccess_arb" -win $_nTrace1 -next -case
srcSearchString "memaccess_arb" -win $_nTrace1 -prev -case
srcSelect -win $_nTrace1 -range {3625 3625 6 6 1 14}
nsMsgSwitchTab -tab general
srcSearchString "memaccess_arb" -win $_nTrace1 -prev -case
srcSelect -win $_nTrace1 -range {3621 3621 2 2 1 14}
srcSearchString "writeback_arb" -win $_nTrace1 -next -case
srcDeselectAll -win $_nTrace1
srcSelect -signal "writeback_arbitration_isValid" -line 3625 -pos 1 -win \
          $_nTrace1
wvSetPosition -win $_nWave2 {("G3" 3)}
wvSetPosition -win $_nWave2 {("G1" 6)}
wvSetPosition -win $_nWave2 {("G1" 7)}
wvSetPosition -win $_nWave2 {("G1" 8)}
wvAddSignal -win $_nWave2 \
           "/tb_DandRiscvYsyx3rd/u_ysyx_210238/core_cpu/writeback_arbitration_isValid"
wvSetPosition -win $_nWave2 {("G1" 8)}
wvSetPosition -win $_nWave2 {("G1" 9)}
wvSelectSignal -win $_nWave2 {( "G1" 6 9 )} 
wvSelectSignal -win $_nWave2 {( "G1" 6 7 9 )} 
wvSelectSignal -win $_nWave2 {( "G1" 6 7 8 9 )} 
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 9 )} 
srcDeselectAll -win $_nTrace1
srcSelect -signal "writeback_arbitration_isValid" -line 3625 -pos 1 -win \
          $_nTrace1
srcSearchString "writeback_arb" -win $_nTrace1 -prev -case
srcSelect -win $_nTrace1 -range {3625 3625 2 2 1 14}
srcDeselectAll -win $_nTrace1
srcSelect -signal "writeback_arbitration_isValid" -line 3625 -pos 1 -win \
          $_nTrace1
srcSearchString "writeback_arbitration_isFir" -win $_nTrace1 -next -case
srcDeselectAll -win $_nTrace1
srcSelect -signal "writeback_arbitration_isFiring" -line 697 -pos 1 -win \
          $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvZoom -win $_nWave2 559995.033007 592029.577175
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoom -win $_nWave2 561216.636801 579819.740267
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 19
wvSelectGroup -win $_nWave2 {G2}
wvZoom -win $_nWave2 479079.937816 621278.805347
wvZoom -win $_nWave2 492017.117015 515414.143225
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 485345.839507 588390.582118
wvSelectGroup -win $_nWave2 {G2}
wvSelectGroup -win $_nWave2 {G2}
wvSelectSignal -win $_nWave2 {( "G3" 9 )} 
wvSelectSignal -win $_nWave2 {( "G3" 9 10 )} 
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 550791.019628 595870.601181
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G3" 2 9 10 )} 
wvSelectSignal -win $_nWave2 {( "G3" 2 3 9 10 )} 
wvSelectSignal -win $_nWave2 {( "G3" 2 3 4 9 10 )} 
wvZoom -win $_nWave2 490920.518460 608340.349930
wvZoom -win $_nWave2 502012.442145 531742.434318
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 439715.275040 723318.452403
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvZoom -win $_nWave2 465736.937074 639763.664182
wvSetCursor -win $_nWave2 499154.380607 -snap {("G3" 1)}
srcActiveTrace "tb_DandRiscvYsyx3rd.u_ysyx_210238.core_cpu.dCache_1.stall" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 499000 -TraceValue 1
srcDeselectAll -win $_nTrace1
srcSelect -signal "is_miss" -line 11880 -pos 1 -win $_nTrace1
srcSelect -signal "is_write" -line 11880 -pos 1 -win $_nTrace1
srcSelect -signal "cpu_cmd_ready_1" -line 11880 -pos 1 -win $_nTrace1
srcSelect -signal "next_level_wdone" -line 11880 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave2 {("G1" 0)}
wvSetPosition -win $_nWave2 {("G1" 1)}
wvSetPosition -win $_nWave2 {("G1" 2)}
wvSetPosition -win $_nWave2 {("G1" 4)}
wvSetPosition -win $_nWave2 {("G1" 5)}
wvSetPosition -win $_nWave2 {("G3" 1)}
wvSetPosition -win $_nWave2 {("G1" 17)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G3" 0)}
wvAddSignal -win $_nWave2 \
           "/tb_DandRiscvYsyx3rd/u_ysyx_210238/core_cpu/dCache_1/is_miss" \
           "/tb_DandRiscvYsyx3rd/u_ysyx_210238/core_cpu/dCache_1/is_write" \
           "/tb_DandRiscvYsyx3rd/u_ysyx_210238/core_cpu/dCache_1/cpu_cmd_ready_1" \
           "/tb_DandRiscvYsyx3rd/u_ysyx_210238/core_cpu/dCache_1/next_level_wdone"
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSetPosition -win $_nWave2 {("G3" 4)}
wvSetCursor -win $_nWave2 498952.258973 -snap {("G3" 3)}
srcActiveTrace \
           "tb_DandRiscvYsyx3rd.u_ysyx_210238.core_cpu.dCache_1.cpu_cmd_ready_1" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 357000 -TraceValue 1
srcDeselectAll -win $_nTrace1
srcSelect -signal "when_DCache_l256" -line 24272 -pos 1 -win $_nTrace1
srcSelect -signal "when_DCache_l259" -line 24275 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvSetCursor -win $_nWave2 498952.258973 -snap {("G3" 5)}
srcActiveTrace \
           "tb_DandRiscvYsyx3rd.u_ysyx_210238.core_cpu.dCache_1.when_DCache_l256" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 497000 -TraceValue 1
srcDeselectAll -win $_nTrace1
srcSelect -signal "bypass" -line 11871 -pos 1 -win $_nTrace1
srcAction -pos 11870 24 2 -win $_nTrace1 -name "bypass" -ctrlKey off
wvSetCursor -win $_nWave2 504813.786367 -snap {("G3" 5)}
srcActiveTrace \
           "tb_DandRiscvYsyx3rd.u_ysyx_210238.core_cpu.dCache_1.when_DCache_l256" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 499000 -TraceValue 0
srcDeselectAll -win $_nTrace1
srcSelect -signal "flush" -line 11871 -pos 1 -win $_nTrace1
srcSelect -signal "is_miss" -line 11871 -pos 1 -win $_nTrace1
srcSelect -signal "is_write" -line 11871 -pos 1 -win $_nTrace1
srcSelect -signal "bypass" -line 11871 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G3" 11 )} 
wvSelectSignal -win $_nWave2 {( "G3" 10 )} 
wvSelectSignal -win $_nWave2 {( "G3" 3 )} 
wvSelectSignal -win $_nWave2 {( "G3" 3 )} 
wvSetCursor -win $_nWave2 499154.380607 -snap {("G3" 3)}
srcActiveTrace \
           "tb_DandRiscvYsyx3rd.u_ysyx_210238.core_cpu.dCache_1.cpu_cmd_ready_1" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 499000 -TraceValue 0
wvSetCursor -win $_nWave2 504476.916976 -snap {("G3" 5)}
srcActiveTrace \
           "tb_DandRiscvYsyx3rd.u_ysyx_210238.core_cpu.dCache_1.when_DCache_l256" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 499000 -TraceValue 0
wvSelectSignal -win $_nWave2 {( "G3" 5 )} 
wvSelectSignal -win $_nWave2 {( "G3" 10 )} 
wvSelectSignal -win $_nWave2 {( "G3" 11 )} 
wvSetCursor -win $_nWave2 498952.258973 -snap {("G3" 11)}
srcActiveTrace "tb_DandRiscvYsyx3rd.u_ysyx_210238.core_cpu.dCache_1.stall" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 357000 -TraceValue 0
wvSelectSignal -win $_nWave2 {( "G3" 12 )} 
wvSelectSignal -win $_nWave2 {( "G3" 13 )} 
wvSelectSignal -win $_nWave2 {( "G3" 12 )} 
wvSelectSignal -win $_nWave2 {( "G3" 13 )} 
wvSelectSignal -win $_nWave2 {( "G3" 12 )} 
wvSelectSignal -win $_nWave2 {( "G3" 13 )} 
wvSelectSignal -win $_nWave2 {( "G3" 12 )} 
wvSelectSignal -win $_nWave2 {( "G3" 11 )} 
wvSelectSignal -win $_nWave2 {( "G3" 12 )} 
wvSelectSignal -win $_nWave2 {( "G3" 13 )} 
wvSelectSignal -win $_nWave2 {( "G3" 11 )} 
wvSelectSignal -win $_nWave2 {( "G3" 12 )} 
wvSelectSignal -win $_nWave2 {( "G3" 13 )} 
wvSelectSignal -win $_nWave2 {( "G3" 11 )} 
srcDeselectAll -win $_nTrace1
debReload
wvZoom -win $_nWave2 486420.717648 577038.583680
wvSelectSignal -win $_nWave2 {( "G3" 7 )} 
wvSelectSignal -win $_nWave2 {( "G3" 11 )} 
wvSelectSignal -win $_nWave2 {( "G3" 13 )} 
wvSelectSignal -win $_nWave2 {( "G3" 12 13 )} 
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSelectSignal -win $_nWave2 {( "G1" 6 )} 
wvSelectSignal -win $_nWave2 {( "G1" 6 7 )} 
wvSelectSignal -win $_nWave2 {( "G1" 6 7 8 )} 
wvSelectSignal -win $_nWave2 {( "G1" 6 7 8 9 )} 
wvZoom -win $_nWave2 499050.385387 522345.105885
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 6 7 8 )} 
wvSelectSignal -win $_nWave2 {( "G1" 9 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G3" 11)}
wvSetPosition -win $_nWave2 {("G3" 10)}
wvSelectSignal -win $_nWave2 {( "G1" 6 )} 
wvSelectSignal -win $_nWave2 {( "G1" 6 7 )} 
wvSelectSignal -win $_nWave2 {( "G1" 6 7 8 )} 
wvSelectSignal -win $_nWave2 {( "G1" 6 7 8 9 )} 
wvZoom -win $_nWave2 493697.920573 521601.081711
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoom -win $_nWave2 499169.446363 516215.976861
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 491154.343270 525392.593453
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 6 7 8 9 )} {( "G3" 12 )} 
wvSelectSignal -win $_nWave2 {( "G1" 6 7 8 9 )} {( "G3" 12 13 )} 
wvZoom -win $_nWave2 494945.338064 522436.677932
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 6 7 8 9 )} {( "G3" 12 13 14 )} 
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G1" 6 7 8 9 )} {( "G3" 12 13 14 19 )} 
wvSelectSignal -win $_nWave2 {( "G1" 6 7 8 9 )} {( "G3" 12 13 14 19 20 )} 
wvZoom -win $_nWave2 488884.045747 527987.097499
wvSelectSignal -win $_nWave2 {( "G1" 6 7 8 9 )} {( "G3" 11 12 13 14 19 20 )} 
srcDeselectAll -win $_nTrace1
debReload
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 143392.995043 941743.183658
wvZoom -win $_nWave2 327294.800008 452162.580186
wvZoom -win $_nWave2 342957.657452 377570.638717
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 590899.737462 776145.518727
wvZoom -win $_nWave2 623387.673549 702276.701575
wvSetCursor -win $_nWave2 638933.362773 -snap {("G3" 10)}
wvSetCursor -win $_nWave2 637192.489913 -snap {("G3" 9)}
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 402660.838366 1104385.309110
wvZoom -win $_nWave2 605055.236625 736543.677910
wvSetMarker -win $_nWave2 647000.000000
wvZoom -win $_nWave2 631568.052274 675397.532703
wvSelectSignal -win $_nWave2 {( "G3" 11 )} 
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSelectSignal -win $_nWave2 {( "G1" 6 )} {( "G3" 11 )} 
wvSelectSignal -win $_nWave2 {( "G3" 11 )} 
wvSelectSignal -win $_nWave2 {( "G1" 6 )} {( "G3" 11 )} 
wvSelectSignal -win $_nWave2 {( "G1" 6 7 )} {( "G3" 11 )} 
wvSelectSignal -win $_nWave2 {( "G1" 6 7 8 )} {( "G3" 11 )} 
wvSelectSignal -win $_nWave2 {( "G1" 6 7 8 9 )} {( "G3" 11 )} 
wvSetCursor -win $_nWave2 652999.191949 -snap {("G1" 5)}
wvSetCursor -win $_nWave2 652965.255070 -snap {("G1" 5)}
wvSetCursor -win $_nWave2 645125.835806 -snap {("G1" 5)}
wvSetCursor -win $_nWave2 652965.255070 -snap {("G1" 5)}
wvSetCursor -win $_nWave2 660906.484973 -snap {("G1" 9)}
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoom -win $_nWave2 647433.543641 672563.803229
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 6 7 8 9 )} {( "G3" 11 12 )} 
wvSelectSignal -win $_nWave2 {( "G1" 6 7 8 9 )} {( "G3" 11 12 13 )} 
wvSelectSignal -win $_nWave2 {( "G1" 6 7 8 9 )} {( "G3" 11 12 13 14 )} 
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSetCursor -win $_nWave2 652983.993929 -snap {("G3" 13)}
wvSelectSignal -win $_nWave2 {( "G3" 19 )} 
wvSelectSignal -win $_nWave2 {( "G3" 19 20 )} 
wvZoom -win $_nWave2 647224.368039 678474.230135
wvZoomOut -win $_nWave2
wvSetMarker -win $_nWave2 661000.000000
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSelectSignal -win $_nWave2 {( "G3" 12 19 20 )} 
wvSelectSignal -win $_nWave2 {( "G3" 11 12 19 20 )} 
wvSelectSignal -win $_nWave2 {( "G3" 11 19 20 )} 
wvSelectSignal -win $_nWave2 {( "G3" 11 12 19 20 )} 
wvSelectSignal -win $_nWave2 {( "G3" 11 12 13 19 20 )} 
wvSetCursor -win $_nWave2 663030.773315 -snap {("G1" 6)}
wvSelectSignal -win $_nWave2 {( "G1" 6 )} 
wvSelectSignal -win $_nWave2 {( "G1" 5 )} 
wvSelectSignal -win $_nWave2 {( "G1" 7 )} 
wvSetCursor -win $_nWave2 661022.458523 -snap {("G1" 5)}
wvSelectSignal -win $_nWave2 {( "G3" 11 )} 
wvSelectSignal -win $_nWave2 {( "G3" 13 )} 
wvSelectSignal -win $_nWave2 {( "G3" 12 )} 
wvSelectSignal -win $_nWave2 {( "G3" 11 )} 
wvSelectSignal -win $_nWave2 {( "G3" 13 )} 
wvSelectSignal -win $_nWave2 {( "G3" 12 13 )} 
wvSelectSignal -win $_nWave2 {( "G3" 13 )} 
wvSelectSignal -win $_nWave2 {( "G3" 11 13 )} 
srcDeselectAll -win $_nTrace1
debReload
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 833136.083397 1418499.353887
wvZoom -win $_nWave2 922651.566108 1018059.207175
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 457673.211646 716525.998560
wvZoom -win $_nWave2 487035.916472 580234.945443
wvZoom -win $_nWave2 494107.929511 538163.684204
wvSetCursor -win $_nWave2 505057.908029 -snap {("G3" 11)}
wvSelectSignal -win $_nWave2 {( "G3" 9 )} 
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSelectSignal -win $_nWave2 {( "G1" 6 )} 
wvSelectSignal -win $_nWave2 {( "G1" 6 7 )} 
wvSelectSignal -win $_nWave2 {( "G1" 6 7 8 )} 
wvSelectSignal -win $_nWave2 {( "G1" 6 7 8 9 )} 
wvSetCursor -win $_nWave2 498951.845241 -snap {("G1" 6)}
srcActiveTrace "tb_DandRiscvYsyx3rd.u_ysyx_210238.core_cpu.writeback_RD\[63:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 497000 -TraceValue \
           0000000000000000000000000000000010000000000000000100001110101000
srcDeselectAll -win $_nTrace1
srcSelect -signal "writeback_IS_LOAD" -line 1559 -pos 1 -win $_nTrace1
srcSelect -signal "writeback_LSU_RDATA" -line 1559 -pos 1 -win $_nTrace1
srcSelect -signal "writeback_ALU_RESULT" -line 1559 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave2 {("G1" 0)}
wvSetPosition -win $_nWave2 {("G1" 1)}
wvSetPosition -win $_nWave2 {("G1" 2)}
wvSetPosition -win $_nWave2 {("G1" 3)}
wvSetPosition -win $_nWave2 {("G1" 4)}
wvSetPosition -win $_nWave2 {("G3" 2)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G1" 16)}
wvAddSignal -win $_nWave2 \
           "/tb_DandRiscvYsyx3rd/u_ysyx_210238/core_cpu/writeback_IS_LOAD" \
           "/tb_DandRiscvYsyx3rd/u_ysyx_210238/core_cpu/writeback_LSU_RDATA\[63:0\]" \
           "/tb_DandRiscvYsyx3rd/u_ysyx_210238/core_cpu/writeback_ALU_RESULT\[63:0\]"
wvSetPosition -win $_nWave2 {("G1" 16)}
wvSetPosition -win $_nWave2 {("G1" 19)}
wvSetCursor -win $_nWave2 498866.565035 -snap {("G1" 18)}
srcActiveTrace \
           "tb_DandRiscvYsyx3rd.u_ysyx_210238.core_cpu.writeback_LSU_RDATA\[63:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 209000 -TraceValue \
           0000000000000000000000000000000000000000000000000000000000000000
srcDeselectAll -win $_nTrace1
srcSelect -signal "memaccess_to_writeback_LSU_RDATA" -line 1619 -pos 1 -win \
          $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvSetCursor -win $_nWave2 499054.181489 -snap {("G1" 20)}
srcActiveTrace \
           "tb_DandRiscvYsyx3rd.u_ysyx_210238.core_cpu.memaccess_to_writeback_LSU_RDATA\[63:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 499000 -TraceValue \
           xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
srcDeselectAll -win $_nTrace1
srcSelect -signal "when_Pipeline_l127_40" -line 3755 -pos 1 -win $_nTrace1
srcSelect -signal "_zz_execute_MEM_WDATA" -line 3756 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvSetCursor -win $_nWave2 504938.515740 -snap {("G1" 21)}
srcActiveTrace "tb_DandRiscvYsyx3rd.u_ysyx_210238.core_cpu.when_Pipeline_l127_40" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 499000 -TraceValue 0
wvSelectSignal -win $_nWave2 {( "G1" 21 22 )} {( "G3" 9 )} 
srcDeselectAll -win $_nTrace1
debReload
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 447775.193304 732406.410616
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 457086.590076 684967.874397
wvZoom -win $_nWave2 480730.486397 617918.019157
wvZoom -win $_nWave2 498629.130818 543136.739201
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 492606.905061 549710.356157
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 471328.518813 621393.646974
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 484458.491312 566259.381923
wvSelectSignal -win $_nWave2 {( "G3" 9 )} 
wvSetCursor -win $_nWave2 499057.875970 -snap {("G3" 9)}
srcActiveTrace "tb_DandRiscvYsyx3rd.u_ysyx_210238.core_cpu.dCache_1.stall" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 357000 -TraceValue 0
srcDeselectAll -win $_nTrace1
srcSelect -signal "bypass_stall" -line 11884 -pos 1 -win $_nTrace1
srcSelect -signal "dcache_stall" -line 11884 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 23)}
wvSetPosition -win $_nWave2 {("G1" 24)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G3" 0)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G3" 2)}
wvSetCursor -win $_nWave2 499089.544917 -snap {("G3" 2)}
srcActiveTrace "tb_DandRiscvYsyx3rd.u_ysyx_210238.core_cpu.dCache_1.dcache_stall" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 499000 -TraceValue 1
wvSelectSignal -win $_nWave2 {( "G3" 3 )} 
wvSelectSignal -win $_nWave2 {( "G3" 4 )} 
wvSelectSignal -win $_nWave2 {( "G3" 5 )} 
srcDeselectAll -win $_nTrace1
debReload
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G3" 2 )} 
wvSelectSignal -win $_nWave2 {( "G3" 1 )} 
wvSelectSignal -win $_nWave2 {( "G3" 2 )} 
wvSelectSignal -win $_nWave2 {( "G3" 1 )} 
wvZoom -win $_nWave2 491488.997590 538707.397861
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G3" 10 )} 
wvSelectSignal -win $_nWave2 {( "G3" 8 )} 
wvSelectSignal -win $_nWave2 {( "G3" 10 )} 
wvSelectSignal -win $_nWave2 {( "G3" 4 )} 
wvSelectSignal -win $_nWave2 {( "G3" 6 )} 
wvSelectSignal -win $_nWave2 {( "G3" 7 )} 
wvSelectSignal -win $_nWave2 {( "G3" 6 )} 
wvSelectSignal -win $_nWave2 {( "G3" 4 )} 
wvSelectSignal -win $_nWave2 {( "G3" 3 )} 
wvSelectSignal -win $_nWave2 {( "G3" 4 )} 
wvSelectSignal -win $_nWave2 {( "G3" 5 )} 
wvSelectSignal -win $_nWave2 {( "G3" 6 )} 
wvSelectSignal -win $_nWave2 {( "G3" 5 )} 
wvSelectSignal -win $_nWave2 {( "G3" 3 )} 
wvSelectSignal -win $_nWave2 {( "G3" 2 )} 
wvSelectSignal -win $_nWave2 {( "G3" 1 )} 
wvSelectSignal -win $_nWave2 {( "G3" 3 )} 
wvSelectSignal -win $_nWave2 {( "G3" 2 )} 
wvSetCursor -win $_nWave2 499020.542658 -snap {("G3" 2)}
srcActiveTrace "tb_DandRiscvYsyx3rd.u_ysyx_210238.core_cpu.dCache_1.dcache_stall" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 357000 -TraceValue 0
wvSelectSignal -win $_nWave2 {( "G3" 3 )} 
wvSelectSignal -win $_nWave2 {( "G3" 4 )} 
wvSelectSignal -win $_nWave2 {( "G3" 5 )} 
wvSelectSignal -win $_nWave2 {( "G3" 13 )} 
srcDeselectAll -win $_nTrace1
debReload
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G3" 19 )} 
wvSelectSignal -win $_nWave2 {( "G3" 20 )} 
wvSelectSignal -win $_nWave2 {( "G3" 11 )} 
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSetCursor -win $_nWave2 504998.249545 -snap {("G3" 19)}
wvSelectSignal -win $_nWave2 {( "G1" 5 )} 
wvSelectSignal -win $_nWave2 {( "G3" 13 )} 
wvSelectSignal -win $_nWave2 {( "G1" 5 )} 
wvSelectSignal -win $_nWave2 {( "G1" 17 )} 
wvSelectSignal -win $_nWave2 {( "G1" 18 )} 
wvSetCursor -win $_nWave2 499002.262209 -snap {("G1" 18)}
srcActiveTrace \
           "tb_DandRiscvYsyx3rd.u_ysyx_210238.core_cpu.writeback_LSU_RDATA\[63:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 209000 -TraceValue \
           0000000000000000000000000000000000000000000000000000000000000000
wvSelectSignal -win $_nWave2 {( "G1" 19 )} 
wvSelectSignal -win $_nWave2 {( "G1" 20 )} 
wvSelectSignal -win $_nWave2 {( "G1" 21 )} 
wvSetCursor -win $_nWave2 498874.299065 -snap {("G1" 21)}
srcActiveTrace "tb_DandRiscvYsyx3rd.u_ysyx_210238.core_cpu.when_Pipeline_l127_40" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 355000 -TraceValue 1
srcDeselectAll -win $_nTrace1
srcSelect -signal "writeback_arbitration_isStuck" -line 3372 -pos 1 -win \
          $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvSetPosition -win $_nWave2 {("G3" 2)}
wvSetPosition -win $_nWave2 {("G3" 1)}
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G1" 22)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 22)}
wvSetPosition -win $_nWave2 {("G1" 23)}
wvSelectSignal -win $_nWave2 {( "G1" 22 )} 
wvSelectSignal -win $_nWave2 {( "G1" 21 )} 
wvSelectSignal -win $_nWave2 {( "G1" 20 )} 
wvSetCursor -win $_nWave2 507027.379406 -snap {("G1" 20)}
srcActiveTrace \
           "tb_DandRiscvYsyx3rd.u_ysyx_210238.core_cpu.memaccess_to_writeback_LSU_RDATA\[63:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 499000 -TraceValue \
           xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
srcDeselectAll -win $_nTrace1
srcSelect -signal "when_Pipeline_l127_40" -line 3755 -pos 1 -win $_nTrace1
srcAction -pos 3754 3 11 -win $_nTrace1 -name "when_Pipeline_l127_40" -ctrlKey \
          off
srcBackwardHistory -win $_nTrace1
srcHBSelect "tb_DandRiscvYsyx3rd.u_ysyx_210238.core_cpu" -win $_nTrace1
srcHBSelect "tb_DandRiscvYsyx3rd.u_ysyx_210238.core_cpu" -win $_nTrace1
srcBackwardHistory -win $_nTrace1
srcHBSelect "tb_DandRiscvYsyx3rd.u_ysyx_210238.core_cpu" -win $_nTrace1
srcHBSelect "tb_DandRiscvYsyx3rd.u_ysyx_210238.core_cpu" -win $_nTrace1
srcBackwardHistory -win $_nTrace1
srcHBSelect "tb_DandRiscvYsyx3rd.u_ysyx_210238.core_cpu" -win $_nTrace1
srcHBSelect "tb_DandRiscvYsyx3rd.u_ysyx_210238.core_cpu" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "memaccess_to_writeback_LSU_RDATA" -line 1619 -pos 1 -win \
          $_nTrace1
srcAction -pos 1618 7 7 -win $_nTrace1 -name "memaccess_to_writeback_LSU_RDATA" \
          -ctrlKey off
srcBackwardHistory -win $_nTrace1
srcHBSelect "tb_DandRiscvYsyx3rd.u_ysyx_210238.core_cpu" -win $_nTrace1
srcHBSelect "tb_DandRiscvYsyx3rd.u_ysyx_210238.core_cpu" -win $_nTrace1
srcBackwardHistory -win $_nTrace1
srcHBSelect "tb_DandRiscvYsyx3rd.u_ysyx_210238.core_cpu.dCache_1" -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G1" 22 )} 
wvScrollDown -win $_nWave2 0
wvSelectSignal -win $_nWave2 {( "G1" 8 )} 
wvSelectSignal -win $_nWave2 {( "G1" 7 )} 
wvSelectSignal -win $_nWave2 {( "G1" 6 )} 
wvSetCursor -win $_nWave2 506990.818507 -snap {("G1" 6)}
srcActiveTrace "tb_DandRiscvYsyx3rd.u_ysyx_210238.core_cpu.writeback_RD\[63:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 499000 -TraceValue \
           xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
wvSetPosition -win $_nWave2 {("G1" 6)}
wvSetPosition -win $_nWave2 {("G1" 7)}
wvSetPosition -win $_nWave2 {("G1" 8)}
wvSetPosition -win $_nWave2 {("G1" 9)}
wvSetPosition -win $_nWave2 {("G1" 10)}
wvSetPosition -win $_nWave2 {("G1" 11)}
wvSetPosition -win $_nWave2 {("G1" 12)}
wvSetPosition -win $_nWave2 {("G1" 13)}
wvSetPosition -win $_nWave2 {("G1" 14)}
wvSetPosition -win $_nWave2 {("G1" 15)}
wvSetPosition -win $_nWave2 {("G1" 16)}
wvSetPosition -win $_nWave2 {("G1" 17)}
wvSetPosition -win $_nWave2 {("G1" 18)}
wvSetPosition -win $_nWave2 {("G1" 19)}
wvSetPosition -win $_nWave2 {("G1" 20)}
wvSetPosition -win $_nWave2 {("G1" 21)}
wvSetPosition -win $_nWave2 {("G1" 22)}
wvSetPosition -win $_nWave2 {("G1" 23)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G1" 23)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G3" 0)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G3" 1)}
wvSelectSignal -win $_nWave2 {( "G1" 8 )} 
wvSetPosition -win $_nWave2 {("G1" 8)}
wvSetPosition -win $_nWave2 {("G1" 9)}
wvSetPosition -win $_nWave2 {("G1" 10)}
wvSetPosition -win $_nWave2 {("G1" 11)}
wvSetPosition -win $_nWave2 {("G1" 12)}
wvSetPosition -win $_nWave2 {("G1" 13)}
wvSetPosition -win $_nWave2 {("G1" 15)}
wvSetPosition -win $_nWave2 {("G1" 16)}
wvSetPosition -win $_nWave2 {("G1" 17)}
wvSetPosition -win $_nWave2 {("G1" 18)}
wvSetPosition -win $_nWave2 {("G1" 19)}
wvSetPosition -win $_nWave2 {("G1" 20)}
wvSetPosition -win $_nWave2 {("G1" 21)}
wvSetPosition -win $_nWave2 {("G1" 22)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSetPosition -win $_nWave2 {("G3" 1)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G3" 2)}
wvSetCursor -win $_nWave2 506935.977160 -snap {("G3" 1)}
srcActiveTrace "tb_DandRiscvYsyx3rd.u_ysyx_210238.core_cpu.writeback_RD\[63:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 499000 -TraceValue \
           xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
srcDeselectAll -win $_nTrace1
srcSelect -signal "writeback_IS_LOAD" -line 1559 -pos 1 -win $_nTrace1
srcSelect -signal "writeback_LSU_RDATA" -line 1559 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvZoom -win $_nWave2 496881.730102 526660.581841
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 498992.650642 -snap {("G3" 3)}
srcActiveTrace "tb_DandRiscvYsyx3rd.u_ysyx_210238.core_cpu.writeback_IS_LOAD" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 209000 -TraceValue 0
wvSelectSignal -win $_nWave2 {( "G3" 2 )} 
wvSetCursor -win $_nWave2 505102.906709 -snap {("G3" 2)}
wvSelectSignal -win $_nWave2 {( "G3" 23 )} 
wvScrollDown -win $_nWave2 0
wvSelectSignal -win $_nWave2 {( "G1" 5 )} 
wvSelectSignal -win $_nWave2 {( "G1" 6 )} 
wvSelectSignal -win $_nWave2 {( "G1" 7 )} 
wvSelectSignal -win $_nWave2 {( "G1" 9 )} 
wvSelectSignal -win $_nWave2 {( "G1" 5 )} 
wvSelectSignal -win $_nWave2 {( "G3" 2 )} 
wvSetCursor -win $_nWave2 505033.733999 -snap {("G3" 2)}
srcActiveTrace \
           "tb_DandRiscvYsyx3rd.u_ysyx_210238.core_cpu.writeback_arbitration_isFiring" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 499000 -TraceValue 0
srcDeselectAll -win $_nTrace1
srcSelect -signal "writeback_arbitration_isValid" -line 3397 -pos 1 -win \
          $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvSetCursor -win $_nWave2 495626.245412 -snap {("G3" 5)}
wvSetCursor -win $_nWave2 495072.863731 -snap {("G3" 5)}
srcActiveTrace \
           "tb_DandRiscvYsyx3rd.u_ysyx_210238.core_cpu.writeback_arbitration_isValid" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 495000 -TraceValue 1
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G3" 2 5 )} 
wvSetCursor -win $_nWave2 499084.880922 -snap {("G3" 4)}
wvZoom -win $_nWave2 494680.885040 517899.858095
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G3" 3 )} 
wvSetCursor -win $_nWave2 499193.438069 -snap {("G3" 2)}
wvSetCursor -win $_nWave2 499103.546574 -snap {("G3" 2)}
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G3" 5 )} 
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSelectSignal -win $_nWave2 {( "G1" 5 )} 
wvSelectSignal -win $_nWave2 {( "G3" 6 )} 
wvSelectSignal -win $_nWave2 {( "G3" 3 6 )} 
wvSelectSignal -win $_nWave2 {( "G3" 6 )} 
wvSelectSignal -win $_nWave2 {( "G3" 5 )} 
wvSelectSignal -win $_nWave2 {( "G3" 3 5 )} 
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G3" 24 )} 
wvSelectSignal -win $_nWave2 {( "G3" 25 )} 
wvSelectSignal -win $_nWave2 {( "G3" 24 )} 
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvSelectSignal -win $_nWave2 {( "G3" 3 )} 
wvSelectSignal -win $_nWave2 {( "G1" 5 )} 
wvSelectSignal -win $_nWave2 {( "G1" 5 )} 
wvSetCursor -win $_nWave2 492977.441217 -snap {("G1" 5)}
srcActiveTrace \
           "tb_DandRiscvYsyx3rd.u_ysyx_210238.core_cpu.memaccess_arbitration_isFiring" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 357000 -TraceValue 0
srcSearchString "memaccess_PC" -win $_nTrace1 -next -case
srcSearchString "memaccess_PC" -win $_nTrace1 -prev -case
srcSelect -win $_nTrace1 -range {1669 1669 4 5 16 1}
srcSearchString "memaccess_PC" -win $_nTrace1 -prev -case
srcSelect -win $_nTrace1 -range {1614 1614 8 9 12 1}
srcSearchString "memaccess_PC" -win $_nTrace1 -prev -case
srcSelect -win $_nTrace1 -range {1614 1614 4 5 1 1}
wvSetPosition -win $_nWave2 {("G1" 5)}
wvSetPosition -win $_nWave2 {("G1" 6)}
wvSetPosition -win $_nWave2 {("G1" 7)}
wvSetPosition -win $_nWave2 {("G1" 8)}
wvSetPosition -win $_nWave2 {("G1" 9)}
wvSetPosition -win $_nWave2 {("G1" 10)}
wvSetPosition -win $_nWave2 {("G1" 11)}
wvSetPosition -win $_nWave2 {("G1" 12)}
wvSetPosition -win $_nWave2 {("G1" 13)}
wvSetPosition -win $_nWave2 {("G1" 14)}
wvSetPosition -win $_nWave2 {("G1" 15)}
wvSetPosition -win $_nWave2 {("G1" 16)}
wvSetPosition -win $_nWave2 {("G1" 17)}
wvSetPosition -win $_nWave2 {("G1" 18)}
wvSetPosition -win $_nWave2 {("G1" 19)}
wvSetPosition -win $_nWave2 {("G1" 20)}
wvSetPosition -win $_nWave2 {("G1" 21)}
wvAddSignal -win $_nWave2 \
           "/tb_DandRiscvYsyx3rd/u_ysyx_210238/core_cpu/memaccess_PC\[63:0\]"
wvSetPosition -win $_nWave2 {("G1" 21)}
wvSetPosition -win $_nWave2 {("G1" 22)}
wvSelectSignal -win $_nWave2 {( "G1" 5 )} 
wvSetPosition -win $_nWave2 {("G1" 5)}
wvSetPosition -win $_nWave2 {("G1" 6)}
wvSetPosition -win $_nWave2 {("G1" 7)}
wvSetPosition -win $_nWave2 {("G1" 8)}
wvSetPosition -win $_nWave2 {("G1" 9)}
wvSetPosition -win $_nWave2 {("G1" 10)}
wvSetPosition -win $_nWave2 {("G1" 11)}
wvSetPosition -win $_nWave2 {("G1" 12)}
wvSetPosition -win $_nWave2 {("G1" 13)}
wvSetPosition -win $_nWave2 {("G1" 14)}
wvSetPosition -win $_nWave2 {("G1" 15)}
wvSetPosition -win $_nWave2 {("G1" 16)}
wvSetPosition -win $_nWave2 {("G1" 17)}
wvSetPosition -win $_nWave2 {("G1" 18)}
wvSetPosition -win $_nWave2 {("G1" 19)}
wvSetPosition -win $_nWave2 {("G1" 20)}
wvSetPosition -win $_nWave2 {("G1" 21)}
wvSetPosition -win $_nWave2 {("G1" 22)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 22)}
wvSelectSignal -win $_nWave2 {( "G1" 21 22 )} 
wvSetCursor -win $_nWave2 498892.301562 -snap {("G1" 21)}
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G1" 21 22 )} {( "G3" 16 )} 
wvZoom -win $_nWave2 490694.197254 525032.748192
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 448381.976779 700224.605103
wvZoom -win $_nWave2 483871.994862 544907.025962
wvSetMarker -win $_nWave2 499000.000000
wvZoom -win $_nWave2 495001.495307 525625.343663
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 21 22 )} {( "G3" 7 16 )} 
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 21 22 )} {( "G3" 7 16 18 )} 
wvSetCursor -win $_nWave2 504984.182228 -snap {("G3" 16)}
wvSetCursor -win $_nWave2 499044.364950 -snap {("G3" 16)}
wvSetCursor -win $_nWave2 505233.156604 -snap {("G3" 16)}
wvSelectSignal -win $_nWave2 {( "G1" 21 22 )} {( "G3" 7 16 18 24 )} 
srcDeselectAll -win $_nTrace1
debReload
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 427951.386085 1115405.208414
wvZoom -win $_nWave2 595623.050068 759036.386076
wvZoom -win $_nWave2 623459.622984 708108.110626
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 611186.739275 743320.963887
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvZoom -win $_nWave2 627914.533099 694518.776399
wvSetCursor -win $_nWave2 645061.967011 -snap {("G3" 15)}
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSelectSignal -win $_nWave2 {( "G3" 1 2 )} 
wvSelectSignal -win $_nWave2 {( "G3" 1 2 3 )} 
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvZoom -win $_nWave2 633149.012925 686757.306313
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G3" 1 2 3 18 )} 
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSetCursor -win $_nWave2 647075.131726 -snap {("G3" 16)}
wvSetCursor -win $_nWave2 644771.407155 -snap {("G3" 16)}
wvSetCursor -win $_nWave2 647303.428755 -snap {("G3" 16)}
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 625521.816711 696335.404415
srcDeselectAll -win $_nTrace1
debReload
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 378988.399698 784295.438264
wvZoom -win $_nWave2 474862.422371 600706.884210
wvZoom -win $_nWave2 487724.574103 558076.646459
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G3" 6 )} 
wvSelectSignal -win $_nWave2 {( "G3" 7 )} 
wvSelectSignal -win $_nWave2 {( "G3" 16 )} 
wvSelectSignal -win $_nWave2 {( "G3" 16 17 )} 
wvSelectSignal -win $_nWave2 {( "G3" 16 17 18 )} 
wvZoom -win $_nWave2 493607.674231 528034.704605
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G3" 15 16 17 18 )} 
wvSelectSignal -win $_nWave2 {( "G3" 7 15 16 17 18 )} 
wvSetCursor -win $_nWave2 498925.670793 -snap {("G3" 7)}
srcActiveTrace "tb_DandRiscvYsyx3rd.u_ysyx_210238.core_cpu.dCache_1.dcache_stall" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 357000 -TraceValue 0
wvSelectSignal -win $_nWave2 {( "G3" 6 )} 
srcDeselectAll -win $_nTrace1
srcSelect -signal "bypass_stall" -line 11884 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
debReload
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G3" 6 )} 
srcDeselectAll -win $_nTrace1
srcSelect -signal "bypass_stall" -line 11884 -pos 1 -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G3" 10 )} 
wvSelectSignal -win $_nWave2 {( "G3" 6 )} 
wvSelectSignal -win $_nWave2 {( "G3" 24 )} 
wvSelectSignal -win $_nWave2 {( "G3" 18 24 )} 
srcDeselectAll -win $_nTrace1
srcSelect -signal "cpu_bypass_rsp_valid" -line 11884 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave2 {("G1" 5)}
wvSetPosition -win $_nWave2 {("G1" 22)}
wvSetPosition -win $_nWave2 {("G1" 16)}
wvSetPosition -win $_nWave2 {("G1" 17)}
wvSetPosition -win $_nWave2 {("G1" 18)}
wvSetPosition -win $_nWave2 {("G1" 19)}
wvSetPosition -win $_nWave2 {("G1" 20)}
wvSetPosition -win $_nWave2 {("G1" 21)}
wvSetPosition -win $_nWave2 {("G1" 22)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G3" 0)}
wvAddSignal -win $_nWave2 \
           "/tb_DandRiscvYsyx3rd/u_ysyx_210238/core_cpu/dCache_1/cpu_bypass_rsp_valid"
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSetPosition -win $_nWave2 {("G3" 1)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "cpu_cmd_ready" -line 11884 -pos 1 -win $_nTrace1
srcSelect -win $_nTrace1 -range {11884 11893 13 4 4 26}
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "cpu_cmd_ready" -line 11884 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
srcDeselectAll -win $_nTrace1
srcSelect -signal "bypass" -line 11884 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
srcDeselectAll -win $_nTrace1
srcSelect -signal "bypass_stall" -line 11884 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
srcDeselectAll -win $_nTrace1
srcSelect -signal "bypass_stall" -line 11884 -pos 1 -win $_nTrace1
srcAction -pos 11883 3 3 -win $_nTrace1 -name "bypass_stall" -ctrlKey off
wvSelectSignal -win $_nWave2 {( "G3" 20 )} 
wvSelectSignal -win $_nWave2 {( "G3" 21 )} 
wvSelectSignal -win $_nWave2 {( "G3" 20 )} 
wvSelectSignal -win $_nWave2 {( "G3" 21 )} 
wvSelectSignal -win $_nWave2 {( "G3" 20 )} 
wvSelectSignal -win $_nWave2 {( "G3" 20 )} 
wvSelectSignal -win $_nWave2 {( "G3" 21 )} 
wvSelectSignal -win $_nWave2 {( "G3" 22 )} 
wvSelectSignal -win $_nWave2 {( "G3" 21 )} 
wvSelectSignal -win $_nWave2 {( "G3" 20 )} 
wvSelectSignal -win $_nWave2 {( "G3" 21 )} 
wvSelectSignal -win $_nWave2 {( "G3" 21 )} 
wvSelectSignal -win $_nWave2 {( "G3" 20 )} 
wvSelectSignal -win $_nWave2 {( "G3" 21 )} 
wvSelectSignal -win $_nWave2 {( "G3" 20 )} 
wvSetCursor -win $_nWave2 499045.625603 -snap {("G3" 20)}
srcActiveTrace "tb_DandRiscvYsyx3rd.u_ysyx_210238.core_cpu.dCache_1.stall" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 499000 -TraceValue 1
srcDeselectAll -win $_nTrace1
srcSelect -signal "dcache_stall" -line 11886 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "dcache_stall" -line 11886 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvSetCursor -win $_nWave2 499085.610539 -snap {("G3" 5)}
srcActiveTrace "tb_DandRiscvYsyx3rd.u_ysyx_210238.core_cpu.dCache_1.dcache_stall" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 499000 -TraceValue 1
wvScrollDown -win $_nWave2 0
wvSelectSignal -win $_nWave2 {( "G3" 4 )} 
srcDeselectAll -win $_nTrace1
srcSelect -signal "bypass_stall" -line 11884 -pos 1 -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G3" 2 )} 
wvSelectSignal -win $_nWave2 {( "G3" 3 )} 
wvSelectSignal -win $_nWave2 {( "G3" 4 )} 
wvSelectSignal -win $_nWave2 {( "G3" 3 )} 
srcDeselectAll -win $_nTrace1
srcSelect -signal "bypass" -line 11884 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
debReload
srcDeselectAll -win $_nTrace1
srcSelect -signal "cpu_bypass_rsp_valid" -line 11884 -pos 1 -win $_nTrace1
srcAction -pos 11883 20 13 -win $_nTrace1 -name "cpu_bypass_rsp_valid" -ctrlKey \
          off
srcBackwardHistory -win $_nTrace1
srcHBSelect "tb_DandRiscvYsyx3rd.u_ysyx_210238.core_cpu.dCache_1" -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G3" 5 )} 
wvSelectSignal -win $_nWave2 {( "G3" 4 )} 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 0.000000 3742044.134727
wvZoom -win $_nWave2 201372.100165 1170565.877220
wvZoom -win $_nWave2 297803.691611 674899.992787
wvZoom -win $_nWave2 340141.255428 448759.005361
wvSelectSignal -win $_nWave2 {( "G3" 12 )} 
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvScrollDown -win $_nWave2 3
wvSelectSignal -win $_nWave2 {( "G3" 21 )} 
wvSetCursor -win $_nWave2 346953.518490 -snap {("G3" 21)}
srcSearchString "bypass_reg" -win $_nTrace1 -next -case
srcDeselectAll -win $_nTrace1
srcSelect -signal "bypass_reg" -line 13435 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvSetPosition -win $_nWave2 {("G3" 7)}
wvSetPosition -win $_nWave2 {("G3" 8)}
wvSetPosition -win $_nWave2 {("G3" 9)}
wvSetPosition -win $_nWave2 {("G3" 10)}
wvSetPosition -win $_nWave2 {("G3" 11)}
wvSetPosition -win $_nWave2 {("G3" 12)}
wvSetPosition -win $_nWave2 {("G3" 13)}
wvSetPosition -win $_nWave2 {("G3" 14)}
wvSetPosition -win $_nWave2 {("G3" 15)}
wvSetPosition -win $_nWave2 {("G3" 16)}
wvSetPosition -win $_nWave2 {("G3" 17)}
wvSetPosition -win $_nWave2 {("G3" 18)}
wvSetPosition -win $_nWave2 {("G3" 19)}
wvSetPosition -win $_nWave2 {("G3" 20)}
wvSetPosition -win $_nWave2 {("G3" 21)}
wvSetPosition -win $_nWave2 {("G3" 20)}
wvSetPosition -win $_nWave2 {("G3" 19)}
wvSetPosition -win $_nWave2 {("G3" 18)}
wvSetPosition -win $_nWave2 {("G3" 17)}
wvSetPosition -win $_nWave2 {("G3" 16)}
wvSetPosition -win $_nWave2 {("G3" 15)}
wvSetPosition -win $_nWave2 {("G3" 14)}
wvSetPosition -win $_nWave2 {("G3" 13)}
wvSetPosition -win $_nWave2 {("G3" 12)}
wvSetPosition -win $_nWave2 {("G3" 11)}
wvSetPosition -win $_nWave2 {("G3" 10)}
wvSetPosition -win $_nWave2 {("G3" 9)}
wvSetPosition -win $_nWave2 {("G3" 8)}
wvSetPosition -win $_nWave2 {("G3" 7)}
wvSetPosition -win $_nWave2 {("G3" 6)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G3" 6)}
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvSetCursor -win $_nWave2 349350.425864 -snap {("G3" 6)}
wvSelectSignal -win $_nWave2 {( "G3" 6 30 )} 
wvSetCursor -win $_nWave2 357550.372142 -snap {("G3" 30)}
srcDeselectAll -win $_nTrace1
debReload
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 596115.068932 791231.739349
wvZoom -win $_nWave2 625650.732165 674146.629342
wvSelectSignal -win $_nWave2 {( "G3" 6 )} 
wvSelectSignal -win $_nWave2 {( "G3" 4 )} 
wvSelectSignal -win $_nWave2 {( "G3" 5 )} 
wvSelectSignal -win $_nWave2 {( "G3" 8 )} 
wvSelectSignal -win $_nWave2 {( "G3" 8 9 )} 
wvSelectSignal -win $_nWave2 {( "G3" 7 8 9 )} 
wvZoom -win $_nWave2 638624.276474 664364.839784
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G3" 7 8 )} 
wvZoom -win $_nWave2 650209.024770 662645.812618
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G3" 7 8 23 )} 
wvSelectSignal -win $_nWave2 {( "G3" 7 8 23 24 )} 
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvSetCursor -win $_nWave2 642955.435574 -snap {("G3" 22)}
wvSetCursor -win $_nWave2 640856.155860 -snap {("G3" 22)}
wvSetCursor -win $_nWave2 643070.992255 -snap {("G3" 24)}
wvSelectSignal -win $_nWave2 {( "G3" 30 )} 
wvSelectSignal -win $_nWave2 {( "G3" 31 )} 
wvSetCursor -win $_nWave2 641029.490882 -snap {("G3" 31)}
srcActiveTrace \
           "tb_DandRiscvYsyx3rd.u_ysyx_210238.core_cpu.dCache_1.cpu_rsp_payload_data\[63:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 635000 -TraceValue \
           0000010010100111101101000010001100000000000000000010011110010111
srcDeselectAll -win $_nTrace1
srcSelect -signal "bypass_rsp_data_d1" -line 11881 -pos 1 -win $_nTrace1
srcAction -pos 11880 12 6 -win $_nTrace1 -name "bypass_rsp_data_d1" -ctrlKey off
wvSelectSignal -win $_nWave2 {( "G3" 23 )} 
wvSelectSignal -win $_nWave2 {( "G3" 22 )} 
wvSelectSignal -win $_nWave2 {( "G3" 23 )} 
wvSelectSignal -win $_nWave2 {( "G3" 22 )} 
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
debReload
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 348827.102591 1297932.646745
wvZoom -win $_nWave2 541367.290410 892642.900248
wvZoom -win $_nWave2 616300.647368 758687.625107
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 611918.237484 737712.694782
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 543891.792142 1209341.062185
wvZoom -win $_nWave2 609071.298654 902250.264705
wvZoom -win $_nWave2 621670.162468 751404.408769
wvZoom -win $_nWave2 637240.281072 703388.172043
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G3" 6 )} 
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 482677.293467 1593080.914260
wvZoom -win $_nWave2 977049.792077 1351913.112763
wvZoom -win $_nWave2 1052951.269708 1167021.176815
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvScrollUp -win $_nWave2 11
wvSelectSignal -win $_nWave2 {( "G1" 2 )} 
wvSelectSignal -win $_nWave2 {( "G1" 2 )} 
wvSetSearchMode -win $_nWave2 -value 401
wvSearchNext -win $_nWave2
wvZoom -win $_nWave2 3037726.380416 3899764.547951
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 3894591.651475 4214977.497713
wvZoom -win $_nWave2 3936764.004444 3974595.085784
wvZoomOut -win $_nWave2
wvSetMarker -win $_nWave2 3939000.000000
wvScrollDown -win $_nWave2 1
wvZoom -win $_nWave2 3935951.141488 3946965.068382
wvZoomOut -win $_nWave2
wvScrollDown -win $_nWave2 126
wvScrollUp -win $_nWave2 127
wvSelectSignal -win $_nWave2 {( "G1" 5 )} 
wvScrollDown -win $_nWave2 6
wvSelectSignal -win $_nWave2 {( "G3" 8 )} 
wvSelectSignal -win $_nWave2 {( "G3" 9 )} 
wvSelectSignal -win $_nWave2 {( "G3" 9 10 )} 
wvSelectSignal -win $_nWave2 {( "G3" 9 10 11 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G3" 6)}
wvSelectSignal -win $_nWave2 {( "G3" 7 )} 
wvSelectSignal -win $_nWave2 {( "G3" 7 8 )} 
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSelectSignal -win $_nWave2 {( "G1" 6 )} 
wvSetPosition -win $_nWave2 {("G1" 6)}
wvSetPosition -win $_nWave2 {("G1" 7)}
wvSetPosition -win $_nWave2 {("G1" 8)}
wvSetPosition -win $_nWave2 {("G1" 9)}
wvSetPosition -win $_nWave2 {("G1" 10)}
wvSetPosition -win $_nWave2 {("G1" 11)}
wvSetPosition -win $_nWave2 {("G1" 12)}
wvSetPosition -win $_nWave2 {("G1" 13)}
wvSetPosition -win $_nWave2 {("G1" 14)}
wvSetPosition -win $_nWave2 {("G1" 15)}
wvSetPosition -win $_nWave2 {("G1" 16)}
wvSetPosition -win $_nWave2 {("G1" 17)}
wvSetPosition -win $_nWave2 {("G1" 18)}
wvSetPosition -win $_nWave2 {("G1" 19)}
wvSetPosition -win $_nWave2 {("G1" 20)}
wvSetPosition -win $_nWave2 {("G1" 21)}
wvSetPosition -win $_nWave2 {("G1" 22)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSetPosition -win $_nWave2 {("G3" 1)}
wvSetPosition -win $_nWave2 {("G3" 2)}
wvSetPosition -win $_nWave2 {("G3" 3)}
wvSetPosition -win $_nWave2 {("G3" 4)}
wvSetPosition -win $_nWave2 {("G3" 5)}
wvSetPosition -win $_nWave2 {("G3" 6)}
wvSetPosition -win $_nWave2 {("G3" 7)}
wvSetPosition -win $_nWave2 {("G3" 8)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G3" 9)}
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 3932887.453344 3955998.364598
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G3" 6 )} 
wvSelectSignal -win $_nWave2 {( "G3" 3 )} 
wvZoom -win $_nWave2 3932551.929080 3961093.859742
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G3" 14 )} 
wvScrollDown -win $_nWave2 3
wvSelectSignal -win $_nWave2 {( "G3" 21 )} 
wvSelectSignal -win $_nWave2 {( "G3" 21 22 )} 
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G3" 21 22 23 )} 
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 3933109.949791 3972381.347999
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 3933339.527071 3965601.976547
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G3" 21 22 23 28 )} 
wvSelectSignal -win $_nWave2 {( "G3" 21 22 23 28 29 )} 
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G3" 7 21 22 23 28 29 )} 
wvSelectSignal -win $_nWave2 {( "G3" 7 8 21 22 23 28 29 )} 
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSetCursor -win $_nWave2 3947003.917208 -snap {("G3" 28)}
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvScrollUp -win $_nWave2 1
wvSetMarker -win $_nWave2 3947000.000000
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G3" 8 )} 
wvSelectSignal -win $_nWave2 {( "G3" 8 20 )} 
wvSetCursor -win $_nWave2 3944992.978623 -snap {("G3" 8)}
srcActiveTrace \
           "tb_DandRiscvYsyx3rd.u_ysyx_210238.core_cpu.writeback_arbitration_isFiring" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 3939000 -TraceValue 0
srcDeselectAll -win $_nTrace1
srcSelect -signal "writeback_arbitration_isValid" -line 3397 -pos 1 -win \
          $_nTrace1
srcSelect -signal "writeback_arbitration_isStuck" -line 3397 -pos 1 -win \
          $_nTrace1
srcSelect -signal "writeback_arbitration_removeIt" -line 3397 -pos 1 -win \
          $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
srcDeselectAll -win $_nTrace1
srcSelect -signal "writeback_arbitration_isValid" -line 3397 -pos 1 -win \
          $_nTrace1
srcAction -pos 3396 9 20 -win $_nTrace1 -name "writeback_arbitration_isValid" \
          -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "when_Pipeline_l163_3" -line 3624 -pos 1 -win $_nTrace1
srcSelect -signal "memaccess_arbitration_isValid" -line 3625 -pos 1 -win \
          $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G3" 16 )} 
wvSelectSignal -win $_nWave2 {( "G3" 25 )} 
wvSetPosition -win $_nWave2 {("G3" 25)}
wvSetPosition -win $_nWave2 {("G3" 24)}
wvSetPosition -win $_nWave2 {("G3" 23)}
wvSetPosition -win $_nWave2 {("G3" 22)}
wvSetPosition -win $_nWave2 {("G3" 21)}
wvSetPosition -win $_nWave2 {("G3" 20)}
wvSetPosition -win $_nWave2 {("G3" 19)}
wvSetPosition -win $_nWave2 {("G3" 18)}
wvSetPosition -win $_nWave2 {("G3" 17)}
wvSetPosition -win $_nWave2 {("G3" 16)}
wvSetPosition -win $_nWave2 {("G3" 15)}
wvSetPosition -win $_nWave2 {("G3" 14)}
wvSetPosition -win $_nWave2 {("G3" 13)}
wvSetPosition -win $_nWave2 {("G3" 12)}
wvSetPosition -win $_nWave2 {("G3" 11)}
wvSetPosition -win $_nWave2 {("G3" 10)}
wvSetPosition -win $_nWave2 {("G3" 9)}
wvSetPosition -win $_nWave2 {("G3" 8)}
wvSetPosition -win $_nWave2 {("G3" 7)}
wvSetPosition -win $_nWave2 {("G3" 6)}
wvSetPosition -win $_nWave2 {("G3" 5)}
wvSetPosition -win $_nWave2 {("G3" 4)}
wvSetPosition -win $_nWave2 {("G3" 3)}
wvSetPosition -win $_nWave2 {("G3" 4)}
wvSetPosition -win $_nWave2 {("G3" 5)}
wvSetPosition -win $_nWave2 {("G3" 6)}
wvSetPosition -win $_nWave2 {("G3" 7)}
wvSetPosition -win $_nWave2 {("G3" 8)}
wvSetPosition -win $_nWave2 {("G3" 9)}
wvSetPosition -win $_nWave2 {("G3" 8)}
wvSetPosition -win $_nWave2 {("G3" 7)}
wvSetPosition -win $_nWave2 {("G3" 6)}
wvSetPosition -win $_nWave2 {("G3" 5)}
wvSetPosition -win $_nWave2 {("G3" 4)}
wvSetPosition -win $_nWave2 {("G3" 3)}
wvSetPosition -win $_nWave2 {("G3" 2)}
wvSetPosition -win $_nWave2 {("G3" 1)}
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSetPosition -win $_nWave2 {("G3" 1)}
wvSetPosition -win $_nWave2 {("G3" 0)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSetPosition -win $_nWave2 {("G3" 1)}
wvSetMarker -win $_nWave2 3945000.000000
srcDeselectAll -win $_nTrace1
srcSelect -signal "when_Pipeline_l163_3" -line 3624 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "writeback_arbitration_isValid" -line 3625 -pos 1 -win \
          $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "writeback_arbitration_isValid" -line 3625 -pos 1 -win \
          $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "when_Pipeline_l163_3" -line 3624 -pos 1 -win $_nTrace1
srcSelect -signal "writeback_arbitration_isValid" -line 3625 -pos 1 -win \
          $_nTrace1
srcSelect -signal "memaccess_arbitration_isValid" -line 3625 -pos 1 -win \
          $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G3" 3 )} 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvSetCursor -win $_nWave2 3907653.221477 -snap {("G3" 3)}
srcActiveTrace \
           "tb_DandRiscvYsyx3rd.u_ysyx_210238.core_cpu.writeback_arbitration_isValid" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 3907000 -TraceValue 1
wvZoomIn -win $_nWave2
srcDeselectAll -win $_nTrace1
srcSelect -signal "when_Pipeline_l163_3" -line 3624 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "when_Pipeline_l163_3" -line 3624 -pos 1 -win $_nTrace1
srcAction -pos 3623 3 6 -win $_nTrace1 -name "when_Pipeline_l163_3" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "memaccess_arbitration_isStuck" -line 3404 -pos 1 -win \
          $_nTrace1
srcSelect -signal "memaccess_arbitration_removeIt" -line 3404 -pos 1 -win \
          $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvZoom -win $_nWave2 3938354.383231 3960137.469521
wvZoom -win $_nWave2 3943827.562868 3950582.596595
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G3" 3 )} 
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G3" 3 14 )} 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 3905131.915732 3932497.255618
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 3939727.934856 3953119.258748
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G3" 31 )} 
wvSelectSignal -win $_nWave2 {( "G3" 32 )} 
wvSelectSignal -win $_nWave2 {( "G3" 31 )} 
wvSelectSignal -win $_nWave2 {( "G3" 32 )} 
wvSelectSignal -win $_nWave2 {( "G3" 31 )} 
wvZoom -win $_nWave2 3937568.629241 3963988.368520
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvZoom -win $_nWave2 3937379.405401 3967655.219674
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvScrollDown -win $_nWave2 64
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvZoom -win $_nWave2 3937396.987175 3964777.669382
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvScrollUp -win $_nWave2 69
wvSelectSignal -win $_nWave2 {( "G3" 1 )} 
wvSetCursor -win $_nWave2 3937190.280514 -snap {("G3" 38)}
wvSetPosition -win $_nWave2 {("G3" 1)}
wvSetPosition -win $_nWave2 {("G3" 2)}
wvSetPosition -win $_nWave2 {("G3" 3)}
wvSetPosition -win $_nWave2 {("G3" 4)}
wvSetPosition -win $_nWave2 {("G3" 5)}
wvSetPosition -win $_nWave2 {("G3" 6)}
wvSetPosition -win $_nWave2 {("G3" 7)}
wvSetPosition -win $_nWave2 {("G3" 8)}
wvSetPosition -win $_nWave2 {("G3" 9)}
wvSetPosition -win $_nWave2 {("G3" 10)}
wvSetPosition -win $_nWave2 {("G3" 11)}
wvSetPosition -win $_nWave2 {("G3" 12)}
wvSetPosition -win $_nWave2 {("G3" 13)}
wvSetPosition -win $_nWave2 {("G3" 14)}
wvSetPosition -win $_nWave2 {("G3" 15)}
wvSetPosition -win $_nWave2 {("G3" 16)}
wvSetPosition -win $_nWave2 {("G3" 17)}
wvSetPosition -win $_nWave2 {("G3" 18)}
wvSetPosition -win $_nWave2 {("G3" 19)}
wvSetPosition -win $_nWave2 {("G3" 20)}
wvSetPosition -win $_nWave2 {("G3" 21)}
wvSetPosition -win $_nWave2 {("G3" 22)}
wvSetPosition -win $_nWave2 {("G3" 23)}
wvSetPosition -win $_nWave2 {("G3" 24)}
wvSetPosition -win $_nWave2 {("G3" 25)}
wvSetPosition -win $_nWave2 {("G3" 26)}
wvSetPosition -win $_nWave2 {("G3" 27)}
wvSetPosition -win $_nWave2 {("G3" 28)}
wvSetPosition -win $_nWave2 {("G3" 29)}
wvSetPosition -win $_nWave2 {("G3" 30)}
wvSetPosition -win $_nWave2 {("G3" 31)}
wvSetPosition -win $_nWave2 {("G3" 32)}
wvSetPosition -win $_nWave2 {("G3" 33)}
wvSetPosition -win $_nWave2 {("G3" 34)}
wvSetPosition -win $_nWave2 {("G3" 35)}
wvSetPosition -win $_nWave2 {("G3" 36)}
wvSetPosition -win $_nWave2 {("G3" 37)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G3" 37)}
wvSelectSignal -win $_nWave2 {( "G3" 30 37 )} 
wvSelectSignal -win $_nWave2 {( "G3" 30 31 37 )} 
srcDeselectAll -win $_nTrace1
debReload
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G3" 12 )} 
wvSelectSignal -win $_nWave2 {( "G3" 12 13 )} 
wvZoom -win $_nWave2 3935642.630649 3950377.105395
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoom -win $_nWave2 3937202.785059 3960613.657825
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G3" 12 13 14 )} 
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G3" 12 13 14 37 )} 
wvSelectSignal -win $_nWave2 {( "G3" 12 13 14 37 38 )} 
wvSelectSignal -win $_nWave2 {( "G3" 12 13 14 37 38 39 )} 
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 64
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvSetCursor -win $_nWave2 3947158.976980 -snap {("G3" 37)}
wvSetCursor -win $_nWave2 3939128.766654 -snap {("G3" 37)}
wvScrollUp -win $_nWave2 66
wvSelectSignal -win $_nWave2 {( "G3" 12 13 14 30 37 38 39 )} 
wvSelectSignal -win $_nWave2 {( "G3" 12 13 14 30 31 37 38 39 )} 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 3896739.044654 3968884.049385
wvSetCursor -win $_nWave2 3907268.919521 -snap {("G3" 33)}
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 3774500.324868 4084866.291795
wvZoom -win $_nWave2 3800814.744827 3984655.213042
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 3800850.331444 3957004.410911
wvZoom -win $_nWave2 3811429.876123 3881073.507384
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 3899205.656831 3976209.997087
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 3802540.316808 3947903.523577
srcDeselectAll -win $_nTrace1
debReload
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 3929810.503454 4000944.492365
wvSelectSignal -win $_nWave2 {( "G3" 38 )} 
wvSelectSignal -win $_nWave2 {( "G3" 38 39 )} 
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G3" 14 )} 
wvSelectSignal -win $_nWave2 {( "G3" 13 14 )} 
wvSelectSignal -win $_nWave2 {( "G3" 12 13 14 )} 
wvSetCursor -win $_nWave2 3946995.021100 -snap {("G3" 13)}
wvSetCursor -win $_nWave2 3945397.742216 -snap {("G3" 14)}
wvSetCursor -win $_nWave2 3945012.192141 -snap {("G3" 13)}
wvSetCursor -win $_nWave2 3947463.189049 -snap {("G3" 13)}
wvSetCursor -win $_nWave2 3945204.967179 -snap {("G3" 13)}
wvSetCursor -win $_nWave2 3947022.560391 -snap {("G3" 13)}
wvSelectSignal -win $_nWave2 {( "G3" 38 )} 
wvSelectSignal -win $_nWave2 {( "G3" 38 39 )} 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 3791219.020995 3986197.201981
wvZoom -win $_nWave2 3801786.944083 3912448.195854
wvSelectSignal -win $_nWave2 {( "G3" 37 38 39 )} 
wvSelectSignal -win $_nWave2 {( "G3" 38 39 )} 
wvSelectSignal -win $_nWave2 {( "G3" 37 38 39 )} 
wvSelectSignal -win $_nWave2 {( "G3" 38 39 )} 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 1207074.058714 2092706.810018
wvZoom -win $_nWave2 1298277.431476 1496456.188833
wvSelectSignal -win $_nWave2 {( "G3" 31 38 39 )} 
wvSelectSignal -win $_nWave2 {( "G3" 30 31 38 39 )} 
wvZoom -win $_nWave2 1310169.691403 1391881.025737
srcDeselectAll -win $_nTrace1
debReload
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G3" 37 )} 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 308865.777347 677341.821606
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 589447.547379 952360.074130
wvZoom -win $_nWave2 619655.132842 774767.571686
wvSelectSignal -win $_nWave2 {( "G3" 31 )} 
wvSetCursor -win $_nWave2 653163.743324 -snap {("G3" 38)}
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 2880539.475973 3393617.554749
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 3792181.691436 4063121.877053
wvZoom -win $_nWave2 3923403.593180 4006374.435930
wvSelectSignal -win $_nWave2 {( "G3" 37 )} 
wvSetCursor -win $_nWave2 3946916.816909 -snap {("G3" 37)}
wvSetCursor -win $_nWave2 3946981.060690 -snap {("G3" 37)}
srcActiveTrace "tb_DandRiscvYsyx3rd.u_ysyx_210238.core_cpu.dCache_1.stall" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 3945000 -TraceValue 0
srcDeselectAll -win $_nTrace1
srcSelect -signal "dcache_stall" -line 11886 -pos 1 -win $_nTrace1
srcAction -pos 11885 7 3 -win $_nTrace1 -name "dcache_stall" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "cpu_bypass_rsp_valid" -line 11885 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave2 {("G1" 19)}
wvSetPosition -win $_nWave2 {("G1" 20)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G3" 1)}
wvSetPosition -win $_nWave2 {("G3" 3)}
wvSetPosition -win $_nWave2 {("G3" 10)}
wvSetPosition -win $_nWave2 {("G3" 14)}
wvSetPosition -win $_nWave2 {("G3" 18)}
wvSetPosition -win $_nWave2 {("G3" 19)}
wvSetPosition -win $_nWave2 {("G3" 6)}
wvSetPosition -win $_nWave2 {("G3" 34)}
wvSetPosition -win $_nWave2 {("G3" 35)}
wvSetPosition -win $_nWave2 {("G3" 36)}
wvSetPosition -win $_nWave2 {("G3" 37)}
wvAddSignal -win $_nWave2 \
           "/tb_DandRiscvYsyx3rd/u_ysyx_210238/core_cpu/dCache_1/cpu_bypass_rsp_valid"
wvSetPosition -win $_nWave2 {("G3" 37)}
wvSetPosition -win $_nWave2 {("G3" 38)}
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
srcDeselectAll -win $_nTrace1
srcSelect -signal "bypass_stall" -line 11885 -pos 1 -win $_nTrace1
srcAction -pos 11884 20 4 -win $_nTrace1 -name "bypass_stall" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "bypass" -line 11884 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G3" 39 )} 
wvSelectAll -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 \
           18 19 20 21 )} {( "G3" 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 \
           19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 39 40 41 \
           42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 \
           64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81 )} {( "G4" 1 \
           2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 \
           27 28 29 30 31 32 33 34 35 36 )} 
wvSelectSignal -win $_nWave2 {( "G1" 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 \
           18 19 20 21 )} {( "G3" 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 \
           19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 40 41 42 \
           43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 \
           65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81 )} {( "G4" 1 2 \
           3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 \
           28 29 30 31 32 33 34 35 36 )} 
wvSelectSignal -win $_nWave2 {( "G1" 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 \
           18 19 20 21 )} {( "G3" 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 \
           19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 41 42 43 \
           44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 \
           66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81 )} {( "G4" 1 2 3 4 \
           5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 \
           29 30 31 32 33 34 35 36 )} 
wvSelectSignal -win $_nWave2 {( "G1" 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 \
           18 19 20 21 )} {( "G3" 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 \
           19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 42 43 44 \
           45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 \
           67 68 69 70 71 72 73 74 75 76 77 78 79 80 81 )} {( "G4" 1 2 3 4 5 \
           6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 \
           30 31 32 33 34 35 36 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G3" 2)}
wvSelectGroup -win $_nWave2 {G5}
wvSelectSignal -win $_nWave2 {( "G3" 1 )} 
wvSelectSignal -win $_nWave2 {( "G3" 1 2 )} 
wvSelectSignal -win $_nWave2 {( "G3" 1 2 3 )} 
wvSelectSignal -win $_nWave2 {( "G3" 1 2 3 4 )} 
wvSetPosition -win $_nWave2 {("G3" 1)}
wvSetPosition -win $_nWave2 {("G3" 2)}
wvSetPosition -win $_nWave2 {("G3" 3)}
wvSetPosition -win $_nWave2 {("G3" 4)}
wvSetPosition -win $_nWave2 {("G4" 0)}
wvSetPosition -win $_nWave2 {("G5" 0)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G5" 4)}
wvSetPosition -win $_nWave2 {("G5" 4)}
wvSelectSignal -win $_nWave2 {( "G5" 1 )} 
srcHBSelect "tb_DandRiscvYsyx3rd.u_ysyx_210238.core_cpu.dCache_1" -win $_nTrace1
srcSetScope -win $_nTrace1 "tb_DandRiscvYsyx3rd.u_ysyx_210238.core_cpu.dCache_1" \
           -delim "."
srcHBSelect "tb_DandRiscvYsyx3rd.u_ysyx_210238.core_cpu.dCache_1" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "stall" -line 5493 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvSetPosition -win $_nWave2 {("G6" 0)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G6" 1)}
wvSetPosition -win $_nWave2 {("G6" 1)}
wvSelectSignal -win $_nWave2 {( "G5" 3 )} 
wvSetPosition -win $_nWave2 {("G5" 3)}
wvSetPosition -win $_nWave2 {("G5" 4)}
wvSetPosition -win $_nWave2 {("G6" 0)}
wvSetPosition -win $_nWave2 {("G6" 1)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G6" 2)}
wvSelectSignal -win $_nWave2 {( "G5" 3 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G7" 0)}
wvSetPosition -win $_nWave2 {("G6" 2)}
wvSelectSignal -win $_nWave2 {( "G5" 2 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G7" 0)}
wvSetPosition -win $_nWave2 {("G6" 2)}
wvSelectSignal -win $_nWave2 {( "G5" 1 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G7" 0)}
wvSetPosition -win $_nWave2 {("G6" 2)}
wvSetCursor -win $_nWave2 3948330.180084 -snap {("G6" 1)}
wvSelectSignal -win $_nWave2 {( "G6" 1 )} 
wvSelectSignal -win $_nWave2 {( "G6" 2 )} 
wvSelectSignal -win $_nWave2 {( "G6" 1 )} 
wvSetCursor -win $_nWave2 3947334.401484 -snap {("G6" 1)}
srcActiveTrace "tb_DandRiscvYsyx3rd.u_ysyx_210238.core_cpu.dCache_1.stall" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 3947000 -TraceValue 1
srcDeselectAll -win $_nTrace1
srcSelect -signal "is_miss" -line 11885 -pos 1 -win $_nTrace1
srcSelect -signal "is_write" -line 11885 -pos 1 -win $_nTrace1
srcSelect -signal "bypass_stall" -line 11885 -pos 1 -win $_nTrace1
srcSelect -signal "next_level_wdone" -line 11885 -pos 1 -win $_nTrace1
srcSelect -signal "cpu_bypass_rsp_valid" -line 11885 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 1889557.923421 2496019.213054
wvZoom -win $_nWave2 1957646.879671 2076919.947860
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 3815260.544363 4125564.461604
wvZoom -win $_nWave2 3916652.919954 4011558.105637
srcHBSelect "tb_DandRiscvYsyx3rd.u_ysyx_210238.core_cpu.dCache_1" -win $_nTrace1
srcSetScope -win $_nTrace1 "tb_DandRiscvYsyx3rd.u_ysyx_210238.core_cpu.dCache_1" \
           -delim "."
srcHBSelect "tb_DandRiscvYsyx3rd.u_ysyx_210238.core_cpu.dCache_1" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {5495 5499 3 1 14 1}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSetPosition -win $_nWave2 {("G4" 0)}
wvSetPosition -win $_nWave2 {("G5" 0)}
wvAddSignal -win $_nWave2 \
           "/tb_DandRiscvYsyx3rd/u_ysyx_210238/core_cpu/dCache_1/cpu_cmd_valid" \
           "/tb_DandRiscvYsyx3rd/u_ysyx_210238/core_cpu/dCache_1/cpu_cmd_ready" \
           "/tb_DandRiscvYsyx3rd/u_ysyx_210238/core_cpu/dCache_1/cpu_cmd_payload_addr\[63:0\]" \
           "/tb_DandRiscvYsyx3rd/u_ysyx_210238/core_cpu/dCache_1/cpu_cmd_payload_wen"
wvSetPosition -win $_nWave2 {("G5" 0)}
wvSetPosition -win $_nWave2 {("G5" 4)}
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 2780123.823495 4543750.967438
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 234877.172867 906735.132465
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 601368.796976 855233.825458
wvZoom -win $_nWave2 622008.230186 728547.018755
wvSelectSignal -win $_nWave2 {( "G6" 2 )} 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 3642859.390792 4228884.597136
wvZoom -win $_nWave2 3901500.016123 4043071.726831
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 1164582.156069 2574708.742635
wvZoom -win $_nWave2 1276496.964527 1588220.650523
wvZoom -win $_nWave2 1302926.498879 1407679.173848
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 1282175.985993 1884331.509779
wvZoom -win $_nWave2 1300825.789285 1398504.134026
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 2834071.184004 3397981.163400
wvZoom -win $_nWave2 2919869.334178 3092993.845855
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 3735122.914426 4114750.182772
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 225748.154928 1900046.970645
wvZoom -win $_nWave2 591980.764638 907653.828228
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvSetCursor -win $_nWave2 642209.811922 -snap {("G6" 1)}
wvZoom -win $_nWave2 624366.890016 734479.716301
wvSelectGroup -win $_nWave2 {G4}
wvSelectAll -win $_nWave2
wvSelectGroup -win $_nWave2 {G4}
wvSelectGroup -win $_nWave2 {G2}
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G5" 4)}
wvSelectGroup -win $_nWave2 {G3}
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G6" 0)}
wvSetPosition -win $_nWave2 {("G5" 4)}
wvSelectGroup -win $_nWave2 {G1}
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G6" 0)}
wvSetPosition -win $_nWave2 {("G5" 4)}
wvSelectGroup -win $_nWave2 {G4}
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G6" 0)}
wvSetPosition -win $_nWave2 {("G5" 4)}
wvSelectSignal -win $_nWave2 {( "G6" 3 )} 
wvSelectAll -win $_nWave2
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G5" 0)}
wvSelectGroup -win $_nWave2 {G7}
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G5" 0)}
wvSelectGroup -win $_nWave2 {G6}
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G5" 0)}
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 0)}
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 0)}
srcSearchString "memaccess_PC" -win $_nTrace1 -next -case
srcHBSelect "tb_DandRiscvYsyx3rd.u_ysyx_210238" -win $_nTrace1
srcSetScope -win $_nTrace1 "tb_DandRiscvYsyx3rd.u_ysyx_210238" -delim "."
srcHBSelect "tb_DandRiscvYsyx3rd.u_ysyx_210238" -win $_nTrace1
srcHBSelect "tb_DandRiscvYsyx3rd.u_ysyx_210238.core_cpu" -win $_nTrace1
srcSetScope -win $_nTrace1 "tb_DandRiscvYsyx3rd.u_ysyx_210238.core_cpu" -delim \
           "."
srcHBSelect "tb_DandRiscvYsyx3rd.u_ysyx_210238.core_cpu" -win $_nTrace1
srcSearchString "memaccess_arb" -win $_nTrace1 -next -case
srcSearchString "memaccess_arb" -win $_nTrace1 -prev -case
srcSelect -win $_nTrace1 -range {3625 3625 6 6 1 14}
srcSearchString "memaccess_arb" -win $_nTrace1 -prev -case
srcSelect -win $_nTrace1 -range {3621 3621 2 2 1 14}
srcDeselectAll -win $_nTrace1
srcSelect -signal "memaccess_arbitration_isValid" -line 3625 -pos 1 -win \
          $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "memaccess_arbitration_isValid" -line 3625 -pos 1 -win \
          $_nTrace1
srcSearchString "memaccess_arbitration_isF" -win $_nTrace1 -next -case
srcDeselectAll -win $_nTrace1
srcSelect -signal "memaccess_arbitration_isFiring" -line 686 -pos 1 -win \
          $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
srcSearchString "memaccess_PC" -win $_nTrace1 -next -case
srcSearchString "memaccess_PC" -win $_nTrace1 -prev -case
srcSelect -win $_nTrace1 -range {637 637 10 11 16 1}
srcSearchString "memaccess_PC" -win $_nTrace1 -prev -case
srcSelect -win $_nTrace1 -range {582 582 10 11 1 1}
srcDeselectAll -win $_nTrace1
srcSelect -signal "memaccess_PC" -line 582 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoom -win $_nWave2 628501.982602 684219.157962
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
srcHBSelect "tb_DandRiscvYsyx3rd.u_ysyx_210238.core_cpu.dCache_1" -win $_nTrace1
srcSetScope -win $_nTrace1 "tb_DandRiscvYsyx3rd.u_ysyx_210238.core_cpu.dCache_1" \
           -delim "."
srcHBSelect "tb_DandRiscvYsyx3rd.u_ysyx_210238.core_cpu.dCache_1" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {5493 5504 3 1 14 1}
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoom -win $_nWave2 621998.409868 695813.421127
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 3866386.280796 4473595.479104
wvZoom -win $_nWave2 3926331.439745 4015426.401479
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 3902341.681369 4009476.389517
srcDeselectAll -win $_nTrace1
srcSearchString "writeback_arbitration_isFir" -win $_nTrace1 -next -case
srcHBSelect "tb_DandRiscvYsyx3rd.u_ysyx_210238" -win $_nTrace1
srcSetScope -win $_nTrace1 "tb_DandRiscvYsyx3rd.u_ysyx_210238" -delim "."
srcHBSelect "tb_DandRiscvYsyx3rd.u_ysyx_210238" -win $_nTrace1
srcHBSelect "tb_DandRiscvYsyx3rd.u_ysyx_210238.core_cpu" -win $_nTrace1
srcSetScope -win $_nTrace1 "tb_DandRiscvYsyx3rd.u_ysyx_210238.core_cpu" -delim \
           "."
srcHBSelect "tb_DandRiscvYsyx3rd.u_ysyx_210238.core_cpu" -win $_nTrace1
srcSearchString "writeback_arbitration_isFir" -win $_nTrace1 -next -case
srcDeselectAll -win $_nTrace1
srcSelect -signal "writeback_arbitration_isFiring" -line 697 -pos 1 -win \
          $_nTrace1
wvSetPosition -win $_nWave2 {("G1" 0)}
wvSetPosition -win $_nWave2 {("G1" 1)}
wvSetPosition -win $_nWave2 {("G1" 6)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvAddSignal -win $_nWave2 \
           "/tb_DandRiscvYsyx3rd/u_ysyx_210238/core_cpu/writeback_arbitration_isFiring"
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G2" 1)}
wvSetPosition -win $_nWave2 {("G2" 1)}
srcSearchString "writeback_arbitration_isV" -win $_nTrace1 -next -case
srcDeselectAll -win $_nTrace1
srcSelect -signal "writeback_arbitration_isValid" -line 2834 -pos 1 -win \
          $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvSetPosition -win $_nWave2 {("G2" 1)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G2" 1)}
wvSelectSignal -win $_nWave2 {( "G2" 2 )} 
srcSearchString "writeback_PC" -win $_nTrace1 -prev -case
srcSelect -win $_nTrace1 -range {1617 1617 8 9 14 1}
srcSearchString "writeback_PC" -win $_nTrace1 -prev -case
srcSelect -win $_nTrace1 -range {1617 1617 4 5 1 1}
srcDeselectAll -win $_nTrace1
srcSelect -signal "writeback_PC" -line 1617 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvSetPosition -win $_nWave2 {("G2" 3)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G2" 3)}
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
srcSearchString "writeback_RD" -win $_nTrace1 -next -case
srcDeselectAll -win $_nTrace1
srcSelect -signal "writeback_RD" -line 1664 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
srcSearchString "writeback_RDADD" -win $_nTrace1 -next -case
srcSearchString "writeback_RD_ADDR" -win $_nTrace1 -next -case
srcDeselectAll -win $_nTrace1
srcSelect -signal "writeback_RD_ADDR" -line 1665 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
srcSearchString "writeback_RD_WEN" -win $_nTrace1 -next -case
srcDeselectAll -win $_nTrace1
srcSelect -signal "writeback_RD_WEN" -line 1666 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 4 )} 
wvSelectSignal -win $_nWave2 {( "G2" 5 )} 
wvSelectSignal -win $_nWave2 {( "G2" 6 )} 
wvSelectSignal -win $_nWave2 {( "G2" 5 )} 
wvZoom -win $_nWave2 3919948.604949 4013105.614046
wvSelectGroup -win $_nWave2 {G1}
wvRenameGroup -win $_nWave2 {G1} {LSU}
wvSelectGroup -win $_nWave2 {G2}
wvSelectGroup -win $_nWave2 {G2}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSelectGroup -win $_nWave2 {G2}
wvSelectGroup -win $_nWave2 {G2}
wvRenameGroup -win $_nWave2 {G2} {WB}
wvSaveSignal -win $_nWave2 \
           "/home/lin/SpinalProjects/DandRiscvSoC/simWorkspace/tb_DandRiscvYsyx3rd/signal_ysyx.rc"
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvSelectSignal -win $_nWave2 {( "LSU" 13 )} 
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 3901140.482515 4016333.470149
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvSelectSignal -win $_nWave2 {( "LSU" 2 )} 
wvZoom -win $_nWave2 3931689.145514 3971335.512532
wvSelectSignal -win $_nWave2 {( "WB" 1 )} 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvSelectSignal -win $_nWave2 {( "WB" 1 4 )} 
wvZoom -win $_nWave2 3936086.622924 3968902.702167
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvSelectSignal -win $_nWave2 {( "WB" 3 )} 
wvSelectSignal -win $_nWave2 {( "WB" 4 )} 
wvSelectSignal -win $_nWave2 {( "WB" 3 )} 
wvSelectSignal -win $_nWave2 {( "LSU" 4 )} 
wvSelectSignal -win $_nWave2 {( "WB" 1 )} 
wvSelectSignal -win $_nWave2 {( "WB" 2 )} 
wvSetCursor -win $_nWave2 3944929.050780 -snap {("WB" 2)}
srcActiveTrace \
           "tb_DandRiscvYsyx3rd.u_ysyx_210238.core_cpu.writeback_arbitration_isFiring" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 3939000 -TraceValue 0
wvSelectSignal -win $_nWave2 {( "WB" 4 )} 
wvSetCursor -win $_nWave2 3939084.917427 -snap {("WB" 4)}
srcActiveTrace "tb_DandRiscvYsyx3rd.u_ysyx_210238.core_cpu.writeback_RD\[63:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 3939000 -TraceValue \
           0000000000000000000000000000000000000000000000000000000000000000
wvSelectSignal -win $_nWave2 {( "LSU" 13 )} 
wvSelectSignal -win $_nWave2 {( "LSU" 14 )} 
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 3930884.073775 3970674.999129
wvSelectSignal -win $_nWave2 {( "LSU" 6 )} 
wvSelectSignal -win $_nWave2 {( "LSU" 7 )} 
wvSelectSignal -win $_nWave2 {( "LSU" 13 )} 
wvSelectSignal -win $_nWave2 {( "LSU" 14 )} 
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "WB" 4 )} 
wvSetCursor -win $_nWave2 3938971.660229 -snap {("WB" 4)}
srcActiveTrace "tb_DandRiscvYsyx3rd.u_ysyx_210238.core_cpu.writeback_RD\[63:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 3937000 -TraceValue \
           0000000000000000000000000000000010000000000000001101001000111000
srcDeselectAll -win $_nTrace1
srcSelect -signal "writeback_LSU_RDATA" -line 1559 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvSetPosition -win $_nWave2 {("WB" 2)}
wvSetPosition -win $_nWave2 {("WB" 3)}
wvSetPosition -win $_nWave2 {("WB" 4)}
wvSetPosition -win $_nWave2 {("WB" 5)}
wvSetPosition -win $_nWave2 {("WB" 6)}
wvSetPosition -win $_nWave2 {("WB" 7)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("WB" 7)}
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 3842020.754803 4019115.790755
wvSetCursor -win $_nWave2 3863754.833935 -snap {("WB" 7)}
srcActiveTrace \
           "tb_DandRiscvYsyx3rd.u_ysyx_210238.core_cpu.writeback_LSU_RDATA\[63:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 3863000 -TraceValue \
           0000000000000000000000000000000000000000000000000000000000000000
srcDeselectAll -win $_nTrace1
srcSelect -signal "memaccess_to_writeback_LSU_RDATA" -line 1619 -pos 1 -win \
          $_nTrace1
srcAction -pos 1618 7 14 -win $_nTrace1 -name "memaccess_to_writeback_LSU_RDATA" \
          -ctrlKey off
wvZoom -win $_nWave2 3936293.180058 3964540.626753
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 3934614.518397 3961516.848583
srcDeselectAll -win $_nTrace1
srcSelect -signal "when_Pipeline_l127_40" -line 3755 -pos 1 -win $_nTrace1
srcSelect -signal "_zz_execute_MEM_WDATA" -line 3756 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "_zz_execute_MEM_WDATA" -line 3756 -pos 1 -win $_nTrace1
srcAction -pos 3755 5 8 -win $_nTrace1 -name "_zz_execute_MEM_WDATA" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "memaccess_LSU_RDATA" -line 1644 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave2 {("LSU" 8)}
wvSetPosition -win $_nWave2 {("LSU" 9)}
wvSetPosition -win $_nWave2 {("LSU" 10)}
wvSetPosition -win $_nWave2 {("LSU" 11)}
wvSetPosition -win $_nWave2 {("LSU" 12)}
wvSetPosition -win $_nWave2 {("LSU" 13)}
wvSetPosition -win $_nWave2 {("LSU" 14)}
wvAddSignal -win $_nWave2 \
           "/tb_DandRiscvYsyx3rd/u_ysyx_210238/core_cpu/memaccess_LSU_RDATA\[63:0\]"
wvSetPosition -win $_nWave2 {("LSU" 14)}
wvSetPosition -win $_nWave2 {("LSU" 15)}
srcDeselectAll -win $_nTrace1
srcBackwardHistory -win $_nTrace1
srcHBSelect "tb_DandRiscvYsyx3rd.u_ysyx_210238.core_cpu" -win $_nTrace1
srcHBSelect "tb_DandRiscvYsyx3rd.u_ysyx_210238.core_cpu" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "when_Pipeline_l127_40" -line 3755 -pos 1 -win $_nTrace1
srcAction -pos 3754 3 9 -win $_nTrace1 -name "when_Pipeline_l127_40" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "writeback_arbitration_isStuck" -line 3372 -pos 1 -win \
          $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvSetPosition -win $_nWave2 {("WB" 0)}
wvSetPosition -win $_nWave2 {("WB" 1)}
wvSetPosition -win $_nWave2 {("WB" 2)}
wvSetPosition -win $_nWave2 {("WB" 3)}
wvSetPosition -win $_nWave2 {("WB" 4)}
wvSetPosition -win $_nWave2 {("WB" 5)}
wvSetPosition -win $_nWave2 {("WB" 6)}
wvSetPosition -win $_nWave2 {("WB" 7)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("WB" 8)}
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvSelectSignal -win $_nWave2 {( "WB" 3 )} 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 3926256.361226 3978332.106842
wvSelectSignal -win $_nWave2 {( "WB" 4 )} 
wvZoom -win $_nWave2 3935107.020275 3959844.511514
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvSelectSignal -win $_nWave2 {( "WB" 6 )} 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvSetCursor -win $_nWave2 3939129.376573 -snap {("WB" 6)}
wvSelectSignal -win $_nWave2 {( "LSU" 4 )} {( "WB" 6 )} 
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 3934479.724233 3961506.127747
wvSetCursor -win $_nWave2 3938999.819593 -snap {("WB" 6)}
srcActiveTrace "tb_DandRiscvYsyx3rd.u_ysyx_210238.core_cpu.writeback_RD_WEN" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 3917000 -TraceValue 0
srcDeselectAll -win $_nTrace1
srcSelect -signal "memaccess_to_writeback_RD_WEN" -line 1588 -pos 1 -win \
          $_nTrace1
srcAction -pos 1587 7 9 -win $_nTrace1 -name "memaccess_to_writeback_RD_WEN" \
          -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "_zz_DecodePlugin_hazard_rs1_from_mem_3" -line 3708 -pos 1 -win \
          $_nTrace1
srcAction -pos 3707 5 8 -win $_nTrace1 -name \
          "_zz_DecodePlugin_hazard_rs1_from_mem_3" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "memaccess_RD_WEN" -line 1635 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave2 {("LSU" 8)}
wvSetPosition -win $_nWave2 {("LSU" 9)}
wvSetPosition -win $_nWave2 {("LSU" 10)}
wvSetPosition -win $_nWave2 {("LSU" 11)}
wvSetPosition -win $_nWave2 {("LSU" 12)}
wvSetPosition -win $_nWave2 {("LSU" 13)}
wvSetPosition -win $_nWave2 {("LSU" 14)}
wvSetPosition -win $_nWave2 {("LSU" 15)}
wvAddSignal -win $_nWave2 \
           "/tb_DandRiscvYsyx3rd/u_ysyx_210238/core_cpu/memaccess_RD_WEN"
wvSetPosition -win $_nWave2 {("LSU" 15)}
wvSetPosition -win $_nWave2 {("LSU" 16)}
wvSelectSignal -win $_nWave2 {( "LSU" 16 )} 
wvSetMarker -win $_nWave2 3939000.000000
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvSelectSignal -win $_nWave2 {( "LSU" 2 )} 
wvSelectSignal -win $_nWave2 {( "WB" 2 )} 
wvSelectSignal -win $_nWave2 {( "WB" 1 )} 
wvSelectSignal -win $_nWave2 {( "WB" 2 )} 
wvSelectSignal -win $_nWave2 {( "WB" 1 )} 
wvSelectSignal -win $_nWave2 {( "WB" 2 )} 
wvSelectSignal -win $_nWave2 {( "WB" 6 )} 
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvSetCursor -win $_nWave2 3937095.520159 -snap {("LSU" 8)}
wvSelectSignal -win $_nWave2 {( "LSU" 8 )} 
wvSelectSignal -win $_nWave2 {( "LSU" 4 )} 
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvSelectSignal -win $_nWave2 {( "LSU" 6 )} 
wvSelectSignal -win $_nWave2 {( "LSU" 7 )} 
wvSelectSignal -win $_nWave2 {( "LSU" 7 )} 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "LSU" 13 )} 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 3829549.686430 3891826.555852
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 3799014.008875 3908378.267372
wvZoom -win $_nWave2 3810869.213047 3865106.772139
wvSelectSignal -win $_nWave2 {( "LSU" 3 )} 
wvSelectSignal -win $_nWave2 {( "LSU" 2 )} 
wvSelectSignal -win $_nWave2 {( "LSU" 3 )} 
wvSelectSignal -win $_nWave2 {( "LSU" 2 )} 
wvSelectSignal -win $_nWave2 {( "LSU" 3 )} 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 3676808.161548 3973466.401908
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 3889108.880598 3981218.794949
wvZoom -win $_nWave2 3929333.419268 3962176.327173
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvSelectSignal -win $_nWave2 {( "LSU" 1 )} 
wvSelectSignal -win $_nWave2 {( "LSU" 4 )} 
srcDeselectAll -win $_nTrace1
debReload
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 3247406.116918 7226016.260163
wvZoom -win $_nWave2 3786513.182398 4519698.791451
wvZoom -win $_nWave2 3844134.815630 4010755.006305
wvSetSearchMode -win $_nWave2 -value 401
wvSelectSignal -win $_nWave2 {( "LSU" 8 )} 
wvSetSearchMode -win $_nWave2 -value 8000cdf8
wvSearchPrev -win $_nWave2
wvSearchNext -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 13905883.510058 14003675.306056
wvSetSearchMode -win $_nWave2 -value 8000cfd8
wvSearchPrev -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSearchPrev -win $_nWave2
wvSearchPrev -win $_nWave2
wvSearchPrev -win $_nWave2
wvSearchPrev -win $_nWave2
wvSearchPrev -win $_nWave2
wvZoom -win $_nWave2 1100736.989458 1129661.856722
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvSelectSignal -win $_nWave2 {( "WB" 3 )} 
wvSelectSignal -win $_nWave2 {( "WB" 3 )} 
wvSetSearchMode -win $_nWave2 -value 80003ac0
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchPrev -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 4136489.530122 4294876.414590
wvZoom -win $_nWave2 4172238.486237 4243429.803646
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvSetCursor -win $_nWave2 4193047.407894 -snap {("WB" 2)}
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 4159684.229527 4240053.521655
wvSelectSignal -win $_nWave2 {( "LSU" 3 )} 
wvSelectSignal -win $_nWave2 {( "LSU" 2 )} 
wvSelectSignal -win $_nWave2 {( "LSU" 3 )} 
wvSelectSignal -win $_nWave2 {( "LSU" 7 )} 
wvSelectSignal -win $_nWave2 {( "LSU" 6 )} 
wvSelectSignal -win $_nWave2 {( "LSU" 7 )} 
srcDeselectAll -win $_nTrace1
debReload
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 3885983.695960 4068689.264437
wvZoom -win $_nWave2 3920077.417990 3982889.088453
wvZoom -win $_nWave2 3929342.321762 3960103.747677
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "WB" 3 )} 
wvSearchPrev -win $_nWave2
wvSearchPrev -win $_nWave2
wvSearchNext -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 4556254.074830 5230028.148590
wvZoom -win $_nWave2 4605293.767383 4684070.294784
wvZoom -win $_nWave2 4613772.232197 4641068.009210
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvSelectSignal -win $_nWave2 {( "LSU" 13 )} 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvSetCursor -win $_nWave2 4615267.529312 -snap {("LSU" 13)}
srcActiveTrace \
           "tb_DandRiscvYsyx3rd.u_ysyx_210238.core_cpu.dCache_1.cpu_rsp_valid" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 4615000 -TraceValue 1
srcDeselectAll -win $_nTrace1
srcSelect -signal "bypass_reg" -line 11886 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvSelectSignal -win $_nWave2 {( "LSU" 17 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("WB" 0)}
wvSetPosition -win $_nWave2 {("LSU" 16)}
srcDeselectAll -win $_nTrace1
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
debExit
