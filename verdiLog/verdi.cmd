debImport "./simWorkspace/tb_DandRiscvSmallest/tb_DandRiscvSmallest.fsdb" "-f" \
          "./hw/verilog/tb/tb_DandRiscvSmallest.f" "-sv" "-v2k"
wvCreateWindow
wvSetPosition -win $_nWave2 {("G1" 0)}
wvOpenFile -win $_nWave2 \
           {/home/lin/SpinalProjects/DandRiscvSoC/simWorkspace/tb_DandRiscvSmallest/tb_DandRiscvSmallest.fsdb}
wvRestoreSignal -win $_nWave2 \
           "/home/lin/SpinalProjects/DandRiscvSoC/simWorkspace/tb_DandRiscvSimple/DandRiscvSimple_debug_total.rc" \
           -overWriteAutoAlias on -appendSignals on
wvScrollDown -win $_nWave2 2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 41.301771 175.728829
wvSelectSignal -win $_nWave2 {( "G4" 3 )} 
wvZoom -win $_nWave2 48.387311 103.436504
wvSetCursor -win $_nWave2 55.184760 -snap {("G4" 1)}
wvSelectSignal -win $_nWave2 {( "G4" 2 )} 
wvSelectSignal -win $_nWave2 {( "G4" 4 )} 
wvSelectSignal -win $_nWave2 {( "G4" 3 )} 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 55.515884 101.697957
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 53.362536 -snap {("G4" 3)}
wvSelectSignal -win $_nWave2 {( "G4" 1 3 )} 
wvSelectSignal -win $_nWave2 {( "G4" 5 )} 
wvZoom -win $_nWave2 50.298484 68.580661
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 49.540377 60.430166
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 51.027538 -snap {("G4" 5)}
srcActiveTrace "tb_DandRiscvSmallest.u_DandRiscvSimple.pc_next\[63:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 0 -TraceValue \
           0000000000000000000000000000000010000000000000000000000000000000
wvSetCursor -win $_nWave2 52.922112 -snap {("G4" 3)}
srcActiveTrace "tb_DandRiscvSmallest.u_DandRiscvSimple.fetch_PC\[63:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 0 -TraceValue \
           xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
srcDeselectAll -win $_nTrace1
srcSelect -signal "fetch_FetchPlugin_pc_out_stream_payload" -line 999 -pos 1 -win \
          $_nTrace1
srcAction -pos 998 7 7 -win $_nTrace1 -name \
          "fetch_FetchPlugin_pc_out_stream_payload" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "fetch_FetchPlugin_pc_stream_fifo_ports_m_ports_payload" -line \
          1157 -pos 1 -win $_nTrace1
srcAction -pos 1156 7 7 -win $_nTrace1 -name \
          "fetch_FetchPlugin_pc_stream_fifo_ports_m_ports_payload" -ctrlKey \
          off
srcDeselectAll -win $_nTrace1
srcSelect -signal "_zz_ports_m_ports_payload" -line 8287 -pos 1 -win $_nTrace1
srcAction -pos 8286 7 8 -win $_nTrace1 -name "_zz_ports_m_ports_payload" -ctrlKey \
          off
