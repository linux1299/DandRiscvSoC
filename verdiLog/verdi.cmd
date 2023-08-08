debImport "./simWorkspace/tb_DandRiscvSmallest/tb_DandRiscvSmallest.fsdb" "-f" \
          "./hw/verilog/tb/tb_DandRiscvSmallest.f" "-sv" "-v2k"
wvCreateWindow
wvSetPosition -win $_nWave2 {("G1" 0)}
wvOpenFile -win $_nWave2 \
           {/home/lin/SpinalProjects/DandRiscvSoC/simWorkspace/tb_DandRiscvSmallest/tb_DandRiscvSmallest.fsdb}
wvRestoreSignal -win $_nWave2 \
           "/home/lin/SpinalProjects/DandRiscvSoC/simWorkspace/tb_DandRiscvSimple/DandRiscvSimple_debug_total.rc" \
           -overWriteAutoAlias on -appendSignals on
wvScrollDown -win $_nWave2 9
wvSelectSignal -win $_nWave2 {( "G4" 2 )} 
wvSelectSignal -win $_nWave2 {( "G4" 3 )} 
wvSelectSignal -win $_nWave2 {( "G4" 6 )} 
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 910.393889 944.081356
wvSetCursor -win $_nWave2 919.012923 -snap {("G4" 6)}
wvSetCursor -win $_nWave2 921.003376 -snap {("G4" 6)}
wvSetCursor -win $_nWave2 923.294273 -snap {("G4" 6)}
wvSetCursor -win $_nWave2 921.228710 -snap {("G4" 6)}
wvSetCursor -win $_nWave2 923.144051 -snap {("G4" 6)}
wvSelectSignal -win $_nWave2 {( "G4" 1 )} 
wvSetCursor -win $_nWave2 917.041249 -snap {("G4" 1)}
srcActiveTrace "tb_DandRiscvSmallest.u_DandRiscvSimple.fetch_arbitration_isValid" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 917000 -TraceValue 1
srcDeselectAll -win $_nTrace1
srcSelect -signal "ICachePlugin_icache_access_rsp_valid" -line 1150 -pos 1 -win \
          $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "ICachePlugin_icache_access_rsp_valid" -line 1150 -pos 1 -win \
          $_nTrace1
srcAction -pos 1149 13 18 -win $_nTrace1 -name \
          "ICachePlugin_icache_access_rsp_valid" -ctrlKey off
srcBackwardHistory -win $_nTrace1
srcHBSelect "tb_DandRiscvSmallest.u_DandRiscvSimple" -win $_nTrace1
srcHBSelect "tb_DandRiscvSmallest.u_DandRiscvSimple" -win $_nTrace1
srcDeselectAll -win $_nTrace1
debReload
wvSelectSignal -win $_nWave2 {( "G4" 1 )} 
wvSelectSignal -win $_nWave2 {( "G4" 1 2 )} 
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
srcDeselectAll -win $_nTrace1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSetCursor -win $_nWave2 923.012606 -snap {("G4" 2)}
srcActiveTrace "tb_DandRiscvSmallest.u_DandRiscvSimple.pc\[63:0\]" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 921000 -TraceValue \
           0000000000000000000000000000000010000000000000000000001001111000
wvSetCursor -win $_nWave2 922.956272 -snap {("G4" 1)}
srcActiveTrace "tb_DandRiscvSmallest.u_DandRiscvSimple.fetch_arbitration_isValid" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 917000 -TraceValue 1
srcDeselectAll -win $_nTrace1
srcSelect -signal "fetch_FetchPlugin_pc_out_stream_valid" -line 1139 -pos 1 -win \
          $_nTrace1
srcSelect -signal "ICachePlugin_icache_access_rsp_valid" -line 1139 -pos 1 -win \
          $_nTrace1
srcSelect -signal "fetch_arbitration_isStuck" -line 1139 -pos 1 -win $_nTrace1
srcSelect -signal "fetch_FetchPlugin_fetch_flush" -line 1139 -pos 1 -win \
          $_nTrace1
