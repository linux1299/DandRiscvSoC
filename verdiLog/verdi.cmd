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
srcDeselectAll -win $_nTrace1
debReload
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 8.919079 390.655675
wvZoom -win $_nWave2 18.068842 211.490561
wvZoom -win $_nWave2 40.494548 155.965374
wvZoom -win $_nWave2 52.080250 89.476320
wvScrollUp -win $_nWave2 15
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSelectSignal -win $_nWave2 {( "G2" 7 )} 
wvSelectSignal -win $_nWave2 {( "G2" 2 7 )} 
wvSelectSignal -win $_nWave2 {( "G2" 1 2 7 )} 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoom -win $_nWave2 59.721149 86.048483
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 62.964371 -snap {("G2" 6)}
wvSetCursor -win $_nWave2 63.228525 -snap {("G2" 3)}
wvScrollDown -win $_nWave2 3
wvSelectSignal -win $_nWave2 {( "G4" 5 )} 
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvSetCursor -win $_nWave2 86.973021 -snap {("G4" 5)}
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 98.654491 121.900030
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 64.563626 154.850646
wvSelectSignal -win $_nWave2 {( "G4" 3 )} 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoom -win $_nWave2 110.317251 175.843282
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 59.901166 246.033081
wvZoom -win $_nWave2 95.073250 160.541053
wvSetCursor -win $_nWave2 118.902946 -snap {("G4" 5)}
wvSetCursor -win $_nWave2 115.144204 -snap {("G4" 5)}
wvSetCursor -win $_nWave2 119.632799 -snap {("G4" 5)}
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 26
wvScrollDown -win $_nWave2 8
wvSelectSignal -win $_nWave2 {( "G7" 17 )} 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 72.839317 123.637077
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 93.780480 172.044142
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 76.199513 193.115128
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 54.237104 155.120811
wvZoom -win $_nWave2 62.953366 137.182181
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 87.717440 181.724056
wvScrollUp -win $_nWave2 27
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 30.182726 295.539192
wvZoom -win $_nWave2 44.382403 190.816574
wvZoom -win $_nWave2 87.888207 158.085190
wvZoom -win $_nWave2 109.487279 134.960097
wvZoomOut -win $_nWave2
wvScrollDown -win $_nWave2 27
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G7" 16 17 )} 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvScrollUp -win $_nWave2 31
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G4" 13 )} 
wvZoom -win $_nWave2 39.302140 141.534185
wvZoom -win $_nWave2 60.272816 128.598470
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G4" 5 )} 
wvZoom -win $_nWave2 112.488240 127.646328
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSetMarker -win $_nWave2 119.000000
wvZoom -win $_nWave2 113.949973 140.345663
wvZoomOut -win $_nWave2
wvScrollDown -win $_nWave2 30
wvSetCursor -win $_nWave2 123.587196 -snap {("G7" 2)}
wvZoom -win $_nWave2 120.085426 137.594273
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G4" 5 )} {( "G7" 17 )} 
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G7" 16 )} 
wvSetCursor -win $_nWave2 134.695651 -snap {("G7" 16)}
srcActiveTrace \
           "tb_DandRiscvSmallest.u_DandRiscvSimple.execute_REDIRECT_PC_NEXT\[63:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 89000 -TraceValue \
           0000000000000000000000000000000000000000000000000000000000000000
srcDeselectAll -win $_nTrace1
srcSelect -signal "execute_ALUPlugin_redirect_pc_next" -line 941 -pos 1 -win \
          $_nTrace1
srcAction -pos 940 7 14 -win $_nTrace1 -name "execute_ALUPlugin_redirect_pc_next" \
          -ctrlKey off
wvScrollDown -win $_nWave2 3
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G7" 18 )} 
wvSetMarker -win $_nWave2 123.000000
wvSelectSignal -win $_nWave2 {( "G7" 18 )} 
wvSelectSignal -win $_nWave2 {( "G7" 18 )} 
wvSetCursor -win $_nWave2 134.812767 -snap {("G7" 18)}
srcActiveTrace \
           "tb_DandRiscvSmallest.u_DandRiscvSimple.execute_ALUPlugin_branch_or_jump" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 89000 -TraceValue 0
srcDeselectAll -win $_nTrace1
srcSelect -signal "execute_ALUPlugin_branch_or_jalr" -line 1954 -pos 1 -win \
          $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "execute_ALUPlugin_jal" -line 1954 -pos 1 -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G7" 19 )} 