srcDeselectAll -win $_nTrace1
srcSelect -signal "fifo_ram_0" -line 8261 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "fifo_ram_0" -line 8261 -pos 1 -win $_nTrace1
srcAction -pos 8260 9 0 -win $_nTrace1 -name "fifo_ram_0" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "ports_s_ports_payload" -line 8334 -pos 1 -win $_nTrace1
srcAction -pos 8333 5 7 -win $_nTrace1 -name "ports_s_ports_payload" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "pc_next" -line 1153 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave2 {("G2" 1)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G2" 2)}
wvSetPosition -win $_nWave2 {("G2" 7)}
wvSetPosition -win $_nWave2 {("G2" 6)}
wvSetPosition -win $_nWave2 {("G2" 3)}
wvSetPosition -win $_nWave2 {("G2" 1)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "fetch_FetchPlugin_pc_in_stream_valid" -line 1152 -pos 1 -win \
          $_nTrace1
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G4" 3)}
wvSetPosition -win $_nWave2 {("G4" 4)}
wvSetPosition -win $_nWave2 {("G4" 5)}
wvAddSignal -win $_nWave2 \
           "/tb_DandRiscvSmallest/u_DandRiscvSimple/fetch_FetchPlugin_pc_in_stream_valid"
wvSetPosition -win $_nWave2 {("G4" 5)}
wvSetPosition -win $_nWave2 {("G4" 6)}
wvSetPosition -win $_nWave2 {("G4" 5)}
wvSetPosition -win $_nWave2 {("G4" 6)}
wvSetPosition -win $_nWave2 {("G4" 6)}
wvSetPosition -win $_nWave2 {("G4" 6)}
wvSetPosition -win $_nWave2 {("G4" 6)}
wvSetCursor -win $_nWave2 51.043593 -snap {("G4" 6)}
srcActiveTrace \
           "tb_DandRiscvSmallest.u_DandRiscvSimple.fetch_FetchPlugin_pc_in_stream_valid" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 51000 -TraceValue 1
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 49.146546 66.454607
wvZoomOut -win $_nWave2
srcDeselectAll -win $_nTrace1
srcSelect -signal "ICachePlugin_icache_access_cmd_fire_1" -line 1152 -pos 1 -win \
          $_nTrace1
srcAction -pos 1151 7 8 -win $_nTrace1 -name \
          "ICachePlugin_icache_access_cmd_fire_1" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "ICachePlugin_icache_access_cmd_valid" -line 1151 -pos 1 -win \
          $_nTrace1
srcSelect -signal "ICachePlugin_icache_access_cmd_ready" -line 1151 -pos 1 -win \
          $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvSetCursor -win $_nWave2 51.006221 -snap {("G4" 7)}
srcActiveTrace \
           "tb_DandRiscvSmallest.u_DandRiscvSimple.ICachePlugin_icache_access_cmd_valid" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 0 -TraceValue 0
srcDeselectAll -win $_nTrace1
srcSelect -signal "fetch_valid" -line 1174 -pos 1 -win $_nTrace1
srcSelect -signal "fetch_FetchPlugin_fetch_flush" -line 1174 -pos 1 -win \
          $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvSetCursor -win $_nWave2 50.980703 -snap {("G4" 9)}
srcActiveTrace "tb_DandRiscvSmallest.u_DandRiscvSimple.fetch_valid" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 0 -TraceValue 0
srcDeselectAll -win $_nTrace1
srcSelect -signal "when_FetchPlugin_l126" -line 2743 -pos 1 -win $_nTrace1
srcAction -pos 2742 3 12 -win $_nTrace1 -name "when_FetchPlugin_l126" -ctrlKey \
          off
srcDeselectAll -win $_nTrace1
srcSelect -signal "fetch_state_next" -line 1149 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 33.480541 179.651682
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 0.000000 172.409750
wvZoom -win $_nWave2 43.340748 76.513579
srcDeselectAll -win $_nTrace1
srcSelect -signal "fetch_state_next" -line 1149 -pos 1 -win $_nTrace1
srcAction -pos 1148 8 8 -win $_nTrace1 -name "fetch_state_next" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "FETCH" -line 1110 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSelectGroup -win $_nWave2 {G6}
wvSelectSignal -win $_nWave2 {( "G4" 12 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G6" 0)}
wvSetPosition -win $_nWave2 {("G4" 11)}
wvSetPosition -win $_nWave2 {("G4" 11)}
wvSetPosition -win $_nWave2 {("G4" 11)}
wvSetPosition -win $_nWave2 {("G4" 11)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "when_FetchPlugin_l66" -line 1109 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
srcDeselectAll -win $_nTrace1
srcSelect -signal "when_FetchPlugin_l66" -line 1109 -pos 1 -win $_nTrace1
srcAction -pos 1108 3 5 -win $_nTrace1 -name "when_FetchPlugin_l66" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "fetch_arbitration_isStuck" -line 1106 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "fetch_arbitration_isStuck" -line 1106 -pos 1 -win $_nTrace1
srcAction -pos 1105 10 9 -win $_nTrace1 -name "fetch_arbitration_isStuck" \
          -ctrlKey off
srcBackwardHistory -win $_nTrace1
srcHBSelect "tb_DandRiscvSmallest.u_DandRiscvSimple" -win $_nTrace1
srcHBSelect "tb_DandRiscvSmallest.u_DandRiscvSimple" -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G4" 7 )} 
wvSetCursor -win $_nWave2 50.995076 -snap {("G4" 5)}
srcActiveTrace "tb_DandRiscvSmallest.u_DandRiscvSimple.pc_next\[63:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 0 -TraceValue \
           0000000000000000000000000000000010000000000000000000000000000000
wvSelectSignal -win $_nWave2 {( "G4" 8 )} 
wvSelectSignal -win $_nWave2 {( "G4" 7 )} 
wvSetCursor -win $_nWave2 51.080668 -snap {("G4" 7)}
srcActiveTrace \
           "tb_DandRiscvSmallest.u_DandRiscvSimple.ICachePlugin_icache_access_cmd_valid" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 51000 -TraceValue 1
srcDeselectAll -win $_nTrace1
srcSelect -signal "fetch_valid" -line 1174 -pos 1 -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G4" 9 )} 
wvSetCursor -win $_nWave2 51.092895 -snap {("G4" 9)}
srcActiveTrace "tb_DandRiscvSmallest.u_DandRiscvSimple.fetch_valid" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 51000 -TraceValue 1
srcDeselectAll -win $_nTrace1
srcSelect -signal "when_FetchPlugin_l126" -line 2743 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "reset" -line 2710 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G4" 11 )} 
wvSetCursor -win $_nWave2 48.488467 -snap {("G4" 11)}
srcActiveTrace "tb_DandRiscvSmallest.u_DandRiscvSimple.fetch_state_next\[1:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 0 -TraceValue 01
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G4" 9 )} 
wvZoom -win $_nWave2 28.954391 160.814253
wvZoom -win $_nWave2 44.944769 79.307070
wvSelectSignal -win $_nWave2 {( "G4" 3 9 )} 
wvSelectSignal -win $_nWave2 {( "G4" 9 )} 
wvSelectSignal -win $_nWave2 {( "G4" 5 9 )} 
wvSetCursor -win $_nWave2 51.100345 -snap {("G4" 9)}
srcActiveTrace "tb_DandRiscvSmallest.u_DandRiscvSimple.fetch_valid" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 51000 -TraceValue 1
wvSelectSignal -win $_nWave2 {( "G4" 2 )} 
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G4" 12 )} 
wvSelectSignal -win $_nWave2 {( "G4" 11 )} 
srcDeselectAll -win $_nTrace1
srcSelect -signal "when_FetchPlugin_l126" -line 2743 -pos 1 -win $_nTrace1
srcAction -pos 2742 3 9 -win $_nTrace1 -name "when_FetchPlugin_l126" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "fetch_state" -line 1148 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave2 {("G2" 7)}
wvSetPosition -win $_nWave2 {("G2" 6)}
wvSetPosition -win $_nWave2 {("G2" 7)}
wvSetPosition -win $_nWave2 {("G2" 8)}
wvSetPosition -win $_nWave2 {("G2" 10)}
wvSetPosition -win $_nWave2 {("G3" 2)}
wvSetPosition -win $_nWave2 {("G3" 3)}
wvSetPosition -win $_nWave2 {("G3" 4)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G4" 6)}
wvSetPosition -win $_nWave2 {("G4" 7)}
wvSetPosition -win $_nWave2 {("G4" 8)}
wvSetPosition -win $_nWave2 {("G4" 9)}
wvSetPosition -win $_nWave2 {("G4" 10)}
wvSetPosition -win $_nWave2 {("G4" 11)}
wvSetPosition -win $_nWave2 {("G4" 12)}
wvSetPosition -win $_nWave2 {("G4" 13)}
wvAddSignal -win $_nWave2 \
           "/tb_DandRiscvSmallest/u_DandRiscvSimple/fetch_state\[1:0\]"
wvSetPosition -win $_nWave2 {("G4" 13)}
wvSetPosition -win $_nWave2 {("G4" 14)}
wvSetPosition -win $_nWave2 {("G4" 13)}
wvSetPosition -win $_nWave2 {("G4" 14)}
wvSetPosition -win $_nWave2 {("G4" 14)}
wvSetPosition -win $_nWave2 {("G4" 14)}
wvSetPosition -win $_nWave2 {("G4" 14)}
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
srcDeselectAll -win $_nTrace1
srcSelect -signal "fetch_arbitration_isStuck" -line 1147 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "fetch_state" -line 1148 -pos 1 -win $_nTrace1
srcAction -pos 1147 9 4 -win $_nTrace1 -name "fetch_state" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "clk" -line 2710 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
srcDeselectAll -win $_nTrace1
debReload
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 49.143480 80.503988
wvSelectSignal -win $_nWave2 {( "G4" 1 )} 
wvSelectSignal -win $_nWave2 {( "G4" 5 )} 
wvSetCursor -win $_nWave2 55.004069 -snap {("G4" 1)}
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvSetCursor -win $_nWave2 64.956666 -snap {("G4" 5)}
wvZoom -win $_nWave2 60.332928 72.955734
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 72.981324 -snap {("G4" 1)}
wvZoom -win $_nWave2 58.557918 84.929488
wvZoomOut -win $_nWave2
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G4" 3 )} 
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvZoom -win $_nWave2 60.710997 88.142095
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvSetCursor -win $_nWave2 65.053664 -snap {("G4" 1)}
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvZoom -win $_nWave2 63.516795 76.317300
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
wvSelectSignal -win $_nWave2 {( "G4" 1 )} 
wvSelectSignal -win $_nWave2 {( "G4" 2 )} 
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 51.185752 81.174697
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoom -win $_nWave2 50.052738 90.045368
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
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
wvSetMarker -win $_nWave2 65.000000
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G4" 5 )} 
wvSetCursor -win $_nWave2 64.941258 -snap {("G4" 5)}
srcActiveTrace "tb_DandRiscvSmallest.u_DandRiscvSimple.pc_next\[63:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 63000 -TraceValue \
           0000000000000000000000000000000010000000000000000000000000011000
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
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
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G4" 11 )} 
wvSelectSignal -win $_nWave2 {( "G4" 9 )} 
wvSelectSignal -win $_nWave2 {( "G4" 8 )} 
wvSelectSignal -win $_nWave2 {( "G4" 7 )} 
wvSelectSignal -win $_nWave2 {( "G4" 8 )} 
wvSelectSignal -win $_nWave2 {( "G4" 7 )} 
wvSelectSignal -win $_nWave2 {( "G4" 6 )} 
wvSelectSignal -win $_nWave2 {( "G4" 7 )} 
wvSelectSignal -win $_nWave2 {( "G4" 6 )} 
wvSelectSignal -win $_nWave2 {( "G4" 7 )} 
wvSelectSignal -win $_nWave2 {( "G4" 9 )} 
wvSelectSignal -win $_nWave2 {( "G4" 7 )} 
wvSelectSignal -win $_nWave2 {( "G4" 6 )} 
wvSetCursor -win $_nWave2 64.955999 -snap {("G4" 6)}
srcActiveTrace \
           "tb_DandRiscvSmallest.u_DandRiscvSimple.fetch_FetchPlugin_pc_in_stream_valid" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 51000 -TraceValue 1
srcDeselectAll -win $_nTrace1
srcSelect -signal "ICachePlugin_icache_access_cmd_fire_2" -line 1154 -pos 1 -win \
          $_nTrace1
srcAction -pos 1153 7 25 -win $_nTrace1 -name \
          "ICachePlugin_icache_access_cmd_fire_2" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "ICachePlugin_icache_access_cmd_valid" -line 1153 -pos 1 -win \
          $_nTrace1
srcAction -pos 1152 8 7 -win $_nTrace1 -name \
          "ICachePlugin_icache_access_cmd_valid" -ctrlKey off
wvSelectSignal -win $_nWave2 {( "G4" 5 )} 
srcDeselectAll -win $_nTrace1
debReload
wvScrollDown -win $_nWave2 16
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 6
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
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G7" 6 )} 
wvSelectSignal -win $_nWave2 {( "G7" 7 )} 
wvSelectSignal -win $_nWave2 {( "G7" 6 )} 
wvSelectSignal -win $_nWave2 {( "G7" 5 )} 
wvSetCursor -win $_nWave2 76.999486 -snap {("G7" 1)}
wvSelectSignal -win $_nWave2 {( "G7" 7 )} 
wvZoom -win $_nWave2 75.245294 85.903116
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G7" 1 7 )} 
wvSelectSignal -win $_nWave2 {( "G7" 1 2 7 )} 
wvSelectSignal -win $_nWave2 {( "G7" 1 7 )} 
wvSelectSignal -win $_nWave2 {( "G7" 1 2 7 )} 
wvSelectSignal -win $_nWave2 {( "G7" 1 7 )} 
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoom -win $_nWave2 76.068300 84.867976
wvZoomOut -win $_nWave2
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
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
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSetMarker -win $_nWave2 77.000000
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
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
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 2 )} 
wvZoom -win $_nWave2 71.010026 92.313481
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 79.580878 89.741833
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 3 )} 
wvSelectSignal -win $_nWave2 {( "G2" 4 )} 
wvSelectSignal -win $_nWave2 {( "G2" 3 )} 
wvSelectSignal -win $_nWave2 {( "G2" 2 )} 
wvSelectSignal -win $_nWave2 {( "G2" 7 )} 
wvSelectSignal -win $_nWave2 {( "G2" 2 )} 
wvSetCursor -win $_nWave2 80.964761 -snap {("G2" 2)}
srcActiveTrace "tb_DandRiscvSmallest.u_DandRiscvSimple.writeback_RD_WEN" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 75000 -TraceValue 1
srcDeselectAll -win $_nTrace1
srcSelect -signal "memaccess_to_writeback_RD_WEN" -line 976 -pos 1 -win $_nTrace1
srcAction -pos 975 7 11 -win $_nTrace1 -name "memaccess_to_writeback_RD_WEN" \
          -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "_zz_DecodePlugin_hazard_rs1_from_mem_3" -line 2892 -pos 1 -win \
          $_nTrace1
srcAction -pos 2891 5 11 -win $_nTrace1 -name \
          "_zz_DecodePlugin_hazard_rs1_from_mem_3" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "memaccess_RD_WEN" -line 1021 -pos 1 -win $_nTrace1
srcAction -pos 1020 7 5 -win $_nTrace1 -name "memaccess_RD_WEN" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "execute_to_memaccess_RD_WEN" -line 977 -pos 1 -win $_nTrace1
srcAction -pos 976 7 13 -win $_nTrace1 -name "execute_to_memaccess_RD_WEN" \
          -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "execute_RD_WEN" -line 2889 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "decode_RD_WEN" -line 2886 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G2" 3)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G3" 5)}
