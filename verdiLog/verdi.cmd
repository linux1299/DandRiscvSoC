debImport "./simWorkspace/tb_DandRiscvSmallest/tb_DandRiscvSmallest.fsdb" "-f" \
          "./hw/verilog/tb/tb_DandRiscvSmallest.f" "-sv" "-v2k"
wvCreateWindow
wvSetPosition -win $_nWave2 {("G1" 0)}
wvOpenFile -win $_nWave2 \
           {/home/lin/SpinalProjects/DandRiscvSoC/simWorkspace/tb_DandRiscvSmallest/tb_DandRiscvSmallest.fsdb}
verdiSetFont -monoFont "Courier" -monoFontSize "14"
simSetInteractiveFsdbFile inter.fsdb
simSetSimMode on
srcSetPreference -filterPowerAwareInstruments off -profileTime off
tbvSetPreference -dynamicDumpMDA 1 -dynamicDumpStruct 1 -dynamicDumpSystemCStruct \
           1 -dynamicDumpSystemCPlain 1 -dynamicDumpSystemCFIFO 1
verdiSetFont -font "Bitstream Vera Sans Mono" -size "14"
srcHBSelect "tb_DandRiscvSmallest.u_DandRiscvSimple.gshare_predictor_1" -win \
           $_nTrace1
srcDeselectAll -win $_nTrace1
verdiSetFont -font "Bitstream Charter" -size "14"
verdiSetFont -monoFont "Clean" -monoFontSize "14"
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "dcache_rsp_payload_data" -line 24 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
verdiSetFont -font "Bitstream Vera Sans Mono" -size "14"
srcDeselectAll -win $_nTrace1
debReload
srcDeselectAll -win $_nTrace1
verdiSetFont -monoFont "Courier" -monoFontSize "24"
verdiSetFont -monoFont "Fixed" -monoFontSize "14"
verdiSetFont -monoFont "Fixed" -monoFontSize "20"
srcDeselectAll -win $_nTrace1
srcHBSelect \
           "tb_DandRiscvSmallest.u_DandRiscvSimple.fetch_FetchPlugin_pc_stream_fifo" \
           -win $_nTrace1
srcHBSelect \
           "tb_DandRiscvSmallest.u_DandRiscvSimple.fetch_FetchPlugin_predict_taken_fifo" \
           -win $_nTrace1
srcSetScope -win $_nTrace1 \
           "tb_DandRiscvSmallest.u_DandRiscvSimple.fetch_FetchPlugin_predict_taken_fifo" \
           -delim "."
srcHBSelect \
           "tb_DandRiscvSmallest.u_DandRiscvSimple.fetch_FetchPlugin_predict_taken_fifo" \
           -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "_zz_ports_m_ports_payload" -line 8102 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