wvSelectSignal -win $_nWave2 {( "G7" 19 20 )} 
wvSelectSignal -win $_nWave2 {( "G7" 19 20 21 )} 
wvSelectSignal -win $_nWave2 {( "G7" 19 20 21 22 )} 
wvSelectSignal -win $_nWave2 {( "G7" 19 20 21 22 23 )} 
wvSelectSignal -win $_nWave2 {( "G7" 19 20 21 22 23 24 )} 
wvSelectSignal -win $_nWave2 {( "G7" 19 20 21 22 23 24 25 )} 
wvSelectSignal -win $_nWave2 {( "G7" 19 20 21 22 23 24 25 26 )} 
wvSelectSignal -win $_nWave2 {( "G7" 19 20 21 22 23 24 25 26 27 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G4" 17)}
wvSetPosition -win $_nWave2 {("G4" 17)}
wvSetPosition -win $_nWave2 {("G4" 17)}
wvSetPosition -win $_nWave2 {("G4" 17)}
wvSetPosition -win $_nWave2 {("G6" 4)}
wvSetPosition -win $_nWave2 {("G6" 5)}
wvSetPosition -win $_nWave2 {("G7" 2)}
wvSetPosition -win $_nWave2 {("G7" 3)}
wvSetPosition -win $_nWave2 {("G4" 15)}
wvSetPosition -win $_nWave2 {("G7" 18)}
wvAddSignal -win $_nWave2 \
           "/tb_DandRiscvSmallest/u_DandRiscvSimple/execute_ALUPlugin_jal"
wvSetPosition -win $_nWave2 {("G7" 18)}
wvSetPosition -win $_nWave2 {("G7" 19)}
wvSetPosition -win $_nWave2 {("G7" 18)}
wvSetPosition -win $_nWave2 {("G7" 19)}
wvSetPosition -win $_nWave2 {("G7" 19)}
wvSetPosition -win $_nWave2 {("G7" 19)}
wvSetPosition -win $_nWave2 {("G7" 19)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "execute_ALUPlugin_jal" -line 1954 -pos 1 -win $_nTrace1
srcAction -pos 1953 12 10 -win $_nTrace1 -name "execute_ALUPlugin_jal" -ctrlKey \
          off
wvSelectSignal -win $_nWave2 {( "G7" 19 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G8" 0)}
wvSetPosition -win $_nWave2 {("G7" 18)}
wvSetPosition -win $_nWave2 {("G7" 18)}
wvSetPosition -win $_nWave2 {("G7" 18)}
wvSetPosition -win $_nWave2 {("G7" 18)}
wvSelectSignal -win $_nWave2 {( "G7" 11 )} 
wvScrollUp -win $_nWave2 9
wvSelectSignal -win $_nWave2 {( "G6" 9 )} 
wvSetMarker -win $_nWave2 121.000000
wvSelectSignal -win $_nWave2 {( "G6" 7 )} 
wvSelectSignal -win $_nWave2 {( "G6" 6 )} 
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G4" 22 )} 
wvSelectSignal -win $_nWave2 {( "G4" 21 )} 
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
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
wvZoom -win $_nWave2 32.167870 148.815437
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 37.712145 153.579461
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSetCursor -win $_nWave2 55.085784 -snap {("G4" 21)}
srcActiveTrace \
           "tb_DandRiscvSmallest.u_DandRiscvSimple.fetch_FetchPlugin_fifo_all_valid" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 0 -TraceValue 0
srcDeselectAll -win $_nTrace1
srcSelect -signal "fetch_FetchPlugin_pc_out_stream_valid" -line 1092 -pos 1 -win \
          $_nTrace1
srcSelect -signal "fetch_FetchPlugin_instruction_out_stream_valid" -line 1092 \
          -pos 1 -win $_nTrace1
srcSelect -signal "fetch_FetchPlugin_pc_stream_fifo_next_valid" -line 1092 -pos 1 \
          -win $_nTrace1
wvSetPosition -win $_nWave2 {("G2" 10)}
wvSetPosition -win $_nWave2 {("G2" 9)}
wvSetPosition -win $_nWave2 {("G4" 0)}
wvSetPosition -win $_nWave2 {("G4" 2)}
wvSetPosition -win $_nWave2 {("G4" 4)}
wvSetPosition -win $_nWave2 {("G4" 6)}
wvSetPosition -win $_nWave2 {("G4" 10)}
wvSetPosition -win $_nWave2 {("G4" 11)}
wvSetPosition -win $_nWave2 {("G4" 15)}
wvSetPosition -win $_nWave2 {("G4" 27)}
wvSetPosition -win $_nWave2 {("G4" 28)}
wvAddSignal -win $_nWave2 \
           "/tb_DandRiscvSmallest/u_DandRiscvSimple/fetch_FetchPlugin_pc_out_stream_valid" \
           "/tb_DandRiscvSmallest/u_DandRiscvSimple/fetch_FetchPlugin_instruction_out_stream_valid" \
           "/tb_DandRiscvSmallest/u_DandRiscvSimple/fetch_FetchPlugin_pc_stream_fifo_next_valid"
wvSetPosition -win $_nWave2 {("G4" 28)}
wvSetPosition -win $_nWave2 {("G4" 31)}
wvSetPosition -win $_nWave2 {("G4" 28)}
wvSetPosition -win $_nWave2 {("G4" 31)}
wvSetPosition -win $_nWave2 {("G4" 31)}
wvSetPosition -win $_nWave2 {("G4" 31)}
wvSetPosition -win $_nWave2 {("G4" 31)}
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
srcDeselectAll -win $_nTrace1
srcSelect -signal "fetch_FetchPlugin_pc_stream_fifo_next_valid" -line 1092 -pos 1 \
          -win $_nTrace1
srcAction -pos 1091 18 14 -win $_nTrace1 -name \
          "fetch_FetchPlugin_pc_stream_fifo_next_valid" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "fifo_cnt" -line 8237 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvScrollUp -win $_nWave2 12
wvSelectSignal -win $_nWave2 {( "G4" 1 )} 
wvSelectSignal -win $_nWave2 {( "G4" 1 5 )} 
wvZoom -win $_nWave2 47.658392 117.023775
wvZoom -win $_nWave2 57.092703 83.733031
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 51.137981 90.697531
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
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
wvSetCursor -win $_nWave2 71.028011 -snap {("G4" 32)}
srcActiveTrace \
           "tb_DandRiscvSmallest.u_DandRiscvSimple.fetch_FetchPlugin_pc_stream_fifo.fifo_cnt\[1:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 69000 -TraceValue 11
srcDeselectAll -win $_nTrace1
srcSelect -signal "flush" -line 8251 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G4" 33 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G6" 0)}
wvSetPosition -win $_nWave2 {("G4" 32)}
wvSetPosition -win $_nWave2 {("G4" 32)}
wvSetPosition -win $_nWave2 {("G4" 32)}
wvSetPosition -win $_nWave2 {("G4" 32)}
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
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
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G4" 1 )} 
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G4" 32 )} 
srcDeselectAll -win $_nTrace1
srcSelect -signal "write_ptr" -line 8252 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G4" 32 )} 
wvSetCursor -win $_nWave2 74.961915 -snap {("G4" 33)}
srcActiveTrace \
           "tb_DandRiscvSmallest.u_DandRiscvSimple.fetch_FetchPlugin_pc_stream_fifo.write_ptr\[2:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 73000 -TraceValue 011
srcDeselectAll -win $_nTrace1
srcSelect -signal "ports_s_ports_fire" -line 8254 -pos 1 -win $_nTrace1
srcAction -pos 8253 3 10 -win $_nTrace1 -name "ports_s_ports_fire" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "ports_s_ports_valid" -line 8226 -pos 1 -win $_nTrace1
srcAction -pos 8225 8 12 -win $_nTrace1 -name "ports_s_ports_valid" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "ICachePlugin_icache_access_cmd_fire_2" -line 1143 -pos 1 -win \
          $_nTrace1
srcAction -pos 1142 7 10 -win $_nTrace1 -name \
          "ICachePlugin_icache_access_cmd_fire_2" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "ICachePlugin_icache_access_cmd_valid" -line 1142 -pos 1 -win \
          $_nTrace1
srcSelect -signal "ICachePlugin_icache_access_cmd_ready" -line 1142 -pos 1 -win \
          $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G4" 34 )} 
wvSelectSignal -win $_nWave2 {( "G4" 34 35 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G6" 1)}
wvSetPosition -win $_nWave2 {("G4" 33)}
wvSetPosition -win $_nWave2 {("G4" 33)}
wvSetPosition -win $_nWave2 {("G4" 33)}
wvSetPosition -win $_nWave2 {("G4" 33)}
wvSetCursor -win $_nWave2 75.017610 -snap {("G4" 33)}
srcActiveTrace \
           "tb_DandRiscvSmallest.u_DandRiscvSimple.fetch_FetchPlugin_pc_stream_fifo.write_ptr\[2:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 73000 -TraceValue 011
srcDeselectAll -win $_nTrace1
srcSelect -signal "ports_s_ports_fire" -line 8254 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSetCursor -win $_nWave2 74.929406 -snap {("G4" 34)}
srcActiveTrace \
           "tb_DandRiscvSmallest.u_DandRiscvSimple.fetch_FetchPlugin_pc_stream_fifo.ports_s_ports_fire" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 67000 -TraceValue 1
srcDeselectAll -win $_nTrace1
srcSelect -signal "ports_s_ports_valid" -line 8226 -pos 1 -win $_nTrace1
srcSelect -signal "ports_s_ports_ready" -line 8226 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvSetCursor -win $_nWave2 74.929406 -snap {("G4" 36)}
srcActiveTrace \
           "tb_DandRiscvSmallest.u_DandRiscvSimple.fetch_FetchPlugin_pc_stream_fifo.ports_s_ports_ready" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 0 -TraceValue 1
srcDeselectAll -win $_nTrace1
srcSelect -signal "fifo_full" -line 8227 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G4" 32 )} 
wvSetCursor -win $_nWave2 75.061712 -snap {("G4" 37)}
srcActiveTrace \
           "tb_DandRiscvSmallest.u_DandRiscvSimple.fetch_FetchPlugin_pc_stream_fifo.fifo_full" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 0 -TraceValue 0
srcDeselectAll -win $_nTrace1
srcSelect -signal "read_addr" -line 8223 -pos 1 -win $_nTrace1
srcSelect -signal "write_addr" -line 8223 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
srcDeselectAll -win $_nTrace1
srcSelect -signal "read_ptr\[2\]" -line 8223 -pos 1 -win $_nTrace1
srcSelect -signal "write_ptr\[2\]" -line 8223 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G4" 38 40 41 )} 
wvSelectSignal -win $_nWave2 {( "G4" 38 39 40 41 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G6" 3)}
wvSetPosition -win $_nWave2 {("G4" 37)}
wvSetPosition -win $_nWave2 {("G4" 37)}
wvSetPosition -win $_nWave2 {("G4" 37)}
wvSetPosition -win $_nWave2 {("G4" 37)}
wvSelectSignal -win $_nWave2 {( "G4" 32 )} 
wvSelectSignal -win $_nWave2 {( "G4" 35 )} 
wvSelectSignal -win $_nWave2 {( "G4" 34 )} 
wvSelectSignal -win $_nWave2 {( "G4" 37 )} 
wvSelectSignal -win $_nWave2 {( "G4" 32 )} 
wvSelectSignal -win $_nWave2 {( "G4" 33 )} 
srcDeselectAll -win $_nTrace1
srcSelect -signal "read_ptr\[2\]" -line 8223 -pos 1 -win $_nTrace1
srcAction -pos 8222 19 2 -win $_nTrace1 -name "read_ptr\[2\]" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "read_ptr" -line 8245 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvSetCursor -win $_nWave2 67.255647 -snap {("G4" 38)}
srcActiveTrace \
           "tb_DandRiscvSmallest.u_DandRiscvSimple.fetch_FetchPlugin_pc_stream_fifo.read_ptr\[2:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 67000 -TraceValue 000
wvSetCursor -win $_nWave2 76.958101 -snap {("G4" 38)}
srcActiveTrace \
           "tb_DandRiscvSmallest.u_DandRiscvSimple.fetch_FetchPlugin_pc_stream_fifo.read_ptr\[2:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 67000 -TraceValue 000
wvSelectSignal -win $_nWave2 {( "G4" 33 )} 
srcDeselectAll -win $_nTrace1
srcSelect -signal "flush" -line 8244 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvSetCursor -win $_nWave2 67.211545 -snap {("G4" 35)}
wvSelectSignal -win $_nWave2 {( "G4" 36 )} 
wvSelectSignal -win $_nWave2 {( "G4" 35 )} 
wvSelectSignal -win $_nWave2 {( "G4" 36 )} 
srcDeselectAll -win $_nTrace1
srcSelect -signal "read_ptr" -line 8245 -pos 1 -win $_nTrace1
srcAction -pos 8244 1 2 -win $_nTrace1 -name "read_ptr" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "ports_m_ports_fire" -line 8247 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSetCursor -win $_nWave2 65.315156 -snap {("G4" 40)}
srcActiveTrace \
           "tb_DandRiscvSmallest.u_DandRiscvSimple.fetch_FetchPlugin_pc_stream_fifo.ports_m_ports_fire" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 65000 -TraceValue 0
srcDeselectAll -win $_nTrace1
srcSelect -signal "ports_m_ports_valid" -line 8224 -pos 1 -win $_nTrace1
srcSelect -signal "ports_m_ports_ready" -line 8224 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSetCursor -win $_nWave2 65.491564 -snap {("G4" 42)}
srcActiveTrace \
           "tb_DandRiscvSmallest.u_DandRiscvSimple.fetch_FetchPlugin_pc_stream_fifo.ports_m_ports_ready" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 65000 -TraceValue 0
srcDeselectAll -win $_nTrace1
srcSelect -signal "fetch_arbitration_isFiring" -line 1145 -pos 1 -win $_nTrace1
srcAction -pos 1144 7 11 -win $_nTrace1 -name "fetch_arbitration_isFiring" \
          -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "fetch_arbitration_isValid" -line 2681 -pos 1 -win $_nTrace1
srcSelect -signal "fetch_arbitration_isStuck" -line 2681 -pos 1 -win $_nTrace1
srcSelect -signal "fetch_arbitration_removeIt" -line 2681 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSetCursor -win $_nWave2 65.182850 -snap {("G4" 43)}
srcActiveTrace "tb_DandRiscvSmallest.u_DandRiscvSimple.fetch_arbitration_isValid" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 65000 -TraceValue 0
srcDeselectAll -win $_nTrace1
srcSelect -signal "fetch_FetchPlugin_fifo_all_valid" -line 1163 -pos 1 -win \
          $_nTrace1
srcSelect -signal "fetch_arbitration_isStuck" -line 1163 -pos 1 -win $_nTrace1
srcSelect -signal "fetch_FetchPlugin_fetch_flush" -line 1163 -pos 1 -win \
          $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSetCursor -win $_nWave2 67.079238 -snap {("G4" 46)}
srcActiveTrace \
           "tb_DandRiscvSmallest.u_DandRiscvSimple.fetch_FetchPlugin_fifo_all_valid" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 55000 -TraceValue 1
srcDeselectAll -win $_nTrace1
srcSelect -signal "fetch_FetchPlugin_pc_out_stream_valid" -line 1092 -pos 1 -win \
          $_nTrace1
srcSelect -signal "fetch_FetchPlugin_instruction_out_stream_valid" -line 1092 \
          -pos 1 -win $_nTrace1
srcSelect -signal "fetch_FetchPlugin_pc_stream_fifo_next_valid" -line 1092 -pos 1 \
          -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSetCursor -win $_nWave2 71.048424 -snap {("G4" 51)}
srcActiveTrace \
           "tb_DandRiscvSmallest.u_DandRiscvSimple.fetch_FetchPlugin_pc_stream_fifo_next_valid" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 55000 -TraceValue 1
srcDeselectAll -win $_nTrace1
srcSelect -signal "fifo_cnt" -line 8237 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
srcDeselectAll -win $_nTrace1
debReload
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G4" 32 )} 
wvSelectSignal -win $_nWave2 {( "G4" 32 33 )} 
wvSelectSignal -win $_nWave2 {( "G4" 32 33 34 )} 
wvSelectSignal -win $_nWave2 {( "G4" 32 33 34 35 )} 
wvSelectSignal -win $_nWave2 {( "G4" 32 33 34 35 36 )} 
wvSelectSignal -win $_nWave2 {( "G4" 32 33 34 35 36 37 )} 
wvSelectSignal -win $_nWave2 {( "G4" 32 33 34 35 36 37 38 )} 
wvSelectSignal -win $_nWave2 {( "G4" 32 33 34 35 36 37 38 40 )} 
wvSelectSignal -win $_nWave2 {( "G4" 32 33 34 35 36 37 38 40 41 )} 
wvSelectSignal -win $_nWave2 {( "G4" 32 33 34 35 36 37 38 39 40 41 )} 
wvSelectSignal -win $_nWave2 {( "G4" 32 33 34 35 36 37 38 39 40 )} 
wvSelectSignal -win $_nWave2 {( "G4" 32 33 34 35 36 37 38 39 40 41 )} 
wvSelectSignal -win $_nWave2 {( "G4" 32 33 34 35 36 37 38 39 40 41 43 )} 
wvSelectSignal -win $_nWave2 {( "G4" 32 33 34 35 36 37 38 39 40 41 )} 
wvSelectSignal -win $_nWave2 {( "G4" 32 33 34 35 36 37 38 39 40 41 42 )} 
wvSelectSignal -win $_nWave2 {( "G4" 32 33 34 35 36 37 38 39 40 41 42 43 )} 
wvSelectSignal -win $_nWave2 {( "G4" 32 33 34 35 36 37 38 39 40 41 42 43 44 )} \
           
wvSelectSignal -win $_nWave2 {( "G4" 32 33 34 35 36 37 38 39 40 41 42 43 44 45 \
           )} 
wvSelectSignal -win $_nWave2 {( "G4" 32 33 34 35 36 37 38 39 40 41 42 43 44 45 \
           46 )} 
wvSelectSignal -win $_nWave2 {( "G4" 32 33 34 35 36 37 38 39 40 41 42 43 44 45 \
           46 47 )} 
wvSelectSignal -win $_nWave2 {( "G4" 32 33 34 35 36 37 38 39 40 41 42 43 44 45 \
           46 47 48 )} 
wvSelectSignal -win $_nWave2 {( "G4" 32 33 34 35 36 37 38 39 40 41 42 43 44 45 \
           46 47 48 49 )} 
wvSelectSignal -win $_nWave2 {( "G4" 32 33 34 35 36 37 38 39 40 41 42 43 44 45 \
           46 47 48 49 50 )} 
wvSelectSignal -win $_nWave2 {( "G4" 32 33 34 35 36 37 38 39 40 41 42 43 44 45 \
           46 47 48 49 50 51 )} 
wvSelectSignal -win $_nWave2 {( "G4" 32 33 34 35 36 37 38 39 40 41 42 43 44 45 \
           46 47 48 49 50 51 52 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G7" 7)}
wvSetPosition -win $_nWave2 {("G4" 31)}
wvSetPosition -win $_nWave2 {("G4" 31)}
wvSetPosition -win $_nWave2 {("G4" 31)}
wvSetPosition -win $_nWave2 {("G4" 31)}
wvSelectSignal -win $_nWave2 {( "G4" 31 )} 
wvScrollUp -win $_nWave2 18
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvScrollUp -win $_nWave2 4
wvSelectSignal -win $_nWave2 {( "G4" 2 )} 
srcDeselectAll -win $_nTrace1
debReload
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvScrollDown -win $_nWave2 24
wvSelectSignal -win $_nWave2 {( "G7" 2 )} 
wvSetSearchMode -win $_nWave2 -value 800000f4
wvSearchNext -win $_nWave2
wvSearchPrev -win $_nWave2
wvSearchPrev -win $_nWave2
wvSearchNext -win $_nWave2
wvZoom -win $_nWave2 218.393419 342.584830
wvZoom -win $_nWave2 251.829568 287.965530
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 252.937415 272.959236
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G7" 5 )} 
wvSelectSignal -win $_nWave2 {( "G7" 5 6 )} 
wvSelectSignal -win $_nWave2 {( "G7" 5 6 7 )} 
wvSelectSignal -win $_nWave2 {( "G7" 5 6 7 8 )} 
wvSelectSignal -win $_nWave2 {( "G7" 5 6 7 8 9 )} 
wvSelectSignal -win $_nWave2 {( "G7" 5 6 7 8 9 10 )} 
wvSelectSignal -win $_nWave2 {( "G7" 5 6 7 8 9 10 11 )} 
wvSelectSignal -win $_nWave2 {( "G7" 5 6 7 8 9 10 11 12 )} 
wvSelectSignal -win $_nWave2 {( "G7" 5 6 7 8 9 10 11 12 13 )} 
wvSelectSignal -win $_nWave2 {( "G7" 5 6 7 8 9 10 11 12 13 14 )} 
wvSelectSignal -win $_nWave2 {( "G7" 5 6 7 8 9 10 11 12 13 14 15 )} 
wvSelectSignal -win $_nWave2 {( "G7" 5 6 7 8 9 10 11 12 13 14 15 18 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G4" 31)}
wvSetPosition -win $_nWave2 {("G4" 31)}
wvSetPosition -win $_nWave2 {("G4" 31)}
wvSetPosition -win $_nWave2 {("G4" 31)}
wvSelectSignal -win $_nWave2 {( "G7" 2 )} 
wvSetCursor -win $_nWave2 258.952890 -snap {("G7" 2)}
srcActiveTrace "tb_DandRiscvSmallest.u_DandRiscvSimple.execute_PC\[63:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 257000 -TraceValue \
           0000000000000000000000000000000010000000000000000000000011110000
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "execute_ALU_CTRL" -line 1031 -pos 1 -win $_nTrace1
srcTraceLoad "tb_DandRiscvSmallest.u_DandRiscvSimple.execute_ALU_CTRL\[4:0\]" \
           -win $_nTrace1
srcBackwardHistory -win $_nTrace1
srcHBSelect "tb_DandRiscvSmallest.u_DandRiscvSimple" -win $_nTrace1
srcHBSelect "tb_DandRiscvSmallest.u_DandRiscvSimple" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "execute_ALU_CTRL" -line 1031 -pos 1 -win $_nTrace1
srcSearchString "execute_ALU_R" -win $_nTrace1 -next -case
srcDeselectAll -win $_nTrace1
srcSelect -signal "execute_ALU_RESULT" -line 2899 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave2 {("G4" 29)}
wvSetPosition -win $_nWave2 {("G4" 28)}
wvSetPosition -win $_nWave2 {("G4" 31)}
wvSetPosition -win $_nWave2 {("G6" 0)}
wvSetPosition -win $_nWave2 {("G6" 1)}
wvSetPosition -win $_nWave2 {("G6" 2)}
wvSetPosition -win $_nWave2 {("G6" 3)}
wvSetPosition -win $_nWave2 {("G6" 4)}
wvSetPosition -win $_nWave2 {("G4" 15)}
wvSetPosition -win $_nWave2 {("G7" 5)}
wvSetPosition -win $_nWave2 {("G7" 6)}
wvAddSignal -win $_nWave2 \
           "/tb_DandRiscvSmallest/u_DandRiscvSimple/execute_ALU_RESULT\[63:0\]"
wvSetPosition -win $_nWave2 {("G7" 6)}
wvSetPosition -win $_nWave2 {("G7" 7)}
wvSetPosition -win $_nWave2 {("G7" 6)}
wvSetPosition -win $_nWave2 {("G7" 7)}
wvSetPosition -win $_nWave2 {("G7" 7)}
wvSetPosition -win $_nWave2 {("G7" 7)}
wvSetPosition -win $_nWave2 {("G7" 7)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "execute_ALU_RESULT" -line 2899 -pos 1 -win $_nTrace1
srcAction -pos 2898 5 5 -win $_nTrace1 -name "execute_ALU_RESULT" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "execute_ALUPlugin_alu_result" -line 951 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
srcDeselectAll -win $_nTrace1
srcSelect -signal "execute_ALUPlugin_alu_result" -line 951 -pos 1 -win $_nTrace1
srcAction -pos 950 7 9 -win $_nTrace1 -name "execute_ALUPlugin_alu_result" \
          -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "execute_ALUPlugin_add_result" -line 2124 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvSetMarker -win $_nWave2 259.000000
wvSetCursor -win $_nWave2 259.053334 -snap {("G7" 9)}
srcActiveTrace \
           "tb_DandRiscvSmallest.u_DandRiscvSimple.execute_ALUPlugin_add_result\[63:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 259000 -TraceValue \
           1111111111111111111111111111111101111111111111111111111111111111
srcSearchString "execute_ALU_W" -win $_nTrace1 -next -case
srcDeselectAll -win $_nTrace1
srcSelect -signal "execute_ALU_WORD" -line 2118 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
srcDeselectAll -win $_nTrace1
srcSelect -signal "execute_ALU_WORD" -line 2118 -pos 1 -win $_nTrace1
srcAction -pos 2117 8 5 -win $_nTrace1 -name "execute_ALU_WORD" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "decode_to_execute_ALU_WORD" -line 1013 -pos 1 -win $_nTrace1
srcAction -pos 1012 7 13 -win $_nTrace1 -name "decode_to_execute_ALU_WORD" \
          -ctrlKey off
wvScrollUp -win $_nWave2 13
wvScrollUp -win $_nWave2 15
wvScrollDown -win $_nWave2 16
wvScrollDown -win $_nWave2 2
srcDeselectAll -win $_nTrace1
srcSelect -signal "decode_ALU_WORD" -line 2842 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave2 {("G4" 17)}
wvSetPosition -win $_nWave2 {("G4" 16)}
wvSetPosition -win $_nWave2 {("G4" 17)}
wvSetPosition -win $_nWave2 {("G4" 15)}
wvSetPosition -win $_nWave2 {("G6" 8)}
wvSetPosition -win $_nWave2 {("G6" 9)}
wvSetPosition -win $_nWave2 {("G6" 10)}
wvSetPosition -win $_nWave2 {("G6" 11)}
wvSetPosition -win $_nWave2 {("G6" 12)}
wvAddSignal -win $_nWave2 \
           "/tb_DandRiscvSmallest/u_DandRiscvSimple/decode_ALU_WORD"
wvSetPosition -win $_nWave2 {("G6" 12)}
wvSetPosition -win $_nWave2 {("G6" 13)}
wvSetPosition -win $_nWave2 {("G6" 12)}
wvSetPosition -win $_nWave2 {("G6" 13)}
wvSetPosition -win $_nWave2 {("G6" 13)}
wvSetPosition -win $_nWave2 {("G6" 13)}
wvSetPosition -win $_nWave2 {("G6" 13)}
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G6" 8 13 )} 
srcDeselectAll -win $_nTrace1
srcSelect -signal "decode_ALU_WORD" -line 2842 -pos 1 -win $_nTrace1
srcAction -pos 2841 5 6 -win $_nTrace1 -name "decode_ALU_WORD" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "decode_DecodePlugin_alu_word" -line 972 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "decode_DecodePlugin_alu_word" -line 972 -pos 1 -win $_nTrace1
srcAction -pos 971 7 7 -win $_nTrace1 -name "decode_DecodePlugin_alu_word" \
          -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "decode_INSTRUCTION\[6 : 0\]" -line 1171 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
srcDeselectAll -win $_nTrace1
debReload
wvScrollDown -win $_nWave2 3
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G7" 9 )} 
wvSetCursor -win $_nWave2 259.019852 -snap {("G7" 9)}
srcActiveTrace \
           "tb_DandRiscvSmallest.u_DandRiscvSimple.execute_ALUPlugin_add_result\[63:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 257000 -TraceValue \
           1111111111111111111111111111111110000000000000000000000000000000
wvSelectSignal -win $_nWave2 {( "G7" 9 )} 
wvSetCursor -win $_nWave2 258.952890 -snap {("G7" 9)}
srcActiveTrace \
           "tb_DandRiscvSmallest.u_DandRiscvSimple.execute_ALUPlugin_add_result\[63:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 257000 -TraceValue \
           1111111111111111111111111111111110000000000000000000000000000000
wvSetCursor -win $_nWave2 259.008692 -snap {("G7" 9)}
srcActiveTrace \
           "tb_DandRiscvSmallest.u_DandRiscvSimple.execute_ALUPlugin_add_result\[63:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 257000 -TraceValue \
           1111111111111111111111111111111110000000000000000000000000000000
wvSelectSignal -win $_nWave2 {( "G7" 8 )} 
wvSetCursor -win $_nWave2 258.941729 -snap {("G7" 8)}
wvSetCursor -win $_nWave2 259.019852 -snap {("G7" 8)}
srcActiveTrace \
           "tb_DandRiscvSmallest.u_DandRiscvSimple.execute_ALUPlugin_alu_result\[63:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 257000 -TraceValue \
           1111111111111111111111111111111110000000000000000000000000000000
wvSelectSignal -win $_nWave2 {( "G7" 8 9 )} 
wvSelectSignal -win $_nWave2 {( "G7" 8 )} 
wvSelectSignal -win $_nWave2 {( "G7" 9 )} 
wvSelectSignal -win $_nWave2 {( "G7" 9 10 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G6" 14)}
wvSetPosition -win $_nWave2 {("G6" 14)}
wvSetPosition -win $_nWave2 {("G6" 14)}
wvSetPosition -win $_nWave2 {("G6" 14)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "execute_ALUPlugin_addw_result" -line 2122 -pos 1 -win \
          $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvSetPosition -win $_nWave2 {("G7" 0)}
wvSetPosition -win $_nWave2 {("G7" 1)}
wvSetPosition -win $_nWave2 {("G7" 2)}
wvSetPosition -win $_nWave2 {("G7" 3)}
wvSetPosition -win $_nWave2 {("G7" 4)}
wvSetPosition -win $_nWave2 {("G7" 5)}
wvSetPosition -win $_nWave2 {("G7" 6)}
wvSetPosition -win $_nWave2 {("G7" 7)}
wvSetPosition -win $_nWave2 {("G7" 8)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G7" 9)}
wvSetPosition -win $_nWave2 {("G7" 9)}
wvSetPosition -win $_nWave2 {("G7" 9)}
wvSetPosition -win $_nWave2 {("G7" 9)}
srcDeselectAll -win $_nTrace1
debReload
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 39.284732 229.279984
wvZoom -win $_nWave2 51.252103 101.345612
wvZoom -win $_nWave2 54.993759 77.136542
wvScrollUp -win $_nWave2 3
wvSelectSignal -win $_nWave2 {( "G7" 7 )} 
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G7" 8 )} 
wvSelectSignal -win $_nWave2 {( "G7" 8 9 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G8" 1)}
wvSetPosition -win $_nWave2 {("G7" 7)}
wvSetPosition -win $_nWave2 {("G7" 7)}
wvSetPosition -win $_nWave2 {("G7" 7)}
wvSetPosition -win $_nWave2 {("G7" 7)}
wvSelectSignal -win $_nWave2 {( "G7" 7 )} 
wvSetCursor -win $_nWave2 58.968104 -snap {("G7" 7)}
srcActiveTrace \
           "tb_DandRiscvSmallest.u_DandRiscvSimple.execute_ALU_RESULT\[63:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 1000 -TraceValue \
           0000000000000000000000000000000000000000000000000000000000000000
srcDeselectAll -win $_nTrace1
srcSelect -signal "execute_ALUPlugin_alu_result" -line 951 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvSetCursor -win $_nWave2 59.005133 -snap {("G7" 8)}
srcActiveTrace \
           "tb_DandRiscvSmallest.u_DandRiscvSimple.execute_ALUPlugin_alu_result\[63:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 1000 -TraceValue \
           0000000000000000000000000000000000000000000000000000000000000000
srcDeselectAll -win $_nTrace1
srcSelect -signal "execute_IMM" -line 2161 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G6" 12 )} 
wvSetCursor -win $_nWave2 57.054988 -snap {("G6" 12)}
srcActiveTrace "tb_DandRiscvSmallest.u_DandRiscvSimple.decode_IMM\[63:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 57000 -TraceValue \
           1111111111111111111111111111111111111111000000010000000000000000
srcDeselectAll -win $_nTrace1
srcSelect -signal "decode_DecodePlugin_imm" -line 979 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave2 {("G4" 20)}
wvSetPosition -win $_nWave2 {("G4" 25)}
wvSetPosition -win $_nWave2 {("G4" 27)}
wvSetPosition -win $_nWave2 {("G4" 29)}
wvSetPosition -win $_nWave2 {("G4" 30)}
wvSetPosition -win $_nWave2 {("G7" 0)}
wvSetPosition -win $_nWave2 {("G6" 12)}
wvSetPosition -win $_nWave2 {("G6" 13)}
wvSetPosition -win $_nWave2 {("G6" 14)}
wvAddSignal -win $_nWave2 \
           "/tb_DandRiscvSmallest/u_DandRiscvSimple/decode_DecodePlugin_imm\[63:0\]"
wvSetPosition -win $_nWave2 {("G6" 14)}
wvSetPosition -win $_nWave2 {("G6" 15)}
wvSetPosition -win $_nWave2 {("G6" 14)}
wvSetPosition -win $_nWave2 {("G6" 15)}
wvSetPosition -win $_nWave2 {("G6" 15)}
wvSetPosition -win $_nWave2 {("G6" 15)}
wvSetPosition -win $_nWave2 {("G6" 15)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "decode_DecodePlugin_imm" -line 979 -pos 1 -win $_nTrace1
srcAction -pos 978 7 6 -win $_nTrace1 -name "decode_DecodePlugin_imm" -ctrlKey \
          off
wvSelectSignal -win $_nWave2 {( "G6" 7 15 )} 
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
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
wvSelectSignal -win $_nWave2 {( "G7" 9 )} 
wvSelectSignal -win $_nWave2 {( "G7" 8 9 )} 
wvSelectSignal -win $_nWave2 {( "G7" 2 8 9 )} 
wvSetMarker -win $_nWave2 63.000000
wvScrollUp -win $_nWave2 1
wvZoom -win $_nWave2 60.399856 71.286107
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 60.976330 68.549374
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G7" 8 )} 
wvSetCursor -win $_nWave2 63.048997 -snap {("G7" 8)}
srcActiveTrace \
           "tb_DandRiscvSmallest.u_DandRiscvSimple.execute_ALUPlugin_alu_result\[63:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 63000 -TraceValue \
           1111111111111111111111111111111111111111000000001111111000001111
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 3
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G6" 9 )} 
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
wvSelectSignal -win $_nWave2 {( "G7" 8 )} 
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
debReload
wvSelectSignal -win $_nWave2 {( "G7" 6 )} 
wvSelectSignal -win $_nWave2 {( "G7" 5 6 )} 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 126.977237 237.204286
wvZoom -win $_nWave2 146.270043 159.910179
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 392.203343 566.407806
wvZoom -win $_nWave2 433.181204 458.331124
wvSetCursor -win $_nWave2 438.914938 -snap {("G7" 5)}
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G6" 8 )} 
wvSelectSignal -win $_nWave2 {( "G6" 6 8 )} 
wvSetCursor -win $_nWave2 447.003847 -snap {("G6" 6)}
wvSetCursor -win $_nWave2 440.947679 -snap {("G6" 8)}
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
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 5
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 7
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 3
wvScrollUp -win $_nWave2 2
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
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
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvSetCursor -win $_nWave2 444.929049 -snap {("G2" 1)}
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 469.307929 495.551323
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 440.182734 463.588214
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
wvSelectSignal -win $_nWave2 {( "G7" 9 )} 
wvSelectSignal -win $_nWave2 {( "G7" 8 9 )} 
wvSelectSignal -win $_nWave2 {( "G7" 8 )} 
wvSelectSignal -win $_nWave2 {( "G7" 9 )} 
wvSelectSignal -win $_nWave2 {( "G7" 8 9 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G6" 15)}
wvSetPosition -win $_nWave2 {("G6" 15)}
wvSetPosition -win $_nWave2 {("G6" 15)}
wvSetPosition -win $_nWave2 {("G6" 15)}
wvSelectSignal -win $_nWave2 {( "G7" 6 )} 
wvZoom -win $_nWave2 435.942611 453.346686
wvSetCursor -win $_nWave2 438.998511 -snap {("G7" 6)}
srcActiveTrace "tb_DandRiscvSmallest.u_DandRiscvSimple.execute_REDIRECT_VALID" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 389000 -TraceValue 0
srcDeselectAll -win $_nTrace1
srcSelect -signal "execute_ALUPlugin_redirect_valid" -line 942 -pos 1 -win \
          $_nTrace1
srcAction -pos 941 7 14 -win $_nTrace1 -name "execute_ALUPlugin_redirect_valid" \
          -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "execute_ALUPlugin_branch_or_jump" -line 2043 -pos 1 -win \
          $_nTrace1
wvSetPosition -win $_nWave2 {("G4" 29)}
wvSetPosition -win $_nWave2 {("G4" 28)}
wvSetPosition -win $_nWave2 {("G4" 27)}
wvSetPosition -win $_nWave2 {("G4" 31)}
wvSetPosition -win $_nWave2 {("G6" 0)}
wvSetPosition -win $_nWave2 {("G6" 1)}
wvSetPosition -win $_nWave2 {("G6" 2)}
wvSetPosition -win $_nWave2 {("G6" 3)}
wvSetPosition -win $_nWave2 {("G6" 15)}
wvSetPosition -win $_nWave2 {("G7" 1)}
wvSetPosition -win $_nWave2 {("G7" 2)}
wvSetPosition -win $_nWave2 {("G7" 3)}
wvSetPosition -win $_nWave2 {("G7" 4)}
wvSetPosition -win $_nWave2 {("G7" 5)}
wvSetPosition -win $_nWave2 {("G7" 6)}
wvSetPosition -win $_nWave2 {("G7" 7)}
wvAddSignal -win $_nWave2 \
           "/tb_DandRiscvSmallest/u_DandRiscvSimple/execute_ALUPlugin_branch_or_jump"
wvSetPosition -win $_nWave2 {("G7" 7)}
wvSetPosition -win $_nWave2 {("G7" 8)}
wvSetPosition -win $_nWave2 {("G7" 7)}
wvSetPosition -win $_nWave2 {("G7" 8)}
wvSetPosition -win $_nWave2 {("G7" 8)}
wvSetPosition -win $_nWave2 {("G7" 8)}
wvSetPosition -win $_nWave2 {("G7" 8)}
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
srcDeselectAll -win $_nTrace1
srcSelect -signal "execute_ALUPlugin_branch_or_jump" -line 2043 -pos 1 -win \
          $_nTrace1
srcAction -pos 2042 3 15 -win $_nTrace1 -name "execute_ALUPlugin_branch_or_jump" \
          -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "execute_ALUPlugin_branch_or_jalr" -line 1954 -pos 1 -win \
          $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvSetCursor -win $_nWave2 439.017913 -snap {("G7" 9)}
srcActiveTrace \
           "tb_DandRiscvSmallest.u_DandRiscvSimple.execute_ALUPlugin_branch_or_jalr" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 429000 -TraceValue 0
srcDeselectAll -win $_nTrace1
srcSelect -signal "execute_ALUPlugin_bne" -line 1953 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvSetCursor -win $_nWave2 438.988809 -snap {("G7" 10)}
srcActiveTrace "tb_DandRiscvSmallest.u_DandRiscvSimple.execute_ALUPlugin_bne" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 429000 -TraceValue 0
srcDeselectAll -win $_nTrace1
srcSelect -signal "execute_ALU_CTRL" -line 1948 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcBackwardHistory -win $_nTrace1
srcHBSelect "tb_DandRiscvSmallest.u_DandRiscvSimple" -win $_nTrace1
srcHBSelect "tb_DandRiscvSmallest.u_DandRiscvSimple" -win $_nTrace1
srcBackwardHistory -win $_nTrace1
srcHBSelect "tb_DandRiscvSmallest.u_DandRiscvSimple" -win $_nTrace1
srcHBSelect "tb_DandRiscvSmallest.u_DandRiscvSimple" -win $_nTrace1
srcBackwardHistory -win $_nTrace1
srcHBSelect "tb_DandRiscvSmallest.u_DandRiscvSimple" -win $_nTrace1
srcHBSelect "tb_DandRiscvSmallest.u_DandRiscvSimple" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "execute_ALUPlugin_branch_taken" -line 2044 -pos 1 -win \
          $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvSetCursor -win $_nWave2 438.979108 -snap {("G7" 11)}
srcActiveTrace \
           "tb_DandRiscvSmallest.u_DandRiscvSimple.execute_ALUPlugin_branch_taken" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 389000 -TraceValue 0
srcDeselectAll -win $_nTrace1
srcSelect -signal "execute_ALUPlugin_beq_result" -line 2181 -pos 1 -win $_nTrace1
srcAction -pos 2180 14 18 -win $_nTrace1 -name "execute_ALUPlugin_beq_result" \
          -ctrlKey off
srcBackwardHistory -win $_nTrace1
srcHBSelect "tb_DandRiscvSmallest.u_DandRiscvSimple" -win $_nTrace1
srcHBSelect "tb_DandRiscvSmallest.u_DandRiscvSimple" -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G7" 11 )} 
wvSetCursor -win $_nWave2 438.979108 -snap {("G7" 11)}
srcActiveTrace \
           "tb_DandRiscvSmallest.u_DandRiscvSimple.execute_ALUPlugin_branch_taken" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 389000 -TraceValue 0
srcDeselectAll -win $_nTrace1
srcSelect -signal "execute_ALUPlugin_beq_result" -line 2181 -pos 1 -win $_nTrace1
srcSelect -signal "execute_ALUPlugin_bne_result" -line 2181 -pos 1 -win $_nTrace1
srcSelect -signal "execute_ALUPlugin_blt_result" -line 2181 -pos 1 -win $_nTrace1
srcSelect -signal "execute_ALUPlugin_bge_result" -line 2181 -pos 1 -win $_nTrace1
srcSelect -signal "execute_ALUPlugin_bltu_result" -line 2181 -pos 1 -win \
          $_nTrace1
srcSelect -signal "execute_ALUPlugin_bgeu_result" -line 2181 -pos 1 -win \
          $_nTrace1
srcSelect -signal "execute_ALUPlugin_jal" -line 2181 -pos 1 -win $_nTrace1
srcSelect -signal "execute_ALUPlugin_jalr" -line 2181 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G7" 13 14 15 16 17 18 19 )} 
wvSelectSignal -win $_nWave2 {( "G7" 12 13 14 15 16 17 18 19 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G9" 1)}
wvSetPosition -win $_nWave2 {("G7" 11)}
wvSetPosition -win $_nWave2 {("G7" 11)}
wvSetPosition -win $_nWave2 {("G7" 11)}
wvSetPosition -win $_nWave2 {("G7" 11)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "execute_ALUPlugin_bne_result" -line 2181 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvSetCursor -win $_nWave2 438.950004 -snap {("G7" 12)}
srcActiveTrace \
           "tb_DandRiscvSmallest.u_DandRiscvSimple.execute_ALUPlugin_bne_result" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 389000 -TraceValue 0
srcDeselectAll -win $_nTrace1
srcSelect -signal "execute_ALUPlugin_bne" -line 2176 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "execute_ALUPlugin_branch_src1" -line 2176 -pos 1 -win \
          $_nTrace1
srcSelect -signal "execute_ALUPlugin_branch_src2" -line 2176 -pos 1 -win \
          $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G7" 13 )} 
wvSetCursor -win $_nWave2 439.124627 -snap {("G7" 13)}
srcActiveTrace \
           "tb_DandRiscvSmallest.u_DandRiscvSimple.execute_ALUPlugin_branch_src1\[63:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 439000 -TraceValue \
           0000000000000000000000000000000000000000111111110000011111111111
wvSelectSignal -win $_nWave2 {( "G7" 14 )} 
wvSetCursor -win $_nWave2 439.056718 -snap {("G7" 14)}
srcActiveTrace \
           "tb_DandRiscvSmallest.u_DandRiscvSimple.execute_ALUPlugin_branch_src2\[63:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 439000 -TraceValue \
           0000000000000000000000000000000000000000000000000000000000000000
wvSetCursor -win $_nWave2 439.008212 -snap {("G7" 13)}
srcActiveTrace \
           "tb_DandRiscvSmallest.u_DandRiscvSimple.execute_ALUPlugin_branch_src1\[63:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 435000 -TraceValue \
           0000000000000000000000000000000000000000000000000000000000000000
wvScrollUp -win $_nWave2 9
wvSelectSignal -win $_nWave2 {( "G6" 10 )} {( "G7" 14 )} 
wvSelectSignal -win $_nWave2 {( "G6" 10 11 )} {( "G7" 14 )} 
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
wvSetMarker -win $_nWave2 439.000000
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 433.352373 446.390877
wvSelectSignal -win $_nWave2 {( "G6" 10 11 12 )} {( "G7" 14 )} 
wvZoom -win $_nWave2 435.496385 445.744039
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 435.582068 445.966814
wvZoomOut -win $_nWave2
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
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 2
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
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
wvScrollDown -win $_nWave2 1
wvScrollUp -win $_nWave2 2
wvScrollDown -win $_nWave2 26
wvScrollDown -win $_nWave2 0
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
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 1
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
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G6" 10 )} 
wvSetCursor -win $_nWave2 437.008379 -snap {("G6" 10)}
srcActiveTrace "tb_DandRiscvSmallest.u_DandRiscvSimple.decode_RS1\[63:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 433000 -TraceValue \
           0000000000000000000000000000000000000000000000000000000000000000
srcDeselectAll -win $_nTrace1
srcSelect -signal "decode_DecodePlugin_rs1" -line 978 -pos 1 -win $_nTrace1
srcAction -pos 977 7 8 -win $_nTrace1 -name "decode_DecodePlugin_rs1" -ctrlKey \
          off
srcDeselectAll -win $_nTrace1
srcSelect -signal "regFileModule_1_read_ports_rs1_value" -line 1736 -pos 1 -win \
          $_nTrace1
srcAction -pos 1735 7 19 -win $_nTrace1 -name \
          "regFileModule_1_read_ports_rs1_value" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "read_ports_rs1_addr" -line 3411 -pos 1 -win $_nTrace1
srcSelect -signal "read_ports_rs2_addr" -line 3412 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave2 {("G4" 27)}
wvSetPosition -win $_nWave2 {("G4" 26)}
wvSetPosition -win $_nWave2 {("G4" 25)}
wvSetPosition -win $_nWave2 {("G4" 26)}
wvSetPosition -win $_nWave2 {("G4" 27)}
wvSetPosition -win $_nWave2 {("G4" 31)}
wvSetPosition -win $_nWave2 {("G6" 0)}
wvSetPosition -win $_nWave2 {("G6" 15)}
wvSetPosition -win $_nWave2 {("G6" 11)}
wvSetPosition -win $_nWave2 {("G6" 12)}
wvSetPosition -win $_nWave2 {("G6" 13)}
wvSetPosition -win $_nWave2 {("G6" 12)}
wvSetPosition -win $_nWave2 {("G6" 11)}
wvSetPosition -win $_nWave2 {("G6" 10)}
wvSetPosition -win $_nWave2 {("G6" 11)}
wvSetPosition -win $_nWave2 {("G6" 12)}
wvSetPosition -win $_nWave2 {("G6" 13)}
wvSetPosition -win $_nWave2 {("G6" 14)}
wvSetPosition -win $_nWave2 {("G6" 15)}
wvAddSignal -win $_nWave2 \
           "/tb_DandRiscvSmallest/u_DandRiscvSimple/regFileModule_1/read_ports_rs1_addr\[4:0\]" \
           "/tb_DandRiscvSmallest/u_DandRiscvSimple/regFileModule_1/read_ports_rs2_addr\[4:0\]"
wvSetPosition -win $_nWave2 {("G6" 15)}
wvSetPosition -win $_nWave2 {("G6" 17)}
wvSetPosition -win $_nWave2 {("G6" 15)}
wvSetPosition -win $_nWave2 {("G6" 17)}
wvSetPosition -win $_nWave2 {("G6" 17)}
wvSetPosition -win $_nWave2 {("G6" 17)}
wvSetPosition -win $_nWave2 {("G6" 17)}
wvSelectSignal -win $_nWave2 {( "G6" 10 16 17 )} 
wvSelectSignal -win $_nWave2 {( "G6" 10 11 16 17 )} 
wvSetCursor -win $_nWave2 436.985224 -snap {("G6" 10)}
srcActiveTrace "tb_DandRiscvSmallest.u_DandRiscvSimple.decode_RS1\[63:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 433000 -TraceValue \
           0000000000000000000000000000000000000000000000000000000000000000
srcDeselectAll -win $_nTrace1
srcSelect -signal "decode_DecodePlugin_rs1" -line 978 -pos 1 -win $_nTrace1
srcAction -pos 977 7 7 -win $_nTrace1 -name "decode_DecodePlugin_rs1" -ctrlKey \
          off
srcDeselectAll -win $_nTrace1
srcSelect -signal "regFileModule_1_read_ports_rs1_value" -line 1736 -pos 1 -win \
          $_nTrace1
srcAction -pos 1735 7 24 -win $_nTrace1 -name \
          "regFileModule_1_read_ports_rs1_value" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "read_value_1" -line 3411 -pos 1 -win $_nTrace1
srcAction -pos 3410 34 3 -win $_nTrace1 -name "read_value_1" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "_zz_read_value_1" -line 3407 -pos 1 -win $_nTrace1
srcAction -pos 3406 7 6 -win $_nTrace1 -name "_zz_read_value_1" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "reg_file_0" -line 3335 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G6" 18 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G7" 0)}
wvSetPosition -win $_nWave2 {("G6" 17)}
wvSetPosition -win $_nWave2 {("G6" 17)}
wvSetPosition -win $_nWave2 {("G6" 17)}
wvSetPosition -win $_nWave2 {("G6" 17)}
srcDeselectAll -win $_nTrace1
srcBackwardHistory -win $_nTrace1
srcHBSelect "tb_DandRiscvSmallest.u_DandRiscvSimple.regFileModule_1" -win \
           $_nTrace1
srcHBSelect "tb_DandRiscvSmallest.u_DandRiscvSimple.regFileModule_1" -win \
           $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "read_ports_rs1_value" -line 3411 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvSetCursor -win $_nWave2 437.008379 -snap {("G6" 18)}
srcActiveTrace \
           "tb_DandRiscvSmallest.u_DandRiscvSimple.regFileModule_1.read_ports_rs1_value\[63:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 433000 -TraceValue \
           0000000000000000000000000000000000000000000000000000000000000000
srcDeselectAll -win $_nTrace1
srcSelect -signal "write_ports_rd_wen" -line 3411 -pos 1 -win $_nTrace1
srcSelect -signal "write_ports_rd_addr" -line 3411 -pos 1 -win $_nTrace1
srcSelect -signal "read_ports_rs1_addr" -line 3411 -pos 1 -win $_nTrace1
srcSelect -signal "read_ports_rs1_req" -line 3411 -pos 1 -win $_nTrace1
srcSelect -signal "write_ports_rd_value" -line 3411 -pos 1 -win $_nTrace1
srcSelect -signal "read_value_1" -line 3411 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvScrollDown -win $_nWave2 1
srcDeselectAll -win $_nTrace1
srcSelect -signal "write_ports_rd_wen" -line 3411 -pos 1 -win $_nTrace1
srcAction -pos 3410 10 7 -win $_nTrace1 -name "write_ports_rd_wen" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcBackwardHistory -win $_nTrace1
srcHBSelect "tb_DandRiscvSmallest.u_DandRiscvSimple" -win $_nTrace1
srcHBSelect "tb_DandRiscvSmallest.u_DandRiscvSimple.regFileModule_1" -win \
           $_nTrace1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
srcDeselectAll -win $_nTrace1
debReload
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G6" 24 )} 
wvSelectSignal -win $_nWave2 {( "G6" 16 )} 
wvSelectSignal -win $_nWave2 {( "G6" 13 )} 
wvSelectSignal -win $_nWave2 {( "G6" 10 )} 
wvSelectSignal -win $_nWave2 {( "G6" 10 11 )} 
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G7" 6 )} 
wvSelectSignal -win $_nWave2 {( "G7" 6 7 )} 
wvSelectSignal -win $_nWave2 {( "G7" 6 )} 
wvSelectSignal -win $_nWave2 {( "G7" 5 6 )} 
wvZoom -win $_nWave2 437.436735 446.432218
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
srcDeselectAll -win $_nTrace1
debReload
wvScrollUp -win $_nWave2 49
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
wvZoom -win $_nWave2 0.000000 1058.416945
wvZoom -win $_nWave2 61.357504 687.912017
wvZoom -win $_nWave2 253.445008 481.505263
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 30.509733 320.352197
wvZoom -win $_nWave2 44.242514 149.742586
wvZoom -win $_nWave2 61.473017 135.570057
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
wvSetCursor -win $_nWave2 79.233177 -snap {("G2" 4)}
wvZoom -win $_nWave2 76.341988 90.384905
wvZoomOut -win $_nWave2
wvSetMarker -win $_nWave2 79.000000
wvSetCursor -win $_nWave2 79.011238 -snap {("G2" 4)}
srcActiveTrace "tb_DandRiscvSmallest.u_DandRiscvSimple.writeback_RD\[63:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 77000 -TraceValue \
           0000000000000000000000000000000010000000000000000000001010010000
srcDeselectAll -win $_nTrace1
srcSelect -signal "writeback_LSU_RDATA" -line 935 -pos 1 -win $_nTrace1
srcAction -pos 934 12 8 -win $_nTrace1 -name "writeback_LSU_RDATA" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "memaccess_to_writeback_LSU_RDATA" -line 994 -pos 1 -win \
          $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "memaccess_to_writeback_LSU_RDATA" -line 994 -pos 1 -win \
          $_nTrace1
srcAction -pos 993 7 8 -win $_nTrace1 -name "memaccess_to_writeback_LSU_RDATA" \
          -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "memaccess_LSU_RDATA" -line 2908 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave2 {("G2" 4)}
wvSetPosition -win $_nWave2 {("G2" 6)}
wvSetPosition -win $_nWave2 {("G2" 7)}
wvSetPosition -win $_nWave2 {("G6" 15)}
wvSetPosition -win $_nWave2 {("G3" 3)}
wvAddSignal -win $_nWave2 \
           "/tb_DandRiscvSmallest/u_DandRiscvSimple/memaccess_LSU_RDATA\[63:0\]"
wvSetPosition -win $_nWave2 {("G3" 3)}
wvSetPosition -win $_nWave2 {("G3" 4)}
wvSetPosition -win $_nWave2 {("G3" 3)}
wvSetPosition -win $_nWave2 {("G3" 4)}
wvSetPosition -win $_nWave2 {("G3" 4)}
wvSetPosition -win $_nWave2 {("G3" 4)}
wvSetPosition -win $_nWave2 {("G3" 4)}
wvSetCursor -win $_nWave2 76.991688 -snap {("G3" 4)}
srcActiveTrace \
           "tb_DandRiscvSmallest.u_DandRiscvSimple.memaccess_LSU_RDATA\[63:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 67000 -TraceValue \
           0000000000000000000000000000000000000000000000000000000000000000
srcDeselectAll -win $_nTrace1
srcSelect -signal "memaccess_LSUPlugin_lsu_rdata" -line 939 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvSetCursor -win $_nWave2 76.929066 -snap {("G3" 5)}
srcActiveTrace \
           "tb_DandRiscvSmallest.u_DandRiscvSimple.memaccess_LSUPlugin_lsu_rdata\[63:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 67000 -TraceValue \
           0000000000000000000000000000000000000000000000000000000000000000
srcDeselectAll -win $_nTrace1
srcSelect -signal "memaccess_LSUPlugin_dcache_data_load" -line 2609 -pos 1 -win \
          $_nTrace1
srcAction -pos 2608 7 17 -win $_nTrace1 -name \
          "memaccess_LSUPlugin_dcache_data_load" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "memaccess_LSUPlugin_dcache_data_load" -line 2558 -pos 1 -win \
          $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "memaccess_LSUPlugin_dcache_lbu" -line 2558 -pos 1 -win \
          $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
srcDeselectAll -win $_nTrace1
srcSelect -signal "memaccess_LSUPlugin_dcache_lbu" -line 2558 -pos 1 -win \
          $_nTrace1
srcAction -pos 2557 5 12 -win $_nTrace1 -name "memaccess_LSUPlugin_dcache_lbu" \
          -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "_zz_memaccess_LSUPlugin_dcache_lbu" -line 2302 -pos 1 -win \
          $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "DCachePlugin_dcache_access_rsp_payload_data\[7 : 0\]" -line \
          2302 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "_zz_memaccess_LSUPlugin_dcache_lbu" -line 2302 -pos 1 -win \
          $_nTrace1
srcSelect -signal "DCachePlugin_dcache_access_rsp_payload_data\[7 : 0\]" -line \
          2302 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
srcDeselectAll -win $_nTrace1
srcSelect -signal "DCachePlugin_dcache_access_rsp_payload_data\[7 : 0\]" -line \
          2302 -pos 1 -win $_nTrace1
srcAction -pos 2301 10 11 -win $_nTrace1 -name \
          "DCachePlugin_dcache_access_rsp_payload_data\[7 : 0\]" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "dcache_rsp_payload_data" -line 2631 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
srcDeselectAll -win $_nTrace1
srcSelect -signal "dcache_rsp_payload_data" -line 2631 -pos 1 -win $_nTrace1
srcAction -pos 2630 7 6 -win $_nTrace1 -name "dcache_rsp_payload_data" -ctrlKey \
          off
srcDeselectAll -win $_nTrace1
srcSelect -signal "dcache_cmd_payload_addr" -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
srcDeselectAll -win $_nTrace1
srcSelect -signal "dcache_cmd_payload_addr" -win $_nTrace1
srcAction -pos 98 5 11 -win $_nTrace1 -name \
          "ram_d\[dcache_cmd_payload_addr\[12:3\]\]" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "dcache_cmd_payload_addr" -line 2626 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G3" 10 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G4" 0)}
wvSetPosition -win $_nWave2 {("G3" 10)}
wvSetPosition -win $_nWave2 {("G3" 10)}
wvSetPosition -win $_nWave2 {("G3" 10)}
wvSetPosition -win $_nWave2 {("G3" 10)}