wvSetPosition -win $_nWave2 {("G3" 6)}
wvSetPosition -win $_nWave2 {("G3" 7)}
wvSetPosition -win $_nWave2 {("G3" 8)}
wvSetPosition -win $_nWave2 {("G3" 9)}
wvSetPosition -win $_nWave2 {("G3" 10)}
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
wvSetPosition -win $_nWave2 {("G6" 0)}
wvSetPosition -win $_nWave2 {("G6" 1)}
wvSetPosition -win $_nWave2 {("G6" 2)}
wvSetPosition -win $_nWave2 {("G6" 3)}
wvSetPosition -win $_nWave2 {("G6" 4)}
wvSetPosition -win $_nWave2 {("G6" 5)}
wvSetPosition -win $_nWave2 {("G6" 6)}
wvSetPosition -win $_nWave2 {("G6" 7)}
wvSetPosition -win $_nWave2 {("G6" 8)}
wvSetPosition -win $_nWave2 {("G6" 10)}
wvSetPosition -win $_nWave2 {("G6" 11)}
wvSetPosition -win $_nWave2 {("G6" 12)}
wvSetPosition -win $_nWave2 {("G6" 13)}
wvSetPosition -win $_nWave2 {("G6" 14)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G6" 15)}
wvSetPosition -win $_nWave2 {("G6" 16)}
wvSetPosition -win $_nWave2 {("G6" 17)}
wvSetPosition -win $_nWave2 {("G6" 16)}
wvSetPosition -win $_nWave2 {("G6" 15)}
wvSetPosition -win $_nWave2 {("G6" 14)}
wvSetPosition -win $_nWave2 {("G6" 15)}
wvSetPosition -win $_nWave2 {("G6" 16)}
wvSetPosition -win $_nWave2 {("G6" 17)}
wvSetPosition -win $_nWave2 {("G6" 19)}
wvSetPosition -win $_nWave2 {("G6" 20)}
wvSetPosition -win $_nWave2 {("G6" 21)}
wvSetPosition -win $_nWave2 {("G6" 22)}
wvSetPosition -win $_nWave2 {("G6" 23)}
wvSetPosition -win $_nWave2 {("G6" 24)}
wvSetPosition -win $_nWave2 {("G7" 0)}
wvSetPosition -win $_nWave2 {("G7" 1)}
wvSetPosition -win $_nWave2 {("G7" 2)}
wvSetPosition -win $_nWave2 {("G7" 3)}
wvSetPosition -win $_nWave2 {("G7" 4)}
wvSetPosition -win $_nWave2 {("G7" 5)}
wvSetPosition -win $_nWave2 {("G7" 6)}
wvSetPosition -win $_nWave2 {("G7" 7)}
wvSetPosition -win $_nWave2 {("G7" 8)}
wvSetPosition -win $_nWave2 {("G7" 7)}
wvSetPosition -win $_nWave2 {("G7" 6)}
wvSetPosition -win $_nWave2 {("G7" 5)}
wvSetPosition -win $_nWave2 {("G7" 4)}
wvSetPosition -win $_nWave2 {("G7" 3)}
wvSetPosition -win $_nWave2 {("G7" 2)}
wvSetPosition -win $_nWave2 {("G7" 1)}
wvSetPosition -win $_nWave2 {("G7" 0)}
wvSetPosition -win $_nWave2 {("G6" 24)}
wvAddSignal -win $_nWave2 "/tb_DandRiscvSmallest/u_DandRiscvSimple/decode_RD_WEN"
wvSetPosition -win $_nWave2 {("G6" 24)}
wvSetPosition -win $_nWave2 {("G6" 25)}
wvSetPosition -win $_nWave2 {("G6" 24)}
wvSetPosition -win $_nWave2 {("G6" 25)}
wvSetPosition -win $_nWave2 {("G6" 25)}
wvSetPosition -win $_nWave2 {("G6" 25)}
wvSetPosition -win $_nWave2 {("G6" 25)}
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
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
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
wvScrollDown -win $_nWave2 7
wvSelectSignal -win $_nWave2 {( "G7" 6 )} 
wvSelectSignal -win $_nWave2 {( "G7" 7 )} 
wvZoom -win $_nWave2 74.646467 90.975904
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 77.002890 -snap {("G7" 7)}
wvSelectSignal -win $_nWave2 {( "G7" 3 )} 
wvSelectSignal -win $_nWave2 {( "G7" 3 4 )} 
wvSelectSignal -win $_nWave2 {( "G7" 3 )} 
wvSelectSignal -win $_nWave2 {( "G7" 7 )} 
wvSetCursor -win $_nWave2 77.039003 -snap {("G7" 7)}
srcActiveTrace \
           "tb_DandRiscvSmallest.u_DandRiscvSimple.execute_ALU_RESULT\[63:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 77000 -TraceValue \
           0000000000000000000000000000000010000000000010011111000000001000
srcDeselectAll -win $_nTrace1
srcSelect -signal "execute_ALUPlugin_alu_result" -line 962 -pos 1 -win $_nTrace1
srcAction -pos 961 7 16 -win $_nTrace1 -name "execute_ALUPlugin_alu_result" \
          -ctrlKey off
wvSelectSignal -win $_nWave2 {( "G6" 12 )} 
wvSelectSignal -win $_nWave2 {( "G6" 13 )} 
wvSelectSignal -win $_nWave2 {( "G6" 12 )} 
wvSelectSignal -win $_nWave2 {( "G6" 10 )} 
wvSelectSignal -win $_nWave2 {( "G6" 11 )} 
wvSelectSignal -win $_nWave2 {( "G6" 10 )} 
wvSelectSignal -win $_nWave2 {( "G7" 1 )} 
wvSelectSignal -win $_nWave2 {( "G7" 2 )} 
wvSelectSignal -win $_nWave2 {( "G6" 8 )} 
wvSelectSignal -win $_nWave2 {( "G6" 9 )} 
wvSelectSignal -win $_nWave2 {( "G6" 10 )} 
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 62.166154 73.192888
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 72.085337 88.375477
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
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G6" 8 10 )} 
wvSelectSignal -win $_nWave2 {( "G6" 8 10 14 )} 
wvSelectSignal -win $_nWave2 {( "G6" 8 10 )} 
wvSelectSignal -win $_nWave2 {( "G6" 8 10 14 )} 
wvSelectSignal -win $_nWave2 {( "G6" 8 10 )} 
wvSelectSignal -win $_nWave2 {( "G6" 8 10 14 )} 
wvSelectSignal -win $_nWave2 {( "G6" 8 10 )} 
wvSelectSignal -win $_nWave2 {( "G6" 7 8 10 )} 
wvScrollUp -win $_nWave2 6
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 39.677569 121.914855
wvZoom -win $_nWave2 50.802185 97.240638
wvSelectSignal -win $_nWave2 {( "G4" 4 )} 
wvSelectSignal -win $_nWave2 {( "G4" 3 4 )} 
wvSetCursor -win $_nWave2 55.235491 -snap {("G4" 4)}
wvSelectSignal -win $_nWave2 {( "G4" 15 )} 
wvSelectSignal -win $_nWave2 {( "G4" 14 )} 
wvSelectSignal -win $_nWave2 {( "G4" 14 15 )} 
wvSelectSignal -win $_nWave2 {( "G4" 13 14 15 )} 
wvSelectSignal -win $_nWave2 {( "G4" 12 13 14 15 )} 
wvSelectSignal -win $_nWave2 {( "G4" 11 12 13 14 15 )} 
wvSelectSignal -win $_nWave2 {( "G4" 10 11 12 13 14 15 )} 
wvSelectSignal -win $_nWave2 {( "G4" 9 10 11 12 13 14 15 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G7" 6)}
wvSetPosition -win $_nWave2 {("G6" 25)}
wvSetPosition -win $_nWave2 {("G6" 25)}
wvSetPosition -win $_nWave2 {("G6" 25)}
wvSetPosition -win $_nWave2 {("G6" 25)}
wvSelectSignal -win $_nWave2 {( "G4" 4 )} 
wvSetCursor -win $_nWave2 73.071418 -snap {("G4" 4)}
srcActiveTrace "tb_DandRiscvSmallest.u_DandRiscvSimple.fetch_INSTRUCTION\[31:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 73000 -TraceValue \
           00000000000100010011010000100011
srcDeselectAll -win $_nTrace1
srcSelect -signal "fetch_FetchPlugin_instruction_out_stream_payload" -line 997 \
          -pos 1 -win $_nTrace1
srcAction -pos 996 7 21 -win $_nTrace1 -name \
          "fetch_FetchPlugin_instruction_out_stream_payload" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal \
          "fetch_FetchPlugin_instruction_stream_fifo_ports_m_ports_payload" \
          -line 1174 -pos 1 -win $_nTrace1
srcAction -pos 1173 7 8 -win $_nTrace1 -name \
          "fetch_FetchPlugin_instruction_stream_fifo_ports_m_ports_payload" \
          -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "_zz_ports_m_ports_payload" -line 8091 -pos 1 -win $_nTrace1
srcAction -pos 8090 7 8 -win $_nTrace1 -name "_zz_ports_m_ports_payload" -ctrlKey \
          off
srcDeselectAll -win $_nTrace1
srcSelect -signal "fifo_ram_0" -line 8074 -pos 1 -win $_nTrace1
srcAction -pos 8073 9 5 -win $_nTrace1 -name "fifo_ram_0" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "ports_s_ports_payload" -line 8118 -pos 1 -win $_nTrace1
srcAction -pos 8117 5 8 -win $_nTrace1 -name "ports_s_ports_payload" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "ICachePlugin_icache_access_rsp_valid" -line 1169 -pos 1 -win \
          $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "ICachePlugin_icache_access_rsp_payload_data" -line 1170 -pos 1 \
          -win $_nTrace1
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G2" 1)}
wvSetPosition -win $_nWave2 {("G2" 2)}
wvSetPosition -win $_nWave2 {("G2" 3)}
wvSetPosition -win $_nWave2 {("G2" 5)}
wvSetPosition -win $_nWave2 {("G2" 6)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G4" 4)}
wvSetPosition -win $_nWave2 {("G4" 5)}
wvSetPosition -win $_nWave2 {("G4" 6)}
wvSetPosition -win $_nWave2 {("G4" 7)}
wvSetPosition -win $_nWave2 {("G4" 8)}
wvSetPosition -win $_nWave2 {("G6" 0)}
wvSetPosition -win $_nWave2 {("G4" 8)}
wvAddSignal -win $_nWave2 \
           "/tb_DandRiscvSmallest/u_DandRiscvSimple/ICachePlugin_icache_access_rsp_payload_data\[31:0\]"
wvSetPosition -win $_nWave2 {("G4" 8)}
wvSetPosition -win $_nWave2 {("G4" 9)}
wvSetPosition -win $_nWave2 {("G4" 8)}
wvSetPosition -win $_nWave2 {("G4" 9)}
wvSetPosition -win $_nWave2 {("G4" 9)}
wvSetPosition -win $_nWave2 {("G4" 9)}
wvSetPosition -win $_nWave2 {("G4" 9)}
wvSelectSignal -win $_nWave2 {( "G4" 7 9 )} 
wvSelectSignal -win $_nWave2 {( "G4" 8 )} 
wvSelectSignal -win $_nWave2 {( "G4" 9 )} 
wvSelectSignal -win $_nWave2 {( "G4" 4 )} 
wvSelectSignal -win $_nWave2 {( "G4" 3 )} 
wvSelectSignal -win $_nWave2 {( "G4" 4 )} 
wvSelectSignal -win $_nWave2 {( "G4" 5 )} 
wvSelectSignal -win $_nWave2 {( "G4" 4 )} 
wvSetCursor -win $_nWave2 73.088535 -snap {("G4" 4)}
srcActiveTrace "tb_DandRiscvSmallest.u_DandRiscvSimple.fetch_INSTRUCTION\[31:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 73000 -TraceValue \
           00000000000100010011010000100011
srcDeselectAll -win $_nTrace1
srcSelect -signal "fetch_FetchPlugin_instruction_out_stream_payload" -line 997 \
          -pos 1 -win $_nTrace1
srcAction -pos 996 7 8 -win $_nTrace1 -name \
          "fetch_FetchPlugin_instruction_out_stream_payload" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal \
          "fetch_FetchPlugin_instruction_stream_fifo_ports_m_ports_payload" \
          -line 1174 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal \
          "fetch_FetchPlugin_instruction_stream_fifo_ports_m_ports_payload" \
          -line 1174 -pos 1 -win $_nTrace1
srcAction -pos 1173 7 14 -win $_nTrace1 -name \
          "fetch_FetchPlugin_instruction_stream_fifo_ports_m_ports_payload" \
          -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "ports_s_ports_valid" -line 8088 -pos 1 -win $_nTrace1
srcSelect -signal "ports_s_ports_ready" -line 8088 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
srcDeselectAll -win $_nTrace1
srcSelect -signal "ports_s_ports_payload" -line 8047 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G4" 10 )} 
wvSelectSignal -win $_nWave2 {( "G4" 11 )} 
wvSelectSignal -win $_nWave2 {( "G4" 10 )} 
wvSelectSignal -win $_nWave2 {( "G4" 4 )} 
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "ports_m_ports_valid" -line 8048 -pos 1 -win $_nTrace1
srcSelect -signal "ports_m_ports_ready" -line 8049 -pos 1 -win $_nTrace1
srcSelect -signal "ports_m_ports_payload" -line 8050 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G4" 13 )} 
wvSetCursor -win $_nWave2 72.883131 -snap {("G4" 13)}
srcActiveTrace \
           "tb_DandRiscvSmallest.u_DandRiscvSimple.fetch_FetchPlugin_instruction_stream_fifo.ports_m_ports_valid" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 67000 -TraceValue 0
srcDeselectAll -win $_nTrace1
srcSelect -signal "fifo_empty" -line 8090 -pos 1 -win $_nTrace1
srcAction -pos 8089 10 3 -win $_nTrace1 -name "fifo_empty" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "read_ptr" -line 8084 -pos 1 -win $_nTrace1
srcAction -pos 8083 8 4 -win $_nTrace1 -name "read_ptr" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "flush" -line 8097 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvSetCursor -win $_nWave2 64.923720 -snap {("G4" 16)}
srcActiveTrace \
           "tb_DandRiscvSmallest.u_DandRiscvSimple.fetch_FetchPlugin_instruction_stream_fifo.flush" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 0 -TraceValue 0
srcDeselectAll -win $_nTrace1
srcSelect -signal "fetch_FetchPlugin_fetch_flush" -line 1175 -pos 1 -win \
          $_nTrace1
srcSelect -signal "fetch_FetchPlugin_fetch_flush_d1" -line 1175 -pos 1 -win \
          $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G4" 2 )} 
srcDeselectAll -win $_nTrace1
debReload
wvScrollDown -win $_nWave2 0
wvSelectSignal -win $_nWave2 {( "G2" 7 )} 
wvSetSearchMode -win $_nWave2 -value 
wvSetSearchMode -win $_nWave2 -value 80000148
wvSearchNext -win $_nWave2
wvSearchPrev -win $_nWave2
wvSearchNext -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 7 )} 
srcDeselectAll -win $_nTrace1
debReload
wvSearchNext -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 7 )} 
wvSearchNext -win $_nWave2
wvSearchPrev -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 216.085157 306.462979
wvZoom -win $_nWave2 240.769995 268.786121
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
wvZoom -win $_nWave2 189416.881681 201776.631036
wvZoom -win $_nWave2 199512.423358 200810.812067
wvZoom -win $_nWave2 199915.388081 200107.777414
wvZoom -win $_nWave2 199973.679283 200007.434286
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 7 )} 
wvSetCursor -win $_nWave2 199961.007160 -snap {("G2" 7)}
wvSearchPrev -win $_nWave2
wvSearchNext -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvScrollDown -win $_nWave2 0
srcHBSelect "tb_DandRiscvSmallest" -win $_nTrace1
srcSetScope -win $_nTrace1 "tb_DandRiscvSmallest" -delim "."
srcHBSelect "tb_DandRiscvSmallest" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "instrCnt" -line 142 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G2" 8)}
wvSetPosition -win $_nWave2 {("G2" 9)}
wvSetPosition -win $_nWave2 {("G2" 10)}
wvAddSignal -win $_nWave2 "/tb_DandRiscvSmallest/instrCnt\[31:0\]"
wvSetPosition -win $_nWave2 {("G2" 10)}
wvSetPosition -win $_nWave2 {("G2" 11)}
wvSetPosition -win $_nWave2 {("G2" 10)}
wvSetPosition -win $_nWave2 {("G2" 11)}
wvSetPosition -win $_nWave2 {("G2" 11)}
wvSetPosition -win $_nWave2 {("G2" 11)}
wvSetPosition -win $_nWave2 {("G2" 11)}
wvSelectSignal -win $_nWave2 {( "G2" 11 )} 
wvSetRadix -win $_nWave2 -format UDec
wvZoom -win $_nWave2 199725.811120 200248.173832
srcDeselectAll -win $_nTrace1
debReload
wvSelectSignal -win $_nWave2 {( "G2" 7 )} 
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchPrev -win $_nWave2
wvSearchNext -win $_nWave2
wvZoom -win $_nWave2 797927.411414 797965.341917
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
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
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
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
wvSelectSignal -win $_nWave2 {( "G4" 3 )} 
wvSelectSignal -win $_nWave2 {( "G4" 3 4 )} 
wvSelectSignal -win $_nWave2 {( "G4" 1 3 4 )} 
wvSetMarker -win $_nWave2 797937.000000
wvSetCursor -win $_nWave2 797931.004536 -snap {("G4" 5)}
wvSelectSignal -win $_nWave2 {( "G4" 5 )} 
wvSetCursor -win $_nWave2 797930.990555 -snap {("G4" 5)}
srcActiveTrace "tb_DandRiscvSmallest.u_DandRiscvSimple.pc_next\[63:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 797929000 -TraceValue \
           0000000000000000000000000000000010000000000000000000000101000100