wvSetPosition -win $_nWave2 {("G2" 4)}
wvSetPosition -win $_nWave2 {("G2" 3)}
wvSetPosition -win $_nWave2 {("G2" 9)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G4" 16)}
wvSetPosition -win $_nWave2 {("G4" 17)}
wvSetPosition -win $_nWave2 {("G4" 18)}
wvSetPosition -win $_nWave2 {("G6" 0)}
wvSetPosition -win $_nWave2 {("G6" 1)}
wvSetPosition -win $_nWave2 {("G6" 2)}
wvSetPosition -win $_nWave2 {("G6" 3)}
wvSetPosition -win $_nWave2 {("G6" 4)}
wvSetPosition -win $_nWave2 {("G6" 5)}
wvSetPosition -win $_nWave2 {("G6" 7)}
wvSetPosition -win $_nWave2 {("G6" 8)}
wvSetPosition -win $_nWave2 {("G6" 9)}
wvSetPosition -win $_nWave2 {("G6" 8)}
wvSetPosition -win $_nWave2 {("G6" 7)}
wvSetPosition -win $_nWave2 {("G6" 6)}
wvSetPosition -win $_nWave2 {("G6" 5)}
wvSetPosition -win $_nWave2 {("G6" 4)}
wvSetPosition -win $_nWave2 {("G6" 3)}
wvSetPosition -win $_nWave2 {("G6" 2)}
wvSetPosition -win $_nWave2 {("G6" 1)}
wvSetPosition -win $_nWave2 {("G6" 0)}
wvSetPosition -win $_nWave2 {("G4" 18)}
wvAddSignal -win $_nWave2 \
           "/tb_DandRiscvSmallest/u_DandRiscvSimple/fetch_FetchPlugin_pc_out_stream_valid" \
           "/tb_DandRiscvSmallest/u_DandRiscvSimple/ICachePlugin_icache_access_rsp_valid" \
           "/tb_DandRiscvSmallest/u_DandRiscvSimple/fetch_arbitration_isStuck" \
           "/tb_DandRiscvSmallest/u_DandRiscvSimple/fetch_FetchPlugin_fetch_flush"
wvSetPosition -win $_nWave2 {("G4" 18)}
wvSetPosition -win $_nWave2 {("G4" 22)}
wvSetPosition -win $_nWave2 {("G4" 18)}
wvSetPosition -win $_nWave2 {("G4" 22)}
wvSetPosition -win $_nWave2 {("G4" 22)}
wvSetPosition -win $_nWave2 {("G4" 22)}
wvSetPosition -win $_nWave2 {("G4" 22)}
wvSelectSignal -win $_nWave2 {( "G4" 11 )} 
wvSelectSignal -win $_nWave2 {( "G4" 12 )} 
wvSelectSignal -win $_nWave2 {( "G4" 11 )} 
wvSelectSignal -win $_nWave2 {( "G4" 10 )} 
wvSelectSignal -win $_nWave2 {( "G4" 11 )} 
wvSelectSignal -win $_nWave2 {( "G4" 6 )} 
wvSelectSignal -win $_nWave2 {( "G4" 2 )} 
wvSelectSignal -win $_nWave2 {( "G4" 6 )} 
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
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
wvSelectSignal -win $_nWave2 {( "G2" 3 )} 
wvSelectSignal -win $_nWave2 {( "G2" 4 )} 
wvSelectSignal -win $_nWave2 {( "G2" 2 )} 
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSelectSignal -win $_nWave2 {( "G2" 7 )} 
wvSelectSignal -win $_nWave2 {( "G2" 1 7 )} 
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSetCursor -win $_nWave2 920.879442 -snap {("G4" 2)}
wvSetCursor -win $_nWave2 923.132784 -snap {("G4" 2)}
wvSetCursor -win $_nWave2 921.386444 -snap {("G4" 2)}
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
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSetCursor -win $_nWave2 923.057673 -snap {("G4" 11)}
wvSetCursor -win $_nWave2 924.879124 -snap {("G4" 11)}
wvSelectSignal -win $_nWave2 {( "G4" 11 )} 
wvSelectSignal -win $_nWave2 {( "G4" 12 )} 
wvSelectSignal -win $_nWave2 {( "G4" 11 )} 
wvSelectSignal -win $_nWave2 {( "G3" 2 )} 
wvSelectSignal -win $_nWave2 {( "G3" 3 )} 
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G4" 22 )} 
wvSelectSignal -win $_nWave2 {( "G4" 21 )} 
wvSelectSignal -win $_nWave2 {( "G4" 6 )} 
wvSetCursor -win $_nWave2 927.094911 -snap {("G4" 6)}
wvScrollUp -win $_nWave2 1
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
wvSetMarker -win $_nWave2 929.000000
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
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
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G4" 6 )} {( "G7" 1 )} 
wvScrollUp -win $_nWave2 1
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
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G4" 6 )} {( "G6" 8 )} {( "G7" 1 )} 
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G4" 1 6 )} {( "G6" 8 )} {( "G7" 1 )} 
wvSetCursor -win $_nWave2 924.954236 -snap {("G4" 6)}
srcActiveTrace "tb_DandRiscvSmallest.u_DandRiscvSimple.fetch_PC\[63:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 923000 -TraceValue \
           0000000000000000000000000000000010000000000000000000001001111100
srcDeselectAll -win $_nTrace1
srcSelect -signal "fetch_FetchPlugin_pc_out_stream_payload" -line 975 -pos 1 -win \
          $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "fetch_FetchPlugin_pc_out_stream_payload" -line 975 -pos 1 -win \
          $_nTrace1
srcAction -pos 974 12 23 -win $_nTrace1 -name \
          "fetch_FetchPlugin_pc_out_stream_payload" -ctrlKey off
srcBackwardHistory -win $_nTrace1
srcHBSelect "tb_DandRiscvSmallest.u_DandRiscvSimple" -win $_nTrace1
srcHBSelect "tb_DandRiscvSmallest.u_DandRiscvSimple" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "pc" -line 975 -pos 1 -win $_nTrace1
srcAction -pos 974 16 0 -win $_nTrace1 -name "pc" -ctrlKey off
wvSelectSignal -win $_nWave2 {( "G4" 10 )} 
srcDeselectAll -win $_nTrace1
srcBackwardHistory -win $_nTrace1
srcHBSelect "tb_DandRiscvSmallest.u_DandRiscvSimple" -win $_nTrace1
srcHBSelect "tb_DandRiscvSmallest.u_DandRiscvSimple" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "fetch_FetchPlugin_pc_out_stream_valid" -line 975 -pos 1 -win \
          $_nTrace1
wvSetPosition -win $_nWave2 {("G3" 2)}
wvSetPosition -win $_nWave2 {("G3" 1)}
wvSetPosition -win $_nWave2 {("G4" 0)}
wvSetPosition -win $_nWave2 {("G4" 4)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G4" 19)}
wvSetPosition -win $_nWave2 {("G4" 20)}
wvSetPosition -win $_nWave2 {("G4" 21)}
wvSetPosition -win $_nWave2 {("G4" 22)}
wvAddSignal -win $_nWave2 \
           "/tb_DandRiscvSmallest/u_DandRiscvSimple/fetch_FetchPlugin_pc_out_stream_valid"
wvSetPosition -win $_nWave2 {("G4" 22)}
wvSetPosition -win $_nWave2 {("G4" 23)}
wvSetPosition -win $_nWave2 {("G4" 22)}
wvSetPosition -win $_nWave2 {("G4" 23)}
wvSetPosition -win $_nWave2 {("G4" 23)}
wvSetPosition -win $_nWave2 {("G4" 23)}
wvSetPosition -win $_nWave2 {("G4" 23)}
wvSelectSignal -win $_nWave2 {( "G4" 19 23 )} 
wvSelectSignal -win $_nWave2 {( "G4" 23 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G6" 0)}
wvSetPosition -win $_nWave2 {("G4" 22)}
wvSetPosition -win $_nWave2 {("G4" 22)}
wvSetPosition -win $_nWave2 {("G4" 22)}
wvSetPosition -win $_nWave2 {("G4" 22)}
wvSelectSignal -win $_nWave2 {( "G4" 18 )} 
wvSelectSignal -win $_nWave2 {( "G4" 19 )} 
wvSetCursor -win $_nWave2 926.963466 -snap {("G4" 19)}
wvSelectSignal -win $_nWave2 {( "G4" 15 )} 
wvSelectSignal -win $_nWave2 {( "G4" 14 )} 
wvSelectSignal -win $_nWave2 {( "G4" 11 14 )} 
wvSelectSignal -win $_nWave2 {( "G4" 1 11 14 )} 
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
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
wvSelectSignal -win $_nWave2 {( "G4" 1 11 14 )} {( "G6" 6 )} 
wvScrollUp -win $_nWave2 1
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
wvSelectSignal -win $_nWave2 {( "G4" 1 11 14 )} {( "G6" 6 8 )} 
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvSetCursor -win $_nWave2 922.926228 -snap {("G4" 1)}
srcActiveTrace "tb_DandRiscvSmallest.u_DandRiscvSimple.fetch_arbitration_isValid" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 917000 -TraceValue 1
wvSelectSignal -win $_nWave2 {( "G4" 14 )} 
wvSetCursor -win $_nWave2 926.907132 -snap {("G4" 14)}
srcActiveTrace \
           "tb_DandRiscvSmallest.u_DandRiscvSimple.fetch_FetchPlugin_pc_FIFO.io_pop_valid" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 0 -TraceValue 0
wvScrollUp -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G4" 3 )} 
wvSelectSignal -win $_nWave2 {( "G4" 2 )} 
wvSelectSignal -win $_nWave2 {( "G4" 3 )} 
wvSelectSignal -win $_nWave2 {( "G4" 1 )} 
wvSetCursor -win $_nWave2 924.916680 -snap {("G4" 1)}
srcActiveTrace "tb_DandRiscvSmallest.u_DandRiscvSimple.fetch_arbitration_isValid" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 923000 -TraceValue 0
srcDeselectAll -win $_nTrace1
srcSelect -signal "fetch_arbitration_isStuck" -line 1139 -pos 1 -win $_nTrace1
srcAction -pos 1138 21 9 -win $_nTrace1 -name "fetch_arbitration_isStuck" \
          -ctrlKey off
srcBackwardHistory -win $_nTrace1
srcHBSelect "tb_DandRiscvSmallest.u_DandRiscvSimple" -win $_nTrace1
srcHBSelect "tb_DandRiscvSmallest.u_DandRiscvSimple" -win $_nTrace1
srcSearchString "fetch_state" -win $_nTrace1 -next -case
wvSetPosition -win $_nWave2 {("G3" 3)}
wvSetPosition -win $_nWave2 {("G4" 0)}
wvSetPosition -win $_nWave2 {("G4" 1)}
wvAddSignal -win $_nWave2 \
           "/tb_DandRiscvSmallest/u_DandRiscvSimple/fetch_state\[1:0\]"
wvSetPosition -win $_nWave2 {("G4" 1)}
wvSetPosition -win $_nWave2 {("G4" 2)}
wvSetPosition -win $_nWave2 {("G4" 1)}
wvSetPosition -win $_nWave2 {("G4" 2)}
wvSetPosition -win $_nWave2 {("G4" 2)}
wvSetPosition -win $_nWave2 {("G4" 2)}
wvSetPosition -win $_nWave2 {("G4" 2)}
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
srcDeselectAll -win $_nTrace1
debReload
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 0.000000 288.427811
wvZoom -win $_nWave2 36.013283 178.941000
wvZoom -win $_nWave2 57.524143 114.408419
wvScrollUp -win $_nWave2 10
wvScrollDown -win $_nWave2 3
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G4" 1 )} 
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 54.638709 -snap {("G4" 1)}
wvZoom -win $_nWave2 43.350637 103.469135
wvSelectSignal -win $_nWave2 {( "G4" 1 3 )} 
wvZoom -win $_nWave2 50.287386 85.808907
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G4" 1 3 9 )} 
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G4" 1 3 8 9 )} 
wvSelectSignal -win $_nWave2 {( "G4" 1 3 9 )} 
wvSelectSignal -win $_nWave2 {( "G4" 1 3 8 9 )} 
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
srcDeselectAll -win $_nTrace1
debReload
wvScrollUp -win $_nWave2 4
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 54.425623 88.838334
wvSelectSignal -win $_nWave2 {( "G3" 1 )} 
wvSelectSignal -win $_nWave2 {( "G4" 1 )} 
wvSelectSignal -win $_nWave2 {( "G4" 1 2 )} 
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 47.193967 84.752544
wvSelectSignal -win $_nWave2 {( "G4" 1 2 3 )} 
wvScrollDown -win $_nWave2 2
wvScrollDown -win $_nWave2 3
wvScrollDown -win $_nWave2 9
wvSelectSignal -win $_nWave2 {( "G6" 8 )} 
wvSelectSignal -win $_nWave2 {( "G6" 7 8 )} 
wvSelectSignal -win $_nWave2 {( "G6" 6 7 8 )} 
wvSetCursor -win $_nWave2 56.866243 -snap {("G6" 6)}
wvZoom -win $_nWave2 53.474665 75.415239
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G4" 3 )} 
wvZoom -win $_nWave2 48.937345 76.185727
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 49.165174 79.117131
wvSetCursor -win $_nWave2 60.985679 -snap {("G4" 3)}
srcActiveTrace "tb_DandRiscvSmallest.u_DandRiscvSimple.pc_next\[63:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 59000 -TraceValue \
           0000000000000000000000000000000010000000000000000000000000010000
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvScrollDown -win $_nWave2 6
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G4" 3 )} {( "G7" 16 )} 
wvSelectSignal -win $_nWave2 {( "G4" 3 )} {( "G7" 16 17 )} 
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 52.220474 83.341125
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
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
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSetMarker -win $_nWave2 65.000000
wvZoom -win $_nWave2 51.960268 84.156437
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
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvSetCursor -win $_nWave2 59.103008 -snap {("G4" 4)}
wvSetCursor -win $_nWave2 59.013275 -snap {("G4" 3)}
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G4" 3 )} {( "G7" 2 16 17 )} 
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
srcDeselectAll -win $_nTrace1
debReload
wvScrollDown -win $_nWave2 0
wvSelectSignal -win $_nWave2 {( "G7" 2 )} 
wvSetCursor -win $_nWave2 75.003680 -snap {("G7" 1)}
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 68.273711 91.783735
wvZoomOut -win $_nWave2
wvSetSearchMode -win $_nWave2 -value 
wvScrollUp -win $_nWave2 5
wvSelectSignal -win $_nWave2 {( "G4" 6 )} 
wvSetSearchMode -win $_nWave2 -value 800000180
wvSearchPrev -win $_nWave2
wvSearchPrev -win $_nWave2
tfgGenerate -incr -ref "tb_DandRiscvSmallest.u_DandRiscvSimple.fetch_PC\[63:0\]#75#T" -startWithStmt -schFG
tfgNodeTraceActTrans -win $_tFlowView3 -folder "group_0#T" "tb_DandRiscvSmallest.u_DandRiscvSimple.fetch_PC\[63:0\]" -stopLevel 10
tfgCloseViewer -win $_tFlowView3
wvSetSearchMode -win $_nWave2 -value 80000180
wvSearchPrev -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchPrev -win $_nWave2
wvSearchPrev -win $_nWave2
wvSearchPrev -win $_nWave2
wvSearchPrev -win $_nWave2
wvSearchPrev -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 96.241700 147.402865
wvSelectSignal -win $_nWave2 {( "G4" 1 6 )} 
wvZoom -win $_nWave2 104.312274 126.328115
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 112.890352 -snap {("G4" 1)}
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 107.073458 139.324088
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 108.277913 139.953281
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G4" 3 )} 
wvSelectSignal -win $_nWave2 {( "G4" 3 10 )} 
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
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G4" 15)}
wvSetPosition -win $_nWave2 {("G4" 15)}
wvSetPosition -win $_nWave2 {("G4" 15)}
wvSetPosition -win $_nWave2 {("G4" 15)}
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvSetCursor -win $_nWave2 115.004956 -snap {("G4" 14)}
srcActiveTrace "tb_DandRiscvSmallest.u_DandRiscvSimple.pc_next\[63:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 109000 -TraceValue \
           0000000000000000000000000000000010000000000000000000000110000000
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G4" 4 )} 
wvSelectSignal -win $_nWave2 {( "G4" 9 )} 
wvSetPosition -win $_nWave2 {("G4" 9)}
wvSetPosition -win $_nWave2 {("G4" 10)}
wvSetPosition -win $_nWave2 {("G4" 11)}
wvSetPosition -win $_nWave2 {("G4" 12)}
wvSetPosition -win $_nWave2 {("G4" 13)}
wvSetPosition -win $_nWave2 {("G4" 14)}
wvSetPosition -win $_nWave2 {("G4" 15)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G4" 15)}
wvSetPosition -win $_nWave2 {("G4" 15)}
wvSetPosition -win $_nWave2 {("G4" 15)}
wvSetPosition -win $_nWave2 {("G4" 15)}
wvSelectSignal -win $_nWave2 {( "G4" 4 15 )} 
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvSetCursor -win $_nWave2 109.072446 -snap {("G4" 13)}
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 102.786809 136.121868
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
srcDeselectAll -win $_nTrace1
srcSelect -signal "int_en_reg" -line 2736 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G4" 16 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G6" 0)}
wvSetPosition -win $_nWave2 {("G4" 15)}
wvSetPosition -win $_nWave2 {("G4" 15)}
wvSetPosition -win $_nWave2 {("G4" 15)}
wvSetPosition -win $_nWave2 {("G4" 15)}
wvSetCursor -win $_nWave2 108.993002 -snap {("G4" 13)}
srcActiveTrace "tb_DandRiscvSmallest.u_DandRiscvSimple.pc_next\[63:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 107000 -TraceValue \
           0000000000000000000000000000000010000000000000000000000101111000
srcDeselectAll -win $_nTrace1
srcSelect -signal "when_FetchPlugin_l119" -line 2729 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
srcDeselectAll -win $_nTrace1
srcSelect -signal "when_FetchPlugin_l119" -line 2729 -pos 1 -win $_nTrace1
srcAction -pos 2728 3 11 -win $_nTrace1 -name "when_FetchPlugin_l119" -ctrlKey \
          off
wvScrollUp -win $_nWave2 4
wvSelectSignal -win $_nWave2 {( "G4" 2 )} 
wvSelectSignal -win $_nWave2 {( "G4" 14 )} 
wvSelectSignal -win $_nWave2 {( "G4" 15 )} 
wvSelectSignal -win $_nWave2 {( "G4" 16 )} 
wvSelectSignal -win $_nWave2 {( "G4" 15 )} 
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G4" 12 15 )} 
wvSetCursor -win $_nWave2 108.881514 -snap {("G4" 15)}
srcActiveTrace \
           "tb_DandRiscvSmallest.u_DandRiscvSimple.ICachePlugin_icache_access_rsp_valid" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 83000 -TraceValue 1
srcDeselectAll -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G4" 12 )} 
wvSelectSignal -win $_nWave2 {( "G4" 1 )} 
wvSetCursor -win $_nWave2 112.969425 -snap {("G4" 1)}
srcActiveTrace "tb_DandRiscvSmallest.u_DandRiscvSimple.fetch_arbitration_isValid" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 107000 -TraceValue 0
srcDeselectAll -win $_nTrace1
srcSelect -signal "fetch_FetchPlugin_fifo_all_valid" -line 1161 -pos 1 -win \
          $_nTrace1
srcSelect -signal "fetch_arbitration_isStuck" -line 1161 -pos 1 -win $_nTrace1
srcSelect -signal "fetch_FetchPlugin_fetch_flush" -line 1161 -pos 1 -win \
          $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "fetch_FetchPlugin_fifo_all_valid" -line 1161 -pos 1 -win \
          $_nTrace1
srcSelect -signal "fetch_arbitration_isStuck" -line 1161 -pos 1 -win $_nTrace1
srcSelect -signal "fetch_FetchPlugin_fetch_flush" -line 1161 -pos 1 -win \
          $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G4" 1 )} 
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G6" 2 )} 
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G6" 6 )} 
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvSetCursor -win $_nWave2 111.167028 -snap {("G4" 15)}
wvSetCursor -win $_nWave2 113.062332 -snap {("G4" 17)}
wvSetMarker -win $_nWave2 115.000000
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G6" 6 8 )} 
wvScrollUp -win $_nWave2 3
wvScrollUp -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G4" 5 )} {( "G6" 6 8 )} 
wvSelectSignal -win $_nWave2 {( "G4" 5 )} 
wvSetCursor -win $_nWave2 118.934059 -snap {("G4" 5)}
srcActiveTrace "tb_DandRiscvSmallest.u_DandRiscvSimple.fetch_PC\[63:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 111000 -TraceValue \
           0000000000000000000000000000000010000000000000000000000110000000
srcDeselectAll -win $_nTrace1
srcSelect -signal "fetch_FetchPlugin_pc_out_stream_payload" -line 988 -pos 1 -win \
          $_nTrace1
srcAction -pos 987 7 16 -win $_nTrace1 -name \
          "fetch_FetchPlugin_pc_out_stream_payload" -ctrlKey off
srcHBSelect \
           "tb_DandRiscvSmallest.u_DandRiscvSimple.fetch_FetchPlugin_pc_stream_fifo" \
           -win $_nTrace1
srcSetScope -win $_nTrace1 \
           "tb_DandRiscvSmallest.u_DandRiscvSimple.fetch_FetchPlugin_pc_stream_fifo" \
           -delim "."
srcHBSelect \
           "tb_DandRiscvSmallest.u_DandRiscvSimple.fetch_FetchPlugin_pc_stream_fifo" \
           -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "ports_m_ports_payload" -line 8167 -pos 1 -win $_nTrace1
srcAction -pos 8166 9 9 -win $_nTrace1 -name "ports_m_ports_payload" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "_zz_ports_m_ports_payload" -line 8219 -pos 1 -win $_nTrace1
srcAction -pos 8218 7 7 -win $_nTrace1 -name "_zz_ports_m_ports_payload" -ctrlKey \
          off
srcDeselectAll -win $_nTrace1
srcSelect -signal "fifo_ram_0" -line 8193 -pos 1 -win $_nTrace1
srcSelect -signal "fifo_ram_1" -line 8194 -pos 1 -win $_nTrace1
srcSelect -signal "fifo_ram_2" -line 8195 -pos 1 -win $_nTrace1
srcSelect -signal "fifo_ram_3" -line 8196 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
srcDeselectAll -win $_nTrace1
srcSelect -signal "read_addr" -line 8192 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvSetCursor -win $_nWave2 110.981214 -snap {("G4" 15)}
wvSetCursor -win $_nWave2 113.025169 -snap {("G4" 1)}
wvSelectSignal -win $_nWave2 {( "G4" 5 24 )} 
wvSetCursor -win $_nWave2 109.048746 -snap {("G4" 13)}
wvSelectSignal -win $_nWave2 {( "G4" 13 )} 
wvSelectSignal -win $_nWave2 {( "G4" 14 )} 
wvSelectSignal -win $_nWave2 {( "G4" 13 )} 
wvSetCursor -win $_nWave2 108.955839 -snap {("G4" 13)}
srcActiveTrace "tb_DandRiscvSmallest.u_DandRiscvSimple.pc_next\[63:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 107000 -TraceValue \
           0000000000000000000000000000000010000000000000000000000101111000
srcDeselectAll -win $_nTrace1
srcSelect -signal "fetch_BPU_BRANCH_TAKEN" -line 2732 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "ICachePlugin_icache_access_cmd_fire_1" -line 2735 -pos 1 -win \
          $_nTrace1
wvSetPosition -win $_nWave2 {("G3" 1)}
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSetPosition -win $_nWave2 {("G2" 10)}
wvSetPosition -win $_nWave2 {("G2" 9)}
wvSetPosition -win $_nWave2 {("G2" 8)}
wvSetPosition -win $_nWave2 {("G2" 7)}
wvSetPosition -win $_nWave2 {("G2" 6)}
wvSetPosition -win $_nWave2 {("G2" 7)}
wvSetPosition -win $_nWave2 {("G2" 8)}
wvSetPosition -win $_nWave2 {("G2" 9)}
wvSetPosition -win $_nWave2 {("G4" 15)}
wvSetPosition -win $_nWave2 {("G4" 12)}
wvSetPosition -win $_nWave2 {("G4" 13)}
wvAddSignal -win $_nWave2 \
           "/tb_DandRiscvSmallest/u_DandRiscvSimple/ICachePlugin_icache_access_cmd_fire_1"
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
wvScrollDown -win $_nWave2 1
srcDeselectAll -win $_nTrace1
srcSelect -signal "int_en_reg" -line 2736 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave2 {("G3" 1)}
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSetPosition -win $_nWave2 {("G2" 10)}
wvSetPosition -win $_nWave2 {("G2" 9)}
wvSetPosition -win $_nWave2 {("G2" 10)}
wvSetPosition -win $_nWave2 {("G3" 1)}
wvSetPosition -win $_nWave2 {("G3" 2)}
wvSetPosition -win $_nWave2 {("G3" 3)}
wvSetPosition -win $_nWave2 {("G4" 0)}
wvSetPosition -win $_nWave2 {("G4" 15)}
wvSetPosition -win $_nWave2 {("G4" 14)}
wvAddSignal -win $_nWave2 "/tb_DandRiscvSmallest/u_DandRiscvSimple/int_en_reg"
wvSetPosition -win $_nWave2 {("G4" 14)}
wvSetPosition -win $_nWave2 {("G4" 15)}
wvSetPosition -win $_nWave2 {("G4" 14)}
wvSetPosition -win $_nWave2 {("G4" 15)}
wvSetPosition -win $_nWave2 {("G4" 15)}
wvSetPosition -win $_nWave2 {("G4" 15)}
wvSetPosition -win $_nWave2 {("G4" 15)}
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G4" 15 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G4" 15)}
wvSetPosition -win $_nWave2 {("G4" 14)}
wvSetPosition -win $_nWave2 {("G4" 14)}
wvSetPosition -win $_nWave2 {("G4" 14)}
wvSetPosition -win $_nWave2 {("G4" 14)}
wvSetCursor -win $_nWave2 114.920474 -snap {("G4" 13)}
srcActiveTrace "tb_DandRiscvSmallest.u_DandRiscvSimple.pc_next\[63:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 109000 -TraceValue \
           0000000000000000000000000000000010000000000000000000000110000000
wvSetCursor -win $_nWave2 109.141653 -snap {("G4" 13)}
srcActiveTrace "tb_DandRiscvSmallest.u_DandRiscvSimple.pc_next\[63:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 109000 -TraceValue \
           0000000000000000000000000000000010000000000000000000000110000000
srcDeselectAll -win $_nTrace1
srcSelect -signal "when_FetchPlugin_l119" -line 2729 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
srcDeselectAll -win $_nTrace1
srcSelect -signal "fetch_BPU_BRANCH_TAKEN" -line 2732 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
srcDeselectAll -win $_nTrace1
srcSelect -signal "fetch_BPU_BRANCH_TAKEN" -line 2732 -pos 1 -win $_nTrace1
srcAction -pos 2731 3 9 -win $_nTrace1 -name "fetch_BPU_BRANCH_TAKEN" -ctrlKey \
          off
srcBackwardHistory -win $_nTrace1
srcHBSelect "tb_DandRiscvSmallest.u_DandRiscvSimple" -win $_nTrace1
srcHBSelect "tb_DandRiscvSmallest.u_DandRiscvSimple" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "fetch_BPU_PC_NEXT" -line 2733 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
srcDeselectAll -win $_nTrace1
debReload
