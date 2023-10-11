debImport "./simWorkspace/tb_DandRiscvSimple/tb_DandRiscvSimple.fsdb" "-f" \
          "./hw/verilog/tb/tb_DandRiscvSimple.f" "-sv" "-v2k"
wvCreateWindow
wvSetPosition -win $_nWave2 {("G1" 0)}
wvOpenFile -win $_nWave2 \
           {/home/lin/SpinalProjects/DandRiscvSoC/simWorkspace/tb_DandRiscvSimple/tb_DandRiscvSimple.fsdb}
srcDeselectAll -win $_nTrace1
srcHBSelect "tb_DandRiscvSimple.u_DandRiscvSimple" -win $_nTrace1
srcSetScope -win $_nTrace1 "tb_DandRiscvSimple.u_DandRiscvSimple" -delim "."
srcHBSelect "tb_DandRiscvSimple.u_DandRiscvSimple" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "icache_ar_valid" -line 8 -pos 1 -win $_nTrace1
srcSelect -signal "icache_ar_ready" -line 9 -pos 1 -win $_nTrace1
srcSelect -signal "icache_ar_payload_addr" -line 10 -pos 1 -win $_nTrace1
srcSelect -signal "icache_ar_payload_id" -line 11 -pos 1 -win $_nTrace1
srcSelect -signal "icache_ar_payload_len" -line 12 -pos 1 -win $_nTrace1
srcSelect -signal "icache_ar_payload_size" -line 13 -pos 1 -win $_nTrace1
srcSelect -signal "icache_ar_payload_burst" -line 14 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvZoom -win $_nWave2 0.000000 170704.225352
wvZoom -win $_nWave2 41233.485420 93286.252728
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
srcDeselectAll -win $_nTrace1
srcSelect -signal "icache_ar_valid" -line 8 -pos 1 -win $_nTrace1
srcAction -pos 7 3 8 -win $_nTrace1 -name "icache_ar_valid" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "iCache_1_next_level_cmd_valid" -line 3129 -pos 1 -win \
          $_nTrace1
srcAction -pos 3128 7 7 -win $_nTrace1 -name "iCache_1_next_level_cmd_valid" \
          -ctrlKey off
srcHBSelect "tb_DandRiscvSimple.u_DandRiscvSimple.iCache_1" -win $_nTrace1
srcSetScope -win $_nTrace1 "tb_DandRiscvSimple.u_DandRiscvSimple.iCache_1" -delim \
           "."
srcHBSelect "tb_DandRiscvSimple.u_DandRiscvSimple.iCache_1" -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G1" 1 )} 
wvSelectAll -win $_nWave2
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 0)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "sram_10_ports_cmd_payload_wdata" -line 26854 -pos 1 -win \
          $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "next_level_cmd_valid" -line 26893 -pos 1 -win $_nTrace1
srcSelect -signal "next_level_cmd_ready" -line 26894 -pos 1 -win $_nTrace1
srcSelect -signal "next_level_cmd_payload_addr" -line 26895 -pos 1 -win $_nTrace1
srcSelect -signal "next_level_cmd_payload_len" -line 26896 -pos 1 -win $_nTrace1
srcSelect -signal "next_level_cmd_payload_size" -line 26897 -pos 1 -win $_nTrace1
srcSelect -signal "next_level_rsp_valid" -line 26898 -pos 1 -win $_nTrace1
srcSelect -signal "next_level_rsp_payload_data" -line 26899 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 38709.663576 147507.278625
wvZoom -win $_nWave2 50202.369391 110883.856094
wvZoom -win $_nWave2 55287.648910 76996.237111
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 34244.533500 134165.190178
srcDeselectAll -win $_nTrace1
srcSelect -signal "cpu_cmd_valid" -line 26776 -pos 1 -win $_nTrace1
srcSelect -signal "cpu_cmd_ready" -line 26777 -pos 1 -win $_nTrace1
srcSelect -signal "cpu_cmd_payload_addr" -line 26778 -pos 1 -win $_nTrace1
srcSelect -signal "cpu_rsp_valid" -line 26779 -pos 1 -win $_nTrace1
srcSelect -toggle -signal "cpu_rsp_valid" -line 26779 -pos 1 -win $_nTrace1
srcSelect -signal "cpu_rsp_valid" -line 26779 -pos 1 -win $_nTrace1
srcSelect -signal "cpu_rsp_payload_data" -line 26780 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave2 {("G1" 0)}
wvSetPosition -win $_nWave2 {("G1" 1)}
wvSetPosition -win $_nWave2 {("G1" 2)}
wvSetPosition -win $_nWave2 {("G1" 3)}
wvSetPosition -win $_nWave2 {("G1" 4)}
wvSetPosition -win $_nWave2 {("G1" 5)}
wvSetPosition -win $_nWave2 {("G1" 6)}
wvSetPosition -win $_nWave2 {("G1" 7)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvAddSignal -win $_nWave2 \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/iCache_1/cpu_cmd_valid" \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/iCache_1/cpu_cmd_ready" \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/iCache_1/cpu_cmd_payload_addr\[63:0\]" \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/iCache_1/cpu_rsp_valid" \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/iCache_1/cpu_rsp_payload_data\[31:0\]"
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G2" 5)}
wvSetPosition -win $_nWave2 {("G2" 5)}
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 50663.994935 -snap {("G2" 1)}
wvZoom -win $_nWave2 45456.862122 105972.189406
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 51678.860561 -snap {("G2" 1)}
srcActiveTrace "tb_DandRiscvSimple.u_DandRiscvSimple.iCache_1.cpu_cmd_valid" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 51000 -TraceValue 1
srcDeselectAll -win $_nTrace1
srcSelect -signal "fetch_valid" -line 1644 -pos 1 -win $_nTrace1
srcSelect -signal "fetch_FetchPlugin_fetch_flush" -line 1644 -pos 1 -win \
          $_nTrace1
wvSetPosition -win $_nWave2 {("G1" 4)}
wvSetPosition -win $_nWave2 {("G1" 5)}
wvSetPosition -win $_nWave2 {("G1" 6)}
wvSetPosition -win $_nWave2 {("G1" 7)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G2" 1)}
wvSetPosition -win $_nWave2 {("G2" 2)}
wvSetPosition -win $_nWave2 {("G2" 3)}
wvSetPosition -win $_nWave2 {("G2" 4)}
wvSetPosition -win $_nWave2 {("G2" 5)}
wvSetPosition -win $_nWave2 {("G3" 0)}
wvAddSignal -win $_nWave2 "/tb_DandRiscvSimple/u_DandRiscvSimple/fetch_valid" \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/fetch_FetchPlugin_fetch_flush"
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSetPosition -win $_nWave2 {("G3" 2)}
wvSetPosition -win $_nWave2 {("G3" 2)}
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 24547.062335 218877.972485
srcDeselectAll -win $_nTrace1
srcSelect -signal "fetch_FetchPlugin_fetch_flush" -line 1644 -pos 1 -win \
          $_nTrace1
srcAction -pos 1643 15 11 -win $_nTrace1 -name "fetch_FetchPlugin_fetch_flush" \
          -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "when_FetchPlugin_l111" -line 1569 -pos 1 -win $_nTrace1
srcSelect -signal "pc_next_d1_valid" -line 1569 -pos 1 -win $_nTrace1
srcSelect -signal "fetch_arbitration_flushIt" -line 1569 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G3" 4 )} 
wvSetCursor -win $_nWave2 54928.373640 -snap {("G3" 4)}
srcActiveTrace "tb_DandRiscvSimple.u_DandRiscvSimple.pc_next_d1_valid" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 0 -TraceValue 0
srcDeselectAll -win $_nTrace1
srcSelect -signal "when_FetchPlugin_l109" -line 3265 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvSetCursor -win $_nWave2 52601.876828 -snap {("G3" 6)}
srcActiveTrace "tb_DandRiscvSimple.u_DandRiscvSimple.when_FetchPlugin_l109" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 0 -TraceValue 0
srcDeselectAll -win $_nTrace1
srcSelect -signal "fetch_state" -line 1617 -pos 1 -win $_nTrace1
srcSelect -signal "fetch_state_next" -line 1617 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
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
wvZoom -win $_nWave2 0.000000 1081126.760563
wvZoom -win $_nWave2 5329.498115 268758.976394
wvZoom -win $_nWave2 31486.932226 174146.980674
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 26522.713233 230265.373973
wvZoom -win $_nWave2 69279.975839 155655.385533
wvZoom -win $_nWave2 82418.770553 120071.149849
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 4 )} 
wvZoom -win $_nWave2 65759.084968 163761.334179
wvZoom -win $_nWave2 79424.187323 131462.001341
wvZoom -win $_nWave2 86570.225163 110390.351298
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 52987.202261 144778.561563
wvZoom -win $_nWave2 77615.728947 119115.766040
wvSetCursor -win $_nWave2 89188.978728 -snap {("G2" 2)}
wvZoom -win $_nWave2 86003.412500 103597.090197
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 29339.316047 181983.054941
wvSelectSignal -win $_nWave2 {( "G3" 6 )} 
wvZoom -win $_nWave2 81474.677571 118130.674024
wvSetCursor -win $_nWave2 92987.758147 -snap {("G2" 3)}
srcActiveTrace \
           "tb_DandRiscvSimple.u_DandRiscvSimple.iCache_1.cpu_cmd_payload_addr\[63:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 53000 -TraceValue \
           0000000000000000000000000000000010000000000000000000000000000100
srcDeselectAll -win $_nTrace1
srcSelect -signal "pc_next" -line 1645 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave2 {("G2" 5)}
wvSetPosition -win $_nWave2 {("G2" 4)}
wvSetPosition -win $_nWave2 {("G2" 5)}
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSetPosition -win $_nWave2 {("G3" 1)}
wvSetPosition -win $_nWave2 {("G3" 2)}
wvSetPosition -win $_nWave2 {("G3" 3)}
wvSetPosition -win $_nWave2 {("G3" 4)}
wvSetPosition -win $_nWave2 {("G3" 5)}
wvSetPosition -win $_nWave2 {("G3" 6)}
wvSetPosition -win $_nWave2 {("G3" 7)}
wvSetPosition -win $_nWave2 {("G3" 6)}
wvSetPosition -win $_nWave2 {("G3" 5)}
wvSetPosition -win $_nWave2 {("G3" 4)}
wvSetPosition -win $_nWave2 {("G3" 3)}
wvSetPosition -win $_nWave2 {("G3" 2)}
wvSetPosition -win $_nWave2 {("G3" 1)}
wvAddSignal -win $_nWave2 "/tb_DandRiscvSimple/u_DandRiscvSimple/pc_next\[63:0\]"
wvSetPosition -win $_nWave2 {("G3" 1)}
wvSetPosition -win $_nWave2 {("G3" 2)}
wvSelectSignal -win $_nWave2 {( "G3" 3 )} 
wvSelectSignal -win $_nWave2 {( "G3" 3 4 )} 
wvSelectSignal -win $_nWave2 {( "G3" 3 4 5 )} 
wvSelectSignal -win $_nWave2 {( "G3" 3 4 5 6 )} 
wvSelectSignal -win $_nWave2 {( "G3" 3 4 5 6 7 )} 
wvSelectSignal -win $_nWave2 {( "G3" 3 4 5 6 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G3" 2)}
wvSelectSignal -win $_nWave2 {( "G3" 2 )} 
wvZoom -win $_nWave2 90638.676684 104397.582395
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 83604.193905 106006.017851
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoom -win $_nWave2 77703.995204 129890.779439
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 41896.432414 162293.548719
wvZoom -win $_nWave2 80813.528459 124902.613303
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 42499.492756 146326.182699
wvSelectSignal -win $_nWave2 {( "G2" 2 )} {( "G3" 2 )} 
wvZoom -win $_nWave2 76791.547392 119638.336341
wvSelectSignal -win $_nWave2 {( "G2" 2 )} {( "G3" 2 3 )} 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 43902.110805 139492.693473
srcDeselectAll -win $_nTrace1
debReload
wvZoom -win $_nWave2 77560.766674 119701.403822
wvSetCursor -win $_nWave2 89015.897617 -snap {("G2" 2)}
wvZoom -win $_nWave2 86879.189255 106673.418112
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 1 )} 
wvSetCursor -win $_nWave2 102965.485101 -snap {("G2" 1)}
wvSetCursor -win $_nWave2 100902.424628 -snap {("G2" 1)}
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G3" 1 )} 
wvSetCursor -win $_nWave2 100902.424628 -snap {("G2" 1)}
srcActiveTrace "tb_DandRiscvSimple.u_DandRiscvSimple.iCache_1.cpu_cmd_valid" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 51000 -TraceValue 1
srcDeselectAll -win $_nTrace1
srcSelect -signal "fetch_FetchPlugin_fetch_flush" -line 1646 -pos 1 -win \
          $_nTrace1
srcAction -pos 1645 15 10 -win $_nTrace1 -name "fetch_FetchPlugin_fetch_flush" \
          -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "fetch_arbitration_flushIt" -line 1570 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "when_FetchPlugin_l110" -line 1570 -pos 1 -win $_nTrace1
srcSelect -signal "pc_next_d1_valid" -line 1570 -pos 1 -win $_nTrace1
srcSelect -signal "fetch_arbitration_flushIt" -line 1570 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G2" 1)}
wvSetPosition -win $_nWave2 {("G2" 2)}
wvSetPosition -win $_nWave2 {("G2" 3)}
wvSetPosition -win $_nWave2 {("G2" 4)}
wvSetPosition -win $_nWave2 {("G2" 5)}
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSetPosition -win $_nWave2 {("G3" 1)}
wvSetPosition -win $_nWave2 {("G3" 2)}
wvSetPosition -win $_nWave2 {("G3" 3)}
wvSetPosition -win $_nWave2 {("G3" 4)}
wvSetPosition -win $_nWave2 {("G4" 0)}
wvAddSignal -win $_nWave2 \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/when_FetchPlugin_l110" \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/pc_next_d1_valid" \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/fetch_arbitration_flushIt"
wvSetPosition -win $_nWave2 {("G4" 0)}
wvSetPosition -win $_nWave2 {("G4" 3)}
wvSetPosition -win $_nWave2 {("G4" 3)}
wvSelectSignal -win $_nWave2 {( "G4" 3 )} 
wvSetCursor -win $_nWave2 101013.941411 -snap {("G4" 3)}
srcActiveTrace "tb_DandRiscvSimple.u_DandRiscvSimple.fetch_arbitration_flushIt" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 0 -TraceValue 0
srcDeselectAll -win $_nTrace1
srcSelect -signal "when_FetchPlugin_l114" -line 2711 -pos 1 -win $_nTrace1
srcSelect -signal "when_FetchPlugin_l110" -line 2711 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvSetCursor -win $_nWave2 100874.545433 -snap {("G4" 4)}
srcActiveTrace "tb_DandRiscvSimple.u_DandRiscvSimple.when_FetchPlugin_l114" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 0 -TraceValue 0
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoom -win $_nWave2 96497.511728 113364.425050
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvSetCursor -win $_nWave2 102947.324357 -snap {("G2" 3)}
wvZoom -win $_nWave2 101343.779781 108613.181861
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
srcDeselectAll -win $_nTrace1
srcSelect -signal "execute_REDIRECT_PC_NEXT" -line 1521 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 103504.123216 148881.573945
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 101586.766143 157062.297456
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 7 )} 
wvSelectSignal -win $_nWave2 {( "G1" 6 )} 
wvSelectSignal -win $_nWave2 {( "G1" 7 )} 
wvZoom -win $_nWave2 99242.729608 162766.119690
wvZoom -win $_nWave2 105281.925144 137983.050602
wvZoom -win $_nWave2 106940.010379 121171.908641
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 133218.909846 160880.909286
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 103803.685090 178997.570891
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 100096.944241 142565.603686
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 130662.416039 172413.295324
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 81855.245022 259208.275903
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 65445.766325 313240.423556
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 0.000000 2361408.450704
wvZoom -win $_nWave2 0.000000 417403.888117
wvZoom -win $_nWave2 30864.372009 193416.731254
srcDeselectAll -win $_nTrace1
debReload
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 0.000000 417599.300370
wvZoom -win $_nWave2 32937.409607 225268.354988
wvZoom -win $_nWave2 87250.585028 181113.504147
wvZoom -win $_nWave2 100602.915776 159630.793785
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 97111.125809 162291.205189
wvZoom -win $_nWave2 104866.977907 150576.023405
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 96658.329251 172196.876414
wvZoom -win $_nWave2 104970.183230 148934.140437
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G3" 2 )} 
wvSelectSignal -win $_nWave2 {( "G3" 1 )} 
wvSelectAll -win $_nWave2
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G4" 0)}
wvSelectGroup -win $_nWave2 {G5}
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G4" 0)}
wvSelectGroup -win $_nWave2 {G4}
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G3" 0)}
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSelectGroup -win $_nWave2 {G2}
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 0)}
wvSelectGroup -win $_nWave2 {G1}
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 0)}
wvSelectGroup -win $_nWave2 {G1}
wvRestoreSignal -win $_nWave2 \
           "/home/lin/SpinalProjects/DandRiscvSoC/simWorkspace/tb_DandRiscvSimple/DandRiscvSimple_debug_total.rc" \
           -overWriteAutoAlias on -appendSignals on
wvSelectGroup -win $_nWave2 {G10}
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G11" 0)}
wvSetPosition -win $_nWave2 {("G11" 0)}
wvSetPosition -win $_nWave2 {("G11" 0)}
wvSetPosition -win $_nWave2 {("G11" 0)}
wvSelectGroup -win $_nWave2 {G9}
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G11" 0)}
wvSetPosition -win $_nWave2 {("G11" 0)}
wvSetPosition -win $_nWave2 {("G11" 0)}
wvSetPosition -win $_nWave2 {("G11" 0)}
wvSelectGroup -win $_nWave2 {G11}
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G8" 0)}
wvSetPosition -win $_nWave2 {("G8" 0)}
wvSetPosition -win $_nWave2 {("G8" 0)}
wvSetPosition -win $_nWave2 {("G8" 0)}
wvSelectGroup -win $_nWave2 {G8}
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G7" 0)}
wvSetPosition -win $_nWave2 {("G7" 0)}
wvSetPosition -win $_nWave2 {("G7" 0)}
wvSetPosition -win $_nWave2 {("G7" 0)}
wvSelectGroup -win $_nWave2 {G7}
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G6" 0)}
wvSetPosition -win $_nWave2 {("G6" 0)}
wvSetPosition -win $_nWave2 {("G6" 0)}
wvSetPosition -win $_nWave2 {("G6" 0)}
wvSelectGroup -win $_nWave2 {G6}
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G4" 0)}
wvSetPosition -win $_nWave2 {("G4" 0)}
wvSetPosition -win $_nWave2 {("G4" 0)}
wvSetPosition -win $_nWave2 {("G4" 0)}
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSetPosition -win $_nWave2 {("G3" 0)}
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSelectGroup -win $_nWave2 {G2}
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 0)}
wvSetPosition -win $_nWave2 {("G1" 0)}
srcHBSelect "tb_DandRiscvSimple.u_DandRiscvSimple" -win $_nTrace1
srcSetScope -win $_nTrace1 "tb_DandRiscvSimple.u_DandRiscvSimple" -delim "."
srcHBSelect "tb_DandRiscvSimple.u_DandRiscvSimple" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcHBSelect "tb_DandRiscvSimple.u_DandRiscvSimple" -win $_nTrace1
srcSetScope -win $_nTrace1 "tb_DandRiscvSimple.u_DandRiscvSimple" -delim "."
srcHBSelect "tb_DandRiscvSimple.u_DandRiscvSimple" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSearchString "writeback" -win $_nTrace1 -next -case
srcDeselectAll -win $_nTrace1
srcSelect -signal "writeback_RD" -line 326 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
srcSearchString "writeback_arb" -win $_nTrace1 -next -case
srcDeselectAll -win $_nTrace1
srcSelect -signal "writeback_arbitration_isValid" -line 491 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvZoom -win $_nWave2 16611.364956 16650.121112
srcSearchString "writeback_wen" -win $_nTrace1 -next -case
srcSearchString "writeback_" -win $_nTrace1 -next -case
srcDeselectAll -win $_nTrace1
srcSearchString "writeback_" -win $_nTrace1 -next -case
srcSearchString "writeback_RD_WEN" -win $_nTrace1 -next -case
srcSearchString "writeback_RD_WEN" -win $_nTrace1 -prev -case
srcSelect -win $_nTrace1 -range {355 355 4 5 1 1}
srcDeselectAll -win $_nTrace1
srcSelect -signal "writeback_RD_WEN" -line 355 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
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
wvSetCursor -win $_nWave2 43.534483 -snap {("G1" 1)}
wvZoom -win $_nWave2 0.000000 594.971264
wvZoom -win $_nWave2 70.097189 161.992895
wvZoom -win $_nWave2 93.401201 122.316660
wvZoomOut -win $_nWave2
srcSearchString "writeback_PC" -win $_nTrace1 -next -case
srcDeselectAll -win $_nTrace1
srcSelect -signal "writeback_PC" -line 384 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 93.235020 137.356022
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 138.448662 205.137303
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 77.420147 168.254675
wvZoom -win $_nWave2 94.125347 131.385775
wvZoom -win $_nWave2 98.167247 120.063102
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 143.469016 170.650077
wvZoomOut -win $_nWave2
srcDeselectAll -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G1" 3 )} 
wvSelectSignal -win $_nWave2 {( "G1" 1 )} 
srcDeselectAll -win $_nTrace1
debReload
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 77.169221 184.018911
wvZoom -win $_nWave2 97.971136 117.698413
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 126.753427 192.284268
wvZoom -win $_nWave2 145.207515 164.179446
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 4 )} 
wvSetCursor -win $_nWave2 151.095355 -snap {("G1" 4)}
srcActiveTrace "tb_DandRiscvSimple.u_DandRiscvSimple.writeback_PC\[63:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 151000 -TraceValue \
           0000000000000000000000000000000000000000000000000000000000000100
srcDeselectAll -win $_nTrace1
srcSelect -signal "memaccess_to_writeback_PC" -line 1467 -pos 1 -win $_nTrace1
srcAction -pos 1466 7 9 -win $_nTrace1 -name "memaccess_to_writeback_PC" -ctrlKey \
          off
srcDeselectAll -win $_nTrace1
srcSelect -signal "fetch_PC" -line 3375 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave2 {("G1" 0)}
wvSetPosition -win $_nWave2 {("G1" 1)}
wvSetPosition -win $_nWave2 {("G1" 2)}
wvSetPosition -win $_nWave2 {("G1" 3)}
wvSetPosition -win $_nWave2 {("G1" 4)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvAddSignal -win $_nWave2 \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/fetch_PC\[63:0\]"
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G2" 1)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G2" 1)}
wvSetPosition -win $_nWave2 {("G2" 1)}
wvSetPosition -win $_nWave2 {("G2" 1)}
wvSetPosition -win $_nWave2 {("G2" 1)}
wvSetPosition -win $_nWave2 {("G2" 1)}
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 137.902230 152.948935
wvSetCursor -win $_nWave2 142.971846 -snap {("G2" 1)}
srcActiveTrace "tb_DandRiscvSimple.u_DandRiscvSimple.fetch_PC\[63:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 103000 -TraceValue \
           0000000000000000000000000000000000000000000000000000000000000000
srcDeselectAll -win $_nTrace1
srcSelect -signal "fetch_FetchPlugin_pc_out_stream_payload" -line 1465 -pos 1 \
          -win $_nTrace1
srcAction -pos 1464 7 7 -win $_nTrace1 -name \
          "fetch_FetchPlugin_pc_out_stream_payload" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "fetch_FetchPlugin_pc_stream_fifo_ports_m_ports_payload" -line \
          1630 -pos 1 -win $_nTrace1
srcAction -pos 1629 7 4 -win $_nTrace1 -name \
          "fetch_FetchPlugin_pc_stream_fifo_ports_m_ports_payload" -ctrlKey \
          off
srcDeselectAll -win $_nTrace1
srcSelect -signal "_zz_ports_m_ports_payload" -line 53210 -pos 1 -win $_nTrace1
srcAction -pos 53209 7 14 -win $_nTrace1 -name "_zz_ports_m_ports_payload" \
          -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "fifo_ram_1" -line 53185 -pos 1 -win $_nTrace1
srcAction -pos 53184 9 4 -win $_nTrace1 -name "fifo_ram_1" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "ports_s_ports_payload" -line 53260 -pos 1 -win $_nTrace1
srcAction -pos 53259 5 7 -win $_nTrace1 -name "ports_s_ports_payload" -ctrlKey \
          off
srcDeselectAll -win $_nTrace1
srcSelect -signal "pc_next" -line 1626 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 100.198994 107.203494
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 93.999608 109.981141
wvSetCursor -win $_nWave2 101.163744 -snap {("G2" 2)}
srcActiveTrace "tb_DandRiscvSimple.u_DandRiscvSimple.pc_next\[63:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 101000 -TraceValue \
           0000000000000000000000000000000000000000000000000000000000000000
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
wvZoom -win $_nWave2 76.784834 187.002300
wvZoom -win $_nWave2 91.591347 124.213184
wvSetCursor -win $_nWave2 101.035744 -snap {("G2" 2)}
srcActiveTrace "tb_DandRiscvSimple.u_DandRiscvSimple.pc_next\[63:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 99000 -TraceValue \
           0000000000000000000000000000000010000000000000000000000000011000
srcDeselectAll -win $_nTrace1
srcSelect -signal "when_FetchPlugin_l114" -line 3303 -pos 1 -win $_nTrace1
srcSelect -signal "_zz_pc_next" -line 3304 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvSetCursor -win $_nWave2 98.973444 -snap {("G2" 4)}
srcActiveTrace "tb_DandRiscvSimple.u_DandRiscvSimple._zz_pc_next\[63:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 97000 -TraceValue \
           0000000000000000000000000000000010000000000000000000000000001000
srcDeselectAll -win $_nTrace1
srcSelect -signal "execute_REDIRECT_PC_NEXT" -line 1521 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 90.841420 117.182615
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 55.710114 201.343619
wvZoom -win $_nWave2 88.770594 130.828545
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 88.287169 124.906592
srcSearchString "decode_INS" -win $_nTrace1 -next -case
srcDeselectAll -win $_nTrace1
srcSelect -signal "decode_INSTRUCTION\[6 : 0\]" -line 1648 -pos 1 -win $_nTrace1
srcAction -pos 1647 13 8 -win $_nTrace1 -name "decode_INSTRUCTION\[6 : 0\]" \
          -ctrlKey off
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 83.972811 119.329496
wvZoom -win $_nWave2 91.313388 110.033127
srcDeselectAll -win $_nTrace1
srcSelect -signal "decode_PC" -line 1517 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
srcDeselectAll -win $_nTrace1
debReload
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 95.078853 112.319302
wvSetCursor -win $_nWave2 100.986679 -snap {("G2" 4)}
wvSelectSignal -win $_nWave2 {( "G2" 7 )} 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 98.348593 121.682649
wvSelectSignal -win $_nWave2 {( "G1" 3 )} 
wvSelectSignal -win $_nWave2 {( "G1" 2 )} 
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 97.007555 123.828310
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 144.020947 159.897600
wvSelectSignal -win $_nWave2 {( "G1" 4 )} 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 184.260051 208.075032
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 186.997405 227.099642
wvZoom -win $_nWave2 198.953173 211.139413
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 71.417867 251.830249
wvZoom -win $_nWave2 136.869198 201.024463
wvZoom -win $_nWave2 144.934695 169.684248
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 144.223501 175.089322
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 184.047506 205.422974
wvSetCursor -win $_nWave2 201.061888 -snap {("G1" 2)}
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 1 4 )} 
wvZoom -win $_nWave2 198.144259 207.941349
wvSetCursor -win $_nWave2 204.999406 -snap {("G1" 4)}
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 203.591779 209.348976
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 3 )} 
wvSelectSignal -win $_nWave2 {( "G2" 4 )} 
wvSelectSignal -win $_nWave2 {( "G2" 3 4 )} 
wvSelectSignal -win $_nWave2 {( "G2" 3 4 5 )} 
wvSelectSignal -win $_nWave2 {( "G2" 3 4 5 6 )} 
wvSelectSignal -win $_nWave2 {( "G2" 3 4 5 6 7 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G2" 2)}
wvSetPosition -win $_nWave2 {("G2" 2)}
wvSetPosition -win $_nWave2 {("G2" 2)}
wvSetPosition -win $_nWave2 {("G2" 2)}
srcSearchString "decode_arb" -win $_nTrace1 -next -case
srcSearchString "decode_arb" -win $_nTrace1 -prev -case
srcSelect -win $_nTrace1 -range {463 463 4 4 1 11}
srcDeselectAll -win $_nTrace1
srcSelect -signal "decode_arbitration_isValid" -line 458 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvSetPosition -win $_nWave2 {("G3" 0)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G3" 1)}
wvSetPosition -win $_nWave2 {("G3" 1)}
wvSetPosition -win $_nWave2 {("G3" 1)}
wvSetPosition -win $_nWave2 {("G3" 1)}
wvSetPosition -win $_nWave2 {("G3" 1)}
srcSearchString "decode_PC" -win $_nTrace1 -prev -case
srcSelect -win $_nTrace1 -range {434 434 10 11 1 1}
srcDeselectAll -win $_nTrace1
srcSelect -signal "decode_PC" -line 434 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
srcSearchString "execute_PC" -win $_nTrace1 -next -case
srcSearchString "execute_PC" -win $_nTrace1 -prev -case
srcSelect -win $_nTrace1 -range {426 426 10 11 1 1}
srcDeselectAll -win $_nTrace1
srcSelect -signal "execute_PC" -line 426 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave2 {("G2" 1)}
wvSetPosition -win $_nWave2 {("G2" 2)}
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSetPosition -win $_nWave2 {("G3" 1)}
wvSetPosition -win $_nWave2 {("G3" 2)}
wvSetPosition -win $_nWave2 {("G4" 0)}
wvAddSignal -win $_nWave2 \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/execute_PC\[63:0\]"
wvSetPosition -win $_nWave2 {("G4" 0)}
wvSetPosition -win $_nWave2 {("G4" 1)}
wvSetPosition -win $_nWave2 {("G4" 0)}
wvSetPosition -win $_nWave2 {("G4" 1)}
wvSetPosition -win $_nWave2 {("G4" 1)}
wvSetPosition -win $_nWave2 {("G4" 1)}
wvSetPosition -win $_nWave2 {("G4" 1)}
wvSetPosition -win $_nWave2 {("G4" 1)}
srcSearchString "execute_arb" -win $_nTrace1 -next -case
srcDeselectAll -win $_nTrace1
srcSelect -signal "execute_arbitration_isValid" -line 469 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvSetPosition -win $_nWave2 {("G4" 1)}
wvSetPosition -win $_nWave2 {("G4" 0)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G4" 0)}
wvSetPosition -win $_nWave2 {("G4" 1)}
wvSetPosition -win $_nWave2 {("G4" 1)}
wvSetPosition -win $_nWave2 {("G4" 1)}
wvSetPosition -win $_nWave2 {("G4" 1)}
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvSetMarker -win $_nWave2 201.000000
srcSearchString "execute_ALU" -win $_nTrace1 -next -case
srcSearchString "execute_ALU_RE" -win $_nTrace1 -next -case
srcDeselectAll -win $_nTrace1
srcSelect -signal "execute_ALU_RESULT" -line 1424 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvSetPosition -win $_nWave2 {("G4" 3)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G4" 3)}
wvSetPosition -win $_nWave2 {("G4" 3)}
wvSetPosition -win $_nWave2 {("G4" 3)}
wvSetPosition -win $_nWave2 {("G4" 3)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "memaccess_RD_ADDR" -line 1436 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "memaccess_RD_ADDR" -line 1436 -pos 1 -win $_nTrace1
srcSearchString "memaccess_LSU_H" -win $_nTrace1 -next -case
srcDeselectAll -win $_nTrace1
srcSelect -signal "memaccess_LSU_HOLD" -line 2716 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave2 {("G4" 2)}
wvSetPosition -win $_nWave2 {("G4" 3)}
wvSetPosition -win $_nWave2 {("G5" 0)}
wvAddSignal -win $_nWave2 \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/memaccess_LSU_HOLD"
wvSetPosition -win $_nWave2 {("G5" 0)}
wvSetPosition -win $_nWave2 {("G5" 1)}
wvSetPosition -win $_nWave2 {("G5" 0)}
wvSetPosition -win $_nWave2 {("G5" 1)}
wvSetPosition -win $_nWave2 {("G5" 1)}
wvSetPosition -win $_nWave2 {("G5" 1)}
wvSetPosition -win $_nWave2 {("G5" 1)}
wvSetPosition -win $_nWave2 {("G5" 1)}
srcSearchString "memaccess_PC" -win $_nTrace1 -next -case
srcSearchString "memaccess_PC" -win $_nTrace1 -prev -case
srcSelect -win $_nTrace1 -range {1518 1518 4 5 16 1}
srcSearchString "memaccess_PC" -win $_nTrace1 -prev -case
srcSelect -win $_nTrace1 -range {1464 1464 8 9 12 1}
srcDeselectAll -win $_nTrace1
srcSelect -signal "memaccess_PC" -line 1464 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSetPosition -win $_nWave2 {("G3" 1)}
wvSetPosition -win $_nWave2 {("G3" 2)}
wvSetPosition -win $_nWave2 {("G4" 0)}
wvSetPosition -win $_nWave2 {("G4" 1)}
wvSetPosition -win $_nWave2 {("G4" 2)}
wvSetPosition -win $_nWave2 {("G4" 3)}
wvSetPosition -win $_nWave2 {("G5" 0)}
wvAddSignal -win $_nWave2 \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/memaccess_PC\[63:0\]"
wvSetPosition -win $_nWave2 {("G5" 0)}
wvSetPosition -win $_nWave2 {("G5" 1)}
wvSetPosition -win $_nWave2 {("G5" 0)}
wvSetPosition -win $_nWave2 {("G5" 1)}
wvSetPosition -win $_nWave2 {("G5" 1)}
wvSetPosition -win $_nWave2 {("G5" 1)}
wvSetPosition -win $_nWave2 {("G5" 1)}
srcSearchString "memaccess_arb" -win $_nTrace1 -next -case
srcSearchString "memaccess_arb" -win $_nTrace1 -prev -case
srcSelect -win $_nTrace1 -range {1411 1411 19 19 1 14}
srcSearchString "memaccess_arb" -win $_nTrace1 -prev -case
srcSelect -win $_nTrace1 -range {485 485 4 4 1 14}
srcDeselectAll -win $_nTrace1
srcSelect -signal "memaccess_arbitration_isValid" -line 480 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave2 {("G4" 0)}
wvSetPosition -win $_nWave2 {("G4" 1)}
wvSetPosition -win $_nWave2 {("G4" 2)}
wvSetPosition -win $_nWave2 {("G4" 3)}
wvSetPosition -win $_nWave2 {("G5" 0)}
wvSetPosition -win $_nWave2 {("G5" 1)}
wvSetPosition -win $_nWave2 {("G5" 0)}
wvAddSignal -win $_nWave2 \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/memaccess_arbitration_isValid"
wvSetPosition -win $_nWave2 {("G5" 0)}
wvSetPosition -win $_nWave2 {("G5" 1)}
wvSetPosition -win $_nWave2 {("G5" 0)}
wvSetPosition -win $_nWave2 {("G5" 1)}
wvSetPosition -win $_nWave2 {("G5" 1)}
wvSetPosition -win $_nWave2 {("G5" 1)}
wvSetPosition -win $_nWave2 {("G5" 1)}
wvSetMarker -win $_nWave2 203.000000
wvSetCursor -win $_nWave2 205.031078 -snap {("G5" 3)}
srcActiveTrace "tb_DandRiscvSimple.u_DandRiscvSimple.memaccess_LSU_HOLD" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 189000 -TraceValue 0
srcDeselectAll -win $_nTrace1
srcSelect -signal "DCachePlugin_dcache_access_stall" -line 1410 -pos 1 -win \
          $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "DCachePlugin_dcache_access_stall" -line 1410 -pos 1 -win \
          $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvSetPosition -win $_nWave2 {("G5" 3)}
wvSetPosition -win $_nWave2 {("G5" 4)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G5" 4)}
wvSetPosition -win $_nWave2 {("G5" 4)}
wvSetPosition -win $_nWave2 {("G5" 4)}
wvSetPosition -win $_nWave2 {("G5" 4)}
srcDeselectAll -win $_nTrace1
debReload
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 127.325452 236.646035
wvZoom -win $_nWave2 142.796828 181.907208
wvZoom -win $_nWave2 147.741818 161.621508
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
wvZoom -win $_nWave2 0.000000 1828.448276
wvZoom -win $_nWave2 0.000000 405.883992
wvSelectSignal -win $_nWave2 {( "G5" 4 )} 
wvZoom -win $_nWave2 117.216498 202.067246
wvZoom -win $_nWave2 141.050293 169.211964
wvSelectSignal -win $_nWave2 {( "G1" 4 )} 
wvSetCursor -win $_nWave2 151.307453 -snap {("G1" 1)}
wvSelectSignal -win $_nWave2 {( "G5" 4 )} 
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G5" 4 )} 
wvSelectSignal -win $_nWave2 {( "G5" 3 4 )} 
wvSetCursor -win $_nWave2 151.327684 -snap {("G5" 3)}
srcActiveTrace "tb_DandRiscvSimple.u_DandRiscvSimple.memaccess_LSU_HOLD" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 151000 -TraceValue 1
srcDeselectAll -win $_nTrace1
srcSelect -signal "DCachePlugin_dcache_access_cmd_ready" -line 1410 -pos 1 -win \
          $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvSetCursor -win $_nWave2 153.108020 -snap {("G5" 5)}
wvZoom -win $_nWave2 146.027140 169.980745
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 146.929463 161.572874
wvSelectSignal -win $_nWave2 {( "G5" 1 )} 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G5" 2 )} 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoom -win $_nWave2 145.046202 173.976097
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G5" 1 )} 
wvSetCursor -win $_nWave2 151.179191 -snap {("G5" 2)}
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G5" 5 )} 
wvSelectSignal -win $_nWave2 {( "G5" 4 )} 
wvSelectSignal -win $_nWave2 {( "G5" 5 )} 
wvSelectSignal -win $_nWave2 {( "G5" 4 )} 
wvZoom -win $_nWave2 158.638985 170.812180
wvSetCursor -win $_nWave2 163.011653 -snap {("G5" 4)}
srcActiveTrace \
           "tb_DandRiscvSimple.u_DandRiscvSimple.DCachePlugin_dcache_access_stall" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 153000 -TraceValue 0
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G5" 5 )} 
wvSelectSignal -win $_nWave2 {( "G5" 4 )} 
wvSetCursor -win $_nWave2 162.835965 -snap {("G5" 4)}
srcActiveTrace \
           "tb_DandRiscvSimple.u_DandRiscvSimple.DCachePlugin_dcache_access_stall" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 153000 -TraceValue 0
srcDeselectAll -win $_nTrace1
srcSelect -signal "dCache_1_stall" -line 3141 -pos 1 -win $_nTrace1
srcAction -pos 3140 7 5 -win $_nTrace1 -name "dCache_1_stall" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "is_miss" -line 11507 -pos 1 -win $_nTrace1
srcSelect -signal "is_write" -line 11507 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G5" 3 )} 
wvSelectSignal -win $_nWave2 {( "G5" 2 )} 
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
srcHBSelect "tb_DandRiscvSimple.u_DandRiscvSimple" -win $_nTrace1
srcSetScope -win $_nTrace1 "tb_DandRiscvSimple.u_DandRiscvSimple" -delim "."
srcHBSelect "tb_DandRiscvSimple.u_DandRiscvSimple" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "dcache_aw_valid" -line 34 -pos 1 -win $_nTrace1
srcSelect -signal "dcache_aw_ready" -line 35 -pos 1 -win $_nTrace1
srcSelect -signal "dcache_aw_payload_addr" -line 36 -pos 1 -win $_nTrace1
srcSelect -signal "dcache_aw_payload_id" -line 37 -pos 1 -win $_nTrace1
srcSelect -toggle -signal "dcache_aw_payload_id" -line 37 -pos 1 -win $_nTrace1
srcSelect -signal "dcache_aw_payload_len" -line 38 -pos 1 -win $_nTrace1
srcSelect -signal "dcache_aw_payload_size" -line 39 -pos 1 -win $_nTrace1
srcSelect -signal "dcache_aw_payload_burst" -line 40 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave2 {("G1" 1)}
wvSetPosition -win $_nWave2 {("G5" 2)}
wvSetPosition -win $_nWave2 {("G5" 7)}
wvSetPosition -win $_nWave2 {("G6" 0)}
wvAddSignal -win $_nWave2 "/tb_DandRiscvSimple/u_DandRiscvSimple/dcache_aw_valid" \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/dcache_aw_ready" \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/dcache_aw_payload_addr\[63:0\]" \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/dcache_aw_payload_len\[7:0\]" \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/dcache_aw_payload_size\[2:0\]" \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/dcache_aw_payload_burst\[1:0\]"
wvSetPosition -win $_nWave2 {("G6" 0)}
wvSetPosition -win $_nWave2 {("G6" 6)}
wvSetPosition -win $_nWave2 {("G6" 0)}
wvSetPosition -win $_nWave2 {("G6" 6)}
wvSetPosition -win $_nWave2 {("G6" 6)}
wvSetPosition -win $_nWave2 {("G6" 6)}
wvSetPosition -win $_nWave2 {("G6" 6)}
wvSetPosition -win $_nWave2 {("G6" 6)}
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
srcDeselectAll -win $_nTrace1
srcSelect -signal "dcache_w_valid" -line 41 -pos 1 -win $_nTrace1
srcSelect -signal "dcache_w_ready" -line 42 -pos 1 -win $_nTrace1
srcSelect -signal "dcache_w_payload_data" -line 43 -pos 1 -win $_nTrace1
srcSelect -signal "dcache_w_payload_strb" -line 44 -pos 1 -win $_nTrace1
srcSelect -signal "dcache_w_payload_last" -line 45 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSelectSignal -win $_nWave2 {( "G6" 4 )} 
wvScrollDown -win $_nWave2 0
srcDeselectAll -win $_nTrace1
srcSelect -signal "dcache_b_valid" -line 46 -pos 1 -win $_nTrace1
srcSelect -signal "dcache_b_ready" -line 47 -pos 1 -win $_nTrace1
srcSelect -signal "dcache_b_payload_id" -line 48 -pos 1 -win $_nTrace1
srcSelect -signal "dcache_b_payload_resp" -line 49 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G5" 6 )} 
wvSelectSignal -win $_nWave2 {( "G5" 7 )} 
wvSelectSignal -win $_nWave2 {( "G5" 6 )} 
wvSelectSignal -win $_nWave2 {( "G6" 1 )} 
wvSetCursor -win $_nWave2 159.056730 -snap {("G6" 1)}
srcActiveTrace "tb_DandRiscvSimple.u_DandRiscvSimple.dcache_aw_valid" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 153000 -TraceValue 1
srcDeselectAll -win $_nTrace1
srcSelect -signal "dCache_1_next_level_cmd_valid" -line 3160 -pos 1 -win \
          $_nTrace1
srcAction -pos 3159 8 12 -win $_nTrace1 -name "dCache_1_next_level_cmd_valid" \
          -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "next_level_cmd_valid_1" -line 11514 -pos 1 -win $_nTrace1
srcAction -pos 11513 7 8 -win $_nTrace1 -name "next_level_cmd_valid_1" -ctrlKey \
          off
wvSelectSignal -win $_nWave2 {( "G6" 12 )} 
wvSetCursor -win $_nWave2 161.180598 -snap {("G6" 12)}
srcDeselectAll -win $_nTrace1
debReload
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoom -win $_nWave2 147.016276 188.056889
wvSelectSignal -win $_nWave2 {( "G6" 1 )} 
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
srcDeselectAll -win $_nTrace1
debReload
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G6" 2 )} 
wvSelectSignal -win $_nWave2 {( "G6" 1 )} 
wvSetCursor -win $_nWave2 155.177014 -snap {("G6" 1)}
wvSelectSignal -win $_nWave2 {( "G6" 3 )} 
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 148.398336 180.093589
wvSelectSignal -win $_nWave2 {( "G6" 1 )} 
wvSelectSignal -win $_nWave2 {( "G6" 2 )} 
wvSelectSignal -win $_nWave2 {( "G6" 4 )} 
wvSelectSignal -win $_nWave2 {( "G6" 3 )} 
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvSetCursor -win $_nWave2 154.965088 -snap {("G6" 1)}
srcActiveTrace "tb_DandRiscvSimple.u_DandRiscvSimple.dcache_aw_valid" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 0 -TraceValue 0
wvSelectSignal -win $_nWave2 {( "G6" 1 )} 
srcDeselectAll -win $_nTrace1
srcSelect -signal "when_DCachePlugin_l127" -line 3335 -pos 1 -win $_nTrace1
srcAction -pos 3334 3 10 -win $_nTrace1 -name "when_DCachePlugin_l127" -ctrlKey \
          off
wvSelectSignal -win $_nWave2 {( "G5" 4 )} 
srcDeselectAll -win $_nTrace1
srcSelect -signal "dCache_1_next_level_cmd_valid" -line 3153 -pos 1 -win \
          $_nTrace1
srcAction -pos 3152 8 22 -win $_nTrace1 -name "dCache_1_next_level_cmd_valid" \
          -ctrlKey off
srcDeselectAll -win $_nTrace1
debReload
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 146.436443 206.289441
wvSelectSignal -win $_nWave2 {( "G5" 6 )} 
wvSelectSignal -win $_nWave2 {( "G5" 7 )} 
wvSelectSignal -win $_nWave2 {( "G5" 7 )} 
wvSelectSignal -win $_nWave2 {( "G5" 6 )} 
wvSelectSignal -win $_nWave2 {( "G6" 1 )} 
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
wvSetCursor -win $_nWave2 150.544378 -snap {("G6" 1)}
wvSetCursor -win $_nWave2 6.449842 -snap {("G6" 1)}
srcActiveTrace "tb_DandRiscvSimple.u_DandRiscvSimple.dcache_aw_valid" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 0 -TraceValue 0
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
srcDeselectAll -win $_nTrace1
srcSelect -signal "when_DCachePlugin_l127" -line 3335 -pos 1 -win $_nTrace1
srcAction -pos 3334 3 14 -win $_nTrace1 -name "when_DCachePlugin_l127" -ctrlKey \
          off
srcDeselectAll -win $_nTrace1
srcSelect -signal "dCache_1_next_level_cmd_valid" -line 3153 -pos 1 -win \
          $_nTrace1
srcSelect -signal "dCache_1_next_level_cmd_payload_wen" -line 3153 -pos 1 -win \
          $_nTrace1
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G1" 4)}
wvSetPosition -win $_nWave2 {("G2" 1)}
wvSetPosition -win $_nWave2 {("G5" 2)}
wvSetPosition -win $_nWave2 {("G6" 6)}
wvSetPosition -win $_nWave2 {("G6" 7)}
wvSetPosition -win $_nWave2 {("G6" 8)}
wvSetPosition -win $_nWave2 {("G6" 9)}
wvSetPosition -win $_nWave2 {("G6" 10)}
wvSetPosition -win $_nWave2 {("G6" 11)}
wvSetPosition -win $_nWave2 {("G6" 12)}
wvSetPosition -win $_nWave2 {("G6" 13)}
wvSetPosition -win $_nWave2 {("G6" 14)}
wvSetPosition -win $_nWave2 {("G6" 15)}
wvSetPosition -win $_nWave2 {("G7" 0)}
wvSetPosition -win $_nWave2 {("G5" 2)}
wvSetPosition -win $_nWave2 {("G7" 0)}
wvSetPosition -win $_nWave2 {("G6" 15)}
wvAddSignal -win $_nWave2 \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/dCache_1_next_level_cmd_valid" \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/dCache_1_next_level_cmd_payload_wen"
wvSetPosition -win $_nWave2 {("G6" 15)}
wvSetPosition -win $_nWave2 {("G6" 17)}
wvSetPosition -win $_nWave2 {("G6" 15)}
wvSetPosition -win $_nWave2 {("G6" 17)}
wvSetPosition -win $_nWave2 {("G6" 17)}
wvSetPosition -win $_nWave2 {("G6" 17)}
wvSetPosition -win $_nWave2 {("G6" 17)}
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 17.199579 343.991576
wvZoom -win $_nWave2 128.715514 230.379477
wvSelectSignal -win $_nWave2 {( "G6" 17 )} 
wvSetCursor -win $_nWave2 152.713165 -snap {("G6" 16)}
srcActiveTrace \
           "tb_DandRiscvSimple.u_DandRiscvSimple.dCache_1_next_level_cmd_valid" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 0 -TraceValue 0
srcDeselectAll -win $_nTrace1
debReload
wvZoom -win $_nWave2 143.648835 182.188541
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 138.939525 182.645876
wvSelectSignal -win $_nWave2 {( "G6" 1 )} 
wvSelectSignal -win $_nWave2 {( "G6" 2 )} 
wvSelectSignal -win $_nWave2 {( "G6" 11 )} 
wvSelectSignal -win $_nWave2 {( "G6" 12 )} 
wvSelectSignal -win $_nWave2 {( "G6" 11 )} 
wvSelectSignal -win $_nWave2 {( "G5" 4 )} 
wvSelectSignal -win $_nWave2 {( "G5" 3 )} 
wvSelectSignal -win $_nWave2 {( "G5" 4 )} 
wvSelectSignal -win $_nWave2 {( "G5" 5 )} 
wvSetCursor -win $_nWave2 153.041061 -snap {("G5" 5)}
srcActiveTrace \
           "tb_DandRiscvSimple.u_DandRiscvSimple.DCachePlugin_dcache_access_cmd_ready" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 0 -TraceValue 1
srcDeselectAll -win $_nTrace1
srcSelect -signal "dCache_1_cpu_cmd_ready" -line 3142 -pos 1 -win $_nTrace1
srcAction -pos 3141 7 9 -win $_nTrace1 -name "dCache_1_cpu_cmd_ready" -ctrlKey \
          off
srcDeselectAll -win $_nTrace1
srcSelect -signal "cpu_cmd_ready_1" -line 11537 -pos 1 -win $_nTrace1
srcAction -pos 11536 7 5 -win $_nTrace1 -name "cpu_cmd_ready_1" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "when_DCache_l240" -line 15813 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave2 {("G5" 1)}
wvSetPosition -win $_nWave2 {("G5" 2)}
wvSetPosition -win $_nWave2 {("G5" 3)}
wvSetPosition -win $_nWave2 {("G5" 4)}
wvSetPosition -win $_nWave2 {("G5" 5)}
wvSetPosition -win $_nWave2 {("G5" 6)}
wvSetPosition -win $_nWave2 {("G5" 7)}
wvAddSignal -win $_nWave2 \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/dCache_1/when_DCache_l240"
wvSetPosition -win $_nWave2 {("G5" 7)}
wvSetPosition -win $_nWave2 {("G5" 8)}
wvSetPosition -win $_nWave2 {("G5" 7)}
wvSetPosition -win $_nWave2 {("G5" 8)}
wvSetPosition -win $_nWave2 {("G5" 8)}
wvSetPosition -win $_nWave2 {("G5" 8)}
wvSetPosition -win $_nWave2 {("G5" 8)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "cpu_cmd_ready_1" -line 15814 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave2 {("G5" 2)}
wvSetPosition -win $_nWave2 {("G5" 3)}
wvSetPosition -win $_nWave2 {("G5" 4)}
wvSetPosition -win $_nWave2 {("G5" 5)}
wvSetPosition -win $_nWave2 {("G5" 6)}
wvSetPosition -win $_nWave2 {("G5" 7)}
wvAddSignal -win $_nWave2 \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/dCache_1/cpu_cmd_ready_1"
wvSetPosition -win $_nWave2 {("G5" 7)}
wvSetPosition -win $_nWave2 {("G5" 8)}
wvSetPosition -win $_nWave2 {("G5" 7)}
wvSetPosition -win $_nWave2 {("G5" 8)}
wvSetPosition -win $_nWave2 {("G5" 8)}
wvSetPosition -win $_nWave2 {("G5" 8)}
wvSetPosition -win $_nWave2 {("G5" 8)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "cpu_cmd_ready_1" -line 15814 -pos 1 -win $_nTrace1
srcAction -pos 15813 1 6 -win $_nTrace1 -name "cpu_cmd_ready_1" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "when_DCache_l240" -line 15813 -pos 1 -win $_nTrace1
srcAction -pos 15812 3 8 -win $_nTrace1 -name "when_DCache_l240" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "flush_done" -line 10455 -pos 1 -win $_nTrace1
srcSelect -signal "next_level_rdone" -line 10455 -pos 1 -win $_nTrace1
srcSelect -signal "next_level_wdone" -line 10455 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave2 {("G5" 9)}
wvAddSignal -win $_nWave2 \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/dCache_1/flush_done" \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/dCache_1/next_level_rdone" \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/dCache_1/next_level_wdone"
wvSetPosition -win $_nWave2 {("G5" 9)}
wvSetPosition -win $_nWave2 {("G5" 12)}
wvSetPosition -win $_nWave2 {("G5" 9)}
wvSetPosition -win $_nWave2 {("G5" 12)}
wvSetPosition -win $_nWave2 {("G5" 12)}
wvSetPosition -win $_nWave2 {("G5" 12)}
wvSetPosition -win $_nWave2 {("G5" 12)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "next_level_wdone" -line 10455 -pos 1 -win $_nTrace1
srcAction -pos 10454 18 8 -win $_nTrace1 -name "next_level_wdone" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "next_level_rsp_valid" -line 23956 -pos 1 -win $_nTrace1
srcSelect -signal "next_level_rsp_payload_rvalid" -line 23956 -pos 1 -win \
          $_nTrace1
srcSelect -signal "next_level_rsp_payload_bresp" -line 23956 -pos 1 -win \
          $_nTrace1
wvSetPosition -win $_nWave2 {("G5" 4)}
wvSetPosition -win $_nWave2 {("G5" 5)}
wvSetPosition -win $_nWave2 {("G5" 6)}
wvSetPosition -win $_nWave2 {("G5" 7)}
wvSetPosition -win $_nWave2 {("G5" 8)}
wvSetPosition -win $_nWave2 {("G5" 9)}
wvSetPosition -win $_nWave2 {("G5" 10)}
wvSetPosition -win $_nWave2 {("G5" 11)}
wvSetPosition -win $_nWave2 {("G5" 12)}
wvAddSignal -win $_nWave2 \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/dCache_1/next_level_rsp_valid" \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/dCache_1/next_level_rsp_payload_rvalid" \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/dCache_1/next_level_rsp_payload_bresp\[1:0\]"
wvSetPosition -win $_nWave2 {("G5" 12)}
wvSetPosition -win $_nWave2 {("G5" 15)}
wvSetPosition -win $_nWave2 {("G5" 12)}
wvSetPosition -win $_nWave2 {("G5" 15)}
wvSetPosition -win $_nWave2 {("G5" 15)}
wvSetPosition -win $_nWave2 {("G5" 15)}
wvSetPosition -win $_nWave2 {("G5" 15)}
wvSetCursor -win $_nWave2 159.236766 -snap {("G5" 13)}
wvSelectSignal -win $_nWave2 {( "G5" 14 )} 
wvSelectSignal -win $_nWave2 {( "G5" 13 )} 
wvSelectSignal -win $_nWave2 {( "G5" 14 )} 
wvSetCursor -win $_nWave2 159.180696 -snap {("G5" 14)}
srcActiveTrace \
           "tb_DandRiscvSimple.u_DandRiscvSimple.dCache_1.next_level_rsp_payload_rvalid" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 159000 -TraceValue 1
wvSelectSignal -win $_nWave2 {( "G5" 13 )} 
wvSelectSignal -win $_nWave2 {( "G5" 14 )} 
wvSetCursor -win $_nWave2 159.068557 -snap {("G5" 14)}
srcActiveTrace \
           "tb_DandRiscvSimple.u_DandRiscvSimple.dCache_1.next_level_rsp_payload_rvalid" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 159000 -TraceValue 1
srcDeselectAll -win $_nTrace1
srcSelect -signal "sig_r_valid" -line 118 -pos 1 -win $_nTrace1
srcAction -pos 117 7 2 -win $_nTrace1 -name "sig_r_valid" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "axi_arv_arr_flag" -line 335 -pos 1 -win $_nTrace1
srcSelect -signal "sig_r_valid" -line 335 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G5" 13 )} 
wvSelectSignal -win $_nWave2 {( "G5" 16 )} 
wvSelectSignal -win $_nWave2 {( "G5" 17 )} 
wvSetCursor -win $_nWave2 159.040522 -snap {("G5" 17)}
srcActiveTrace "tb_DandRiscvSimple.u_axi_slave_mem_d.sig_r_valid" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 1000 -TraceValue 0
srcDeselectAll -win $_nTrace1
srcSelect -signal "axi_arv_arr_flag" -line 335 -pos 1 -win $_nTrace1
srcSelect -signal "sig_r_valid" -line 335 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvSetCursor -win $_nWave2 157.442534 -snap {("G5" 18)}
srcActiveTrace "tb_DandRiscvSimple.u_axi_slave_mem_d.axi_arv_arr_flag" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 157000 -TraceValue 1
srcDeselectAll -win $_nTrace1
srcSelect -signal "ar_valid" -line 252 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvSetCursor -win $_nWave2 155.255815 -snap {("G5" 20)}
srcActiveTrace "tb_DandRiscvSimple.u_axi_slave_mem_d.ar_valid" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 155000 -TraceValue 1
srcDeselectAll -win $_nTrace1
srcSelect -signal "dCache_1_next_level_cmd_valid" -line 3146 -pos 1 -win \
          $_nTrace1
srcSelect -signal "dCache_1_next_level_cmd_payload_wen" -line 3146 -pos 1 -win \
          $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSetCursor -win $_nWave2 153.013026 -snap {("G5" 22)}
srcActiveTrace \
           "tb_DandRiscvSimple.u_DandRiscvSimple.dCache_1_next_level_cmd_payload_wen" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 1000 -TraceValue 0
srcDeselectAll -win $_nTrace1
srcSelect -signal "is_write_delay_1" -line 11542 -pos 1 -win $_nTrace1
srcAction -pos 11541 7 10 -win $_nTrace1 -name "is_write_delay_1" -ctrlKey off
srcBackwardHistory -win $_nTrace1
srcHBSelect "tb_DandRiscvSimple.u_DandRiscvSimple.dCache_1" -win $_nTrace1
srcHBSelect "tb_DandRiscvSimple.u_DandRiscvSimple.dCache_1" -win $_nTrace1
srcBackwardHistory -win $_nTrace1
srcHBSelect "tb_DandRiscvSimple.u_DandRiscvSimple.dCache_1" -win $_nTrace1
srcHBSelect "tb_DandRiscvSimple.u_DandRiscvSimple" -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G5" 20 )} 
wvSetCursor -win $_nWave2 155.031536 -snap {("G5" 20)}
srcActiveTrace "tb_DandRiscvSimple.u_axi_slave_mem_d.ar_valid" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 0 -TraceValue 0
srcDeselectAll -win $_nTrace1
srcSelect -signal "dcache_ar_valid" -line 3146 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
srcDeselectAll -win $_nTrace1
srcSelect -signal "dCache_1_next_level_cmd_valid" -line 3146 -pos 1 -win \
          $_nTrace1
srcSelect -signal "dCache_1_next_level_cmd_payload_wen" -line 3146 -pos 1 -win \
          $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
srcDeselectAll -win $_nTrace1
debReload
wvSelectSignal -win $_nWave2 {( "G5" 19 )} 
srcDeselectAll -win $_nTrace1
debReload
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoom -win $_nWave2 143.775539 185.827833
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G5" 6 )} 
wvSelectSignal -win $_nWave2 {( "G5" 8 )} 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 14.673796 532.140897
wvSelectSignal -win $_nWave2 {( "G5" 22 )} 
wvZoom -win $_nWave2 112.922841 315.063614
wvSelectSignal -win $_nWave2 {( "G5" 8 )} 
wvSelectSignal -win $_nWave2 {( "G5" 7 )} 
wvSelectSignal -win $_nWave2 {( "G5" 5 )} 
wvSetCursor -win $_nWave2 152.598965 -snap {("G5" 5)}
srcActiveTrace \
           "tb_DandRiscvSimple.u_DandRiscvSimple.DCachePlugin_dcache_access_cmd_ready" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 0 -TraceValue 1
wvScrollDown -win $_nWave2 13
srcDeselectAll -win $_nTrace1
srcSelect -signal "dCache_1_cpu_cmd_ready" -line 3144 -pos 1 -win $_nTrace1
srcAction -pos 3143 7 9 -win $_nTrace1 -name "dCache_1_cpu_cmd_ready" -ctrlKey \
          off
srcDeselectAll -win $_nTrace1
srcSelect -signal "cpu_cmd_ready_1" -line 11551 -pos 1 -win $_nTrace1
srcAction -pos 11550 7 6 -win $_nTrace1 -name "cpu_cmd_ready_1" -ctrlKey off
wvScrollUp -win $_nWave2 5
wvScrollUp -win $_nWave2 5
srcDeselectAll -win $_nTrace1
srcSelect -signal "when_DCache_l241" -line 15825 -pos 1 -win $_nTrace1
srcAction -pos 15824 3 13 -win $_nTrace1 -name "when_DCache_l241" -ctrlKey off
wvSelectSignal -win $_nWave2 {( "G5" 9 )} 
wvSelectSignal -win $_nWave2 {( "G5" 10 )} 
wvSelectSignal -win $_nWave2 {( "G5" 11 )} 
srcDeselectAll -win $_nTrace1
srcSelect -signal "next_level_wdone" -line 10469 -pos 1 -win $_nTrace1
srcAction -pos 10468 18 11 -win $_nTrace1 -name "next_level_wdone" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "next_level_rsp_valid" -line 23968 -pos 1 -win $_nTrace1
srcSelect -signal "next_level_rsp_payload_rvalid" -line 23968 -pos 1 -win \
          $_nTrace1
srcSelect -signal "next_level_rsp_payload_bresp" -line 23968 -pos 1 -win \
          $_nTrace1
wvSelectSignal -win $_nWave2 {( "G5" 12 )} 
wvSelectSignal -win $_nWave2 {( "G5" 13 )} 
wvSelectSignal -win $_nWave2 {( "G5" 14 )} 
wvSelectSignal -win $_nWave2 {( "G5" 15 )} 
wvSelectSignal -win $_nWave2 {( "G5" 15 16 )} 
wvSelectSignal -win $_nWave2 {( "G5" 15 16 18 )} 
wvSelectSignal -win $_nWave2 {( "G5" 15 16 17 18 )} 
wvSelectSignal -win $_nWave2 {( "G5" 15 16 17 18 19 )} 
wvSelectSignal -win $_nWave2 {( "G5" 15 16 17 18 19 20 )} 
wvSelectSignal -win $_nWave2 {( "G5" 15 16 17 18 19 20 21 )} 
wvSelectSignal -win $_nWave2 {( "G5" 15 16 17 18 19 20 21 22 )} 
wvSelectSignal -win $_nWave2 {( "G5" 15 16 17 18 19 20 21 22 23 )} 
wvSelectSignal -win $_nWave2 {( "G5" 15 16 17 18 19 20 21 22 23 24 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G6" 10)}
wvSetPosition -win $_nWave2 {("G6" 0)}
wvSetPosition -win $_nWave2 {("G6" 0)}
wvSetPosition -win $_nWave2 {("G6" 0)}
wvSetPosition -win $_nWave2 {("G6" 0)}
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSelectSignal -win $_nWave2 {( "G6" 11 )} 
wvSelectSignal -win $_nWave2 {( "G6" 12 )} 
wvSelectSignal -win $_nWave2 {( "G6" 13 )} 
wvZoom -win $_nWave2 142.226122 258.790942
srcDeselectAll -win $_nTrace1
srcSelect -signal "next_level_rsp_valid" -line 23968 -pos 1 -win $_nTrace1
srcSelect -signal "next_level_rsp_payload_rvalid" -line 23968 -pos 1 -win \
          $_nTrace1
srcSelect -signal "next_level_rsp_payload_bresp" -line 23968 -pos 1 -win \
          $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvSetPosition -win $_nWave2 {("G6" 1)}
wvSetPosition -win $_nWave2 {("G6" 0)}
wvSetPosition -win $_nWave2 {("G5" 14)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G5" 14)}
wvSetPosition -win $_nWave2 {("G5" 17)}
wvSetPosition -win $_nWave2 {("G5" 17)}
wvSetPosition -win $_nWave2 {("G5" 17)}
wvSetPosition -win $_nWave2 {("G5" 17)}
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "next_level_rsp_valid" -line 23968 -pos 1 -win $_nTrace1
srcAction -pos 23967 7 16 -win $_nTrace1 -name "next_level_rsp_valid" -ctrlKey \
          off
srcDeselectAll -win $_nTrace1
srcSelect -signal "dCache_1_next_level_cmd_payload_wen" -line 3172 -pos 1 -win \
          $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G5" 18 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G6" 0)}
wvSetPosition -win $_nWave2 {("G5" 17)}
wvSetPosition -win $_nWave2 {("G5" 17)}
wvSetPosition -win $_nWave2 {("G5" 17)}
wvSetPosition -win $_nWave2 {("G5" 17)}
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
debReload
wvZoom -win $_nWave2 145.665494 185.293047
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G5" 10 )} 
wvSelectSignal -win $_nWave2 {( "G5" 11 )} 
wvSelectSignal -win $_nWave2 {( "G5" 12 )} 
wvSelectSignal -win $_nWave2 {( "G5" 13 )} 
wvSelectSignal -win $_nWave2 {( "G5" 12 )} 
wvSelectSignal -win $_nWave2 {( "G5" 11 )} 
wvSelectSignal -win $_nWave2 {( "G5" 10 )} 
wvSelectSignal -win $_nWave2 {( "G5" 11 )} 
wvZoom -win $_nWave2 145.576529 200.023109
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G5" 12 )} 
wvSelectSignal -win $_nWave2 {( "G6" 12 )} 
wvSetCursor -win $_nWave2 161.082804 -snap {("G5" 12)}
wvSelectSignal -win $_nWave2 {( "G5" 13 )} 
wvSelectSignal -win $_nWave2 {( "G5" 12 )} 
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 152.508952 187.572689
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G5" 11 )} 
wvSelectSignal -win $_nWave2 {( "G5" 10 )} 
wvSelectSignal -win $_nWave2 {( "G5" 11 )} 
wvSelectSignal -win $_nWave2 {( "G5" 5 )} 
wvSetCursor -win $_nWave2 165.070271 -snap {("G5" 5)}
wvSelectSignal -win $_nWave2 {( "G5" 11 )} 
wvSetCursor -win $_nWave2 163.046066 -snap {("G5" 11)}
srcActiveTrace "tb_DandRiscvSimple.u_DandRiscvSimple.dCache_1.next_level_wdone" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 3000 -TraceValue 0
srcDeselectAll -win $_nTrace1
debReload
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 98.961156 447.304427
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 0.000000 950.961488
wvZoom -win $_nWave2 106.746799 634.380980
wvZoom -win $_nWave2 262.092591 450.267449
wvZoom -win $_nWave2 323.530053 376.276950
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 0.000000 521.852563
wvZoom -win $_nWave2 121.843703 459.591770
wvSelectSignal -win $_nWave2 {( "G5" 6 )} 
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
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
wvZoom -win $_nWave2 157.156682 210.017829
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 160.496530 185.926845
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSelectSignal -win $_nWave2 {( "G1" 2 )} 
wvSelectSignal -win $_nWave2 {( "G1" 4 )} 
wvZoom -win $_nWave2 74.904429 227.062205
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 189.733623 257.662944
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 200.299922 -snap {("G1" 4)}
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvZoom -win $_nWave2 234.983527 247.445224
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 226.058905 259.950885
wvZoom -win $_nWave2 236.406938 246.972365
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 237.155802 -snap {("G1" 2)}
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 179.998567 355.659818
wvZoom -win $_nWave2 224.730778 261.688373
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 228.654114 261.652814
wvSetCursor -win $_nWave2 237.036080 -snap {("G1" 2)}
wvSetMarker -win $_nWave2 237.000000
wvSelectSignal -win $_nWave2 {( "G1" 3 )} 
wvSelectSignal -win $_nWave2 {( "G1" 1 3 )} 
wvSelectSignal -win $_nWave2 {( "G1" 2 )} 
wvSetPosition -win $_nWave2 {("G1" 2)}
wvSetPosition -win $_nWave2 {("G1" 1)}
wvSetPosition -win $_nWave2 {("G1" 0)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 0)}
wvSetPosition -win $_nWave2 {("G1" 1)}
wvSetPosition -win $_nWave2 {("G1" 1)}
wvSetPosition -win $_nWave2 {("G1" 1)}
wvSetPosition -win $_nWave2 {("G1" 1)}
wvSelectSignal -win $_nWave2 {( "G1" 4 )} 
wvSetPosition -win $_nWave2 {("G1" 4)}
wvSetPosition -win $_nWave2 {("G1" 3)}
wvSetPosition -win $_nWave2 {("G1" 2)}
wvSetPosition -win $_nWave2 {("G1" 1)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 1)}
wvSetPosition -win $_nWave2 {("G1" 2)}
wvSetPosition -win $_nWave2 {("G1" 2)}
wvSetPosition -win $_nWave2 {("G1" 2)}
wvSetPosition -win $_nWave2 {("G1" 2)}
wvSelectSignal -win $_nWave2 {( "G1" 4 )} 
wvSetPosition -win $_nWave2 {("G1" 4)}
wvSetPosition -win $_nWave2 {("G1" 3)}
wvSetPosition -win $_nWave2 {("G1" 2)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 2)}
wvSetPosition -win $_nWave2 {("G1" 3)}
wvSetPosition -win $_nWave2 {("G1" 3)}
wvSetPosition -win $_nWave2 {("G1" 3)}
wvSetPosition -win $_nWave2 {("G1" 3)}
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoom -win $_nWave2 235.617919 251.535188
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G5" 9 )} 
wvSelectSignal -win $_nWave2 {( "G5" 9 10 )} 
wvSelectSignal -win $_nWave2 {( "G5" 9 10 11 )} 
wvSelectSignal -win $_nWave2 {( "G5" 9 10 11 12 )} 
wvSelectSignal -win $_nWave2 {( "G5" 9 10 11 12 13 )} 
wvSelectSignal -win $_nWave2 {( "G5" 9 10 11 12 13 14 )} 
wvSelectSignal -win $_nWave2 {( "G5" 9 10 11 12 13 14 15 )} 
wvSelectSignal -win $_nWave2 {( "G5" 9 10 11 12 13 14 15 16 )} 
wvSelectSignal -win $_nWave2 {( "G5" 9 10 11 12 13 14 15 16 17 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 3)}
wvSetPosition -win $_nWave2 {("G1" 3)}
wvSetPosition -win $_nWave2 {("G1" 3)}
wvSetPosition -win $_nWave2 {("G1" 3)}
wvSelectSignal -win $_nWave2 {( "G4" 3 )} 
wvZoom -win $_nWave2 229.098884 256.338957
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 235.013422 -snap {("G4" 3)}
srcActiveTrace "tb_DandRiscvSimple.u_DandRiscvSimple.execute_ALU_RESULT\[63:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 195000 -TraceValue \
           0000000000000000000000000000000000000000000000000000000000000000
srcDeselectAll -win $_nTrace1
srcSelect -signal "execute_ALUPlugin_alu_result" -line 1430 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "execute_ALUPlugin_alu_result" -line 1430 -pos 1 -win $_nTrace1
srcAction -pos 1429 7 16 -win $_nTrace1 -name "execute_ALUPlugin_alu_result" \
          -ctrlKey off
wvSetPosition -win $_nWave2 {("G4" 2)}
wvSetPosition -win $_nWave2 {("G4" 3)}
wvSetPosition -win $_nWave2 {("G5" 0)}
wvSetPosition -win $_nWave2 {("G5" 1)}
wvSetPosition -win $_nWave2 {("G5" 2)}
wvSetPosition -win $_nWave2 {("G5" 3)}
wvSetPosition -win $_nWave2 {("G5" 4)}
wvSetPosition -win $_nWave2 {("G5" 5)}
wvSetPosition -win $_nWave2 {("G5" 6)}
wvSetPosition -win $_nWave2 {("G5" 7)}
wvSetPosition -win $_nWave2 {("G5" 8)}
wvSetPosition -win $_nWave2 {("G6" 0)}
wvSetPosition -win $_nWave2 {("G5" 8)}
wvSetPosition -win $_nWave2 {("G5" 7)}
wvSetPosition -win $_nWave2 {("G5" 6)}
wvSetPosition -win $_nWave2 {("G5" 5)}
wvSetPosition -win $_nWave2 {("G5" 4)}
wvSetPosition -win $_nWave2 {("G5" 3)}
wvSetPosition -win $_nWave2 {("G5" 2)}
wvSetPosition -win $_nWave2 {("G5" 1)}
wvSetPosition -win $_nWave2 {("G5" 0)}
wvSetPosition -win $_nWave2 {("G4" 3)}
wvAddSignal -win $_nWave2 \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/execute_ALUPlugin_alu_result\[63:0\]"
wvSetPosition -win $_nWave2 {("G4" 3)}
wvSetPosition -win $_nWave2 {("G4" 4)}
wvSetPosition -win $_nWave2 {("G4" 3)}
wvSetPosition -win $_nWave2 {("G4" 4)}
wvSetPosition -win $_nWave2 {("G4" 4)}
wvSetPosition -win $_nWave2 {("G4" 4)}
wvSetPosition -win $_nWave2 {("G4" 4)}
srcDeselectAll -win $_nTrace1
wvZoom -win $_nWave2 233.231198 247.139535
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 234.984237 -snap {("G4" 4)}
srcActiveTrace \
           "tb_DandRiscvSimple.u_DandRiscvSimple.execute_ALUPlugin_alu_result\[63:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 195000 -TraceValue \
           0000000000000000000000000000000000000000000000000000000000000000
srcDeselectAll -win $_nTrace1
srcSelect -signal "execute_ALU_CTRL" -line 2669 -pos 3 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "execute_ALU_CTRL" -line 2669 -pos 3 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoom -win $_nWave2 231.469237 247.509770
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoom -win $_nWave2 227.317631 251.558487
wvZoom -win $_nWave2 229.929859 244.950171
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 171.693632 -snap {("G4" 5)}
srcActiveTrace "tb_DandRiscvSimple.u_DandRiscvSimple.execute_ALU_CTRL\[4:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 167000 -TraceValue 00001
wvZoom -win $_nWave2 225.955594 270.505898
wvZoom -win $_nWave2 231.727987 246.730495
wvZoomOut -win $_nWave2
srcDeselectAll -win $_nTrace1
srcSelect -signal "decode_to_execute_ALU_CTRL" -line 1518 -pos 1 -win $_nTrace1
srcAction -pos 1517 7 9 -win $_nTrace1 -name "decode_to_execute_ALU_CTRL" \
          -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "decode_ALU_CTRL" -line 3472 -pos 1 -win $_nTrace1
srcAction -pos 3471 5 6 -win $_nTrace1 -name "decode_ALU_CTRL" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "decode_DecodePlugin_alu_ctrl" -line 1452 -pos 1 -win $_nTrace1
srcAction -pos 1451 7 6 -win $_nTrace1 -name "decode_DecodePlugin_alu_ctrl" \
          -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "decode_INSTRUCTION" -line 1999 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave2 {("G3" 2)}
wvAddSignal -win $_nWave2 \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/decode_INSTRUCTION\[31:0\]"
wvSetPosition -win $_nWave2 {("G3" 2)}
wvSetPosition -win $_nWave2 {("G3" 3)}
wvSetPosition -win $_nWave2 {("G3" 2)}
wvSetPosition -win $_nWave2 {("G3" 3)}
wvSetPosition -win $_nWave2 {("G3" 3)}
wvSetPosition -win $_nWave2 {("G3" 3)}
wvSetPosition -win $_nWave2 {("G3" 3)}
srcDeselectAll -win $_nTrace1
srcBackwardHistory -win $_nTrace1
srcHBSelect "tb_DandRiscvSimple.u_DandRiscvSimple" -win $_nTrace1
srcHBSelect "tb_DandRiscvSimple.u_DandRiscvSimple" -win $_nTrace1
srcBackwardHistory -win $_nTrace1
srcHBSelect "tb_DandRiscvSimple.u_DandRiscvSimple" -win $_nTrace1
srcHBSelect "tb_DandRiscvSimple.u_DandRiscvSimple" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "decode_ALU_CTRL" -line 3472 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave2 {("G4" 4)}
wvSetPosition -win $_nWave2 {("G4" 0)}
wvSetPosition -win $_nWave2 {("G3" 3)}
wvAddSignal -win $_nWave2 \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/decode_ALU_CTRL\[4:0\]"
wvSetPosition -win $_nWave2 {("G3" 3)}
wvSetPosition -win $_nWave2 {("G3" 4)}
wvSetPosition -win $_nWave2 {("G3" 3)}
wvSetPosition -win $_nWave2 {("G3" 4)}
wvSetPosition -win $_nWave2 {("G3" 4)}
wvSetPosition -win $_nWave2 {("G3" 4)}
wvSetPosition -win $_nWave2 {("G3" 4)}
srcDeselectAll -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G3" 2 )} 
wvSelectSignal -win $_nWave2 {( "G3" 3 )} 
wvSelectSignal -win $_nWave2 {( "G3" 4 )} 
wvSelectSignal -win $_nWave2 {( "G3" 2 )} 
wvSelectSignal -win $_nWave2 {( "G3" 3 )} 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 149.079470 265.943136
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 142.220570 213.733038
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 142.151764 193.435240
wvZoom -win $_nWave2 144.191261 175.803461
wvSetCursor -win $_nWave2 150.963855 -snap {("G3" 2)}
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 1 )} 
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvSetCursor -win $_nWave2 151.004410 -snap {("G2" 1)}
srcActiveTrace "tb_DandRiscvSimple.u_DandRiscvSimple.fetch_PC\[63:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 149000 -TraceValue \
           0000000000000000000000000000000010000000000000000010001001110100
srcDeselectAll -win $_nTrace1
srcSelect -signal "fetch_PC_NEXT" -line 1469 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "fetch_PC_NEXT" -line 1469 -pos 1 -win $_nTrace1
srcAction -pos 1468 3 5 -win $_nTrace1 -name "fetch_PC_NEXT" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "fetch_to_decode_PC_NEXT" -line 1468 -pos 1 -win $_nTrace1
srcAction -pos 1467 7 17 -win $_nTrace1 -name "fetch_to_decode_PC_NEXT" -ctrlKey \
          off
srcDeselectAll -win $_nTrace1
srcSelect -signal "fetch_PC_NEXT" -line 3433 -pos 1 -win $_nTrace1
srcAction -pos 3432 5 7 -win $_nTrace1 -name "fetch_PC_NEXT" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "fetch_FetchPlugin_pc_stream_fifo_next_payload" -line 1469 -pos \
          1 -win $_nTrace1
srcAction -pos 1468 7 17 -win $_nTrace1 -name \
          "fetch_FetchPlugin_pc_stream_fifo_next_payload" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "_zz_next_payload" -line 53253 -pos 1 -win $_nTrace1
srcAction -pos 53252 7 9 -win $_nTrace1 -name "_zz_next_payload" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "fifo_ram_1" -line 53236 -pos 1 -win $_nTrace1
srcAction -pos 53235 9 6 -win $_nTrace1 -name "fifo_ram_1" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "ports_s_ports_payload" -line 53302 -pos 1 -win $_nTrace1
srcAction -pos 53301 5 9 -win $_nTrace1 -name "ports_s_ports_payload" -ctrlKey \
          off
srcDeselectAll -win $_nTrace1
srcSelect -signal "pc_next" -line 1632 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave2 {("G2" 2)}
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSetPosition -win $_nWave2 {("G2" 2)}
wvAddSignal -win $_nWave2 "/tb_DandRiscvSimple/u_DandRiscvSimple/pc_next\[63:0\]"
wvSetPosition -win $_nWave2 {("G2" 2)}
wvSetPosition -win $_nWave2 {("G2" 3)}
wvSetPosition -win $_nWave2 {("G2" 2)}
wvSetPosition -win $_nWave2 {("G2" 3)}
wvSetPosition -win $_nWave2 {("G2" 3)}
wvSetPosition -win $_nWave2 {("G2" 3)}
wvSetPosition -win $_nWave2 {("G2" 3)}
wvSelectGroup -win $_nWave2 {G3}
wvSelectSignal -win $_nWave2 {( "G2" 3 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSetPosition -win $_nWave2 {("G2" 2)}
wvSetPosition -win $_nWave2 {("G2" 2)}
wvSetPosition -win $_nWave2 {("G2" 2)}
wvSetPosition -win $_nWave2 {("G2" 2)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "pc_next" -line 1632 -pos 1 -win $_nTrace1
srcAction -pos 1631 7 4 -win $_nTrace1 -name "pc_next" -ctrlKey off
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
srcSearchString "fetch_valid" -win $_nTrace1 -next -case
srcDeselectAll -win $_nTrace1
srcSelect -signal "fetch_valid" -line 530 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave2 {("G1" 2)}
wvSetPosition -win $_nWave2 {("G1" 3)}
wvSetPosition -win $_nWave2 {("G1" 4)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G2" 1)}
wvSetPosition -win $_nWave2 {("G2" 2)}
wvAddSignal -win $_nWave2 "/tb_DandRiscvSimple/u_DandRiscvSimple/fetch_valid"
wvSetPosition -win $_nWave2 {("G2" 2)}
wvSetPosition -win $_nWave2 {("G2" 3)}
wvSetPosition -win $_nWave2 {("G2" 2)}
wvSetPosition -win $_nWave2 {("G2" 3)}
wvSetPosition -win $_nWave2 {("G2" 3)}
wvSetPosition -win $_nWave2 {("G2" 3)}
wvSetPosition -win $_nWave2 {("G2" 3)}
wvSelectSignal -win $_nWave2 {( "G2" 1 )} 
wvSetPosition -win $_nWave2 {("G2" 1)}
wvSetPosition -win $_nWave2 {("G2" 2)}
wvSetPosition -win $_nWave2 {("G2" 3)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G2" 3)}
wvSetPosition -win $_nWave2 {("G2" 3)}
wvSetPosition -win $_nWave2 {("G2" 3)}
wvSetPosition -win $_nWave2 {("G2" 3)}
wvSetPosition -win $_nWave2 {("G2" 2)}
wvSetPosition -win $_nWave2 {("G2" 1)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G2" 1)}
wvSetPosition -win $_nWave2 {("G2" 1)}
wvSetPosition -win $_nWave2 {("G2" 1)}
wvSetPosition -win $_nWave2 {("G2" 1)}
wvSelectSignal -win $_nWave2 {( "G2" 2 )} 
wvSelectSignal -win $_nWave2 {( "G2" 3 )} 
wvSelectSignal -win $_nWave2 {( "G2" 2 )} 
srcDeselectAll -win $_nTrace1
srcSearchString "fetch_arb" -win $_nTrace1 -next -case
srcSearchString "fetch_arb" -win $_nTrace1 -prev -case
srcSelect -win $_nTrace1 -range {452 452 4 4 1 10}
srcDeselectAll -win $_nTrace1
srcSelect -signal "fetch_arbitration_isMoving" -line 451 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "fetch_arbitration_isFlushed" -line 450 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "fetch_arbitration_isValid" -line 447 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave2 {("G1" 0)}
wvSetPosition -win $_nWave2 {("G1" 1)}
wvSetPosition -win $_nWave2 {("G1" 2)}
wvSetPosition -win $_nWave2 {("G1" 3)}
wvSetPosition -win $_nWave2 {("G1" 4)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvAddSignal -win $_nWave2 \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/fetch_arbitration_isValid"
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G2" 1)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G2" 1)}
wvSetPosition -win $_nWave2 {("G2" 1)}
wvSetPosition -win $_nWave2 {("G2" 1)}
wvSetPosition -win $_nWave2 {("G2" 1)}
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvSaveSignal -win $_nWave2 \
           "/home/lin/SpinalProjects/DandRiscvSoC/simWorkspace/tb_DandRiscvSimple/DandRiscv_debug_total.rc"
wvSetPosition -win $_nWave2 {("G2" 1)}
wvSetPosition -win $_nWave2 {("G2" 1)}
wvSetPosition -win $_nWave2 {("G2" 1)}
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 2 )} 
wvSelectSignal -win $_nWave2 {( "G2" 3 )} 
wvSelectSignal -win $_nWave2 {( "G2" 3 4 )} 
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvSetCursor -win $_nWave2 147.435617 -snap {("G2" 3)}
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 137.996567 172.630075
wvZoom -win $_nWave2 142.617330 159.767470
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 140.620697 156.285738
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 86.476327 136.797382
wvZoom -win $_nWave2 97.483049 113.557382
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 62.358927 172.889301
wvZoom -win $_nWave2 86.180740 122.338848
wvSelectSignal -win $_nWave2 {( "G2" 2 )} 
wvSelectSignal -win $_nWave2 {( "G2" 1 2 )} 
wvZoom -win $_nWave2 90.169960 108.654894
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 99.044863 -snap {("G2" 2)}
wvZoom -win $_nWave2 95.938351 105.139318
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 1 2 )} {( "G3" 1 )} 
wvSetCursor -win $_nWave2 103.058920 -snap {("G3" 2)}
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 95.687522 114.124869
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 144.565828 178.436618
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 66.167660 166.976168
wvZoom -win $_nWave2 83.303167 130.829949
wvZoom -win $_nWave2 87.906466 115.617720
srcDeselectAll -win $_nTrace1
srcSelect -signal "decode_arbitration_flushIt" -line 456 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "decode_arbitration_removeIt" -line 455 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave2 {("G3" 3)}
wvSetPosition -win $_nWave2 {("G3" 4)}
wvAddSignal -win $_nWave2 \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/decode_arbitration_removeIt"
wvSetPosition -win $_nWave2 {("G3" 4)}
wvSetPosition -win $_nWave2 {("G3" 5)}
wvSetPosition -win $_nWave2 {("G3" 4)}
wvSetPosition -win $_nWave2 {("G3" 5)}
wvSetPosition -win $_nWave2 {("G3" 5)}
wvSetPosition -win $_nWave2 {("G3" 5)}
wvSetPosition -win $_nWave2 {("G3" 5)}
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvSetCursor -win $_nWave2 101.059980 -snap {("G3" 5)}
srcActiveTrace "tb_DandRiscvSimple.u_DandRiscvSimple.decode_arbitration_removeIt" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 101000 -TraceValue 1
srcDeselectAll -win $_nTrace1
srcSelect -signal "decode_arbitration_isFlushed" -line 1543 -pos 1 -win $_nTrace1
srcAction -pos 1542 3 18 -win $_nTrace1 -name "decode_arbitration_isFlushed" \
          -ctrlKey off
srcSearchString "execute_RED" -win $_nTrace1 -next -case
wvSelectSignal -win $_nWave2 {( "G3" 5 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G4" 0)}
wvSetPosition -win $_nWave2 {("G3" 4)}
wvSetPosition -win $_nWave2 {("G3" 4)}
wvSetPosition -win $_nWave2 {("G3" 4)}
wvSetPosition -win $_nWave2 {("G3" 4)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "execute_REDIRECT_PC_NEXT" -line 331 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "execute_REDIRECT_VALID" -line 332 -pos 1 -win $_nTrace1
srcSelect -signal "execute_REDIRECT_PC_NEXT" -line 331 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave2 {("G2" 4)}
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSetPosition -win $_nWave2 {("G3" 1)}
wvSetPosition -win $_nWave2 {("G3" 2)}
wvSetPosition -win $_nWave2 {("G3" 3)}
wvSetPosition -win $_nWave2 {("G3" 4)}
wvSetPosition -win $_nWave2 {("G4" 0)}
wvSetPosition -win $_nWave2 {("G4" 1)}
wvSetPosition -win $_nWave2 {("G4" 2)}
wvSetPosition -win $_nWave2 {("G4" 3)}
wvSetPosition -win $_nWave2 {("G4" 4)}
wvSetPosition -win $_nWave2 {("G4" 5)}
wvAddSignal -win $_nWave2 \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/execute_REDIRECT_VALID" \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/execute_REDIRECT_PC_NEXT\[63:0\]"
wvSetPosition -win $_nWave2 {("G4" 5)}
wvSetPosition -win $_nWave2 {("G4" 7)}
wvSetPosition -win $_nWave2 {("G4" 5)}
wvSetPosition -win $_nWave2 {("G4" 7)}
wvSetPosition -win $_nWave2 {("G4" 7)}
wvSetPosition -win $_nWave2 {("G4" 7)}
wvSetPosition -win $_nWave2 {("G4" 7)}
wvSelectSignal -win $_nWave2 {( "G4" 6 )} 
wvSelectSignal -win $_nWave2 {( "G4" 7 )} 
wvSelectSignal -win $_nWave2 {( "G4" 6 )} 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 130.824137 203.488413
wvSetCursor -win $_nWave2 162.844892 -snap {("G4" 6)}
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSetMarker -win $_nWave2 163.000000
wvZoom -win $_nWave2 138.724454 197.452477
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 3 )} 
wvSelectSignal -win $_nWave2 {( "G2" 4 )} 
wvZoom -win $_nWave2 159.179436 180.048791
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 138.959320 190.898446
wvZoom -win $_nWave2 158.182460 179.837644
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G3" 3 )} 
wvZoom -win $_nWave2 135.700795 181.650346
wvZoom -win $_nWave2 142.185017 170.568222
wvSelectSignal -win $_nWave2 {( "G3" 2 )} 
wvSelectSignal -win $_nWave2 {( "G3" 3 )} 
wvSelectSignal -win $_nWave2 {( "G3" 2 )} 
wvSelectSignal -win $_nWave2 {( "G3" 4 )} 
wvSelectSignal -win $_nWave2 {( "G3" 3 )} 
wvSelectSignal -win $_nWave2 {( "G3" 4 )} 
wvSelectSignal -win $_nWave2 {( "G2" 3 )} 
wvSelectSignal -win $_nWave2 {( "G3" 2 )} 
wvSetCursor -win $_nWave2 165.015382 -snap {("G3" 2)}
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 190.276253 200.762928
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 149.725310 218.820323
srcSearchString "fetch_INS" -win $_nTrace1 -next -case
srcDeselectAll -win $_nTrace1
srcSelect -signal "fetch_INSTRUCTION" -line 378 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave2 {("G3" 4)}
wvSetPosition -win $_nWave2 {("G4" 0)}
wvSetPosition -win $_nWave2 {("G3" 4)}
wvSetPosition -win $_nWave2 {("G3" 3)}
wvSetPosition -win $_nWave2 {("G3" 2)}
wvSetPosition -win $_nWave2 {("G3" 1)}
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSetPosition -win $_nWave2 {("G2" 4)}
wvSetPosition -win $_nWave2 {("G2" 3)}
wvSetPosition -win $_nWave2 {("G2" 2)}
wvAddSignal -win $_nWave2 \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/fetch_INSTRUCTION\[31:0\]"
wvSetPosition -win $_nWave2 {("G2" 2)}
wvSetPosition -win $_nWave2 {("G2" 3)}
wvSetPosition -win $_nWave2 {("G2" 2)}
wvSetPosition -win $_nWave2 {("G2" 3)}
wvSetPosition -win $_nWave2 {("G2" 3)}
wvSetPosition -win $_nWave2 {("G2" 3)}
wvSetPosition -win $_nWave2 {("G2" 3)}
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 135.210482 193.358434
wvZoom -win $_nWave2 141.290094 165.645843
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 142.141530 160.326323
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 137.959844 180.231614
wvZoom -win $_nWave2 146.880571 162.308817
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 158.968835 175.832037
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 4 )} 
wvSelectSignal -win $_nWave2 {( "G2" 4 5 )} 
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
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
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 4 )} 
wvSelectSignal -win $_nWave2 {( "G2" 5 )} 
wvSelectSignal -win $_nWave2 {( "G2" 4 )} 
wvSetCursor -win $_nWave2 164.696266 -snap {("G2" 5)}
srcActiveTrace "tb_DandRiscvSimple.u_DandRiscvSimple.fetch_valid" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 153000 -TraceValue 0
srcDeselectAll -win $_nTrace1
srcSelect -signal "when_FetchPlugin_l128" -line 3299 -pos 1 -win $_nTrace1
srcAction -pos 3298 3 10 -win $_nTrace1 -name "when_FetchPlugin_l128" -ctrlKey \
          off
srcDeselectAll -win $_nTrace1
srcSelect -signal "fetch_state_next" -line 1625 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave2 {("G2" 4)}
wvSetPosition -win $_nWave2 {("G2" 5)}
wvAddSignal -win $_nWave2 \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/fetch_state_next\[1:0\]"
wvSetPosition -win $_nWave2 {("G2" 5)}
wvSetPosition -win $_nWave2 {("G2" 6)}
wvSetPosition -win $_nWave2 {("G2" 5)}
wvSetPosition -win $_nWave2 {("G2" 6)}
wvSetPosition -win $_nWave2 {("G2" 6)}
wvSetPosition -win $_nWave2 {("G2" 6)}
wvSetPosition -win $_nWave2 {("G2" 6)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "BUSY" -line 1626 -pos 1 -win $_nTrace1
srcAction -pos 1625 12 1 -win $_nTrace1 -name "BUSY" -ctrlKey off
srcBackwardHistory -win $_nTrace1
srcHBSelect "tb_DandRiscvSimple.u_DandRiscvSimple" -win $_nTrace1
srcHBSelect "tb_DandRiscvSimple.u_DandRiscvSimple" -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G2" 5 )} 
wvSelectSignal -win $_nWave2 {( "G2" 6 )} 
wvZoom -win $_nWave2 161.364729 193.858032
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 149.390769 218.587542
wvSelectSignal -win $_nWave2 {( "G2" 3 )} 
wvSetCursor -win $_nWave2 191.024235 -snap {("G2" 3)}
srcActiveTrace "tb_DandRiscvSimple.u_DandRiscvSimple.fetch_INSTRUCTION\[31:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 151000 -TraceValue \
           00010001010001010000010100010011
srcDeselectAll -win $_nTrace1
srcSelect -signal "fetch_FetchPlugin_instruction_out_stream_payload" -line 1467 \
          -pos 1 -win $_nTrace1
srcAction -pos 1466 7 25 -win $_nTrace1 -name \
          "fetch_FetchPlugin_instruction_out_stream_payload" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal \
          "fetch_FetchPlugin_instruction_stream_fifo_ports_m_ports_payload" \
          -line 1649 -pos 1 -win $_nTrace1
srcAction -pos 1648 7 6 -win $_nTrace1 -name \
          "fetch_FetchPlugin_instruction_stream_fifo_ports_m_ports_payload" \
          -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "_zz_ports_m_ports_payload" -line 53049 -pos 1 -win $_nTrace1
srcAction -pos 53048 7 10 -win $_nTrace1 -name "_zz_ports_m_ports_payload" \
          -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "fifo_ram_0" -line 53032 -pos 1 -win $_nTrace1
srcAction -pos 53031 9 3 -win $_nTrace1 -name "fifo_ram_0" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "ports_s_ports_payload" -line 53076 -pos 1 -win $_nTrace1
srcAction -pos 53075 5 10 -win $_nTrace1 -name "ports_s_ports_payload" -ctrlKey \
          off
srcDeselectAll -win $_nTrace1
srcSelect -signal "ICachePlugin_icache_access_rsp_payload_data" -line 1645 -pos 1 \
          -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "ICachePlugin_icache_access_rsp_payload_data" -line 1645 -pos 1 \
          -win $_nTrace1
wvSetPosition -win $_nWave2 {("G2" 5)}
wvSetPosition -win $_nWave2 {("G2" 6)}
wvAddSignal -win $_nWave2 \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/ICachePlugin_icache_access_rsp_payload_data\[31:0\]"
wvSetPosition -win $_nWave2 {("G2" 6)}
wvSetPosition -win $_nWave2 {("G2" 7)}
wvSetPosition -win $_nWave2 {("G2" 6)}
wvSetPosition -win $_nWave2 {("G2" 7)}
wvSetPosition -win $_nWave2 {("G2" 7)}
wvSetPosition -win $_nWave2 {("G2" 7)}
wvSetPosition -win $_nWave2 {("G2" 7)}
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoom -win $_nWave2 160.398338 200.522701
wvZoomOut -win $_nWave2
srcHBSelect "tb_DandRiscvSimple.u_DandRiscvSimple.iCache_1" -win $_nTrace1
srcSetScope -win $_nTrace1 "tb_DandRiscvSimple.u_DandRiscvSimple.iCache_1" -delim \
           "."
srcHBSelect "tb_DandRiscvSimple.u_DandRiscvSimple.iCache_1" -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G2" 7 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSetPosition -win $_nWave2 {("G2" 6)}
wvSetPosition -win $_nWave2 {("G2" 6)}
wvSetPosition -win $_nWave2 {("G2" 6)}
wvSetPosition -win $_nWave2 {("G2" 6)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "cpu_cmd_valid" -line 26822 -pos 1 -win $_nTrace1
srcSelect -signal "cpu_cmd_ready" -line 26823 -pos 1 -win $_nTrace1
srcSelect -signal "cpu_cmd_payload_addr" -line 26824 -pos 1 -win $_nTrace1
srcSelect -signal "cpu_rsp_valid" -line 26825 -pos 1 -win $_nTrace1
srcSelect -toggle -signal "cpu_rsp_valid" -line 26825 -pos 1 -win $_nTrace1
srcSelect -signal "cpu_rsp_valid" -line 26825 -pos 1 -win $_nTrace1
srcSelect -signal "cpu_rsp_payload_data" -line 26826 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvZoom -win $_nWave2 149.189768 162.624610
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 156.010600 195.720509
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 11 )} 
wvSelectSignal -win $_nWave2 {( "G2" 10 )} 
wvSelectSignal -win $_nWave2 {( "G2" 11 )} 
wvZoom -win $_nWave2 181.749448 199.375655
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 150.538963 229.772100
wvZoom -win $_nWave2 160.246166 213.254609
wvSetCursor -win $_nWave2 163.306307 -snap {("G2" 11)}
srcActiveTrace \
           "tb_DandRiscvSimple.u_DandRiscvSimple.iCache_1.cpu_rsp_payload_data\[31:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 163000 -TraceValue \
           00000000000001010000010100010011
srcDeselectAll -win $_nTrace1
srcSelect -signal "is_hit_d1" -line 35477 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
srcDeselectAll -win $_nTrace1
srcSelect -signal "_zz_cpu_rsp_payload_data_3" -line 35477 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvSetCursor -win $_nWave2 163.255305 -snap {("G2" 13)}
srcActiveTrace \
           "tb_DandRiscvSimple.u_DandRiscvSimple.iCache_1._zz_cpu_rsp_payload_data_3\[31:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 163000 -TraceValue \
           00000000000001010000010100010011
srcDeselectAll -win $_nTrace1
srcSelect -signal "cpu_bank_index_d1" -line 33369 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvZoom -win $_nWave2 152.850825 212.149558
srcDeselectAll -win $_nTrace1
srcSelect -signal "cpu_bank_index_d1" -line 33369 -pos 1 -win $_nTrace1
srcAction -pos 33368 3 10 -win $_nTrace1 -name "cpu_bank_index_d1" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "cpu_addr_d1\[5 : 2\]" -line 33486 -pos 1 -win $_nTrace1
srcAction -pos 33485 7 5 -win $_nTrace1 -name "cpu_addr_d1\[5 : 2\]" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "cpu_addr_d1" -line 37031 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 149.446568 165.573998
wvSetCursor -win $_nWave2 153.046533 -snap {("G2" 15)}
srcActiveTrace \
           "tb_DandRiscvSimple.u_DandRiscvSimple.iCache_1.cpu_addr_d1\[63:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 153000 -TraceValue \
           0000000000000000000000000000000010000000000000000010001010000000
wvSelectSignal -win $_nWave2 {( "G2" 9 )} 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 147.682792 175.985966
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 4 )} 
wvSelectSignal -win $_nWave2 {( "G2" 5 )} 
srcDeselectAll -win $_nTrace1
srcSelect -signal "cpu_cmd_fire_2" -line 37030 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvZoom -win $_nWave2 147.728179 183.057220
wvZoom -win $_nWave2 150.198266 160.599825
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 5 )} 
wvSelectSignal -win $_nWave2 {( "G2" 4 )} 
wvSelectSignal -win $_nWave2 {( "G2" 4 5 )} 
wvSelectSignal -win $_nWave2 {( "G2" 5 )} 
wvSelectSignal -win $_nWave2 {( "G2" 4 )} 
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
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
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
wvZoom -win $_nWave2 147.459434 162.858277
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 5 )} 
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 148.669413 158.606063
wvZoomOut -win $_nWave2
wvScrollDown -win $_nWave2 1
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 144.089886 166.244982
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 144.835969 161.377682
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 147.578774 157.149412
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 15 )} 
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 145.844517 169.172565
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 137.188151 199.855158
wvSelectSignal -win $_nWave2 {( "G2" 5 )} 
wvSelectSignal -win $_nWave2 {( "G2" 15 )} 
wvSelectSignal -win $_nWave2 {( "G2" 16 )} 
wvSelectSignal -win $_nWave2 {( "G2" 15 )} 
wvSelectSignal -win $_nWave2 {( "G2" 10 )} 
wvSelectSignal -win $_nWave2 {( "G2" 4 )} 
wvSelectSignal -win $_nWave2 {( "G2" 4 5 )} 
wvSelectSignal -win $_nWave2 {( "G2" 4 5 8 )} 
wvSelectSignal -win $_nWave2 {( "G2" 4 5 8 10 )} 
wvSetCursor -win $_nWave2 162.954380 -snap {("G2" 6)}
srcActiveTrace "tb_DandRiscvSimple.u_DandRiscvSimple.fetch_state_next\[1:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 151000 -TraceValue 11
srcDeselectAll -win $_nTrace1
srcSelect -signal "when_FetchPlugin_l96" -line 1611 -pos 1 -win $_nTrace1
srcAction -pos 1610 3 9 -win $_nTrace1 -name "when_FetchPlugin_l96" -ctrlKey off
srcDeselectAll -win $_nTrace1
debReload
wvScrollDown -win $_nWave2 1
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 113.194542 326.077460
wvZoom -win $_nWave2 133.130980 228.443537
wvSelectSignal -win $_nWave2 {( "G2" 7 )} 
wvSelectSignal -win $_nWave2 {( "G2" 8 )} 
wvSelectSignal -win $_nWave2 {( "G2" 7 )} 
wvSelectSignal -win $_nWave2 {( "G2" 4 )} 
wvSelectSignal -win $_nWave2 {( "G2" 5 )} 
wvSelectSignal -win $_nWave2 {( "G2" 4 )} 
wvZoom -win $_nWave2 143.096308 196.468895
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 5 )} 
wvSetCursor -win $_nWave2 155.147078 -snap {("G2" 5)}
srcActiveTrace "tb_DandRiscvSimple.u_DandRiscvSimple.fetch_valid" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 155000 -TraceValue 1
wvSelectSignal -win $_nWave2 {( "G2" 7 )} 
wvSelectSignal -win $_nWave2 {( "G2" 5 )} 
wvSelectSignal -win $_nWave2 {( "G2" 7 )} 
wvSetCursor -win $_nWave2 155.181313 -snap {("G2" 7)}
srcActiveTrace "tb_DandRiscvSimple.u_DandRiscvSimple.iCache_1.cpu_cmd_valid" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 155000 -TraceValue 1
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvSetCursor -win $_nWave2 153.383968 -snap {("G2" 6)}
srcActiveTrace "tb_DandRiscvSimple.u_DandRiscvSimple.fetch_state_next\[1:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 153000 -TraceValue 10
wvSelectSignal -win $_nWave2 {( "G2" 16 )} 
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoom -win $_nWave2 137.156511 209.666542
wvSelectSignal -win $_nWave2 {( "G2" 10 )} 
wvSetCursor -win $_nWave2 189.062345 -snap {("G2" 10)}
wvSelectSignal -win $_nWave2 {( "G2" 8 )} 
wvSetCursor -win $_nWave2 189.248387 -snap {("G2" 8)}
wvSelectSignal -win $_nWave2 {( "G2" 7 )} 
wvSelectSignal -win $_nWave2 {( "G2" 8 )} 
wvSelectSignal -win $_nWave2 {( "G2" 7 )} 
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSetCursor -win $_nWave2 165.295426 -snap {("G1" 1)}
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoom -win $_nWave2 137.458830 175.132419
wvZoomIn -win $_nWave2
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
wvSetCursor -win $_nWave2 143.077245 -snap {("G2" 9)}
wvZoom -win $_nWave2 133.749468 172.607153
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvScrollDown -win $_nWave2 0
wvZoom -win $_nWave2 149.452060 161.042069
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 146.846353 157.759844
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 139.968543 160.409463
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 136.080966 180.345588
wvZoom -win $_nWave2 145.904929 173.332527
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvZoom -win $_nWave2 143.257172 196.669736
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 134.846150 171.094060
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 55.429775 318.070183
wvZoom -win $_nWave2 83.563802 245.966210
wvZoom -win $_nWave2 122.107029 204.818710
wvZoom -win $_nWave2 136.007260 187.045514
wvZoom -win $_nWave2 142.129231 161.935610
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 2 )} 
wvZoom -win $_nWave2 141.081107 163.034552
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 51.370218 219.449964
wvZoom -win $_nWave2 77.568664 117.890554
wvZoom -win $_nWave2 89.181575 105.243085
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 84.622744 117.755402
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 130.405383 197.053245
wvZoom -win $_nWave2 138.912711 172.300767
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 141.172133 198.396564
wvZoom -win $_nWave2 161.617296 184.888809
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 5 )} 
wvSelectSignal -win $_nWave2 {( "G2" 7 )} 
wvSelectSignal -win $_nWave2 {( "G2" 7 9 )} 
wvZoom -win $_nWave2 124.829198 197.315707
wvZoom -win $_nWave2 138.312898 171.510696
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 97.885688 124.120253
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 90.641313 153.913902
wvZoom -win $_nWave2 98.880143 124.164827
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 143.505421 176.850713
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 146.617506 181.780854
wvZoom -win $_nWave2 162.924819 174.202352
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 139.483609 194.287067
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 132.892429 175.497812
wvZoom -win $_nWave2 140.981713 157.160281
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvScrollDown -win $_nWave2 13
wvScrollUp -win $_nWave2 11
wvSelectSignal -win $_nWave2 {( "G2" 5 )} 
wvSelectSignal -win $_nWave2 {( "G2" 4 )} 
wvSetCursor -win $_nWave2 147.462480 -snap {("G2" 4)}
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvSelectSignal -win $_nWave2 {( "G2" 4 )} 
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoom -win $_nWave2 130.931077 190.290541
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 8 )} 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 97.168284 281.452960
wvZoom -win $_nWave2 118.800160 224.950025
wvZoom -win $_nWave2 140.384193 188.114184
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 134.092652 155.768619
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 140.078222 164.020503
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 86.984656 274.468534
wvZoom -win $_nWave2 135.930095 209.288123
wvZoom -win $_nWave2 162.515910 180.678962
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvSetCursor -win $_nWave2 167.985796 -snap {("G1" 2)}
wvZoom -win $_nWave2 162.673191 184.249825
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
wvZoom -win $_nWave2 0.000000 2345.221296
wvZoom -win $_nWave2 64.685385 517.483083
wvZoom -win $_nWave2 127.711107 258.409609
wvZoom -win $_nWave2 152.526217 194.108293
wvZoom -win $_nWave2 163.835262 176.317886
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 135.455106 174.720526
wvZoom -win $_nWave2 141.147207 166.963150
wvSelectSignal -win $_nWave2 {( "G2" 5 )} 
wvSelectSignal -win $_nWave2 {( "G2" 4 )} 
wvSetCursor -win $_nWave2 143.001848 -snap {("G2" 3)}
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 138.207931 163.841723
wvSelectSignal -win $_nWave2 {( "G2" 5 )} 
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 10 )} 
wvSelectSignal -win $_nWave2 {( "G2" 11 )} 
wvSelectSignal -win $_nWave2 {( "G2" 3 )} 
wvSelectSignal -win $_nWave2 {( "G2" 2 3 )} 
wvScrollDown -win $_nWave2 2
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G4" 6 )} 
wvSelectSignal -win $_nWave2 {( "G4" 6 7 )} 
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvScrollDown -win $_nWave2 1
wvSetMarker -win $_nWave2 151.000000
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 160.413470 171.824536
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 131.190456 186.642818
wvZoom -win $_nWave2 143.212841 180.631626
wvSelectSignal -win $_nWave2 {( "G4" 1 )} 
wvSelectSignal -win $_nWave2 {( "G4" 1 2 )} 
wvZoom -win $_nWave2 145.709027 166.782595
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 143.904459 165.802586
wvZoomOut -win $_nWave2
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSetMarker -win $_nWave2 165.000000
wvSetMarker -win $_nWave2 163.000000
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G2" 4 )} 
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 146.004376 183.255071
wvZoom -win $_nWave2 149.851305 160.723060
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvSetCursor -win $_nWave2 153.076569 -snap {("G2" 4)}
srcActiveTrace "tb_DandRiscvSimple.u_DandRiscvSimple.pc_next\[63:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 153000 -TraceValue \
           0000000000000000000000000000000010000000000000000010001010000100
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G2" 6 )} 
wvSetCursor -win $_nWave2 153.174198 -snap {("G2" 6)}
srcActiveTrace "tb_DandRiscvSimple.u_DandRiscvSimple.fetch_state_next\[1:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 153000 -TraceValue 10
srcDeselectAll -win $_nTrace1
srcSelect -signal "BUSY" -line 1616 -pos 1 -win $_nTrace1
srcAction -pos 1615 5 2 -win $_nTrace1 -name "BUSY" -ctrlKey off
srcBackwardHistory -win $_nTrace1
srcHBSelect "tb_DandRiscvSimple.u_DandRiscvSimple" -win $_nTrace1
srcHBSelect "tb_DandRiscvSimple.u_DandRiscvSimple" -win $_nTrace1
wvSetCursor -win $_nWave2 155.098896 -snap {("G2" 5)}
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 3 )} 
wvSelectSignal -win $_nWave2 {( "G2" 5 )} 
wvSelectSignal -win $_nWave2 {( "G2" 4 )} 
wvSetCursor -win $_nWave2 152.846442 -snap {("G2" 4)}
srcActiveTrace "tb_DandRiscvSimple.u_DandRiscvSimple.pc_next\[63:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 151000 -TraceValue \
           0000000000000000000000000000000010000000000000000010001010000000
srcDeselectAll -win $_nTrace1
srcSelect -signal "pc_next_d1_valid" -line 3315 -pos 1 -win $_nTrace1
wvScrollUp -win $_nWave2 3
srcDeselectAll -win $_nTrace1
srcSelect -signal "when_FetchPlugin_l141" -line 3314 -pos 1 -win $_nTrace1
srcSelect -signal "pc_next_d1_valid" -line 3315 -pos 1 -win $_nTrace1
srcSelect -signal "pc_next_d1" -line 3316 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave2 {("G2" 6)}
wvSetPosition -win $_nWave2 {("G2" 14)}
wvSetPosition -win $_nWave2 {("G2" 15)}
wvSetPosition -win $_nWave2 {("G2" 16)}
wvAddSignal -win $_nWave2 \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/when_FetchPlugin_l141" \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/pc_next_d1_valid" \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/pc_next_d1\[63:0\]"
wvSetPosition -win $_nWave2 {("G2" 16)}
wvSetPosition -win $_nWave2 {("G2" 19)}
wvSetPosition -win $_nWave2 {("G2" 16)}
wvSetPosition -win $_nWave2 {("G2" 19)}
wvSetPosition -win $_nWave2 {("G2" 19)}
wvSetPosition -win $_nWave2 {("G2" 19)}
wvSetPosition -win $_nWave2 {("G2" 19)}
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 140.586951 193.864828
wvSelectSignal -win $_nWave2 {( "G2" 18 )} 
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 4 )} 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 105.803916 288.431864
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G2" 16 )} 
wvSelectSignal -win $_nWave2 {( "G2" 17 )} 
wvZoom -win $_nWave2 131.107083 221.776763
wvZoom -win $_nWave2 139.947231 195.023682
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 130.991567 207.794777
wvSelectSignal -win $_nWave2 {( "G2" 7 )} 
wvZoom -win $_nWave2 145.967947 173.408221
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 147.842475 181.143950
wvSelectSignal -win $_nWave2 {( "G2" 8 )} 
wvSelectSignal -win $_nWave2 {( "G2" 7 8 )} 
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
wvSetCursor -win $_nWave2 162.880472 -snap {("G2" 7)}
srcActiveTrace "tb_DandRiscvSimple.u_DandRiscvSimple.iCache_1.cpu_cmd_valid" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 155000 -TraceValue 1
wvScrollDown -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G2" 4 7 8 )} 
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
wvZoom -win $_nWave2 115.876049 251.901574
wvSelectSignal -win $_nWave2 {( "G2" 10 )} 
wvSelectSignal -win $_nWave2 {( "G2" 8 )} 
wvSetCursor -win $_nWave2 190.825328 -snap {("G2" 8)}
wvSelectSignal -win $_nWave2 {( "G2" 4 )} 
wvZoom -win $_nWave2 139.957540 227.994586
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 119.265068 423.752400
wvZoom -win $_nWave2 134.108581 311.840122
wvSelectSignal -win $_nWave2 {( "G2" 10 )} 
wvSelectSignal -win $_nWave2 {( "G2" 6 10 )} 
wvSelectSignal -win $_nWave2 {( "G2" 6 7 10 )} 
wvSelectSignal -win $_nWave2 {( "G2" 6 7 8 10 )} 
wvSelectSignal -win $_nWave2 {( "G2" 6 7 10 )} 
wvSelectSignal -win $_nWave2 {( "G2" 6 7 8 10 )} 
wvSelectSignal -win $_nWave2 {( "G2" 6 8 10 )} 
wvSelectSignal -win $_nWave2 {( "G2" 7 )} 
wvSelectSignal -win $_nWave2 {( "G2" 6 )} 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 103.515227 299.145326
wvSetCursor -win $_nWave2 156.093169 -snap {("G2" 6)}
srcActiveTrace "tb_DandRiscvSimple.u_DandRiscvSimple.fetch_state_next\[1:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 153000 -TraceValue 10
wvSelectSignal -win $_nWave2 {( "G2" 7 )} 
wvZoom -win $_nWave2 131.121784 234.018949
wvSetCursor -win $_nWave2 163.066767 -snap {("G2" 7)}
srcActiveTrace "tb_DandRiscvSimple.u_DandRiscvSimple.iCache_1.cpu_cmd_valid" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 155000 -TraceValue 1
wvScrollUp -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G2" 5 7 )} 
srcDeselectAll -win $_nTrace1
srcSelect -signal "fetch_FetchPlugin_fetch_flush" -line 1658 -pos 1 -win \
          $_nTrace1
srcAction -pos 1657 15 8 -win $_nTrace1 -name "fetch_FetchPlugin_fetch_flush" \
          -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "when_FetchPlugin_l113" -line 1577 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
debReload
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
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvZoom -win $_nWave2 0.000000 536.256288
wvSelectSignal -win $_nWave2 {( "G2" 5 )} 
wvSelectSignal -win $_nWave2 {( "G2" 4 )} 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvZoom -win $_nWave2 0.000000 389.860500
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 2068.118501 2348.092204
wvZoom -win $_nWave2 2219.844183 2281.589400
wvZoom -win $_nWave2 2252.758238 2269.067004
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 0.000000 959.319331
wvZoom -win $_nWave2 60.245396 303.353287
wvZoom -win $_nWave2 83.415634 209.953875
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 80.926868 188.140885
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 81.674241 142.822920
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 138.056578 165.414605
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 169.350139 -snap {("G2" 4)}
wvZoom -win $_nWave2 186.964687 201.597244
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 4 5 )} 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G3" 1 )} 
wvSetCursor -win $_nWave2 169.578093 -snap {("G3" 1)}
srcActiveTrace "tb_DandRiscvSimple.u_DandRiscvSimple.decode_arbitration_isValid" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 169000 -TraceValue 0
srcDeselectAll -win $_nTrace1
srcSelect -signal "fetch_arbitration_isValid" -line 3341 -pos 1 -win $_nTrace1
srcAction -pos 3340 5 6 -win $_nTrace1 -name "fetch_arbitration_isValid" -ctrlKey \
          off
srcDeselectAll -win $_nTrace1
srcSelect -signal "fetch_FetchPlugin_fetch_flush" -line 1625 -pos 1 -win \
          $_nTrace1
srcAction -pos 1624 25 10 -win $_nTrace1 -name "fetch_FetchPlugin_fetch_flush" \
          -ctrlKey off
srcDeselectAll -win $_nTrace1
srcBackwardHistory -win $_nTrace1
srcHBSelect "tb_DandRiscvSimple.u_DandRiscvSimple" -win $_nTrace1
srcHBSelect "tb_DandRiscvSimple.u_DandRiscvSimple" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "fetch_FetchPlugin_fifo_all_valid" -line 1625 -pos 1 -win \
          $_nTrace1
srcAction -pos 1624 9 18 -win $_nTrace1 -name "fetch_FetchPlugin_fifo_all_valid" \
          -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "fetch_FetchPlugin_instruction_out_stream_valid" -line 1569 \
          -pos 1 -win $_nTrace1
srcAction -pos 1568 13 13 -win $_nTrace1 -name \
          "fetch_FetchPlugin_instruction_out_stream_valid" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "fetch_FetchPlugin_instruction_stream_fifo_ports_m_ports_valid" \
          -line 1622 -pos 1 -win $_nTrace1
srcAction -pos 1621 7 15 -win $_nTrace1 -name \
          "fetch_FetchPlugin_instruction_stream_fifo_ports_m_ports_valid" \
          -ctrlKey off
srcHBSelect \
           "tb_DandRiscvSimple.u_DandRiscvSimple.fetch_FetchPlugin_instruction_stream_fifo" \
           -win $_nTrace1
srcSetScope -win $_nTrace1 \
           "tb_DandRiscvSimple.u_DandRiscvSimple.fetch_FetchPlugin_instruction_stream_fifo" \
           -delim "."
srcHBSelect \
           "tb_DandRiscvSimple.u_DandRiscvSimple.fetch_FetchPlugin_instruction_stream_fifo" \
           -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "ports_s_ports_valid" -line 52955 -pos 1 -win $_nTrace1
srcAction -pos 52954 3 17 -win $_nTrace1 -name "ports_s_ports_valid" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "ICachePlugin_icache_access_rsp_valid" -line 1618 -pos 1 -win \
          $_nTrace1
srcSelect -signal "rsp_flush" -line 1618 -pos 1 -win $_nTrace1
srcSelect -signal "fetch_FetchPlugin_fetch_flush" -line 1618 -pos 1 -win \
          $_nTrace1
wvSetPosition -win $_nWave2 {("G1" 0)}
wvSetPosition -win $_nWave2 {("G1" 3)}
wvSetPosition -win $_nWave2 {("G2" 6)}
wvSetPosition -win $_nWave2 {("G2" 14)}
wvSetPosition -win $_nWave2 {("G2" 15)}
wvSetPosition -win $_nWave2 {("G2" 16)}
wvAddSignal -win $_nWave2 \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/ICachePlugin_icache_access_rsp_valid" \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/rsp_flush" \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/fetch_FetchPlugin_fetch_flush"
wvSetPosition -win $_nWave2 {("G2" 16)}
wvSetPosition -win $_nWave2 {("G2" 19)}
wvSetPosition -win $_nWave2 {("G2" 16)}
wvSetPosition -win $_nWave2 {("G2" 19)}
wvSetPosition -win $_nWave2 {("G2" 19)}
wvSetPosition -win $_nWave2 {("G2" 19)}
wvSetPosition -win $_nWave2 {("G2" 19)}
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 18 )} 
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 131.077220 256.742882
wvSelectSignal -win $_nWave2 {( "G2" 18 )} 
wvSetCursor -win $_nWave2 168.665428 -snap {("G2" 18)}
srcActiveTrace "tb_DandRiscvSimple.u_DandRiscvSimple.rsp_flush" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 0 -TraceValue 0
srcDeselectAll -win $_nTrace1
srcSelect -signal "when_FetchPlugin_l96" -line 3255 -pos 1 -win $_nTrace1
srcAction -pos 3254 3 12 -win $_nTrace1 -name "when_FetchPlugin_l96" -ctrlKey off
srcBackwardHistory -win $_nTrace1
srcHBSelect "tb_DandRiscvSimple.u_DandRiscvSimple" -win $_nTrace1
srcHBSelect "tb_DandRiscvSimple.u_DandRiscvSimple" -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G2" 4 )} 
wvSelectSignal -win $_nWave2 {( "G2" 18 )} 
wvSelectSignal -win $_nWave2 {( "G2" 15 )} 
wvSelectSignal -win $_nWave2 {( "G2" 10 )} 
wvSetCursor -win $_nWave2 193.113691 -snap {("G2" 10)}
wvSetCursor -win $_nWave2 192.396967 -snap {("G2" 10)}
srcActiveTrace "tb_DandRiscvSimple.u_DandRiscvSimple.iCache_1.cpu_rsp_valid" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 157000 -TraceValue 0
srcDeselectAll -win $_nTrace1
srcBackwardHistory -win $_nTrace1
srcHBSelect "tb_DandRiscvSimple.u_DandRiscvSimple.iCache_1" -win $_nTrace1
srcHBSelect "tb_DandRiscvSimple.u_DandRiscvSimple" -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G2" 18 )} 
wvSetCursor -win $_nWave2 169.939605 -snap {("G2" 18)}
srcActiveTrace "tb_DandRiscvSimple.u_DandRiscvSimple.rsp_flush" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 169000 -TraceValue 1
wvSetCursor -win $_nWave2 238.824775 -snap {("G2" 18)}
srcActiveTrace "tb_DandRiscvSimple.u_DandRiscvSimple.rsp_flush" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 169000 -TraceValue 1
srcDeselectAll -win $_nTrace1
srcSelect -signal "ICachePlugin_icache_access_rsp_valid" -line 3264 -pos 1 -win \
          $_nTrace1
wvSetPosition -win $_nWave2 {("G1" 0)}
wvSetPosition -win $_nWave2 {("G1" 3)}
wvSetPosition -win $_nWave2 {("G1" 4)}
wvSetPosition -win $_nWave2 {("G2" 6)}
wvSetPosition -win $_nWave2 {("G2" 16)}
wvSetPosition -win $_nWave2 {("G2" 17)}
wvSetPosition -win $_nWave2 {("G2" 18)}
wvSetPosition -win $_nWave2 {("G2" 19)}
wvAddSignal -win $_nWave2 \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/ICachePlugin_icache_access_rsp_valid"
wvSetPosition -win $_nWave2 {("G2" 19)}
wvSetPosition -win $_nWave2 {("G2" 20)}
wvSetPosition -win $_nWave2 {("G2" 19)}
wvSetPosition -win $_nWave2 {("G2" 20)}
wvSetPosition -win $_nWave2 {("G2" 20)}
wvSetPosition -win $_nWave2 {("G2" 20)}
wvSetPosition -win $_nWave2 {("G2" 20)}
wvSetCursor -win $_nWave2 193.113691 -snap {("G2" 20)}
wvSetCursor -win $_nWave2 169.063608 -snap {("G2" 18)}
srcActiveTrace "tb_DandRiscvSimple.u_DandRiscvSimple.rsp_flush" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 0 -TraceValue 0
srcDeselectAll -win $_nTrace1
srcSelect -signal "when_FetchPlugin_l92" -line 3251 -pos 1 -win $_nTrace1
srcSelect -signal "when_FetchPlugin_l93" -line 3252 -pos 1 -win $_nTrace1
srcSelect -signal "when_FetchPlugin_l96" -line 3255 -pos 1 -win $_nTrace1
srcSelect -signal "fetch_BPU_BRANCH_TAKEN" -line 3258 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvScrollDown -win $_nWave2 1
srcDeselectAll -win $_nTrace1
debReload
wvSelectSignal -win $_nWave2 {( "G2" 10 )} 
wvSelectSignal -win $_nWave2 {( "G2" 18 )} 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 0.000000 488.009618
wvSelectSignal -win $_nWave2 {( "G2" 10 )} 
wvZoom -win $_nWave2 102.673760 297.506497
wvSelectSignal -win $_nWave2 {( "G2" 4 )} 
wvZoom -win $_nWave2 135.392819 284.789278
wvZoom -win $_nWave2 224.102884 267.179809
wvZoom -win $_nWave2 229.890151 250.527766
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 180.780999 283.105901
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 197.057013 -snap {("G2" 4)}
wvZoom -win $_nWave2 179.678639 237.001335
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 5 )} 
wvZoom -win $_nWave2 186.544285 219.891709
wvSelectSignal -win $_nWave2 {( "G2" 7 )} 
wvSelectSignal -win $_nWave2 {( "G2" 8 )} 
wvSelectSignal -win $_nWave2 {( "G2" 7 )} 
wvSelectSignal -win $_nWave2 {( "G2" 8 )} 
wvSelectSignal -win $_nWave2 {( "G2" 8 )} 
wvSelectSignal -win $_nWave2 {( "G2" 7 )} 
wvSelectSignal -win $_nWave2 {( "G2" 8 )} 
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 17 )} 
wvSelectSignal -win $_nWave2 {( "G2" 17 )} {( "G3" 1 )} 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 228.239131 260.529919
wvSetCursor -win $_nWave2 239.043653 -snap {("G3" 1)}
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G3" 3 )} 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSelectSignal -win $_nWave2 {( "G2" 7 )} 
wvSelectSignal -win $_nWave2 {( "G2" 7 )} 
wvSelectSignal -win $_nWave2 {( "G2" 7 8 )} 
wvSelectSignal -win $_nWave2 {( "G2" 7 8 9 )} 
wvSelectSignal -win $_nWave2 {( "G2" 7 8 9 10 )} 
wvSelectSignal -win $_nWave2 {( "G2" 7 8 9 10 11 )} 
wvSelectSignal -win $_nWave2 {( "G2" 7 8 9 10 11 12 )} 
wvSelectSignal -win $_nWave2 {( "G2" 7 8 9 10 11 12 13 )} 
wvSelectSignal -win $_nWave2 {( "G2" 7 8 9 10 11 12 13 14 )} 
wvSelectSignal -win $_nWave2 {( "G2" 7 8 9 10 11 12 13 14 15 )} 
wvSelectSignal -win $_nWave2 {( "G2" 7 8 9 10 11 12 13 14 15 16 )} 
wvSelectSignal -win $_nWave2 {( "G2" 7 8 9 10 11 12 13 14 15 16 17 )} 
wvSelectSignal -win $_nWave2 {( "G2" 7 8 9 10 11 12 13 14 15 16 17 18 )} 
wvSelectSignal -win $_nWave2 {( "G2" 7 8 9 10 11 12 13 14 15 16 17 18 19 )} 
wvSelectSignal -win $_nWave2 {( "G2" 7 8 9 10 11 12 13 14 15 16 17 18 19 21 )} \
           
wvSelectSignal -win $_nWave2 {( "G2" 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 \
           )} 
wvSelectSignal -win $_nWave2 {( "G2" 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 \
           22 )} 
wvSelectSignal -win $_nWave2 {( "G2" 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 \
           22 23 )} 
wvSelectSignal -win $_nWave2 {( "G2" 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 \
           22 23 24 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G5" 4)}
wvSetPosition -win $_nWave2 {("G2" 6)}
wvSetPosition -win $_nWave2 {("G2" 6)}
wvSetPosition -win $_nWave2 {("G2" 6)}
wvSetPosition -win $_nWave2 {("G2" 6)}
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvZoom -win $_nWave2 283.673697 346.045257
wvSetMarker -win $_nWave2 331.000000
wvZoom -win $_nWave2 323.683792 344.474312
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G4" 3 )} 
wvZoom -win $_nWave2 330.126482 344.118581
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 231.995582 313.713697
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 233.083085 327.333382
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G5" 3 )} 
wvZoom -win $_nWave2 239.892042 273.578460
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 282.181519 303.272888
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 283.852254 346.190751
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoom -win $_nWave2 279.941284 345.835208
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G5" 5 )} 
wvSelectSignal -win $_nWave2 {( "G5" 4 )} 
wvSelectSignal -win $_nWave2 {( "G5" 5 )} 
wvSelectSignal -win $_nWave2 {( "G5" 4 )} 
wvSelectSignal -win $_nWave2 {( "G5" 6 )} 
wvSelectSignal -win $_nWave2 {( "G5" 7 )} 
wvSelectSignal -win $_nWave2 {( "G5" 6 )} 
wvSelectSignal -win $_nWave2 {( "G5" 8 )} 
wvSelectSignal -win $_nWave2 {( "G5" 8 )} 
wvSelectSignal -win $_nWave2 {( "G5" 5 )} 
wvSelectSignal -win $_nWave2 {( "G5" 8 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G2" 6)}
wvSetPosition -win $_nWave2 {("G2" 6)}
wvSetPosition -win $_nWave2 {("G2" 6)}
wvSetPosition -win $_nWave2 {("G2" 6)}
wvSelectSignal -win $_nWave2 {( "G5" 7 )} 
wvSelectSignal -win $_nWave2 {( "G5" 1 )} 
wvSelectSignal -win $_nWave2 {( "G5" 2 )} 
wvSetCursor -win $_nWave2 331.261710 -snap {("G5" 2)}
srcActiveTrace "tb_DandRiscvSimple.u_DandRiscvSimple.memaccess_PC\[63:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 331000 -TraceValue \
           0000000000000000000000000000000010000000000000000010011101100100
srcHBSelect "tb_DandRiscvSimple.u_DandRiscvSimple.dCache_1" -win $_nTrace1
srcSetScope -win $_nTrace1 "tb_DandRiscvSimple.u_DandRiscvSimple.dCache_1" -delim \
           "."
srcHBSelect "tb_DandRiscvSimple.u_DandRiscvSimple.dCache_1" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "cpu_cmd_valid" -line 5232 -pos 1 -win $_nTrace1
srcSelect -signal "cpu_cmd_ready" -line 5233 -pos 1 -win $_nTrace1
srcSelect -signal "cpu_cmd_payload_addr" -line 5234 -pos 1 -win $_nTrace1
srcSelect -signal "cpu_cmd_payload_wen" -line 5235 -pos 1 -win $_nTrace1
srcSelect -signal "cpu_cmd_payload_wdata" -line 5236 -pos 1 -win $_nTrace1
srcSelect -toggle -signal "cpu_cmd_payload_wdata" -line 5236 -pos 1 -win \
          $_nTrace1
srcSelect -signal "cpu_rsp_valid" -line 5238 -pos 1 -win $_nTrace1
srcSelect -signal "cpu_rsp_payload_data" -line 5239 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave2 {("G3" 3)}
wvSetPosition -win $_nWave2 {("G3" 4)}
wvSetPosition -win $_nWave2 {("G4" 0)}
wvSetPosition -win $_nWave2 {("G4" 1)}
wvSetPosition -win $_nWave2 {("G4" 2)}
wvSetPosition -win $_nWave2 {("G4" 3)}
wvSetPosition -win $_nWave2 {("G4" 4)}
wvSetPosition -win $_nWave2 {("G4" 5)}
wvSetPosition -win $_nWave2 {("G4" 6)}
wvSetPosition -win $_nWave2 {("G4" 7)}
wvSetPosition -win $_nWave2 {("G5" 0)}
wvSetPosition -win $_nWave2 {("G5" 1)}
wvSetPosition -win $_nWave2 {("G5" 2)}
wvSetPosition -win $_nWave2 {("G5" 3)}
wvSetPosition -win $_nWave2 {("G5" 4)}
wvSetPosition -win $_nWave2 {("G5" 5)}
wvSetPosition -win $_nWave2 {("G5" 6)}
wvSetPosition -win $_nWave2 {("G5" 7)}
wvAddSignal -win $_nWave2 \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/dCache_1/cpu_cmd_valid" \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/dCache_1/cpu_cmd_ready" \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/dCache_1/cpu_cmd_payload_addr\[63:0\]" \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/dCache_1/cpu_cmd_payload_wen" \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/dCache_1/cpu_rsp_valid" \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/dCache_1/cpu_rsp_payload_data\[63:0\]"
wvSetPosition -win $_nWave2 {("G5" 7)}
wvSetPosition -win $_nWave2 {("G5" 13)}
wvSetPosition -win $_nWave2 {("G5" 7)}
wvSetPosition -win $_nWave2 {("G5" 13)}
wvSetPosition -win $_nWave2 {("G5" 13)}
wvSetPosition -win $_nWave2 {("G5" 13)}
wvSetPosition -win $_nWave2 {("G5" 13)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "stall" -line 5230 -pos 1 -win $_nTrace1
srcSelect -signal "flush" -line 5231 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G5" 9 )} 
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
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
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSelectSignal -win $_nWave2 {( "G5" 6 )} 
wvSelectSignal -win $_nWave2 {( "G5" 4 )} 
wvSelectSignal -win $_nWave2 {( "G5" 4 5 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G6" 1)}
wvSetPosition -win $_nWave2 {("G5" 13)}
wvSetPosition -win $_nWave2 {("G5" 13)}
wvSetPosition -win $_nWave2 {("G5" 13)}
wvSetPosition -win $_nWave2 {("G5" 13)}
wvSelectSignal -win $_nWave2 {( "G5" 4 )} 
wvSelectSignal -win $_nWave2 {( "G5" 4 5 )} 
wvSelectSignal -win $_nWave2 {( "G5" 4 5 6 )} 
wvSelectSignal -win $_nWave2 {( "G5" 4 5 6 7 )} 
wvSelectSignal -win $_nWave2 {( "G5" 4 5 6 7 8 )} 
wvSelectSignal -win $_nWave2 {( "G5" 4 5 6 7 8 9 )} 
wvSelectSignal -win $_nWave2 {( "G5" 4 5 6 7 8 9 10 )} 
wvSelectSignal -win $_nWave2 {( "G5" 4 5 6 7 8 9 10 11 )} 
wvSelectSignal -win $_nWave2 {( "G5" 4 5 6 7 8 9 10 11 12 )} 
wvSelectSignal -win $_nWave2 {( "G5" 4 5 6 7 8 9 10 11 12 13 )} 
wvSetPosition -win $_nWave2 {("G5" 4)}
wvSetPosition -win $_nWave2 {("G5" 5)}
wvSetPosition -win $_nWave2 {("G5" 6)}
wvSetPosition -win $_nWave2 {("G5" 7)}
wvSetPosition -win $_nWave2 {("G5" 8)}
wvSetPosition -win $_nWave2 {("G5" 9)}
wvSetPosition -win $_nWave2 {("G5" 10)}
wvSetPosition -win $_nWave2 {("G5" 11)}
wvSetPosition -win $_nWave2 {("G5" 12)}
wvSetPosition -win $_nWave2 {("G6" 0)}
wvSetPosition -win $_nWave2 {("G6" 1)}
wvSetPosition -win $_nWave2 {("G6" 2)}
wvSetPosition -win $_nWave2 {("G6" 3)}
wvSetPosition -win $_nWave2 {("G6" 4)}
wvSetPosition -win $_nWave2 {("G6" 5)}
wvSetPosition -win $_nWave2 {("G6" 6)}
wvSetPosition -win $_nWave2 {("G6" 7)}
wvSetPosition -win $_nWave2 {("G6" 8)}
wvSetPosition -win $_nWave2 {("G6" 9)}
wvSetPosition -win $_nWave2 {("G6" 10)}
wvSetPosition -win $_nWave2 {("G6" 11)}
wvSetPosition -win $_nWave2 {("G6" 12)}
wvSetPosition -win $_nWave2 {("G6" 13)}
wvSetPosition -win $_nWave2 {("G6" 14)}
wvSetPosition -win $_nWave2 {("G6" 15)}
wvSetPosition -win $_nWave2 {("G6" 16)}
wvSetPosition -win $_nWave2 {("G6" 17)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G6" 27)}
wvSetPosition -win $_nWave2 {("G6" 27)}
wvSetPosition -win $_nWave2 {("G6" 27)}
wvSetPosition -win $_nWave2 {("G6" 27)}
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G6" 22 )} 
wvSelectSignal -win $_nWave2 {( "G6" 23 )} 
wvSelectSignal -win $_nWave2 {( "G6" 24 )} 
wvSelectSignal -win $_nWave2 {( "G6" 25 )} 
wvSelectSignal -win $_nWave2 {( "G6" 24 )} 
wvSelectSignal -win $_nWave2 {( "G6" 23 )} 
wvSetCursor -win $_nWave2 289.587353 -snap {("G6" 22)}
wvSelectSignal -win $_nWave2 {( "G6" 22 )} 
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G5" 2 )} 
wvSelectSignal -win $_nWave2 {( "G5" 3 )} 
wvSelectSignal -win $_nWave2 {( "G5" 2 )} 
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
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
wvZoom -win $_nWave2 321.198063 342.160515
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoom -win $_nWave2 274.610407 384.072135
wvZoom -win $_nWave2 319.629838 349.180343
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 325.865781 343.768368
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 282.357276 349.248057
wvZoom -win $_nWave2 327.332636 339.540840
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
wvSetMarker -win $_nWave2 289.000000
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvSelectSignal -win $_nWave2 {( "G6" 22 )} 
wvZoom -win $_nWave2 276.867420 373.418991
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSelectSignal -win $_nWave2 {( "G6" 24 )} 
wvSelectSignal -win $_nWave2 {( "G6" 25 )} 
wvZoom -win $_nWave2 309.296021 343.866134
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvScrollDown -win $_nWave2 0
srcDeselectAll -win $_nTrace1
srcSelect -signal "next_level_cmd_valid" -line 5268 -pos 1 -win $_nTrace1
srcSelect -signal "next_level_cmd_ready" -line 5269 -pos 1 -win $_nTrace1
srcSelect -signal "next_level_cmd_payload_addr" -line 5270 -pos 1 -win $_nTrace1
srcSelect -toggle -signal "next_level_cmd_payload_addr" -line 5270 -pos 1 -win \
          $_nTrace1
srcSelect -signal "next_level_cmd_payload_addr" -line 5270 -pos 1 -win $_nTrace1
srcSelect -signal "next_level_cmd_payload_len" -line 5271 -pos 1 -win $_nTrace1
srcSelect -signal "next_level_cmd_payload_size" -line 5272 -pos 1 -win $_nTrace1
srcSelect -signal "next_level_cmd_payload_wen" -line 5273 -pos 1 -win $_nTrace1
srcSelect -signal "next_level_cmd_payload_wdata" -line 5274 -pos 1 -win $_nTrace1
srcSelect -signal "next_level_cmd_payload_wstrb" -line 5275 -pos 1 -win $_nTrace1
srcSelect -signal "next_level_rsp_valid" -line 5276 -pos 1 -win $_nTrace1
srcSelect -signal "next_level_rsp_payload_data" -line 5277 -pos 1 -win $_nTrace1
srcSelect -signal "next_level_rsp_payload_bresp" -line 5278 -pos 1 -win $_nTrace1
srcSelect -signal "next_level_rsp_payload_rvalid" -line 5279 -pos 1 -win \
          $_nTrace1
wvSetPosition -win $_nWave2 {("G4" 5)}
wvSetPosition -win $_nWave2 {("G4" 4)}
wvSetPosition -win $_nWave2 {("G6" 9)}
wvSetPosition -win $_nWave2 {("G6" 20)}
wvSetPosition -win $_nWave2 {("G6" 21)}
wvSetPosition -win $_nWave2 {("G6" 22)}
wvSetPosition -win $_nWave2 {("G6" 23)}
wvSetPosition -win $_nWave2 {("G6" 24)}
wvSetPosition -win $_nWave2 {("G6" 25)}
wvSetPosition -win $_nWave2 {("G6" 26)}
wvSetPosition -win $_nWave2 {("G6" 27)}
wvSetPosition -win $_nWave2 {("G7" 0)}
wvSetPosition -win $_nWave2 {("G6" 27)}
wvAddSignal -win $_nWave2 \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/dCache_1/next_level_cmd_valid" \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/dCache_1/next_level_cmd_ready" \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/dCache_1/next_level_cmd_payload_addr\[63:0\]" \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/dCache_1/next_level_cmd_payload_len\[3:0\]" \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/dCache_1/next_level_cmd_payload_size\[2:0\]" \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/dCache_1/next_level_cmd_payload_wen" \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/dCache_1/next_level_cmd_payload_wdata\[63:0\]" \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/dCache_1/next_level_cmd_payload_wstrb\[7:0\]" \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/dCache_1/next_level_rsp_valid" \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/dCache_1/next_level_rsp_payload_data\[63:0\]" \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/dCache_1/next_level_rsp_payload_bresp\[1:0\]" \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/dCache_1/next_level_rsp_payload_rvalid"
wvSetPosition -win $_nWave2 {("G6" 27)}
wvSetPosition -win $_nWave2 {("G6" 39)}
wvSetPosition -win $_nWave2 {("G6" 27)}
wvSetPosition -win $_nWave2 {("G6" 39)}
wvSetPosition -win $_nWave2 {("G6" 39)}
wvSetPosition -win $_nWave2 {("G6" 39)}
wvSetPosition -win $_nWave2 {("G6" 39)}
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvZoom -win $_nWave2 282.941240 337.885373
wvSelectSignal -win $_nWave2 {( "G6" 28 )} 
wvSelectSignal -win $_nWave2 {( "G6" 29 )} 
wvSelectSignal -win $_nWave2 {( "G6" 28 )} 
wvSelectSignal -win $_nWave2 {( "G6" 29 )} 
wvSelectSignal -win $_nWave2 {( "G6" 28 )} 
wvSetCursor -win $_nWave2 291.367400 -snap {("G6" 28)}
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
srcHBSelect "tb_DandRiscvSimple" -win $_nTrace1
srcSetScope -win $_nTrace1 "tb_DandRiscvSimple" -delim "."
srcHBSelect "tb_DandRiscvSimple" -win $_nTrace1
srcHBSelect "tb_DandRiscvSimple.u_DandRiscvSimple" -win $_nTrace1
srcSetScope -win $_nTrace1 "tb_DandRiscvSimple.u_DandRiscvSimple" -delim "."
srcHBSelect "tb_DandRiscvSimple.u_DandRiscvSimple" -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G6" 1 )} 
wvSelectSignal -win $_nWave2 {( "G6" 1 2 )} 
wvSelectSignal -win $_nWave2 {( "G6" 1 2 3 )} 
wvSelectSignal -win $_nWave2 {( "G6" 1 2 3 4 )} 
wvSelectSignal -win $_nWave2 {( "G6" 1 2 3 4 5 )} 
wvSelectSignal -win $_nWave2 {( "G6" 1 2 3 4 5 6 )} 
wvSelectSignal -win $_nWave2 {( "G6" 1 2 3 4 5 6 7 )} 
wvSelectSignal -win $_nWave2 {( "G6" 1 2 3 4 5 6 7 8 )} 
wvSelectSignal -win $_nWave2 {( "G6" 1 2 3 4 5 6 7 8 9 )} 
wvSelectSignal -win $_nWave2 {( "G6" 1 2 3 4 5 6 7 8 9 10 )} 
wvSelectSignal -win $_nWave2 {( "G6" 1 2 3 4 5 6 7 8 9 10 11 )} 
wvSelectSignal -win $_nWave2 {( "G6" 1 2 3 4 5 6 7 8 9 10 11 12 )} 
wvSelectSignal -win $_nWave2 {( "G6" 1 2 3 4 5 6 7 8 9 10 11 12 13 )} 
wvSelectSignal -win $_nWave2 {( "G6" 1 2 3 4 5 6 7 8 9 10 11 12 13 14 )} 
wvSelectSignal -win $_nWave2 {( "G6" 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 )} 
wvSelectSignal -win $_nWave2 {( "G6" 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 )} \
           
wvSelectSignal -win $_nWave2 {( "G6" 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 \
           )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G6" 22)}
wvSetPosition -win $_nWave2 {("G6" 22)}
wvSetPosition -win $_nWave2 {("G6" 22)}
wvSetPosition -win $_nWave2 {("G6" 22)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "dcache_ar_valid" -line 21 -pos 1 -win $_nTrace1
srcSelect -signal "dcache_ar_ready" -line 22 -pos 1 -win $_nTrace1
srcSelect -signal "dcache_ar_payload_id" -line 24 -pos 1 -win $_nTrace1
srcSelect -toggle -signal "dcache_ar_payload_id" -line 24 -pos 1 -win $_nTrace1
srcSelect -signal "dcache_ar_payload_addr" -line 23 -pos 1 -win $_nTrace1
srcSelect -signal "dcache_ar_payload_id" -line 24 -pos 1 -win $_nTrace1
srcSelect -signal "dcache_ar_payload_len" -line 25 -pos 1 -win $_nTrace1
srcSelect -signal "dcache_ar_payload_size" -line 26 -pos 1 -win $_nTrace1
srcSelect -signal "dcache_ar_payload_burst" -line 27 -pos 1 -win $_nTrace1
srcSelect -signal "dcache_r_valid" -line 28 -pos 1 -win $_nTrace1
srcSelect -signal "dcache_r_ready" -line 29 -pos 1 -win $_nTrace1
srcSelect -signal "dcache_r_payload_data" -line 30 -pos 1 -win $_nTrace1
srcSelect -signal "dcache_r_payload_id" -line 31 -pos 1 -win $_nTrace1
srcSelect -signal "dcache_r_payload_resp" -line 32 -pos 1 -win $_nTrace1
srcSelect -signal "dcache_r_payload_last" -line 33 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSelectSignal -win $_nWave2 {( "G6" 25 )} 
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoom -win $_nWave2 287.989972 335.030228
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 282.832834 347.401398
wvZoom -win $_nWave2 328.988309 337.499248
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 273.958456 352.056297
wvSelectSignal -win $_nWave2 {( "G6" 23 )} 
wvSelectSignal -win $_nWave2 {( "G6" 24 )} 
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSelectSignal -win $_nWave2 {( "G6" 30 )} 
wvSelectSignal -win $_nWave2 {( "G6" 31 )} 
wvSelectSignal -win $_nWave2 {( "G6" 32 )} 
wvSelectSignal -win $_nWave2 {( "G6" 33 )} 
wvSelectSignal -win $_nWave2 {( "G6" 34 )} 
wvSelectSignal -win $_nWave2 {( "G6" 35 )} 
wvSelectSignal -win $_nWave2 {( "G6" 32 )} 
wvSelectSignal -win $_nWave2 {( "G6" 29 )} 
wvSelectSignal -win $_nWave2 {( "G6" 28 )} 
wvSelectSignal -win $_nWave2 {( "G6" 27 )} 
wvSelectSignal -win $_nWave2 {( "G6" 28 )} 
wvSelectSignal -win $_nWave2 {( "G6" 26 )} 
wvSelectSignal -win $_nWave2 {( "G6" 25 )} 
wvZoom -win $_nWave2 328.795217 341.415590
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 270.867862 387.698291
wvSelectSignal -win $_nWave2 {( "G6" 21 )} 
wvSelectSignal -win $_nWave2 {( "G6" 19 )} 
wvSelectSignal -win $_nWave2 {( "G6" 31 )} 
wvSelectSignal -win $_nWave2 {( "G6" 32 )} 
wvSelectSignal -win $_nWave2 {( "G6" 32 )} 
wvSetCursor -win $_nWave2 282.713786 -snap {("G6" 32)}
srcActiveTrace \
           "tb_DandRiscvSimple.u_DandRiscvSimple.dcache_r_payload_data\[63:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 281000 -TraceValue \
           0000000000000000000000000000000000000000000000000000000000000000
srcDeselectAll -win $_nTrace1
srcSelect -signal "axi_mem_rdata" -line 114 -pos 1 -win $_nTrace1
srcAction -pos 113 7 4 -win $_nTrace1 -name "axi_mem_rdata" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "ram_d\[ram_d_mem_raddr\]" -line 159 -pos 1 -win $_nTrace1
srcAction -pos 158 5 1 -win $_nTrace1 -name "ram_d\[ram_d_mem_raddr\]" -ctrlKey \
          off
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcBackwardHistory -win $_nTrace1
srcHBSelect "tb_DandRiscvSimple" -win $_nTrace1
srcHBSelect "tb_DandRiscvSimple" -win $_nTrace1
srcBackwardHistory -win $_nTrace1
srcHBSelect "tb_DandRiscvSimple" -win $_nTrace1
srcHBSelect "tb_DandRiscvSimple.u_axi_slave_mem_d" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "axi_mem_rdata" -line 114 -pos 1 -win $_nTrace1
srcAction -pos 113 7 2 -win $_nTrace1 -name "axi_mem_rdata" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "ram_d_mem_raddr" -win $_nTrace1
srcSelect -signal "ram_d_mem_read" -line 153 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
srcDeselectAll -win $_nTrace1
srcSelect -signal "ram_d_mem_raddr" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "ram_d_mem_raddr" -win $_nTrace1
srcAction -pos 158 5 9 -win $_nTrace1 -name "ram_d\[ram_d_mem_raddr\]" -ctrlKey \
          off
srcBackwardHistory -win $_nTrace1
srcHBSelect "tb_DandRiscvSimple.u_axi_slave_mem_d" -win $_nTrace1
srcHBSelect "tb_DandRiscvSimple" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "ram_d_mem_raddr" -win $_nTrace1
srcSearchString "ram_d\[ram_d_mem_raddr\]" -win $_nTrace1 -next -case
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "ram_d_mem_raddr" -win $_nTrace1
srcSearchString "ram_d\[ram_d_mem_raddr\]" -win $_nTrace1 -prev -case
srcSelect -win $_nTrace1 -range {159 159 6 7 1 1}
srcSearchString "ram_d\[ram_d_mem_raddr\]" -win $_nTrace1 -prev -case
srcSelect -win $_nTrace1 -range {159 159 6 7 1 1}
srcSearchString "ram_d\[ram_d_mem_raddr\]" -win $_nTrace1 -prev -case
srcSelect -win $_nTrace1 -range {159 159 6 7 1 1}
srcSearchString "ram_d_mem_raddr" -win $_nTrace1 -prev -case
srcSelect -win $_nTrace1 -range {38 38 11 12 1 1}
srcDeselectAll -win $_nTrace1
srcSelect -signal "ram_d_mem_raddr" -line 38 -pos 1 -win $_nTrace1
srcSearchString "ram_d_mem_raddr" -win $_nTrace1 -next -case
srcSearchString "ram_d_mem_raddr" -win $_nTrace1 -next -case
srcDeselectAll -win $_nTrace1
srcSelect -signal "ram_d_mem_raddr" -line 415 -pos 1 -win $_nTrace1
srcAction -pos 414 6 4 -win $_nTrace1 -name "ram_d_mem_raddr" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "sig_ar_addr\[AXI_RD_ADDR_BITS+ADDR_LSB-1:ADDR_LSB\]" -line 346 \
          -pos 1 -win $_nTrace1
srcAction -pos 345 7 4 -win $_nTrace1 -name \
          "sig_ar_addr\[AXI_RD_ADDR_BITS+ADDR_LSB-1:ADDR_LSB\]" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "sig_ar_addr\[AXI_ADDR_WIDTH-1:ADDR_LSB\]" -line 300 -pos 1 \
          -win $_nTrace1
srcAction -pos 299 1 3 -win $_nTrace1 -name \
          "sig_ar_addr\[AXI_ADDR_WIDTH-1:ADDR_LSB\]" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "sig_ar_addr\[AXI_ADDR_WIDTH-1:ADDR_LSB\]" -line 300 -pos 2 \
          -win $_nTrace1
srcAction -pos 299 5 4 -win $_nTrace1 -name \
          "sig_ar_addr\[AXI_ADDR_WIDTH-1:ADDR_LSB\]" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "ADDR_LSB" -win $_nTrace1
srcAction -pos 299 5 31 -win $_nTrace1 -name \
          "sig_ar_addr\[AXI_ADDR_WIDTH-1:ADDR_LSB\]" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcBackwardHistory -win $_nTrace1
srcHBSelect "tb_DandRiscvSimple.u_axi_slave_mem_d" -win $_nTrace1
srcHBSelect "tb_DandRiscvSimple.u_axi_slave_mem_d" -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G6" 36 )} 
wvSelectSignal -win $_nWave2 {( "G6" 36 )} 
wvSetRadix -win $_nWave2 -format UDec
wvSelectSignal -win $_nWave2 {( "G6" 33 )} 
wvSelectSignal -win $_nWave2 {( "G6" 32 )} 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 0.000000 537.804967
wvZoom -win $_nWave2 204.488581 436.583120
wvZoom -win $_nWave2 235.375687 367.013591
srcHBSelect "tb_DandRiscvSimple.u_DandRiscvSimple" -win $_nTrace1
srcSetScope -win $_nTrace1 "tb_DandRiscvSimple.u_DandRiscvSimple" -delim "."
srcHBSelect "tb_DandRiscvSimple.u_DandRiscvSimple" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {34 50 5 1 9 1}
wvSetPosition -win $_nWave2 {("G6" 19)}
wvSetPosition -win $_nWave2 {("G6" 20)}
wvSetPosition -win $_nWave2 {("G6" 21)}
wvSetPosition -win $_nWave2 {("G6" 22)}
wvAddSignal -win $_nWave2 "/tb_DandRiscvSimple/u_DandRiscvSimple/dcache_aw_valid" \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/dcache_aw_ready" \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/dcache_aw_payload_addr\[63:0\]" \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/dcache_aw_payload_id\[3:0\]" \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/dcache_aw_payload_len\[7:0\]" \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/dcache_aw_payload_size\[2:0\]" \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/dcache_aw_payload_burst\[1:0\]" \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/dcache_w_valid" \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/dcache_w_ready" \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/dcache_w_payload_data\[63:0\]" \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/dcache_w_payload_strb\[7:0\]" \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/dcache_w_payload_last" \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/dcache_b_valid" \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/dcache_b_ready" \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/dcache_b_payload_id\[3:0\]" \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/dcache_b_payload_resp\[1:0\]"
wvSetPosition -win $_nWave2 {("G6" 22)}
wvSetPosition -win $_nWave2 {("G6" 38)}
wvSetPosition -win $_nWave2 {("G6" 22)}
wvSetPosition -win $_nWave2 {("G6" 38)}
wvSetPosition -win $_nWave2 {("G6" 38)}
wvSetPosition -win $_nWave2 {("G6" 38)}
wvSetPosition -win $_nWave2 {("G6" 38)}
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 122.127941 672.704726
wvZoom -win $_nWave2 136.084260 397.067426
wvZoom -win $_nWave2 144.353689 254.502477
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 107.217072 743.818435
wvZoom -win $_nWave2 137.070368 239.943211
wvSelectSignal -win $_nWave2 {( "G6" 32 )} 
wvSelectSignal -win $_nWave2 {( "G6" 31 32 )} 
wvSelectSignal -win $_nWave2 {( "G6" 32 )} 
wvSelectSignal -win $_nWave2 {( "G6" 30 32 )} 
wvSelectSignal -win $_nWave2 {( "G6" 30 31 32 )} 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 137.946095 251.119261
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 294.336296 531.297096
wvZoom -win $_nWave2 321.966707 402.154962
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 443.931939 571.582698
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 100.955733 859.418038
wvZoom -win $_nWave2 140.849505 518.638714
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 102.467542 335.653023
wvZoom -win $_nWave2 141.922880 252.752482
wvScrollDown -win $_nWave2 1
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
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 198.903315 400.896936
wvZoom -win $_nWave2 252.665876 355.966796
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 233.092381 367.030076
srcDeselectAll -win $_nTrace1
srcBackwardHistory -win $_nTrace1
srcHBSelect "tb_DandRiscvSimple.u_DandRiscvSimple" -win $_nTrace1
srcHBSelect "tb_DandRiscvSimple.u_axi_slave_mem_d" -win $_nTrace1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 105.248886 361.241337
wvZoom -win $_nWave2 136.558482 250.116604
wvScrollUp -win $_nWave2 2
wvSelectSignal -win $_nWave2 {( "G6" 25 30 31 32 )} 
wvZoom -win $_nWave2 147.856724 210.320887
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 110.519609 332.825529
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 236.675503 342.334210
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvZoomOut -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvZoom -win $_nWave2 236.608546 322.046131
wvSelectSignal -win $_nWave2 {( "G6" 47 )} 
wvSelectSignal -win $_nWave2 {( "G6" 48 )} 
wvSetCursor -win $_nWave2 252.201717 -snap {("G6" 48)}
srcActiveTrace \
           "tb_DandRiscvSimple.u_DandRiscvSimple.dcache_r_payload_data\[63:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 1000 -TraceValue \
           0000000000000000110100010001011100000000000000000000010000010011
srcDeselectAll -win $_nTrace1
srcSelect -signal "axi_mem_rdata" -line 114 -pos 1 -win $_nTrace1
srcAction -pos 113 7 7 -win $_nTrace1 -name "axi_mem_rdata" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "ram_d\[ram_d_mem_raddr\]" -line 159 -pos 1 -win $_nTrace1
srcAction -pos 158 5 2 -win $_nTrace1 -name "ram_d\[ram_d_mem_raddr\]" -ctrlKey \
          off
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {159 159 6 6 1 6}
srcSearchString "ram_d" -win $_nTrace1 -prev -case
srcSelect -win $_nTrace1 -range {159 159 2 2 1 6}
srcSearchString "ram_d" -win $_nTrace1 -prev -case
srcSelect -win $_nTrace1 -range {157 157 2 2 1 6}
srcSearchString "ram_d" -win $_nTrace1 -prev -case
srcSelect -win $_nTrace1 -range {154 154 2 2 1 6}
srcSearchString "ram_d" -win $_nTrace1 -prev -case
srcSelect -win $_nTrace1 -range {153 153 4 4 1 6}
srcSearchString "ram_d" -win $_nTrace1 -prev -case
srcSelect -win $_nTrace1 -range {149 149 2 2 6 11}
srcSearchString "ram_d" -win $_nTrace1 -prev -case
srcSelect -win $_nTrace1 -range {146 146 2 2 6 11}
srcSearchString "ram_d" -win $_nTrace1 -prev -case
srcSelect -win $_nTrace1 -range {145 145 2 2 7 12}
srcSearchString "ram_d" -win $_nTrace1 -prev -case
srcSelect -win $_nTrace1 -range {132 132 2 2 1 6}
srcDeselectAll -win $_nTrace1
srcSelect -signal "ram_d_mem_waddr" -win $_nTrace1
srcSelect -signal "ram_d_mem_write" -line 169 -pos 1 -win $_nTrace1
srcSelect -signal "ram_d_mem_wdata" -line 170 -pos 1 -win $_nTrace1
srcSelect -signal "mask" -line 170 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 108.285913 382.032702
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 130.454743 274.440697
wvZoom -win $_nWave2 150.437585 216.225844
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 230.467360 396.897480
wvZoom -win $_nWave2 278.455766 338.678579
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 94.646753 431.711316
wvZoom -win $_nWave2 132.454375 280.908032
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 249.868767 375.555768
wvZoom -win $_nWave2 279.657702 342.023304
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G6" 52 )} 
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvZoomOut -win $_nWave2
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
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 229.425331 377.711606
wvZoom -win $_nWave2 237.318897 319.355600
wvSelectSignal -win $_nWave2 {( "G6" 5 )} 
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
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSelectSignal -win $_nWave2 {( "G6" 52 )} 
wvZoom -win $_nWave2 246.780671 287.799023
wvZoom -win $_nWave2 258.010030 286.473335
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
wvScrollUp -win $_nWave2 29
wvZoom -win $_nWave2 285.553418 296.772794
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 231.326433 343.150482
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G6" 5 52 )} 
wvSelectSignal -win $_nWave2 {( "G4" 3 )} 
wvZoom -win $_nWave2 237.775095 305.308883
wvZoom -win $_nWave2 244.494236 261.955444
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 231.271078 305.010931
wvZoom -win $_nWave2 239.729198 270.290582
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 241.452876 265.700564
wvSetCursor -win $_nWave2 247.092230 -snap {("G4" 3)}
srcActiveTrace "tb_DandRiscvSimple.u_DandRiscvSimple.execute_ALU_RESULT\[63:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 247000 -TraceValue \
           0000000000000000000000000000000010000000000000000100001110110000
srcDeselectAll -win $_nTrace1
srcSelect -signal "execute_ALUPlugin_alu_result" -line 1423 -pos 1 -win $_nTrace1
srcAction -pos 1422 7 12 -win $_nTrace1 -name "execute_ALUPlugin_alu_result" \
          -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "execute_ALUPlugin_add_result" -line 2648 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave2 {("G2" 1)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G2" 1)}
wvSetPosition -win $_nWave2 {("G6" 37)}
wvSetPosition -win $_nWave2 {("G4" 4)}
wvSetPosition -win $_nWave2 {("G4" 5)}
wvSetPosition -win $_nWave2 {("G4" 6)}
wvSetPosition -win $_nWave2 {("G4" 7)}
wvAddSignal -win $_nWave2 \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/execute_ALUPlugin_add_result\[63:0\]"
wvSetPosition -win $_nWave2 {("G4" 7)}
wvSetPosition -win $_nWave2 {("G4" 8)}
wvSetPosition -win $_nWave2 {("G4" 7)}
wvSetPosition -win $_nWave2 {("G4" 8)}
wvSetPosition -win $_nWave2 {("G4" 8)}
wvSetPosition -win $_nWave2 {("G4" 8)}
wvSetPosition -win $_nWave2 {("G4" 8)}
wvSetCursor -win $_nWave2 248.951527 -snap {("G4" 8)}
srcActiveTrace \
           "tb_DandRiscvSimple.u_DandRiscvSimple.execute_ALUPlugin_add_result\[63:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 247000 -TraceValue \
           0000000000000000000000000000000010000000000000000100001110110000
wvSetCursor -win $_nWave2 247.030766 -snap {("G4" 8)}
srcActiveTrace \
           "tb_DandRiscvSimple.u_DandRiscvSimple.execute_ALUPlugin_add_result\[63:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 247000 -TraceValue \
           0000000000000000000000000000000010000000000000000100001110110000
srcDeselectAll -win $_nTrace1
srcSelect -signal "_zz_execute_ALUPlugin_add_result" -line 2212 -pos 1 -win \
          $_nTrace1
srcSelect -signal "_zz_execute_ALUPlugin_add_result_1" -line 2212 -pos 1 -win \
          $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvSetCursor -win $_nWave2 249.043724 -snap {("G4" 9)}
srcActiveTrace \
           "tb_DandRiscvSimple.u_DandRiscvSimple._zz_execute_ALUPlugin_add_result\[63:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 249000 -TraceValue \
           0000000000000000000000000000000010000000000000000100011101010100
srcDeselectAll -win $_nTrace1
srcSelect -signal "execute_ALUPlugin_src1" -line 1011 -pos 1 -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G4" 10 )} 
wvSelectSignal -win $_nWave2 {( "G4" 9 10 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G5" 1)}
wvSetPosition -win $_nWave2 {("G4" 8)}
wvSetPosition -win $_nWave2 {("G4" 8)}
wvSetPosition -win $_nWave2 {("G4" 8)}
wvSetPosition -win $_nWave2 {("G4" 8)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "execute_ALUPlugin_src1" -line 1011 -pos 1 -win $_nTrace1
srcSelect -signal "execute_ALUPlugin_src2" -line 1012 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvSetCursor -win $_nWave2 248.997625 -snap {("G4" 9)}
srcActiveTrace \
           "tb_DandRiscvSimple.u_DandRiscvSimple.execute_ALUPlugin_src1\[63:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 245000 -TraceValue \
           0000000000000000000000000000000010000000000000000100001110101000
srcDeselectAll -win $_nTrace1
srcSelect -signal "execute_RS1" -line 2535 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G4" 9 )} 
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSetCursor -win $_nWave2 247.061498 -snap {("G4" 10)}
srcActiveTrace \
           "tb_DandRiscvSimple.u_DandRiscvSimple.execute_ALUPlugin_src2\[63:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 247000 -TraceValue \
           0000000000000000000000000000000000000000000000000000000000001000
srcDeselectAll -win $_nTrace1
srcSelect -signal "execute_RS2" -line 2559 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvSetCursor -win $_nWave2 247.138329 -snap {("G4" 11)}
srcActiveTrace "tb_DandRiscvSimple.u_DandRiscvSimple.execute_RS1\[63:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 247000 -TraceValue \
           0000000000000000000000000000000010000000000000000100011101010100
srcDeselectAll -win $_nTrace1
srcSelect -signal "decode_to_execute_RS1" -line 1502 -pos 1 -win $_nTrace1
srcAction -pos 1501 7 7 -win $_nTrace1 -name "decode_to_execute_RS1" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "decode_RS1" -line 3412 -pos 1 -win $_nTrace1
srcSelect -signal "decode_RS2" -line 3415 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave2 {("G2" 2)}
wvSetPosition -win $_nWave2 {("G2" 3)}
wvSetPosition -win $_nWave2 {("G2" 4)}
wvSetPosition -win $_nWave2 {("G2" 5)}
wvSetPosition -win $_nWave2 {("G2" 6)}
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSetPosition -win $_nWave2 {("G3" 1)}
wvSetPosition -win $_nWave2 {("G3" 2)}
wvSetPosition -win $_nWave2 {("G3" 3)}
wvSetPosition -win $_nWave2 {("G3" 4)}
wvAddSignal -win $_nWave2 \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/decode_RS1\[63:0\]" \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/decode_RS2\[63:0\]"
wvSetPosition -win $_nWave2 {("G3" 4)}
wvSetPosition -win $_nWave2 {("G3" 6)}
wvSetPosition -win $_nWave2 {("G3" 4)}
wvSetPosition -win $_nWave2 {("G3" 6)}
wvSetPosition -win $_nWave2 {("G3" 6)}
wvSetPosition -win $_nWave2 {("G3" 6)}
wvSetPosition -win $_nWave2 {("G3" 6)}
wvSaveSignal -win $_nWave2 \
           "/home/lin/SpinalProjects/DandRiscvSoC/simWorkspace/tb_DandRiscvSimple/DandRiscv_debug_total.rc"
wvSetPosition -win $_nWave2 {("G3" 6)}
wvSetPosition -win $_nWave2 {("G3" 6)}
wvSetPosition -win $_nWave2 {("G3" 6)}
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvSetCursor -win $_nWave2 246.907837 -snap {("G3" 5)}
srcActiveTrace "tb_DandRiscvSimple.u_DandRiscvSimple.decode_RS1\[63:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 245000 -TraceValue \
           0000000000000000000000000000000010000000000000000100011101010100
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G4" 8 )} 
wvSelectSignal -win $_nWave2 {( "G4" 7 )} 
wvSelectSignal -win $_nWave2 {( "G4" 5 )} 
wvSelectSignal -win $_nWave2 {( "G4" 4 )} 
wvSelectSignal -win $_nWave2 {( "G3" 6 )} 
wvSelectSignal -win $_nWave2 {( "G3" 5 )} 
wvSelectSignal -win $_nWave2 {( "G4" 11 )} 
wvSelectSignal -win $_nWave2 {( "G4" 9 )} 
wvSetCursor -win $_nWave2 245.033174 -snap {("G4" 9)}
srcActiveTrace \
           "tb_DandRiscvSimple.u_DandRiscvSimple.execute_ALUPlugin_src1\[63:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 245000 -TraceValue \
           0000000000000000000000000000000010000000000000000100001110101000
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
srcDeselectAll -win $_nTrace1
srcSelect -signal "execute_RS1_FROM_MEM" -line 2526 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
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
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G4" 13)}
wvSetPosition -win $_nWave2 {("G4" 13)}
wvSetPosition -win $_nWave2 {("G4" 13)}
wvSetPosition -win $_nWave2 {("G4" 13)}
wvSetCursor -win $_nWave2 247.015400 -snap {("G4" 13)}
srcActiveTrace "tb_DandRiscvSimple.u_DandRiscvSimple.execute_RS1_FROM_MEM" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 243000 -TraceValue 1
srcDeselectAll -win $_nTrace1
srcSelect -signal "DecodePlugin_hazard_rs1_from_mem" -line 1507 -pos 1 -win \
          $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "DecodePlugin_hazard_rs1_from_mem" -line 1507 -pos 1 -win \
          $_nTrace1
srcAction -pos 1506 7 14 -win $_nTrace1 -name "DecodePlugin_hazard_rs1_from_mem" \
          -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "memaccess_arbitration_isValid" -line 2676 -pos 1 -win \
          $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G4" 14 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G5" 0)}
wvSetPosition -win $_nWave2 {("G4" 13)}
wvSetPosition -win $_nWave2 {("G4" 13)}
wvSetPosition -win $_nWave2 {("G4" 13)}
wvSetPosition -win $_nWave2 {("G4" 13)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "memaccess_arbitration_isValid" -line 2676 -pos 1 -win \
          $_nTrace1
srcSelect -signal "_zz_DecodePlugin_hazard_rs1_from_mem_3" -line 2676 -pos 1 -win \
          $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {2676 2676 12 50 1 12}
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvSetMarker -win $_nWave2 247.000000
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G4" 16 )} 
wvSelectSignal -win $_nWave2 {( "G4" 17 )} 
wvSelectSignal -win $_nWave2 {( "G4" 16 )} 
wvSelectSignal -win $_nWave2 {( "G4" 17 )} 
wvSelectSignal -win $_nWave2 {( "G4" 16 )} 
wvSetCursor -win $_nWave2 247.107596 -snap {("G4" 16)}
srcActiveTrace \
           "tb_DandRiscvSimple.u_DandRiscvSimple._zz_DecodePlugin_hazard_rs1_from_mem_2\[4:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 247000 -TraceValue 01010
wvScrollUp -win $_nWave2 3
srcDeselectAll -win $_nTrace1
srcSelect -signal "memaccess_RD_ADDR" -line 1482 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G1" 4)}
wvSetPosition -win $_nWave2 {("G1" 3)}
wvSetPosition -win $_nWave2 {("G1" 4)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G2" 5)}
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSetPosition -win $_nWave2 {("G3" 1)}
wvSetPosition -win $_nWave2 {("G3" 2)}
wvSetPosition -win $_nWave2 {("G3" 3)}
wvSetPosition -win $_nWave2 {("G4" 0)}
wvSetPosition -win $_nWave2 {("G4" 16)}
wvSetPosition -win $_nWave2 {("G4" 17)}
wvSetPosition -win $_nWave2 {("G4" 18)}
wvSetPosition -win $_nWave2 {("G5" 0)}
wvSetPosition -win $_nWave2 {("G5" 1)}
wvSetPosition -win $_nWave2 {("G5" 2)}
wvSetPosition -win $_nWave2 {("G5" 3)}
wvSetPosition -win $_nWave2 {("G6" 0)}
wvSetPosition -win $_nWave2 {("G5" 3)}
wvAddSignal -win $_nWave2 \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/memaccess_RD_ADDR\[4:0\]"
wvSetPosition -win $_nWave2 {("G5" 3)}
wvSetPosition -win $_nWave2 {("G5" 4)}
wvSetPosition -win $_nWave2 {("G5" 3)}
wvSetPosition -win $_nWave2 {("G5" 4)}
wvSetPosition -win $_nWave2 {("G5" 4)}
wvSetPosition -win $_nWave2 {("G5" 4)}
wvSetPosition -win $_nWave2 {("G5" 4)}
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G4" 14 )} 
wvSelectSignal -win $_nWave2 {( "G4" 15 )} 
wvSelectSignal -win $_nWave2 {( "G4" 9 )} 
wvSetCursor -win $_nWave2 245.509523 -snap {("G4" 9)}
srcActiveTrace \
           "tb_DandRiscvSimple.u_DandRiscvSimple.execute_ALUPlugin_src1\[63:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 245000 -TraceValue \
           0000000000000000000000000000000010000000000000000100001110101000
srcDeselectAll -win $_nTrace1
srcSelect -signal "execute_RS1_FROM_WB" -line 2532 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave2 {("G2" 5)}
wvSetPosition -win $_nWave2 {("G2" 4)}
wvSetPosition -win $_nWave2 {("G2" 5)}
wvSetPosition -win $_nWave2 {("G2" 6)}
wvSetPosition -win $_nWave2 {("G4" 0)}
wvSetPosition -win $_nWave2 {("G4" 9)}
wvSetPosition -win $_nWave2 {("G4" 10)}
wvSetPosition -win $_nWave2 {("G4" 11)}
wvSetPosition -win $_nWave2 {("G4" 12)}
wvSetPosition -win $_nWave2 {("G4" 13)}
wvAddSignal -win $_nWave2 \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/execute_RS1_FROM_WB"
wvSetPosition -win $_nWave2 {("G4" 13)}
wvSetPosition -win $_nWave2 {("G4" 14)}
wvSetPosition -win $_nWave2 {("G4" 13)}
wvSetPosition -win $_nWave2 {("G4" 14)}
wvSetPosition -win $_nWave2 {("G4" 14)}
wvSetPosition -win $_nWave2 {("G4" 14)}
wvSetPosition -win $_nWave2 {("G4" 14)}
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G4" 10 )} 
wvSelectSignal -win $_nWave2 {( "G4" 9 )} 
wvSelectSignal -win $_nWave2 {( "G4" 14 )} 
wvSelectSignal -win $_nWave2 {( "G4" 15 )} 
wvSelectSignal -win $_nWave2 {( "G4" 15 16 )} 
wvSelectSignal -win $_nWave2 {( "G4" 15 16 17 )} 
wvSelectSignal -win $_nWave2 {( "G4" 15 16 17 18 )} 
wvSelectSignal -win $_nWave2 {( "G4" 15 16 17 18 19 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G4" 14)}
wvSetPosition -win $_nWave2 {("G4" 14)}
wvSetPosition -win $_nWave2 {("G4" 14)}
wvSetPosition -win $_nWave2 {("G4" 14)}
wvSelectSignal -win $_nWave2 {( "G4" 14 )} 
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
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 1
wvScrollUp -win $_nWave2 1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "_zz_execute_MEM_WDATA_2" -line 2533 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G4" 15 )} 
wvSetCursor -win $_nWave2 249.028358 -snap {("G4" 15)}
srcActiveTrace \
           "tb_DandRiscvSimple.u_DandRiscvSimple._zz_execute_MEM_WDATA_2\[63:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 247000 -TraceValue \
           0000000000000000000000000000000010000000000000000100001110101000
srcDeselectAll -win $_nTrace1
srcSelect -signal "writeback_RD" -line 1512 -pos 1 -win $_nTrace1
srcAction -pos 1511 7 6 -win $_nTrace1 -name "writeback_RD" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "writeback_IS_LOAD" -line 1408 -pos 1 -win $_nTrace1
srcSelect -signal "writeback_LSU_RDATA" -line 1408 -pos 1 -win $_nTrace1
srcSelect -signal "writeback_ALU_RESULT" -line 1408 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvScrollDown -win $_nWave2 1
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G5" 2)}
wvSetPosition -win $_nWave2 {("G4" 15)}
wvSetPosition -win $_nWave2 {("G4" 15)}
wvSetPosition -win $_nWave2 {("G4" 15)}
wvSetPosition -win $_nWave2 {("G4" 15)}
wvSelectSignal -win $_nWave2 {( "G4" 15 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G5" 0)}
wvSetPosition -win $_nWave2 {("G4" 14)}
wvSetPosition -win $_nWave2 {("G4" 14)}
wvSetPosition -win $_nWave2 {("G4" 14)}
wvSetPosition -win $_nWave2 {("G4" 14)}
wvSelectSignal -win $_nWave2 {( "G4" 14 )} 
srcDeselectAll -win $_nTrace1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvSetCursor -win $_nWave2 248.996644 -snap {("G4" 14)}
srcActiveTrace "tb_DandRiscvSimple.u_DandRiscvSimple.execute_RS1_FROM_WB" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 247000 -TraceValue 1
srcDeselectAll -win $_nTrace1
srcSelect -signal "DecodePlugin_hazard_rs1_from_wb" -line 1503 -pos 1 -win \
          $_nTrace1
srcAction -pos 1502 7 20 -win $_nTrace1 -name "DecodePlugin_hazard_rs1_from_wb" \
          -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "writeback_arbitration_isValid" -line 2680 -pos 1 -win \
          $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "writeback_arbitration_isValid" -line 2680 -pos 1 -win \
          $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
srcDeselectAll -win $_nTrace1
srcSelect -signal "_zz_DecodePlugin_hazard_rs1_from_wb_1" -line 2680 -pos 1 -win \
          $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "_zz_DecodePlugin_hazard_rs1_from_wb_1" -line 2680 -pos 1 -win \
          $_nTrace1
srcAction -pos 2679 15 22 -win $_nTrace1 -name \
          "_zz_DecodePlugin_hazard_rs1_from_wb_1" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "writeback_RD_WEN" -line 1514 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
srcBackwardHistory -win $_nTrace1
srcHBSelect "tb_DandRiscvSimple.u_DandRiscvSimple" -win $_nTrace1
srcHBSelect "tb_DandRiscvSimple.u_DandRiscvSimple" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "_zz_DecodePlugin_hazard_rs1_from_wb" -line 2680 -pos 1 -win \
          $_nTrace1
srcAction -pos 2679 21 10 -win $_nTrace1 -name \
          "_zz_DecodePlugin_hazard_rs1_from_wb" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "writeback_RD_ADDR" -line 1513 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
srcBackwardHistory -win $_nTrace1
srcHBSelect "tb_DandRiscvSimple.u_DandRiscvSimple" -win $_nTrace1
srcHBSelect "tb_DandRiscvSimple.u_DandRiscvSimple" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "_zz_DecodePlugin_hazard_rs1_from_wb" -line 2680 -pos 2 -win \
          $_nTrace1
srcAction -pos 2679 32 12 -win $_nTrace1 -name \
          "_zz_DecodePlugin_hazard_rs1_from_wb" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "writeback_RD_ADDR" -line 1513 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
srcBackwardHistory -win $_nTrace1
srcHBSelect "tb_DandRiscvSimple.u_DandRiscvSimple" -win $_nTrace1
srcHBSelect "tb_DandRiscvSimple.u_DandRiscvSimple" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "_zz_DecodePlugin_hazard_rs1_from_mem_1" -line 2680 -pos 1 -win \
          $_nTrace1
srcAction -pos 2679 36 25 -win $_nTrace1 -name \
          "_zz_DecodePlugin_hazard_rs1_from_mem_1" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "execute_RS1_ADDR" -line 1481 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
srcBackwardHistory -win $_nTrace1
srcHBSelect "tb_DandRiscvSimple.u_DandRiscvSimple" -win $_nTrace1
srcHBSelect "tb_DandRiscvSimple.u_DandRiscvSimple" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "DecodePlugin_hazard_rs1_from_mem" -line 2680 -pos 1 -win \
          $_nTrace1
srcAction -pos 2679 46 7 -win $_nTrace1 -name "DecodePlugin_hazard_rs1_from_mem" \
          -ctrlKey off
wvSetCursor -win $_nWave2 247.068622 -snap {("G4" 17)}
wvSelectSignal -win $_nWave2 {( "G4" 15 )} 
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G6" 9 )} 
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
srcDeselectAll -win $_nTrace1
debReload
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 206.390152 340.311164
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G4" 13 )} 
wvZoom -win $_nWave2 231.373570 276.145833
wvZoom -win $_nWave2 239.808684 265.213263
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
wvZoomIn -win $_nWave2
wvZoom -win $_nWave2 226.796697 317.791451
wvScrollUp -win $_nWave2 1
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
wvZoom -win $_nWave2 235.670954 266.293866
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 219.443187 288.766128
wvZoom -win $_nWave2 237.343717 262.235442
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 228.272537 321.917651
wvSelectSignal -win $_nWave2 {( "G4" 9 )} 
wvZoom -win $_nWave2 239.411704 281.166286
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G4" 9 11 )} 
wvZoom -win $_nWave2 286.402961 294.300392
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
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
wvZoom -win $_nWave2 185.138174 410.875752
wvZoom -win $_nWave2 237.006949 343.913330
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G4" 2 9 11 )} 
wvZoom -win $_nWave2 262.301938 343.103733
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 43
wvSelectSignal -win $_nWave2 {( "G6" 50 )} 
wvSelectSignal -win $_nWave2 {( "G6" 50 52 )} 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 220.498129 317.925929
wvZoom -win $_nWave2 246.483674 295.395526
wvZoomOut -win $_nWave2
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 53
wvSelectSignal -win $_nWave2 {( "G1" 4 )} 
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvZoom -win $_nWave2 286.677399 296.181512
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 282.301013 306.568626
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 232.434520 317.922499
wvZoom -win $_nWave2 284.068375 299.037456
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
srcDeselectAll -win $_nTrace1
srcHBSelect \
           "tb_DandRiscvSimple.u_DandRiscvSimple.fetch_FetchPlugin_pc_stream_fifo" \
           -win $_nTrace1
srcHBSelect \
           "tb_DandRiscvSimple.u_DandRiscvSimple.fetch_FetchPlugin_predict_taken_fifo" \
           -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G1" 4 )} 
wvSelectSignal -win $_nWave2 {( "G1" 3 )} 
wvScrollDown -win $_nWave2 2
wvSelectSignal -win $_nWave2 {( "G4" 18 )} 
wvSelectSignal -win $_nWave2 {( "G4" 17 )} 
wvSelectSignal -win $_nWave2 {( "G4" 18 )} 
wvSelectSignal -win $_nWave2 {( "G4" 19 )} 
wvSelectSignal -win $_nWave2 {( "G4" 18 )} 
wvSelectSignal -win $_nWave2 {( "G4" 18 )} 
wvSelectSignal -win $_nWave2 {( "G4" 11 )} 
wvSetCursor -win $_nWave2 247.071465 -snap {("G4" 11)}
srcActiveTrace "tb_DandRiscvSimple.u_DandRiscvSimple.execute_RS1\[63:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 155000 -TraceValue \
           0000000000000000000000000000000000000000000000000000000000000000
srcDeselectAll -win $_nTrace1
srcSelect -signal "decode_to_execute_RS1" -line 1504 -pos 1 -win $_nTrace1
srcAction -pos 1503 7 10 -win $_nTrace1 -name "decode_to_execute_RS1" -ctrlKey \
          off
srcDeselectAll -win $_nTrace1
srcSelect -signal "decode_RS1" -line 3414 -pos 1 -win $_nTrace1
srcAction -pos 3413 5 3 -win $_nTrace1 -name "decode_RS1" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "decode_DecodePlugin_rs1" -line 1451 -pos 1 -win $_nTrace1
srcAction -pos 1450 7 8 -win $_nTrace1 -name "decode_DecodePlugin_rs1" -ctrlKey \
          off
srcDeselectAll -win $_nTrace1
srcSelect -signal "regFileModule_1_read_ports_rs1_value" -line 2203 -pos 1 -win \
          $_nTrace1
srcAction -pos 2202 7 6 -win $_nTrace1 -name \
          "regFileModule_1_read_ports_rs1_value" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "read_value_1" -line 48388 -pos 1 -win $_nTrace1
srcAction -pos 48387 46 4 -win $_nTrace1 -name "read_value_1" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "_zz_read_value_1" -line 48384 -pos 1 -win $_nTrace1
srcAction -pos 48383 7 8 -win $_nTrace1 -name "_zz_read_value_1" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "read_ports_rs1_addr" -line 48311 -pos 1 -win $_nTrace1
srcAction -pos 48310 3 11 -win $_nTrace1 -name "read_ports_rs1_addr" -ctrlKey off
srcBackwardHistory -win $_nTrace1
srcHBSelect "tb_DandRiscvSimple.u_DandRiscvSimple" -win $_nTrace1
srcHBSelect "tb_DandRiscvSimple.u_DandRiscvSimple.regFileModule_1" -win $_nTrace1
srcBackwardHistory -win $_nTrace1
srcHBSelect "tb_DandRiscvSimple.u_DandRiscvSimple.regFileModule_1" -win $_nTrace1
srcHBSelect "tb_DandRiscvSimple.u_DandRiscvSimple.regFileModule_1" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "reg_file_0" -line 48392 -pos 1 -win $_nTrace1
srcAction -pos 48391 1 4 -win $_nTrace1 -name "reg_file_0" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "when_DecodePlugin_l61" -line 48425 -pos 1 -win $_nTrace1
srcAction -pos 48424 3 13 -win $_nTrace1 -name "when_DecodePlugin_l61" -ctrlKey \
          off
srcDeselectAll -win $_nTrace1
srcSelect -signal "write_ports_rd_wen" -line 48386 -pos 1 -win $_nTrace1
srcBackwardHistory -win $_nTrace1
srcHBSelect "tb_DandRiscvSimple.u_DandRiscvSimple.regFileModule_1" -win $_nTrace1
srcHBSelect "tb_DandRiscvSimple.u_DandRiscvSimple.regFileModule_1" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "when_DecodePlugin_l61" -line 48425 -pos 1 -win $_nTrace1
srcAction -pos 48424 3 16 -win $_nTrace1 -name "when_DecodePlugin_l61" -ctrlKey \
          off
srcDeselectAll -win $_nTrace1
srcSelect -signal "write_ports_rd_wen" -line 48386 -pos 1 -win $_nTrace1
srcAction -pos 48385 8 12 -win $_nTrace1 -name "write_ports_rd_wen" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "writeback_arbitration_isFiring" -line 2210 -pos 1 -win \
          $_nTrace1
srcSelect -signal "_zz_DecodePlugin_hazard_rs1_from_wb_1" -line 2210 -pos 1 -win \
          $_nTrace1
wvSetPosition -win $_nWave2 {("G1" 1)}
wvSetPosition -win $_nWave2 {("G4" 0)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G2" 1)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G1" 4)}
wvSetPosition -win $_nWave2 {("G1" 3)}
wvSetPosition -win $_nWave2 {("G1" 2)}
wvSetPosition -win $_nWave2 {("G1" 1)}
wvSetPosition -win $_nWave2 {("G1" 0)}
wvSetPosition -win $_nWave2 {("G1" 1)}
wvSetPosition -win $_nWave2 {("G1" 2)}
wvSetPosition -win $_nWave2 {("G1" 3)}
wvSetPosition -win $_nWave2 {("G1" 4)}
wvAddSignal -win $_nWave2 \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/writeback_arbitration_isFiring" \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/_zz_DecodePlugin_hazard_rs1_from_wb_1"
wvSetPosition -win $_nWave2 {("G1" 4)}
wvSetPosition -win $_nWave2 {("G1" 6)}
wvSetPosition -win $_nWave2 {("G1" 4)}
wvSetPosition -win $_nWave2 {("G1" 6)}
wvSetPosition -win $_nWave2 {("G1" 6)}
wvSetPosition -win $_nWave2 {("G1" 6)}
wvSetPosition -win $_nWave2 {("G1" 6)}
wvSetCursor -win $_nWave2 245.478891 -snap {("G1" 1)}
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 42.468615 577.573166
wvZoom -win $_nWave2 69.154657 373.177855
wvZoom -win $_nWave2 140.359203 209.879100
wvZoom -win $_nWave2 162.573725 181.783508
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 150.463827 208.086080
wvSelectSignal -win $_nWave2 {( "G1" 4 )} 
wvSetCursor -win $_nWave2 169.238421 -snap {("G1" 4)}
srcActiveTrace "tb_DandRiscvSimple.u_DandRiscvSimple.writeback_RD\[63:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 169000 -TraceValue \
           0000000000000000000000000000000010000000000000001100111111111000
srcDeselectAll -win $_nTrace1
srcSelect -signal "writeback_RD" -line 1409 -pos 1 -win $_nTrace1
srcSearchString "writeback_RD_ADD" -win $_nTrace1 -next -case
srcDeselectAll -win $_nTrace1
srcSelect -signal "writeback_RD_ADDR" -line 1435 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave2 {("G3" 5)}
wvSetPosition -win $_nWave2 {("G1" 4)}
wvSetPosition -win $_nWave2 {("G1" 5)}
wvSetPosition -win $_nWave2 {("G1" 4)}
wvSetPosition -win $_nWave2 {("G1" 3)}
wvSetPosition -win $_nWave2 {("G1" 2)}
wvSetPosition -win $_nWave2 {("G1" 3)}
wvAddSignal -win $_nWave2 \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/writeback_RD_ADDR\[4:0\]"
wvSetPosition -win $_nWave2 {("G1" 3)}
wvSetPosition -win $_nWave2 {("G1" 4)}
wvSetPosition -win $_nWave2 {("G1" 3)}
wvSetPosition -win $_nWave2 {("G1" 4)}
wvSetPosition -win $_nWave2 {("G1" 4)}
wvSetPosition -win $_nWave2 {("G1" 4)}
wvSetPosition -win $_nWave2 {("G1" 4)}
wvZoom -win $_nWave2 163.938111 184.224039
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 158.778576 191.661712
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 3 4 )} 
wvSelectSignal -win $_nWave2 {( "G1" 6 )} 
wvZoom -win $_nWave2 161.044074 180.601463
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 2 6 )} 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 226.251023 263.010532
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 142.567802 228.932960
wvZoom -win $_nWave2 161.359482 185.255863
wvSelectSignal -win $_nWave2 {( "G1" 7 )} 
wvSelectSignal -win $_nWave2 {( "G1" 6 )} 
wvSelectSignal -win $_nWave2 {( "G1" 7 )} 
srcDeselectAll -win $_nTrace1
srcBackwardHistory -win $_nTrace1
srcHBSelect "tb_DandRiscvSimple.u_DandRiscvSimple" -win $_nTrace1
srcHBSelect "tb_DandRiscvSimple.u_DandRiscvSimple" -win $_nTrace1
srcBackwardHistory -win $_nTrace1
srcHBSelect "tb_DandRiscvSimple.u_DandRiscvSimple" -win $_nTrace1
srcHBSelect "tb_DandRiscvSimple.u_DandRiscvSimple.regFileModule_1" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "reg_file_0" -line 48392 -pos 1 -win $_nTrace1
srcSelect -signal "reg_file_1" -line 48393 -pos 1 -win $_nTrace1
srcSelect -signal "reg_file_2" -line 48394 -pos 1 -win $_nTrace1
srcSelect -signal "reg_file_3" -line 48395 -pos 1 -win $_nTrace1
srcSelect -signal "reg_file_4" -line 48396 -pos 1 -win $_nTrace1
srcSelect -signal "reg_file_5" -line 48397 -pos 1 -win $_nTrace1
srcSelect -signal "reg_file_6" -line 48398 -pos 1 -win $_nTrace1
srcSelect -signal "reg_file_7" -line 48399 -pos 1 -win $_nTrace1
srcSelect -signal "reg_file_8" -line 48400 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave2 {("G1" 5)}
wvSetPosition -win $_nWave2 {("G1" 6)}
wvSetPosition -win $_nWave2 {("G1" 7)}
wvSetPosition -win $_nWave2 {("G1" 6)}
wvSetPosition -win $_nWave2 {("G1" 5)}
wvAddSignal -win $_nWave2 \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/regFileModule_1/reg_file_0\[63:0\]" \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/regFileModule_1/reg_file_1\[63:0\]" \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/regFileModule_1/reg_file_2\[63:0\]" \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/regFileModule_1/reg_file_3\[63:0\]" \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/regFileModule_1/reg_file_4\[63:0\]" \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/regFileModule_1/reg_file_5\[63:0\]" \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/regFileModule_1/reg_file_6\[63:0\]" \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/regFileModule_1/reg_file_7\[63:0\]" \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/regFileModule_1/reg_file_8\[63:0\]"
wvSetPosition -win $_nWave2 {("G1" 5)}
wvSetPosition -win $_nWave2 {("G1" 14)}
wvSetPosition -win $_nWave2 {("G1" 5)}
wvSetPosition -win $_nWave2 {("G1" 14)}
wvSetPosition -win $_nWave2 {("G1" 14)}
wvSetPosition -win $_nWave2 {("G1" 14)}
wvSetPosition -win $_nWave2 {("G1" 14)}
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 165.406948 180.025495
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
srcDeselectAll -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G1" 15 )} 
wvSetCursor -win $_nWave2 167.002730 -snap {("G1" 15)}
srcActiveTrace \
           "tb_DandRiscvSimple.u_DandRiscvSimple.writeback_arbitration_isFiring" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 109000 -TraceValue 0
wvSelectSignal -win $_nWave2 {( "G1" 16 )} 
wvSelectSignal -win $_nWave2 {( "G1" 7 )} 
wvSetCursor -win $_nWave2 172.986236 -snap {("G1" 7)}
srcActiveTrace \
           "tb_DandRiscvSimple.u_DandRiscvSimple.regFileModule_1.reg_file_1\[63:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 109000 -TraceValue \
           0000000000000000000000000000000010000000000000000000000000010000
srcDeselectAll -win $_nTrace1
srcSelect -signal "_zz_1\[1\]" -line 48429 -pos 1 -win $_nTrace1
srcAction -pos 48428 3 4 -win $_nTrace1 -name "_zz_1\[1\]" -ctrlKey off
srcBackwardHistory -win $_nTrace1
srcHBSelect "tb_DandRiscvSimple.u_DandRiscvSimple.regFileModule_1" -win $_nTrace1
srcHBSelect "tb_DandRiscvSimple.u_DandRiscvSimple.regFileModule_1" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "when_DecodePlugin_l61" -line 48425 -pos 1 -win $_nTrace1
srcAction -pos 48424 3 13 -win $_nTrace1 -name "when_DecodePlugin_l61" -ctrlKey \
          off
srcDeselectAll -win $_nTrace1
srcSelect -signal "write_ports_rd_wen" -line 48386 -pos 1 -win $_nTrace1
srcAction -pos 48385 8 17 -win $_nTrace1 -name "write_ports_rd_wen" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "_zz_DecodePlugin_hazard_rs1_from_wb_1" -line 2210 -pos 1 -win \
          $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "_zz_DecodePlugin_hazard_rs1_from_wb_1" -line 2210 -pos 1 -win \
          $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "_zz_DecodePlugin_hazard_rs1_from_wb_1" -line 2210 -pos 1 -win \
          $_nTrace1
srcAction -pos 2209 12 15 -win $_nTrace1 -name \
          "_zz_DecodePlugin_hazard_rs1_from_wb_1" -ctrlKey off
srcBackwardHistory -win $_nTrace1
srcHBSelect "tb_DandRiscvSimple.u_DandRiscvSimple" -win $_nTrace1
srcHBSelect "tb_DandRiscvSimple.u_DandRiscvSimple" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "writeback_arbitration_isFiring" -line 2210 -pos 1 -win \
          $_nTrace1
srcAction -pos 2209 8 15 -win $_nTrace1 -name "writeback_arbitration_isFiring" \
          -ctrlKey off
srcBackwardHistory -win $_nTrace1
srcHBSelect "tb_DandRiscvSimple.u_DandRiscvSimple" -win $_nTrace1
srcHBSelect "tb_DandRiscvSimple.u_DandRiscvSimple" -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G1" 15 )} 
wvSetCursor -win $_nWave2 167.067533 -snap {("G1" 15)}
wvSelectSignal -win $_nWave2 {( "G1" 15 )} 
wvScrollDown -win $_nWave2 0
wvSelectSignal -win $_nWave2 {( "G1" 14 )} 
wvExpandBus -win $_nWave2 {("G1" 14)}
wvScrollUp -win $_nWave2 35
wvSelectSignal -win $_nWave2 {( "G1" 14 )} 
wvSetPosition -win $_nWave2 {("G1" 14)}
wvCollapseBus -win $_nWave2 {("G1" 14)}
wvSetPosition -win $_nWave2 {("G1" 14)}
wvSetPosition -win $_nWave2 {("G1" 14)}
wvSetPosition -win $_nWave2 {("G1" 14)}
wvSetPosition -win $_nWave2 {("G1" 14)}
wvScrollUp -win $_nWave2 6
wvSetCursor -win $_nWave2 169.119638 -snap {("G1" 8)}
srcActiveTrace \
           "tb_DandRiscvSimple.u_DandRiscvSimple.regFileModule_1.reg_file_2\[63:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 169000 -TraceValue \
           0000000000000000000000000000000010000000000000001100111111110000
wvSelectSignal -win $_nWave2 {( "G1" 6 )} 
wvSelectSignal -win $_nWave2 {( "G1" 6 7 )} 
wvSelectSignal -win $_nWave2 {( "G1" 6 7 8 )} 
wvSelectSignal -win $_nWave2 {( "G1" 6 7 8 9 )} 
wvSelectSignal -win $_nWave2 {( "G1" 7 )} 
wvSelectSignal -win $_nWave2 {( "G1" 7 8 )} 
wvSelectSignal -win $_nWave2 {( "G1" 7 8 9 )} 
wvSelectSignal -win $_nWave2 {( "G1" 7 8 9 10 )} 
wvSelectSignal -win $_nWave2 {( "G1" 7 8 9 10 11 )} 
wvSelectSignal -win $_nWave2 {( "G1" 7 8 9 10 11 12 )} 
wvSelectSignal -win $_nWave2 {( "G1" 7 8 9 10 11 12 13 )} 
wvSelectSignal -win $_nWave2 {( "G1" 7 8 9 10 11 12 13 14 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G2" 5)}
wvSetPosition -win $_nWave2 {("G1" 6)}
wvSetPosition -win $_nWave2 {("G1" 6)}
wvSetPosition -win $_nWave2 {("G1" 6)}
wvSetPosition -win $_nWave2 {("G1" 6)}
wvSelectSignal -win $_nWave2 {( "G1" 8 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 6)}
wvSetPosition -win $_nWave2 {("G1" 6)}
wvSetPosition -win $_nWave2 {("G1" 6)}
wvSetPosition -win $_nWave2 {("G1" 6)}
wvSelectGroup -win $_nWave2 {G2}
wvSelectSignal -win $_nWave2 {( "G1" 7 )} 
wvSetPosition -win $_nWave2 {("G1" 7)}
wvSetPosition -win $_nWave2 {("G1" 6)}
wvSetPosition -win $_nWave2 {("G1" 5)}
wvSetPosition -win $_nWave2 {("G1" 4)}
wvSetPosition -win $_nWave2 {("G1" 3)}
wvSetPosition -win $_nWave2 {("G1" 2)}
wvSetPosition -win $_nWave2 {("G1" 1)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 1)}
wvSetPosition -win $_nWave2 {("G1" 2)}
wvSetPosition -win $_nWave2 {("G1" 2)}
wvSetPosition -win $_nWave2 {("G1" 2)}
wvSetPosition -win $_nWave2 {("G1" 2)}
wvSelectSignal -win $_nWave2 {( "G1" 1 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 2)}
wvSetPosition -win $_nWave2 {("G1" 1)}
wvSetPosition -win $_nWave2 {("G1" 1)}
wvSetPosition -win $_nWave2 {("G1" 1)}
wvSetPosition -win $_nWave2 {("G1" 1)}
wvSelectSignal -win $_nWave2 {( "G1" 1 )} 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 123.385504 408.865691
srcDeselectAll -win $_nTrace1
srcSearchString "instr_cnt" -win $_nTrace1 -next -case
srcSearchString "instr" -win $_nTrace1 -next -case
srcHBSelect "tb_DandRiscvSimple" -win $_nTrace1
srcSetScope -win $_nTrace1 "tb_DandRiscvSimple" -delim "."
srcHBSelect "tb_DandRiscvSimple" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSearchString "instr" -win $_nTrace1 -prev -case
srcSearchString "instr" -win $_nTrace1 -next -case
wvSelectSignal -win $_nWave2 {( "G1" 2 )} 
wvSetSearchMode -win $_nWave2 -value 800039c4
wvSearchNext -win $_nWave2
wvSearchPrev -win $_nWave2
wvSearchPrev -win $_nWave2
wvSearchPrev -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 2116.121802 2169.484556
wvSetMarker -win $_nWave2 2129.000000
wvZoom -win $_nWave2 2125.524844 2141.373996
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 4 )} 
wvSetCursor -win $_nWave2 2125.024252 -snap {("G1" 4)}
srcActiveTrace "tb_DandRiscvSimple.u_DandRiscvSimple.writeback_RD_ADDR\[4:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 2125000 -TraceValue \
           10010
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 2
wvSelectSignal -win $_nWave2 {( "G4" 17 )} 
wvSelectSignal -win $_nWave2 {( "G4" 18 )} 
wvSelectSignal -win $_nWave2 {( "G4" 17 )} 
srcDeselectAll -win $_nTrace1
srcSelect -signal "memaccess_to_writeback_RD_ADDR" -line 1435 -pos 1 -win \
          $_nTrace1
srcAction -pos 1434 7 11 -win $_nTrace1 -name "memaccess_to_writeback_RD_ADDR" \
          -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "_zz_DecodePlugin_hazard_rs1_from_mem_2" -line 3456 -pos 1 -win \
          $_nTrace1
srcAction -pos 3455 5 9 -win $_nTrace1 -name \
          "_zz_DecodePlugin_hazard_rs1_from_mem_2" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "memaccess_RD_ADDR" -line 1484 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave2 {("G1" 3)}
wvSetPosition -win $_nWave2 {("G1" 2)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G1" 6)}
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
wvSetPosition -win $_nWave2 {("G5" 0)}
wvSetPosition -win $_nWave2 {("G5" 1)}
wvSetPosition -win $_nWave2 {("G5" 2)}
wvSetPosition -win $_nWave2 {("G5" 3)}
wvSetPosition -win $_nWave2 {("G1" 6)}
wvSetPosition -win $_nWave2 {("G5" 2)}
wvSetPosition -win $_nWave2 {("G5" 3)}
wvSetPosition -win $_nWave2 {("G5" 2)}
wvSetPosition -win $_nWave2 {("G5" 3)}
wvAddSignal -win $_nWave2 \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/memaccess_RD_ADDR\[4:0\]"
wvSetPosition -win $_nWave2 {("G5" 3)}
wvSetPosition -win $_nWave2 {("G5" 4)}
wvSetPosition -win $_nWave2 {("G5" 3)}
wvSetPosition -win $_nWave2 {("G5" 4)}
wvSetPosition -win $_nWave2 {("G5" 4)}
wvSetPosition -win $_nWave2 {("G5" 4)}
wvSetPosition -win $_nWave2 {("G5" 4)}
wvScrollDown -win $_nWave2 5
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G5" 4)}
wvSetPosition -win $_nWave2 {("G5" 3)}
wvSetPosition -win $_nWave2 {("G5" 3)}
wvSetPosition -win $_nWave2 {("G5" 3)}
wvSetPosition -win $_nWave2 {("G5" 3)}
wvSetCursor -win $_nWave2 2123.068723 -snap {("G5" 4)}
srcActiveTrace "tb_DandRiscvSimple.u_DandRiscvSimple.memaccess_RD_ADDR\[4:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 2123000 -TraceValue \
           10010
srcDeselectAll -win $_nTrace1
srcSelect -signal "execute_to_memaccess_RD_ADDR" -line 1436 -pos 1 -win $_nTrace1
srcAction -pos 1435 7 13 -win $_nTrace1 -name "execute_to_memaccess_RD_ADDR" \
          -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "execute_RD_ADDR" -line 3453 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave2 {("G2" 2)}
wvSetPosition -win $_nWave2 {("G2" 1)}
wvSetPosition -win $_nWave2 {("G2" 2)}
wvSetPosition -win $_nWave2 {("G2" 3)}
wvSetPosition -win $_nWave2 {("G2" 6)}
wvSetPosition -win $_nWave2 {("G3" 2)}
wvSetPosition -win $_nWave2 {("G1" 6)}
wvSetPosition -win $_nWave2 {("G5" 0)}
wvSetPosition -win $_nWave2 {("G4" 19)}
wvAddSignal -win $_nWave2 \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/execute_RD_ADDR\[4:0\]"
wvSetPosition -win $_nWave2 {("G4" 19)}
wvSetPosition -win $_nWave2 {("G4" 20)}
wvSetPosition -win $_nWave2 {("G4" 19)}
wvSetPosition -win $_nWave2 {("G4" 20)}
wvSetPosition -win $_nWave2 {("G4" 20)}
wvSetPosition -win $_nWave2 {("G4" 20)}
wvSetPosition -win $_nWave2 {("G4" 20)}
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
srcDeselectAll -win $_nTrace1
srcSelect -signal "decode_RD_ADDR" -line 3450 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave2 {("G1" 0)}
wvSetPosition -win $_nWave2 {("G1" 6)}
wvSetPosition -win $_nWave2 {("G2" 1)}
wvSetPosition -win $_nWave2 {("G2" 2)}
wvSetPosition -win $_nWave2 {("G1" 6)}
wvSetPosition -win $_nWave2 {("G3" 2)}
wvSetPosition -win $_nWave2 {("G3" 3)}
wvSetPosition -win $_nWave2 {("G3" 4)}
wvSetPosition -win $_nWave2 {("G3" 5)}
wvSetPosition -win $_nWave2 {("G3" 6)}
wvAddSignal -win $_nWave2 \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/decode_RD_ADDR\[4:0\]"
wvSetPosition -win $_nWave2 {("G3" 6)}
wvSetPosition -win $_nWave2 {("G3" 7)}
wvSetPosition -win $_nWave2 {("G3" 6)}
wvSetPosition -win $_nWave2 {("G3" 7)}
wvSetPosition -win $_nWave2 {("G3" 7)}
wvSetPosition -win $_nWave2 {("G3" 7)}
wvSetPosition -win $_nWave2 {("G3" 7)}
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSetMarker -win $_nWave2 2123.000000
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSelectSignal -win $_nWave2 {( "G3" 3 )} 
wvSelectSignal -win $_nWave2 {( "G2" 2 )} 
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvSetMarker -win $_nWave2 2121.000000
wvZoom -win $_nWave2 2117.840318 2137.793738
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 2113.671992 2135.431318
wvSelectSignal -win $_nWave2 {( "G2" 2 3 )} 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvSetCursor -win $_nWave2 2117.116347 -snap {("G2" 3)}
srcActiveTrace "tb_DandRiscvSimple.u_DandRiscvSimple.fetch_INSTRUCTION\[31:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 2117000 -TraceValue \
           00000000000100000000100100010011
srcDeselectAll -win $_nTrace1
srcSelect -signal "fetch_FetchPlugin_instruction_out_stream_payload" -line 1461 \
          -pos 1 -win $_nTrace1
srcAction -pos 1460 7 18 -win $_nTrace1 -name \
          "fetch_FetchPlugin_instruction_out_stream_payload" -ctrlKey off
wvScrollDown -win $_nWave2 0
srcDeselectAll -win $_nTrace1
srcSelect -signal \
          "fetch_FetchPlugin_instruction_stream_fifo_ports_m_ports_payload" \
          -line 1625 -pos 1 -win $_nTrace1
srcAction -pos 1624 7 14 -win $_nTrace1 -name \
          "fetch_FetchPlugin_instruction_stream_fifo_ports_m_ports_payload" \
          -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "_zz_ports_m_ports_payload" -line 53003 -pos 1 -win $_nTrace1
srcAction -pos 53002 7 12 -win $_nTrace1 -name "_zz_ports_m_ports_payload" \
          -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "fifo_ram_0" -line 52986 -pos 1 -win $_nTrace1
srcAction -pos 52985 9 5 -win $_nTrace1 -name "fifo_ram_0" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "ports_s_ports_payload" -line 53030 -pos 1 -win $_nTrace1
srcAction -pos 53029 5 7 -win $_nTrace1 -name "ports_s_ports_payload" -ctrlKey \
          off
srcDeselectAll -win $_nTrace1
srcSelect -signal "ICachePlugin_icache_access_rsp_payload_data" -line 1621 -pos 1 \
          -win $_nTrace1
wvSetPosition -win $_nWave2 {("G1" 6)}
wvSetPosition -win $_nWave2 {("G2" 3)}
wvSetPosition -win $_nWave2 {("G2" 4)}
wvSetPosition -win $_nWave2 {("G2" 5)}
wvSetPosition -win $_nWave2 {("G2" 6)}
wvAddSignal -win $_nWave2 \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/ICachePlugin_icache_access_rsp_payload_data\[31:0\]"
wvSetPosition -win $_nWave2 {("G2" 6)}
wvSetPosition -win $_nWave2 {("G2" 7)}
wvSetPosition -win $_nWave2 {("G2" 6)}
wvSetPosition -win $_nWave2 {("G2" 7)}
wvSetPosition -win $_nWave2 {("G2" 7)}
wvSetPosition -win $_nWave2 {("G2" 7)}
wvSetPosition -win $_nWave2 {("G2" 7)}
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
srcDeselectAll -win $_nTrace1
srcSelect -signal "fetch_FetchPlugin_instruction_in_stream_valid" -line 1620 -pos \
          1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "ICachePlugin_icache_access_rsp_valid" -line 1620 -pos 1 -win \
          $_nTrace1
srcSelect -signal "rsp_flush" -line 1620 -pos 1 -win $_nTrace1
srcSelect -signal "fetch_FetchPlugin_fetch_flush" -line 1620 -pos 1 -win \
          $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 2065.937318 2163.102719
wvSelectSignal -win $_nWave2 {( "G2" 5 )} 
wvSelectSignal -win $_nWave2 {( "G2" 6 )} 
wvZoom -win $_nWave2 2073.439190 2105.708010
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 2073.421310 2092.446443
wvSelectSignal -win $_nWave2 {( "G2" 4 )} 
wvSelectSignal -win $_nWave2 {( "G2" 4 5 )} 
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 2074.591492 2093.834498
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 2069.633237 2092.679349
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 2064.597487 2090.682927
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 2064.081946 2096.729700
wvSelectSignal -win $_nWave2 {( "G2" 4 5 9 )} 
wvSelectSignal -win $_nWave2 {( "G2" 10 )} 
wvSetCursor -win $_nWave2 2079.000775 -snap {("G2" 10)}
srcActiveTrace \
           "tb_DandRiscvSimple.u_DandRiscvSimple.fetch_FetchPlugin_fetch_flush" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 1997000 -TraceValue 0
srcDeselectAll -win $_nTrace1
srcSelect -signal "when_FetchPlugin_l93" -line 1570 -pos 1 -win $_nTrace1
srcAction -pos 1569 8 13 -win $_nTrace1 -name "when_FetchPlugin_l93" -ctrlKey off
srcBackwardHistory -win $_nTrace1
srcHBSelect "tb_DandRiscvSimple.u_DandRiscvSimple" -win $_nTrace1
srcHBSelect "tb_DandRiscvSimple.u_DandRiscvSimple" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "fetch_arbitration_flushIt" -line 1570 -pos 1 -win $_nTrace1
srcAction -pos 1569 12 6 -win $_nTrace1 -name "fetch_arbitration_flushIt" \
          -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "when_FetchPlugin_l96" -line 2693 -pos 1 -win $_nTrace1
srcAction -pos 2692 8 10 -win $_nTrace1 -name "when_FetchPlugin_l96" -ctrlKey off
wvScrollDown -win $_nWave2 4
wvSelectSignal -win $_nWave2 {( "G2" 10 )} {( "G4" 6 )} 
wvSelectSignal -win $_nWave2 {( "G2" 10 )} 
wvSelectSignal -win $_nWave2 {( "G2" 10 )} {( "G4" 6 )} 
wvSelectSignal -win $_nWave2 {( "G2" 10 )} 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoom -win $_nWave2 2065.149299 2097.809114
wvZoomOut -win $_nWave2
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvZoom -win $_nWave2 2065.888881 2106.330587
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 2100.362186 2151.694917
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 2057.496416 2117.798627
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 4 10 )} 
wvZoom -win $_nWave2 2071.898108 2126.297073
wvSelectSignal -win $_nWave2 {( "G2" 4 5 10 )} 
wvSelectSignal -win $_nWave2 {( "G2" 5 )} 
wvSetCursor -win $_nWave2 2083.131585 -snap {("G2" 5)}
srcActiveTrace "tb_DandRiscvSimple.u_DandRiscvSimple.fetch_valid" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 2083000 -TraceValue 0
wvSelectSignal -win $_nWave2 {( "G2" 4 )} 
srcHBSelect "tb_DandRiscvSimple.u_DandRiscvSimple.iCache_1" -win $_nTrace1
srcSetScope -win $_nTrace1 "tb_DandRiscvSimple.u_DandRiscvSimple.iCache_1" -delim \
           "."
srcHBSelect "tb_DandRiscvSimple.u_DandRiscvSimple.iCache_1" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "cpu_cmd_ready" -line 26777 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave2 {("G1" 6)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G2" 1)}
wvSetPosition -win $_nWave2 {("G2" 2)}
wvSetPosition -win $_nWave2 {("G2" 3)}
wvSetPosition -win $_nWave2 {("G2" 4)}
wvSetPosition -win $_nWave2 {("G2" 5)}
wvAddSignal -win $_nWave2 \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/iCache_1/cpu_cmd_ready"
wvSetPosition -win $_nWave2 {("G2" 5)}
wvSetPosition -win $_nWave2 {("G2" 6)}
wvSetPosition -win $_nWave2 {("G2" 5)}
wvSetPosition -win $_nWave2 {("G2" 6)}
wvSetPosition -win $_nWave2 {("G2" 6)}
wvSetPosition -win $_nWave2 {("G2" 6)}
wvSetPosition -win $_nWave2 {("G2" 6)}
wvSelectSignal -win $_nWave2 {( "G2" 4 6 )} 
wvSelectSignal -win $_nWave2 {( "G2" 9 )} 
wvZoom -win $_nWave2 2110.401402 2122.900906
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 10 )} 
wvZoom -win $_nWave2 2073.006784 2131.519422
wvZoom -win $_nWave2 2075.146700 2088.850805
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 2068.411084 2124.543746
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 2098.862068 2135.108796
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 10 )} 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 2047.250316 2204.930948
wvSetMarker -win $_nWave2 2115.000000
wvZoom -win $_nWave2 2108.819739 2134.915388
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 6 )} 
wvZoom -win $_nWave2 2107.272509 2134.881648
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 10 )} 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 2028.468662 -snap {("G2" 10)}
srcActiveTrace "tb_DandRiscvSimple.u_DandRiscvSimple.rsp_flush" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 1997000 -TraceValue 1
srcDeselectAll -win $_nTrace1
srcSelect -signal "when_FetchPlugin_l92" -line 3253 -pos 1 -win $_nTrace1
srcAction -pos 3252 3 10 -win $_nTrace1 -name "when_FetchPlugin_l92" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "fetch_state" -line 1603 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave2 {("G1" 6)}
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
           "/tb_DandRiscvSimple/u_DandRiscvSimple/fetch_state\[1:0\]"
wvSetPosition -win $_nWave2 {("G2" 11)}
wvSetPosition -win $_nWave2 {("G2" 12)}
wvSetPosition -win $_nWave2 {("G2" 11)}
wvSetPosition -win $_nWave2 {("G2" 12)}
wvSetPosition -win $_nWave2 {("G2" 12)}
wvSetPosition -win $_nWave2 {("G2" 12)}
wvSetPosition -win $_nWave2 {("G2" 12)}
wvZoom -win $_nWave2 1948.344022 2277.001911
wvZoom -win $_nWave2 2048.021941 2197.720935
wvZoom -win $_nWave2 2071.635340 2150.383536
wvSetCursor -win $_nWave2 2083.155209 -snap {("G2" 5)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "fetch_state_next" -line 1604 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 4 )} 
wvZoom -win $_nWave2 2076.813463 2094.965984
wvSelectSignal -win $_nWave2 {( "G2" 4 7 )} 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 2067.690262 2104.116008
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
wvZoom -win $_nWave2 358.256026 4223.287380
wvZoom -win $_nWave2 572.424738 1377.699094
wvZoom -win $_nWave2 680.706919 951.114895
wvSelectSignal -win $_nWave2 {( "G2" 12 )} 
wvSelectSignal -win $_nWave2 {( "G2" 5 )} 
wvZoom -win $_nWave2 781.498071 873.798392
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 11 )} 
wvSelectSignal -win $_nWave2 {( "G2" 12 )} 
wvSelectSignal -win $_nWave2 {( "G2" 13 )} 
wvSelectSignal -win $_nWave2 {( "G2" 10 )} 
wvSelectSignal -win $_nWave2 {( "G2" 10 )} 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 463.717905 1360.602888
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvZoom -win $_nWave2 644.950297 980.578110
wvZoom -win $_nWave2 714.134013 827.084489
wvZoom -win $_nWave2 730.991048 770.421487
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 1 )} 
wvSelectSignal -win $_nWave2 {( "G2" 5 )} 
wvSelectSignal -win $_nWave2 {( "G2" 9 )} 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 495.946656 1338.683080
wvSelectSignal -win $_nWave2 {( "G2" 4 )} 
wvZoom -win $_nWave2 727.255545 942.375925
wvZoom -win $_nWave2 788.207644 858.298584
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 868.772092 912.478596
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G3" 1 )} 
wvSetCursor -win $_nWave2 742.536664 -snap {("G3" 1)}
srcActiveTrace "tb_DandRiscvSimple.u_DandRiscvSimple.decode_arbitration_isValid" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 721000 -TraceValue 1
wvSetCursor -win $_nWave2 742.665830 -snap {("G2" 1)}
srcActiveTrace "tb_DandRiscvSimple.u_DandRiscvSimple.fetch_arbitration_isValid" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 741000 -TraceValue 0
srcDeselectAll -win $_nTrace1
srcSelect -signal "fetch_FetchPlugin_fifo_all_valid" -line 1627 -pos 1 -win \
          $_nTrace1
srcSelect -signal "fetch_arbitration_isStuck" -line 1627 -pos 1 -win $_nTrace1
srcSelect -signal "fetch_FetchPlugin_fetch_flush" -line 1627 -pos 1 -win \
          $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 698.814014 864.146339
wvSetCursor -win $_nWave2 745.475963 -snap {("G2" 14)}
srcActiveTrace \
           "tb_DandRiscvSimple.u_DandRiscvSimple.fetch_FetchPlugin_fifo_all_valid" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 745000 -TraceValue 0
srcDeselectAll -win $_nTrace1
srcSelect -signal "fetch_FetchPlugin_pc_out_stream_valid" -line 1571 -pos 1 -win \
          $_nTrace1
srcSelect -signal "fetch_FetchPlugin_instruction_out_stream_valid" -line 1571 \
          -pos 1 -win $_nTrace1
srcSelect -signal "fetch_FetchPlugin_pc_stream_fifo_next_valid" -line 1571 -pos 1 \
          -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvSetCursor -win $_nWave2 745.659191 -snap {("G2" 19)}
srcActiveTrace \
           "tb_DandRiscvSimple.u_DandRiscvSimple.fetch_FetchPlugin_pc_stream_fifo_next_valid" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 745000 -TraceValue 0
srcHBSelect \
           "tb_DandRiscvSimple.u_DandRiscvSimple.fetch_FetchPlugin_pc_stream_fifo" \
           -win $_nTrace1
srcSetScope -win $_nTrace1 \
           "tb_DandRiscvSimple.u_DandRiscvSimple.fetch_FetchPlugin_pc_stream_fifo" \
           -delim "."
srcHBSelect \
           "tb_DandRiscvSimple.u_DandRiscvSimple.fetch_FetchPlugin_pc_stream_fifo" \
           -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "ports_s_ports_valid" -line 53141 -pos 1 -win $_nTrace1
srcSelect -signal "ports_s_ports_ready" -line 53142 -pos 1 -win $_nTrace1
srcSelect -signal "ports_s_ports_payload" -line 53143 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvSetCursor -win $_nWave2 744.804129 -snap {("G2" 21)}
srcActiveTrace \
           "tb_DandRiscvSimple.u_DandRiscvSimple.fetch_FetchPlugin_pc_stream_fifo.ports_s_ports_ready" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 0 -TraceValue 1
srcDeselectAll -win $_nTrace1
srcSelect -signal "fifo_full" -line 53204 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvSetCursor -win $_nWave2 745.109508 -snap {("G2" 23)}
srcActiveTrace \
           "tb_DandRiscvSimple.u_DandRiscvSimple.fetch_FetchPlugin_pc_stream_fifo.fifo_full" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 0 -TraceValue 0
srcHBSelect \
           "tb_DandRiscvSimple.u_DandRiscvSimple.fetch_FetchPlugin_pc_stream_fifo" \
           -win $_nTrace1
srcSetScope -win $_nTrace1 \
           "tb_DandRiscvSimple.u_DandRiscvSimple.fetch_FetchPlugin_pc_stream_fifo" \
           -delim "."
srcHBSelect \
           "tb_DandRiscvSimple.u_DandRiscvSimple.fetch_FetchPlugin_pc_stream_fifo" \
           -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "ports_m_ports_valid" -line 53144 -pos 1 -win $_nTrace1
srcSelect -signal "ports_m_ports_ready" -line 53145 -pos 1 -win $_nTrace1
srcSelect -signal "ports_m_ports_payload" -line 53146 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvSetCursor -win $_nWave2 741.017426 -snap {("G2" 25)}
srcActiveTrace \
           "tb_DandRiscvSimple.u_DandRiscvSimple.fetch_FetchPlugin_pc_stream_fifo.ports_m_ports_ready" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 737000 -TraceValue 1
srcDeselectAll -win $_nTrace1
srcSelect -signal "fetch_arbitration_isFiring" -line 1609 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvSetCursor -win $_nWave2 740.712047 -snap {("G2" 27)}
srcActiveTrace "tb_DandRiscvSimple.u_DandRiscvSimple.fetch_arbitration_isFiring" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 737000 -TraceValue 1
srcDeselectAll -win $_nTrace1
srcSelect -signal "fetch_arbitration_isValid" -line 3198 -pos 1 -win $_nTrace1
srcSelect -signal "fetch_arbitration_isStuck" -line 3198 -pos 1 -win $_nTrace1
srcSelect -signal "fetch_arbitration_removeIt" -line 3198 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
srcDeselectAll -win $_nTrace1
srcSelect -signal "fetch_arbitration_isValid" -line 3198 -pos 1 -win $_nTrace1
srcAction -pos 3197 9 13 -win $_nTrace1 -name "fetch_arbitration_isValid" \
          -ctrlKey off
wvSelectSignal -win $_nWave2 {( "G2" 14 )} 
wvSelectSignal -win $_nWave2 {( "G2" 15 )} 
wvSelectSignal -win $_nWave2 {( "G2" 18 )} 
wvSelectSignal -win $_nWave2 {( "G2" 17 )} 
wvSelectSignal -win $_nWave2 {( "G2" 18 )} 
wvSelectSignal -win $_nWave2 {( "G2" 19 )} 
wvSelectSignal -win $_nWave2 {( "G2" 27 )} 
wvSetCursor -win $_nWave2 740.406668 -snap {("G2" 27)}
srcActiveTrace "tb_DandRiscvSimple.u_DandRiscvSimple.fetch_arbitration_isFiring" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 737000 -TraceValue 1
wvSelectSignal -win $_nWave2 {( "G2" 28 )} 
wvSelectSignal -win $_nWave2 {( "G2" 13 )} 
wvSelectSignal -win $_nWave2 {( "G2" 14 )} 
wvSelectSignal -win $_nWave2 {( "G2" 14 15 )} 
wvSelectSignal -win $_nWave2 {( "G2" 14 15 16 )} 
wvSelectSignal -win $_nWave2 {( "G2" 14 15 16 17 )} 
wvSelectSignal -win $_nWave2 {( "G2" 14 15 16 17 18 )} 
wvSelectSignal -win $_nWave2 {( "G2" 14 15 16 17 18 19 )} 
wvSelectSignal -win $_nWave2 {( "G2" 14 15 16 17 18 19 20 )} 
wvSelectSignal -win $_nWave2 {( "G2" 14 15 16 17 18 19 20 21 )} 
wvSelectSignal -win $_nWave2 {( "G2" 14 15 16 17 18 19 20 21 22 )} 
wvSelectSignal -win $_nWave2 {( "G2" 14 15 16 17 18 19 20 21 22 23 )} 
wvSelectSignal -win $_nWave2 {( "G2" 14 15 16 17 18 19 20 21 22 23 24 )} 
wvSelectSignal -win $_nWave2 {( "G2" 14 15 16 17 18 19 20 21 22 23 24 25 )} 
wvSelectSignal -win $_nWave2 {( "G2" 14 15 16 17 18 19 20 21 22 23 24 25 26 )} \
           
wvSelectSignal -win $_nWave2 {( "G2" 14 15 16 17 18 19 20 21 22 23 24 25 26 27 \
           )} 
wvSelectSignal -win $_nWave2 {( "G2" 14 15 16 17 18 19 20 21 22 23 24 25 26 27 \
           28 )} 
wvSelectSignal -win $_nWave2 {( "G2" 14 15 16 17 18 19 20 21 22 23 24 25 26 27 \
           28 29 )} 
wvSelectSignal -win $_nWave2 {( "G2" 14 15 16 17 18 19 20 21 22 23 24 25 26 27 \
           28 29 30 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G4" 8)}
wvSetPosition -win $_nWave2 {("G2" 13)}
wvSetPosition -win $_nWave2 {("G2" 13)}
wvSetPosition -win $_nWave2 {("G2" 13)}
wvSetPosition -win $_nWave2 {("G2" 13)}
wvSelectSignal -win $_nWave2 {( "G2" 13 )} 
wvSelectSignal -win $_nWave2 {( "G2" 12 )} 
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
srcDeselectAll -win $_nTrace1
srcBackwardHistory -win $_nTrace1
srcHBSelect "tb_DandRiscvSimple.u_DandRiscvSimple" -win $_nTrace1
srcHBSelect "tb_DandRiscvSimple.u_DandRiscvSimple" -win $_nTrace1
wvSetCursor -win $_nWave2 740.834747 -snap {("G2" 1)}
srcActiveTrace "tb_DandRiscvSimple.u_DandRiscvSimple.fetch_arbitration_isValid" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 737000 -TraceValue 1
srcDeselectAll -win $_nTrace1
srcSelect -signal "fetch_FetchPlugin_fifo_all_valid" -line 1627 -pos 1 -win \
          $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvSetCursor -win $_nWave2 745.049036 -snap {("G2" 14)}
srcActiveTrace \
           "tb_DandRiscvSimple.u_DandRiscvSimple.fetch_FetchPlugin_fifo_all_valid" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 743000 -TraceValue 1
srcDeselectAll -win $_nTrace1
srcSelect -signal "fetch_FetchPlugin_pc_stream_fifo_next_valid" -line 1571 -pos 1 \
          -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvSetCursor -win $_nWave2 744.560423 -snap {("G2" 15)}
srcActiveTrace \
           "tb_DandRiscvSimple.u_DandRiscvSimple.fetch_FetchPlugin_pc_stream_fifo_next_valid" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 719000 -TraceValue 1
srcHBSelect \
           "tb_DandRiscvSimple.u_DandRiscvSimple.fetch_FetchPlugin_pc_stream_fifo" \
           -win $_nTrace1
srcSetScope -win $_nTrace1 \
           "tb_DandRiscvSimple.u_DandRiscvSimple.fetch_FetchPlugin_pc_stream_fifo" \
           -delim "."
srcHBSelect \
           "tb_DandRiscvSimple.u_DandRiscvSimple.fetch_FetchPlugin_pc_stream_fifo" \
           -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "ports_m_ports_ready" -line 53145 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvSetCursor -win $_nWave2 741.140130 -snap {("G2" 16)}
srcActiveTrace \
           "tb_DandRiscvSimple.u_DandRiscvSimple.fetch_FetchPlugin_pc_stream_fifo.ports_m_ports_ready" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 741000 -TraceValue 0
srcDeselectAll -win $_nTrace1
srcSelect -signal "fetch_arbitration_isFiring" -line 1609 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvSetCursor -win $_nWave2 741.140130 -snap {("G2" 17)}
srcActiveTrace "tb_DandRiscvSimple.u_DandRiscvSimple.fetch_arbitration_isFiring" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 741000 -TraceValue 0
srcDeselectAll -win $_nTrace1
srcSelect -signal "fetch_arbitration_isValid" -line 3198 -pos 1 -win $_nTrace1
srcSelect -signal "fetch_arbitration_isStuck" -line 3198 -pos 1 -win $_nTrace1
srcSelect -signal "fetch_arbitration_removeIt" -line 3198 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 17 )} 
wvSelectSignal -win $_nWave2 {( "G2" 15 )} 
wvSelectSignal -win $_nWave2 {( "G2" 14 )} 
wvSetCursor -win $_nWave2 742.972430 -snap {("G2" 14)}
srcActiveTrace \
           "tb_DandRiscvSimple.u_DandRiscvSimple.fetch_FetchPlugin_fifo_all_valid" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 741000 -TraceValue 0
srcDeselectAll -win $_nTrace1
srcSelect -signal "fetch_FetchPlugin_pc_stream_fifo_next_valid" -line 1571 -pos 1 \
          -win $_nTrace1
srcAction -pos 1570 18 12 -win $_nTrace1 -name \
          "fetch_FetchPlugin_pc_stream_fifo_next_valid" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "fifo_cnt" -line 53214 -pos 1 -win $_nTrace1
srcAction -pos 53213 12 1 -win $_nTrace1 -name "fifo_cnt" -ctrlKey off
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
srcHBSelect \
           "tb_DandRiscvSimple.u_DandRiscvSimple.fetch_FetchPlugin_pc_stream_fifo" \
           -win $_nTrace1
srcSetScope -win $_nTrace1 \
           "tb_DandRiscvSimple.u_DandRiscvSimple.fetch_FetchPlugin_pc_stream_fifo" \
           -delim "."
srcHBSelect \
           "tb_DandRiscvSimple.u_DandRiscvSimple.fetch_FetchPlugin_pc_stream_fifo" \
           -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "ports_s_ports_valid" -line 53141 -pos 1 -win $_nTrace1
srcSelect -signal "ports_s_ports_ready" -line 53142 -pos 1 -win $_nTrace1
srcSelect -signal "ports_s_ports_payload" -line 53143 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvSetCursor -win $_nWave2 744.987959 -snap {("G2" 23)}
srcActiveTrace \
           "tb_DandRiscvSimple.u_DandRiscvSimple.fetch_FetchPlugin_pc_stream_fifo.ports_s_ports_ready" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 0 -TraceValue 1
srcDeselectAll -win $_nTrace1
srcSelect -signal "fifo_full" -line 53204 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvSetCursor -win $_nWave2 744.865806 -snap {("G2" 25)}
srcActiveTrace \
           "tb_DandRiscvSimple.u_DandRiscvSimple.fetch_FetchPlugin_pc_stream_fifo.fifo_full" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 0 -TraceValue 0
srcDeselectAll -win $_nTrace1
srcSelect -signal "read_addr" -line 53200 -pos 1 -win $_nTrace1
srcSelect -signal "write_addr" -line 53200 -pos 1 -win $_nTrace1
srcSelect -signal "read_ptr\[2\]" -line 53200 -pos 1 -win $_nTrace1
srcSelect -signal "write_ptr\[2\]" -line 53200 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvSetCursor -win $_nWave2 744.743652 -snap {("G2" 21)}
srcActiveTrace \
           "tb_DandRiscvSimple.u_DandRiscvSimple.fetch_FetchPlugin_pc_stream_fifo.fifo_cnt\[1:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 743000 -TraceValue 11
srcDeselectAll -win $_nTrace1
srcSelect -signal "when_FIFO_l61" -line 53238 -pos 1 -win $_nTrace1
wvSetCursor -win $_nWave2 745.232266 -snap {("G2" 21)}
srcActiveTrace \
           "tb_DandRiscvSimple.u_DandRiscvSimple.fetch_FetchPlugin_pc_stream_fifo.fifo_cnt\[1:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 745000 -TraceValue 00
srcDeselectAll -win $_nTrace1
srcSelect -signal "flush" -line 53235 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSetPosition -win $_nWave2 {("G2" 29)}
wvSetPosition -win $_nWave2 {("G2" 29)}
wvSetPosition -win $_nWave2 {("G2" 29)}
wvSetPosition -win $_nWave2 {("G2" 29)}
wvSelectSignal -win $_nWave2 {( "G2" 22 )} 
wvSelectSignal -win $_nWave2 {( "G2" 23 )} 
wvSelectSignal -win $_nWave2 {( "G2" 22 )} 
wvSelectSignal -win $_nWave2 {( "G2" 21 )} 
wvSelectSignal -win $_nWave2 {( "G2" 21 22 )} 
wvSelectSignal -win $_nWave2 {( "G2" 21 22 23 )} 
wvSelectSignal -win $_nWave2 {( "G2" 21 22 23 24 )} 
wvSelectSignal -win $_nWave2 {( "G2" 21 22 23 24 25 )} 
wvSelectSignal -win $_nWave2 {( "G2" 21 22 23 24 25 26 )} 
wvSelectSignal -win $_nWave2 {( "G2" 21 22 23 24 25 26 27 )} 
wvSelectSignal -win $_nWave2 {( "G2" 21 22 23 24 25 26 27 28 )} 
wvSelectSignal -win $_nWave2 {( "G2" 21 22 23 24 25 26 27 28 29 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G4" 0)}
wvSetPosition -win $_nWave2 {("G2" 20)}
wvSetPosition -win $_nWave2 {("G2" 20)}
wvSetPosition -win $_nWave2 {("G2" 20)}
wvSetPosition -win $_nWave2 {("G2" 20)}
wvSelectSignal -win $_nWave2 {( "G2" 20 )} 
wvSelectSignal -win $_nWave2 {( "G2" 17 )} 
wvSelectSignal -win $_nWave2 {( "G2" 18 )} 
wvSetCursor -win $_nWave2 740.956900 -snap {("G2" 18)}
srcActiveTrace "tb_DandRiscvSimple.u_DandRiscvSimple.fetch_arbitration_isValid" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 737000 -TraceValue 1
wvSelectSignal -win $_nWave2 {( "G2" 19 )} 
wvSelectSignal -win $_nWave2 {( "G2" 18 )} 
wvSelectSignal -win $_nWave2 {( "G2" 19 )} 
wvSelectSignal -win $_nWave2 {( "G2" 20 )} 
wvSelectSignal -win $_nWave2 {( "G2" 18 )} 
wvSelectSignal -win $_nWave2 {( "G2" 17 )} 
wvSelectSignal -win $_nWave2 {( "G2" 19 )} 
wvSelectSignal -win $_nWave2 {( "G2" 16 )} 
wvSetCursor -win $_nWave2 740.773670 -snap {("G2" 16)}
srcActiveTrace \
           "tb_DandRiscvSimple.u_DandRiscvSimple.fetch_FetchPlugin_pc_stream_fifo.ports_m_ports_ready" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 737000 -TraceValue 1
srcDeselectAll -win $_nTrace1
srcSelect -signal "fetch_arbitration_isFiring" -line 1609 -pos 1 -win $_nTrace1
srcAction -pos 1608 7 11 -win $_nTrace1 -name "fetch_arbitration_isFiring" \
          -ctrlKey off
wvSelectSignal -win $_nWave2 {( "G2" 18 )} 
wvSelectSignal -win $_nWave2 {( "G2" 17 )} 
wvSetCursor -win $_nWave2 737.964145 -snap {("G2" 17)}
srcActiveTrace "tb_DandRiscvSimple.u_DandRiscvSimple.fetch_arbitration_isFiring" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 737000 -TraceValue 1
wvSelectSignal -win $_nWave2 {( "G2" 19 )} 
wvSelectSignal -win $_nWave2 {( "G2" 16 )} 
wvSelectSignal -win $_nWave2 {( "G2" 15 )} 
wvSelectSignal -win $_nWave2 {( "G2" 19 )} 
wvSelectSignal -win $_nWave2 {( "G2" 20 )} 
wvSelectSignal -win $_nWave2 {( "G2" 19 )} 
wvSelectSignal -win $_nWave2 {( "G2" 20 )} 
wvSelectSignal -win $_nWave2 {( "G2" 19 )} 
wvSelectSignal -win $_nWave2 {( "G2" 20 )} 
wvSelectSignal -win $_nWave2 {( "G2" 19 )} 
wvSelectSignal -win $_nWave2 {( "G2" 14 )} 
wvSetCursor -win $_nWave2 744.987959 -snap {("G2" 14)}
srcActiveTrace \
           "tb_DandRiscvSimple.u_DandRiscvSimple.fetch_FetchPlugin_fifo_all_valid" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 743000 -TraceValue 1
srcDeselectAll -win $_nTrace1
srcSelect -signal "fetch_FetchPlugin_pc_stream_fifo_next_valid" -line 1571 -pos 1 \
          -win $_nTrace1
srcAction -pos 1570 18 19 -win $_nTrace1 -name \
          "fetch_FetchPlugin_pc_stream_fifo_next_valid" -ctrlKey off
srcBackwardHistory -win $_nTrace1
srcHBSelect \
           "tb_DandRiscvSimple.u_DandRiscvSimple.fetch_FetchPlugin_pc_stream_fifo" \
           -win $_nTrace1
srcHBSelect "tb_DandRiscvSimple.u_DandRiscvSimple" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "fetch_FetchPlugin_instruction_out_stream_valid" -line 1571 \
          -pos 1 -win $_nTrace1
srcAction -pos 1570 13 38 -win $_nTrace1 -name \
          "fetch_FetchPlugin_instruction_out_stream_valid" -ctrlKey off
srcBackwardHistory -win $_nTrace1
srcHBSelect "tb_DandRiscvSimple.u_DandRiscvSimple" -win $_nTrace1
srcHBSelect "tb_DandRiscvSimple.u_DandRiscvSimple" -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G2" 15 )} 
wvSetCursor -win $_nWave2 745.049036 -snap {("G2" 15)}
srcActiveTrace \
           "tb_DandRiscvSimple.u_DandRiscvSimple.fetch_FetchPlugin_pc_stream_fifo_next_valid" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 719000 -TraceValue 1
srcDeselectAll -win $_nTrace1
srcSelect -signal "fifo_cnt" -line 53214 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
srcDeselectAll -win $_nTrace1
debReload
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 629.095022 1104.515640
wvZoom -win $_nWave2 684.364209 1015.451282
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 1999.515858 2167.204534
wvZoom -win $_nWave2 2107.045213 2123.745788
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 2104.241173 2130.457552
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 2107.094139 4293.701264
wvZoom -win $_nWave2 2587.160049 3187.849604
wvZoom -win $_nWave2 2796.211579 2929.426330
wvZoom -win $_nWave2 2830.686629 2865.358962
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 453.500246 1623.399430
wvZoom -win $_nWave2 662.271592 942.077173
wvZoom -win $_nWave2 727.846169 838.069471
wvSelectSignal -win $_nWave2 {( "G2" 21 )} 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 397.237477 653.840261
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSelectSignal -win $_nWave2 {( "G1" 2 )} 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 580.657615 1140.034584
wvZoom -win $_nWave2 690.213489 803.704263
wvSetCursor -win $_nWave2 755.257443 -snap {("G1" 1)}
wvZoom -win $_nWave2 743.828531 771.686503
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 4 )} 
wvSelectSignal -win $_nWave2 {( "G2" 3 )} 
wvSetMarker -win $_nWave2 755.000000
wvSelectSignal -win $_nWave2 {( "G2" 2 3 )} 
wvSelectSignal -win $_nWave2 {( "G2" 10 )} 
wvZoom -win $_nWave2 734.231403 773.960728
wvSelectSignal -win $_nWave2 {( "G2" 6 )} 
wvSelectSignal -win $_nWave2 {( "G2" 7 )} 
wvSetCursor -win $_nWave2 742.924491 -snap {("G2" 7)}
srcActiveTrace "tb_DandRiscvSimple.u_DandRiscvSimple.fetch_state_next\[1:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 737000 -TraceValue 01
srcDeselectAll -win $_nTrace1
srcSelect -signal "when_FetchPlugin_l71" -line 1584 -pos 1 -win $_nTrace1
srcAction -pos 1583 3 12 -win $_nTrace1 -name "when_FetchPlugin_l71" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "fetch_arbitration_isStuck" -line 1601 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave2 {("G1" 1)}
wvSetPosition -win $_nWave2 {("G1" 2)}
wvSetPosition -win $_nWave2 {("G1" 3)}
wvSetPosition -win $_nWave2 {("G1" 6)}
wvSetPosition -win $_nWave2 {("G2" 3)}
wvSetPosition -win $_nWave2 {("G2" 4)}
wvSetPosition -win $_nWave2 {("G2" 5)}
wvSetPosition -win $_nWave2 {("G2" 6)}
wvSetPosition -win $_nWave2 {("G2" 7)}
wvAddSignal -win $_nWave2 \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/fetch_arbitration_isStuck"
wvSetPosition -win $_nWave2 {("G2" 7)}
wvSetPosition -win $_nWave2 {("G2" 8)}
wvSetPosition -win $_nWave2 {("G2" 7)}
wvSetPosition -win $_nWave2 {("G2" 8)}
wvSetPosition -win $_nWave2 {("G2" 8)}
wvSetPosition -win $_nWave2 {("G2" 8)}
wvSetPosition -win $_nWave2 {("G2" 8)}
wvSelectSignal -win $_nWave2 {( "G2" 5 8 )} 
wvSelectSignal -win $_nWave2 {( "G2" 5 8 10 )} 
wvSelectSignal -win $_nWave2 {( "G2" 3 5 8 10 )} 
wvSelectSignal -win $_nWave2 {( "G2" 5 8 10 )} 
wvSelectSignal -win $_nWave2 {( "G2" 5 8 9 10 )} 
wvSelectSignal -win $_nWave2 {( "G2" 5 9 10 )} 
wvSelectSignal -win $_nWave2 {( "G2" 4 5 9 10 )} 
wvSelectSignal -win $_nWave2 {( "G2" 4 5 9 10 11 )} 
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
wvZoom -win $_nWave2 0.000000 1839.763051
wvZoom -win $_nWave2 34.057072 866.411922
wvZoom -win $_nWave2 112.331094 377.353371
wvZoom -win $_nWave2 134.702467 268.930707
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 8 )} 
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 1 8 )} 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 62.815437 534.328779
wvZoom -win $_nWave2 77.828450 261.301431
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 1 5 8 )} 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 1 5 8 11 )} 
wvSetCursor -win $_nWave2 169.004360 -snap {("G2" 11)}
srcActiveTrace "tb_DandRiscvSimple.u_DandRiscvSimple.rsp_flush" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 0 -TraceValue 0
wvZoom -win $_nWave2 117.379234 403.762829
wvZoom -win $_nWave2 146.537134 231.890261
wvZoomOut -win $_nWave2
srcDeselectAll -win $_nTrace1
debReload
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 617.854250 1004.139559
wvZoom -win $_nWave2 730.693609 851.970892
wvZoom -win $_nWave2 748.294755 790.187278
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 736.096136 777.073569
wvSelectSignal -win $_nWave2 {( "G2" 2 )} 
wvSelectSignal -win $_nWave2 {( "G2" 2 3 )} 
wvSelectSignal -win $_nWave2 {( "G2" 1 2 3 )} 
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 768.190827 784.666758
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 756.213599 775.660200
wvZoomOut -win $_nWave2
wvScrollDown -win $_nWave2 0
wvSelectSignal -win $_nWave2 {( "G1" 1 )} 
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
srcHBSelect "tb_DandRiscvSimple" -win $_nTrace1
srcSetScope -win $_nTrace1 "tb_DandRiscvSimple" -delim "."
srcHBSelect "tb_DandRiscvSimple" -win $_nTrace1
srcDeselectAll -win $_nTrace1
debReload
srcDeselectAll -win $_nTrace1
srcSelect -signal "instrCnt" -line 426 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave2 {("G1" 0)}
wvSetPosition -win $_nWave2 {("G1" 1)}
wvSetPosition -win $_nWave2 {("G1" 0)}
wvAddSignal -win $_nWave2 "/tb_DandRiscvSimple/instrCnt\[31:0\]"
wvSetPosition -win $_nWave2 {("G1" 0)}
wvSetPosition -win $_nWave2 {("G1" 1)}
wvSetPosition -win $_nWave2 {("G1" 0)}
wvSetPosition -win $_nWave2 {("G1" 1)}
wvSetPosition -win $_nWave2 {("G1" 1)}
wvSetPosition -win $_nWave2 {("G1" 1)}
wvSetPosition -win $_nWave2 {("G1" 1)}
wvSelectSignal -win $_nWave2 {( "G1" 1 )} 
wvSelectSignal -win $_nWave2 {( "G1" 1 )} 
wvSetRadix -win $_nWave2 -format UDec
wvSetSearchMode -win $_nWave2 -value 275
wvSearchNext -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 2416.969890 2452.104809
wvSelectSignal -win $_nWave2 {( "G2" 2 )} 
wvSelectSignal -win $_nWave2 {( "G2" 2 3 )} 
wvScrollDown -win $_nWave2 48
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 2286.557033 2668.683420
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G5" 2 )} 
wvZoom -win $_nWave2 2410.065488 2484.340331
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 2365.420834 2476.076877
wvSetCursor -win $_nWave2 2385.044768 -snap {("G5" 1)}
wvSetMarker -win $_nWave2 2385.000000
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
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G6" 43 )} 
wvSelectSignal -win $_nWave2 {( "G6" 44 )} 
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G6" 52 )} 
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
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
wvSelectSignal -win $_nWave2 {( "G6" 13 )} 
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvZoom -win $_nWave2 2379.268203 2420.769340
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 2368.090092 2453.950275
wvSelectSignal -win $_nWave2 {( "G6" 4 )} 
wvSelectSignal -win $_nWave2 {( "G6" 3 4 )} 
wvSelectSignal -win $_nWave2 {( "G6" 3 4 5 )} 
wvZoom -win $_nWave2 2419.905012 2433.192519
wvZoomOut -win $_nWave2
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
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
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
wvSelectSignal -win $_nWave2 {( "G6" 13 )} 
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
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
wvSelectSignal -win $_nWave2 {( "G4" 11 )} 
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G4" 13 )} 
wvSelectSignal -win $_nWave2 {( "G4" 14 )} 
wvSelectSignal -win $_nWave2 {( "G4" 13 )} 
wvZoom -win $_nWave2 2380.758275 2417.555961
wvSelectSignal -win $_nWave2 {( "G4" 8 )} 
srcDeselectAll -win $_nTrace1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
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
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
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
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 8
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
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 2
wvScrollDown -win $_nWave2 2
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
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
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
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G6" 43 )} 
wvSelectSignal -win $_nWave2 {( "G6" 44 )} 
wvSelectSignal -win $_nWave2 {( "G6" 43 )} 
wvSelectSignal -win $_nWave2 {( "G6" 44 )} 
wvSelectSignal -win $_nWave2 {( "G6" 46 )} 
wvSelectSignal -win $_nWave2 {( "G6" 45 )} 
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
wvSelectSignal -win $_nWave2 {( "G6" 50 )} 
wvSelectSignal -win $_nWave2 {( "G6" 49 )} 
wvSelectSignal -win $_nWave2 {( "G6" 50 )} 
wvSelectSignal -win $_nWave2 {( "G6" 51 )} 
wvSelectSignal -win $_nWave2 {( "G6" 52 )} 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G6" 30 )} 
wvSelectSignal -win $_nWave2 {( "G6" 30 )} 
wvSelectSignal -win $_nWave2 {( "G6" 30 32 )} 
wvZoom -win $_nWave2 2121.451064 2701.276891
wvZoom -win $_nWave2 2191.004403 2413.832692
wvZoom -win $_nWave2 2247.928327 2319.371977
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 2265.108131 -snap {("G6" 30)}
wvScrollDown -win $_nWave2 0
wvSelectSignal -win $_nWave2 {( "G6" 25 30 32 )} 
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 2212.285855 2363.267103
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 2216.841564 2369.220270
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G6" 23 25 30 32 )} 
wvSelectSignal -win $_nWave2 {( "G6" 23 24 25 30 32 )} 
wvZoom -win $_nWave2 2209.253658 2370.263960
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
wvSelectSignal -win $_nWave2 {( "G6" 17 23 24 25 30 32 )} 
wvSelectSignal -win $_nWave2 {( "G6" 16 17 23 24 25 30 32 )} 
wvSelectSignal -win $_nWave2 {( "G6" 6 )} 
wvZoom -win $_nWave2 2201.712820 2377.566352
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G6" 5 6 )} 
wvScrollUp -win $_nWave2 6
srcHBSelect "tb_DandRiscvSimple.u_DandRiscvSimple" -win $_nTrace1
srcSetScope -win $_nTrace1 "tb_DandRiscvSimple.u_DandRiscvSimple" -delim "."
srcHBSelect "tb_DandRiscvSimple.u_DandRiscvSimple" -win $_nTrace1
srcHBSelect "tb_DandRiscvSimple.u_DandRiscvSimple.dCache_1" -win $_nTrace1
srcSetScope -win $_nTrace1 "tb_DandRiscvSimple.u_DandRiscvSimple.dCache_1" -delim \
           "."
srcHBSelect "tb_DandRiscvSimple.u_DandRiscvSimple.dCache_1" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "cpu_cmd_payload_wdata" -line 5238 -pos 1 -win $_nTrace1
srcSelect -signal "cpu_cmd_payload_wstrb" -line 5239 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave2 {("G4" 14)}
wvSetPosition -win $_nWave2 {("G4" 15)}
wvSetPosition -win $_nWave2 {("G4" 16)}
wvSetPosition -win $_nWave2 {("G2" 7)}
wvSetPosition -win $_nWave2 {("G6" 4)}
wvSetPosition -win $_nWave2 {("G6" 5)}
wvSetPosition -win $_nWave2 {("G6" 6)}
wvSetPosition -win $_nWave2 {("G6" 7)}
wvSetPosition -win $_nWave2 {("G6" 6)}
wvAddSignal -win $_nWave2 \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/dCache_1/cpu_cmd_payload_wdata\[63:0\]" \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/dCache_1/cpu_cmd_payload_wstrb\[7:0\]"
wvSetPosition -win $_nWave2 {("G6" 6)}
wvSetPosition -win $_nWave2 {("G6" 8)}
wvSetPosition -win $_nWave2 {("G6" 6)}
wvSetPosition -win $_nWave2 {("G6" 8)}
wvSetPosition -win $_nWave2 {("G6" 8)}
wvSetPosition -win $_nWave2 {("G6" 8)}
wvSetPosition -win $_nWave2 {("G6" 8)}
wvZoom -win $_nWave2 2203.242830 2398.953944
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G6" 5 7 8 )} 
wvZoom -win $_nWave2 2367.796677 2393.591996
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 2246.761144 2357.086032
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G6" 5 7 8 15 )} 
wvScrollDown -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G6" 5 7 8 15 19 )} 
wvSelectSignal -win $_nWave2 {( "G6" 5 7 8 15 19 20 )} 
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
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
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
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
wvSelectSignal -win $_nWave2 {( "G6" 36 )} 
wvSelectSignal -win $_nWave2 {( "G6" 37 )} 
wvSelectSignal -win $_nWave2 {( "G6" 32 )} 
wvSelectSignal -win $_nWave2 {( "G6" 34 )} 
wvSelectSignal -win $_nWave2 {( "G6" 35 )} 
wvSelectSignal -win $_nWave2 {( "G6" 34 )} 
wvSelectSignal -win $_nWave2 {( "G6" 34 35 )} 
wvSelectSignal -win $_nWave2 {( "G6" 29 )} 
wvSelectSignal -win $_nWave2 {( "G6" 28 )} 
wvSelectSignal -win $_nWave2 {( "G6" 27 )} 
wvSetCursor -win $_nWave2 2235.712316 -snap {("G6" 27)}
srcActiveTrace \
           "tb_DandRiscvSimple.u_DandRiscvSimple.dcache_aw_payload_addr\[63:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 2235000 -TraceValue \
           0000000000000000000000000000000010000000000000001101001001000000
srcDeselectAll -win $_nTrace1
srcSelect -signal "dCache_1_next_level_cmd_payload_addr" -line 3316 -pos 1 -win \
          $_nTrace1
srcAction -pos 3315 5 17 -win $_nTrace1 -name \
          "dCache_1_next_level_cmd_payload_addr" -ctrlKey off
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 9
wvSelectSignal -win $_nWave2 {( "G6" 45 )} 
wvSelectSignal -win $_nWave2 {( "G6" 45 46 )} 
wvSelectSignal -win $_nWave2 {( "G6" 45 46 49 )} 
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G6" 49 )} 
wvSetCursor -win $_nWave2 2234.732014 -snap {("G6" 49)}
srcActiveTrace \
           "tb_DandRiscvSimple.u_DandRiscvSimple.dcache_ar_payload_len\[7:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 2229000 -TraceValue \
           00000111
srcDeselectAll -win $_nTrace1
srcSelect -signal "dCache_1_next_level_cmd_payload_len" -line 3301 -pos 1 -win \
          $_nTrace1
srcAction -pos 3300 9 7 -win $_nTrace1 -name \
          "dCache_1_next_level_cmd_payload_len" -ctrlKey off
wvSelectSignal -win $_nWave2 {( "G6" 42 49 )} 
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollUp -win $_nWave2 2
wvSelectSignal -win $_nWave2 {( "G6" 25 )} 
wvSelectSignal -win $_nWave2 {( "G6" 25 26 )} 
wvZoom -win $_nWave2 2225.664215 2375.977281
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 2368.659188 2422.863159
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
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvZoom -win $_nWave2 2370.836578 2400.457112
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G6" 25 26 32 )} 
wvSelectSignal -win $_nWave2 {( "G6" 25 26 32 33 )} 
wvSelectSignal -win $_nWave2 {( "G6" 25 26 32 33 34 )} 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 2233.958129 2397.139744
wvScrollDown -win $_nWave2 1
wvSetMarker -win $_nWave2 2263.000000
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvScrollUp -win $_nWave2 1
wvSetMarker -win $_nWave2 51.000000
wvScrollDown -win $_nWave2 1
wvSetMarker -win $_nWave2 2265.000000
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G6" 25 26 27 32 33 34 )} 
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G6" 5 25 26 27 32 33 34 )} 
srcDeselectAll -win $_nTrace1
debReload
wvScrollDown -win $_nWave2 9
wvSelectSignal -win $_nWave2 {( "G6" 35 )} 
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 42
wvScrollDown -win $_nWave2 2
wvSelectSignal -win $_nWave2 {( "G5" 2 )} 
wvSetSearchMode -win $_nWave2 -value 27c4
wvSearchNext -win $_nWave2
wvSearchPrev -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchPrev -win $_nWave2
wvSearchPrev -win $_nWave2
wvScrollDown -win $_nWave2 1
wvZoomOut -win $_nWave2
wvSetSearchMode -win $_nWave2 -value 800027c4
wvSearchPrev -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchPrev -win $_nWave2
wvSearchNext -win $_nWave2
wvZoom -win $_nWave2 12462.010464 12487.989026
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
wvZoom -win $_nWave2 12461.803675 12516.973252
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
wvSelectSignal -win $_nWave2 {( "G6" 6 )} 
wvSelectSignal -win $_nWave2 {( "G6" 5 )} 
wvSelectSignal -win $_nWave2 {( "G6" 6 )} 
wvSelectSignal -win $_nWave2 {( "G6" 5 )} 
wvSelectSignal -win $_nWave2 {( "G6" 8 )} 
wvSelectSignal -win $_nWave2 {( "G6" 6 )} 
wvSelectSignal -win $_nWave2 {( "G6" 6 7 )} 
wvSetMarker -win $_nWave2 12473.000000
wvZoom -win $_nWave2 12457.238550 12519.169005
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G6" 5 6 7 )} 
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G6" 1 5 6 7 )} 
wvSelectSignal -win $_nWave2 {( "G6" 5 6 7 )} 
wvSelectSignal -win $_nWave2 {( "G6" 1 5 6 7 )} 
wvSelectSignal -win $_nWave2 {( "G6" 5 6 7 )} 
wvSelectSignal -win $_nWave2 {( "G6" 1 5 6 7 )} 
wvSelectSignal -win $_nWave2 {( "G6" 5 6 7 )} 
wvSelectSignal -win $_nWave2 {( "G6" 1 5 6 7 )} 
wvSelectSignal -win $_nWave2 {( "G6" 5 6 7 )} 
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G6" 5 6 7 25 )} 
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G6" 5 6 7 25 26 )} 
wvSelectSignal -win $_nWave2 {( "G6" 5 6 7 25 26 27 )} 
wvSelectSignal -win $_nWave2 {( "G6" 5 6 7 25 26 27 28 )} 
wvSelectSignal -win $_nWave2 {( "G6" 5 6 7 25 26 27 28 29 )} 
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G6" 32 )} 
wvSelectSignal -win $_nWave2 {( "G6" 32 33 )} 
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G6" 32 33 35 )} 
wvSelectSignal -win $_nWave2 {( "G6" 32 33 )} 
wvSelectSignal -win $_nWave2 {( "G6" 32 33 34 )} 
wvSelectSignal -win $_nWave2 {( "G6" 32 33 34 35 )} 
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
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
wvSelectSignal -win $_nWave2 {( "G6" 41 )} 
wvSelectSignal -win $_nWave2 {( "G6" 41 42 )} 
wvSelectSignal -win $_nWave2 {( "G6" 41 42 43 )} 
wvSelectSignal -win $_nWave2 {( "G6" 41 42 43 44 )} 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 3
wvScrollUp -win $_nWave2 6
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 13
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 51
wvScrollDown -win $_nWave2 4
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
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvZoom -win $_nWave2 13140.112957 13349.956541
wvZoom -win $_nWave2 13230.700746 13267.526314
wvSetCursor -win $_nWave2 13241.130794 -snap {("G1" 1)}
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
wvZoom -win $_nWave2 13234.975021 13265.733437
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G6" 5 )} 
wvSelectSignal -win $_nWave2 {( "G5" 3 )} {( "G6" 5 )} 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 13191.274384 13248.668836
wvZoomOut -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvZoom -win $_nWave2 13184.506471 13222.840270
wvSelectSignal -win $_nWave2 {( "G5" 3 )} {( "G6" 1 5 )} 
wvSetCursor -win $_nWave2 13199.011151 -snap {("G6" 1)}
wvZoom -win $_nWave2 13192.397471 13212.380437
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 13189.752558 13265.630120
wvSelectSignal -win $_nWave2 {( "G5" 3 )} {( "G6" 1 5 9 )} 
wvSelectSignal -win $_nWave2 {( "G5" 3 )} {( "G6" 1 5 9 10 )} 
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvZoom -win $_nWave2 13231.301212 13253.185188
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 13184.004761 13238.645834
wvZoom -win $_nWave2 13193.755593 13204.133553
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 13217.787045 13267.521334
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 13171.505247 13241.033820
wvZoom -win $_nWave2 13191.686810 13210.607025
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 13178.002752 13264.975500
wvZoom -win $_nWave2 13192.814845 13222.825435
wvZoom -win $_nWave2 13194.892587 13208.036803
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 13197.041114 -snap {("G5" 2)}
wvZoom -win $_nWave2 13194.792825 13203.270139
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvScrollDown -win $_nWave2 2
wvSetCursor -win $_nWave2 13197.007096 -snap {("G6" 10)}
srcActiveTrace \
           "tb_DandRiscvSimple.u_DandRiscvSimple.dCache_1.cpu_rsp_payload_data\[63:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 13195000 -TraceValue \
           0000000000000000000000000000000010000000000000000010110100111100
srcDeselectAll -win $_nTrace1
srcSelect -signal "is_hit_d1" -line 11502 -pos 1 -win $_nTrace1
srcAction -pos 11501 8 4 -win $_nTrace1 -name "is_hit_d1" -ctrlKey off
srcBackwardHistory -win $_nTrace1
srcHBSelect "tb_DandRiscvSimple.u_DandRiscvSimple.dCache_1" -win $_nTrace1
srcHBSelect "tb_DandRiscvSimple.u_DandRiscvSimple.dCache_1" -win $_nTrace1
wvSetPosition -win $_nWave2 {("G4" 1)}
wvSetPosition -win $_nWave2 {("G4" 0)}
wvSetPosition -win $_nWave2 {("G3" 7)}
wvSetPosition -win $_nWave2 {("G4" 1)}
wvSetPosition -win $_nWave2 {("G4" 2)}
wvSetPosition -win $_nWave2 {("G4" 3)}
wvSetPosition -win $_nWave2 {("G4" 4)}
wvSetPosition -win $_nWave2 {("G4" 5)}
wvSetPosition -win $_nWave2 {("G4" 6)}
wvSetPosition -win $_nWave2 {("G4" 7)}
wvSetPosition -win $_nWave2 {("G4" 8)}
wvSetPosition -win $_nWave2 {("G4" 9)}
wvSetPosition -win $_nWave2 {("G2" 7)}
wvSetPosition -win $_nWave2 {("G6" 2)}
wvSetPosition -win $_nWave2 {("G6" 1)}
wvSetPosition -win $_nWave2 {("G6" 0)}
wvAddSignal -win $_nWave2 \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/dCache_1/is_hit_d1"
wvSetPosition -win $_nWave2 {("G6" 0)}
wvSetPosition -win $_nWave2 {("G6" 1)}
wvSetPosition -win $_nWave2 {("G6" 0)}
wvSetPosition -win $_nWave2 {("G6" 1)}
wvSetPosition -win $_nWave2 {("G6" 1)}
wvSetPosition -win $_nWave2 {("G6" 1)}
wvSetPosition -win $_nWave2 {("G6" 1)}
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvSetPosition -win $_nWave2 {("G6" 2)}
wvSetPosition -win $_nWave2 {("G6" 3)}
wvSetPosition -win $_nWave2 {("G6" 4)}
wvSetPosition -win $_nWave2 {("G6" 5)}
wvSetPosition -win $_nWave2 {("G6" 6)}
wvSetPosition -win $_nWave2 {("G6" 7)}
wvSetPosition -win $_nWave2 {("G6" 8)}
wvSetPosition -win $_nWave2 {("G6" 9)}
wvSetPosition -win $_nWave2 {("G6" 10)}
wvSetPosition -win $_nWave2 {("G6" 11)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G6" 11)}
wvSetPosition -win $_nWave2 {("G6" 11)}
wvSetPosition -win $_nWave2 {("G6" 11)}
wvSetPosition -win $_nWave2 {("G6" 11)}
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G6" 3 11 )} 
wvSelectSignal -win $_nWave2 {( "G6" 3 4 11 )} 
wvSelectSignal -win $_nWave2 {( "G6" 4 11 )} 
wvSelectSignal -win $_nWave2 {( "G6" 11 )} 
wvSelectSignal -win $_nWave2 {( "G6" 3 11 )} 
wvSelectSignal -win $_nWave2 {( "G6" 3 4 11 )} 
srcDeselectAll -win $_nTrace1
srcSelect -signal "_zz_cpu_rsp_payload_data_2" -line 11502 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "_zz_cpu_rsp_payload_data_2" -line 11502 -pos 1 -win $_nTrace1
srcAction -pos 11501 12 14 -win $_nTrace1 -name "_zz_cpu_rsp_payload_data_2" \
          -ctrlKey off
srcBackwardHistory -win $_nTrace1
srcHBSelect "tb_DandRiscvSimple.u_DandRiscvSimple.dCache_1" -win $_nTrace1
srcHBSelect "tb_DandRiscvSimple.u_DandRiscvSimple.dCache_1" -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G6" 5 )} 
srcDeselectAll -win $_nTrace1
srcSelect -signal "_zz_cpu_rsp_payload_data_2" -line 11502 -pos 1 -win $_nTrace1
srcSelect -signal "_zz_cpu_rsp_payload_data_3" -line 11502 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvScrollDown -win $_nWave2 1
srcDeselectAll -win $_nTrace1
srcSelect -signal "_zz_cpu_rsp_payload_data_2" -line 11502 -pos 1 -win $_nTrace1
srcAction -pos 11501 12 15 -win $_nTrace1 -name "_zz_cpu_rsp_payload_data_2" \
          -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "cpu_bank_index" -line 9940 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
srcDeselectAll -win $_nTrace1
srcSelect -signal "_zz_cpu_rsp_payload_data\[63 : 0\]" -line 9942 -pos 1 -win \
          $_nTrace1
srcAction -pos 9941 5 9 -win $_nTrace1 -name "_zz_cpu_rsp_payload_data\[63 : 0\]" \
          -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "_zz__zz_cpu_rsp_payload_data" -line 11500 -pos 1 -win \
          $_nTrace1
srcAction -pos 11499 7 10 -win $_nTrace1 -name "_zz__zz_cpu_rsp_payload_data" \
          -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "sram_banks_data_2" -line 9908 -pos 1 -win $_nTrace1
srcAction -pos 9907 5 10 -win $_nTrace1 -name "sram_banks_data_2" -ctrlKey off
srcBackwardHistory -win $_nTrace1
srcHBSelect "tb_DandRiscvSimple.u_DandRiscvSimple.dCache_1" -win $_nTrace1
srcHBSelect "tb_DandRiscvSimple.u_DandRiscvSimple.dCache_1" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "hit_id" -line 9898 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
srcDeselectAll -win $_nTrace1
srcSelect -signal "sram_banks_data_3" -line 9912 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvZoom -win $_nWave2 13195.701445 13201.193966
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoom -win $_nWave2 13194.799582 13203.527423
wvZoomOut -win $_nWave2
srcDeselectAll -win $_nTrace1
srcSelect -signal "sram_banks_data_3" -line 9912 -pos 1 -win $_nTrace1
srcAction -pos 9911 5 9 -win $_nTrace1 -name "sram_banks_data_3" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "sram_3_ports_rsp_payload_data" -line 11278 -pos 1 -win \
          $_nTrace1
srcAction -pos 11277 7 19 -win $_nTrace1 -name "sram_3_ports_rsp_payload_data" \
          -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "_zz_sram_3_banks_0_bank_port1" -line 5208 -pos 1 -win \
          $_nTrace1
srcAction -pos 5207 5 17 -win $_nTrace1 -name "_zz_sram_3_banks_0_bank_port1" \
          -ctrlKey off
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
srcDeselectAll -win $_nTrace1
srcSelect -signal "sram_3_banks_0_bank_symbol7\[sram_3_ports_cmd_payload_addr\]" \
          -line 4898 -pos 1 -win $_nTrace1
srcAction -pos 4897 7 10 -win $_nTrace1 -name \
          "sram_3_banks_0_bank_symbol7\[sram_3_ports_cmd_payload_addr\]" \
          -ctrlKey off
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 13083.869397 13120.887594
wvZoom -win $_nWave2 13094.079896 13101.014812
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 13172.231853 13220.871263
srcHBSelect "tb_DandRiscvSimple.u_DandRiscvSimple.sramBanks_3" -win $_nTrace1
srcSetScope -win $_nTrace1 "tb_DandRiscvSimple.u_DandRiscvSimple.sramBanks_3" \
           -delim "."
srcHBSelect "tb_DandRiscvSimple.u_DandRiscvSimple.sramBanks_3" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "sram_3_ports_cmd_valid" -line 3524 -pos 1 -win $_nTrace1
srcSelect -signal "sram_3_ports_cmd_payload_addr" -line 3525 -pos 1 -win \
          $_nTrace1
srcSelect -signal "sram_3_ports_cmd_payload_wen" -line 3526 -pos 1 -win $_nTrace1
srcSelect -signal "sram_3_ports_cmd_payload_wdata" -line 3527 -pos 1 -win \
          $_nTrace1
srcSelect -signal "sram_3_ports_cmd_payload_wstrb" -line 3528 -pos 1 -win \
          $_nTrace1
srcSelect -signal "sram_3_ports_rsp_valid" -line 3529 -pos 1 -win $_nTrace1
srcSelect -signal "sram_3_ports_rsp_payload_data" -line 3530 -pos 1 -win \
          $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 13067.902930 13181.424899
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 13031.484275 13063.678954
wvZoom -win $_nWave2 13033.856264 13043.630287
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G6" 21 )} 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G6" 19 21 )} 
wvZoom -win $_nWave2 13156.972409 13235.483038
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 12798.355271 13131.349632
wvZoom -win $_nWave2 12874.175905 12970.831803
wvScrollDown -win $_nWave2 1
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 12858.412513 12949.378559
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 12426.197497 12630.424860
wvZoom -win $_nWave2 12464.532659 12498.255504
wvSelectSignal -win $_nWave2 {( "G6" 18 )} 
wvZoom -win $_nWave2 12469.788978 12492.387405
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G6" 10 )} 
wvSelectSignal -win $_nWave2 {( "G6" 20 )} 
wvSelectSignal -win $_nWave2 {( "G6" 10 )} 
wvZoom -win $_nWave2 12482.167494 12488.241710
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G6" 10 17 )} 
wvZoom -win $_nWave2 12480.823791 12493.075671
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 12469.077680 12488.637143
wvSelectSignal -win $_nWave2 {( "G6" 10 17 19 )} 
wvSetMarker -win $_nWave2 12483.000000
wvZoom -win $_nWave2 12480.711304 12485.896263
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 12498.753081 12539.111683
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 4
wvScrollUp -win $_nWave2 6
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 7
wvScrollUp -win $_nWave2 9
wvScrollUp -win $_nWave2 4
wvScrollUp -win $_nWave2 3
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
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
wvZoom -win $_nWave2 12509.399325 12539.104212
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
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvZoom -win $_nWave2 13169.335024 13233.385844
wvZoom -win $_nWave2 13189.799984 13208.272990
wvScrollDown -win $_nWave2 2
wvSelectSignal -win $_nWave2 {( "G6" 9 10 17 19 )} 
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
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 3
wvScrollUp -win $_nWave2 6
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 4
wvScrollUp -win $_nWave2 5
wvScrollUp -win $_nWave2 5
wvScrollUp -win $_nWave2 2
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 3
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 13235.312245 13252.383190
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvZoomOut -win $_nWave2
wvSetMarker -win $_nWave2 13239.000000
wvZoom -win $_nWave2 13234.385599 13246.381398
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 6 )} 
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
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
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 5
wvScrollUp -win $_nWave2 3
wvScrollUp -win $_nWave2 2
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 3
wvScrollUp -win $_nWave2 3
wvScrollUp -win $_nWave2 2
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 2
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 2
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 3
wvScrollDown -win $_nWave2 9
wvScrollDown -win $_nWave2 5
wvScrollDown -win $_nWave2 5
wvScrollDown -win $_nWave2 6
wvScrollDown -win $_nWave2 4
wvScrollDown -win $_nWave2 3
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 2
wvScrollDown -win $_nWave2 2
wvScrollDown -win $_nWave2 2
wvScrollDown -win $_nWave2 2
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 1
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
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvZoomOut -win $_nWave2
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
wvZoom -win $_nWave2 13231.225654 13250.482887
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 6 )} {( "G6" 9 )} 
wvSelectSignal -win $_nWave2 {( "G1" 6 )} {( "G6" 9 10 )} 
wvZoom -win $_nWave2 13231.450239 13249.317186
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 13191.935907 13223.846368
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 13183.388251 13249.170348
wvSetMarker -win $_nWave2 13197.000000
wvZoom -win $_nWave2 13193.933845 13211.444888
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
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvZoom -win $_nWave2 13188.192997 13212.102930
wvScrollDown -win $_nWave2 1
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
wvSelectSignal -win $_nWave2 {( "G6" 15 )} 
wvSelectSignal -win $_nWave2 {( "G6" 11 )} 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G6" 17 )} 
wvSelectSignal -win $_nWave2 {( "G6" 17 18 )} 
wvSelectSignal -win $_nWave2 {( "G6" 17 18 19 )} 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 13077.845251 13130.108946
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G6" 18 )} 
wvSetSearchMode -win $_nWave2 -value 35
wvSearchPrev -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 13185.013884 13219.224255
wvSearchPrev -win $_nWave2
wvSearchPrev -win $_nWave2
wvZoom -win $_nWave2 12482.644724 12489.129622
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSetMarker -win $_nWave2 12483.000000
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
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
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G5" 2 )} {( "G6" 18 )} 
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvZoom -win $_nWave2 12482.060099 12487.428567
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G5" 2 )} {( "G6" 18 20 )} 
wvZoom -win $_nWave2 12482.305565 12487.103597
wvSetCursor -win $_nWave2 12482.996581 -snap {("G6" 20)}
srcActiveTrace \
           "tb_DandRiscvSimple.u_DandRiscvSimple.sramBanks_3.sram_3_ports_cmd_payload_wdata\[511:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 12475000 -TraceValue \
           00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
srcDeselectAll -win $_nTrace1
srcSelect -signal "_zz_sram_3_ports_cmd_payload_wdata_1" -line 11337 -pos 1 -win \
          $_nTrace1
srcAction -pos 11336 14 12 -win $_nTrace1 -name \
          "_zz_sram_3_ports_cmd_payload_wdata_1" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "next_level_data_cnt_value" -line 8097 -pos 1 -win $_nTrace1
srcAction -pos 8096 8 10 -win $_nTrace1 -name "next_level_data_cnt_value" \
          -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "next_level_data_cnt_value" -line 13058 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G6" 24 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G6" 24)}
wvSetPosition -win $_nWave2 {("G6" 23)}
wvSetPosition -win $_nWave2 {("G6" 23)}
wvSetPosition -win $_nWave2 {("G6" 23)}
wvSetPosition -win $_nWave2 {("G6" 23)}
wvScrollUp -win $_nWave2 20
wvSelectSignal -win $_nWave2 {( "G6" 23 )} 
wvZoomIn -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G6" 20 )} 
wvSetCursor -win $_nWave2 12482.937072 -snap {("G6" 20)}
wvSetCursor -win $_nWave2 12483.011681 -snap {("G6" 20)}
srcActiveTrace \
           "tb_DandRiscvSimple.u_DandRiscvSimple.sramBanks_3.sram_3_ports_cmd_payload_wdata\[511:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 12483000 -TraceValue \
           0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx00110001001100000011000000110000
srcDeselectAll -win $_nTrace1
srcSelect -signal "next_level_rsp_payload_data" -line 11337 -pos 1 -win $_nTrace1
srcAction -pos 11336 9 17 -win $_nTrace1 -name "next_level_rsp_payload_data" \
          -ctrlKey off
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
srcDeselectAll -win $_nTrace1
srcSelect -signal "axi_mem_rdata" -line 114 -pos 1 -win $_nTrace1
srcAction -pos 113 7 3 -win $_nTrace1 -name "axi_mem_rdata" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcBackwardHistory -win $_nTrace1
srcHBSelect "tb_DandRiscvSimple" -win $_nTrace1
srcHBSelect "tb_DandRiscvSimple.u_axi_slave_mem_d" -win $_nTrace1
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvSetCursor -win $_nWave2 12483.011681 -snap {("G6" 20)}
srcActiveTrace \
           "tb_DandRiscvSimple.u_DandRiscvSimple.sramBanks_3.sram_3_ports_cmd_payload_wdata\[511:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 12483000 -TraceValue \
           0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx00110001001100000011000000110000
srcHBSelect "tb_DandRiscvSimple.u_DandRiscvSimple.dCache_1" -win $_nTrace1
srcSetScope -win $_nTrace1 "tb_DandRiscvSimple.u_DandRiscvSimple.dCache_1" -delim \
           "."
srcHBSelect "tb_DandRiscvSimple.u_DandRiscvSimple.dCache_1" -win $_nTrace1
wvSetCursor -win $_nWave2 12483.015233 -snap {("G6" 20)}
srcActiveTrace \
           "tb_DandRiscvSimple.u_DandRiscvSimple.sramBanks_3.sram_3_ports_cmd_payload_wdata\[511:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 12483000 -TraceValue \
           0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx00110001001100000011000000110000
srcDeselectAll -win $_nTrace1
srcSelect -signal "when_DCache_l196_3" -line 11336 -pos 1 -win $_nTrace1
srcAction -pos 11335 3 9 -win $_nTrace1 -name "when_DCache_l196_3" -ctrlKey off
srcBackwardHistory -win $_nTrace1
srcHBSelect "tb_DandRiscvSimple.u_DandRiscvSimple.dCache_1" -win $_nTrace1
srcHBSelect "tb_DandRiscvSimple.u_DandRiscvSimple.dCache_1" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "when_DCache_l196_3" -line 11336 -pos 1 -win $_nTrace1
srcAction -pos 11335 3 10 -win $_nTrace1 -name "when_DCache_l196_3" -ctrlKey off
srcBackwardHistory -win $_nTrace1
srcHBSelect "tb_DandRiscvSimple.u_DandRiscvSimple.dCache_1" -win $_nTrace1
srcHBSelect "tb_DandRiscvSimple.u_DandRiscvSimple.dCache_1" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "when_DCache_l196_3" -line 11336 -pos 1 -win $_nTrace1
srcAction -pos 11335 3 14 -win $_nTrace1 -name "when_DCache_l196_3" -ctrlKey off
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G6" 24)}
wvSetPosition -win $_nWave2 {("G6" 23)}
wvSetPosition -win $_nWave2 {("G6" 23)}
wvSetPosition -win $_nWave2 {("G6" 23)}
wvSetPosition -win $_nWave2 {("G6" 23)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "evict_id" -line 11364 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G6" 24 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G6" 24)}
wvSetPosition -win $_nWave2 {("G6" 23)}
wvSetPosition -win $_nWave2 {("G6" 23)}
wvSetPosition -win $_nWave2 {("G6" 23)}
wvSetPosition -win $_nWave2 {("G6" 23)}
wvSelectSignal -win $_nWave2 {( "G6" 2 )} 
wvSelectSignal -win $_nWave2 {( "G6" 3 )} 
wvSelectSignal -win $_nWave2 {( "G6" 2 )} 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 12446.419810 12515.485878
wvSelectSignal -win $_nWave2 {( "G6" 2 26 )} 
wvSelectSignal -win $_nWave2 {( "G6" 2 26 27 )} 
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G6" 2 26 27 43 )} 
wvSelectSignal -win $_nWave2 {( "G6" 2 26 27 )} 
wvSelectSignal -win $_nWave2 {( "G6" 2 26 27 44 )} 
wvSelectSignal -win $_nWave2 {( "G6" 2 26 27 )} 
wvSelectSignal -win $_nWave2 {( "G6" 2 26 27 44 )} 
wvSelectSignal -win $_nWave2 {( "G6" 2 26 27 )} 
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G6" 2 26 27 45 )} 
wvSelectSignal -win $_nWave2 {( "G6" 2 26 27 )} 
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvZoom -win $_nWave2 12478.050586 12493.802048
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G6" 2 26 27 38 )} 
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvSetCursor -win $_nWave2 12488.900491 -snap {("G6" 26)}
srcActiveTrace \
           "tb_DandRiscvSimple.u_DandRiscvSimple.dCache_1.next_level_cmd_valid" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 12477000 -TraceValue 0
srcDeselectAll -win $_nTrace1
srcSelect -signal "next_level_cmd_valid_1" -line 11512 -pos 1 -win $_nTrace1
srcAction -pos 11511 7 7 -win $_nTrace1 -name "next_level_cmd_valid_1" -ctrlKey \
          off
srcBackwardHistory -win $_nTrace1
srcHBSelect "tb_DandRiscvSimple.u_DandRiscvSimple.dCache_1" -win $_nTrace1
srcHBSelect "tb_DandRiscvSimple.u_DandRiscvSimple.dCache_1" -win $_nTrace1
wvZoom -win $_nWave2 12480.712764 12488.037398
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
wvZoom -win $_nWave2 12481.432753 12488.065872
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
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
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 6
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G6" 2 26 27 38 40 )} 
wvZoomIn -win $_nWave2
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
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G6" 20 )} 
wvSelectSignal -win $_nWave2 {( "G6" 19 )} 
wvSelectSignal -win $_nWave2 {( "G6" 20 )} 
wvSelectSignal -win $_nWave2 {( "G6" 19 )} 
wvSetCursor -win $_nWave2 12482.966401 -snap {("G6" 19)}
srcActiveTrace \
           "tb_DandRiscvSimple.u_DandRiscvSimple.sramBanks_3.sram_3_ports_cmd_payload_wen\[7:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 12475000 -TraceValue \
           00000000
srcDeselectAll -win $_nTrace1
srcSelect -signal "when_DCache_l196_3" -line 11320 -pos 1 -win $_nTrace1
srcAction -pos 11319 3 7 -win $_nTrace1 -name "when_DCache_l196_3" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "next_level_rsp_valid" -line 11364 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave2 {("G5" 0)}
wvSetPosition -win $_nWave2 {("G6" 1)}
wvSetPosition -win $_nWave2 {("G6" 8)}
wvSetPosition -win $_nWave2 {("G6" 9)}
wvSetPosition -win $_nWave2 {("G6" 10)}
wvSetPosition -win $_nWave2 {("G6" 11)}
wvSetPosition -win $_nWave2 {("G6" 12)}
wvSetPosition -win $_nWave2 {("G6" 13)}
wvSetPosition -win $_nWave2 {("G6" 14)}
wvSetPosition -win $_nWave2 {("G6" 15)}
wvSetPosition -win $_nWave2 {("G6" 16)}
wvSetPosition -win $_nWave2 {("G6" 17)}
wvSetPosition -win $_nWave2 {("G6" 18)}
wvSetPosition -win $_nWave2 {("G6" 19)}
wvSetPosition -win $_nWave2 {("G6" 20)}
wvSetPosition -win $_nWave2 {("G6" 21)}
wvSetPosition -win $_nWave2 {("G6" 22)}
wvSetPosition -win $_nWave2 {("G6" 23)}
wvAddSignal -win $_nWave2 \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/dCache_1/next_level_rsp_valid"
wvSetPosition -win $_nWave2 {("G6" 23)}
wvSetPosition -win $_nWave2 {("G6" 24)}
wvSetPosition -win $_nWave2 {("G6" 23)}
wvSetPosition -win $_nWave2 {("G6" 24)}
wvSetPosition -win $_nWave2 {("G6" 24)}
wvSetPosition -win $_nWave2 {("G6" 24)}
wvSetPosition -win $_nWave2 {("G6" 24)}
srcBackwardHistory -win $_nTrace1
srcHBSelect "tb_DandRiscvSimple.u_DandRiscvSimple.dCache_1" -win $_nTrace1
srcHBSelect "tb_DandRiscvSimple.u_DandRiscvSimple.dCache_1" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "when_DCache_l182_3" -line 11314 -pos 1 -win $_nTrace1
srcAction -pos 11313 3 10 -win $_nTrace1 -name "when_DCache_l182_3" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "is_hit" -line 11280 -pos 1 -win $_nTrace1
srcSelect -signal "hit_id" -line 11280 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave2 {("G6" 2)}
wvSetPosition -win $_nWave2 {("G6" 1)}
wvSetPosition -win $_nWave2 {("G6" 0)}
wvAddSignal -win $_nWave2 "/tb_DandRiscvSimple/u_DandRiscvSimple/dCache_1/is_hit" \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/dCache_1/hit_id\[1:0\]"
wvSetPosition -win $_nWave2 {("G6" 0)}
wvSetPosition -win $_nWave2 {("G6" 2)}
wvSetPosition -win $_nWave2 {("G6" 0)}
wvSetPosition -win $_nWave2 {("G6" 2)}
wvSetPosition -win $_nWave2 {("G6" 2)}
wvSetPosition -win $_nWave2 {("G6" 2)}
wvSetPosition -win $_nWave2 {("G6" 2)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "is_hit" -line 11280 -pos 1 -win $_nTrace1
srcAction -pos 11279 8 2 -win $_nTrace1 -name "is_hit" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "cache_hit_3" -line 9978 -pos 1 -win $_nTrace1
srcSelect -signal "cache_hit_2" -line 9978 -pos 1 -win $_nTrace1
srcSelect -signal "cache_hit_1" -line 9978 -pos 1 -win $_nTrace1
srcSelect -signal "cache_hit_0" -line 9978 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
srcDeselectAll -win $_nTrace1
srcSelect -signal "cpu_cmd_fire" -line 9978 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
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
wvSelectSignal -win $_nWave2 {( "G5" 1 )} {( "G6" 7 )} 
wvSelectSignal -win $_nWave2 {( "G6" 7 )} 
wvSelectSignal -win $_nWave2 {( "G5" 1 )} {( "G6" 7 )} 
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoom -win $_nWave2 12470.770892 12500.004749
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
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
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
srcDeselectAll -win $_nTrace1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G5" 1 )} {( "G6" 1 7 )} 
wvSelectSignal -win $_nWave2 {( "G5" 1 )} {( "G6" 7 )} 
wvSelectSignal -win $_nWave2 {( "G5" 1 )} {( "G6" 7 10 )} 
wvSelectSignal -win $_nWave2 {( "G5" 1 )} {( "G6" 7 10 11 )} 
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G6" 8 )} 
wvSelectSignal -win $_nWave2 {( "G6" 9 )} 
wvSelectSignal -win $_nWave2 {( "G6" 9 )} 
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G6" 24 )} 
wvZoom -win $_nWave2 12458.004755 12513.160526
wvZoomOut -win $_nWave2
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G6" 9 24 )} 
wvSelectSignal -win $_nWave2 {( "G6" 8 9 24 )} 
wvSelectSignal -win $_nWave2 {( "G6" 8 24 )} 
wvSelectSignal -win $_nWave2 {( "G6" 10 )} 
wvSelectSignal -win $_nWave2 {( "G6" 10 11 )} 
wvSelectSignal -win $_nWave2 {( "G6" 10 11 13 )} 
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvZoom -win $_nWave2 12467.224611 12478.210840
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 12479.014165 12491.932441
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 12454.500050 12505.465304
wvZoomOut -win $_nWave2
wvSetMarker -win $_nWave2 12469.000000
wvZoom -win $_nWave2 12464.227036 12483.096067
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvZoom -win $_nWave2 12466.941075 12476.609619
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G5" 3 )} {( "G6" 10 11 13 )} 
wvSelectSignal -win $_nWave2 {( "G6" 10 11 13 )} 
wvSelectSignal -win $_nWave2 {( "G5" 3 )} {( "G6" 10 11 13 )} 
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G5" 3 )} {( "G6" 10 11 13 34 )} 
wvSelectSignal -win $_nWave2 {( "G5" 3 )} {( "G6" 10 11 13 34 35 )} 
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G5" 3 )} {( "G6" 10 11 13 24 34 35 )} 
wvSelectSignal -win $_nWave2 {( "G5" 3 )} {( "G6" 10 11 13 34 35 )} 
wvSelectSignal -win $_nWave2 {( "G5" 3 )} {( "G6" 10 11 13 24 34 35 )} 
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvZoom -win $_nWave2 12466.921387 12479.349816
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 12468.874689 -snap {("G6" 24)}
srcActiveTrace \
           "tb_DandRiscvSimple.u_DandRiscvSimple.sramBanks_3.sram_3_ports_cmd_valid" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 12461000 -TraceValue 0
srcDeselectAll -win $_nTrace1
srcSelect -signal "when_DCache_l196_3" -line 11304 -pos 1 -win $_nTrace1
srcAction -pos 11303 3 11 -win $_nTrace1 -name "when_DCache_l196_3" -ctrlKey off
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
srcDeselectAll -win $_nTrace1
srcSelect -signal "next_level_rsp_valid" -line 11364 -pos 1 -win $_nTrace1
srcAction -pos 11363 8 11 -win $_nTrace1 -name "next_level_rsp_valid" -ctrlKey \
          off
srcDeselectAll -win $_nTrace1
debReload
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 12805.910131 12984.960497
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 2
wvScrollUp -win $_nWave2 4
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 6
wvScrollUp -win $_nWave2 2
wvScrollUp -win $_nWave2 6
wvScrollUp -win $_nWave2 26
wvScrollUp -win $_nWave2 17
wvScrollUp -win $_nWave2 1
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 12386.855377 12828.084269
wvZoom -win $_nWave2 12498.265264 12583.864649
wvZoomOut -win $_nWave2
srcDeselectAll -win $_nTrace1
debReload
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 13249.945762 13888.851208
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 17776.097658 18381.650395
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 17615.909790 17736.527107
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 17716.632618 17741.550968
wvSetCursor -win $_nWave2 17731.043007 -snap {("G1" 1)}
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
srcDeselectAll -win $_nTrace1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
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
wvSetMarker -win $_nWave2 17729.000000
wvZoom -win $_nWave2 17727.555730 17735.821869
wvZoomOut -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSetCursor -win $_nWave2 17729.059916 -snap {("G4" 2)}
wvSelectSignal -win $_nWave2 {( "G4" 3 )} 
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G4" 3 6 )} 
wvSelectSignal -win $_nWave2 {( "G4" 3 6 7 )} 
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G4" 8 )} 
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 17719.379873 17738.231934
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 17722.977887 17737.802684
wvSetMarker -win $_nWave2 17725.000000
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G4" 7 )} 
wvScrollUp -win $_nWave2 24
wvSelectSignal -win $_nWave2 {( "G1" 7 )} 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 17713.913410 -snap {("G1" 7)}
srcActiveTrace \
           "tb_DandRiscvSimple.u_DandRiscvSimple.regFileModule_1.reg_file_0\[63:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 0 -TraceValue \
           0000000000000000000000000000000000000000000000000000000000000000
wvSelectSignal -win $_nWave2 {( "G1" 7 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G6" 8)}
wvSetPosition -win $_nWave2 {("G6" 7)}
wvSetPosition -win $_nWave2 {("G6" 7)}
wvSetPosition -win $_nWave2 {("G6" 7)}
wvSetPosition -win $_nWave2 {("G6" 7)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "reg_file_1" -line 48393 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave2 {("G1" 4)}
wvSetPosition -win $_nWave2 {("G1" 5)}
wvSetPosition -win $_nWave2 {("G1" 6)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G1" 6)}
wvSetPosition -win $_nWave2 {("G1" 5)}
wvSetPosition -win $_nWave2 {("G1" 6)}
wvAddSignal -win $_nWave2 \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/regFileModule_1/reg_file_1\[63:0\]"
wvSetPosition -win $_nWave2 {("G1" 6)}
wvSetPosition -win $_nWave2 {("G1" 7)}
wvSetPosition -win $_nWave2 {("G1" 6)}
wvSetPosition -win $_nWave2 {("G1" 7)}
wvSetPosition -win $_nWave2 {("G1" 7)}
wvSetPosition -win $_nWave2 {("G1" 7)}
wvSetPosition -win $_nWave2 {("G1" 7)}
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 16782.228804 18928.619030
wvZoom -win $_nWave2 17596.760452 17939.261077
wvZoom -win $_nWave2 17707.461321 17760.212250
wvZoom -win $_nWave2 17721.054303 17731.424812
srcDeselectAll -win $_nTrace1
srcSelect -signal "reg_file_14" -line 48406 -pos 1 -win $_nTrace1
srcSelect -signal "reg_file_16" -line 48408 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 17704.830466 17785.183670
wvZoom -win $_nWave2 17716.849235 17752.518798
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 17726.166109 17740.455064
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
wvScrollDown -win $_nWave2 32
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
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
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G2" 1)}
wvSetPosition -win $_nWave2 {("G1" 7)}
wvSetPosition -win $_nWave2 {("G1" 7)}
wvSetPosition -win $_nWave2 {("G1" 7)}
wvSetPosition -win $_nWave2 {("G1" 7)}
wvZoom -win $_nWave2 17716.159608 17736.008612
wvZoomOut -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 26
wvSelectSignal -win $_nWave2 {( "G4" 2 )} 
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 17713.488334 17739.003232
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
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 17716.657622 17729.996029
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 2 )} 
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvSetCursor -win $_nWave2 17720.961370 -snap {("G2" 2)}
srcActiveTrace "tb_DandRiscvSimple.u_DandRiscvSimple.fetch_PC\[63:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 17707000 -TraceValue \
           0000000000000000000000000000000010000000000000000000011011110100
wvSelectSignal -win $_nWave2 {( "G2" 4 )} 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 5 )} 
wvSelectSignal -win $_nWave2 {( "G2" 5 )} 
wvSelectSignal -win $_nWave2 {( "G2" 4 )} 
wvSelectSignal -win $_nWave2 {( "G2" 5 )} 
wvSelectSignal -win $_nWave2 {( "G2" 4 )} 
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoom -win $_nWave2 17704.857503 17745.035688
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 17711.484449 17740.253279
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoom -win $_nWave2 17717.406503 17728.579589
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 17656.376474 17754.597033
wvZoom -win $_nWave2 17676.413322 17701.977578
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 17681.122029 -snap {("G2" 4)}
wvSelectSignal -win $_nWave2 {( "G2" 5 )} 
wvSelectSignal -win $_nWave2 {( "G2" 4 )} 
wvSelectSignal -win $_nWave2 {( "G2" 5 )} 
wvSelectSignal -win $_nWave2 {( "G2" 4 )} 
wvZoom -win $_nWave2 17678.661197 17693.899424
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 17681.095590 -snap {("G2" 4)}
srcActiveTrace "tb_DandRiscvSimple.u_DandRiscvSimple.pc_next\[63:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 17681000 -TraceValue \
           0000000000000000000000000000000010000000000000000000011011111000
wvScrollUp -win $_nWave2 2
wvSelectSignal -win $_nWave2 {( "G2" 8 )} 
wvSelectSignal -win $_nWave2 {( "G2" 5 )} 
wvSelectSignal -win $_nWave2 {( "G2" 6 )} 
wvSelectSignal -win $_nWave2 {( "G2" 6 7 )} 
wvSelectSignal -win $_nWave2 {( "G2" 6 7 8 )} 
wvSelectSignal -win $_nWave2 {( "G2" 6 7 8 9 )} 
wvSelectSignal -win $_nWave2 {( "G2" 6 7 8 9 10 )} 
wvSelectSignal -win $_nWave2 {( "G2" 6 7 8 9 10 11 )} 
wvSelectSignal -win $_nWave2 {( "G2" 6 7 8 9 10 11 12 )} 
wvSelectSignal -win $_nWave2 {( "G2" 6 7 8 9 10 11 12 13 )} 
wvSelectSignal -win $_nWave2 {( "G2" 6 7 8 9 10 11 12 13 14 )} 
wvSelectSignal -win $_nWave2 {( "G2" 6 7 8 9 10 11 12 13 14 15 )} 
wvSelectSignal -win $_nWave2 {( "G2" 6 7 8 9 10 11 12 13 14 15 16 )} 
wvSelectSignal -win $_nWave2 {( "G2" 6 7 8 9 10 11 12 13 14 15 16 17 )} 
wvSelectSignal -win $_nWave2 {( "G2" 6 7 8 9 10 11 12 13 14 15 16 17 18 )} 
wvSelectSignal -win $_nWave2 {( "G2" 6 7 8 9 10 11 12 13 14 15 16 17 18 19 )} \
           
wvSelectSignal -win $_nWave2 {( "G2" 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 \
           )} 
wvSelectSignal -win $_nWave2 {( "G2" 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 \
           21 )} 
wvSelectSignal -win $_nWave2 {( "G2" 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 \
           21 22 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 7)}
wvSetPosition -win $_nWave2 {("G1" 7)}
wvSetPosition -win $_nWave2 {("G1" 7)}
wvSetPosition -win $_nWave2 {("G1" 7)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "fetch_BPU_BRANCH_TAKEN" -line 3281 -pos 1 -win $_nTrace1
srcSelect -signal "fetch_BPU_PC_NEXT" -line 3282 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave2 {("G1" 1)}
wvSetPosition -win $_nWave2 {("G6" 23)}
wvSetPosition -win $_nWave2 {("G2" 3)}
wvSetPosition -win $_nWave2 {("G2" 4)}
wvSetPosition -win $_nWave2 {("G2" 5)}
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSetPosition -win $_nWave2 {("G2" 5)}
wvAddSignal -win $_nWave2 \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/fetch_BPU_BRANCH_TAKEN" \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/fetch_BPU_PC_NEXT\[63:0\]"
wvSetPosition -win $_nWave2 {("G2" 5)}
wvSetPosition -win $_nWave2 {("G2" 7)}
wvSetPosition -win $_nWave2 {("G2" 5)}
wvSetPosition -win $_nWave2 {("G2" 7)}
wvSetPosition -win $_nWave2 {("G2" 7)}
wvSetPosition -win $_nWave2 {("G2" 7)}
wvSetPosition -win $_nWave2 {("G2" 7)}
wvSelectSignal -win $_nWave2 {( "G2" 6 )} 
wvScrollUp -win $_nWave2 1
wvSetCursor -win $_nWave2 17683.036334 -snap {("G2" 4)}
srcActiveTrace "tb_DandRiscvSimple.u_DandRiscvSimple.pc_next\[63:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 17683000 -TraceValue \
           0000000000000000000000000000000010000000000000000000011010100000
wvSetCursor -win $_nWave2 17682.991201 -snap {("G2" 4)}
srcActiveTrace "tb_DandRiscvSimple.u_DandRiscvSimple.pc_next\[63:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 17681000 -TraceValue \
           0000000000000000000000000000000010000000000000000000011011111000
wvSelectSignal -win $_nWave2 {( "G2" 5 )} 
wvSelectSignal -win $_nWave2 {( "G2" 4 )} 
wvSelectSignal -win $_nWave2 {( "G2" 5 )} 
wvSelectSignal -win $_nWave2 {( "G2" 4 )} 
wvSelectSignal -win $_nWave2 {( "G2" 5 )} 
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 17687.261966 17702.426851
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 17675.474230 17701.009179
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoom -win $_nWave2 17674.457937 17707.924697
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 6 )} 
srcDeselectAll -win $_nTrace1
debReload
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
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 0.000000 1316.253240
wvZoom -win $_nWave2 495.117842 813.338266
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
srcDeselectAll -win $_nTrace1
debReload
wvSetCursor -win $_nWave2 17971.343947 -snap {("G2" 1)}
wvZoom -win $_nWave2 17545.057386 18120.918178
wvZoom -win $_nWave2 17714.127215 17758.899806
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 17717.467340 17744.453559
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvSelectSignal -win $_nWave2 {( "G2" 6 )} 
wvSelectSignal -win $_nWave2 {( "G2" 6 )} 
wvSelectSignal -win $_nWave2 {( "G2" 6 7 )} 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 4 )} 
wvZoom -win $_nWave2 17717.702133 17735.246672
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 17697.348259 17784.752672
wvZoom -win $_nWave2 17716.926071 17735.759602
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 5 )} 
wvSelectSignal -win $_nWave2 {( "G2" 6 )} 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 17666.042067 17718.477519
wvZoom -win $_nWave2 17677.923036 17691.725926
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
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSetCursor -win $_nWave2 17681.007095 -snap {("G2" 6)}
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
wvZoom -win $_nWave2 501.073676 1772.454646
wvZoom -win $_nWave2 696.887998 817.859827
wvZoom -win $_nWave2 713.145967 744.049544
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 1786.709590 2318.328919
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 5215.026189 7189.556033
wvZoom -win $_nWave2 6323.277667 6737.044380
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 16991.632729 18479.896335
wvZoom -win $_nWave2 17610.961975 17943.768794
wvZoom -win $_nWave2 17678.114776 17807.984597
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 5 )} 
srcDeselectAll -win $_nTrace1
debReload
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvZoom -win $_nWave2 17666.262532 17761.176648
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
wvZoom -win $_nWave2 74.787116 2759.644576
wvZoom -win $_nWave2 378.958305 809.370479
wvZoom -win $_nWave2 440.309171 500.225860
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 102.574887 457.150362
wvZoom -win $_nWave2 192.104866 307.496145
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 6 )} 
wvZoom -win $_nWave2 0.000000 673.084043
wvZoom -win $_nWave2 136.560554 430.614301
wvZoom -win $_nWave2 186.531183 295.399657
wvSetCursor -win $_nWave2 207.934056 -snap {("G2" 6)}
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 0.000000 949.304068
wvZoom -win $_nWave2 172.217325 351.815391
wvZoom -win $_nWave2 196.420840 246.357215
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 195.450215 238.157740
wvSelectSignal -win $_nWave2 {( "G2" 4 )} 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoom -win $_nWave2 193.070547 238.892986
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 70.302920 400.373774
wvZoom -win $_nWave2 135.070619 252.263491
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 142.598558 174.098752
wvSetCursor -win $_nWave2 146.995290 -snap {("G2" 4)}
wvSelectSignal -win $_nWave2 {( "G2" 5 )} 
wvSelectSignal -win $_nWave2 {( "G2" 6 )} 
wvSelectSignal -win $_nWave2 {( "G2" 7 )} 
wvSelectSignal -win $_nWave2 {( "G2" 6 )} 
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 5 )} 
wvSelectSignal -win $_nWave2 {( "G2" 4 )} 
wvSelectSignal -win $_nWave2 {( "G2" 5 )} 
wvSelectSignal -win $_nWave2 {( "G2" 6 )} 
wvSelectSignal -win $_nWave2 {( "G2" 5 )} 
wvSelectSignal -win $_nWave2 {( "G2" 2 5 )} 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 136.399982 207.960587
wvZoom -win $_nWave2 147.845439 171.981578
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 145.428251 171.324782
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 142.048567 169.028514
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G4" 6 )} 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
srcDeselectAll -win $_nTrace1
debReload
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 141.134585 173.658357
wvSelectSignal -win $_nWave2 {( "G2" 6 )} 
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
wvZoom -win $_nWave2 17021.547575 19257.682340
wvZoom -win $_nWave2 17613.489951 18010.049948
wvZoom -win $_nWave2 17689.542553 17818.303426
wvZoom -win $_nWave2 17711.566812 17771.680644
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
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvZoom -win $_nWave2 17718.532983 17742.369309
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 17662.286846 17738.958446
wvSelectSignal -win $_nWave2 {( "G2" 2 )} 
wvSelectSignal -win $_nWave2 {( "G2" 1 2 )} 
wvZoom -win $_nWave2 17718.264778 17729.165146
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvSetCursor -win $_nWave2 17718.888291 -snap {("G2" 1)}
wvZoom -win $_nWave2 17715.692033 17732.512742
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 17715.259216 17732.148428
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
srcDeselectAll -win $_nTrace1
debReload
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
wvZoom -win $_nWave2 19250.203628 20087.819326
wvZoom -win $_nWave2 19874.771572 20013.702276
wvZoomOut -win $_nWave2
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
wvZoom -win $_nWave2 47153.276564 49266.012588
wvZoom -win $_nWave2 48623.039981 48928.882182
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 42144.314067 43394.405848
wvZoom -win $_nWave2 42320.650597 42463.200863
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 40589.068608 41131.192389
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 24978.896705 31952.795261
wvZoom -win $_nWave2 28428.407431 28898.325808
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 28243.902270 28312.798115
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 25083.582774 25674.541285
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 23456.313642 23692.609530
wvSetCursor -win $_nWave2 23634.257306 -snap {("G1" 1)}
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
wvZoom -win $_nWave2 24183.752412 24253.040210
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvScrollDown -win $_nWave2 0
wvSelectSignal -win $_nWave2 {( "G2" 4 )} 
wvZoom -win $_nWave2 24170.425863 24295.508167
wvSelectSignal -win $_nWave2 {( "G2" 4 )} 
wvSetSearchMode -win $_nWave2 -value 80000c54
wvSearchPrev -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchPrev -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 23590.930337 23789.506020
wvZoom -win $_nWave2 23630.630770 23660.479614
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSelectSignal -win $_nWave2 {( "G2" 2 )} 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 24278.204809 24545.551433
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 24274.592017 24341.502908
wvZoom -win $_nWave2 24300.628058 24310.561885
wvSelectSignal -win $_nWave2 {( "G1" 4 )} 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 24293.038849 -snap {("G1" 4)}
srcHBSelect "tb_DandRiscvSimple" -win $_nTrace1
srcSetScope -win $_nTrace1 "tb_DandRiscvSimple" -delim "."
srcHBSelect "tb_DandRiscvSimple" -win $_nTrace1
srcDeselectAll -win $_nTrace1
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 3 )} 
wvSearchPrev -win $_nWave2
wvSearchNext -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 82.148081 172.769889
wvZoom -win $_nWave2 97.078368 127.106697
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 162.671055 186.773765
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 3 )} 
wvSearchPrev -win $_nWave2
wvSearchNext -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 22881.029755 27139.240564
wvZoom -win $_nWave2 24175.361882 24534.810999
wvZoom -win $_nWave2 24289.544533 24316.293616
wvSelectSignal -win $_nWave2 {( "G2" 2 )} 
wvSelectSignal -win $_nWave2 {( "G2" 2 3 )} 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
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
wvScrollDown -win $_nWave2 4
wvScrollDown -win $_nWave2 44
srcHBSelect "tb_DandRiscvSimple.u_DandRiscvSimple.dCache_1" -win $_nTrace1
srcSetScope -win $_nTrace1 "tb_DandRiscvSimple.u_DandRiscvSimple.dCache_1" -delim \
           "."
srcHBSelect "tb_DandRiscvSimple.u_DandRiscvSimple.dCache_1" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSearchString "hit" -win $_nTrace1 -next -case
srcSearchString "hit" -win $_nTrace1 -next -case
srcSearchString "hit" -win $_nTrace1 -next -case
srcSearchString "hit" -win $_nTrace1 -next -case
srcSearchString "hit" -win $_nTrace1 -next -case
srcDeselectAll -win $_nTrace1
srcSelect -signal "cache_hit_0" -line 6882 -pos 1 -win $_nTrace1
srcSelect -signal "cache_hit_1" -line 6883 -pos 1 -win $_nTrace1
srcSelect -toggle -signal "cache_hit_1" -line 6883 -pos 1 -win $_nTrace1
srcSelect -signal "cache_hit_1" -line 6883 -pos 1 -win $_nTrace1
srcSelect -signal "cache_hit_2" -line 6884 -pos 1 -win $_nTrace1
srcSelect -signal "cache_hit_3" -line 6885 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave2 {("G5" 2)}
wvSetPosition -win $_nWave2 {("G5" 1)}
wvSetPosition -win $_nWave2 {("G5" 0)}
wvSetPosition -win $_nWave2 {("G5" 1)}
wvSetPosition -win $_nWave2 {("G6" 21)}
wvSetPosition -win $_nWave2 {("G5" 1)}
wvSetPosition -win $_nWave2 {("G5" 2)}
wvSetPosition -win $_nWave2 {("G5" 3)}
wvSetPosition -win $_nWave2 {("G5" 4)}
wvSetPosition -win $_nWave2 {("G6" 0)}
wvAddSignal -win $_nWave2 \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/dCache_1/cache_hit_0" \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/dCache_1/cache_hit_1" \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/dCache_1/cache_hit_2" \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/dCache_1/cache_hit_3"
wvSetPosition -win $_nWave2 {("G6" 0)}
wvSetPosition -win $_nWave2 {("G6" 4)}
wvSetPosition -win $_nWave2 {("G6" 0)}
wvSetPosition -win $_nWave2 {("G6" 4)}
wvSetPosition -win $_nWave2 {("G6" 4)}
wvSetPosition -win $_nWave2 {("G6" 4)}
wvSetPosition -win $_nWave2 {("G6" 4)}
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
wvSetCursor -win $_nWave2 1402.258423 -snap {("G6" 3)}
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
srcDeselectAll -win $_nTrace1
srcSelect -signal "cache_hit_0" -line 6882 -pos 1 -win $_nTrace1
srcAction -pos 6881 3 6 -win $_nTrace1 -name "cache_hit_0" -ctrlKey off
srcBackwardHistory -win $_nTrace1
srcHBSelect "tb_DandRiscvSimple.u_DandRiscvSimple.dCache_1" -win $_nTrace1
srcSearchString "miss" -win $_nTrace1 -next -case
srcDeselectAll -win $_nTrace1
srcSelect -signal "is_miss" -line 6911 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvSetCursor -win $_nWave2 560.903369 -snap {("G6" 5)}
wvSetCursor -win $_nWave2 542.206590 -snap {("G6" 5)}
wvSetCursor -win $_nWave2 635.690485 -snap {("G6" 5)}
wvSelectSignal -win $_nWave2 {( "G6" 1 )} 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
srcHBSelect "tb_DandRiscvSimple.u_DandRiscvSimple.iCache_1" -win $_nTrace1
srcSetScope -win $_nTrace1 "tb_DandRiscvSimple.u_DandRiscvSimple.iCache_1" -delim \
           "."
srcHBSelect "tb_DandRiscvSimple.u_DandRiscvSimple.iCache_1" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSearchString "miss" -win $_nTrace1 -next -case
srcDeselectAll -win $_nTrace1
srcSelect -signal "cache_hit_0" -line 28494 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "cache_hit_1" -line 28495 -pos 1 -win $_nTrace1
srcSelect -signal "cache_hit_2" -line 28496 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "cache_hit_0" -line 28494 -pos 1 -win $_nTrace1
srcSelect -signal "cache_hit_1" -line 28495 -pos 1 -win $_nTrace1
srcSelect -signal "cache_hit_2" -line 28496 -pos 1 -win $_nTrace1
srcSelect -signal "cache_hit_3" -line 28497 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave2 {("G5" 2)}
wvSetPosition -win $_nWave2 {("G5" 3)}
wvSetPosition -win $_nWave2 {("G5" 4)}
wvSetPosition -win $_nWave2 {("G5" 3)}
wvSetPosition -win $_nWave2 {("G5" 2)}
wvSetPosition -win $_nWave2 {("G5" 1)}
wvSetPosition -win $_nWave2 {("G5" 0)}
wvSetPosition -win $_nWave2 {("G4" 20)}
wvSetPosition -win $_nWave2 {("G4" 19)}
wvSetPosition -win $_nWave2 {("G4" 18)}
wvSetPosition -win $_nWave2 {("G4" 17)}
wvSetPosition -win $_nWave2 {("G4" 16)}
wvSetPosition -win $_nWave2 {("G4" 15)}
wvSetPosition -win $_nWave2 {("G4" 14)}
wvSetPosition -win $_nWave2 {("G4" 13)}
wvSetPosition -win $_nWave2 {("G4" 12)}
wvSetPosition -win $_nWave2 {("G4" 11)}
wvSetPosition -win $_nWave2 {("G4" 10)}
wvSetPosition -win $_nWave2 {("G4" 9)}
wvSetPosition -win $_nWave2 {("G4" 8)}
wvSetPosition -win $_nWave2 {("G4" 7)}
wvSetPosition -win $_nWave2 {("G4" 6)}
wvSetPosition -win $_nWave2 {("G4" 5)}
wvSetPosition -win $_nWave2 {("G4" 4)}
wvSetPosition -win $_nWave2 {("G4" 3)}
wvSetPosition -win $_nWave2 {("G4" 2)}
wvSetPosition -win $_nWave2 {("G4" 1)}
wvSetPosition -win $_nWave2 {("G4" 0)}
wvSetPosition -win $_nWave2 {("G3" 7)}
wvSetPosition -win $_nWave2 {("G3" 6)}
wvSetPosition -win $_nWave2 {("G3" 5)}
wvSetPosition -win $_nWave2 {("G3" 4)}
wvSetPosition -win $_nWave2 {("G3" 3)}
wvSetPosition -win $_nWave2 {("G3" 2)}
wvSetPosition -win $_nWave2 {("G3" 1)}
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSetPosition -win $_nWave2 {("G2" 7)}
wvSetPosition -win $_nWave2 {("G2" 6)}
wvSetPosition -win $_nWave2 {("G2" 5)}
wvSetPosition -win $_nWave2 {("G2" 4)}
wvSetPosition -win $_nWave2 {("G2" 3)}
wvSetPosition -win $_nWave2 {("G2" 2)}
wvSetPosition -win $_nWave2 {("G2" 1)}
wvSetPosition -win $_nWave2 {("G2" 2)}
wvSetPosition -win $_nWave2 {("G2" 1)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G1" 7)}
wvSetPosition -win $_nWave2 {("G1" 6)}
wvSetPosition -win $_nWave2 {("G1" 5)}
wvSetPosition -win $_nWave2 {("G1" 4)}
wvSetPosition -win $_nWave2 {("G1" 3)}
wvSetPosition -win $_nWave2 {("G1" 2)}
wvSetPosition -win $_nWave2 {("G1" 1)}
wvSetPosition -win $_nWave2 {("G1" 0)}
wvSetPosition -win $_nWave2 {("G1" 1)}
wvSetPosition -win $_nWave2 {("G1" 2)}
wvSetPosition -win $_nWave2 {("G1" 3)}
wvSetPosition -win $_nWave2 {("G1" 4)}
wvSetPosition -win $_nWave2 {("G1" 5)}
wvSetPosition -win $_nWave2 {("G1" 4)}
wvSetPosition -win $_nWave2 {("G1" 3)}
wvSetPosition -win $_nWave2 {("G1" 2)}
wvSetPosition -win $_nWave2 {("G1" 1)}
wvSetPosition -win $_nWave2 {("G1" 0)}
wvSetPosition -win $_nWave2 {("G1" 1)}
wvSetPosition -win $_nWave2 {("G1" 2)}
wvSetPosition -win $_nWave2 {("G1" 3)}
wvSetPosition -win $_nWave2 {("G1" 4)}
wvSetPosition -win $_nWave2 {("G1" 5)}
wvSetPosition -win $_nWave2 {("G1" 6)}
wvSetPosition -win $_nWave2 {("G1" 7)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G2" 1)}
wvSetPosition -win $_nWave2 {("G2" 2)}
wvSetPosition -win $_nWave2 {("G2" 3)}
wvSetPosition -win $_nWave2 {("G2" 2)}
wvSetPosition -win $_nWave2 {("G2" 3)}
wvSetPosition -win $_nWave2 {("G2" 4)}
wvSetPosition -win $_nWave2 {("G2" 5)}
wvSetPosition -win $_nWave2 {("G2" 6)}
wvSetPosition -win $_nWave2 {("G2" 7)}
wvAddSignal -win $_nWave2 \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/iCache_1/cache_hit_0" \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/iCache_1/cache_hit_1" \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/iCache_1/cache_hit_2" \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/iCache_1/cache_hit_3"
wvSetPosition -win $_nWave2 {("G2" 7)}
wvSetPosition -win $_nWave2 {("G2" 11)}
wvSetPosition -win $_nWave2 {("G2" 7)}
wvSetPosition -win $_nWave2 {("G2" 11)}
wvSetPosition -win $_nWave2 {("G2" 11)}
wvSetPosition -win $_nWave2 {("G2" 11)}
wvSetPosition -win $_nWave2 {("G2" 11)}
wvSetCursor -win $_nWave2 635.690485 -snap {("G2" 11)}
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 1794.890781 -snap {("G2" 11)}
wvZoom -win $_nWave2 0.000000 299.148464
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
srcDeselectAll -win $_nTrace1
srcSelect -signal "cache_hit_0" -line 28494 -pos 1 -win $_nTrace1
srcAction -pos 28493 3 7 -win $_nTrace1 -name "cache_hit_0" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSearchString "victim" -win $_nTrace1 -next -case
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 23.036979 230.369791
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 3 )} 
wvSelectAll -win $_nWave2
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSelectGroup -win $_nWave2 {G7}
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSelectGroup -win $_nWave2 {G3}
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSelectGroup -win $_nWave2 {G2}
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 0)}
wvSetPosition -win $_nWave2 {("G1" 0)}
wvSetPosition -win $_nWave2 {("G1" 0)}
wvSetPosition -win $_nWave2 {("G1" 0)}
wvSelectGroup -win $_nWave2 {G1}
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "cache_victim_0" -line 33752 -pos 1 -win $_nTrace1
srcSearchString "cache_victim_0" -win $_nTrace1 -prev -case
srcSelect -win $_nTrace1 -range {33409 33409 22 23 1 1}
srcSearchString "cache_victim_0" -win $_nTrace1 -prev -case
srcSelect -win $_nTrace1 -range {28502 28502 4 5 1 1}
srcDeselectAll -win $_nTrace1
srcSelect -signal "cache_victim_0" -line 28502 -pos 1 -win $_nTrace1
srcSelect -signal "cache_victim_1" -line 28503 -pos 1 -win $_nTrace1
srcSelect -signal "cache_victim_2" -line 28504 -pos 1 -win $_nTrace1
srcSelect -signal "cache_victim_3" -line 28505 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
srcDeselectAll -win $_nTrace1
srcSelect -signal "evict_id" -line 28516 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 0.000000 1682.710107
srcDeselectAll -win $_nTrace1
srcSelect -signal "evict_id" -line 28516 -pos 1 -win $_nTrace1
srcAction -pos 28515 9 3 -win $_nTrace1 -name "evict_id" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "is_diff" -line 33488 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
srcDeselectAll -win $_nTrace1
srcSelect -signal "invld_id" -line 33488 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
srcDeselectAll -win $_nTrace1
srcSelect -signal "victim_id" -line 33488 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
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
wvZoom -win $_nWave2 0.000000 2393.187708
srcDeselectAll -win $_nTrace1
srcSelect -signal "invld_id" -line 33488 -pos 1 -win $_nTrace1
srcAction -pos 33487 12 4 -win $_nTrace1 -name "invld_id" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "_zz_invld_id_1" -line 33484 -pos 1 -win $_nTrace1
srcAction -pos 33483 8 5 -win $_nTrace1 -name "_zz_invld_id_1" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "cache_invld_d1_1" -line 33482 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "cache_invld_d1_1" -line 33482 -pos 1 -win $_nTrace1
srcAction -pos 33481 8 8 -win $_nTrace1 -name "cache_invld_d1_1" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "cache_invld_d1_1" -line 34236 -pos 1 -win $_nTrace1
srcSearchString "cache_invld_d1_1" -win $_nTrace1 -prev -case
srcSelect -win $_nTrace1 -range {33482 33482 9 10 1 1}
srcSearchString "cache_invld_d1_1" -win $_nTrace1 -prev -case
srcSelect -win $_nTrace1 -range {33286 33286 2 3 5 1}
srcSearchString "cache_invld_d1_1" -win $_nTrace1 -prev -case
srcSelect -win $_nTrace1 -range {33276 33276 2 3 5 1}
srcSearchString "cache_invld_d1_1" -win $_nTrace1 -prev -case
srcSelect -win $_nTrace1 -range {33266 33266 2 3 5 1}
srcSearchString "cache_invld_d1_1" -win $_nTrace1 -prev -case
srcSelect -win $_nTrace1 -range {33256 33256 2 3 5 1}
srcSearchString "cache_invld_d1_1" -win $_nTrace1 -prev -case
srcSelect -win $_nTrace1 -range {33246 33246 2 3 5 1}
srcSearchString "cache_invld_d1_1" -win $_nTrace1 -prev -case
srcSelect -win $_nTrace1 -range {33236 33236 2 3 5 1}
srcSearchString "cache_invld_d1_1" -win $_nTrace1 -prev -case
srcSelect -win $_nTrace1 -range {33226 33226 2 3 5 1}
srcSearchString "cache_invld_d1_1" -win $_nTrace1 -prev -case
srcSelect -win $_nTrace1 -range {33216 33216 2 3 5 1}
srcSearchString "cache_invld_d1_1" -win $_nTrace1 -prev -case
srcSelect -win $_nTrace1 -range {33206 33206 2 3 5 1}
srcSearchString "cache_invld_d1_1" -win $_nTrace1 -prev -case
srcSelect -win $_nTrace1 -range {33196 33196 2 3 5 1}
srcSearchString "cache_invld_d1_1" -win $_nTrace1 -prev -case
srcSelect -win $_nTrace1 -range {33186 33186 2 3 5 1}
srcSearchString "cache_invld_d1_1" -win $_nTrace1 -prev -case
srcSelect -win $_nTrace1 -range {33176 33176 2 3 5 1}
srcSearchString "cache_invld_d1_1" -win $_nTrace1 -prev -case
srcSelect -win $_nTrace1 -range {33166 33166 2 3 5 1}
srcSearchString "cache_invld_d1_1" -win $_nTrace1 -prev -case
srcSelect -win $_nTrace1 -range {33156 33156 2 3 5 1}
srcSearchString "cache_invld_d1_1" -win $_nTrace1 -prev -case
srcSelect -win $_nTrace1 -range {33146 33146 2 3 5 1}
srcSearchString "cache_invld_d1_1" -win $_nTrace1 -prev -case
srcSelect -win $_nTrace1 -range {33136 33136 2 3 5 1}
srcSearchString "cache_invld_d1_1" -win $_nTrace1 -prev -case
srcSelect -win $_nTrace1 -range {33126 33126 2 3 5 1}
srcSearchString "cache_invld_d1_1" -win $_nTrace1 -prev -case
srcSelect -win $_nTrace1 -range {33116 33116 2 3 5 1}
srcSearchString "cache_invld_d1_1" -win $_nTrace1 -prev -case
srcSelect -win $_nTrace1 -range {33106 33106 2 3 5 1}
srcSearchString "cache_invld_d1_1" -win $_nTrace1 -prev -case
srcSelect -win $_nTrace1 -range {33096 33096 2 3 5 1}
srcSearchString "cache_invld_d1_1" -win $_nTrace1 -prev -case
srcSelect -win $_nTrace1 -range {33086 33086 2 3 5 1}
srcSearchString "cache_invld_d1_1" -win $_nTrace1 -prev -case
srcSelect -win $_nTrace1 -range {33076 33076 2 3 5 1}
srcHBSelect "tb_DandRiscvSimple.u_DandRiscvSimple.iCache_1" -win $_nTrace1
srcSetScope -win $_nTrace1 "tb_DandRiscvSimple.u_DandRiscvSimple.iCache_1" -delim \
           "."
srcHBSelect "tb_DandRiscvSimple.u_DandRiscvSimple.iCache_1" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSearchString "cache_invld_d1_1" -win $_nTrace1 -next -case
srcSearchString "cache_invld_d1_1" -win $_nTrace1 -next -case
srcDeselectAll -win $_nTrace1
srcSelect -signal "cache_invld_d1_0" -line 28498 -pos 1 -win $_nTrace1
srcSelect -signal "cache_invld_d1_1" -line 28499 -pos 1 -win $_nTrace1
srcSelect -signal "cache_invld_d1_2" -line 28500 -pos 1 -win $_nTrace1
srcSelect -signal "cache_invld_d1_3" -line 28501 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 5 )} 
wvSetPosition -win $_nWave2 {("G1" 5)}
wvSetPosition -win $_nWave2 {("G1" 4)}
wvSetPosition -win $_nWave2 {("G1" 3)}
wvSetPosition -win $_nWave2 {("G1" 2)}
wvSetPosition -win $_nWave2 {("G1" 1)}
wvSetPosition -win $_nWave2 {("G1" 0)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 0)}
wvSetPosition -win $_nWave2 {("G1" 1)}
wvSetPosition -win $_nWave2 {("G1" 1)}
wvSetPosition -win $_nWave2 {("G1" 1)}
wvSetPosition -win $_nWave2 {("G1" 1)}
wvSelectSignal -win $_nWave2 {( "G1" 6 )} 
wvSelectSignal -win $_nWave2 {( "G1" 7 )} 
wvSelectSignal -win $_nWave2 {( "G1" 6 )} 
wvSelectSignal -win $_nWave2 {( "G1" 8 )} 
wvSelectSignal -win $_nWave2 {( "G1" 9 )} 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 0.000000 715.918426
wvZoomOut -win $_nWave2
srcDeselectAll -win $_nTrace1
srcSelect -signal "cache_victim_3" -line 28505 -pos 1 -win $_nTrace1
srcAction -pos 28504 3 7 -win $_nTrace1 -name "cache_victim_3" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "cache_invld_d1_3" -line 35210 -pos 1 -win $_nTrace1
srcAction -pos 35209 8 12 -win $_nTrace1 -name "cache_invld_d1_3" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "_zz_cache_invld_d1_3" -line 35208 -pos 1 -win $_nTrace1
srcHBSelect "tb_DandRiscvSimple.u_DandRiscvSimple.iCache_1" -win $_nTrace1
srcSetScope -win $_nTrace1 "tb_DandRiscvSimple.u_DandRiscvSimple.iCache_1" -delim \
           "."
srcHBSelect "tb_DandRiscvSimple.u_DandRiscvSimple.iCache_1" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "cpu_cmd_valid" -line 26780 -pos 1 -win $_nTrace1
srcSelect -signal "cpu_cmd_ready" -line 26781 -pos 1 -win $_nTrace1
srcSelect -signal "cpu_cmd_payload_addr" -line 26782 -pos 1 -win $_nTrace1
srcSelect -signal "cpu_rsp_valid" -line 26783 -pos 1 -win $_nTrace1
srcSelect -signal "cpu_rsp_payload_data" -line 26784 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave2 {("G1" 0)}
wvAddSignal -win $_nWave2 \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/iCache_1/cpu_cmd_valid" \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/iCache_1/cpu_cmd_ready" \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/iCache_1/cpu_cmd_payload_addr\[63:0\]" \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/iCache_1/cpu_rsp_valid" \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/iCache_1/cpu_rsp_payload_data\[31:0\]"
wvSetPosition -win $_nWave2 {("G1" 0)}
wvSetPosition -win $_nWave2 {("G1" 5)}
wvSetPosition -win $_nWave2 {("G1" 0)}
wvSetPosition -win $_nWave2 {("G1" 5)}
wvSetPosition -win $_nWave2 {("G1" 5)}
wvSetPosition -win $_nWave2 {("G1" 5)}
wvSetPosition -win $_nWave2 {("G1" 5)}
srcDeselectAll -win $_nTrace1
srcSearchString "is_hit" -win $_nTrace1 -next -case
srcDeselectAll -win $_nTrace1
srcSelect -signal "is_hit" -line 28522 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
srcSearchString "is_miss" -win $_nTrace1 -next -case
srcDeselectAll -win $_nTrace1
srcSelect -signal "is_miss" -line 28525 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 73.155678 -snap {("G1" 6)}
wvSetCursor -win $_nWave2 203.563625 -snap {("G1" 6)}
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
srcDeselectAll -win $_nTrace1
debReload
wvZoom -win $_nWave2 0.000000 282.020439
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 6 )} 
wvSelectSignal -win $_nWave2 {( "G1" 7 )} 
wvSelectSignal -win $_nWave2 {( "G1" 6 )} 
wvSelectSignal -win $_nWave2 {( "G1" 7 )} 
wvSelectSignal -win $_nWave2 {( "G1" 8 )} 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 1979.676978 -snap {("G1" 7)}
wvZoom -win $_nWave2 1929.558574 2312.129062
wvZoom -win $_nWave2 1982.532051 2094.852820
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 1591.536641 4431.285129
wvZoom -win $_nWave2 1889.074154 2728.066858
wvZoom -win $_nWave2 2045.006896 2241.320628
wvZoom -win $_nWave2 2071.681143 2111.220080
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
wvSelectSignal -win $_nWave2 {( "G1" 7 )} 
wvZoom -win $_nWave2 11347.396906 17748.108238
wvZoom -win $_nWave2 13112.865230 14319.071105
wvZoom -win $_nWave2 13267.381051 13462.535426
wvZoom -win $_nWave2 13292.524969 13327.278488
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
wvZoom -win $_nWave2 0.000000 5029.433543
srcDeselectAll -win $_nTrace1
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
wvZoom -win $_nWave2 0.000000 5085.523880
wvZoom -win $_nWave2 0.000000 992.251420
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 0.000000 328.423832
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 7 )} 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 1826.819566 2439.650410
wvZoom -win $_nWave2 1971.575611 2159.667714
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 8 )} 
wvZoom -win $_nWave2 0.000000 2406.687553
wvZoom -win $_nWave2 0.000000 348.394977
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 9 )} 
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 19 )} 
wvSelectSignal -win $_nWave2 {( "G1" 12 )} 
wvSetCursor -win $_nWave2 98.030427 -snap {("G1" 12)}
srcActiveTrace "tb_DandRiscvSimple.u_DandRiscvSimple.iCache_1.cache_victim_3" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 89000 -TraceValue 0
srcDeselectAll -win $_nTrace1
srcSelect -signal "cache_lru_d1_3" -line 27894 -pos 1 -win $_nTrace1
srcAction -pos 27893 12 5 -win $_nTrace1 -name "cache_lru_d1_3" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "cache_lru_d1_3" -line 27893 -pos 1 -win $_nTrace1
srcSearchString "cache_lru_d1_3" -win $_nTrace1 -prev -case
srcSelect -win $_nTrace1 -range {27339 27339 2 3 5 1}
srcSearchString "cache_lru_d1_3" -win $_nTrace1 -prev -case
srcSelect -win $_nTrace1 -range {27329 27329 2 3 5 1}
srcSearchString "cache_lru_d1_3" -win $_nTrace1 -prev -case
srcSelect -win $_nTrace1 -range {27319 27319 2 3 5 1}
srcSearchString "cache_lru_d1_3" -win $_nTrace1 -prev -case
srcSelect -win $_nTrace1 -range {27309 27309 2 3 5 1}
srcSearchString "cache_lru_d1_3" -win $_nTrace1 -prev -case
srcSelect -win $_nTrace1 -range {27025 27025 4 5 1 1}
srcHBSelect "tb_DandRiscvSimple.u_DandRiscvSimple.iCache_1" -win $_nTrace1
srcHBSelect "tb_DandRiscvSimple.u_DandRiscvSimple.iCache_1" -win $_nTrace1
srcSetScope -win $_nTrace1 "tb_DandRiscvSimple.u_DandRiscvSimple.iCache_1" -delim \
           "."
srcHBSelect "tb_DandRiscvSimple.u_DandRiscvSimple.iCache_1" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSearchString "cache_lru_d1_3" -win $_nTrace1 -next -case
srcSearchString "cache_lru_d1_3" -win $_nTrace1 -next -case
srcDeselectAll -win $_nTrace1
srcSelect -signal "cache_lru_d1_0" -line 27022 -pos 1 -win $_nTrace1
srcSelect -signal "cache_lru_d1_1" -line 27023 -pos 1 -win $_nTrace1
srcSelect -signal "cache_lru_d1_2" -line 27024 -pos 1 -win $_nTrace1
srcSelect -signal "cache_lru_d1_3" -line 27025 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 8)}
wvSetPosition -win $_nWave2 {("G1" 10)}
wvSetPosition -win $_nWave2 {("G1" 14)}
wvSetPosition -win $_nWave2 {("G1" 16)}
wvSetPosition -win $_nWave2 {("G1" 17)}
wvSetPosition -win $_nWave2 {("G1" 18)}
wvSetPosition -win $_nWave2 {("G1" 19)}
wvSetPosition -win $_nWave2 {("G1" 20)}
wvSetPosition -win $_nWave2 {("G1" 21)}
wvSetPosition -win $_nWave2 {("G1" 22)}
wvSetPosition -win $_nWave2 {("G1" 23)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 23)}
wvSetPosition -win $_nWave2 {("G1" 23)}
wvSetPosition -win $_nWave2 {("G1" 23)}
wvSetPosition -win $_nWave2 {("G1" 23)}
wvSelectSignal -win $_nWave2 {( "G1" 23 )} 
wvSelectSignal -win $_nWave2 {( "G1" 23 )} 
wvSelectSignal -win $_nWave2 {( "G1" 23 )} 
wvSetCursor -win $_nWave2 463.322754 -snap {("G1" 23)}
wvSelectSignal -win $_nWave2 {( "G1" 16 )} 
wvSelectSignal -win $_nWave2 {( "G1" 16 17 )} 
wvSelectSignal -win $_nWave2 {( "G1" 16 17 18 )} 
wvSelectSignal -win $_nWave2 {( "G1" 16 17 18 19 )} 
wvSelectSignal -win $_nWave2 {( "G1" 13 16 17 18 19 )} 
wvSelectSignal -win $_nWave2 {( "G1" 15 )} 
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
wvZoom -win $_nWave2 0.000000 2542.761940
wvSelectSignal -win $_nWave2 {( "G1" 8 )} 
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
wvZoom -win $_nWave2 0.000000 2598.852277
wvSelectSignal -win $_nWave2 {( "G1" 9 )} 
wvSelectSignal -win $_nWave2 {( "G1" 10 )} 
wvSelectSignal -win $_nWave2 {( "G1" 9 )} 
wvSelectSignal -win $_nWave2 {( "G1" 10 )} 
wvSelectSignal -win $_nWave2 {( "G1" 11 )} 
wvSelectSignal -win $_nWave2 {( "G1" 10 )} 
wvSelectSignal -win $_nWave2 {( "G1" 9 )} 
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 92.369426 -snap {("G1" 9)}
srcActiveTrace "tb_DandRiscvSimple.u_DandRiscvSimple.iCache_1.cache_victim_0" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 0 -TraceValue 1
srcDeselectAll -win $_nTrace1
srcSelect -signal "cache_invld_d1_0" -line 27618 -pos 1 -win $_nTrace1
srcAction -pos 27617 8 11 -win $_nTrace1 -name "cache_invld_d1_0" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "_zz_cache_invld_d1_0" -line 27616 -pos 1 -win $_nTrace1
srcAction -pos 27615 10 10 -win $_nTrace1 -name "_zz_cache_invld_d1_0" -ctrlKey \
          off
srcDeselectAll -win $_nTrace1
srcBackwardHistory -win $_nTrace1
srcHBSelect "tb_DandRiscvSimple.u_DandRiscvSimple.iCache_1" -win $_nTrace1
srcHBSelect "tb_DandRiscvSimple.u_DandRiscvSimple.iCache_1" -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G1" 15 )} 
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
wvZoom -win $_nWave2 0.000000 2486.671603
wvSelectSignal -win $_nWave2 {( "G1" 15 )} 
wvSelectSignal -win $_nWave2 {( "G1" 16 )} 
wvSelectSignal -win $_nWave2 {( "G1" 20 )} 
wvSelectSignal -win $_nWave2 {( "G1" 9 )} 
wvSetCursor -win $_nWave2 112.319117 -snap {("G1" 9)}
srcActiveTrace "tb_DandRiscvSimple.u_DandRiscvSimple.iCache_1.cache_victim_0" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 89000 -TraceValue 0
srcDeselectAll -win $_nTrace1
srcSelect -signal "cache_invld_d1_0" -line 27618 -pos 1 -win $_nTrace1
srcAction -pos 27617 8 12 -win $_nTrace1 -name "cache_invld_d1_0" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "_zz_cache_invld_d1_0" -line 27616 -pos 1 -win $_nTrace1
srcAction -pos 27615 10 7 -win $_nTrace1 -name "_zz_cache_invld_d1_0" -ctrlKey \
          off
srcDeselectAll -win $_nTrace1
srcSelect -signal "ways_0_metas_0_vld" -line 27344 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcBackwardHistory -win $_nTrace1
srcHBSelect "tb_DandRiscvSimple.u_DandRiscvSimple.iCache_1" -win $_nTrace1
srcHBSelect "tb_DandRiscvSimple.u_DandRiscvSimple.iCache_1" -win $_nTrace1
srcBackwardHistory -win $_nTrace1
srcHBSelect "tb_DandRiscvSimple.u_DandRiscvSimple.iCache_1" -win $_nTrace1
srcHBSelect "tb_DandRiscvSimple.u_DandRiscvSimple.iCache_1" -win $_nTrace1
srcBackwardHistory -win $_nTrace1
srcHBSelect "tb_DandRiscvSimple.u_DandRiscvSimple.iCache_1" -win $_nTrace1
srcDeselectAll -win $_nTrace1
debReload
wvSelectSignal -win $_nWave2 {( "G1" 14 )} 
wvSelectSignal -win $_nWave2 {( "G1" 13 )} 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 0.000000 1402.258423
wvSetCursor -win $_nWave2 92.410959 -snap {("G1" 9)}
srcActiveTrace "tb_DandRiscvSimple.u_DandRiscvSimple.iCache_1.cache_victim_0" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 89000 -TraceValue 0
wvSelectSignal -win $_nWave2 {( "G1" 9 )} 
wvSelectSignal -win $_nWave2 {( "G1" 8 )} 
wvSetCursor -win $_nWave2 71.125288 -snap {("G1" 8)}
srcActiveTrace "tb_DandRiscvSimple.u_DandRiscvSimple.iCache_1.evict_id\[1:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 0 -TraceValue 00
srcDeselectAll -win $_nTrace1
srcSelect -signal "invld_id" -line 27602 -pos 1 -win $_nTrace1
srcAction -pos 27601 12 2 -win $_nTrace1 -name "invld_id" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "_zz_invld_id_1" -line 27598 -pos 1 -win $_nTrace1
srcAction -pos 27597 8 8 -win $_nTrace1 -name "_zz_invld_id_1" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "cache_invld_gnt_1" -line 27596 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "cache_invld_gnt_1" -line 27596 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "cache_invld_gnt_1" -line 27596 -pos 1 -win $_nTrace1
srcAction -pos 27595 8 12 -win $_nTrace1 -name "cache_invld_gnt_1" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "cache_invld_gnt_0" -line 27581 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "cache_invld_gnt_1" -line 27582 -pos 1 -win $_nTrace1
srcSelect -signal "cache_invld_gnt_2" -line 27583 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "cache_invld_gnt_0" -line 27581 -pos 1 -win $_nTrace1
srcSelect -signal "cache_invld_gnt_1" -line 27582 -pos 1 -win $_nTrace1
srcSelect -signal "cache_invld_gnt_2" -line 27583 -pos 1 -win $_nTrace1
srcSelect -signal "cache_invld_gnt_3" -line 27584 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
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
wvZoom -win $_nWave2 0.000000 1346.168086
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
wvZoom -win $_nWave2 0.000000 1439.651981
wvSelectSignal -win $_nWave2 {( "G1" 24 )} 
wvSelectSignal -win $_nWave2 {( "G1" 25 )} 
wvSelectSignal -win $_nWave2 {( "G1" 24 )} 
wvSelectSignal -win $_nWave2 {( "G1" 24 25 )} 
wvSelectSignal -win $_nWave2 {( "G1" 26 )} 
wvSelectSignal -win $_nWave2 {( "G1" 16 )} 
wvSelectSignal -win $_nWave2 {( "G1" 16 17 )} 
wvSelectSignal -win $_nWave2 {( "G1" 16 17 18 )} 
wvSelectSignal -win $_nWave2 {( "G1" 16 17 )} 
wvSelectSignal -win $_nWave2 {( "G1" 16 17 18 )} 
wvSelectSignal -win $_nWave2 {( "G1" 16 17 18 19 )} 
wvSetPosition -win $_nWave2 {("G1" 16)}
wvSetPosition -win $_nWave2 {("G1" 17)}
wvSetPosition -win $_nWave2 {("G1" 18)}
wvSetPosition -win $_nWave2 {("G1" 19)}
wvSetPosition -win $_nWave2 {("G1" 20)}
wvSetPosition -win $_nWave2 {("G1" 21)}
wvSetPosition -win $_nWave2 {("G1" 22)}
wvSetPosition -win $_nWave2 {("G1" 23)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 23)}
wvSetPosition -win $_nWave2 {("G1" 23)}
wvSetPosition -win $_nWave2 {("G1" 23)}
wvSetPosition -win $_nWave2 {("G1" 23)}
wvSelectSignal -win $_nWave2 {( "G1" 25 )} 
wvSelectSignal -win $_nWave2 {( "G1" 24 )} 
wvSelectSignal -win $_nWave2 {( "G1" 1 )} 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 0.000000 3271.936320
wvZoom -win $_nWave2 0.000000 415.503205
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 6 )} 
wvSelectSignal -win $_nWave2 {( "G1" 7 )} 
wvSelectSignal -win $_nWave2 {( "G1" 6 )} 
wvSelectSignal -win $_nWave2 {( "G1" 7 )} 
wvSelectSignal -win $_nWave2 {( "G1" 6 )} 
wvSelectSignal -win $_nWave2 {( "G1" 8 )} 
wvZoom -win $_nWave2 0.000000 331.048833
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 52.457942 -snap {("G1" 7)}
wvSelectSignal -win $_nWave2 {( "G1" 6 )} 
wvSelectSignal -win $_nWave2 {( "G1" 7 )} 
wvSelectSignal -win $_nWave2 {( "G1" 24 )} 
wvSelectSignal -win $_nWave2 {( "G1" 25 )} 
wvSelectSignal -win $_nWave2 {( "G1" 14 )} 
wvSelectSignal -win $_nWave2 {( "G1" 8 )} 
wvSetCursor -win $_nWave2 88.737266 -snap {("G1" 8)}
wvZoom -win $_nWave2 37.750108 344.653580
wvSelectSignal -win $_nWave2 {( "G1" 4 )} 
wvSetCursor -win $_nWave2 53.316852 -snap {("G1" 2)}
wvZoom -win $_nWave2 45.590293 115.583828
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 35.657573 169.891750
wvZoom -win $_nWave2 82.174859 107.222629
wvSelectSignal -win $_nWave2 {( "G1" 4 5 )} 
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
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 59.350509 217.519615
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 65.820835 178.255002
wvZoom -win $_nWave2 83.845268 104.700328
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 0.000000 216.441705
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 14 )} 
wvSetCursor -win $_nWave2 93.596413 -snap {("G1" 14)}
wvZoom -win $_nWave2 26.924996 266.044599
wvSelectSignal -win $_nWave2 {( "G1" 8 )} 
wvSelectSignal -win $_nWave2 {( "G1" 2 8 )} 
wvSelectSignal -win $_nWave2 {( "G1" 2 4 8 )} 
srcHBSelect "tb_DandRiscvSimple.u_DandRiscvSimple.iCache_1" -win $_nTrace1
srcSetScope -win $_nTrace1 "tb_DandRiscvSimple.u_DandRiscvSimple.iCache_1" -delim \
           "."
srcHBSelect "tb_DandRiscvSimple.u_DandRiscvSimple.iCache_1" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSearchString "hit_id" -win $_nTrace1 -next -case
wvSetPosition -win $_nWave2 {("G1" 0)}
wvSetPosition -win $_nWave2 {("G1" 27)}
wvSetPosition -win $_nWave2 {("G1" 12)}
wvSetPosition -win $_nWave2 {("G1" 13)}
wvSetPosition -win $_nWave2 {("G1" 14)}
wvSetPosition -win $_nWave2 {("G1" 13)}
wvSetPosition -win $_nWave2 {("G1" 27)}
wvSetPosition -win $_nWave2 {("G1" 13)}
wvSetPosition -win $_nWave2 {("G1" 14)}
wvSetPosition -win $_nWave2 {("G1" 15)}
wvAddSignal -win $_nWave2 \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/iCache_1/hit_id\[1:0\]"
wvSetPosition -win $_nWave2 {("G1" 15)}
wvSetPosition -win $_nWave2 {("G1" 16)}
wvSetPosition -win $_nWave2 {("G1" 15)}
wvSetPosition -win $_nWave2 {("G1" 16)}
wvSetPosition -win $_nWave2 {("G1" 16)}
wvSetPosition -win $_nWave2 {("G1" 16)}
wvSetPosition -win $_nWave2 {("G1" 16)}
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 62.679259 168.738232
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 0.000000 258.845149
wvSelectSignal -win $_nWave2 {( "G1" 4 )} 
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 49.449869 -snap {("G1" 1)}
srcActiveTrace "tb_DandRiscvSimple.u_DandRiscvSimple.iCache_1.cpu_cmd_valid" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 0 -TraceValue 0
srcDeselectAll -win $_nTrace1
srcSelect -signal "fetch_valid" -line 1632 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "fetch_valid" -line 1632 -pos 1 -win $_nTrace1
srcAction -pos 1631 8 5 -win $_nTrace1 -name "fetch_valid" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "when_FetchPlugin_l108" -line 3274 -pos 1 -win $_nTrace1
srcAction -pos 3273 3 16 -win $_nTrace1 -name "when_FetchPlugin_l108" -ctrlKey \
          off
srcDeselectAll -win $_nTrace1
srcSelect -signal "fetch_state_next" -line 1606 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave2 {("G1" 0)}
wvSetPosition -win $_nWave2 {("G1" 1)}
wvSetPosition -win $_nWave2 {("G1" 0)}
wvAddSignal -win $_nWave2 \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/fetch_state_next\[1:0\]"
wvSetPosition -win $_nWave2 {("G1" 0)}
wvSetPosition -win $_nWave2 {("G1" 1)}
wvSetPosition -win $_nWave2 {("G1" 0)}
wvSetPosition -win $_nWave2 {("G1" 1)}
wvSetPosition -win $_nWave2 {("G1" 1)}
wvSetPosition -win $_nWave2 {("G1" 1)}
wvSetPosition -win $_nWave2 {("G1" 1)}
wvSetCursor -win $_nWave2 122.666342 -snap {("G1" 1)}
srcActiveTrace "tb_DandRiscvSimple.u_DandRiscvSimple.fetch_state_next\[1:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 89000 -TraceValue 01
srcDeselectAll -win $_nTrace1
srcSelect -signal "when_FetchPlugin_l71" -line 1586 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvSetCursor -win $_nWave2 99.666403 -snap {("G1" 2)}
srcActiveTrace "tb_DandRiscvSimple.u_DandRiscvSimple.when_FetchPlugin_l71" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 99000 -TraceValue x
srcDeselectAll -win $_nTrace1
srcSelect -signal "ICachePlugin_icache_access_cmd_isStall" -line 1603 -pos 1 -win \
          $_nTrace1
srcSelect -signal "fetch_arbitration_isStuck" -line 1603 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvSetCursor -win $_nWave2 100.241402 -snap {("G1" 4)}
srcActiveTrace "tb_DandRiscvSimple.u_DandRiscvSimple.fetch_arbitration_isStuck" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 99000 -TraceValue x
srcDeselectAll -win $_nTrace1
srcSelect -signal "fetch_arbitration_haltItself" -line 3200 -pos 1 -win $_nTrace1
srcSelect -signal "fetch_arbitration_isStuckByOthers" -line 3200 -pos 1 -win \
          $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvSetCursor -win $_nWave2 98.516406 -snap {("G1" 6)}
srcActiveTrace \
           "tb_DandRiscvSimple.u_DandRiscvSimple.fetch_arbitration_isStuckByOthers" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 0 -TraceValue 0
srcDeselectAll -win $_nTrace1
srcSelect -signal "fetch_arbitration_haltByOther" -line 3199 -pos 1 -win \
          $_nTrace1
srcSelect -signal "decode_arbitration_isStuck" -line 3199 -pos 1 -win $_nTrace1
srcSelect -signal "execute_arbitration_isStuck" -line 3199 -pos 1 -win $_nTrace1
srcSelect -signal "memaccess_arbitration_isStuck" -line 3199 -pos 1 -win \
          $_nTrace1
srcSelect -signal "writeback_arbitration_isStuck" -line 3199 -pos 1 -win \
          $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvSetCursor -win $_nWave2 98.899738 -snap {("G1" 8)}
srcActiveTrace "tb_DandRiscvSimple.u_DandRiscvSimple.decode_arbitration_isStuck" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 0 -TraceValue 0
srcDeselectAll -win $_nTrace1
srcSelect -signal "decode_arbitration_haltItself" -line 3204 -pos 1 -win \
          $_nTrace1
srcSelect -signal "decode_arbitration_isStuckByOthers" -line 3204 -pos 1 -win \
          $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvSetCursor -win $_nWave2 98.133074 -snap {("G1" 13)}
srcActiveTrace \
           "tb_DandRiscvSimple.u_DandRiscvSimple.decode_arbitration_isStuckByOthers" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 0 -TraceValue 0
srcDeselectAll -win $_nTrace1
srcSelect -signal "decode_arbitration_haltByOther" -line 3203 -pos 1 -win \
          $_nTrace1
srcSelect -signal "execute_arbitration_isStuck" -line 3203 -pos 1 -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G1" 10 )} 
wvSelectSignal -win $_nWave2 {( "G1" 11 )} 
wvSetCursor -win $_nWave2 100.049735 -snap {("G1" 11)}
srcActiveTrace \
           "tb_DandRiscvSimple.u_DandRiscvSimple.writeback_arbitration_isStuck" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 99000 -TraceValue x
srcDeselectAll -win $_nTrace1
srcSelect -signal "writeback_arbitration_haltItself" -line 3216 -pos 1 -win \
          $_nTrace1
srcSelect -signal "writeback_arbitration_isStuckByOthers" -line 3216 -pos 1 -win \
          $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvSetCursor -win $_nWave2 96.216412 -snap {("G1" 14)}
srcActiveTrace \
           "tb_DandRiscvSimple.u_DandRiscvSimple.writeback_arbitration_haltItself" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 0 -TraceValue 0
srcDeselectAll -win $_nTrace1
srcSelect -signal "_zz_memaccess_arbitration_haltItself" -line 2704 -pos 1 -win \
          $_nTrace1
srcAction -pos 2703 7 15 -win $_nTrace1 -name \
          "_zz_memaccess_arbitration_haltItself" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "memaccess_LSU_HOLD" -line 1481 -pos 1 -win $_nTrace1
srcAction -pos 1480 7 4 -win $_nTrace1 -name "memaccess_LSU_HOLD" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "DCachePlugin_dcache_access_stall" -line 1412 -pos 1 -win \
          $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvSetCursor -win $_nWave2 98.708072 -snap {("G1" 16)}
srcActiveTrace \
           "tb_DandRiscvSimple.u_DandRiscvSimple.DCachePlugin_dcache_access_stall" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 0 -TraceValue 0
srcDeselectAll -win $_nTrace1
srcSelect -signal "dCache_1_stall" -line 3127 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "dCache_1_stall" -line 3127 -pos 1 -win $_nTrace1
srcAction -pos 3126 7 4 -win $_nTrace1 -name "dCache_1_stall" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "is_miss" -line 11509 -pos 1 -win $_nTrace1
srcSelect -signal "is_write" -line 11509 -pos 1 -win $_nTrace1
srcSelect -signal "cpu_cmd_ready_1" -line 11509 -pos 1 -win $_nTrace1
srcSelect -signal "next_level_wdone" -line 11509 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvSetCursor -win $_nWave2 100.049735 -snap {("G1" 17)}
srcActiveTrace "tb_DandRiscvSimple.u_DandRiscvSimple.dCache_1.is_miss" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 99000 -TraceValue x
srcDeselectAll -win $_nTrace1
srcSelect -signal "cpu_cmd_fire_1" -line 9984 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvSetCursor -win $_nWave2 98.899738 -snap {("G1" 21)}
srcActiveTrace "tb_DandRiscvSimple.u_DandRiscvSimple.dCache_1.cpu_cmd_fire_1" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 0 -TraceValue 0
srcDeselectAll -win $_nTrace1
srcSelect -signal "cpu_cmd_valid" -line 9983 -pos 1 -win $_nTrace1
srcSelect -signal "cpu_cmd_ready" -line 9983 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvSetCursor -win $_nWave2 99.474737 -snap {("G1" 22)}
srcActiveTrace "tb_DandRiscvSimple.u_DandRiscvSimple.dCache_1.cpu_cmd_valid" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 99000 -TraceValue x
srcDeselectAll -win $_nTrace1
srcSelect -signal "memaccess_LSUPlugin_is_timer" -line 3109 -pos 1 -win $_nTrace1
srcSelect -signal "memaccess_LSUPlugin_is_mem" -line 3109 -pos 1 -win $_nTrace1
srcSelect -signal "memaccess_arbitration_isValid" -line 3109 -pos 1 -win \
          $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvScrollDown -win $_nWave2 1
wvSetCursor -win $_nWave2 3.833323 -snap {("G1" 25)}
srcActiveTrace "tb_DandRiscvSimple.u_DandRiscvSimple.memaccess_LSUPlugin_is_mem" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 0 -TraceValue x
wvScrollUp -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G1" 23 24 25 26 )} 
wvSelectSignal -win $_nWave2 {( "G1" 22 23 24 25 26 )} 
wvSelectSignal -win $_nWave2 {( "G1" 21 22 23 24 25 26 )} 
wvSelectSignal -win $_nWave2 {( "G1" 20 21 22 23 24 25 26 )} 
wvSelectSignal -win $_nWave2 {( "G1" 19 20 21 22 23 24 25 26 )} 
wvSelectSignal -win $_nWave2 {( "G1" 18 19 20 21 22 23 24 25 26 )} 
wvSelectSignal -win $_nWave2 {( "G1" 17 18 19 20 21 22 23 24 25 26 )} 
wvSelectSignal -win $_nWave2 {( "G1" 16 17 18 19 20 21 22 23 24 25 26 )} 
wvSelectSignal -win $_nWave2 {( "G1" 15 16 17 18 19 20 21 22 23 24 25 26 )} 
wvSelectSignal -win $_nWave2 {( "G1" 14 15 16 17 18 19 20 21 22 23 24 25 26 )} \
           
wvSelectSignal -win $_nWave2 {( "G1" 13 14 15 16 17 18 19 20 21 22 23 24 25 26 \
           )} 
wvSelectSignal -win $_nWave2 {( "G1" 12 13 14 15 16 17 18 19 20 21 22 23 24 25 \
           26 )} 
wvSelectSignal -win $_nWave2 {( "G1" 11 12 13 14 15 16 17 18 19 20 21 22 23 24 \
           25 26 )} 
wvSelectSignal -win $_nWave2 {( "G1" 10 11 12 13 14 15 16 17 18 19 20 21 22 23 \
           24 25 26 )} 
wvSelectSignal -win $_nWave2 {( "G1" 9 10 11 12 13 14 15 16 17 18 19 20 21 22 \
           23 24 25 26 )} 
wvSelectSignal -win $_nWave2 {( "G1" 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 \
           23 24 25 26 )} 
wvSelectSignal -win $_nWave2 {( "G1" 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 \
           22 23 24 25 26 )} 
wvSelectSignal -win $_nWave2 {( "G1" 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 \
           21 22 23 24 25 26 )} 
wvSelectSignal -win $_nWave2 {( "G1" 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 \
           21 22 23 24 25 26 )} 
wvSelectSignal -win $_nWave2 {( "G1" 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 \
           20 21 22 23 24 25 26 )} 
wvSelectSignal -win $_nWave2 {( "G1" 2 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 \
           19 20 21 22 23 24 25 26 )} 
wvSelectSignal -win $_nWave2 {( "G1" 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 \
           19 20 21 22 23 24 25 26 )} 
wvSelectSignal -win $_nWave2 {( "G1" 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 \
           19 20 21 22 23 24 25 26 )} 
wvSelectSignal -win $_nWave2 {( "G1" 1 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 \
           19 20 21 22 23 24 25 26 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 26)}
wvSetPosition -win $_nWave2 {("G1" 0)}
wvSetPosition -win $_nWave2 {("G1" 0)}
wvSetPosition -win $_nWave2 {("G1" 0)}
wvSetPosition -win $_nWave2 {("G1" 0)}
wvZoom -win $_nWave2 33.541578 208.916114
wvZoom -win $_nWave2 84.900800 116.326670
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 40.024063 190.067759
wvZoom -win $_nWave2 74.076927 109.018609
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 0.000000 511.667320
wvSelectSignal -win $_nWave2 {( "G1" 16 )} 
wvZoom -win $_nWave2 25.384458 229.596739
wvSelectSignal -win $_nWave2 {( "G1" 6 )} 
wvZoom -win $_nWave2 83.903638 111.121861
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 13 )} 
wvSelectSignal -win $_nWave2 {( "G1" 9 )} 
wvSetCursor -win $_nWave2 89.162103 -snap {("G1" 4)}
wvZoom -win $_nWave2 36.599995 229.757679
wvSelectSignal -win $_nWave2 {( "G1" 4 9 )} 
srcHBSelect "tb_DandRiscvSimple.u_DandRiscvSimple.iCache_1" -win $_nTrace1
srcSetScope -win $_nTrace1 "tb_DandRiscvSimple.u_DandRiscvSimple.iCache_1" -delim \
           "."
srcHBSelect "tb_DandRiscvSimple.u_DandRiscvSimple.iCache_1" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "next_level_cmd_valid" -line 26897 -pos 1 -win $_nTrace1
srcSelect -signal "next_level_cmd_ready" -line 26898 -pos 1 -win $_nTrace1
srcSelect -signal "next_level_cmd_payload_addr" -line 26899 -pos 1 -win $_nTrace1
srcSelect -signal "next_level_cmd_payload_len" -line 26900 -pos 1 -win $_nTrace1
srcSelect -signal "next_level_cmd_payload_size" -line 26901 -pos 1 -win $_nTrace1
srcSelect -signal "next_level_rsp_valid" -line 26902 -pos 1 -win $_nTrace1
srcSelect -toggle -signal "next_level_rsp_valid" -line 26902 -pos 1 -win \
          $_nTrace1
srcSelect -toggle -signal "next_level_cmd_payload_len" -line 26900 -pos 1 -win \
          $_nTrace1
srcSelect -toggle -signal "next_level_cmd_payload_size" -line 26901 -pos 1 -win \
          $_nTrace1
srcSelect -signal "next_level_rsp_valid" -line 26902 -pos 1 -win $_nTrace1
srcSelect -signal "next_level_rsp_payload_data" -line 26903 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave2 {("G1" 5)}
wvSetPosition -win $_nWave2 {("G1" 6)}
wvSetPosition -win $_nWave2 {("G1" 5)}
wvAddSignal -win $_nWave2 \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/iCache_1/next_level_cmd_valid" \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/iCache_1/next_level_cmd_ready" \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/iCache_1/next_level_cmd_payload_addr\[63:0\]" \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/iCache_1/next_level_rsp_valid" \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/iCache_1/next_level_rsp_payload_data\[63:0\]"
wvSetPosition -win $_nWave2 {("G1" 5)}
wvSetPosition -win $_nWave2 {("G1" 10)}
wvSetPosition -win $_nWave2 {("G1" 5)}
wvSetPosition -win $_nWave2 {("G1" 10)}
wvSetPosition -win $_nWave2 {("G1" 10)}
wvSetPosition -win $_nWave2 {("G1" 10)}
wvSetPosition -win $_nWave2 {("G1" 10)}
wvZoom -win $_nWave2 44.537982 127.994116
wvZoom -win $_nWave2 55.043382 108.002958
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 84.209383 105.855948
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 7 )} 
wvZoom -win $_nWave2 37.041350 153.152209
srcDeselectAll -win $_nTrace1
srcSearchString "next_level_donw" -win $_nTrace1 -next -case
srcSearchString "next_level_done" -win $_nTrace1 -next -case
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoom -win $_nWave2 79.549479 125.503759
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 11 14 )} 
wvSelectSignal -win $_nWave2 {( "G1" 5 )} 
wvSetCursor -win $_nWave2 88.830508 -snap {("G1" 5)}
srcActiveTrace \
           "tb_DandRiscvSimple.u_DandRiscvSimple.iCache_1.cpu_rsp_payload_data\[31:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 63000 -TraceValue \
           00000000000000000000010000010011
wvSelectSignal -win $_nWave2 {( "G1" 14 )} 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 37.294254 265.959752
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
wvZoom -win $_nWave2 0.000000 1981.858571
wvZoom -win $_nWave2 495.281205 828.403675
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSelectSignal -win $_nWave2 {( "G1" 14 )} 
wvZoom -win $_nWave2 495.281205 608.747578
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
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
wvSelectSignal -win $_nWave2 {( "G1" 1 )} 
wvSetCursor -win $_nWave2 594.175629 -snap {("G1" 2)}
wvZoom -win $_nWave2 522.928325 1176.252659
wvSelectSignal -win $_nWave2 {( "G1" 12 )} 
wvSelectSignal -win $_nWave2 {( "G1" 12 13 )} 
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvZoom -win $_nWave2 540.101975 684.747644
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoom -win $_nWave2 557.024607 616.414480
wvScrollDown -win $_nWave2 2
wvSelectSignal -win $_nWave2 {( "G1" 22 )} 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 9 )} 
wvZoomOut -win $_nWave2
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSelectSignal -win $_nWave2 {( "G1" 4 )} 
wvZoom -win $_nWave2 551.846409 669.966511
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 0.000000 973.998863
wvZoom -win $_nWave2 539.828322 657.746733
wvZoom -win $_nWave2 558.557310 602.345599
wvSelectSignal -win $_nWave2 {( "G1" 4 5 )} 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 0.000000 163.934531
wvZoom -win $_nWave2 86.246194 126.547019
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvScrollDown -win $_nWave2 0
srcHBSelect "tb_DandRiscvSimple" -win $_nTrace1
srcSetScope -win $_nTrace1 "tb_DandRiscvSimple" -delim "."
srcHBSelect "tb_DandRiscvSimple" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "instrCnt" -line 427 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave2 {("G1" 0)}
wvAddSignal -win $_nWave2 "/tb_DandRiscvSimple/instrCnt\[31:0\]"
wvSetPosition -win $_nWave2 {("G1" 0)}
wvSetPosition -win $_nWave2 {("G1" 1)}
wvSetPosition -win $_nWave2 {("G1" 0)}
wvSetPosition -win $_nWave2 {("G1" 1)}
wvSetPosition -win $_nWave2 {("G1" 1)}
wvSetPosition -win $_nWave2 {("G1" 1)}
wvSetPosition -win $_nWave2 {("G1" 1)}
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 522.344054 857.522779
wvSelectSignal -win $_nWave2 {( "G1" 1 )} 
wvSetRadix -win $_nWave2 -format UDec
wvZoom -win $_nWave2 554.112196 640.357740
wvZoom -win $_nWave2 572.983398 596.580384
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoom -win $_nWave2 561.141224 594.723901
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
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
wvZoomIn -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 13 )} 
wvSetCursor -win $_nWave2 567.214951 -snap {("G1" 13)}
wvZoom -win $_nWave2 560.152767 602.724809
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 9 )} 
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 5 )} 
wvSelectSignal -win $_nWave2 {( "G1" 4 )} 
wvSelectSignal -win $_nWave2 {( "G1" 2 )} 
wvSelectSignal -win $_nWave2 {( "G1" 3 )} 
wvSelectSignal -win $_nWave2 {( "G1" 4 )} 
wvZoom -win $_nWave2 560.034555 605.364875
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvScrollDown -win $_nWave2 4
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
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
wvScrollUp -win $_nWave2 4
wvSelectSignal -win $_nWave2 {( "G1" 9 )} 
wvSelectAll -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 7 )} 
wvScrollDown -win $_nWave2 4
wvScrollUp -win $_nWave2 4
wvSelectSignal -win $_nWave2 {( "G1" 1 )} 
wvSetPosition -win $_nWave2 {("G1" 2)}
wvSetPosition -win $_nWave2 {("G1" 4)}
wvSetPosition -win $_nWave2 {("G1" 5)}
wvSetPosition -win $_nWave2 {("G1" 7)}
wvSetPosition -win $_nWave2 {("G1" 8)}
wvSetPosition -win $_nWave2 {("G1" 10)}
wvSetPosition -win $_nWave2 {("G1" 11)}
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
wvSetPosition -win $_nWave2 {("G1" 24)}
wvSetPosition -win $_nWave2 {("G1" 25)}
wvSetPosition -win $_nWave2 {("G1" 26)}
wvSetPosition -win $_nWave2 {("G1" 27)}
wvSetPosition -win $_nWave2 {("G1" 28)}
wvSetPosition -win $_nWave2 {("G1" 29)}
wvSetPosition -win $_nWave2 {("G1" 30)}
wvSetPosition -win $_nWave2 {("G1" 31)}
wvSetPosition -win $_nWave2 {("G1" 32)}
wvSetPosition -win $_nWave2 {("G1" 33)}
wvSetPosition -win $_nWave2 {("G1" 34)}
wvSetPosition -win $_nWave2 {("G1" 35)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G1" 35)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G2" 1)}
wvSetPosition -win $_nWave2 {("G2" 1)}
wvSetPosition -win $_nWave2 {("G2" 1)}
wvSetPosition -win $_nWave2 {("G2" 1)}
wvSetPosition -win $_nWave2 {("G2" 1)}
wvRestoreSignal -win $_nWave2 \
           "/home/lin/SpinalProjects/DandRiscvSoC/simWorkspace/tb_DandRiscvSimple/DandRiscv_debug_total.rc" \
           -overWriteAutoAlias on -appendSignals on
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 19
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 35 )} 
wvSelectSignal -win $_nWave2 {( "G1" 36 )} 
wvSelectSignal -win $_nWave2 {( "G1" 35 )} 
wvSelectSignal -win $_nWave2 {( "G1" 35 36 )} 
wvSelectSignal -win $_nWave2 {( "G1" 35 36 37 )} 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 489.507839 740.581696
wvScrollUp -win $_nWave2 9
srcDeselectAll -win $_nTrace1
srcSelect -signal "instrCnt" -line 427 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave2 {("G1" 12)}
wvSetPosition -win $_nWave2 {("G1" 15)}
wvSetPosition -win $_nWave2 {("G1" 16)}
wvSetPosition -win $_nWave2 {("G1" 1)}
wvSetPosition -win $_nWave2 {("G1" 37)}
wvSetPosition -win $_nWave2 {("G1" 38)}
wvAddSignal -win $_nWave2 "/tb_DandRiscvSimple/instrCnt\[31:0\]"
wvSetPosition -win $_nWave2 {("G1" 38)}
wvSetPosition -win $_nWave2 {("G1" 39)}
wvSetPosition -win $_nWave2 {("G1" 38)}
wvSetPosition -win $_nWave2 {("G1" 39)}
wvSetPosition -win $_nWave2 {("G1" 39)}
wvSetPosition -win $_nWave2 {("G1" 39)}
wvSetPosition -win $_nWave2 {("G1" 39)}
wvZoom -win $_nWave2 575.394205 611.102899
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 578.988818 -snap {("G1" 35)}
wvZoom -win $_nWave2 577.089279 595.847226
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 36 )} 
srcDeselectAll -win $_nTrace1
debReload
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 100.227169 478.961691
wvSelectSignal -win $_nWave2 {( "G1" 36 )} 
wvZoom -win $_nWave2 162.626724 200.961877
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 161.557532 183.819394
wvZoomOut -win $_nWave2
wvScrollDown -win $_nWave2 3
wvSelectSignal -win $_nWave2 {( "G2" 3 )} 
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G2" 5 )} 
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 4 )} 
wvSelectSignal -win $_nWave2 {( "G2" 3 4 )} 
wvZoom -win $_nWave2 144.908422 166.191650
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvScrollUp -win $_nWave2 18
wvSelectSignal -win $_nWave2 {( "G1" 3 )} 
wvZoom -win $_nWave2 139.508534 185.424328
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 79.517266 127.417599
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 96.495607 122.117950
wvSetCursor -win $_nWave2 104.966977 -snap {("G1" 3)}
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 12 )} 
wvSelectSignal -win $_nWave2 {( "G1" 12 13 )} 
wvSelectSignal -win $_nWave2 {( "G1" 13 )} 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 78.374449 181.128846
wvSelectSignal -win $_nWave2 {( "G1" 13 14 )} 
wvSelectSignal -win $_nWave2 {( "G1" 13 )} 
wvSelectSignal -win $_nWave2 {( "G1" 13 14 )} 
wvZoom -win $_nWave2 135.806072 166.135131
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 4 13 14 )} 
wvSelectSignal -win $_nWave2 {( "G1" 4 5 13 14 )} 
wvZoom -win $_nWave2 139.385730 161.121369
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvSetCursor -win $_nWave2 146.961487 -snap {("G1" 5)}
srcActiveTrace \
           "tb_DandRiscvSimple.u_DandRiscvSimple.iCache_1.cpu_rsp_payload_data\[31:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 107000 -TraceValue \
           xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
srcDeselectAll -win $_nTrace1
srcSelect -signal "is_hit_d1" -line 28070 -pos 1 -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G1" 4 5 12 13 14 )} 
wvSetPosition -win $_nWave2 {("G1" 0)}
wvSetPosition -win $_nWave2 {("G1" 1)}
wvSetPosition -win $_nWave2 {("G1" 2)}
wvSetPosition -win $_nWave2 {("G1" 1)}
wvSetPosition -win $_nWave2 {("G1" 12)}
wvAddSignal -win $_nWave2 \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/iCache_1/is_hit_d1"
wvSetPosition -win $_nWave2 {("G1" 12)}
wvSetPosition -win $_nWave2 {("G1" 13)}
wvSetPosition -win $_nWave2 {("G1" 12)}
wvSetPosition -win $_nWave2 {("G1" 13)}
wvSetPosition -win $_nWave2 {("G1" 13)}
wvSetPosition -win $_nWave2 {("G1" 13)}
wvSetPosition -win $_nWave2 {("G1" 13)}
wvSelectSignal -win $_nWave2 {( "G1" 1 )} 
wvSelectSignal -win $_nWave2 {( "G1" 2 )} 
wvSelectSignal -win $_nWave2 {( "G1" 1 )} 
wvSelectSignal -win $_nWave2 {( "G1" 11 )} 
wvSelectSignal -win $_nWave2 {( "G1" 9 )} 
wvSelectSignal -win $_nWave2 {( "G1" 4 )} 
wvSetCursor -win $_nWave2 146.929370 -snap {("G1" 4)}
srcActiveTrace "tb_DandRiscvSimple.u_DandRiscvSimple.iCache_1.cpu_rsp_valid" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 105000 -TraceValue 0
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 4 )} 
wvSelectSignal -win $_nWave2 {( "G1" 11 )} 
wvSetCursor -win $_nWave2 146.961487 -snap {("G1" 4)}
srcActiveTrace "tb_DandRiscvSimple.u_DandRiscvSimple.iCache_1.cpu_rsp_valid" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 105000 -TraceValue 0
wvSelectSignal -win $_nWave2 {( "G1" 12 )} 
wvSelectSignal -win $_nWave2 {( "G1" 13 )} 
wvSelectSignal -win $_nWave2 {( "G1" 12 )} 
wvSelectSignal -win $_nWave2 {( "G1" 4 )} 
wvSelectSignal -win $_nWave2 {( "G1" 2 )} 
wvSelectSignal -win $_nWave2 {( "G1" 11 )} 
wvSetCursor -win $_nWave2 141.597835 -snap {("G1" 11)}
srcActiveTrace "tb_DandRiscvSimple.u_DandRiscvSimple.iCache_1.next_level_done" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 141000 -TraceValue 1
srcDeselectAll -win $_nTrace1
srcSelect -signal "next_level_done" -line 28590 -pos 1 -win $_nTrace1
srcTraceLoad "tb_DandRiscvSimple.u_DandRiscvSimple.iCache_1.next_level_done" -win \
           $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "next_level_done" -line 27544 -pos 1 -win $_nTrace1
srcSearchString "next_level_done" -win $_nTrace1 -prev -case
srcSelect -win $_nTrace1 -range {27095 27095 4 5 1 1}
srcSearchString "next_level_done" -win $_nTrace1 -next -case
srcSearchString "next_level_done" -win $_nTrace1 -next -case
srcSearchString "next_level_done" -win $_nTrace1 -next -case
srcSearchString "next_level_done" -win $_nTrace1 -next -case
srcDeselectAll -win $_nTrace1
srcSelect -signal "when_ICache_l221" -line 27722 -pos 1 -win $_nTrace1
srcSearchString "when_ICache_l221" -win $_nTrace1 -next -case
srcSearchString "when_ICache_l221" -win $_nTrace1 -next -case
srcSearchString "when_ICache_l221" -win $_nTrace1 -next -case
srcSearchString "when_ICache_l221" -win $_nTrace1 -next -case
srcDeselectAll -win $_nTrace1
srcSelect -signal "when_ICache_l221" -line 28222 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 14 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 14)}
wvSetPosition -win $_nWave2 {("G1" 13)}
wvSetPosition -win $_nWave2 {("G1" 13)}
wvSetPosition -win $_nWave2 {("G1" 13)}
wvSetPosition -win $_nWave2 {("G1" 13)}
srcHBSelect "tb_DandRiscvSimple.u_DandRiscvSimple.iCache_1" -win $_nTrace1
srcSetScope -win $_nTrace1 "tb_DandRiscvSimple.u_DandRiscvSimple.iCache_1" -delim \
           "."
srcHBSelect "tb_DandRiscvSimple.u_DandRiscvSimple.iCache_1" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "sram_0_ports_cmd_valid" -line 26785 -pos 1 -win $_nTrace1
srcSelect -signal "sram_0_ports_cmd_payload_wen" -line 26787 -pos 1 -win \
          $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 15)}
wvSetPosition -win $_nWave2 {("G1" 13)}
wvSetPosition -win $_nWave2 {("G1" 13)}
wvSetPosition -win $_nWave2 {("G1" 13)}
wvSetPosition -win $_nWave2 {("G1" 13)}
srcDeselectAll -win $_nTrace1
wvSetCursor -win $_nWave2 147.122076 -snap {("G1" 4)}
srcActiveTrace "tb_DandRiscvSimple.u_DandRiscvSimple.iCache_1.cpu_rsp_valid" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 147000 -TraceValue 1
srcDeselectAll -win $_nTrace1
srcSelect -signal "is_hit_d1" -line 28071 -pos 1 -win $_nTrace1
srcSelect -signal "_zz_cpu_rsp_valid" -line 28071 -pos 1 -win $_nTrace1
srcSelect -signal "_zz_cpu_rsp_valid_1" -line 28071 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 4 )} 
wvSetCursor -win $_nWave2 147.218429 -snap {("G1" 4)}
srcActiveTrace "tb_DandRiscvSimple.u_DandRiscvSimple.iCache_1.cpu_rsp_valid" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 147000 -TraceValue 1
srcDeselectAll -win $_nTrace1
srcSelect -signal "cpu_rsp_valid" -line 28071 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
srcDeselectAll -win $_nTrace1
srcSelect -signal "is_hit_d1" -line 28071 -pos 1 -win $_nTrace1
srcSelect -signal "_zz_cpu_rsp_valid" -line 28071 -pos 1 -win $_nTrace1
srcSelect -signal "_zz_cpu_rsp_valid_1" -line 28071 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
srcDeselectAll -win $_nTrace1
srcSelect -signal "_zz_cpu_rsp_valid" -line 28071 -pos 1 -win $_nTrace1
srcAction -pos 28070 12 7 -win $_nTrace1 -name "_zz_cpu_rsp_valid" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "hit_id_d1" -line 27390 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave2 {("G1" 1)}
wvSetPosition -win $_nWave2 {("G1" 19)}
wvSetPosition -win $_nWave2 {("G1" 20)}
wvAddSignal -win $_nWave2 \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/iCache_1/hit_id_d1\[1:0\]"
wvSetPosition -win $_nWave2 {("G1" 20)}
wvSetPosition -win $_nWave2 {("G1" 21)}
wvSetPosition -win $_nWave2 {("G1" 20)}
wvSetPosition -win $_nWave2 {("G1" 21)}
wvSetPosition -win $_nWave2 {("G1" 21)}
wvSetPosition -win $_nWave2 {("G1" 21)}
wvSetPosition -win $_nWave2 {("G1" 21)}
wvScrollDown -win $_nWave2 6
wvScrollUp -win $_nWave2 6
wvScrollDown -win $_nWave2 0
wvSelectSignal -win $_nWave2 {( "G1" 20 )} 
wvSetCursor -win $_nWave2 144.199367 -snap {("G1" 20)}
srcActiveTrace \
           "tb_DandRiscvSimple.u_DandRiscvSimple.iCache_1._zz_cpu_rsp_valid_1" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 93000 -TraceValue 1
srcDeselectAll -win $_nTrace1
srcSelect -signal "evict_id_miss" -line 27411 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 53.186876 233.816701
wvZoom -win $_nWave2 132.124845 171.427012
wvZoomOut -win $_nWave2
wvSetMarker -win $_nWave2 147.000000
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 107.235245 -snap {("G1" 22)}
wvSelectSignal -win $_nWave2 {( "G1" 10 )} 
wvZoom -win $_nWave2 95.562196 177.912360
wvSelectSignal -win $_nWave2 {( "G1" 22 )} 
srcDeselectAll -win $_nTrace1
debReload
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 139.444764 164.937722
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 4 )} 
srcDeselectAll -win $_nTrace1
debReload
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
wvSelectSignal -win $_nWave2 {( "G2" 1 )} 
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
wvZoom -win $_nWave2 44306.427780 50462.689324
wvZoom -win $_nWave2 49668.993248 50214.801438
wvScrollDown -win $_nWave2 1
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
srcDeselectAll -win $_nTrace1
debReload
wvZoom -win $_nWave2 54640.252474 55208.038164
wvSelectSignal -win $_nWave2 {( "G2" 1 )} 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 50287.862063 51798.041956
wvSetSearchMode -win $_nWave2 -value 8894
wvSearchNext -win $_nWave2
wvZoom -win $_nWave2 52229.312461 52308.531355
wvZoom -win $_nWave2 52271.921515 52289.802100
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
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvScrollUp -win $_nWave2 2
wvScrollUp -win $_nWave2 31
wvSetMarker -win $_nWave2 52281.000000
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
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 3 )} 
wvZoom -win $_nWave2 52254.850081 52266.581119
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 4 )} 
wvSelectSignal -win $_nWave2 {( "G1" 4 5 )} 
wvSetCursor -win $_nWave2 52259.094836 -snap {("G1" 5)}
wvSetMarker -win $_nWave2 52259.000000
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 52338.165584 52375.607832
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 3
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 2
wvScrollDown -win $_nWave2 2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
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
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 2
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 4
wvScrollUp -win $_nWave2 6
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
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
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
wvSelectSignal -win $_nWave2 {( "G2" 1 )} 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 51288.862827 51544.692833
wvSetCursor -win $_nWave2 51481.373253 -snap {("G2" 1)}
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 51556.364427 51589.441820
wvSetMarker -win $_nWave2 51565.000000
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
wvZoom -win $_nWave2 51398.136346 51695.307454
wvZoom -win $_nWave2 51520.429886 51593.762099
wvZoom -win $_nWave2 51548.169888 51569.083249
wvSetCursor -win $_nWave2 51553.160665 -snap {("G1" 5)}
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSetMarker -win $_nWave2 51553.000000
wvZoom -win $_nWave2 51546.914469 51561.809541
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvScrollDown -win $_nWave2 33
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G2" 3 )} 
wvSelectSignal -win $_nWave2 {( "G2" 3 4 )} 
wvZoom -win $_nWave2 51548.892591 51576.338701
wvSetMarker -win $_nWave2 51555.000000
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 51513.583734 -snap {("G2" 3)}
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
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
wvZoom -win $_nWave2 51501.903675 51557.383953
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 1 )} 
wvSelectSignal -win $_nWave2 {( "G1" 1 2 )} 
wvSelectSignal -win $_nWave2 {( "G1" 1 2 3 )} 
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 12 )} 
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G1" 23 )} 
wvSelectSignal -win $_nWave2 {( "G1" 4 )} 
wvSelectSignal -win $_nWave2 {( "G1" 4 5 )} 
wvSetCursor -win $_nWave2 51548.642787 -snap {("G1" 4)}
wvZoom -win $_nWave2 51539.256024 51564.915908
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
wvSelectSignal -win $_nWave2 {( "G2" 2 )} 
wvSelectSignal -win $_nWave2 {( "G2" 2 )} 
wvSelectSignal -win $_nWave2 {( "G2" 2 )} 
wvSelectSignal -win $_nWave2 {( "G2" 3 )} 
wvSelectSignal -win $_nWave2 {( "G2" 3 4 )} 
wvZoom -win $_nWave2 51545.583313 51567.612708
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 51473.428296 51502.008730
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 51542.155425 51562.173342
wvZoomOut -win $_nWave2
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
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 51512.794086 -snap {("G2" 3)}
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G1" 23 )} {( "G2" 3 4 )} 
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G2" 4 )} 
wvSetCursor -win $_nWave2 51555.151912 -snap {("G2" 4)}
srcActiveTrace "tb_DandRiscvSimple.u_DandRiscvSimple.fetch_INSTRUCTION\[31:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 51555000 -TraceValue \
           00000000000001101000010001100011
srcDeselectAll -win $_nTrace1
srcSelect -signal "fetch_FetchPlugin_instruction_out_stream_payload" -line 1463 \
          -pos 1 -win $_nTrace1
srcAction -pos 1462 7 16 -win $_nTrace1 -name \
          "fetch_FetchPlugin_instruction_out_stream_payload" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal \
          "fetch_FetchPlugin_instruction_stream_fifo_ports_m_ports_payload" \
          -line 1629 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal \
          "fetch_FetchPlugin_instruction_stream_fifo_ports_m_ports_payload" \
          -line 1629 -pos 1 -win $_nTrace1
srcAction -pos 1628 7 31 -win $_nTrace1 -name \
          "fetch_FetchPlugin_instruction_stream_fifo_ports_m_ports_payload" \
          -ctrlKey off
srcHBSelect \
           "tb_DandRiscvSimple.u_DandRiscvSimple.fetch_FetchPlugin_instruction_stream_fifo" \
           -win $_nTrace1
srcSetScope -win $_nTrace1 \
           "tb_DandRiscvSimple.u_DandRiscvSimple.fetch_FetchPlugin_instruction_stream_fifo" \
           -delim "."
srcHBSelect \
           "tb_DandRiscvSimple.u_DandRiscvSimple.fetch_FetchPlugin_instruction_stream_fifo" \
           -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "fifo_ram_0" -line 33723 -pos 1 -win $_nTrace1
srcSelect -signal "fifo_ram_1" -line 33724 -pos 1 -win $_nTrace1
srcSelect -signal "fifo_ram_2" -line 33725 -pos 1 -win $_nTrace1
srcSelect -signal "fifo_ram_3" -line 33726 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave2 {("G1" 28)}
wvSetPosition -win $_nWave2 {("G1" 30)}
wvSetPosition -win $_nWave2 {("G1" 36)}
wvSetPosition -win $_nWave2 {("G1" 37)}
wvSetPosition -win $_nWave2 {("G1" 38)}
wvSetPosition -win $_nWave2 {("G1" 39)}
wvSetPosition -win $_nWave2 {("G1" 40)}
wvSetPosition -win $_nWave2 {("G1" 41)}
wvSetPosition -win $_nWave2 {("G1" 42)}
wvSetPosition -win $_nWave2 {("G1" 1)}
wvSetPosition -win $_nWave2 {("G2" 5)}
wvSetPosition -win $_nWave2 {("G2" 6)}
wvSetPosition -win $_nWave2 {("G2" 7)}
wvAddSignal -win $_nWave2 \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/fetch_FetchPlugin_instruction_stream_fifo/fifo_ram_0\[31:0\]" \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/fetch_FetchPlugin_instruction_stream_fifo/fifo_ram_1\[31:0\]" \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/fetch_FetchPlugin_instruction_stream_fifo/fifo_ram_2\[31:0\]" \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/fetch_FetchPlugin_instruction_stream_fifo/fifo_ram_3\[31:0\]"
wvSetPosition -win $_nWave2 {("G2" 7)}
wvSetPosition -win $_nWave2 {("G2" 11)}
wvSetPosition -win $_nWave2 {("G2" 7)}
wvSetPosition -win $_nWave2 {("G2" 11)}
wvSetPosition -win $_nWave2 {("G2" 11)}
wvSetPosition -win $_nWave2 {("G2" 11)}
wvSetPosition -win $_nWave2 {("G2" 11)}
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
srcDeselectAll -win $_nTrace1
srcSelect -signal "ports_s_ports_valid" -line 33694 -pos 1 -win $_nTrace1
srcSelect -signal "ports_s_ports_ready" -line 33695 -pos 1 -win $_nTrace1
srcSelect -signal "ports_s_ports_payload" -line 33696 -pos 1 -win $_nTrace1
srcSelect -signal "ports_m_ports_valid" -line 33697 -pos 1 -win $_nTrace1
srcSelect -signal "ports_m_ports_ready" -line 33698 -pos 1 -win $_nTrace1
srcSelect -signal "ports_m_ports_payload" -line 33699 -pos 1 -win $_nTrace1
srcSelect -signal "flush" -line 33700 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave2 {("G1" 31)}
wvSetPosition -win $_nWave2 {("G1" 38)}
wvSetPosition -win $_nWave2 {("G1" 39)}
wvSetPosition -win $_nWave2 {("G1" 1)}
wvSetPosition -win $_nWave2 {("G2" 8)}
wvSetPosition -win $_nWave2 {("G2" 9)}
wvSetPosition -win $_nWave2 {("G2" 10)}
wvSetPosition -win $_nWave2 {("G2" 11)}
wvAddSignal -win $_nWave2 \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/fetch_FetchPlugin_instruction_stream_fifo/ports_s_ports_valid" \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/fetch_FetchPlugin_instruction_stream_fifo/ports_s_ports_ready" \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/fetch_FetchPlugin_instruction_stream_fifo/ports_s_ports_payload\[31:0\]" \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/fetch_FetchPlugin_instruction_stream_fifo/ports_m_ports_valid" \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/fetch_FetchPlugin_instruction_stream_fifo/ports_m_ports_ready" \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/fetch_FetchPlugin_instruction_stream_fifo/ports_m_ports_payload\[31:0\]" \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/fetch_FetchPlugin_instruction_stream_fifo/flush"
wvSetPosition -win $_nWave2 {("G2" 11)}
wvSetPosition -win $_nWave2 {("G2" 18)}
wvSetPosition -win $_nWave2 {("G2" 11)}
wvSetPosition -win $_nWave2 {("G2" 18)}
wvSetPosition -win $_nWave2 {("G2" 18)}
wvSetPosition -win $_nWave2 {("G2" 18)}
wvSetPosition -win $_nWave2 {("G2" 18)}
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoom -win $_nWave2 51518.887461 51585.737101
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 51553.176609 -snap {("G2" 12)}
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
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
wvZoom -win $_nWave2 51537.766866 51577.772931
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
wvSetCursor -win $_nWave2 51553.085036 -snap {("G2" 12)}
srcActiveTrace \
           "tb_DandRiscvSimple.u_DandRiscvSimple.fetch_FetchPlugin_instruction_stream_fifo.ports_s_ports_valid" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 51553000 -TraceValue 1
srcDeselectAll -win $_nTrace1
srcSelect -signal "ICachePlugin_icache_access_rsp_valid" -line 1624 -pos 1 -win \
          $_nTrace1
srcSelect -signal "rsp_flush" -line 1624 -pos 1 -win $_nTrace1
srcSelect -signal "fetch_FetchPlugin_fetch_flush" -line 1624 -pos 1 -win \
          $_nTrace1
wvSetPosition -win $_nWave2 {("G1" 37)}
wvSetPosition -win $_nWave2 {("G1" 36)}
wvSetPosition -win $_nWave2 {("G1" 38)}
wvSetPosition -win $_nWave2 {("G1" 39)}
wvSetPosition -win $_nWave2 {("G1" 44)}
wvSetPosition -win $_nWave2 {("G1" 1)}
wvSetPosition -win $_nWave2 {("G2" 13)}
wvSetPosition -win $_nWave2 {("G2" 14)}
wvSetPosition -win $_nWave2 {("G2" 15)}
wvSetPosition -win $_nWave2 {("G2" 16)}
wvSetPosition -win $_nWave2 {("G2" 17)}
wvSetPosition -win $_nWave2 {("G2" 18)}
wvAddSignal -win $_nWave2 \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/ICachePlugin_icache_access_rsp_valid" \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/rsp_flush" \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/fetch_FetchPlugin_fetch_flush"
wvSetPosition -win $_nWave2 {("G2" 18)}
wvSetPosition -win $_nWave2 {("G2" 21)}
wvSetPosition -win $_nWave2 {("G2" 18)}
wvSetPosition -win $_nWave2 {("G2" 21)}
wvSetPosition -win $_nWave2 {("G2" 21)}
wvSetPosition -win $_nWave2 {("G2" 21)}
wvSetPosition -win $_nWave2 {("G2" 21)}
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 2
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 2
wvScrollUp -win $_nWave2 2
wvScrollUp -win $_nWave2 3
wvScrollUp -win $_nWave2 2
wvScrollUp -win $_nWave2 3
wvScrollUp -win $_nWave2 2
wvScrollUp -win $_nWave2 2
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 2
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 2
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 3
wvScrollUp -win $_nWave2 2
wvScrollUp -win $_nWave2 3
wvScrollUp -win $_nWave2 2
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
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G1" 4 )} 
wvSetMarker -win $_nWave2 51549.000000
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
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
wvSelectSignal -win $_nWave2 {( "G2" 20 )} 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 51499.866772 51599.179944
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 19 )} 
wvSelectSignal -win $_nWave2 {( "G2" 20 )} 
wvSelectSignal -win $_nWave2 {( "G2" 19 )} 
wvSelectSignal -win $_nWave2 {( "G2" 20 )} 
wvSelectSignal -win $_nWave2 {( "G2" 19 )} 
wvSelectSignal -win $_nWave2 {( "G2" 20 )} 
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 51515.392939 -snap {("G2" 20)}
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
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 2
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 2
wvScrollUp -win $_nWave2 5
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 3
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 2
wvScrollUp -win $_nWave2 2
wvScrollUp -win $_nWave2 2
wvScrollUp -win $_nWave2 2
wvScrollUp -win $_nWave2 2
wvScrollUp -win $_nWave2 2
wvScrollUp -win $_nWave2 3
wvScrollUp -win $_nWave2 2
wvScrollUp -win $_nWave2 2
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
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
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
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
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 2
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
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
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 2
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 1
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
wvSetCursor -win $_nWave2 51514.292313 -snap {("G2" 20)}
srcActiveTrace "tb_DandRiscvSimple.u_DandRiscvSimple.rsp_flush" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 51511000 -TraceValue 0
wvScrollUp -win $_nWave2 1
wvSetCursor -win $_nWave2 51515.319564 -snap {("G2" 20)}
srcActiveTrace "tb_DandRiscvSimple.u_DandRiscvSimple.rsp_flush" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 51515000 -TraceValue 1
srcDeselectAll -win $_nTrace1
srcSelect -signal "when_FetchPlugin_l92" -line 3257 -pos 1 -win $_nTrace1
srcAction -pos 3256 3 11 -win $_nTrace1 -name "when_FetchPlugin_l92" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "ICachePlugin_icache_access_cmd_ready" -line 1605 -pos 1 -win \
          $_nTrace1
wvSetPosition -win $_nWave2 {("G1" 44)}
wvSetPosition -win $_nWave2 {("G1" 45)}
wvSetPosition -win $_nWave2 {("G1" 48)}
wvSetPosition -win $_nWave2 {("G1" 49)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G2" 1)}
wvSetPosition -win $_nWave2 {("G2" 2)}
wvSetPosition -win $_nWave2 {("G2" 3)}
wvSetPosition -win $_nWave2 {("G1" 1)}
wvSetPosition -win $_nWave2 {("G2" 21)}
wvAddSignal -win $_nWave2 \
           "/tb_DandRiscvSimple/u_DandRiscvSimple/ICachePlugin_icache_access_cmd_ready"
wvSetPosition -win $_nWave2 {("G2" 21)}
wvSetPosition -win $_nWave2 {("G2" 22)}
wvSetPosition -win $_nWave2 {("G2" 21)}
wvSetPosition -win $_nWave2 {("G2" 22)}
wvSetPosition -win $_nWave2 {("G2" 22)}
wvSetPosition -win $_nWave2 {("G2" 22)}
wvSetPosition -win $_nWave2 {("G2" 22)}
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
srcDeselectAll -win $_nTrace1
srcBackwardHistory -win $_nTrace1
srcHBSelect "tb_DandRiscvSimple.u_DandRiscvSimple" -win $_nTrace1
srcHBSelect "tb_DandRiscvSimple.u_DandRiscvSimple" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "when_FetchPlugin_l93" -line 3258 -pos 1 -win $_nTrace1
srcSelect -signal "when_FetchPlugin_l96" -line 3261 -pos 1 -win $_nTrace1
srcSelect -signal "fetch_BPU_BRANCH_TAKEN" -line 3264 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvScrollDown -win $_nWave2 1
srcDeselectAll -win $_nTrace1
srcSelect -signal "when_FetchPlugin_l93" -line 3258 -pos 1 -win $_nTrace1
srcAction -pos 3257 3 14 -win $_nTrace1 -name "when_FetchPlugin_l93" -ctrlKey off
srcBackwardHistory -win $_nTrace1
srcHBSelect "tb_DandRiscvSimple.u_DandRiscvSimple" -win $_nTrace1
srcHBSelect "tb_DandRiscvSimple.u_DandRiscvSimple" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "when_FetchPlugin_l96" -line 3261 -pos 1 -win $_nTrace1
srcAction -pos 3260 3 12 -win $_nTrace1 -name "when_FetchPlugin_l96" -ctrlKey off
srcBackwardHistory -win $_nTrace1
srcHBSelect "tb_DandRiscvSimple.u_DandRiscvSimple" -win $_nTrace1
srcHBSelect "tb_DandRiscvSimple.u_DandRiscvSimple" -win $_nTrace1
wvSetCursor -win $_nWave2 51513.265062 -snap {("G2" 25)}
wvScrollDown -win $_nWave2 1
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvSetCursor -win $_nWave2 51513.044937 -snap {("G2" 25)}
srcActiveTrace "tb_DandRiscvSimple.u_DandRiscvSimple.fetch_BPU_BRANCH_TAKEN" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 51471000 -TraceValue 0
wvZoom -win $_nWave2 51490.445412 51596.472403
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 2
wvScrollUp -win $_nWave2 2
wvScrollUp -win $_nWave2 2
wvScrollUp -win $_nWave2 4
wvScrollUp -win $_nWave2 4
wvScrollUp -win $_nWave2 4
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 4
wvScrollUp -win $_nWave2 4
wvScrollUp -win $_nWave2 3
wvScrollUp -win $_nWave2 3
wvScrollUp -win $_nWave2 2
wvScrollUp -win $_nWave2 4
wvScrollUp -win $_nWave2 2
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 4
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 2
wvSelectSignal -win $_nWave2 {( "G1" 1 )} 
wvSelectSignal -win $_nWave2 {( "G1" 1 2 )} 
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
wvSetPosition -win $_nWave2 {("G1" 24)}
wvSetPosition -win $_nWave2 {("G1" 25)}
wvSetPosition -win $_nWave2 {("G1" 26)}
wvSetPosition -win $_nWave2 {("G1" 27)}
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
wvSetPosition -win $_nWave2 {("G1" 46)}
wvSetPosition -win $_nWave2 {("G1" 47)}
wvSetPosition -win $_nWave2 {("G1" 48)}
wvSetPosition -win $_nWave2 {("G1" 49)}
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
wvSetPosition -win $_nWave2 {("G2" 24)}
wvSetPosition -win $_nWave2 {("G2" 23)}
wvSetPosition -win $_nWave2 {("G2" 22)}
wvSetPosition -win $_nWave2 {("G2" 21)}
wvSetPosition -win $_nWave2 {("G2" 20)}
wvSetPosition -win $_nWave2 {("G2" 21)}
wvSetPosition -win $_nWave2 {("G2" 22)}
wvSetPosition -win $_nWave2 {("G2" 23)}
wvSetPosition -win $_nWave2 {("G2" 24)}
wvSetPosition -win $_nWave2 {("G2" 25)}
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSetPosition -win $_nWave2 {("G3" 1)}
wvSetPosition -win $_nWave2 {("G3" 2)}
wvSetPosition -win $_nWave2 {("G3" 3)}
wvSetPosition -win $_nWave2 {("G3" 2)}
wvSetPosition -win $_nWave2 {("G3" 1)}
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSetPosition -win $_nWave2 {("G2" 25)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G2" 27)}
wvSetPosition -win $_nWave2 {("G2" 27)}
wvSetPosition -win $_nWave2 {("G2" 27)}
wvSetPosition -win $_nWave2 {("G2" 27)}
wvZoom -win $_nWave2 51477.735490 51662.763753
wvZoom -win $_nWave2 51498.104320 51623.598184
wvSelectSignal -win $_nWave2 {( "G2" 25 26 27 )} 
wvSelectSignal -win $_nWave2 {( "G2" 22 25 26 27 )} 
wvSelectSignal -win $_nWave2 {( "G2" 19 )} 
wvSelectSignal -win $_nWave2 {( "G2" 20 )} 
srcDeselectAll -win $_nTrace1
debReload
wvSelectSignal -win $_nWave2 {( "G2" 20 )} 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvScrollUp -win $_nWave2 14
wvSelectSignal -win $_nWave2 {( "G2" 3 )} 
wvSelectSignal -win $_nWave2 {( "G2" 3 4 )} 
wvZoom -win $_nWave2 51539.920155 51582.014144
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvSetCursor -win $_nWave2 51552.982198 -snap {("G2" 3)}
wvSetCursor -win $_nWave2 51553.215449 -snap {("G2" 2)}
srcDeselectAll -win $_nTrace1
debReload
wvScrollUp -win $_nWave2 26
wvSelectSignal -win $_nWave2 {( "G1" 22 )} 
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
wvZoom -win $_nWave2 6074.178057 16539.822682
wvZoom -win $_nWave2 7465.988942 9862.996576
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 21 22 )} 
wvZoom -win $_nWave2 0.000000 4596.675286
wvZoom -win $_nWave2 0.000000 466.969229
wvSetCursor -win $_nWave2 155.771413 -snap {("G1" 21)}
wvSetCursor -win $_nWave2 195.619914 -snap {("G1" 21)}
wvSetCursor -win $_nWave2 374.334403 -snap {("G1" 21)}
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 19 )} 
wvZoom -win $_nWave2 95.222392 460.931578
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 16 19 )} 
wvZoom -win $_nWave2 62.685283 328.557348
wvSelectSignal -win $_nWave2 {( "G1" 16 )} 
wvSetPosition -win $_nWave2 {("G1" 16)}
wvSetPosition -win $_nWave2 {("G1" 17)}
wvSetPosition -win $_nWave2 {("G1" 18)}
wvSetPosition -win $_nWave2 {("G1" 19)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 19)}
wvSetPosition -win $_nWave2 {("G1" 19)}
wvSetPosition -win $_nWave2 {("G1" 19)}
wvSetPosition -win $_nWave2 {("G1" 19)}
wvSelectSignal -win $_nWave2 {( "G1" 18 19 )} 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 10780.242987 14501.469721
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 21793.165866 27333.801256
wvZoom -win $_nWave2 24089.653826 24711.875163
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
srcDeselectAll -win $_nTrace1
wvZoom -win $_nWave2 0.000000 5314.905800
wvZoom -win $_nWave2 0.000000 669.517133
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
wvZoom -win $_nWave2 16724.510528 28790.783155
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
srcDeselectAll -win $_nTrace1
debReload
wvSelectSignal -win $_nWave2 {( "G1" 8 )} 
wvSelectAll -win $_nWave2
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 0)}
wvSetPosition -win $_nWave2 {("G1" 0)}
wvSetPosition -win $_nWave2 {("G1" 0)}
wvSetPosition -win $_nWave2 {("G1" 0)}
wvSelectGroup -win $_nWave2 {G7}
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 0)}
wvSetPosition -win $_nWave2 {("G1" 0)}
wvSetPosition -win $_nWave2 {("G1" 0)}
wvSetPosition -win $_nWave2 {("G1" 0)}
wvSelectGroup -win $_nWave2 {G6}
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 0)}
wvSetPosition -win $_nWave2 {("G1" 0)}
wvSetPosition -win $_nWave2 {("G1" 0)}
wvSetPosition -win $_nWave2 {("G1" 0)}
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 0)}
wvSetPosition -win $_nWave2 {("G1" 0)}
wvSetPosition -win $_nWave2 {("G1" 0)}
wvSetPosition -win $_nWave2 {("G1" 0)}
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 0)}
wvSetPosition -win $_nWave2 {("G1" 0)}
wvSetPosition -win $_nWave2 {("G1" 0)}
wvSetPosition -win $_nWave2 {("G1" 0)}
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 0)}
wvSetPosition -win $_nWave2 {("G1" 0)}
wvSetPosition -win $_nWave2 {("G1" 0)}
wvSetPosition -win $_nWave2 {("G1" 0)}
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 0)}
wvSetPosition -win $_nWave2 {("G1" 0)}
wvSetPosition -win $_nWave2 {("G1" 0)}
wvSetPosition -win $_nWave2 {("G1" 0)}
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 0)}
wvSetPosition -win $_nWave2 {("G1" 0)}
srcHBSelect "tb_DandRiscvSimple.u_DandRiscvSimple.dCache_1" -win $_nTrace1
srcSetScope -win $_nTrace1 "tb_DandRiscvSimple.u_DandRiscvSimple.dCache_1" -delim \
           "."
srcHBSelect "tb_DandRiscvSimple.u_DandRiscvSimple.dCache_1" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "cpu_cmd_valid" -line 5238 -pos 1 -win $_nTrace1
srcSelect -signal "cpu_cmd_ready" -line 5239 -pos 1 -win $_nTrace1
srcSelect -signal "cpu_cmd_payload_addr" -line 5240 -pos 1 -win $_nTrace1
srcSelect -signal "cpu_cmd_payload_wen" -line 5241 -pos 1 -win $_nTrace1
srcSelect -signal "cpu_cmd_payload_wdata" -line 5242 -pos 1 -win $_nTrace1
srcSelect -signal "cpu_cmd_payload_wstrb" -line 5243 -pos 1 -win $_nTrace1
srcSelect -signal "cpu_rsp_valid" -line 5244 -pos 1 -win $_nTrace1
srcSelect -signal "cpu_rsp_payload_data" -line 5245 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvZoom -win $_nWave2 0.000000 4309.383081
srcDeselectAll -win $_nTrace1
srcSearchString "is_hit" -win $_nTrace1 -next -case
srcDeselectAll -win $_nTrace1
srcSelect -signal "is_hit" -line 6917 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
srcDeselectAll -win $_nTrace1
wvZoom -win $_nWave2 0.000000 6033.136313
wvZoom -win $_nWave2 2168.541423 3291.814678
wvZoom -win $_nWave2 2359.833987 2800.927253
wvZoom -win $_nWave2 2419.309067 2611.747614
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
debReload
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 9 )} 
wvZoom -win $_nWave2 1897.229384 3758.061082
wvZoom -win $_nWave2 2287.680956 2627.951251
wvZoom -win $_nWave2 2388.115372 2489.932491
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 2702.010741 3058.276624
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 2788.543736 3702.437453
wvZoom -win $_nWave2 3201.433287 3401.969995
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
wvZoom -win $_nWave2 33962.042852 39605.282601
wvZoom -win $_nWave2 36184.316059 37401.771550
wvZoom -win $_nWave2 36544.110811 36898.958385
wvSetCursor -win $_nWave2 36588.810856 -snap {("G1" 1)}
wvSelectSignal -win $_nWave2 {( "G1" 2 )} 
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
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
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 33346.416697 40036.220909
wvZoom -win $_nWave2 36059.902115 37522.910645
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
srcDeselectAll -win $_nTrace1
srcSearchString "hit_id" -win $_nTrace1 -next -case
srcDeselectAll -win $_nTrace1
srcSelect -signal "hit_id" -line 6911 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
srcDeselectAll -win $_nTrace1
srcSelect -signal "hit_id" -line 6911 -pos 1 -win $_nTrace1
srcAction -pos 6910 9 4 -win $_nTrace1 -name "hit_id" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "_zz_hit_id_1" -line 10132 -pos 1 -win $_nTrace1
srcAction -pos 10131 8 7 -win $_nTrace1 -name "_zz_hit_id_1" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "cache_hit_gnt_2" -line 10131 -pos 1 -win $_nTrace1
srcAction -pos 10130 8 3 -win $_nTrace1 -name "cache_hit_gnt_2" -ctrlKey off
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 0.000000 9419.080163
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 0.000000 8721.370521
wvZoom -win $_nWave2 0.000000 1040.636379
wvZoom -win $_nWave2 202.207143 514.359614
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 34125.287680 39055.151904
wvSetCursor -win $_nWave2 38851.182641 -snap {("G1" 3)}
wvSetCursor -win $_nWave2 38426.853729 -snap {("G1" 6)}
wvZoom -win $_nWave2 38508.805665 38980.484584
wvZoom -win $_nWave2 38934.309884 38975.083016
wvZoom -win $_nWave2 38972.130842 38974.284724
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
srcDeselectAll -win $_nTrace1
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
debExit
