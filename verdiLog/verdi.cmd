debImport "./simWorkspace/tb_DandRiscvSimple/tb_DandRiscvSimple.fsdb" "-f" \
          "./hw/verilog/tb/tb_DandRiscvSimple.f" "-sv" "-v2k"
wvCreateWindow
wvSetPosition -win $_nWave2 {("G1" 0)}
wvOpenFile -win $_nWave2 \
           {/home/lin/SpinalProjects/DandRiscvSoC/simWorkspace/tb_DandRiscvSimple/tb_DandRiscvSimple.fsdb}
verdiDockWidgetSetCurTab -dock widgetDock_<Message>
nsMsgSelect -range {0 1-1}
nsMsgAction -tab cmpl -index {0 1}
nsMsgSelect -range {0 1-1}
nsMsgSelect -range {0 2-2}
nsMsgAction -tab cmpl -index {0 2}
nsMsgSelect -range {0 2-2}
nsMsgSelect -range {0 1-1}
nsMsgAction -tab cmpl -index {0 1}
nsMsgSelect -range {0 1-1}
verdiDockWidgetSetCurTab -dock windowDock_nWave_2
srcHBSelect "tb_DandRiscvSimple" -win $_nTrace1
srcSetScope -win $_nTrace1 "tb_DandRiscvSimple" -delim "."
srcHBSelect "tb_DandRiscvSimple" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -inst "u_DandRiscvSimple" -line 151 -pos 1 -win $_nTrace1
srcAction -pos 150 2 4 -win $_nTrace1 -name "u_DandRiscvSimple" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {8 21 3 1 13 1}
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
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 1 )} 
srcDeselectAll -win $_nTrace1
srcSelect -signal "icache_ar_valid" -line 8 -pos 1 -win $_nTrace1
srcAction -pos 7 3 7 -win $_nTrace1 -name "icache_ar_valid" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "iCache_1_next_level_cmd_valid" -line 2728 -pos 1 -win \
          $_nTrace1
srcAction -pos 2727 7 7 -win $_nTrace1 -name "iCache_1_next_level_cmd_valid" \
          -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "next_level_cmd_valid_1" -line 7611 -pos 1 -win $_nTrace1
srcAction -pos 7610 7 7 -win $_nTrace1 -name "next_level_cmd_valid_1" -ctrlKey \
          off
srcDeselectAll -win $_nTrace1
srcSelect -signal "next_level_cmd_valid_1" -line 7808 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
srcDeselectAll -win $_nTrace1
srcSelect -signal "next_level_cmd_valid_1" -line 7808 -pos 1 -win $_nTrace1
srcAction -pos 7807 1 11 -win $_nTrace1 -name "next_level_cmd_valid_1" -ctrlKey \
          off