wvSelectSignal -win $_nWave2 {( "G4" 1 )} 
wvSelectSignal -win $_nWave2 {( "G4" 5 )} 
wvSetCursor -win $_nWave2 797931.060460 -snap {("G4" 5)}
wvSetCursor -win $_nWave2 797934.961164 -snap {("G4" 4)}
wvSetCursor -win $_nWave2 797931.004536 -snap {("G4" 5)}
srcDeselectAll -win $_nTrace1
srcSearchString "fetch_valid" -win $_nTrace1 -next -case
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G2" 2)}
wvSetPosition -win $_nWave2 {("G2" 0)}
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
wvAddSignal -win $_nWave2 "/tb_DandRiscvSmallest/u_DandRiscvSimple/fetch_valid"
wvSetPosition -win $_nWave2 {("G4" 18)}
wvSetPosition -win $_nWave2 {("G4" 19)}
wvSetPosition -win $_nWave2 {("G4" 18)}
wvSetPosition -win $_nWave2 {("G4" 19)}
wvSetPosition -win $_nWave2 {("G4" 19)}
wvSetPosition -win $_nWave2 {("G4" 19)}
wvSetPosition -win $_nWave2 {("G4" 19)}
wvSetCursor -win $_nWave2 797935.059031 -snap {("G4" 7)}
wvSetCursor -win $_nWave2 797933.115669 -snap {("G4" 6)}
wvSetCursor -win $_nWave2 797931.130365 -snap {("G4" 5)}
wvSetCursor -win $_nWave2 797935.100974 -snap {("G4" 6)}
wvSetCursor -win $_nWave2 797930.906669 -snap {("G4" 5)}
wvSetCursor -win $_nWave2 797935.003107 -snap {("G4" 6)}
wvSetCursor -win $_nWave2 797931.018517 -snap {("G4" 5)}
wvSetCursor -win $_nWave2 797934.975145 -snap {("G4" 6)}
wvSetCursor -win $_nWave2 797930.948612 -snap {("G4" 5)}
wvSetCursor -win $_nWave2 797934.751449 -snap {("G4" 6)}
wvSetCursor -win $_nWave2 797931.032498 -snap {("G4" 5)}
wvSelectSignal -win $_nWave2 {( "G4" 2 )} 
wvSetCursor -win $_nWave2 797933.017802 -snap {("G4" 2)}
wvSelectSignal -win $_nWave2 {( "G4" 19 )} 
wvSelectSignal -win $_nWave2 {( "G4" 2 19 )} 
wvSelectSignal -win $_nWave2 {( "G4" 2 5 19 )} 
wvSetCursor -win $_nWave2 797931.046479 -snap {("G4" 5)}
srcActiveTrace "tb_DandRiscvSmallest.u_DandRiscvSimple.pc_next\[63:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 797931000 -TraceValue \
           0000000000000000000000000000000010000000000000000000000101001000
