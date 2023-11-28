debImport "./simWorkspace/tb_DandSocSimple/tb_DandSocSimple.fsdb" "-f" \
          "./hw/verilog/tb/tb_DandSocSimple.f" "-sv" "-v2k"
wvCreateWindow
wvSetPosition -win $_nWave2 {("G1" 0)}
wvOpenFile -win $_nWave2 \
           {/home/lin/SpinalProjects/DandRiscvSoC/simWorkspace/tb_DandSocSimple/tb_DandSocSimple.fsdb}
srcHBSelect "tb_DandSocSimple.u_DandSocSimple" -win $_nTrace1
srcSetScope -win $_nTrace1 "tb_DandSocSimple.u_DandSocSimple" -delim "."
srcHBSelect "tb_DandSocSimple.u_DandSocSimple" -win $_nTrace1
srcHBSelect "tb_DandSocSimple.u_DandSocSimple.core_cpu" -win $_nTrace1
srcHBSelect "tb_DandSocSimple.u_DandSocSimple.core_cpu" -win $_nTrace1
srcSetScope -win $_nTrace1 "tb_DandSocSimple.u_DandSocSimple.core_cpu" -delim "."
srcHBSelect "tb_DandSocSimple.u_DandSocSimple.core_cpu" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSearchString "writeback_PC" -win $_nTrace1 -next -case
srcDeselectAll -win $_nTrace1
srcSelect -signal "writeback_PC" -line 5361 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 14098612.029081 18541143.423662
wvZoom -win $_nWave2 15273108.101672 16007168.147042
wvZoom -win $_nWave2 15486582.272168 15639410.371501
wvZoom -win $_nWave2 15534461.002553 15581834.683047
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
wvZoom -win $_nWave2 37155717.118308 46114210.178453
wvZoom -win $_nWave2 43260281.787837 44296459.108079
wvZoom -win $_nWave2 43937597.960810 44090319.403252
wvZoom -win $_nWave2 44021276.794772 44056908.433358
wvZoom -win $_nWave2 44041365.220226 44048642.270010
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
wvZoom -win $_nWave2 44792465.300727 52686219.431593
wvZoom -win $_nWave2 51481026.302551 52086231.510205
wvZoom -win $_nWave2 51985030.639393 52055831.248617
wvZoom -win $_nWave2 52039499.845693 52052321.634805
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
wvZoom -win $_nWave2 7746893.588896 22029081.295440
wvZoom -win $_nWave2 9446030.262510 11484994.270847
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 21661929.940516 23791407.799075
wvZoom -win $_nWave2 22450104.164431 22652777.536297
wvZoom -win $_nWave2 22532620.223299 22562492.108247
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
wvZoom -win $_nWave2 42993423.661599 50336450.760079
wvZoom -win $_nWave2 49035769.159017 49826855.356672
wvZoom -win $_nWave2 49613528.741567 49713394.877557
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 7324887.150562 16719828.546598
wvZoom -win $_nWave2 9715536.481345 11746036.042814
wvZoom -win $_nWave2 9935630.287082 10347635.155139
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
srcHBSelect "tb_DandSocSimple" -win $_nTrace1
srcSetScope -win $_nTrace1 "tb_DandSocSimple" -delim "."
srcHBSelect "tb_DandSocSimple" -win $_nTrace1
srcHBSelect "tb_DandSocSimple.u_DandSocSimple.core_cpu" -win $_nTrace1
srcSetScope -win $_nTrace1 "tb_DandSocSimple.u_DandSocSimple.core_cpu" -delim "."
srcHBSelect "tb_DandSocSimple.u_DandSocSimple.core_cpu" -win $_nTrace1
srcHBSelect "tb_DandSocSimple.u_DandSocSimple" -win $_nTrace1
srcSetScope -win $_nTrace1 "tb_DandSocSimple.u_DandSocSimple" -delim "."
srcHBSelect "tb_DandSocSimple.u_DandSocSimple" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "io_uart_txd" -line 10 -pos 1 -win $_nTrace1
srcSelect -signal "io_uart_rxd" -line 11 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 14465763.384005 22249372.108394
wvZoom -win $_nWave2 15319748.214303 16888816.727812
wvZoom -win $_nWave2 15768794.259475 15966872.307115
wvZoom -win $_nWave2 15806498.474751 15853366.909024
wvZoom -win $_nWave2 15816070.415391 15835616.999678
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 15136274.320279 15814268.202226
wvZoom -win $_nWave2 15261745.759097 15356745.562780
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 15173872.510410 15441102.625728
wvZoom -win $_nWave2 15266952.662937 15323648.543318
wvZoom -win $_nWave2 15271861.559381 15283927.701802
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
wvZoom -win $_nWave2 14791995.142540 16923419.787602
wvZoom -win $_nWave2 15113188.017001 15576663.699899
wvZoom -win $_nWave2 15234187.947433 15362539.772373
wvZoom -win $_nWave2 15268121.014169 15300187.762237
wvSetCursor -win $_nWave2 15272995.668526 -snap {("G1" 1)}
srcActiveTrace "tb_DandSocSimple.u_DandSocSimple.core_cpu.writeback_PC\[63:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 15193000 -TraceValue \
           0000000000000000000000000000000000110000000000000000000000000000
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 9115130.929019 12305443.852502
wvZoom -win $_nWave2 9853141.188912 10466744.004995
wvZoom -win $_nWave2 10028745.960467 10090390.129697
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 14873479.076230 16354568.858014
wvZoom -win $_nWave2 15149531.500849 15466698.116380
srcHBSelect "tb_DandSocSimple" -win $_nTrace1
srcSetScope -win $_nTrace1 "tb_DandSocSimple" -delim "."
srcHBSelect "tb_DandSocSimple" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "rst_n" -line 6 -pos 1 -win $_nTrace1
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
wvZoom -win $_nWave2 0.000000 1321744.877726
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 14429048.248513 20193324.520820
wvZoom -win $_nWave2 15175775.379622 16680659.138750
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
srcDeselectAll -win $_nTrace1
debReload
srcDeselectAll -win $_nTrace1
debReload
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 13107303.370787 23093820.224719
wvZoom -win $_nWave2 14790424.188859 15971908.998412
wvZoom -win $_nWave2 15041870.394188 15587711.690868
wvZoom -win $_nWave2 15168499.802729 15456031.536671
wvZoom -win $_nWave2 15270551.713577 15330224.525512
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
wvSelectSignal -win $_nWave2 {( "G1" 2 )} 
wvZoom -win $_nWave2 47913251.817581 54815697.290152
wvZoom -win $_nWave2 53606742.861710 54044703.711258
wvZoom -win $_nWave2 53812842.085017 53901128.971410
wvZoom -win $_nWave2 53833382.061223 53865067.308620
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 54253656.606746 54348817.058941
wvZoom -win $_nWave2 54323281.603818 54334476.951135
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 54655911.297408 55224188.015154
wvZoom -win $_nWave2 54950378.545723 55041648.368864
wvZoom -win $_nWave2 54978308.438723 55002196.640947
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
wvSetCursor -win $_nWave2 17072538.003966 -snap {("G1" 1)}
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
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoom -win $_nWave2 27492988.823426 27513081.613000
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
srcDeselectAll -win $_nTrace1
srcSelect -signal "clk_axi_in" -line 29 -pos 2 -win $_nTrace1
srcDeselectAll -win $_nTrace1
debExit