wvRestoreSignal -win $_nWave2 \
           "/home/lin/SpinalProjects/DandRiscvSoC/simWorkspace/tb_DandRiscvSimple/DandRiscvSimple_debug_total.rc" \
           -overWriteAutoAlias on -appendSignals on
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 58.707243 84.714105
verdiSetFont -monoFont "Fixed" -monoFontSize "14"
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
verdiSetFont -monoFont "Clean" -monoFontSize "14"
verdiSetFont -monoFont "Courier" -monoFontSize "14"
verdiSetFont -monoFont "Fixed" -monoFontSize "14"
verdiSetFont -monoFont "Fixed" -monoFontSize "20"
wvScrollUp -win $_nWave2 4
wvScrollDown -win $_nWave2 0
verdiSetFont -font "Bitstream Vera Sans Mono" -size "18"
verdiSetFont -monoFont "Courier" -monoFontSize "18"
verdiSetFont -monoFont "Courier" -monoFontSize "24"
verdiSetFont -monoFont "Courier" -monoFontSize "10"
verdiSetFont -monoFont "Courier" -monoFontSize "24"
verdiSetFont -monoFont "Fixed" -monoFontSize "20"
verdiSetFont -monoFont "Fixed" -monoFontSize "14"
verdiSetFont -monoFont "Courier" -monoFontSize "18"
verdiSetFont -monoFont "Courier" -monoFontSize "24"
verdiSetFont -monoFont "Fixed" -monoFontSize "20"
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 39.219001 73.239523
wvZoom -win $_nWave2 49.819858 61.815878
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoom -win $_nWave2 127.789356 171.989202
wvScrollUp -win $_nWave2 28
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 52.678902 136.965145
wvZoom -win $_nWave2 58.832278 78.252933
wvSetCursor -win $_nWave2 63.265554 -snap {("G2" 4)}
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
srcDeselectAll -win $_nTrace1
debReload
wvSetCursor -win $_nWave2 62.964120 -snap {("G2" 4)}
wvScrollDown -win $_nWave2 0
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 51.106410 83.951710
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 44.899964 200.097667
wvZoom -win $_nWave2 58.390404 127.110932
srcDeselectAll -win $_nTrace1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 47
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G7" 2 )} 
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 53.642254 122.873336
wvZoom -win $_nWave2 62.900497 98.133254
wvSetSearchMode -win $_nWave2 -value 
wvSetSearchMode -win $_nWave2 -value 800006c
wvSearchNext -win $_nWave2
wvSearchPrev -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 44.289434 112.032655
wvSelectSignal -win $_nWave2 {( "G7" 2 )} 
wvSetSearchMode -win $_nWave2 -value 8000006c
wvSearchNext -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 131.258782 270.167615
wvZoom -win $_nWave2 164.902377 203.912436
wvZoom -win $_nWave2 171.104571 181.335292
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 2
wvSelectSignal -win $_nWave2 {( "G7" 3 )} 
wvSelectSignal -win $_nWave2 {( "G7" 3 4 )} 
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvSetRadix -win $_nWave2 -2Com
wvSelectSignal -win $_nWave2 {( "G7" 11 )} 
wvSelectSignal -win $_nWave2 {( "G7" 12 )} 
wvSelectSignal -win $_nWave2 {( "G7" 11 )} 
wvSelectSignal -win $_nWave2 {( "G7" 12 )} 
wvSelectSignal -win $_nWave2 {( "G7" 11 )} 
wvSelectSignal -win $_nWave2 {( "G7" 12 )} 
wvSelectSignal -win $_nWave2 {( "G7" 11 )} 
wvSelectSignal -win $_nWave2 {( "G7" 13 )} 
wvSelectSignal -win $_nWave2 {( "G7" 14 )} 
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G7" 13 14 )} 
wvSetRadix -win $_nWave2 -2Com
wvSelectSignal -win $_nWave2 {( "G7" 6 )} 
wvSelectSignal -win $_nWave2 {( "G7" 5 6 )} 
wvScrollUp -win $_nWave2 8
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
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
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
wvSelectSignal -win $_nWave2 {( "G6" 10 )} 
wvSelectSignal -win $_nWave2 {( "G6" 10 11 )} 
wvZoom -win $_nWave2 169.333577 178.941030
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G6" 16 )} 
wvSelectSignal -win $_nWave2 {( "G6" 17 )} 
wvSelectSignal -win $_nWave2 {( "G6" 18 )} 
wvSelectSignal -win $_nWave2 {( "G6" 18 19 )} 
wvSelectSignal -win $_nWave2 {( "G6" 18 19 20 )} 
wvSelectSignal -win $_nWave2 {( "G6" 18 19 20 21 )} 
wvSelectSignal -win $_nWave2 {( "G6" 18 19 20 21 22 )} 
wvSelectSignal -win $_nWave2 {( "G6" 18 19 20 21 22 23 )} 
wvSelectSignal -win $_nWave2 {( "G6" 18 19 20 21 22 23 24 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G3" 10)}
wvSetPosition -win $_nWave2 {("G3" 10)}
wvSetPosition -win $_nWave2 {("G3" 10)}
wvSetPosition -win $_nWave2 {("G3" 10)}
wvSelectSignal -win $_nWave2 {( "G6" 16 )} 
wvSelectSignal -win $_nWave2 {( "G6" 16 17 )} 
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSelectSignal -win $_nWave2 {( "G6" 10 )} 
wvSetCursor -win $_nWave2 171.003818 -snap {("G6" 10)}
srcActiveTrace "tb_DandRiscvSmallest.u_DandRiscvSimple.decode_RS1\[63:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 159000 -TraceValue \
           0000000000000000000000000000000000000000000000000000000000000000
srcDeselectAll -win $_nTrace1
srcSelect -signal "decode_DecodePlugin_rs1" -line 984 -pos 1 -win $_nTrace1
srcAction -pos 983 7 11 -win $_nTrace1 -name "decode_DecodePlugin_rs1" -ctrlKey \
          off
srcDeselectAll -win $_nTrace1
srcSelect -signal "regFileModule_1_read_ports_rs1_value" -line 1742 -pos 1 -win \
          $_nTrace1
srcAction -pos 1741 7 21 -win $_nTrace1 -name \
          "regFileModule_1_read_ports_rs1_value" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "read_value_1" -line 3419 -pos 1 -win $_nTrace1
srcAction -pos 3418 46 4 -win $_nTrace1 -name "read_value_1" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "_zz_read_value_1" -line 3415 -pos 1 -win $_nTrace1
srcAction -pos 3414 7 5 -win $_nTrace1 -name "_zz_read_value_1" -ctrlKey off
wvSelectSignal -win $_nWave2 {( "G6" 16 )} 
srcDeselectAll -win $_nTrace1
srcSelect -signal "reg_file_1" -line 3344 -pos 1 -win $_nTrace1
srcSelect -signal "reg_file_2" -line 3345 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave2 {("G6" 6)}
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
wvAddSignal -win $_nWave2 \
           "/tb_DandRiscvSmallest/u_DandRiscvSimple/regFileModule_1/reg_file_1\[63:0\]" \
           "/tb_DandRiscvSmallest/u_DandRiscvSimple/regFileModule_1/reg_file_2\[63:0\]"
wvSetPosition -win $_nWave2 {("G6" 17)}
wvSetPosition -win $_nWave2 {("G6" 19)}
wvSetPosition -win $_nWave2 {("G6" 17)}
wvSetPosition -win $_nWave2 {("G6" 19)}
wvSetPosition -win $_nWave2 {("G6" 19)}
wvSetPosition -win $_nWave2 {("G6" 19)}
wvSetPosition -win $_nWave2 {("G6" 19)}
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
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
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 2
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
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
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
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
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
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 44
wvSetPosition -win $_nWave2 {("G6" 18)}
wvSetPosition -win $_nWave2 {("G6" 17)}
wvSetPosition -win $_nWave2 {("G6" 16)}
wvSetPosition -win $_nWave2 {("G6" 15)}
wvSetPosition -win $_nWave2 {("G6" 14)}
wvSetPosition -win $_nWave2 {("G6" 13)}
wvSetPosition -win $_nWave2 {("G6" 12)}
wvSetPosition -win $_nWave2 {("G6" 11)}
wvSetPosition -win $_nWave2 {("G6" 10)}
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
wvSetPosition -win $_nWave2 {("G4" 31)}
wvSetPosition -win $_nWave2 {("G4" 30)}
wvSetPosition -win $_nWave2 {("G4" 29)}
wvSetPosition -win $_nWave2 {("G4" 28)}
wvSetPosition -win $_nWave2 {("G4" 27)}
wvSetPosition -win $_nWave2 {("G4" 26)}
wvSetPosition -win $_nWave2 {("G4" 25)}
wvSetPosition -win $_nWave2 {("G4" 24)}
wvSetPosition -win $_nWave2 {("G4" 23)}
wvSetPosition -win $_nWave2 {("G4" 22)}
wvSetPosition -win $_nWave2 {("G4" 21)}
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
wvSetPosition -win $_nWave2 {("G3" 10)}
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
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G2" 10)}
wvSetPosition -win $_nWave2 {("G2" 12)}
wvSetPosition -win $_nWave2 {("G2" 12)}
wvSetPosition -win $_nWave2 {("G2" 12)}
wvSetPosition -win $_nWave2 {("G2" 12)}
wvSelectSignal -win $_nWave2 {( "G2" 8 )} 
wvSelectSignal -win $_nWave2 {( "G2" 8 9 )} 
wvSelectSignal -win $_nWave2 {( "G2" 8 9 10 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G3" 2)}
wvSetPosition -win $_nWave2 {("G2" 9)}
wvSetPosition -win $_nWave2 {("G2" 9)}
wvSetPosition -win $_nWave2 {("G2" 9)}
wvSetPosition -win $_nWave2 {("G2" 9)}
wvZoom -win $_nWave2 128.112893 185.900366
wvSetCursor -win $_nWave2 139.661801 -snap {("G2" 8)}
wvZoom -win $_nWave2 134.595737 153.056817
wvZoom -win $_nWave2 136.502194 142.029545
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 7 )} 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 139.298721 159.864083
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 155.876297 166.082584
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 171.716514 178.753241
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 172.882331 -snap {("G2" 7)}
wvSetMarker -win $_nWave2 173.000000
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 168.626837 184.101362
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
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
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
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
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 2
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 2
wvScrollDown -win $_nWave2 0
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
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
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
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
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
wvSelectSignal -win $_nWave2 {( "G2" 2 )} 
wvSelectSignal -win $_nWave2 {( "G2" 3 )} 
wvSelectSignal -win $_nWave2 {( "G2" 4 )} 
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G2" 8 )} 
srcDeselectAll -win $_nTrace1
srcSelect -signal "reg_file_1" -line 3344 -pos 1 -win $_nTrace1
srcAction -pos 3343 9 3 -win $_nTrace1 -name "reg_file_1" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "_zz_1\[1\]" -line 3460 -pos 1 -win $_nTrace1
srcSelect -signal "write_ports_rd_value" -line 3461 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "when_DecodePlugin_l61" -line 3456 -pos 1 -win $_nTrace1
srcSelect -signal "_zz_1\[1\]" -line 3460 -pos 1 -win $_nTrace1
srcSelect -signal "write_ports_rd_value" -line 3461 -pos 1 -win $_nTrace1
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
wvAddSignal -win $_nWave2 \
           "/tb_DandRiscvSmallest/u_DandRiscvSimple/regFileModule_1/when_DecodePlugin_l61" \
           "/tb_DandRiscvSmallest/u_DandRiscvSimple/regFileModule_1/_zz_1\[1\]" \
           "/tb_DandRiscvSmallest/u_DandRiscvSimple/regFileModule_1/write_ports_rd_value\[63:0\]"
wvSetPosition -win $_nWave2 {("G2" 9)}
wvSetPosition -win $_nWave2 {("G2" 12)}
wvSetPosition -win $_nWave2 {("G2" 9)}
wvSetPosition -win $_nWave2 {("G2" 12)}
wvSetPosition -win $_nWave2 {("G2" 12)}
wvSetPosition -win $_nWave2 {("G2" 12)}
wvSetPosition -win $_nWave2 {("G2" 12)}
wvSetCursor -win $_nWave2 174.927015 -snap {("G2" 8)}
wvSetCursor -win $_nWave2 173.099044 -snap {("G2" 8)}
wvSetCursor -win $_nWave2 174.961505 -snap {("G2" 8)}
wvSetCursor -win $_nWave2 173.053057 -snap {("G2" 8)}
wvSetCursor -win $_nWave2 173.007070 -snap {("G2" 8)}
wvSetCursor -win $_nWave2 173.007070 -snap {("G2" 8)}
wvSelectSignal -win $_nWave2 {( "G2" 10 )} 
wvSelectSignal -win $_nWave2 {( "G2" 10 11 )} 
wvSelectSignal -win $_nWave2 {( "G2" 10 11 12 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G3" 2)}
wvSetPosition -win $_nWave2 {("G2" 9)}
wvSetPosition -win $_nWave2 {("G2" 9)}
wvSetPosition -win $_nWave2 {("G2" 9)}
wvSetPosition -win $_nWave2 {("G2" 9)}
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 6
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
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
wvZoom -win $_nWave2 165.143345 191.631684
wvScrollDown -win $_nWave2 56
wvSelectSignal -win $_nWave2 {( "G7" 13 )} 
wvSelectSignal -win $_nWave2 {( "G7" 13 14 )} 
wvZoom -win $_nWave2 171.302966 182.185619
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G7" 5 )} 
wvSelectSignal -win $_nWave2 {( "G7" 5 6 )} 
wvSetCursor -win $_nWave2 173.025109 -snap {("G7" 6)}
srcActiveTrace "tb_DandRiscvSmallest.u_DandRiscvSimple.execute_REDIRECT_VALID" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 159000 -TraceValue 0
srcDeselectAll -win $_nTrace1
srcSelect -signal "execute_ALUPlugin_redirect_valid" -line 948 -pos 1 -win \
          $_nTrace1
srcAction -pos 947 7 9 -win $_nTrace1 -name "execute_ALUPlugin_redirect_valid" \
          -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "execute_ALUPlugin_branch_taken" -line 2050 -pos 1 -win \
          $_nTrace1
srcAction -pos 2049 3 23 -win $_nTrace1 -name "execute_ALUPlugin_branch_taken" \
          -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "execute_ALUPlugin_blt_result" -line 2187 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave2 {("G6" 2)}
wvSetPosition -win $_nWave2 {("G6" 1)}
wvSetPosition -win $_nWave2 {("G2" 9)}
wvSetPosition -win $_nWave2 {("G7" 12)}
wvSetPosition -win $_nWave2 {("G7" 13)}
wvSetPosition -win $_nWave2 {("G7" 14)}
wvAddSignal -win $_nWave2 \
           "/tb_DandRiscvSmallest/u_DandRiscvSimple/execute_ALUPlugin_blt_result"
wvSetPosition -win $_nWave2 {("G7" 14)}
wvSetPosition -win $_nWave2 {("G7" 15)}
wvSetPosition -win $_nWave2 {("G7" 14)}
wvSetPosition -win $_nWave2 {("G7" 15)}
wvSetPosition -win $_nWave2 {("G7" 15)}
wvSetPosition -win $_nWave2 {("G7" 15)}
wvSetPosition -win $_nWave2 {("G7" 15)}
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
srcDeselectAll -win $_nTrace1
srcSelect -signal "execute_ALUPlugin_blt_result" -line 2187 -pos 1 -win $_nTrace1
srcAction -pos 2186 23 21 -win $_nTrace1 -name "execute_ALUPlugin_blt_result" \
          -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "execute_ALUPlugin_blt" -line 2183 -pos 1 -win $_nTrace1
srcSelect -signal "_zz_execute_ALUPlugin_blt_result" -line 2183 -pos 1 -win \
          $_nTrace1
srcSelect -signal "_zz_execute_ALUPlugin_blt_result_1" -line 2183 -pos 1 -win \
          $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G7" 11 )} 
wvSetCursor -win $_nWave2 172.911917 -snap {("G7" 11)}
srcActiveTrace \
           "tb_DandRiscvSmallest.u_DandRiscvSimple.execute_ALUPlugin_branch_taken" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 167000 -TraceValue 0
srcDeselectAll -win $_nTrace1
srcSelect -signal "execute_ALUPlugin_beq_result" -line 2187 -pos 1 -win $_nTrace1
srcSelect -signal "execute_ALUPlugin_bne_result" -line 2187 -pos 1 -win $_nTrace1
srcSelect -signal "execute_ALUPlugin_blt_result" -line 2187 -pos 1 -win $_nTrace1
srcSelect -signal "execute_ALUPlugin_bge_result" -line 2187 -pos 1 -win $_nTrace1
srcSelect -signal "execute_ALUPlugin_bltu_result" -line 2187 -pos 1 -win \
          $_nTrace1
srcSelect -signal "execute_ALUPlugin_bgeu_result" -line 2187 -pos 1 -win \
          $_nTrace1
srcSelect -signal "execute_ALUPlugin_jal" -line 2187 -pos 1 -win $_nTrace1
srcSelect -signal "execute_ALUPlugin_jalr" -line 2187 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
srcDeselectAll -win $_nTrace1
srcSelect -signal "execute_ALUPlugin_bne_result" -line 2187 -pos 1 -win $_nTrace1
srcAction -pos 2186 18 13 -win $_nTrace1 -name "execute_ALUPlugin_bne_result" \
          -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "execute_ALUPlugin_bne" -line 2182 -pos 1 -win $_nTrace1
srcSelect -signal "execute_ALUPlugin_branch_src1" -line 2182 -pos 1 -win \
          $_nTrace1
srcSelect -signal "execute_ALUPlugin_branch_src2" -line 2182 -pos 1 -win \
          $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSetCursor -win $_nWave2 172.944258 -snap {("G7" 27)}
srcActiveTrace "tb_DandRiscvSmallest.u_DandRiscvSimple.execute_ALUPlugin_bne" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 167000 -TraceValue 0
srcDeselectAll -win $_nTrace1
srcSelect -signal "execute_ALU_CTRL" -line 1954 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G7" 30 )} 
wvSetRadix -win $_nWave2 -format UDec
srcDeselectAll -win $_nTrace1
debReload
wvSelectSignal -win $_nWave2 {( "G7" 15 )} 
wvSelectSignal -win $_nWave2 {( "G7" 16 )} 
wvSelectSignal -win $_nWave2 {( "G7" 11 )} 
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G7" 6 )} 
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
srcDeselectAll -win $_nTrace1
debReload
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
wvScrollUp -win $_nWave2 39
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 49.157900 229.231049
wvZoom -win $_nWave2 59.191694 118.591752
wvZoom -win $_nWave2 61.486495 85.272997
wvSelectSignal -win $_nWave2 {( "G2" 7 )} 
wvSetCursor -win $_nWave2 70.923339 -snap {("G2" 4)}
wvSetMarker -win $_nWave2 69.000000
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
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
wvZoom -win $_nWave2 66.187245 73.909906
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 62.520989 77.897461
wvZoom -win $_nWave2 65.879595 72.448295
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvSetCursor -win $_nWave2 66.967871 -snap {("G7" 7)}
srcActiveTrace \
           "tb_DandRiscvSmallest.u_DandRiscvSimple.execute_ALU_RESULT\[63:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 65000 -TraceValue \
           0000000000000000000000000000000010000000000000000000000000011000
srcDeselectAll -win $_nTrace1
srcSelect -signal "execute_ALUPlugin_alu_result" -line 957 -pos 1 -win $_nTrace1
srcAction -pos 956 7 12 -win $_nTrace1 -name "execute_ALUPlugin_alu_result" \
          -ctrlKey off
wvScrollDown -win $_nWave2 4
wvScrollDown -win $_nWave2 14
wvSelectSignal -win $_nWave2 {( "G7" 8 )} 
wvSelectSignal -win $_nWave2 {( "G7" 8 9 )} 
wvSelectSignal -win $_nWave2 {( "G7" 8 9 10 )} 
wvSelectSignal -win $_nWave2 {( "G7" 8 9 10 11 )} 
wvSelectSignal -win $_nWave2 {( "G7" 8 9 10 11 12 )} 
wvSelectSignal -win $_nWave2 {( "G7" 8 9 10 11 12 13 )} 
wvSelectSignal -win $_nWave2 {( "G7" 8 9 10 11 12 13 14 )} 
wvSelectSignal -win $_nWave2 {( "G7" 8 9 10 11 12 13 14 15 )} 
wvSelectSignal -win $_nWave2 {( "G7" 8 9 10 11 12 13 14 15 16 )} 
wvSelectSignal -win $_nWave2 {( "G7" 8 9 10 11 12 13 14 15 16 17 )} 
wvSelectSignal -win $_nWave2 {( "G7" 8 9 10 11 12 13 14 15 16 17 18 )} 
wvSelectSignal -win $_nWave2 {( "G7" 8 9 10 11 12 13 14 15 16 17 18 19 )} 
wvSelectSignal -win $_nWave2 {( "G7" 8 9 10 11 12 13 14 15 16 17 18 19 20 )} 
wvSelectSignal -win $_nWave2 {( "G7" 8 9 10 11 12 13 14 15 16 17 18 19 20 21 )} \
           
wvSelectSignal -win $_nWave2 {( "G7" 8 9 10 11 12 13 14 15 16 17 18 19 20 21 23 \
           )} 
wvSelectSignal -win $_nWave2 {( "G7" 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 \
           23 )} 
wvSelectSignal -win $_nWave2 {( "G7" 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 \
           23 25 )} 
wvSelectSignal -win $_nWave2 {( "G7" 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 \
           23 24 25 )} 
wvSelectSignal -win $_nWave2 {( "G7" 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 \
           23 24 25 26 )} 
wvSelectSignal -win $_nWave2 {( "G7" 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 \
           23 24 25 26 27 )} 
wvSelectSignal -win $_nWave2 {( "G7" 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 \
           23 24 25 26 27 28 )} 
wvSelectSignal -win $_nWave2 {( "G7" 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 \
           23 24 25 26 27 28 29 )} 
wvSelectSignal -win $_nWave2 {( "G7" 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 \
           23 24 25 26 27 28 29 30 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G10" 0)}
wvSetPosition -win $_nWave2 {("G7" 7)}
wvSetPosition -win $_nWave2 {("G7" 7)}
wvSetPosition -win $_nWave2 {("G7" 7)}
wvSetPosition -win $_nWave2 {("G7" 7)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "execute_ALUPlugin_add_result" -line 2169 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvSetCursor -win $_nWave2 66.987392 -snap {("G7" 8)}
srcActiveTrace \
           "tb_DandRiscvSmallest.u_DandRiscvSimple.execute_ALUPlugin_add_result\[63:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 65000 -TraceValue \
           0000000000000000000000000000000010000000000000000000000000011000
srcDeselectAll -win $_nTrace1
srcSelect -signal "_zz_execute_ALUPlugin_add_result" -line 1753 -pos 1 -win \
          $_nTrace1
srcSelect -signal "_zz_execute_ALUPlugin_add_result_1" -line 1753 -pos 1 -win \
          $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G7" 10 )} 
wvSetCursor -win $_nWave2 66.958111 -snap {("G7" 10)}
srcActiveTrace \
           "tb_DandRiscvSmallest.u_DandRiscvSimple._zz_execute_ALUPlugin_add_result_1\[63:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 65000 -TraceValue \
           0000000000000000000000000000000000000000000000000000000000010000
srcDeselectAll -win $_nTrace1
srcSelect -signal "execute_ALUPlugin_src2" -line 793 -pos 1 -win $_nTrace1
srcAction -pos 792 7 8 -win $_nTrace1 -name "execute_ALUPlugin_src2" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "execute_ALUPlugin_src2" -line 2081 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
srcDeselectAll -win $_nTrace1
srcSelect -signal "execute_IMM" -line 2081 -pos 1 -win $_nTrace1
srcAction -pos 2080 5 4 -win $_nTrace1 -name "execute_IMM" -ctrlKey off
srcBackwardHistory -win $_nTrace1
srcHBSelect "tb_DandRiscvSmallest.u_DandRiscvSimple" -win $_nTrace1
srcHBSelect "tb_DandRiscvSmallest.u_DandRiscvSimple" -win $_nTrace1
srcDeselectAll -win $_nTrace1
debReload
wvSelectSignal -win $_nWave2 {( "G7" 8 )} 