wvSelectSignal -win $_nWave2 {( "G4" 2 5 8 19 )} 
wvSelectSignal -win $_nWave2 {( "G4" 2 5 7 8 19 )} 
srcDeselectAll -win $_nTrace1
debReload
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvZoom -win $_nWave2 0.000000 1987.983782
wvZoom -win $_nWave2 44.698493 313.622211
wvSelectSignal -win $_nWave2 {( "G2" 7 )} 
wvSelectSignal -win $_nWave2 {( "G2" 7 )} 
wvSetSearchMode -win $_nWave2 -value 80000090
wvSearchNext -win $_nWave2
wvSearchPrev -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 7 )} 
wvSearchNext -win $_nWave2
wvSearchPrev -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 4839.660892 -snap {("G2" 7)}
wvSearchNext -win $_nWave2
wvSearchPrev -win $_nWave2
wvZoom -win $_nWave2 819.019536 3350.534464
wvZoom -win $_nWave2 2521.936876 2841.058920
wvZoom -win $_nWave2 2622.860840 2685.791283
wvSetMarker -win $_nWave2 2641.000000
wvZoom -win $_nWave2 2638.796414 2651.739720
wvSelectSignal -win $_nWave2 {( "G2" 4 )} 
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 7 )} 
wvSelectSignal -win $_nWave2 {( "G2" 2 )} 
wvSelectSignal -win $_nWave2 {( "G2" 4 )} 
wvSetCursor -win $_nWave2 2641.084035 -snap {("G2" 4)}
wvSelectSignal -win $_nWave2 {( "G2" 7 )} 
wvSetCursor -win $_nWave2 2642.973290 -snap {("G2" 7)}
wvSearchNext -win $_nWave2
wvSearchPrev -win $_nWave2
wvSearchPrev -win $_nWave2
wvSearchPrev -win $_nWave2
wvSearchPrev -win $_nWave2
wvSearchPrev -win $_nWave2
wvSearchPrev -win $_nWave2
wvSearchPrev -win $_nWave2
wvSetCursor -win $_nWave2 0.438918 -snap {("G2" 7)}
wvSetCursor -win $_nWave2 0.009542 -snap {("G2" 7)}
wvSearchNext -win $_nWave2
wvZoomOut -win $_nWave2
wvSetMarker -win $_nWave2 1921.000000
wvZoom -win $_nWave2 1916.558758 1932.378884
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvScrollDown -win $_nWave2 28
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
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G7" 7 )} 
wvSetMarker -win $_nWave2 1917.000000
wvZoom -win $_nWave2 1912.258226 1931.058110
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G7" 3 )} 
wvSelectSignal -win $_nWave2 {( "G7" 4 )} 
wvSelectSignal -win $_nWave2 {( "G7" 7 )} 
wvSetCursor -win $_nWave2 1917.022296 -snap {("G7" 7)}
srcActiveTrace \
           "tb_DandRiscvSmallest.u_DandRiscvSimple.execute_ALU_RESULT\[63:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 1911000 -TraceValue \
           0000000000000000000000000000000010000000000000000000001111001100
