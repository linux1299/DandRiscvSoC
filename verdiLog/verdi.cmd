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
srcSelect -win $_nTrace1 -range {8 21 3 1 14 1}
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
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 3 )} 
wvSetCursor -win $_nWave2 33666666.666667 -snap {("G1" 1)}
wvSetCursor -win $_nWave2 8977777.777778 -snap {("G1" 1)}
srcActiveTrace "tb_DandRiscvSimple.u_DandRiscvSimple.icache_ar_valid" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 55000 -TraceValue 0
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoom -win $_nWave2 42317.708333 136718.750000
wvSelectSignal -win $_nWave2 {( "G1" 2 )} 
wvSelectSignal -win $_nWave2 {( "G1" 1 )} 
wvSelectSignal -win $_nWave2 {( "G1" 2 )} 
wvSelectSignal -win $_nWave2 {( "G1" 3 )} 
wvSelectSignal -win $_nWave2 {( "G1" 4 )} 
wvSelectSignal -win $_nWave2 {( "G1" 3 )} 
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
wvZoom -win $_nWave2 0.000000 3866666.666667
wvZoom -win $_nWave2 8592.592593 90222.222222
wvZoom -win $_nWave2 53035.390947 59520.411523
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 5 )} 
wvSelectSignal -win $_nWave2 {( "G1" 4 )} 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 5 )} 
wvZoom -win $_nWave2 48150.008779 71957.239872
wvSetCursor -win $_nWave2 48917.130670 -snap {("G1" 5)}
srcActiveTrace \
           "tb_DandRiscvSimple.u_DandRiscvSimple.icache_ar_payload_len\[7:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 0 -TraceValue 00000010
srcDeselectAll -win $_nTrace1
srcSelect -signal "iCache_1_next_level_cmd_payload_len" -line 2730 -pos 1 -win \
          $_nTrace1
srcAction -pos 2729 11 9 -win $_nTrace1 -name \
          "iCache_1_next_level_cmd_payload_len" -ctrlKey off
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {7610 7611 6 1 1 1} -backward
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
