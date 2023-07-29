debImport "./simWorkspace/tb_DandRiscvSimple/tb_DandRiscvSimple.fsdb" "-f" \
          "./hw/verilog/tb/tb_DandRiscvSimple.f" "-sv" "-v2k"
wvCreateWindow
wvSetPosition -win $_nWave2 {("G1" 0)}
wvOpenFile -win $_nWave2 \
           {/home/lin/SpinalProjects/DandRiscvSoC/simWorkspace/tb_DandRiscvSimple/tb_DandRiscvSimple.fsdb}
verdiDockWidgetSetCurTab -dock widgetDock_<Message>
verdiDockWidgetSetCurTab -dock windowDock_nWave_2
verdiDockWidgetSetCurTab -dock windowDock_OneSearch
verdiDockWidgetSetCurTab -dock widgetDock_<Message>
srcDeselectAll -win $_nTrace1
srcSelect -signal "clk_axi_in" -line 16 -pos 1 -win $_nTrace1
srcSelect -signal "rst_n" -line 17 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
verdiDockWidgetSetCurTab -dock windowDock_nWave_2
wvZoom -win $_nWave2 0.000000 6513289.760349
wvZoom -win $_nWave2 0.000000 195824.398024
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 0.000000 2249890.077161
wvZoom -win $_nWave2 0.000000 118621.655484
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
srcDeselectAll -win $_nTrace1
debExit