srcDeselectAll -win $_nTrace1
srcSelect -signal "execute_ALUPlugin_alu_result" -line 961 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave2 {("G4" 12)}
wvSetPosition -win $_nWave2 {("G4" 15)}
wvSetPosition -win $_nWave2 {("G4" 17)}
wvSetPosition -win $_nWave2 {("G4" 19)}
wvSetPosition -win $_nWave2 {("G6" 5)}
wvSetPosition -win $_nWave2 {("G6" 12)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G7" 9)}
wvSetPosition -win $_nWave2 {("G7" 10)}
wvSetPosition -win $_nWave2 {("G7" 11)}
wvSetPosition -win $_nWave2 {("G7" 12)}
wvSetPosition -win $_nWave2 {("G7" 13)}
wvSetPosition -win $_nWave2 {("G7" 14)}
wvAddSignal -win $_nWave2 \
           "/tb_DandRiscvSmallest/u_DandRiscvSimple/execute_ALUPlugin_alu_result\[63:0\]"
wvSetPosition -win $_nWave2 {("G7" 14)}
wvSetPosition -win $_nWave2 {("G7" 15)}
wvSetPosition -win $_nWave2 {("G7" 14)}
wvSetPosition -win $_nWave2 {("G7" 15)}
wvSetPosition -win $_nWave2 {("G7" 15)}
wvSetPosition -win $_nWave2 {("G7" 15)}
wvSetPosition -win $_nWave2 {("G7" 15)}
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSetCursor -win $_nWave2 1916.842127 -snap {("G7" 15)}
srcActiveTrace \
           "tb_DandRiscvSmallest.u_DandRiscvSimple.execute_ALUPlugin_alu_result\[63:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 1911000 -TraceValue \
           0000000000000000000000000000000010000000000000000000001111001100
srcDeselectAll -win $_nTrace1
srcSelect -signal "execute_ALUPlugin_addw_result" -line 2126 -pos 1 -win \
          $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvSetCursor -win $_nWave2 1916.939141 -snap {("G7" 16)}
srcActiveTrace \
           "tb_DandRiscvSmallest.u_DandRiscvSimple.execute_ALUPlugin_addw_result\[63:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 1911000 -TraceValue \
           1111111111111111111111111111111110000000000000000000001111001100
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G7" 1 )} 
wvSetCursor -win $_nWave2 1917.050014 -snap {("G7" 16)}
srcActiveTrace \
           "tb_DandRiscvSmallest.u_DandRiscvSimple.execute_ALUPlugin_addw_result\[63:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 1917000 -TraceValue \
           0000000000000000000000000000000000000000000000000000000000010010
srcDeselectAll -win $_nTrace1
srcSelect -signal "_zz_execute_ALUPlugin_addw_result_1" -line 1805 -pos 1 -win \
          $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "_zz_execute_ALUPlugin_addw_result_2" -line 1805 -pos 1 -win \
          $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "_zz_execute_ALUPlugin_addw_result_1" -line 1805 -pos 1 -win \
          $_nTrace1
srcSelect -signal "_zz_execute_ALUPlugin_addw_result_2" -line 1805 -pos 1 -win \
          $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G7" 3 )} 
wvSetCursor -win $_nWave2 1917.022296 -snap {("G7" 3)}
srcActiveTrace "tb_DandRiscvSmallest.u_DandRiscvSimple.execute_RS1\[63:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 1909000 -TraceValue \
           0000000000000000000000000000000010000000000000000000001111001000
srcDeselectAll -win $_nTrace1
srcSelect -signal "decode_to_execute_RS1" -line 1034 -pos 1 -win $_nTrace1
srcAction -pos 1033 7 5 -win $_nTrace1 -name "decode_to_execute_RS1" -ctrlKey off
wvSelectSignal -win $_nWave2 {( "G6" 10 )} 
wvSelectSignal -win $_nWave2 {( "G6" 10 11 )} 
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G6" 16 )} 
wvSelectSignal -win $_nWave2 {( "G6" 16 17 )} 
wvSelectSignal -win $_nWave2 {( "G6" 15 16 17 )} 
wvSelectSignal -win $_nWave2 {( "G6" 16 17 )} 
wvSelectSignal -win $_nWave2 {( "G6" 18 )} 
wvSelectSignal -win $_nWave2 {( "G6" 18 19 )} 
wvSelectSignal -win $_nWave2 {( "G6" 18 19 20 )} 
wvSelectSignal -win $_nWave2 {( "G6" 18 19 20 21 )} 
wvSelectSignal -win $_nWave2 {( "G6" 18 19 20 21 22 )} 
wvSelectSignal -win $_nWave2 {( "G6" 18 19 20 21 22 23 )} 
wvSelectSignal -win $_nWave2 {( "G6" 18 19 20 21 22 23 24 )} 
wvSelectSignal -win $_nWave2 {( "G6" 18 19 20 21 22 23 24 25 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G9" 1)}
wvSetPosition -win $_nWave2 {("G7" 18)}
wvSetPosition -win $_nWave2 {("G7" 18)}
wvSetPosition -win $_nWave2 {("G7" 18)}
wvSetPosition -win $_nWave2 {("G7" 18)}
wvSelectSignal -win $_nWave2 {( "G6" 16 )} 
wvSelectSignal -win $_nWave2 {( "G6" 16 17 )} 
wvSelectSignal -win $_nWave2 {( "G6" 16 17 )} 
wvSetRadix -win $_nWave2 -format UDec
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G6" 10 )} 
wvSelectSignal -win $_nWave2 {( "G6" 10 11 )} 
wvSetCursor -win $_nWave2 1915.026584 -snap {("G6" 10)}
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 3
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 2
wvScrollUp -win $_nWave2 2
wvScrollUp -win $_nWave2 1
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
wvScrollUp -win $_nWave2 2
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 2
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G2" 9 )} 
wvSelectSignal -win $_nWave2 {( "G2" 10 )} 
wvSelectSignal -win $_nWave2 {( "G2" 9 )} 
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G6" 17 )} 
wvSetCursor -win $_nWave2 1915.040443 -snap {("G6" 16)}
srcActiveTrace \
           "tb_DandRiscvSmallest.u_DandRiscvSimple.regFileModule_1.read_ports_rs1_addr\[4:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 1915000 -TraceValue \
           01011
wvSelectSignal -win $_nWave2 {( "G6" 10 )} 
wvSetCursor -win $_nWave2 1914.957288 -snap {("G6" 10)}
srcActiveTrace "tb_DandRiscvSmallest.u_DandRiscvSimple.decode_RS1\[63:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 1905000 -TraceValue \
           0000000000000000000000000000000010000000000000000000001111001000
srcDeselectAll -win $_nTrace1
srcSelect -signal "decode_DecodePlugin_rs1" -line 988 -pos 1 -win $_nTrace1
srcAction -pos 987 7 7 -win $_nTrace1 -name "decode_DecodePlugin_rs1" -ctrlKey \
          off
srcDeselectAll -win $_nTrace1
srcSelect -signal "regFileModule_1_read_ports_rs1_value" -line 1748 -pos 1 -win \
          $_nTrace1
srcAction -pos 1747 7 8 -win $_nTrace1 -name \
          "regFileModule_1_read_ports_rs1_value" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "read_value_1" -line 3474 -pos 1 -win $_nTrace1
srcAction -pos 3473 46 4 -win $_nTrace1 -name "read_value_1" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "_zz_read_value_1" -line 3470 -pos 1 -win $_nTrace1
srcAction -pos 3469 7 8 -win $_nTrace1 -name "_zz_read_value_1" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "reg_file_11" -line 3409 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave2 {("G3" 1)}
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSetPosition -win $_nWave2 {("G2" 0)}
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
wvSetPosition -win $_nWave2 {("G3" 1)}
wvSetPosition -win $_nWave2 {("G3" 2)}
wvSetPosition -win $_nWave2 {("G3" 1)}
wvSetPosition -win $_nWave2 {("G3" 0)}
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
wvAddSignal -win $_nWave2 \
           "/tb_DandRiscvSmallest/u_DandRiscvSimple/regFileModule_1/reg_file_11\[63:0\]"
wvSetPosition -win $_nWave2 {("G2" 11)}
wvSetPosition -win $_nWave2 {("G2" 12)}
wvSetPosition -win $_nWave2 {("G2" 11)}
wvSetPosition -win $_nWave2 {("G2" 12)}
wvSetPosition -win $_nWave2 {("G2" 12)}
wvSetPosition -win $_nWave2 {("G2" 12)}
wvSetPosition -win $_nWave2 {("G2" 12)}
wvSelectSignal -win $_nWave2 {( "G2" 11 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSetPosition -win $_nWave2 {("G2" 11)}
wvSetPosition -win $_nWave2 {("G2" 11)}
wvSetPosition -win $_nWave2 {("G2" 11)}
wvSetPosition -win $_nWave2 {("G2" 11)}
wvSelectSignal -win $_nWave2 {( "G2" 11 )} 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 1870.157712 1992.007015
wvZoom -win $_nWave2 1908.782998 1932.272561
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvZoom -win $_nWave2 1906.380361 1932.008488
wvZoomOut -win $_nWave2
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
wvZoom -win $_nWave2 1910.815454 1929.047036
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
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
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
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
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
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
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
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
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
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
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
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
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
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
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 1
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
wvScrollDown -win $_nWave2 0
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
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
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
wvScrollDown -win $_nWave2 0
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
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
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
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 10
wvSelectSignal -win $_nWave2 {( "G6" 12 )} 
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSetCursor -win $_nWave2 1914.991985 -snap {("G6" 12)}
srcActiveTrace "tb_DandRiscvSmallest.u_DandRiscvSimple.decode_IMM\[63:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 1909000 -TraceValue \
           0000000000000000000000000000000000000000000000000000000000000100
srcDeselectAll -win $_nTrace1
srcSelect -signal "decode_DecodePlugin_imm" -line 989 -pos 1 -win $_nTrace1
srcAction -pos 988 7 5 -win $_nTrace1 -name "decode_DecodePlugin_imm" -ctrlKey \
          off
srcDeselectAll -win $_nTrace1
srcSelect -signal "when_DecodePlugin_l116" -line 1245 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "when_DecodePlugin_l116" -line 1245 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "when_DecodePlugin_l116" -line 1245 -pos 1 -win $_nTrace1
srcAction -pos 1244 3 12 -win $_nTrace1 -name "when_DecodePlugin_l116" -ctrlKey \
          off
wvSetCursor -win $_nWave2 1914.911344 -snap {("G6" 12)}
srcActiveTrace "tb_DandRiscvSmallest.u_DandRiscvSimple.decode_IMM\[63:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 1909000 -TraceValue \
           0000000000000000000000000000000000000000000000000000000000000100
srcDeselectAll -win $_nTrace1
srcSelect -signal "decode_DecodePlugin_imm" -line 989 -pos 1 -win $_nTrace1
srcAction -pos 988 7 8 -win $_nTrace1 -name "decode_DecodePlugin_imm" -ctrlKey \
          off
wvSelectSignal -win $_nWave2 {( "G6" 7 12 )} 
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G4" 5 )} 
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 1897.365209 1932.981644
wvSetMarker -win $_nWave2 1899.000000
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
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
wvSelectSignal -win $_nWave2 {( "G2" 7 )} 
wvSelectSignal -win $_nWave2 {( "G2" 1 7 )} 
wvSetMarker -win $_nWave2 1911.000000
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G4" 1 )} 
wvSelectSignal -win $_nWave2 {( "G4" 1 3 )} 
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSetMarker -win $_nWave2 1905.000000
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G4" 16 )} 
wvSelectSignal -win $_nWave2 {( "G4" 18 )} 
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvSetCursor -win $_nWave2 1909.154210 -snap {("G4" 18)}
srcActiveTrace \
           "tb_DandRiscvSmallest.u_DandRiscvSimple.fetch_FetchPlugin_fetch_flush_d1" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 1909000 -TraceValue 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G4" 16 )} 
wvSelectSignal -win $_nWave2 {( "G4" 17 )} 
wvSelectSignal -win $_nWave2 {( "G4" 18 )} 
wvSelectSignal -win $_nWave2 {( "G4" 16 )} 
wvSelectSignal -win $_nWave2 {( "G4" 17 )} 
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSetCursor -win $_nWave2 1906.974951 -snap {("G4" 16)}
srcActiveTrace \
           "tb_DandRiscvSmallest.u_DandRiscvSimple.fetch_FetchPlugin_instruction_stream_fifo.flush" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 1855000 -TraceValue 0
srcDeselectAll -win $_nTrace1
srcSelect -signal "pc_next_d1_valid" -line 1101 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave2 {("G3" 2)}
wvSetPosition -win $_nWave2 {("G3" 1)}
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSetPosition -win $_nWave2 {("G3" 2)}
wvSetPosition -win $_nWave2 {("G3" 9)}
wvSetPosition -win $_nWave2 {("G3" 10)}
wvSetPosition -win $_nWave2 {("G4" 1)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G4" 16)}
wvSetPosition -win $_nWave2 {("G4" 17)}
wvSetPosition -win $_nWave2 {("G4" 18)}
wvSetPosition -win $_nWave2 {("G4" 19)}
wvAddSignal -win $_nWave2 \
           "/tb_DandRiscvSmallest/u_DandRiscvSimple/pc_next_d1_valid"
wvSetPosition -win $_nWave2 {("G4" 19)}
wvSetPosition -win $_nWave2 {("G4" 20)}
wvSetPosition -win $_nWave2 {("G4" 19)}
wvSetPosition -win $_nWave2 {("G4" 20)}
wvSetPosition -win $_nWave2 {("G4" 20)}
wvSetPosition -win $_nWave2 {("G4" 20)}
wvSetPosition -win $_nWave2 {("G4" 20)}
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G6" 0)}
wvSetPosition -win $_nWave2 {("G4" 19)}
wvSetPosition -win $_nWave2 {("G4" 19)}
wvSetPosition -win $_nWave2 {("G4" 19)}
wvSetPosition -win $_nWave2 {("G4" 19)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "when_FetchPlugin_l111" -line 1101 -pos 1 -win $_nTrace1
srcSelect -signal "pc_next_d1_valid" -line 1101 -pos 1 -win $_nTrace1
srcSelect -signal "fetch_arbitration_flushIt" -line 1101 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSetCursor -win $_nWave2 1907.066848 -snap {("G4" 22)}
srcActiveTrace "tb_DandRiscvSmallest.u_DandRiscvSimple.fetch_arbitration_flushIt" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 1907000 -TraceValue 1
srcDeselectAll -win $_nTrace1
srcSelect -signal "when_FetchPlugin_l114" -line 2208 -pos 1 -win $_nTrace1
srcAction -pos 2207 7 4 -win $_nTrace1 -name "when_FetchPlugin_l114" -ctrlKey off
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G7" 10 )} 
wvSelectSignal -win $_nWave2 {( "G7" 10 11 )} 
wvSelectSignal -win $_nWave2 {( "G7" 10 11 12 )} 
wvSelectSignal -win $_nWave2 {( "G7" 10 11 12 13 )} 
wvSelectSignal -win $_nWave2 {( "G7" 10 11 12 13 14 )} 
wvSelectSignal -win $_nWave2 {( "G7" 10 11 12 13 )} 
wvSelectSignal -win $_nWave2 {( "G7" 10 11 12 13 14 )} 
wvSelectSignal -win $_nWave2 {( "G7" 10 11 12 13 14 15 )} 
wvSelectSignal -win $_nWave2 {( "G7" 10 11 12 13 14 15 16 )} 
wvSelectSignal -win $_nWave2 {( "G7" 10 11 12 13 14 15 16 17 )} 
wvSelectSignal -win $_nWave2 {( "G7" 10 11 12 13 14 15 16 17 18 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G4" 22)}
wvSetPosition -win $_nWave2 {("G4" 22)}
wvSetPosition -win $_nWave2 {("G4" 22)}
wvSetPosition -win $_nWave2 {("G4" 22)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "execute_REDIRECT_VALID" -line 1053 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave2 {("G4" 10)}
wvSetPosition -win $_nWave2 {("G4" 9)}
wvSetPosition -win $_nWave2 {("G4" 12)}
wvSetPosition -win $_nWave2 {("G4" 13)}
wvSetPosition -win $_nWave2 {("G4" 14)}
wvSetPosition -win $_nWave2 {("G4" 17)}
wvSetPosition -win $_nWave2 {("G4" 20)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G6" 16)}
wvSetPosition -win $_nWave2 {("G6" 17)}
wvSetPosition -win $_nWave2 {("G7" 0)}
wvSetPosition -win $_nWave2 {("G7" 1)}
wvSetPosition -win $_nWave2 {("G7" 2)}
wvSetPosition -win $_nWave2 {("G7" 3)}
wvSetPosition -win $_nWave2 {("G7" 4)}
wvSetPosition -win $_nWave2 {("G7" 5)}
wvSetPosition -win $_nWave2 {("G7" 6)}
wvSetPosition -win $_nWave2 {("G7" 7)}
wvSetPosition -win $_nWave2 {("G7" 8)}
wvSetPosition -win $_nWave2 {("G7" 9)}
wvAddSignal -win $_nWave2 \
           "/tb_DandRiscvSmallest/u_DandRiscvSimple/execute_REDIRECT_VALID"
wvSetPosition -win $_nWave2 {("G7" 9)}
wvSetPosition -win $_nWave2 {("G7" 10)}
wvSetPosition -win $_nWave2 {("G7" 9)}
wvSetPosition -win $_nWave2 {("G7" 10)}
wvSetPosition -win $_nWave2 {("G7" 10)}
wvSetPosition -win $_nWave2 {("G7" 10)}
wvSetPosition -win $_nWave2 {("G7" 10)}
wvSetCursor -win $_nWave2 1906.974951 -snap {("G7" 10)}
srcActiveTrace "tb_DandRiscvSmallest.u_DandRiscvSimple.execute_REDIRECT_VALID" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 1855000 -TraceValue 0
srcDeselectAll -win $_nTrace1
srcSelect -signal "execute_ALUPlugin_redirect_valid" -line 952 -pos 1 -win \
          $_nTrace1
srcAction -pos 951 7 17 -win $_nTrace1 -name "execute_ALUPlugin_redirect_valid" \
          -ctrlKey off
wvSelectSignal -win $_nWave2 {( "G7" 2 10 )} 
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G4" 5 )} 
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
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
srcDeselectAll -win $_nTrace1
srcSelect -signal "execute_ALUPlugin_redirect_valid" -line 2054 -pos 1 -win \
          $_nTrace1
srcSearchString "execute_RD" -win $_nTrace1 -next -case
srcSearchString "execute_RED" -win $_nTrace1 -next -case
srcDeselectAll -win $_nTrace1
srcSelect -signal "execute_REDIRECT_PC_NEXT" -line 142 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G7" 10 )} 
wvSelectSignal -win $_nWave2 {( "G7" 11 )} 
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
wvSelectSignal -win $_nWave2 {( "G4" 5 )} 
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G4" 2 )} 
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G7" 10 )} 
wvSelectSignal -win $_nWave2 {( "G7" 11 )} 
wvSelectSignal -win $_nWave2 {( "G7" 10 )} 
wvSelectSignal -win $_nWave2 {( "G7" 11 )} 
wvSelectSignal -win $_nWave2 {( "G7" 10 )} 
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G7" 11 )} 
wvSetCursor -win $_nWave2 1907.001207 -snap {("G7" 10)}
srcActiveTrace "tb_DandRiscvSmallest.u_DandRiscvSimple.execute_REDIRECT_VALID" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 1855000 -TraceValue 0
wvSetCursor -win $_nWave2 1907.001207 -snap {("G7" 10)}
srcActiveTrace "tb_DandRiscvSmallest.u_DandRiscvSimple.execute_REDIRECT_VALID" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 1855000 -TraceValue 0
srcDeselectAll -win $_nTrace1
srcSelect -signal "execute_ALUPlugin_redirect_valid" -line 952 -pos 1 -win \
          $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "execute_ALUPlugin_redirect_valid" -line 952 -pos 1 -win \
          $_nTrace1
srcAction -pos 951 7 15 -win $_nTrace1 -name "execute_ALUPlugin_redirect_valid" \
          -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "execute_ALUPlugin_branch_or_jump" -line 2051 -pos 1 -win \
          $_nTrace1
srcSelect -signal "execute_ALUPlugin_branch_taken" -line 2052 -pos 1 -win \
          $_nTrace1
srcSelect -signal "when_AluPlugin_l231" -line 2053 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSetCursor -win $_nWave2 1906.974951 -snap {("G7" 13)}
srcActiveTrace \
           "tb_DandRiscvSmallest.u_DandRiscvSimple.execute_ALUPlugin_branch_taken" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 1855000 -TraceValue 0
srcDeselectAll -win $_nTrace1
srcSelect -signal "execute_ALUPlugin_bge_result" -line 2185 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvSetCursor -win $_nWave2 1906.988079 -snap {("G7" 15)}
srcActiveTrace \
           "tb_DandRiscvSmallest.u_DandRiscvSimple.execute_ALUPlugin_bge_result" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 59000 -TraceValue 0
srcDeselectAll -win $_nTrace1
srcSelect -signal "_zz_execute_ALUPlugin_bge_result" -line 2182 -pos 1 -win \
          $_nTrace1
srcSelect -signal "_zz_execute_ALUPlugin_bge_result_1" -line 2182 -pos 1 -win \
          $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSetCursor -win $_nWave2 1906.896183 -snap {("G7" 16)}
srcActiveTrace \
           "tb_DandRiscvSmallest.u_DandRiscvSimple._zz_execute_ALUPlugin_bge_result\[63:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 1905000 -TraceValue \
           0000000000000000000000000000000000000000000000000000000000000010
srcDeselectAll -win $_nTrace1
srcSelect -signal "execute_ALUPlugin_branch_src1" -line 805 -pos 1 -win $_nTrace1
srcSelect -signal "execute_ALUPlugin_branch_src2" -line 807 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G7" 16 )} 
wvSelectSignal -win $_nWave2 {( "G7" 16 17 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G8" 1)}
wvSetPosition -win $_nWave2 {("G7" 17)}
wvSetPosition -win $_nWave2 {("G7" 17)}
wvSetPosition -win $_nWave2 {("G7" 17)}
wvSetPosition -win $_nWave2 {("G7" 17)}
wvSelectSignal -win $_nWave2 {( "G7" 15 )} 
wvScrollUp -win $_nWave2 34
wvSelectSignal -win $_nWave2 {( "G2" 9 )} 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 1887.263165 -snap {("G2" 9)}
srcActiveTrace \
           "tb_DandRiscvSmallest.u_DandRiscvSimple.regFileModule_1.reg_file_8\[63:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 1887000 -TraceValue \
           0000000000000000000000000000000010000000000000000000001111001000
srcDeselectAll -win $_nTrace1
srcSelect -signal "reg_file_13" -line 3552 -pos 1 -win $_nTrace1
srcSelect -signal "reg_file_14" -line 3555 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G2" 9)}
wvSetPosition -win $_nWave2 {("G2" 10)}
wvSetPosition -win $_nWave2 {("G2" 11)}
wvAddSignal -win $_nWave2 \
           "/tb_DandRiscvSmallest/u_DandRiscvSimple/regFileModule_1/reg_file_13\[63:0\]" \
           "/tb_DandRiscvSmallest/u_DandRiscvSimple/regFileModule_1/reg_file_14\[63:0\]"
wvSetPosition -win $_nWave2 {("G2" 11)}
wvSetPosition -win $_nWave2 {("G2" 13)}
wvSetPosition -win $_nWave2 {("G2" 11)}
wvSetPosition -win $_nWave2 {("G2" 13)}
wvSetPosition -win $_nWave2 {("G2" 13)}
wvSetPosition -win $_nWave2 {("G2" 13)}
wvSetPosition -win $_nWave2 {("G2" 13)}
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
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvZoom -win $_nWave2 1901.126399 1934.471680
wvSetCursor -win $_nWave2 1907.026043 -snap {("G7" 11)}
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
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoom -win $_nWave2 1904.076221 1918.259949
wvZoomOut -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G4" 3 )} 
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G4" 5 )} 
wvSetCursor -win $_nWave2 1907.649739 -snap {("G4" 2)}
wvSelectSignal -win $_nWave2 {( "G4" 22 )} 
wvSelectSignal -win $_nWave2 {( "G4" 5 )} 
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G4" 22 )} 
wvSetMarker -win $_nWave2 1907.000000
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
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
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G4" 6 )} 
wvSelectSignal -win $_nWave2 {( "G4" 5 )} 
wvSelectSignal -win $_nWave2 {( "G4" 2 )} 
wvSetCursor -win $_nWave2 1907.001451 -snap {("G4" 2)}
srcActiveTrace "tb_DandRiscvSmallest.u_DandRiscvSimple.fetch_state\[1:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 1761000 -TraceValue 01
srcDeselectAll -win $_nTrace1
srcSelect -signal "fetch_state_next" -line 2726 -pos 1 -win $_nTrace1
srcAction -pos 2725 5 8 -win $_nTrace1 -name "fetch_state_next" -ctrlKey off
wvScrollUp -win $_nWave2 2
wvScrollDown -win $_nWave2 5
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G6" 1 )} 
wvSelectSignal -win $_nWave2 {( "G6" 2 )} 
wvSelectSignal -win $_nWave2 {( "G6" 1 )} 
wvSelectSignal -win $_nWave2 {( "G6" 2 )} 
wvSelectSignal -win $_nWave2 {( "G6" 3 )} 
wvSelectSignal -win $_nWave2 {( "G6" 2 )} 
wvSelectSignal -win $_nWave2 {( "G6" 1 )} 
wvSelectSignal -win $_nWave2 {( "G6" 2 )} 
wvSelectSignal -win $_nWave2 {( "G6" 3 )} 
wvSelectSignal -win $_nWave2 {( "G6" 2 )} 
wvSelectSignal -win $_nWave2 {( "G6" 1 )} 
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
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
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
srcDeselectAll -win $_nTrace1
debReload
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
wvScrollDown -win $_nWave2 2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
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
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G4" 5 )} 
wvSelectSignal -win $_nWave2 {( "G4" 5 7 )} 
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
wvSetCursor -win $_nWave2 1913.149730 -snap {("G2" 3)}
srcDeselectAll -win $_nTrace1
debReload
wvSetCursor -win $_nWave2 1905.265712 -snap {("G2" 6)}
wvSetCursor -win $_nWave2 1908.622171 -snap {("G2" 6)}
wvSetCursor -win $_nWave2 1911.121216 -snap {("G2" 1)}
wvSetCursor -win $_nWave2 1912.951061 -snap {("G2" 5)}
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 1921.080801 -snap {("G2" 1)}
wvZoom -win $_nWave2 1917.672061 1927.647330
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvScrollDown -win $_nWave2 0
srcHBSelect "tb_DandRiscvSmallest" -win $_nTrace1
srcSetScope -win $_nTrace1 "tb_DandRiscvSmallest" -delim "."
srcHBSelect "tb_DandRiscvSmallest" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "instrCnt" -line 142 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G2" 11)}
wvSetPosition -win $_nWave2 {("G2" 12)}
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
wvAddSignal -win $_nWave2 "/tb_DandRiscvSmallest/instrCnt\[31:0\]"
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G2" 1)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G2" 1)}
wvSetPosition -win $_nWave2 {("G2" 1)}
wvSetPosition -win $_nWave2 {("G2" 1)}
wvSetPosition -win $_nWave2 {("G2" 1)}
wvSelectSignal -win $_nWave2 {( "G2" 1 )} 
wvSetRadix -win $_nWave2 -format UDec
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 2139.042330 2229.604653
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 2388.665816 2481.001247
wvSetMarker -win $_nWave2 2445.000000
wvZoom -win $_nWave2 2432.800603 2462.578524
wvSelectSignal -win $_nWave2 {( "G2" 5 )} 
wvSelectSignal -win $_nWave2 {( "G2" 8 )} 
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 2428.031956 2465.015099
wvSetCursor -win $_nWave2 2433.114235 -snap {("G2" 8)}
wvZoom -win $_nWave2 2439.098209 2453.265745
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvSetCursor -win $_nWave2 2408.983167 -snap {("G2" 1)}
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 2402.959216 2426.803802
wvSetMarker -win $_nWave2 2409.000000
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
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
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G7" 11 )} 
wvSelectSignal -win $_nWave2 {( "G7" 10 11 )} 
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G7" 2 10 11 )} 
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 2396.762443 2424.015914
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvSetCursor -win $_nWave2 2403.074939 -snap {("G6" 3)}
wvSelectSignal -win $_nWave2 {( "G6" 3 )} 
wvSelectSignal -win $_nWave2 {( "G7" 8 )} 
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G7" 5 )} 
wvSetCursor -win $_nWave2 2402.994396 -snap {("G7" 5)}
srcActiveTrace \
           "tb_DandRiscvSmallest.u_DandRiscvSimple.execute_REDIRECT_PC_NEXT\[63:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 2401000 -TraceValue \
           0000000000000000000000000000000010000000000000000000000010001000
wvSelectSignal -win $_nWave2 {( "G7" 16 )} 
wvSelectSignal -win $_nWave2 {( "G7" 15 )} 
wvSelectSignal -win $_nWave2 {( "G7" 12 )} 
wvSelectSignal -win $_nWave2 {( "G6" 4 )} 
wvSelectSignal -win $_nWave2 {( "G6" 3 )} 
wvSetCursor -win $_nWave2 2400.980841 -snap {("G6" 3)}
srcActiveTrace \
           "tb_DandRiscvSmallest.u_DandRiscvSimple.execute_arbitration_isStuck" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 2363000 -TraceValue 0
srcDeselectAll -win $_nTrace1
srcSelect -signal "execute_arbitration_haltItself" -line 2693 -pos 1 -win \
          $_nTrace1
srcAction -pos 2692 8 23 -win $_nTrace1 -name "execute_arbitration_haltItself" \
          -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "DecodePlugin_hazard_load_use" -line 2211 -pos 1 -win $_nTrace1
srcSelect -signal "DecodePlugin_hazard_ctrl_load_use" -line 2211 -pos 1 -win \
          $_nTrace1
srcSelect -signal "execute_INT_HOLD" -line 2211 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave2 {("G4" 8)}
wvSetPosition -win $_nWave2 {("G4" 12)}
wvSetPosition -win $_nWave2 {("G4" 14)}
wvSetPosition -win $_nWave2 {("G4" 16)}
wvSetPosition -win $_nWave2 {("G6" 3)}
wvSetPosition -win $_nWave2 {("G6" 5)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G7" 9)}
wvSetPosition -win $_nWave2 {("G7" 10)}
wvSetPosition -win $_nWave2 {("G7" 11)}
wvSetPosition -win $_nWave2 {("G7" 12)}
wvSetPosition -win $_nWave2 {("G7" 13)}
wvSetPosition -win $_nWave2 {("G7" 14)}
wvSetPosition -win $_nWave2 {("G7" 15)}
wvSetPosition -win $_nWave2 {("G7" 16)}
wvSetPosition -win $_nWave2 {("G7" 17)}
wvAddSignal -win $_nWave2 \
           "/tb_DandRiscvSmallest/u_DandRiscvSimple/DecodePlugin_hazard_load_use" \
           "/tb_DandRiscvSmallest/u_DandRiscvSimple/DecodePlugin_hazard_ctrl_load_use" \
           "/tb_DandRiscvSmallest/u_DandRiscvSimple/execute_INT_HOLD"
wvSetPosition -win $_nWave2 {("G7" 17)}
wvSetPosition -win $_nWave2 {("G7" 20)}
wvSetPosition -win $_nWave2 {("G7" 17)}
wvSetPosition -win $_nWave2 {("G7" 20)}
wvSetPosition -win $_nWave2 {("G7" 20)}
wvSetPosition -win $_nWave2 {("G7" 20)}
wvSetPosition -win $_nWave2 {("G7" 20)}
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G7" 18 )} 
wvSelectSignal -win $_nWave2 {( "G7" 19 )} 
wvSelectSignal -win $_nWave2 {( "G7" 18 )} 
wvSetCursor -win $_nWave2 2401.021112 -snap {("G7" 18)}
srcActiveTrace \
           "tb_DandRiscvSmallest.u_DandRiscvSimple.DecodePlugin_hazard_load_use" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 2401000 -TraceValue 1
srcDeselectAll -win $_nTrace1
srcSelect -signal "memaccess_arbitration_isValid" -line 2201 -pos 1 -win \
          $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {2201 2201 9 60 1 11}
srcDeselectAll -win $_nTrace1
wvSetMarker -win $_nWave2 2401.000000
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G7" 1 18 )} 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
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
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
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
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
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
wvSelectSignal -win $_nWave2 {( "G2" 8 )} {( "G7" 1 18 )} 
wvSelectSignal -win $_nWave2 {( "G2" 2 8 )} {( "G7" 1 18 )} 
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
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
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
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
wvSelectSignal -win $_nWave2 {( "G2" 2 8 )} {( "G7" 1 6 18 )} 
wvSelectSignal -win $_nWave2 {( "G2" 2 8 )} {( "G7" 1 18 )} 
wvSelectSignal -win $_nWave2 {( "G2" 2 8 )} {( "G7" 1 6 18 )} 
wvSelectSignal -win $_nWave2 {( "G2" 2 8 )} {( "G7" 1 18 )} 
wvSelectSignal -win $_nWave2 {( "G2" 2 8 )} {( "G7" 1 6 18 )} 
wvSelectSignal -win $_nWave2 {( "G2" 2 8 )} {( "G7" 1 18 )} 
wvSelectSignal -win $_nWave2 {( "G2" 2 8 )} {( "G7" 1 10 18 )} 
wvSelectSignal -win $_nWave2 {( "G2" 2 8 )} {( "G7" 1 10 11 18 )} 
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 2
wvScrollUp -win $_nWave2 6
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 4
wvScrollUp -win $_nWave2 2
wvScrollUp -win $_nWave2 2
wvScrollUp -win $_nWave2 2
wvScrollUp -win $_nWave2 2
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 2
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
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
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSetCursor -win $_nWave2 2406.961100 -snap {("G2" 2)}
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
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
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G2" 2 8 )} {( "G7" 1 2 10 11 18 )} 
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G7" 16 )} 
wvSelectSignal -win $_nWave2 {( "G7" 16 17 )} 
wvSelectSignal -win $_nWave2 {( "G7" 16 17 )} 
wvSetRadix -win $_nWave2 -format UDec
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G7" 18 )} 
wvSelectSignal -win $_nWave2 {( "G7" 19 )} 
wvSelectSignal -win $_nWave2 {( "G7" 18 )} 
wvSelectSignal -win $_nWave2 {( "G7" 17 )} 
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 3
wvScrollUp -win $_nWave2 2
wvScrollUp -win $_nWave2 11
wvScrollUp -win $_nWave2 2
wvScrollUp -win $_nWave2 3
wvScrollUp -win $_nWave2 5
wvScrollUp -win $_nWave2 3
wvScrollUp -win $_nWave2 3
wvScrollUp -win $_nWave2 3
wvScrollUp -win $_nWave2 3
wvSelectSignal -win $_nWave2 {( "G2" 13 )} {( "G7" 17 )} 
wvSelectSignal -win $_nWave2 {( "G2" 13 14 )} {( "G7" 17 )} 
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
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
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSetMarker -win $_nWave2 2403.000000
wvScrollUp -win $_nWave2 1
wvZoomAll -win $_nWave2
wvZoom -win $_nWave2 0.000000 21789.434799
wvZoom -win $_nWave2 1706.450010 4580.047433
wvZoom -win $_nWave2 2220.236915 2859.285917
wvZoom -win $_nWave2 2384.543567 2485.346642
wvZoom -win $_nWave2 2395.305328 2428.223658
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
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 2
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 2
wvScrollUp -win $_nWave2 2
wvScrollUp -win $_nWave2 2
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 4
wvScrollUp -win $_nWave2 4
wvScrollUp -win $_nWave2 3
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 2
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 2
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
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
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
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
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSetCursor -win $_nWave2 2403.015052 -snap {("G7" 17)}
srcActiveTrace \
           "tb_DandRiscvSmallest.u_DandRiscvSimple.execute_ALUPlugin_branch_src2\[63:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 2401000 -TraceValue \
           0000000000000000000000000000000000000000000000000000000000000010
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 2
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 6
wvScrollUp -win $_nWave2 8
wvScrollUp -win $_nWave2 3
wvScrollUp -win $_nWave2 3
wvScrollUp -win $_nWave2 4
wvScrollUp -win $_nWave2 3
wvScrollUp -win $_nWave2 3
wvScrollUp -win $_nWave2 2
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
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
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
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 1
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
wvScrollDown -win $_nWave2 0
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
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 1
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
wvSetCursor -win $_nWave2 2403.088014 -snap {("G7" 17)}
srcActiveTrace \
           "tb_DandRiscvSmallest.u_DandRiscvSimple.execute_ALUPlugin_branch_src2\[63:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 2403000 -TraceValue \
           0000000000000000000000000000000000000000000000000000000000010011
srcDeselectAll -win $_nTrace1
srcSelect -signal "execute_RS2" -line 2117 -pos 1 -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G7" 4 )} 
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
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
wvSelectSignal -win $_nWave2 {( "G7" 3 4 )} 
wvSelectSignal -win $_nWave2 {( "G7" 3 4 )} 
wvSetRadix -win $_nWave2 -format UDec
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 3
wvScrollUp -win $_nWave2 3
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 2
wvScrollUp -win $_nWave2 4
wvScrollUp -win $_nWave2 2
wvScrollUp -win $_nWave2 2
wvScrollUp -win $_nWave2 2
wvScrollUp -win $_nWave2 2
wvScrollUp -win $_nWave2 3
wvScrollUp -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G2" 13 )} 
wvSelectSignal -win $_nWave2 {( "G2" 13 14 )} 
wvSelectSignal -win $_nWave2 {( "G2" 13 14 )} 
wvSetRadix -win $_nWave2 -format UDec
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 3
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 2
wvScrollDown -win $_nWave2 2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 2
wvScrollDown -win $_nWave2 2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 2
wvScrollDown -win $_nWave2 2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
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
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G7" 16 )} 
wvSelectSignal -win $_nWave2 {( "G7" 17 )} 
wvSelectSignal -win $_nWave2 {( "G7" 16 )} 
wvSelectSignal -win $_nWave2 {( "G7" 17 )} 
wvSelectSignal -win $_nWave2 {( "G7" 16 )} 
wvSetCursor -win $_nWave2 2402.978570 -snap {("G7" 17)}
srcActiveTrace \
           "tb_DandRiscvSmallest.u_DandRiscvSimple.execute_ALUPlugin_branch_src2\[63:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 2401000 -TraceValue \
           0000000000000000000000000000000000000000000000000000000000000010
