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
