debImport "./simWorkspace/tb_DandSocSimple/tb_DandSocSimple.fsdb" "-f" \
          "./hw/verilog/tb/tb_DandSocSimple.f" "-sv" "-v2k"
wvCreateWindow
wvSetPosition -win $_nWave2 {("G1" 0)}
wvOpenFile -win $_nWave2 \
           {/home/lin/SpinalProjects/DandRiscvSoC/simWorkspace/tb_DandSocSimple/tb_DandSocSimple.fsdb}
srcHBSelect "tb_DandSocSimple.u_DandSocSimple" -win $_nTrace1
srcSetScope -win $_nTrace1 "tb_DandSocSimple.u_DandSocSimple" -delim "."
srcHBSelect "tb_DandSocSimple.u_DandSocSimple" -win $_nTrace1
srcHBSelect "tb_DandSocSimple.u_DandSocSimple.axi_ram" -win $_nTrace1
srcSetScope -win $_nTrace1 "tb_DandSocSimple.u_DandSocSimple.axi_ram" -delim "."
srcHBSelect "tb_DandSocSimple.u_DandSocSimple.axi_ram" -win $_nTrace1
srcHBSelect "tb_DandSocSimple.u_DandSocSimple.core_cpu" -win $_nTrace1
srcSetScope -win $_nTrace1 "tb_DandSocSimple.u_DandSocSimple.core_cpu" -delim "."
srcHBSelect "tb_DandSocSimple.u_DandSocSimple.core_cpu" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {5069 5098 6 1 1 1}
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 0.000000 2683416.789396
srcHBSelect "tb_DandSocSimple.u_DandSocSimple.core_cpu" -win $_nTrace1
srcSetScope -win $_nTrace1 "tb_DandSocSimple.u_DandSocSimple.core_cpu" -delim "."
srcHBSelect "tb_DandSocSimple.u_DandSocSimple.core_cpu" -win $_nTrace1
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G1" 14 )} 
srcDeselectAll -win $_nTrace1
srcSearchString "writeback_PC" -win $_nTrace1 -next -case
wvSetPosition -win $_nWave2 {("G1" 6)}
wvSetPosition -win $_nWave2 {("G1" 8)}
wvSetPosition -win $_nWave2 {("G1" 9)}
wvSetPosition -win $_nWave2 {("G1" 0)}
wvSetPosition -win $_nWave2 {("G1" 24)}
wvSetPosition -win $_nWave2 {("G1" 25)}
wvSetPosition -win $_nWave2 {("G1" 26)}
wvSetPosition -win $_nWave2 {("G1" 27)}
wvSetPosition -win $_nWave2 {("G1" 28)}
wvSetPosition -win $_nWave2 {("G1" 29)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G1" 0)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvAddSignal -win $_nWave2 \
           "/tb_DandSocSimple/u_DandSocSimple/core_cpu/writeback_PC\[63:0\]"
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G2" 1)}
wvSetPosition -win $_nWave2 {("G2" 1)}
wvSelectSignal -win $_nWave2 {( "G2" 1 )} 
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "writeback_INSTRUCTION" -line 5358 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
srcSearchString "writeback_PC" -win $_nTrace1 -prev -case
srcSelect -win $_nTrace1 -range {8427 8427 2 3 14 1}
nsMsgSwitchTab -tab general
srcSearchString "writeback_arb" -win $_nTrace1 -next -case
srcDeselectAll -win $_nTrace1
srcSelect -signal "writeback_arbitration_isFiring" -line 5471 -pos 1 -win \
          $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvZoom -win $_nWave2 243048.796094 422865.385074
wvZoom -win $_nWave2 264301.051272 316537.902783
srcHBSelect "tb_DandSocSimple" -win $_nTrace1
srcSetScope -win $_nTrace1 "tb_DandSocSimple" -delim "."
srcHBSelect "tb_DandSocSimple" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "instrCnt" -line 48 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 4 )} 
wvSetRadix -win $_nWave2 -format UDec
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 584683.463163 801324.072672
wvZoom -win $_nWave2 671387.565717 707919.745082
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvSetMarker -win $_nWave2 675000.000000
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoom -win $_nWave2 650794.068489 709762.063458
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvZoom -win $_nWave2 674763.386031 686074.993313
wvSetMarker -win $_nWave2 677000.000000
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
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 1 )} {( "G2" 4 )} 
wvZoom -win $_nWave2 659373.717106 703087.498415
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 6 )} 
wvSelectSignal -win $_nWave2 {( "G1" 9 )} 
wvSelectSignal -win $_nWave2 {( "G1" 9 10 )} 
wvZoom -win $_nWave2 669577.891388 698387.784077
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvSetCursor -win $_nWave2 672866.207564 -snap {("G1" 10)}
srcActiveTrace \
           "tb_DandSocSimple.u_DandSocSimple.core_cpu.dcache_r_payload_data\[63:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 557000 -TraceValue \
           0000000000000000100000000110011100000000000000000000000000000000
wvScrollUp -win $_nWave2 2
wvSelectGroup -win $_nWave2 {G1}
wvSetPosition -win $_nWave2 {("G1" 0)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G2" 1)}
wvSetPosition -win $_nWave2 {("G2" 2)}
wvSetPosition -win $_nWave2 {("G2" 3)}
wvSetPosition -win $_nWave2 {("G2" 4)}
wvSetPosition -win $_nWave2 {("G3" 0)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 29)}
wvSetPosition -win $_nWave2 {("G1" 29)}
wvSelectGroup -win $_nWave2 {G1}
wvSelectGroup -win $_nWave2 {G3}
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G4" 0)}
wvSetPosition -win $_nWave2 {("G1" 29)}
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvZoom -win $_nWave2 672738.917905 707658.714198
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 655896.159016 709278.704748
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 660888.488403 721425.395934
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
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 14 )} 
wvSelectSignal -win $_nWave2 {( "G1" 13 )} 
wvSelectSignal -win $_nWave2 {( "G1" 14 )} 
wvSelectSignal -win $_nWave2 {( "G1" 15 )} 
wvSelectSignal -win $_nWave2 {( "G1" 8 )} 
wvSetCursor -win $_nWave2 673058.279092 -snap {("G1" 8)}
srcActiveTrace "tb_DandSocSimple.u_DandSocSimple.core_cpu.dcache_r_valid" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 559000 -TraceValue 0
srcDeselectAll -win $_nTrace1
srcSelect -signal "io_outputs_1_r_valid" -line 3717 -pos 1 -win $_nTrace1
srcAction -pos 3716 8 8 -win $_nTrace1 -name "io_outputs_1_r_valid" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcBackwardHistory -win $_nTrace1
srcHBSelect "tb_DandSocSimple.u_DandSocSimple.axi4ReadOnlyArbiter_1" -win \
           $_nTrace1
srcHBSelect "tb_DandSocSimple.u_DandSocSimple.core_cpu_dcache_decoder" -win \
           $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "errorSlave_io_axi_r_valid" -line 3718 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G2" 2)}
wvSetPosition -win $_nWave2 {("G1" 2)}
wvSetPosition -win $_nWave2 {("G1" 4)}
wvSetPosition -win $_nWave2 {("G1" 7)}
wvSetPosition -win $_nWave2 {("G1" 10)}
wvSetPosition -win $_nWave2 {("G1" 11)}
wvSetPosition -win $_nWave2 {("G1" 12)}
wvSetPosition -win $_nWave2 {("G1" 29)}
wvSetPosition -win $_nWave2 {("G1" 28)}
wvSetPosition -win $_nWave2 {("G1" 29)}
wvSetPosition -win $_nWave2 {("G4" 0)}
wvAddSignal -win $_nWave2 \
           "/tb_DandSocSimple/u_DandSocSimple/core_cpu_dcache_decoder/errorSlave_io_axi_r_valid"
wvSetPosition -win $_nWave2 {("G4" 0)}
wvSetPosition -win $_nWave2 {("G4" 1)}
wvSetPosition -win $_nWave2 {("G4" 1)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "io_outputs_1_r_valid" -line 3717 -pos 1 -win $_nTrace1
srcSelect -signal "io_outputs_0_r_valid" -line 3717 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvSetCursor -win $_nWave2 673236.591044 -snap {("G4" 2)}
srcActiveTrace \
           "tb_DandSocSimple.u_DandSocSimple.core_cpu_dcache_decoder.io_outputs_1_r_valid" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 673000 -TraceValue 1
srcDeselectAll -win $_nTrace1
srcSelect -signal "io_output_r_valid" -line 2947 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "io_output_r_valid" -line 2947 -pos 1 -win $_nTrace1
srcAction -pos 2946 8 10 -win $_nTrace1 -name "io_output_r_valid" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "readOnly_io_input_r_valid" -line 5014 -pos 1 -win $_nTrace1
srcAction -pos 5013 7 14 -win $_nTrace1 -name "readOnly_io_input_r_valid" \
          -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "dataOut_valid" -line 10296 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvSetCursor -win $_nWave2 673236.591044 -snap {("G4" 4)}
srcActiveTrace \
           "tb_DandSocSimple.u_DandSocSimple.axi_downsizer.readOnly.dataOut_valid" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 673000 -TraceValue 1
srcDeselectAll -win $_nTrace1
srcBackwardHistory -win $_nTrace1
srcHBSelect "tb_DandSocSimple.u_DandSocSimple.axi_downsizer.readOnly" -win \
           $_nTrace1
srcHBSelect "tb_DandSocSimple.u_DandSocSimple.axi_downsizer.readOnly" -win \
           $_nTrace1
srcBackwardHistory -win $_nTrace1
srcHBSelect "tb_DandSocSimple.u_DandSocSimple.axi_downsizer.readOnly" -win \
           $_nTrace1
srcHBSelect "tb_DandSocSimple.u_DandSocSimple.axi_downsizer" -win $_nTrace1
srcBackwardHistory -win $_nTrace1
srcHBSelect "tb_DandSocSimple.u_DandSocSimple.axi_downsizer" -win $_nTrace1
srcHBSelect "tb_DandSocSimple.u_DandSocSimple.axi4ReadOnlyArbiter_1" -win \
           $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "readRspSels_1" -line 2947 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
srcDeselectAll -win $_nTrace1
srcSelect -signal "readRspSels_1" -line 2947 -pos 1 -win $_nTrace1
srcAction -pos 2946 12 3 -win $_nTrace1 -name "readRspSels_1" -ctrlKey off
srcDeselectAll -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G1" 10 )} 
wvSetPosition -win $_nWave2 {("G1" 10)}
wvExpandBus -win $_nWave2 {("G1" 10)}
wvSetPosition -win $_nWave2 {("G4" 5)}
wvScrollUp -win $_nWave2 34
wvSelectSignal -win $_nWave2 {( "G1" 10 )} 
wvSetPosition -win $_nWave2 {("G1" 10)}
wvCollapseBus -win $_nWave2 {("G1" 10)}
wvSetPosition -win $_nWave2 {("G1" 10)}
wvSetPosition -win $_nWave2 {("G4" 5)}
wvSetCursor -win $_nWave2 673102.857080 -snap {("G1" 10)}
srcActiveTrace \
           "tb_DandSocSimple.u_DandSocSimple.core_cpu.dcache_r_payload_data\[63:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 673000 -TraceValue \
           0000000000000000000000000000000000000000000000000000000000000000
srcDeselectAll -win $_nTrace1
srcSelect -signal "_zz_io_input_r_payload_data" -line 3723 -pos 1 -win $_nTrace1
srcSelect -signal "io_outputs_0_r_payload_data" -line 3723 -pos 1 -win $_nTrace1
srcSelect -signal "io_outputs_1_r_payload_data" -line 3723 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSelectSignal -win $_nWave2 {( "G4" 8 )} 
wvSetCursor -win $_nWave2 672790.811165 -snap {("G4" 8)}
srcActiveTrace \
           "tb_DandSocSimple.u_DandSocSimple.core_cpu_dcache_decoder.io_outputs_1_r_payload_data\[63:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 557000 -TraceValue \
           0000000000000000100000000110011100000000000000000000000000000000
srcDeselectAll -win $_nTrace1
srcSelect -signal "io_output_r_payload_data" -line 2948 -pos 1 -win $_nTrace1
srcAction -pos 2947 7 5 -win $_nTrace1 -name "io_output_r_payload_data" -ctrlKey \
          off
srcDeselectAll -win $_nTrace1
srcSelect -signal "readOnly_io_input_r_payload_data" -line 5015 -pos 1 -win \
          $_nTrace1
srcAction -pos 5014 7 13 -win $_nTrace1 -name "readOnly_io_input_r_payload_data" \
          -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "dataOut_payload_data" -line 10298 -pos 1 -win $_nTrace1
srcAction -pos 10297 7 8 -win $_nTrace1 -name "dataOut_payload_data" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "dataReg_aheadValue" -line 10292 -pos 1 -win $_nTrace1
srcAction -pos 10291 7 4 -win $_nTrace1 -name "dataReg_aheadValue" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "dataReg" -line 10190 -pos 1 -win $_nTrace1
srcAction -pos 10189 5 3 -win $_nTrace1 -name "dataReg" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "dataReg_aheadValue" -line 10322 -pos 1 -win $_nTrace1
srcAction -pos 10321 5 4 -win $_nTrace1 -name "dataReg_aheadValue" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "dataReg" -line 10190 -pos 1 -win $_nTrace1
srcAction -pos 10189 5 1 -win $_nTrace1 -name "dataReg" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "dataReg_aheadValue" -line 10322 -pos 1 -win $_nTrace1
srcAction -pos 10321 5 9 -win $_nTrace1 -name "dataReg_aheadValue" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "io_output_r_payload_data" -line 10192 -pos 1 -win $_nTrace1
srcAction -pos 10191 5 5 -win $_nTrace1 -name "io_output_r_payload_data" -ctrlKey \
          off
srcDeselectAll -win $_nTrace1
srcSelect -signal \
          "toplevel_axi_downsizer_io_output_readOnly_decoder_io_input_r_payload_data" \
          -line 1487 -pos 1 -win $_nTrace1
srcAction -pos 1486 7 5 -win $_nTrace1 -name \
          "toplevel_axi_downsizer_io_output_readOnly_decoder_io_input_r_payload_data" \
          -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "io_input_r_payload_data" -line 2755 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
srcDeselectAll -win $_nTrace1
srcSelect -signal "_zz_io_input_r_payload_data" -line 2755 -pos 1 -win $_nTrace1
srcSelect -signal "io_outputs_0_r_payload_data" -line 2755 -pos 1 -win $_nTrace1
srcSelect -signal "io_outputs_1_r_payload_data" -line 2755 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvSetCursor -win $_nWave2 673192.013056 -snap {("G4" 12)}
srcActiveTrace \
           "tb_DandSocSimple.u_DandSocSimple.toplevel_axi_downsizer_io_output_readOnly_decoder.io_outputs_1_r_payload_data\[31:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 673000 -TraceValue \
           00000000000000000000000000000000
srcDeselectAll -win $_nTrace1
srcSelect -signal "io_output_r_payload_data" -line 1968 -pos 1 -win $_nTrace1
srcAction -pos 1967 7 5 -win $_nTrace1 -name "io_output_r_payload_data" -ctrlKey \
          off
srcDeselectAll -win $_nTrace1
srcSelect -signal "readedData" -line 3983 -pos 1 -win $_nTrace1
srcAction -pos 3982 7 4 -win $_nTrace1 -name "readedData" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "io_apb_PRDATA" -line 4026 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
srcHBSelect "tb_DandSocSimple.u_DandSocSimple.axi_apbBridge" -win $_nTrace1
srcSetScope -win $_nTrace1 "tb_DandSocSimple.u_DandSocSimple.axi_apbBridge" \
           -delim "."
srcHBSelect "tb_DandSocSimple.u_DandSocSimple.axi_apbBridge" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "io_apb_PADDR" -line 3835 -pos 1 -win $_nTrace1
srcSelect -signal "io_apb_PSEL" -line 3836 -pos 1 -win $_nTrace1
srcSelect -signal "io_apb_PENABLE" -line 3837 -pos 1 -win $_nTrace1
srcSelect -signal "io_apb_PREADY" -line 3838 -pos 1 -win $_nTrace1
srcSelect -signal "io_apb_PWRITE" -line 3839 -pos 1 -win $_nTrace1
srcSelect -signal "io_apb_PWDATA" -line 3840 -pos 1 -win $_nTrace1
srcSelect -signal "io_apb_PRDATA" -line 3841 -pos 1 -win $_nTrace1
srcSelect -signal "io_apb_PSLVERROR" -line 3842 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G4" 17 )} 
wvSelectSignal -win $_nWave2 {( "G4" 18 )} 
wvSelectSignal -win $_nWave2 {( "G4" 19 )} 
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "io_apb_PRDATA" -line 3841 -pos 1 -win $_nTrace1
srcAction -pos 3840 9 8 -win $_nTrace1 -name "io_apb_PRDATA" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "io_output_PRDATA" -line 1688 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "io_output_PRDATA" -line 1688 -pos 1 -win $_nTrace1
srcAction -pos 1687 7 5 -win $_nTrace1 -name "io_output_PRDATA" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "io_outputs_0_PRDATA" -line 1650 -pos 1 -win $_nTrace1
srcAction -pos 1649 7 7 -win $_nTrace1 -name "io_outputs_0_PRDATA" -ctrlKey off
srcHBSelect "tb_DandSocSimple.u_DandSocSimple.axi_uartCtrl" -win $_nTrace1
srcSetScope -win $_nTrace1 "tb_DandSocSimple.u_DandSocSimple.axi_uartCtrl" -delim \
           "."
srcHBSelect "tb_DandSocSimple.u_DandSocSimple.axi_uartCtrl" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "io_apb_PADDR" -line 3767 -pos 1 -win $_nTrace1
srcSelect -signal "io_apb_PSEL" -line 3768 -pos 1 -win $_nTrace1
srcSelect -signal "io_apb_PENABLE" -line 3769 -pos 1 -win $_nTrace1
srcSelect -signal "io_apb_PREADY" -line 3770 -pos 1 -win $_nTrace1
srcSelect -signal "io_apb_PWRITE" -line 3771 -pos 1 -win $_nTrace1
srcSelect -signal "io_apb_PWDATA" -line 3772 -pos 1 -win $_nTrace1
srcSelect -signal "io_apb_PRDATA" -line 3773 -pos 1 -win $_nTrace1
srcSelect -signal "io_apb_PSLVERROR" -line 3774 -pos 1 -win $_nTrace1
srcSelect -signal "io_uart_txd" -line 3775 -pos 1 -win $_nTrace1
srcSelect -signal "io_uart_rxd" -line 3776 -pos 1 -win $_nTrace1
srcSelect -signal "io_resetn" -line 3778 -pos 1 -win $_nTrace1
srcSelect -signal "io_clock" -line 3777 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave2 {("G1" 12)}
wvSetPosition -win $_nWave2 {("G1" 29)}
wvSetPosition -win $_nWave2 {("G4" 1)}
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
wvSetPosition -win $_nWave2 {("G4" 16)}
wvSetPosition -win $_nWave2 {("G4" 17)}
wvSetPosition -win $_nWave2 {("G4" 18)}
wvSetPosition -win $_nWave2 {("G4" 19)}
wvSetPosition -win $_nWave2 {("G4" 20)}
wvSetPosition -win $_nWave2 {("G4" 21)}
wvSetPosition -win $_nWave2 {("G5" 0)}
wvSetPosition -win $_nWave2 {("G1" 29)}
wvSetPosition -win $_nWave2 {("G5" 0)}
wvAddSignal -win $_nWave2 \
           "/tb_DandSocSimple/u_DandSocSimple/axi_uartCtrl/io_apb_PADDR\[15:0\]" \
           "/tb_DandSocSimple/u_DandSocSimple/axi_uartCtrl/io_apb_PSEL\[0:0\]" \
           "/tb_DandSocSimple/u_DandSocSimple/axi_uartCtrl/io_apb_PENABLE" \
           "/tb_DandSocSimple/u_DandSocSimple/axi_uartCtrl/io_apb_PREADY" \
           "/tb_DandSocSimple/u_DandSocSimple/axi_uartCtrl/io_apb_PWRITE" \
           "/tb_DandSocSimple/u_DandSocSimple/axi_uartCtrl/io_apb_PWDATA\[31:0\]" \
           "/tb_DandSocSimple/u_DandSocSimple/axi_uartCtrl/io_apb_PRDATA\[31:0\]" \
           "/tb_DandSocSimple/u_DandSocSimple/axi_uartCtrl/io_apb_PSLVERROR" \
           "/tb_DandSocSimple/u_DandSocSimple/axi_uartCtrl/io_uart_txd" \
           "/tb_DandSocSimple/u_DandSocSimple/axi_uartCtrl/io_uart_rxd" \
           "/tb_DandSocSimple/u_DandSocSimple/axi_uartCtrl/io_resetn" \
           "/tb_DandSocSimple/u_DandSocSimple/axi_uartCtrl/io_clock"
wvSetPosition -win $_nWave2 {("G5" 0)}
wvSetPosition -win $_nWave2 {("G5" 12)}
wvSetPosition -win $_nWave2 {("G5" 12)}
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSelectSignal -win $_nWave2 {( "G5" 11 )} 
wvSelectSignal -win $_nWave2 {( "G5" 11 )} 
wvSelectSignal -win $_nWave2 {( "G5" 10 )} 
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoom -win $_nWave2 662002.938100 710459.210918
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G5" 2 )} 
wvSelectSignal -win $_nWave2 {( "G5" 1 )} 
wvSelectSignal -win $_nWave2 {( "G5" 2 )} 
wvSelectSignal -win $_nWave2 {( "G5" 6 )} 
wvSelectSignal -win $_nWave2 {( "G5" 7 )} 
srcDeselectAll -win $_nTrace1
srcSelect -signal "io_apb_PRDATA" -line 3773 -pos 1 -win $_nTrace1
srcAction -pos 3772 9 8 -win $_nTrace1 -name "io_apb_PRDATA" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "uartCtrl_in_prdata" -line 3807 -pos 1 -win $_nTrace1
srcAction -pos 3806 7 3 -win $_nTrace1 -name "uartCtrl_in_prdata" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "in_psel" -line 45 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "in_prdata" -line 45 -pos 1 -win $_nTrace1
srcSelect -signal "in_psel" -line 45 -pos 1 -win $_nTrace1
srcSelect -signal "reg_dat8_r" -line 45 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSetCursor -win $_nWave2 669210.719476 -snap {("G5" 14)}
wvSetCursor -win $_nWave2 669032.309046 -snap {("G5" 15)}
srcActiveTrace \
           "tb_DandSocSimple.u_DandSocSimple.axi_uartCtrl.uartCtrl.reg_dat8_r\[7:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 581000 -TraceValue \
           xxxxxxxx
srcDeselectAll -win $_nTrace1
srcSelect -signal "lsr" -line 417 -pos 1 -win $_nTrace1
srcAction -pos 416 13 1 -win $_nTrace1 -name "lsr" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "lsr7r" -line 342 -pos 1 -win $_nTrace1
srcSelect -signal "lsr6r" -line 342 -pos 1 -win $_nTrace1
srcSelect -signal "lsr5r" -line 342 -pos 1 -win $_nTrace1
srcSelect -signal "lsr4r" -line 342 -pos 1 -win $_nTrace1
srcSelect -signal "lsr3r" -line 342 -pos 1 -win $_nTrace1
srcSelect -signal "lsr2r" -line 342 -pos 1 -win $_nTrace1
srcSelect -signal "lsr1r" -line 342 -pos 1 -win $_nTrace1
srcSelect -signal "lsr0r" -line 342 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
srcDeselectAll -win $_nTrace1
srcSelect -signal "lsr7r" -line 342 -pos 1 -win $_nTrace1
srcAction -pos 341 8 2 -win $_nTrace1 -name "lsr7r" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "wb_rst_i" -line 692 -pos 1 -win $_nTrace1
srcAction -pos 691 12 1 -win $_nTrace1 -name "wb_rst_i" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "resetn" -line 83 -pos 1 -win $_nTrace1
srcAction -pos 82 6 2 -win $_nTrace1 -name "resetn" -ctrlKey off
srcBackwardHistory -win $_nTrace1
srcHBSelect "tb_DandSocSimple.u_DandSocSimple" -win $_nTrace1
srcHBSelect "tb_DandSocSimple.u_DandSocSimple.axi_uartCtrl.uartCtrl" -win \
           $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "resetn" -line 83 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 356249.946844 1790384.348241
wvZoom -win $_nWave2 592280.166809 844151.341134
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 575705.541314 890266.301001
wvZoom -win $_nWave2 658630.984589 712949.466288
srcDeselectAll -win $_nTrace1
srcSelect -signal "resetn" -line 83 -pos 1 -win $_nTrace1
srcAction -pos 82 6 2 -win $_nTrace1 -name "resetn" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "resetCtrl_axiReset" -line 1353 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 634862.254432 819817.084605
srcDeselectAll -win $_nTrace1
srcBackwardHistory -win $_nTrace1
srcHBSelect "tb_DandSocSimple.u_DandSocSimple" -win $_nTrace1
srcHBSelect "tb_DandSocSimple.u_DandSocSimple.axi_uartCtrl.uartCtrl" -win \
           $_nTrace1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSelectSignal -win $_nWave2 {( "G5" 24 )} 
wvSelectSignal -win $_nWave2 {( "G5" 24 25 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G5" 23)}
srcDeselectAll -win $_nTrace1
srcBackwardHistory -win $_nTrace1
srcHBSelect "tb_DandSocSimple.u_DandSocSimple.axi_uartCtrl.uartCtrl" -win \
           $_nTrace1
srcHBSelect "tb_DandSocSimple.u_DandSocSimple.axi_uartCtrl.uartCtrl.Uregs" -win \
           $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "wb_rst_i" -line 692 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
srcDeselectAll -win $_nTrace1
srcSelect -signal "lsr_mask" -line 694 -pos 1 -win $_nTrace1
srcSelect -signal "lsr7r" -line 694 -pos 2 -win $_nTrace1
srcSelect -signal "lsr7" -line 694 -pos 1 -win $_nTrace1
srcSelect -signal "lsr7_d" -line 694 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvZoom -win $_nWave2 658969.032739 723798.560841
srcDeselectAll -win $_nTrace1
srcSelect -signal "lsr7_d" -line 694 -pos 1 -win $_nTrace1
srcAction -pos 693 25 4 -win $_nTrace1 -name "lsr7_d" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "lsr7" -line 690 -pos 1 -win $_nTrace1
srcAction -pos 689 7 1 -win $_nTrace1 -name "lsr7" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "rf_error_bit" -line 605 -pos 1 -win $_nTrace1
srcSelect -signal "rf_overrun" -line 605 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G5" 29 )} 
wvSelectSignal -win $_nWave2 {( "G5" 29 30 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G5" 28)}
wvSelectSignal -win $_nWave2 {( "G5" 1 )} 
wvSelectSignal -win $_nWave2 {( "G5" 2 )} 
wvSelectSignal -win $_nWave2 {( "G5" 1 2 )} 
wvSelectSignal -win $_nWave2 {( "G5" 1 2 3 )} 
wvSelectSignal -win $_nWave2 {( "G5" 1 2 3 5 )} 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 479613.703521 705514.533401
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 340681.074812 905599.497693
wvZoom -win $_nWave2 382072.373101 539317.707305
wvZoom -win $_nWave2 417562.575555 439505.131396
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 381934.198804 467636.198936
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 338769.025558 881506.287070
wvZoom -win $_nWave2 367744.321184 710851.787316
wvSetCursor -win $_nWave2 603725.450320 -snap {("G5" 4)}
wvSetCursor -win $_nWave2 395410.203026 -snap {("G5" 3)}
wvSetCursor -win $_nWave2 423455.069550 -snap {("G5" 4)}
wvZoom -win $_nWave2 645034.780742 703777.406571
wvSetCursor -win $_nWave2 702566.218410 -snap {("G5" 2)}
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 743962.899498 814903.920382
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 657402.316580 742656.916051
wvSelectSignal -win $_nWave2 {( "G5" 16 )} 
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {622 625 1 1 1 1} -backward
srcDeselectAll -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G5" 15 )} 
wvSetCursor -win $_nWave2 668922.360028 -snap {("G5" 15)}
srcActiveTrace \
           "tb_DandSocSimple.u_DandSocSimple.axi_uartCtrl.uartCtrl.reg_dat8_r\[7:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 581000 -TraceValue \
           xxxxxxxx
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 327458.019765 731255.945979
wvZoom -win $_nWave2 382764.657671 448627.132381
wvSetCursor -win $_nWave2 395180.558647 -snap {("G5" 4)}
wvSelectSignal -win $_nWave2 {( "G5" 1 )} 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 349973.208769 752713.996687
wvSetCursor -win $_nWave2 393568.861069 -snap {("G5" 2)}
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 361814.257187 519588.998845
wvSelectSignal -win $_nWave2 {( "G5" 5 )} 
wvSetCursor -win $_nWave2 394751.767688 -snap {("G5" 4)}
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 382005.412793 441955.167356
wvSelectSignal -win $_nWave2 {( "G5" 1 )} 
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvSetMarker -win $_nWave2 423000.000000
wvSelectSignal -win $_nWave2 {( "G5" 15 )} 
wvZoomOut -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 400855.593352 499476.912713
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 432518.991909 470064.810841
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
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 346814.987249 547649.176293
wvZoom -win $_nWave2 382234.566244 483243.219497
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G4" 19 )} 
wvSelectSignal -win $_nWave2 {( "G5" 6 )} 
wvSelectSignal -win $_nWave2 {( "G5" 1 )} 
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
wvSelectSignal -win $_nWave2 {( "G4" 14 )} 
wvZoom -win $_nWave2 369292.367669 505482.974521
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G5" 1 )} 
wvSetCursor -win $_nWave2 420739.923865 -snap {("G5" 1)}
srcActiveTrace \
           "tb_DandSocSimple.u_DandSocSimple.axi_uartCtrl.io_apb_PADDR\[15:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 401000 -TraceValue \
           0000000000001000
srcDeselectAll -win $_nTrace1
srcSelect -signal "apb3Router_1_io_outputs_0_PADDR\[15:0\]" -line 1528 -pos 1 \
          -win $_nTrace1
srcAction -pos 1527 7 19 -win $_nTrace1 -name \
          "apb3Router_1_io_outputs_0_PADDR\[15:0\]" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "io_input_PADDR" -line 1644 -pos 1 -win $_nTrace1
srcAction -pos 1643 7 6 -win $_nTrace1 -name "io_input_PADDR" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "io_input_PADDR" -line 1676 -pos 1 -win $_nTrace1
srcAction -pos 1675 7 8 -win $_nTrace1 -name "io_input_PADDR" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "io_axi_arw_payload_addr" -line 3976 -pos 1 -win $_nTrace1
srcAction -pos 3975 7 11 -win $_nTrace1 -name "io_axi_arw_payload_addr" -ctrlKey \
          off
srcDeselectAll -win $_nTrace1
srcSelect -signal "cmdOutputFork_payload_addr" -line 1919 -pos 1 -win $_nTrace1
srcAction -pos 1918 7 10 -win $_nTrace1 -name "cmdOutputFork_payload_addr" \
          -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "cmdArbiter_io_output_payload_addr" -line 1902 -pos 1 -win \
          $_nTrace1
srcAction -pos 1901 7 1 -win $_nTrace1 -name "cmdArbiter_io_output_payload_addr" \
          -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "io_inputs_0_payload_addr" -line 8626 -pos 1 -win $_nTrace1
srcAction -pos 8625 12 11 -win $_nTrace1 -name "io_inputs_0_payload_addr" \
          -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "io_readInputs_0_ar_payload_addr" -line 1873 -pos 1 -win \
          $_nTrace1
srcAction -pos 1872 7 7 -win $_nTrace1 -name "io_readInputs_0_ar_payload_addr" \
          -ctrlKey off
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal \
          "toplevel_toplevel_axi_downsizer_io_output_readOnly_decoder_io_outputs_1_ar_validPipe_payload_addr\[19:0\]" \
          -line 1526 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal \
          "toplevel_toplevel_axi_downsizer_io_output_readOnly_decoder_io_outputs_1_ar_validPipe_payload_addr\[19:0\]" \
          -line 1526 -pos 1 -win $_nTrace1
srcAction -pos 1525 7 79 -win $_nTrace1 -name \
          "toplevel_toplevel_axi_downsizer_io_output_readOnly_decoder_io_outputs_1_ar_validPipe_payload_addr\[19:0\]" \
          -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal \
          "toplevel_axi_downsizer_io_output_readOnly_decoder_io_outputs_1_ar_payload_addr" \
          -line 1474 -pos 1 -win $_nTrace1
srcAction -pos 1473 7 8 -win $_nTrace1 -name \
          "toplevel_axi_downsizer_io_output_readOnly_decoder_io_outputs_1_ar_payload_addr" \
          -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "io_input_ar_payload_addr" -line 2735 -pos 1 -win $_nTrace1
srcAction -pos 2734 7 10 -win $_nTrace1 -name "io_input_ar_payload_addr" -ctrlKey \
          off
srcDeselectAll -win $_nTrace1
srcSelect -signal "axi_downsizer_io_output_ar_payload_addr" -line 1357 -pos 1 \
          -win $_nTrace1
srcAction -pos 1356 7 16 -win $_nTrace1 -name \
          "axi_downsizer_io_output_ar_payload_addr" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "readOnly_io_output_ar_payload_addr" -line 5025 -pos 1 -win \
          $_nTrace1
srcAction -pos 5024 7 9 -win $_nTrace1 -name "readOnly_io_output_ar_payload_addr" \
          -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "cmdStream_payload_addr" -line 10233 -pos 1 -win $_nTrace1
srcAction -pos 10232 7 8 -win $_nTrace1 -name "cmdStream_payload_addr" -ctrlKey \
          off
srcDeselectAll -win $_nTrace1
srcSelect -signal "generator_io_output_payload_addr" -line 10221 -pos 1 -win \
          $_nTrace1
srcAction -pos 10220 7 7 -win $_nTrace1 -name "generator_io_output_payload_addr" \
          -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "cmdStream_payload_addr" -line 65482 -pos 1 -win $_nTrace1
srcAction -pos 65481 7 7 -win $_nTrace1 -name "cmdStream_payload_addr" -ctrlKey \
          off
srcDeselectAll -win $_nTrace1
srcSelect -signal "address" -line 65448 -pos 1 -win $_nTrace1
srcAction -pos 65447 7 1 -win $_nTrace1 -name "address" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "cmdStreamWithSize_payload_addr" -line 65502 -pos 1 -win \
          $_nTrace1
srcAction -pos 65501 5 20 -win $_nTrace1 -name "cmdStreamWithSize_payload_addr" \
          -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "startAddress" -line 65421 -pos 1 -win $_nTrace1
srcAction -pos 65420 7 3 -win $_nTrace1 -name "startAddress" -ctrlKey off
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
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G5" 6 )} 
wvSetCursor -win $_nWave2 442201.477523 -snap {("G5" 3)}
wvZoom -win $_nWave2 435632.637501 469931.008299
wvSetCursor -win $_nWave2 460977.567616 -snap {("G5" 7)}
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 443739.984354 -snap {("G5" 3)}
wvSetCursor -win $_nWave2 439395.860807 -snap {("G5" 1)}
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 18
wvScrollUp -win $_nWave2 7
wvSelectSignal -win $_nWave2 {( "G1" 21 )} 
wvSelectSignal -win $_nWave2 {( "G1" 21 22 )} 
wvSelectSignal -win $_nWave2 {( "G1" 21 22 24 )} 
srcDeselectAll -win $_nTrace1
wvZoom -win $_nWave2 431717.875002 463238.027253
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSetCursor -win $_nWave2 437149.182533 -snap {("G1" 22)}
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSetCursor -win $_nWave2 439098.882672 -snap {("G1" 22)}
wvSetCursor -win $_nWave2 437369.684334 -snap {("G1" 22)}
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
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G1" 16 )} 
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G1" 14 )} 
wvSelectSignal -win $_nWave2 {( "G1" 15 )} 
wvSelectSignal -win $_nWave2 {( "G1" 16 )} 
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvSetCursor -win $_nWave2 437009.918237 -snap {("G1" 16)}
srcActiveTrace \
           "tb_DandSocSimple.u_DandSocSimple.core_cpu.dcache_aw_payload_addr\[63:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 435000 -TraceValue \
           0000000000000000000000000000000000010000000000000000000000000011
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G1" 14 )} 
wvSelectSignal -win $_nWave2 {( "G1" 15 )} 
wvSelectSignal -win $_nWave2 {( "G1" 16 )} 
wvSelectSignal -win $_nWave2 {( "G1" 14 )} 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoom -win $_nWave2 432367.775049 454719.694502
wvZoom -win $_nWave2 434235.921483 445214.367930
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G1" 16 )} 
wvSetCursor -win $_nWave2 435044.349056 -snap {("G1" 16)}
srcActiveTrace \
           "tb_DandSocSimple.u_DandSocSimple.core_cpu.dcache_aw_payload_addr\[63:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 435000 -TraceValue \
           0000000000000000000000000000000000010000000000000000000000000011
srcDeselectAll -win $_nTrace1
srcSelect -signal "when_DCachePlugin_l233" -line 8359 -pos 1 -win $_nTrace1
srcAction -pos 8358 6 16 -win $_nTrace1 -name "when_DCachePlugin_l233" -ctrlKey \
          off
srcDeselectAll -win $_nTrace1
srcBackwardHistory -win $_nTrace1
srcHBSelect "tb_DandSocSimple.u_DandSocSimple.core_cpu" -win $_nTrace1
srcHBSelect "tb_DandSocSimple.u_DandSocSimple.core_cpu" -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G1" 21 )} 
wvSelectSignal -win $_nWave2 {( "G1" 21 23 )} 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 437033.080887 -snap {("G1" 16)}
srcActiveTrace \
           "tb_DandSocSimple.u_DandSocSimple.core_cpu.dcache_aw_payload_addr\[63:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 437000 -TraceValue \
           0000000000000000000000000000000000010000000000000000000000000000
srcDeselectAll -win $_nTrace1
srcSelect -signal "when_DCachePlugin_l233" -line 8359 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "dcache_aw_payload_addr" -line 8359 -pos 1 -win $_nTrace1
srcSelect -signal "when_DCachePlugin_l233" -line 8359 -pos 1 -win $_nTrace1
srcSelect -signal "_zz_dcache_aw_payload_addr" -line 8359 -pos 1 -win $_nTrace1
srcSelect -signal "_zz_dcache_aw_payload_addr_1" -line 8359 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave2 {("G1" 11)}
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
wvAddSignal -win $_nWave2 \
           "/tb_DandSocSimple/u_DandSocSimple/core_cpu/dcache_aw_payload_addr\[63:0\]" \
           "/tb_DandSocSimple/u_DandSocSimple/core_cpu/when_DCachePlugin_l233" \
           "/tb_DandSocSimple/u_DandSocSimple/core_cpu/_zz_dcache_aw_payload_addr\[63:0\]" \
           "/tb_DandSocSimple/u_DandSocSimple/core_cpu/_zz_dcache_aw_payload_addr_1\[63:0\]"
wvSetPosition -win $_nWave2 {("G1" 29)}
wvSetPosition -win $_nWave2 {("G1" 33)}
wvSetCursor -win $_nWave2 435262.624501 -snap {("G1" 30)}
wvSetCursor -win $_nWave2 437243.272056 -snap {("G1" 30)}
wvSetCursor -win $_nWave2 437016.912335 -snap {("G1" 30)}
srcActiveTrace \
           "tb_DandSocSimple.u_DandSocSimple.core_cpu.dcache_aw_payload_addr\[63:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 437000 -TraceValue \
           0000000000000000000000000000000000010000000000000000000000000000
wvSelectSignal -win $_nWave2 {( "G1" 31 )} 
wvSetCursor -win $_nWave2 433023.280123 -snap {("G1" 31)}
srcActiveTrace "tb_DandSocSimple.u_DandSocSimple.core_cpu.when_DCachePlugin_l233" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 433000 -TraceValue 1
srcDeselectAll -win $_nTrace1
srcSelect -signal "dCache_1_cpu_bypass_cmd_valid" -line 8076 -pos 1 -win \
          $_nTrace1
srcAction -pos 8075 8 10 -win $_nTrace1 -name "dCache_1_cpu_bypass_cmd_valid" \
          -ctrlKey off
srcBackwardHistory -win $_nTrace1
srcHBSelect "tb_DandSocSimple.u_DandSocSimple.core_cpu.dCache_1" -win $_nTrace1
srcHBSelect "tb_DandSocSimple.u_DandSocSimple.core_cpu" -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G1" 32 )} 
wvSelectSignal -win $_nWave2 {( "G1" 31 )} 
wvSelectSignal -win $_nWave2 {( "G1" 30 )} 
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
wvSelectSignal -win $_nWave2 {( "G1" 32 )} 
wvSelectSignal -win $_nWave2 {( "G1" 31 )} 
wvSelectSignal -win $_nWave2 {( "G1" 30 )} 
wvSetCursor -win $_nWave2 435003.927678 -snap {("G1" 30)}
srcActiveTrace \
           "tb_DandSocSimple.u_DandSocSimple.core_cpu.dcache_aw_payload_addr\[63:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 433000 -TraceValue \
           0000000000000000000000000000000000000000000000000000000010000000
wvSelectSignal -win $_nWave2 {( "G1" 21 )} 
wvSelectSignal -win $_nWave2 {( "G1" 22 )} 
wvSelectSignal -win $_nWave2 {( "G1" 23 )} 
wvSetCursor -win $_nWave2 435117.107538 -snap {("G1" 23)}
srcActiveTrace "tb_DandSocSimple.u_DandSocSimple.core_cpu.dcache_w_ready" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 391000 -TraceValue 0
wvSelectSignal -win $_nWave2 {( "G1" 24 )} 
wvSelectSignal -win $_nWave2 {( "G1" 23 )} 
wvSetCursor -win $_nWave2 435044.349056 -snap {("G1" 23)}
wvSetCursor -win $_nWave2 435044.349056 -snap {("G1" 23)}
srcActiveTrace \
           "tb_DandSocSimple.u_DandSocSimple.core_cpu.dcache_w_payload_data\[63:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 435000 -TraceValue \
           1111111111111111111111111111111110000011000000000000000000000000
srcDeselectAll -win $_nTrace1
srcSelect -signal "when_DCachePlugin_l233" -line 8367 -pos 1 -win $_nTrace1
srcAction -pos 8366 6 9 -win $_nTrace1 -name "when_DCachePlugin_l233" -ctrlKey \
          off
srcDeselectAll -win $_nTrace1
debReload
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 342067.093833 512160.255288
wvZoom -win $_nWave2 413711.636066 471202.623627
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 29 )} 
wvSelectSignal -win $_nWave2 {( "G1" 28 )} 
wvSelectSignal -win $_nWave2 {( "G1" 31 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G4" 2)}
wvSetPosition -win $_nWave2 {("G4" 1)}
wvSelectSignal -win $_nWave2 {( "G1" 30 )} 
wvZoom -win $_nWave2 346271.913544 519760.917244
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvZoom -win $_nWave2 377571.476067 493954.747327
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 365573.200680 500468.096823
wvSetCursor -win $_nWave2 443102.999236 -snap {("G5" 4)}
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G1" 16 )} 
wvSetCursor -win $_nWave2 435106.652300 -snap {("G1" 16)}
wvZoom -win $_nWave2 425222.968820 491826.082122
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvSetMarker -win $_nWave2 437000.000000
wvZoom -win $_nWave2 424830.608800 475788.366327
wvSetCursor -win $_nWave2 457157.639808 -snap {("G1" 17)}
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 361432.342043 631005.633699
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G4" 1 )} 
wvSelectGroup -win $_nWave2 {G4}
wvSetPosition -win $_nWave2 {("G4" 0)}
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
wvSelectSignal -win $_nWave2 {( "G1" 30 )} 
wvSelectGroup -win $_nWave2 {G4}
wvSelectSignal -win $_nWave2 {( "G1" 30 )} 
wvSetCursor -win $_nWave2 438850.297673 -snap {("G5" 1)}
srcActiveTrace \
           "tb_DandSocSimple.u_DandSocSimple.axi_uartCtrl.io_apb_PADDR\[15:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 425000 -TraceValue \
           0000000000001000
srcDeselectAll -win $_nTrace1
srcSelect -signal "apb3Router_1_io_outputs_0_PADDR\[15:0\]" -line 1528 -pos 1 \
          -win $_nTrace1
srcAction -pos 1527 7 17 -win $_nTrace1 -name \
          "apb3Router_1_io_outputs_0_PADDR\[15:0\]" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "io_input_PADDR" -line 1644 -pos 1 -win $_nTrace1
srcAction -pos 1643 7 6 -win $_nTrace1 -name "io_input_PADDR" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "io_input_PADDR" -line 1676 -pos 1 -win $_nTrace1
srcAction -pos 1675 7 9 -win $_nTrace1 -name "io_input_PADDR" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "io_axi_arw_payload_addr" -line 3976 -pos 1 -win $_nTrace1
srcAction -pos 3975 7 7 -win $_nTrace1 -name "io_axi_arw_payload_addr" -ctrlKey \
          off
srcDeselectAll -win $_nTrace1
srcSelect -signal "cmdOutputFork_payload_addr" -line 1919 -pos 1 -win $_nTrace1
srcAction -pos 1918 7 5 -win $_nTrace1 -name "cmdOutputFork_payload_addr" \
          -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "cmdArbiter_io_output_payload_addr" -line 1902 -pos 1 -win \
          $_nTrace1
srcAction -pos 1901 7 6 -win $_nTrace1 -name "cmdArbiter_io_output_payload_addr" \
          -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "maskRouted_0" -line 8628 -pos 1 -win $_nTrace1
srcSelect -signal "io_inputs_0_payload_addr" -line 8628 -pos 1 -win $_nTrace1
srcSelect -signal "io_inputs_1_payload_addr" -line 8628 -pos 1 -win $_nTrace1
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
wvSetPosition -win $_nWave2 {("G4" 0)}
wvAddSignal -win $_nWave2 \
           "/tb_DandSocSimple/u_DandSocSimple/axi_apbBridge_io_axi_arbiter/cmdArbiter/maskRouted_0" \
           "/tb_DandSocSimple/u_DandSocSimple/axi_apbBridge_io_axi_arbiter/cmdArbiter/io_inputs_0_payload_addr\[19:0\]" \
           "/tb_DandSocSimple/u_DandSocSimple/axi_apbBridge_io_axi_arbiter/cmdArbiter/io_inputs_1_payload_addr\[19:0\]"
wvSetPosition -win $_nWave2 {("G4" 0)}
wvSetPosition -win $_nWave2 {("G4" 3)}
wvScrollDown -win $_nWave2 10
srcHBSelect "tb_DandSocSimple.u_DandSocSimple.axi_apbBridge" -win $_nTrace1
srcSetScope -win $_nTrace1 "tb_DandSocSimple.u_DandSocSimple.axi_apbBridge" \
           -delim "."
srcHBSelect "tb_DandSocSimple.u_DandSocSimple.axi_apbBridge" -win $_nTrace1
wvSelectGroup -win $_nWave2 {G4}
wvSelectGroup -win $_nWave2 {G4}
wvSetPosition -win $_nWave2 {("G4" 0)}
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G5" 0)}
wvSetPosition -win $_nWave2 {("G1" 30)}
wvScrollDown -win $_nWave2 2
wvScrollUp -win $_nWave2 4
wvScrollDown -win $_nWave2 4
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {3812 3816 4 1 1 1}
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "io_axi_arw_payload_addr" -line 3814 -pos 1 -win $_nTrace1
srcAction -pos 3813 9 5 -win $_nTrace1 -name "io_axi_arw_payload_addr" -ctrlKey \
          off
srcHBSelect "tb_DandSocSimple.u_DandSocSimple.axi_apbBridge" -win $_nTrace1
srcSetScope -win $_nTrace1 "tb_DandSocSimple.u_DandSocSimple.axi_apbBridge" \
           -delim "."
srcHBSelect "tb_DandSocSimple.u_DandSocSimple.axi_apbBridge" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "io_axi_arw_payload_addr" -line 3814 -pos 1 -win $_nTrace1
srcAction -pos 3813 9 12 -win $_nTrace1 -name "io_axi_arw_payload_addr" -ctrlKey \
          off
srcDeselectAll -win $_nTrace1
srcSelect -signal "cmdOutputFork_payload_addr" -line 1919 -pos 1 -win $_nTrace1
srcAction -pos 1918 7 4 -win $_nTrace1 -name "cmdOutputFork_payload_addr" \
          -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "cmdArbiter_io_output_payload_addr" -line 1902 -pos 1 -win \
          $_nTrace1
srcAction -pos 1901 7 3 -win $_nTrace1 -name "cmdArbiter_io_output_payload_addr" \
          -ctrlKey off
wvScrollDown -win $_nWave2 2
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G5" 1 )} 
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvSetCursor -win $_nWave2 420190.585290 -snap {("G5" 1)}
srcActiveTrace \
           "tb_DandSocSimple.u_DandSocSimple.axi_uartCtrl.io_apb_PADDR\[15:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 401000 -TraceValue \
           0000000000001000
srcDeselectAll -win $_nTrace1
srcSelect -signal "apb3Router_1_io_outputs_0_PADDR\[15:0\]" -line 1528 -pos 1 \
          -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "apb3Router_1_io_outputs_0_PADDR\[15:0\]" -line 1528 -pos 1 \
          -win $_nTrace1
srcAction -pos 1527 7 14 -win $_nTrace1 -name \
          "apb3Router_1_io_outputs_0_PADDR\[15:0\]" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "io_input_PADDR" -line 1644 -pos 1 -win $_nTrace1
srcAction -pos 1643 7 6 -win $_nTrace1 -name "io_input_PADDR" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "io_input_PADDR" -line 1676 -pos 1 -win $_nTrace1
srcAction -pos 1675 7 4 -win $_nTrace1 -name "io_input_PADDR" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "io_axi_arw_payload_addr" -line 3976 -pos 1 -win $_nTrace1
srcAction -pos 3975 7 8 -win $_nTrace1 -name "io_axi_arw_payload_addr" -ctrlKey \
          off
srcDeselectAll -win $_nTrace1
srcSelect -signal "cmdOutputFork_payload_addr" -line 1919 -pos 1 -win $_nTrace1
srcAction -pos 1918 7 5 -win $_nTrace1 -name "cmdOutputFork_payload_addr" \
          -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "cmdArbiter_io_output_payload_addr" -line 1902 -pos 1 -win \
          $_nTrace1
srcAction -pos 1901 7 4 -win $_nTrace1 -name "cmdArbiter_io_output_payload_addr" \
          -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "maskRouted_0" -line 8628 -pos 1 -win $_nTrace1
srcSelect -signal "io_inputs_0_payload_addr" -line 8628 -pos 1 -win $_nTrace1
srcSelect -signal "io_inputs_1_payload_addr" -line 8628 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvSetCursor -win $_nWave2 421282.376972 -snap {("G1" 31)}
srcActiveTrace \
           "tb_DandSocSimple.u_DandSocSimple.axi_apbBridge_io_axi_arbiter.cmdArbiter.maskRouted_0" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 421000 -TraceValue 1
srcSelect -signal "locked" -line 8618 -pos 1 -win $_nTrace1
srcSelect -signal "maskLocked_0" -line 8618 -pos 1 -win $_nTrace1
srcSelect -signal "maskProposal_0" -line 8618 -pos 1 -win $_nTrace1
srcSelect -signal "maskRouted_1" -line 8619 -pos 1 -win $_nTrace1
srcSelect -signal "locked" -line 8619 -pos 1 -win $_nTrace1
srcSelect -signal "maskLocked_1" -line 8619 -pos 1 -win $_nTrace1
srcSelect -signal "maskProposal_1" -line 8619 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvSetCursor -win $_nWave2 421183.123183 -snap {("G1" 34)}
srcActiveTrace \
           "tb_DandSocSimple.u_DandSocSimple.axi_apbBridge_io_axi_arbiter.cmdArbiter.maskRouted_0" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 1000 -TraceValue 0
wvSelectSignal -win $_nWave2 {( "G1" 35 )} 
wvSelectSignal -win $_nWave2 {( "G1" 36 )} 
wvSelectSignal -win $_nWave2 {( "G1" 38 )} 
wvSetCursor -win $_nWave2 393888.331134 -snap {("G1" 38)}
srcActiveTrace \
           "tb_DandSocSimple.u_DandSocSimple.axi_apbBridge_io_axi_arbiter.cmdArbiter.maskRouted_1" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 393000 -TraceValue 1
srcDeselectAll -win $_nTrace1
srcSelect -signal "maskLocked_1" -line 8619 -pos 1 -win $_nTrace1
srcAction -pos 8618 12 5 -win $_nTrace1 -name "maskLocked_1" -ctrlKey off
srcHBSelect "tb_DandSocSimple.u_DandSocSimple.axi_apbBridge_io_axi_arbiter" -win \
           $_nTrace1
srcSetScope -win $_nTrace1 \
           "tb_DandSocSimple.u_DandSocSimple.axi_apbBridge_io_axi_arbiter" \
           -delim "."
srcHBSelect "tb_DandSocSimple.u_DandSocSimple.axi_apbBridge_io_axi_arbiter" -win \
           $_nTrace1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G1" 39 )} 
wvSelectSignal -win $_nWave2 {( "G1" 38 )} 
wvSelectSignal -win $_nWave2 {( "G1" 39 )} 
wvSelectSignal -win $_nWave2 {( "G1" 38 )} 
wvSelectSignal -win $_nWave2 {( "G1" 34 )} 
wvSetCursor -win $_nWave2 422771.183811 -snap {("G1" 35)}
wvSelectSignal -win $_nWave2 {( "G1" 36 )} 
wvSetCursor -win $_nWave2 422771.183811 -snap {("G1" 36)}
srcActiveTrace \
           "tb_DandSocSimple.u_DandSocSimple.axi_apbBridge_io_axi_arbiter.cmdArbiter.maskLocked_0" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 1000 -TraceValue 0
srcDeselectAll -win $_nTrace1
srcSelect -signal "maskRouted_0" -line 8646 -pos 1 -win $_nTrace1
srcAction -pos 8645 5 5 -win $_nTrace1 -name "maskRouted_0" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "maskLocked_0" -line 8618 -pos 1 -win $_nTrace1
srcAction -pos 8617 12 6 -win $_nTrace1 -name "maskLocked_0" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "io_output_valid" -line 8645 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
srcDeselectAll -win $_nTrace1
srcSelect -signal "io_output_valid" -line 8645 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "io_output_valid" -line 8645 -pos 1 -win $_nTrace1
srcAction -pos 8644 3 7 -win $_nTrace1 -name "io_output_valid" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "io_inputs_0_valid" -line 8627 -pos 1 -win $_nTrace1
srcAction -pos 8626 9 10 -win $_nTrace1 -name "io_inputs_0_valid" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "io_readInputs_0_ar_valid" -line 1871 -pos 1 -win $_nTrace1
srcAction -pos 1870 7 7 -win $_nTrace1 -name "io_readInputs_0_ar_valid" -ctrlKey \
          off
srcDeselectAll -win $_nTrace1
srcSelect -signal \
          "toplevel_toplevel_axi_downsizer_io_output_readOnly_decoder_io_outputs_1_ar_rValid" \
          -line 1473 -pos 1 -win $_nTrace1
srcAction -pos 1472 7 31 -win $_nTrace1 -name \
          "toplevel_toplevel_axi_downsizer_io_output_readOnly_decoder_io_outputs_1_ar_rValid" \
          -ctrlKey off
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
srcDeselectAll -win $_nTrace1
srcSelect -signal \
          "toplevel_axi_downsizer_io_output_readOnly_decoder_io_outputs_1_ar_valid" \
          -line 1598 -pos 1 -win $_nTrace1
srcAction -pos 1597 3 61 -win $_nTrace1 -name \
          "toplevel_axi_downsizer_io_output_readOnly_decoder_io_outputs_1_ar_valid" \
          -ctrlKey off
srcHBSelect \
           "tb_DandSocSimple.u_DandSocSimple.toplevel_axi_downsizer_io_output_readOnly_decoder" \
           -win $_nTrace1
srcSetScope -win $_nTrace1 \
           "tb_DandSocSimple.u_DandSocSimple.toplevel_axi_downsizer_io_output_readOnly_decoder" \
           -delim "."
srcHBSelect \
           "tb_DandSocSimple.u_DandSocSimple.toplevel_axi_downsizer_io_output_readOnly_decoder" \
           -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "io_input_ar_valid" -line 2576 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {2576 2588 3 1 15 1}
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvZoom -win $_nWave2 386940.565885 523513.779920
wvZoom -win $_nWave2 391415.903164 491381.863952
wvScrollDown -win $_nWave2 1
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 398114.653113 514790.682458
srcHBSelect \
           "tb_DandSocSimple.u_DandSocSimple.toplevel_axi_downsizer_io_output_writeOnly_decoder" \
           -win $_nTrace1
srcSetScope -win $_nTrace1 \
           "tb_DandSocSimple.u_DandSocSimple.toplevel_axi_downsizer_io_output_writeOnly_decoder" \
           -delim "."
srcHBSelect \
           "tb_DandSocSimple.u_DandSocSimple.toplevel_axi_downsizer_io_output_writeOnly_decoder" \
           -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {2289 2301 3 1 15 1}
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 371909.801162 538761.678177
wvZoom -win $_nWave2 386039.378376 470878.274605
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G5" 5 )} 
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvSetCursor -win $_nWave2 439735.277720 -snap {("G5" 2)}
wvSelectSignal -win $_nWave2 {( "G1" 56 )} 
wvSetCursor -win $_nWave2 439048.070166 -snap {("G1" 56)}
srcActiveTrace \
           "tb_DandSocSimple.u_DandSocSimple.toplevel_axi_downsizer_io_output_writeOnly_decoder.io_input_aw_payload_addr\[31:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 439000 -TraceValue \
           00010000000000000000000000000000
srcDeselectAll -win $_nTrace1
srcSelect -signal "axi_downsizer_io_output_aw_payload_addr" -line 1369 -pos 1 \
          -win $_nTrace1
srcAction -pos 1368 7 6 -win $_nTrace1 -name \
          "axi_downsizer_io_output_aw_payload_addr" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "writeOnly_io_output_aw_payload_addr" -line 5037 -pos 1 -win \
          $_nTrace1
srcAction -pos 5036 7 10 -win $_nTrace1 -name \
          "writeOnly_io_output_aw_payload_addr" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "writeStream_aw_payload_addr" -line 9889 -pos 1 -win $_nTrace1
srcAction -pos 9888 7 7 -win $_nTrace1 -name "writeStream_aw_payload_addr" \
          -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "outCmdStream_payload_addr" -line 9817 -pos 1 -win $_nTrace1
srcAction -pos 9816 7 4 -win $_nTrace1 -name "outCmdStream_payload_addr" -ctrlKey \
          off
srcDeselectAll -win $_nTrace1
srcSelect -signal "cmdStream_payload_addr" -line 9804 -pos 1 -win $_nTrace1
srcAction -pos 9803 7 5 -win $_nTrace1 -name "cmdStream_payload_addr" -ctrlKey \
          off
srcDeselectAll -win $_nTrace1
srcSelect -signal "generator_io_output_payload_addr" -line 9744 -pos 1 -win \
          $_nTrace1
srcAction -pos 9743 7 6 -win $_nTrace1 -name "generator_io_output_payload_addr" \
          -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "cmdStream_payload_addr" -line 65484 -pos 1 -win $_nTrace1
srcAction -pos 65483 7 5 -win $_nTrace1 -name "cmdStream_payload_addr" -ctrlKey \
          off
srcDeselectAll -win $_nTrace1
srcSelect -signal "address" -line 65450 -pos 1 -win $_nTrace1
srcAction -pos 65449 7 3 -win $_nTrace1 -name "address" -ctrlKey off
srcSelect -signal "cmdStreamWithSize_fire" -line 65503 -pos 1 -win $_nTrace1
srcSelect -signal "cmdStreamWithSize_payload_addr" -line 65504 -pos 1 -win \
          $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvZoom -win $_nWave2 430395.502325 456884.229866
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 383250.248667 461429.055726
wvZoom -win $_nWave2 433335.345972 444446.177903
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 439283.486483 -snap {("G1" 66)}
srcActiveTrace \
           "tb_DandSocSimple.u_DandSocSimple.axi_downsizer.writeOnly.generator.address\[31:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 439000 -TraceValue \
           00010000000000000000000000000000
wvZoom -win $_nWave2 431887.174211 453388.843073
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 10
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
wvSetCursor -win $_nWave2 435323.007895 -snap {("G1" 30)}
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G1" 30 66 67 68 )} 
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G1" 14 )} 
wvSelectSignal -win $_nWave2 {( "G1" 14 15 )} 
wvSelectSignal -win $_nWave2 {( "G1" 14 15 16 )} 
wvZoom -win $_nWave2 428134.673828 469459.678047
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
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
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvZoom -win $_nWave2 426095.811322 495051.967111
wvZoom -win $_nWave2 434194.859075 459609.112368
wvSetCursor -win $_nWave2 435083.796506 -snap {("G1" 68)}
srcActiveTrace \
           "tb_DandSocSimple.u_DandSocSimple.axi_downsizer.writeOnly.generator.cmdStreamWithSize_payload_addr\[31:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 435000 -TraceValue \
           00010000000000000000000000000011
srcDeselectAll -win $_nTrace1
srcSelect -signal "startAddress" -line 65423 -pos 1 -win $_nTrace1
srcAction -pos 65422 7 2 -win $_nTrace1 -name "startAddress" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "io_input_payload_addr" -line 65401 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 432547.985518 456820.656005
wvSetCursor -win $_nWave2 437096.877005 -snap {("G1" 68)}
srcActiveTrace \
           "tb_DandSocSimple.u_DandSocSimple.axi_downsizer.writeOnly.generator.cmdStreamWithSize_payload_addr\[31:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 437000 -TraceValue \
           00010000000000000000000000000000
srcDeselectAll -win $_nTrace1
srcSelect -signal "startAddress" -line 65423 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvSetCursor -win $_nWave2 437061.129331 -snap {("G1" 70)}
srcActiveTrace \
           "tb_DandSocSimple.u_DandSocSimple.axi_downsizer.writeOnly.generator.startAddress\[31:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 437000 -TraceValue \
           00010000000000000000000000000000
srcDeselectAll -win $_nTrace1
srcSelect -signal "when_Axi4Downsizer_l45" -line 65398 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
srcDeselectAll -win $_nTrace1
srcSelect -signal "_zz_startAddress" -line 65399 -pos 1 -win $_nTrace1
wvSetCursor -win $_nWave2 437159.435434 -snap {("G1" 71)}
srcActiveTrace \
           "tb_DandSocSimple.u_DandSocSimple.axi_downsizer.writeOnly.generator.when_Axi4Downsizer_l45" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 437000 -TraceValue 1
srcDeselectAll -win $_nTrace1
srcSelect -signal "when_Axi4Downsizer_l45" -line 65398 -pos 1 -win $_nTrace1
srcAction -pos 65397 3 9 -win $_nTrace1 -name "when_Axi4Downsizer_l45" -ctrlKey \
          off
srcDeselectAll -win $_nTrace1
srcSelect -signal "io_input_payload_size" -line 65396 -pos 1 -win $_nTrace1
srcAction -pos 65395 12 4 -win $_nTrace1 -name "io_input_payload_size" -ctrlKey \
          off
srcBackwardHistory -win $_nTrace1
srcHBSelect "tb_DandSocSimple.u_DandSocSimple.axi_downsizer.writeOnly" -win \
           $_nTrace1
srcHBSelect "tb_DandSocSimple.u_DandSocSimple.axi_downsizer.writeOnly.generator" \
           -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "io_input_payload_size" -line 65396 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollUp -win $_nWave2 8
wvSelectSignal -win $_nWave2 {( "G1" 48 )} 
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 10
wvSelectSignal -win $_nWave2 {( "G1" 23 )} 
wvSelectSignal -win $_nWave2 {( "G1" 24 )} 
wvSelectSignal -win $_nWave2 {( "G1" 26 )} 
wvScrollUp -win $_nWave2 3
wvSelectSignal -win $_nWave2 {( "G1" 20 )} 
wvSelectSignal -win $_nWave2 {( "G1" 19 )} 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
srcDeselectAll -win $_nTrace1
debReload
wvScrollDown -win $_nWave2 50
wvScrollUp -win $_nWave2 68
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
srcDeselectAll -win $_nTrace1
debReload
wvScrollDown -win $_nWave2 68
srcHBSelect "tb_DandSocSimple.u_DandSocSimple" -win $_nTrace1
srcSetScope -win $_nTrace1 "tb_DandSocSimple.u_DandSocSimple" -delim "."
srcHBSelect "tb_DandSocSimple.u_DandSocSimple" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "io_uart_txd" -line 10 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave2 {("G1" 62)}
wvSetPosition -win $_nWave2 {("G1" 63)}
wvSetPosition -win $_nWave2 {("G1" 65)}
wvSetPosition -win $_nWave2 {("G1" 70)}
wvSetPosition -win $_nWave2 {("G1" 72)}
wvSetPosition -win $_nWave2 {("G5" 0)}
wvSetPosition -win $_nWave2 {("G1" 31)}
wvSetPosition -win $_nWave2 {("G5" 22)}
wvSetPosition -win $_nWave2 {("G5" 23)}
wvSetPosition -win $_nWave2 {("G5" 24)}
wvSetPosition -win $_nWave2 {("G5" 25)}
wvSetPosition -win $_nWave2 {("G5" 26)}
wvSetPosition -win $_nWave2 {("G5" 27)}
wvSetPosition -win $_nWave2 {("G5" 28)}
wvSetPosition -win $_nWave2 {("G6" 0)}
wvSetPosition -win $_nWave2 {("G1" 31)}
wvSetPosition -win $_nWave2 {("G6" 0)}
wvAddSignal -win $_nWave2 "/tb_DandSocSimple/u_DandSocSimple/io_uart_txd"
wvSetPosition -win $_nWave2 {("G6" 0)}
wvSetPosition -win $_nWave2 {("G6" 1)}
wvSetPosition -win $_nWave2 {("G6" 1)}
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 2178034.267205 -snap {("G5" 28)}
wvZoom -win $_nWave2 2178034.267205 2361062.356886
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 332092.203957 1134288.956374
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 290633.874955 940425.058798
wvZoom -win $_nWave2 375805.326151 584188.286801
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 373196.702932 612269.348509
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 381470.940297 712792.530118
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 391230.044563 678147.709974
wvZoom -win $_nWave2 436338.234228 482925.380932
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G5" 6 )} 
wvSelectSignal -win $_nWave2 {( "G5" 7 )} 
wvSelectSignal -win $_nWave2 {( "G5" 8 )} 
wvSelectSignal -win $_nWave2 {( "G5" 6 )} 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 397332.648218 531124.895746
wvSetCursor -win $_nWave2 441371.775350 -snap {("G5" 7)}
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 527184.034258 -snap {("G5" 6)}
wvSetCursor -win $_nWave2 527282.555795 -snap {("G5" 4)}
wvZoom -win $_nWave2 484918.294796 568661.601422
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvSetCursor -win $_nWave2 422696.647972 -snap {("G5" 4)}
wvSetCursor -win $_nWave2 440209.975720 -snap {("G5" 6)}
wvZoom -win $_nWave2 422326.648090 510386.620007
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
srcDeselectAll -win $_nTrace1
wvZoom -win $_nWave2 400992.531183 541577.228616
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G5" 7 )} 
wvSelectSignal -win $_nWave2 {( "G5" 5 )} 
wvSelectSignal -win $_nWave2 {( "G5" 4 )} 
wvSelectSignal -win $_nWave2 {( "G5" 1 )} 
wvSetCursor -win $_nWave2 395712.840778 -snap {("G5" 4)}
wvSetCursor -win $_nWave2 422525.386165 -snap {("G5" 4)}
wvZoom -win $_nWave2 375215.219208 523460.643895
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 476519.898229 559266.608032
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 599091.053598 788226.390292
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G5" 7 )} 
wvZoom -win $_nWave2 818379.409728 1127012.624833
wvZoom -win $_nWave2 955764.371827 996900.315814
wvSetCursor -win $_nWave2 967396.332424 -snap {("G5" 7)}
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
wvZoom -win $_nWave2 3629171.706307 8809271.492232
wvScrollUp -win $_nWave2 70
wvSelectSignal -win $_nWave2 {( "G2" 2 )} 
wvZoom -win $_nWave2 4746822.101944 5011930.301592
wvZoom -win $_nWave2 4811537.395156 4861513.609523
wvZoom -win $_nWave2 4820314.513806 4829091.632456
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
wvZoom -win $_nWave2 330818.324430 1244155.725492
wvZoomOut -win $_nWave2
wvScrollDown -win $_nWave2 68
wvScrollDown -win $_nWave2 2
wvSelectSignal -win $_nWave2 {( "G6" 1 )} 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 607994.853137 2162955.141247
wvZoom -win $_nWave2 830132.037152 1310475.071661
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 577260.553989 1935520.681023
wvSetCursor -win $_nWave2 973336.408412 -snap {("G6" 1)}
srcActiveTrace "tb_DandSocSimple.u_DandSocSimple.io_uart_txd" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 685000 -TraceValue 0
srcDeselectAll -win $_nTrace1
srcSelect -signal "axi_uartCtrl_io_uart_txd" -line 1529 -pos 1 -win $_nTrace1
srcAction -pos 1528 7 11 -win $_nTrace1 -name "axi_uartCtrl_io_uart_txd" -ctrlKey \
          off
srcDeselectAll -win $_nTrace1
srcSelect -signal "uartCtrl_uart_tx" -line 3803 -pos 1 -win $_nTrace1
srcAction -pos 3802 7 9 -win $_nTrace1 -name "uartCtrl_uart_tx" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "srx_pad_i" -line 393 -pos 1 -win $_nTrace1
srcAction -pos 392 5 4 -win $_nTrace1 -name "srx_pad_i" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "srx_pad_i" -line 393 -pos 1 -win $_nTrace1
srcAction -pos 392 5 5 -win $_nTrace1 -name "srx_pad_i" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "srx_pad" -line 394 -pos 1 -win $_nTrace1
srcAction -pos 393 5 3 -win $_nTrace1 -name "srx_pad" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcBackwardHistory -win $_nTrace1
srcHBSelect \
           "tb_DandSocSimple.u_DandSocSimple.axi_uartCtrl.uartCtrl.Uregs.i_uart_sync_flops" \
           -win $_nTrace1
srcHBSelect "tb_DandSocSimple.u_DandSocSimple.axi_uartCtrl.uartCtrl.Uregs" -win \
           $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "srx_pad_i" -line 393 -pos 1 -win $_nTrace1
srcAction -pos 392 5 2 -win $_nTrace1 -name "srx_pad_i" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "wb_rst_i" -line 389 -pos 1 -win $_nTrace1
srcAction -pos 388 5 3 -win $_nTrace1 -name "wb_rst_i" -ctrlKey off
srcBackwardHistory -win $_nTrace1
srcHBSelect "tb_DandSocSimple.u_DandSocSimple.axi_uartCtrl.uartCtrl" -win \
           $_nTrace1
srcHBSelect "tb_DandSocSimple.u_DandSocSimple.axi_uartCtrl.uartCtrl.Uregs" -win \
           $_nTrace1
wvSelectSignal -win $_nWave2 {( "G5" 1 )} 
wvZoom -win $_nWave2 833309.591192 1006342.729613
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 1024437.726739 1413825.997002
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 631895.354139 950746.426696
wvSetCursor -win $_nWave2 673688.793694 -snap {("G5" 2)}
wvSetCursor -win $_nWave2 675332.355924 -snap {("G5" 4)}
wvSelectSignal -win $_nWave2 {( "G5" 6 )} 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 527411.755253 1057577.971625
wvZoom -win $_nWave2 638285.986070 803035.723411
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 563885.698941 933662.723547
wvZoom -win $_nWave2 653334.706734 749318.801854
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 654783.989100 732815.241687
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 684491.027087 -snap {("G6" 1)}
srcActiveTrace "tb_DandSocSimple.u_DandSocSimple.io_uart_txd" -win $_nTrace1 \
           -TraceByDConWave -TraceTime 1000 -TraceValue 1
srcDeselectAll -win $_nTrace1
srcSelect -signal "axi_uartCtrl_io_uart_txd" -line 1529 -pos 1 -win $_nTrace1
srcAction -pos 1528 7 6 -win $_nTrace1 -name "axi_uartCtrl_io_uart_txd" -ctrlKey \
          off
srcDeselectAll -win $_nTrace1
srcSelect -signal "uartCtrl_uart_tx" -line 3803 -pos 1 -win $_nTrace1
srcAction -pos 3802 7 9 -win $_nTrace1 -name "uartCtrl_uart_tx" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "serial_out" -line 401 -pos 1 -win $_nTrace1
srcAction -pos 400 14 3 -win $_nTrace1 -name "serial_out" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "stx_o_tmp" -line 349 -pos 1 -win $_nTrace1
srcAction -pos 348 21 4 -win $_nTrace1 -name "stx_o_tmp" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "tf_data_out\[7:0\]" -line 255 -pos 1 -win $_nTrace1
srcAction -pos 254 6 6 -win $_nTrace1 -name "tf_data_out\[7:0\]" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "ram\[dpra\]" -line 118 -pos 1 -win $_nTrace1
srcAction -pos 117 7 1 -win $_nTrace1 -name "ram\[dpra\]" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "dpra" -win $_nTrace1
srcAction -pos 117 7 5 -win $_nTrace1 -name "ram\[dpra\]" -ctrlKey off
srcBackwardHistory -win $_nTrace1
srcHBSelect \
           "tb_DandSocSimple.u_DandSocSimple.axi_uartCtrl.uartCtrl.Uregs.transmitter.fifo_tx" \
           -win $_nTrace1
srcHBSelect \
           "tb_DandSocSimple.u_DandSocSimple.axi_uartCtrl.uartCtrl.Uregs.transmitter.fifo_tx.tfifo" \
           -win $_nTrace1
srcHBSelect \
           "tb_DandSocSimple.u_DandSocSimple.axi_uartCtrl.uartCtrl.Uregs.transmitter.fifo_tx" \
           -win $_nTrace1
srcSetScope -win $_nTrace1 \
           "tb_DandSocSimple.u_DandSocSimple.axi_uartCtrl.uartCtrl.Uregs.transmitter.fifo_tx" \
           -delim "."
srcHBSelect \
           "tb_DandSocSimple.u_DandSocSimple.axi_uartCtrl.uartCtrl.Uregs.transmitter.fifo_tx" \
           -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "data_in" -line 170 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
srcDeselectAll -win $_nTrace1
srcSelect -signal "push" -line 168 -pos 1 -win $_nTrace1
srcSelect -signal "pop" -line 169 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvZoom -win $_nWave2 634960.143634 788954.073629
wvZoom -win $_nWave2 665634.192281 723126.771447
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 922996.039667 1087937.931001
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 609509.278598 823277.856468
srcDeselectAll -win $_nTrace1
srcSelect -signal "data_out" -line 178 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "data_out" -line 178 -pos 1 -win $_nTrace1
srcAction -pos 177 10 5 -win $_nTrace1 -name "data_out" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "we" -line 114 -pos 1 -win $_nTrace1
srcAction -pos 113 4 1 -win $_nTrace1 -name "we" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "tf_push" -line 561 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
srcBackwardHistory -win $_nTrace1
srcHBSelect "tb_DandSocSimple.u_DandSocSimple.axi_uartCtrl.uartCtrl.Uregs" -win \
           $_nTrace1
srcHBSelect \
           "tb_DandSocSimple.u_DandSocSimple.axi_uartCtrl.uartCtrl.Uregs.transmitter.fifo_tx.tfifo" \
           -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "di" -line 115 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
srcDeselectAll -win $_nTrace1
srcSelect -signal "we" -line 114 -pos 1 -win $_nTrace1
srcSelect -signal "di" -line 115 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G5" 6 )} 
wvSetCursor -win $_nWave2 670349.893728 -snap {("G5" 6)}
wvSelectSignal -win $_nWave2 {( "G5" 2 )} 
wvSelectSignal -win $_nWave2 {( "G5" 3 )} 
wvSelectSignal -win $_nWave2 {( "G5" 4 )} 
wvSelectSignal -win $_nWave2 {( "G5" 4 )} 
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSelectSignal -win $_nWave2 {( "G6" 2 )} 
wvSetCursor -win $_nWave2 671136.965076 -snap {("G6" 2)}
srcActiveTrace \
           "tb_DandSocSimple.u_DandSocSimple.axi_uartCtrl.uartCtrl.Uregs.transmitter.fifo_tx.data_in\[7:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 657000 -TraceValue \
           00000000
srcDeselectAll -win $_nTrace1
srcSelect -signal "wb_dat_i" -line 190 -pos 1 -win $_nTrace1
srcAction -pos 189 6 3 -win $_nTrace1 -name "wb_dat_i" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "in_pwrite" -line 85 -pos 1 -win $_nTrace1
srcSelect -signal "reg_dat8_w" -line 85 -pos 1 -win $_nTrace1
srcSelect -signal "reg_dat8_w_reg" -line 85 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
srcDeselectAll -win $_nTrace1
srcSelect -signal "reg_we" -line 87 -pos 1 -win $_nTrace1
srcAction -pos 86 5 1 -win $_nTrace1 -name "reg_we" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "resetn" -line 42 -pos 1 -win $_nTrace1
srcSelect -signal "in_psel" -line 42 -pos 1 -win $_nTrace1
srcSelect -signal "in_penable" -line 42 -pos 1 -win $_nTrace1
srcSelect -signal "in_pwrite" -line 42 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvSetCursor -win $_nWave2 673025.936309 -snap {("G6" 13)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "reg_we" -line 42 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G6" 7 )} 
wvSetCursor -win $_nWave2 676410.343101 -snap {("G6" 7)}
srcActiveTrace \
           "tb_DandSocSimple.u_DandSocSimple.axi_uartCtrl.uartCtrl.Uregs.transmitter.fifo_tx.tfifo.we" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 1000 -TraceValue 0
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvSelectSignal -win $_nWave2 {( "G6" 11 )} 
wvSelectGroup -win $_nWave2 {G6}
wvSetPosition -win $_nWave2 {("G6" 0)}
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G7" 0)}
wvSetPosition -win $_nWave2 {("G5" 28)}
wvSelectGroup -win $_nWave2 {G7}
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G5" 28)}
wvSetPosition -win $_nWave2 {("G5" 28)}
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
srcHBSelect "tb_DandSocSimple.u_DandSocSimple.axi_uartCtrl.uartCtrl" -win \
           $_nTrace1
srcSetScope -win $_nTrace1 \
           "tb_DandSocSimple.u_DandSocSimple.axi_uartCtrl.uartCtrl" -delim "."
srcHBSelect "tb_DandSocSimple.u_DandSocSimple.axi_uartCtrl.uartCtrl" -win \
           $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "uart_tx" -line 19 -pos 1 -win $_nTrace1
srcSelect -win $_nTrace1 -range {19 21 8 2 3 39}
srcDeselectAll -win $_nTrace1
srcHBSelect "tb_DandSocSimple.u_DandSocSimple.axi_uartCtrl.uartCtrl" -win \
           $_nTrace1
srcSetScope -win $_nTrace1 \
           "tb_DandSocSimple.u_DandSocSimple.axi_uartCtrl.uartCtrl" -delim "."
srcHBSelect "tb_DandSocSimple.u_DandSocSimple.axi_uartCtrl.uartCtrl" -win \
           $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "uart_tx" -line 19 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave2 {("G1" 63)}
wvSetPosition -win $_nWave2 {("G1" 62)}
wvSetPosition -win $_nWave2 {("G1" 61)}
wvSetPosition -win $_nWave2 {("G1" 62)}
wvSetPosition -win $_nWave2 {("G1" 63)}
wvSetPosition -win $_nWave2 {("G1" 64)}
wvSetPosition -win $_nWave2 {("G1" 65)}
wvSetPosition -win $_nWave2 {("G1" 66)}
wvSetPosition -win $_nWave2 {("G1" 67)}
wvSetPosition -win $_nWave2 {("G1" 68)}
wvSetPosition -win $_nWave2 {("G1" 70)}
wvSetPosition -win $_nWave2 {("G1" 71)}
wvSetPosition -win $_nWave2 {("G1" 72)}
wvSetPosition -win $_nWave2 {("G5" 0)}
wvSetPosition -win $_nWave2 {("G5" 1)}
wvSetPosition -win $_nWave2 {("G5" 2)}
wvSetPosition -win $_nWave2 {("G5" 3)}
wvSetPosition -win $_nWave2 {("G5" 4)}
wvSetPosition -win $_nWave2 {("G5" 5)}
wvSetPosition -win $_nWave2 {("G1" 31)}
wvSetPosition -win $_nWave2 {("G5" 25)}
wvSetPosition -win $_nWave2 {("G5" 26)}
wvSetPosition -win $_nWave2 {("G5" 27)}
wvSetPosition -win $_nWave2 {("G5" 28)}
wvSetPosition -win $_nWave2 {("G4" 0)}
wvSetPosition -win $_nWave2 {("G1" 31)}
wvSetPosition -win $_nWave2 {("G4" 0)}
wvAddSignal -win $_nWave2 \
           "/tb_DandSocSimple/u_DandSocSimple/axi_uartCtrl/uartCtrl/uart_tx"
wvSetPosition -win $_nWave2 {("G4" 0)}
wvSetPosition -win $_nWave2 {("G4" 1)}
wvSetPosition -win $_nWave2 {("G4" 1)}
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 682548.272196 -snap {("G4" 1)}
srcActiveTrace "tb_DandSocSimple.u_DandSocSimple.axi_uartCtrl.uartCtrl.uart_tx" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 1000 -TraceValue 1
wvZoomIn -win $_nWave2
srcDeselectAll -win $_nTrace1
srcSelect -signal "serial_out" -line 401 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvSetCursor -win $_nWave2 686641.043201 -snap {("G4" 2)}
srcActiveTrace \
           "tb_DandSocSimple.u_DandSocSimple.axi_uartCtrl.uartCtrl.Uregs.serial_out" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 685000 -TraceValue 0
srcDeselectAll -win $_nTrace1
srcSelect -signal "lcr" -line 349 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G4" 3 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G6" 0)}
wvSetPosition -win $_nWave2 {("G4" 2)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "stx_o_tmp" -line 349 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
srcDeselectAll -win $_nTrace1
srcSelect -signal "stx_o_tmp" -line 349 -pos 1 -win $_nTrace1
srcAction -pos 348 21 3 -win $_nTrace1 -name "stx_o_tmp" -ctrlKey off
wvSetCursor -win $_nWave2 685066.900507 -snap {("G4" 3)}
srcActiveTrace \
           "tb_DandSocSimple.u_DandSocSimple.axi_uartCtrl.uartCtrl.Uregs.transmitter.stx_o_tmp" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 1000 -TraceValue 1
srcHBSelect \
           "tb_DandSocSimple.u_DandSocSimple.axi_uartCtrl.uartCtrl.Uregs.transmitter.fifo_tx" \
           -win $_nTrace1
srcSetScope -win $_nTrace1 \
           "tb_DandSocSimple.u_DandSocSimple.axi_uartCtrl.uartCtrl.Uregs.transmitter.fifo_tx" \
           -delim "."
srcHBSelect \
           "tb_DandSocSimple.u_DandSocSimple.axi_uartCtrl.uartCtrl.Uregs.transmitter.fifo_tx" \
           -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "wb_rst_i" -line 167 -pos 1 -win $_nTrace1
srcSelect -signal "push" -line 168 -pos 1 -win $_nTrace1
srcSelect -signal "pop" -line 169 -pos 1 -win $_nTrace1
srcSelect -signal "data_in" -line 170 -pos 1 -win $_nTrace1
srcSelect -signal "fifo_reset" -line 171 -pos 1 -win $_nTrace1
srcSelect -signal "reset_status" -line 172 -pos 1 -win $_nTrace1
srcSelect -toggle -signal "fifo_reset" -line 171 -pos 1 -win $_nTrace1
srcSelect -signal "fifo_reset" -line 171 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvZoom -win $_nWave2 663343.731327 789275.146861
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 671226.036423 -snap {("G4" 7)}
srcActiveTrace \
           "tb_DandSocSimple.u_DandSocSimple.axi_uartCtrl.uartCtrl.Uregs.transmitter.fifo_tx.data_in\[7:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 671000 -TraceValue \
           01001000
srcDeselectAll -win $_nTrace1
srcBackwardHistory -win $_nTrace1
srcHBSelect \
           "tb_DandSocSimple.u_DandSocSimple.axi_uartCtrl.uartCtrl.Uregs.transmitter" \
           -win $_nTrace1
srcHBSelect \
           "tb_DandSocSimple.u_DandSocSimple.axi_uartCtrl.uartCtrl.Uregs.transmitter.fifo_tx" \
           -win $_nTrace1
srcHBSelect \
           "tb_DandSocSimple.u_DandSocSimple.axi_uartCtrl.uartCtrl.Uregs.transmitter" \
           -win $_nTrace1
srcSetScope -win $_nTrace1 \
           "tb_DandSocSimple.u_DandSocSimple.axi_uartCtrl.uartCtrl.Uregs.transmitter" \
           -delim "."
srcHBSelect \
           "tb_DandSocSimple.u_DandSocSimple.axi_uartCtrl.uartCtrl.Uregs.transmitter" \
           -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "tf_data_in" -line 195 -pos 1 -win $_nTrace1
srcSelect -signal "tf_push" -line 197 -pos 1 -win $_nTrace1
srcSelect -signal "tf_pop" -line 198 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave2 {("G5" 0)}
wvSetPosition -win $_nWave2 {("G5" 3)}
wvSetPosition -win $_nWave2 {("G5" 5)}
wvSetPosition -win $_nWave2 {("G5" 7)}
wvSetPosition -win $_nWave2 {("G1" 31)}
wvSetPosition -win $_nWave2 {("G5" 23)}
wvSetPosition -win $_nWave2 {("G5" 25)}
wvSetPosition -win $_nWave2 {("G5" 26)}
wvSetPosition -win $_nWave2 {("G5" 27)}
wvSetPosition -win $_nWave2 {("G5" 28)}
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
wvSetPosition -win $_nWave2 {("G6" 0)}
wvSetPosition -win $_nWave2 {("G1" 31)}
wvSetPosition -win $_nWave2 {("G6" 0)}
wvAddSignal -win $_nWave2 \
           "/tb_DandSocSimple/u_DandSocSimple/axi_uartCtrl/uartCtrl/Uregs/transmitter/tf_data_in\[7:0\]" \
           "/tb_DandSocSimple/u_DandSocSimple/axi_uartCtrl/uartCtrl/Uregs/transmitter/tf_push" \
           "/tb_DandSocSimple/u_DandSocSimple/axi_uartCtrl/uartCtrl/Uregs/transmitter/tf_pop"
wvSetPosition -win $_nWave2 {("G6" 0)}
wvSetPosition -win $_nWave2 {("G6" 3)}
wvSetPosition -win $_nWave2 {("G6" 3)}
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSetCursor -win $_nWave2 671411.502425 -snap {("G6" 1)}
srcActiveTrace \
           "tb_DandSocSimple.u_DandSocSimple.axi_uartCtrl.uartCtrl.Uregs.transmitter.tf_data_in\[7:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 671000 -TraceValue \
           01001000
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
wvZoomIn -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G5" 1 )} {( "G6" 1 2 3 )} 
wvZoom -win $_nWave2 667702.182380 696078.480726
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoom -win $_nWave2 621710.847580 775670.027411
wvSelectSignal -win $_nWave2 {( "G5" 1 6 )} {( "G6" 1 2 3 )} 
wvSelectSignal -win $_nWave2 {( "G5" 1 6 7 )} {( "G6" 1 2 3 )} 
wvSelectSignal -win $_nWave2 {( "G5" 1 6 )} {( "G6" 1 2 3 )} 
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvSetMarker -win $_nWave2 671000.000000
wvScrollDown -win $_nWave2 1
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
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G4" 5 )} 
srcHBSelect "tb_DandSocSimple.u_DandSocSimple.axi_uartCtrl.uartCtrl" -win \
           $_nTrace1
srcSetScope -win $_nTrace1 \
           "tb_DandSocSimple.u_DandSocSimple.axi_uartCtrl.uartCtrl" -delim "."
srcHBSelect "tb_DandSocSimple.u_DandSocSimple.axi_uartCtrl.uartCtrl" -win \
           $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {8 19 8 9 1 5}
wvSetPosition -win $_nWave2 {("G5" 0)}
wvSetPosition -win $_nWave2 {("G5" 4)}
wvSetPosition -win $_nWave2 {("G5" 6)}
wvSetPosition -win $_nWave2 {("G5" 7)}
wvSetPosition -win $_nWave2 {("G1" 31)}
wvSetPosition -win $_nWave2 {("G5" 23)}
wvSetPosition -win $_nWave2 {("G5" 24)}
wvSetPosition -win $_nWave2 {("G5" 25)}
wvSetPosition -win $_nWave2 {("G5" 26)}
wvSetPosition -win $_nWave2 {("G5" 27)}
wvSetPosition -win $_nWave2 {("G5" 28)}
wvSetPosition -win $_nWave2 {("G4" 0)}
wvAddSignal -win $_nWave2 \
           "/tb_DandSocSimple/u_DandSocSimple/axi_uartCtrl/uartCtrl/in_psel" \
           "/tb_DandSocSimple/u_DandSocSimple/axi_uartCtrl/uartCtrl/in_penable" \
           "/tb_DandSocSimple/u_DandSocSimple/axi_uartCtrl/uartCtrl/in_pprot\[2:0\]" \
           "/tb_DandSocSimple/u_DandSocSimple/axi_uartCtrl/uartCtrl/in_pready" \
           "/tb_DandSocSimple/u_DandSocSimple/axi_uartCtrl/uartCtrl/in_pslverr" \
           "/tb_DandSocSimple/u_DandSocSimple/axi_uartCtrl/uartCtrl/in_paddr\[31:0\]" \
           "/tb_DandSocSimple/u_DandSocSimple/axi_uartCtrl/uartCtrl/in_pwrite" \
           "/tb_DandSocSimple/u_DandSocSimple/axi_uartCtrl/uartCtrl/in_prdata\[31:0\]" \
           "/tb_DandSocSimple/u_DandSocSimple/axi_uartCtrl/uartCtrl/in_pwdata\[31:0\]" \
           "/tb_DandSocSimple/u_DandSocSimple/axi_uartCtrl/uartCtrl/in_pstrb\[3:0\]" \
           "/tb_DandSocSimple/u_DandSocSimple/axi_uartCtrl/uartCtrl/uart_rx" \
           "/tb_DandSocSimple/u_DandSocSimple/axi_uartCtrl/uartCtrl/uart_tx"
wvSetPosition -win $_nWave2 {("G4" 0)}
wvSetPosition -win $_nWave2 {("G4" 12)}
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G4" 9 )} 
wvSetMarker -win $_nWave2 673000.000000
wvZoom -win $_nWave2 665415.754667 712521.821840
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 674365.213673 -snap {("G4" 2)}
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSelectSignal -win $_nWave2 {( "G4" 17 )} 
wvSetCursor -win $_nWave2 676793.361466 -snap {("G4" 3)}
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 417363.917686 2477543.256051
wvZoom -win $_nWave2 604721.906116 986264.692271
wvZoom -win $_nWave2 646444.368372 783693.006838
wvSelectSignal -win $_nWave2 {( "G4" 19 )} 
wvSetCursor -win $_nWave2 677168.658574 -snap {("G4" 19)}
srcActiveTrace \
           "tb_DandSocSimple.u_DandSocSimple.axi_uartCtrl.uartCtrl.Uregs.transmitter.fifo_tx.data_in\[7:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 671000 -TraceValue \
           01001000
srcDeselectAll -win $_nTrace1
srcSelect -signal "wb_dat_i" -line 190 -pos 1 -win $_nTrace1
srcAction -pos 189 6 3 -win $_nTrace1 -name "wb_dat_i" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "in_pwrite" -line 85 -pos 1 -win $_nTrace1
srcSelect -signal "reg_dat8_w" -line 85 -pos 1 -win $_nTrace1
srcSelect -signal "reg_dat8_w_reg" -line 85 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSetPosition -win $_nWave2 {("G4" 13)}
wvSetPosition -win $_nWave2 {("G4" 14)}
wvSetPosition -win $_nWave2 {("G4" 15)}
wvSetPosition -win $_nWave2 {("G4" 16)}
wvSetPosition -win $_nWave2 {("G4" 17)}
wvSetPosition -win $_nWave2 {("G4" 18)}
wvSetPosition -win $_nWave2 {("G4" 19)}
wvSetPosition -win $_nWave2 {("G4" 20)}
wvSetPosition -win $_nWave2 {("G4" 21)}
wvSetPosition -win $_nWave2 {("G4" 22)}
wvSetPosition -win $_nWave2 {("G4" 23)}
wvSetPosition -win $_nWave2 {("G4" 24)}
wvSetPosition -win $_nWave2 {("G6" 0)}
wvSetPosition -win $_nWave2 {("G6" 1)}
wvSetPosition -win $_nWave2 {("G6" 2)}
wvSetPosition -win $_nWave2 {("G6" 3)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G6" 6)}
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSetCursor -win $_nWave2 677017.058458 -snap {("G6" 5)}
srcActiveTrace \
           "tb_DandSocSimple.u_DandSocSimple.axi_uartCtrl.uartCtrl.reg_dat8_w\[7:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 671000 -TraceValue \
           01001000
srcDeselectAll -win $_nTrace1
srcSelect -signal "in_pwdata\[15:8\]" -line 55 -pos 1 -win $_nTrace1
srcAction -pos 54 8 4 -win $_nTrace1 -name "in_pwdata\[15:8\]" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "io_input_PWDATA" -line 1648 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
srcDeselectAll -win $_nTrace1
srcBackwardHistory -win $_nTrace1
srcHBSelect "tb_DandSocSimple.u_DandSocSimple.apb3Router_1" -win $_nTrace1
srcHBSelect "tb_DandSocSimple.u_DandSocSimple.axi_uartCtrl.uartCtrl" -win \
           $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "in_pwdata\[15:8\]" -line 55 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G6" 8 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G7" 0)}
wvSetPosition -win $_nWave2 {("G6" 7)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "in_paddr\[1:0\]" -line 47 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSetCursor -win $_nWave2 677067.591830 -snap {("G6" 8)}
srcActiveTrace \
           "tb_DandSocSimple.u_DandSocSimple.axi_uartCtrl.uartCtrl.in_paddr\[1:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 671000 -TraceValue 00
srcDeselectAll -win $_nTrace1
srcSelect -signal "io_apb_PADDR" -line 3806 -pos 1 -win $_nTrace1
srcAction -pos 3805 11 3 -win $_nTrace1 -name "io_apb_PADDR" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "axi_uartCtrl_io_apb_PADDR" -line 1528 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvScrollDown -win $_nWave2 1
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
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G5" 1 )} 
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvSetCursor -win $_nWave2 677320.258690 -snap {("G5" 1)}
srcActiveTrace \
           "tb_DandSocSimple.u_DandSocSimple.axi_uartCtrl.io_apb_PADDR\[15:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 677000 -TraceValue \
           0000000000000001
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 52
wvSelectSignal -win $_nWave2 {( "G1" 14 )} 
wvSelectSignal -win $_nWave2 {( "G1" 14 15 )} 
wvSelectSignal -win $_nWave2 {( "G1" 14 15 16 )} 
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 510993.458088 1752901.609392
wvZoom -win $_nWave2 638567.969949 795864.142279
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 87
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSelectSignal -win $_nWave2 {( "G6" 6 )} 
wvScrollDown -win $_nWave2 0
wvSetCursor -win $_nWave2 676849.549445 -snap {("G6" 9)}
srcActiveTrace \
           "tb_DandSocSimple.u_DandSocSimple.axi_uartCtrl_io_apb_PADDR\[15:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 671000 -TraceValue \
           0000000000000000
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSelectSignal -win $_nWave2 {( "G6" 9 )} 
srcDeselectAll -win $_nTrace1
srcSelect -signal "apb3Router_1_io_outputs_0_PADDR\[15:0\]" -line 1528 -pos 1 \
          -win $_nTrace1
srcAction -pos 1527 7 5 -win $_nTrace1 -name \
          "apb3Router_1_io_outputs_0_PADDR\[15:0\]" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "io_input_PADDR" -line 1644 -pos 1 -win $_nTrace1
srcAction -pos 1643 7 3 -win $_nTrace1 -name "io_input_PADDR" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "io_input_PADDR" -line 1676 -pos 1 -win $_nTrace1
srcAction -pos 1675 7 8 -win $_nTrace1 -name "io_input_PADDR" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "io_axi_arw_payload_addr" -line 3976 -pos 1 -win $_nTrace1
srcAction -pos 3975 7 10 -win $_nTrace1 -name "io_axi_arw_payload_addr" -ctrlKey \
          off
srcDeselectAll -win $_nTrace1
srcSelect -signal "cmdOutputFork_payload_addr" -line 1919 -pos 1 -win $_nTrace1
srcAction -pos 1918 7 1 -win $_nTrace1 -name "cmdOutputFork_payload_addr" \
          -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "cmdArbiter_io_output_payload_addr" -line 1902 -pos 1 -win \
          $_nTrace1
srcAction -pos 1901 7 5 -win $_nTrace1 -name "cmdArbiter_io_output_payload_addr" \
          -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "maskRouted_0" -line 8638 -pos 1 -win $_nTrace1
srcSelect -signal "io_inputs_0_payload_addr" -line 8638 -pos 1 -win $_nTrace1
srcSelect -signal "io_inputs_1_payload_addr" -line 8638 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSelectSignal -win $_nWave2 {( "G6" 12 )} 
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 613431.906230 863623.167079
wvZoom -win $_nWave2 664004.440179 696245.582041
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 24
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G1" 14 )} 
wvSelectSignal -win $_nWave2 {( "G1" 15 )} 
wvSelectSignal -win $_nWave2 {( "G1" 16 )} 
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 18
wvScrollDown -win $_nWave2 14
wvScrollDown -win $_nWave2 8
wvScrollDown -win $_nWave2 12
wvScrollDown -win $_nWave2 8
wvScrollDown -win $_nWave2 2
wvScrollDown -win $_nWave2 2
wvScrollDown -win $_nWave2 3
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 3
wvScrollDown -win $_nWave2 2
wvScrollDown -win $_nWave2 3
wvScrollDown -win $_nWave2 3
wvScrollDown -win $_nWave2 4
wvScrollDown -win $_nWave2 2
wvSetCursor -win $_nWave2 676991.115141 -snap {("G6" 12)}
srcActiveTrace \
           "tb_DandSocSimple.u_DandSocSimple.axi_apbBridge_io_axi_arbiter.cmdArbiter.io_inputs_1_payload_addr\[19:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 671000 -TraceValue \
           00000000000000000000
srcDeselectAll -win $_nTrace1
srcSelect -signal "io_writeInputs_0_aw_payload_addr" -line 1881 -pos 1 -win \
          $_nTrace1
srcAction -pos 1880 7 6 -win $_nTrace1 -name "io_writeInputs_0_aw_payload_addr" \
          -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal \
          "toplevel_toplevel_axi_downsizer_io_output_writeOnly_decoder_io_outputs_1_aw_validPipe_payload_addr\[19:0\]" \
          -line 1527 -pos 1 -win $_nTrace1
srcAction -pos 1526 7 4 -win $_nTrace1 -name \
          "toplevel_toplevel_axi_downsizer_io_output_writeOnly_decoder_io_outputs_1_aw_validPipe_payload_addr\[19:0\]" \
          -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal \
          "toplevel_axi_downsizer_io_output_writeOnly_decoder_io_outputs_1_aw_payload_addr" \
          -line 1508 -pos 1 -win $_nTrace1
srcAction -pos 1507 7 8 -win $_nTrace1 -name \
          "toplevel_axi_downsizer_io_output_writeOnly_decoder_io_outputs_1_aw_payload_addr" \
          -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "io_input_aw_payload_addr" -line 2507 -pos 1 -win $_nTrace1
srcAction -pos 2506 7 9 -win $_nTrace1 -name "io_input_aw_payload_addr" -ctrlKey \
          off
srcDeselectAll -win $_nTrace1
srcSelect -signal "axi_downsizer_io_output_aw_payload_addr" -line 1369 -pos 1 \
          -win $_nTrace1
srcAction -pos 1368 7 9 -win $_nTrace1 -name \
          "axi_downsizer_io_output_aw_payload_addr" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "writeOnly_io_output_aw_payload_addr" -line 5037 -pos 1 -win \
          $_nTrace1
srcAction -pos 5036 7 1 -win $_nTrace1 -name \
          "writeOnly_io_output_aw_payload_addr" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "writeStream_aw_payload_addr" -line 9899 -pos 1 -win $_nTrace1
srcAction -pos 9898 7 4 -win $_nTrace1 -name "writeStream_aw_payload_addr" \
          -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "outCmdStream_payload_addr" -line 9827 -pos 1 -win $_nTrace1
srcAction -pos 9826 7 4 -win $_nTrace1 -name "outCmdStream_payload_addr" -ctrlKey \
          off
srcDeselectAll -win $_nTrace1
srcSelect -signal "cmdStream_payload_addr" -line 9814 -pos 1 -win $_nTrace1
srcAction -pos 9813 7 4 -win $_nTrace1 -name "cmdStream_payload_addr" -ctrlKey \
          off
srcDeselectAll -win $_nTrace1
srcSelect -signal "generator_io_output_payload_addr" -line 9754 -pos 1 -win \
          $_nTrace1
srcAction -pos 9753 7 14 -win $_nTrace1 -name "generator_io_output_payload_addr" \
          -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "cmdStream_payload_addr" -line 65494 -pos 1 -win $_nTrace1
srcAction -pos 65493 7 7 -win $_nTrace1 -name "cmdStream_payload_addr" -ctrlKey \
          off
srcDeselectAll -win $_nTrace1
srcSelect -signal "address" -line 65460 -pos 1 -win $_nTrace1
srcAction -pos 65459 7 2 -win $_nTrace1 -name "address" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "address" -line 65517 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 677014.856777 -snap {("G6" 13)}
srcActiveTrace \
           "tb_DandSocSimple.u_DandSocSimple.axi_downsizer.writeOnly.generator.address\[31:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 671000 -TraceValue \
           00010000000000000000000000000000
wvSetCursor -win $_nWave2 676872.406960 -snap {("G6" 13)}
srcActiveTrace \
           "tb_DandSocSimple.u_DandSocSimple.axi_downsizer.writeOnly.generator.address\[31:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 671000 -TraceValue \
           00010000000000000000000000000000
srcDeselectAll -win $_nTrace1
srcSelect -signal "cmdExtendedStream_fire" -line 65516 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvSetCursor -win $_nWave2 675068.042615 -snap {("G6" 14)}
srcActiveTrace \
           "tb_DandSocSimple.u_DandSocSimple.axi_downsizer.writeOnly.generator.cmdExtendedStream_fire" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 675000 -TraceValue 1
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
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G6" 1 )} 
wvSetCursor -win $_nWave2 671055.706109 -snap {("G6" 1)}
srcActiveTrace \
           "tb_DandSocSimple.u_DandSocSimple.axi_uartCtrl.uartCtrl.Uregs.transmitter.tf_data_in\[7:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 671000 -TraceValue \
           01001000
srcDeselectAll -win $_nTrace1
srcSelect -signal "wb_dat_i" -line 190 -pos 1 -win $_nTrace1
srcAction -pos 189 6 2 -win $_nTrace1 -name "wb_dat_i" -ctrlKey off
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G6" 4 )} 
wvSelectSignal -win $_nWave2 {( "G6" 4 5 )} 
wvSelectSignal -win $_nWave2 {( "G6" 4 5 6 )} 
wvSetCursor -win $_nWave2 657071.882429 -snap {("G6" 4)}
srcActiveTrace "tb_DandSocSimple.u_DandSocSimple.axi_uartCtrl.uartCtrl.in_pwrite" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 657000 -TraceValue 1
srcDeselectAll -win $_nTrace1
srcSelect -signal "io_input_PWDATA" -line 1648 -pos 1 -win $_nTrace1
srcAction -pos 1647 7 7 -win $_nTrace1 -name "io_input_PWDATA" -ctrlKey off
srcBackwardHistory -win $_nTrace1
srcHBSelect "tb_DandSocSimple.u_DandSocSimple.io_apb_decoder" -win $_nTrace1
srcHBSelect "tb_DandSocSimple.u_DandSocSimple.apb3Router_1" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "io_input_PWRITE" -line 1647 -pos 1 -win $_nTrace1
srcAction -pos 1646 7 4 -win $_nTrace1 -name "io_input_PWRITE" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "io_input_PWRITE" -line 1678 -pos 1 -win $_nTrace1
srcAction -pos 1677 7 8 -win $_nTrace1 -name "io_input_PWRITE" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "io_axi_arw_payload_write" -line 3978 -pos 1 -win $_nTrace1
srcAction -pos 3977 7 13 -win $_nTrace1 -name "io_axi_arw_payload_write" -ctrlKey \
          off
srcDeselectAll -win $_nTrace1
srcSelect -signal "cmdOutputFork_payload_write" -line 1923 -pos 1 -win $_nTrace1
srcAction -pos 1922 7 4 -win $_nTrace1 -name "cmdOutputFork_payload_write" \
          -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "cmdArbiter_io_output_payload_write" -line 1907 -pos 1 -win \
          $_nTrace1
srcAction -pos 1906 7 10 -win $_nTrace1 -name \
          "cmdArbiter_io_output_payload_write" -ctrlKey off
wvSelectSignal -win $_nWave2 {( "G6" 4 )} 
wvSetCursor -win $_nWave2 657048.140793 -snap {("G6" 4)}
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G4" 2 )} {( "G6" 4 )} 
wvSelectSignal -win $_nWave2 {( "G6" 4 )} 
wvSetCursor -win $_nWave2 657119.365702 -snap {("G6" 4)}
srcActiveTrace "tb_DandSocSimple.u_DandSocSimple.axi_uartCtrl.uartCtrl.in_pwrite" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 657000 -TraceValue 1
srcDeselectAll -win $_nTrace1
srcBackwardHistory -win $_nTrace1
srcHBSelect "tb_DandSocSimple.u_DandSocSimple.apb3Router_1" -win $_nTrace1
srcHBSelect \
           "tb_DandSocSimple.u_DandSocSimple.axi_apbBridge_io_axi_arbiter.cmdArbiter" \
           -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcBackwardHistory -win $_nTrace1
srcHBSelect \
           "tb_DandSocSimple.u_DandSocSimple.axi_apbBridge_io_axi_arbiter.cmdArbiter" \
           -win $_nTrace1
srcHBSelect "tb_DandSocSimple.u_DandSocSimple.axi_apbBridge_io_axi_arbiter" -win \
           $_nTrace1
wvSelectSignal -win $_nWave2 {( "G6" 5 )} 
wvSetCursor -win $_nWave2 656739.499524 -snap {("G6" 5)}
wvSetCursor -win $_nWave2 657000.657521 -snap {("G6" 5)}
srcActiveTrace \
           "tb_DandSocSimple.u_DandSocSimple.axi_uartCtrl.uartCtrl.reg_dat8_w\[7:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 653000 -TraceValue \
           00000001
srcHBSelect "tb_DandSocSimple.u_DandSocSimple.axi_uartCtrl" -win $_nTrace1
srcSetScope -win $_nTrace1 "tb_DandSocSimple.u_DandSocSimple.axi_uartCtrl" -delim \
           "."
srcHBSelect "tb_DandSocSimple.u_DandSocSimple.axi_uartCtrl" -win $_nTrace1
srcHBSelect \
           "tb_DandSocSimple.u_DandSocSimple.axi_uartCtrl.uartCtrl.Uregs.transmitter.fifo_tx" \
           -win $_nTrace1
srcSetScope -win $_nTrace1 \
           "tb_DandSocSimple.u_DandSocSimple.axi_uartCtrl.uartCtrl.Uregs.transmitter.fifo_tx" \
           -delim "."
srcHBSelect \
           "tb_DandSocSimple.u_DandSocSimple.axi_uartCtrl.uartCtrl.Uregs.transmitter.fifo_tx" \
           -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "data_in" -line 148 -pos 1 -win $_nTrace1
srcAction -pos 147 4 0 -win $_nTrace1 -name "data_in" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "wb_rst_i" -line 194 -pos 2 -win $_nTrace1
srcAction -pos 193 6 2 -win $_nTrace1 -name "wb_rst_i" -ctrlKey off
srcBackwardHistory -win $_nTrace1
srcHBSelect "tb_DandSocSimple.u_DandSocSimple.axi_uartCtrl.uartCtrl" -win \
           $_nTrace1
srcHBSelect \
           "tb_DandSocSimple.u_DandSocSimple.axi_uartCtrl.uartCtrl.Uregs.transmitter" \
           -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "tf_data_in" -line 195 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "tf_data_in" -line 195 -pos 1 -win $_nTrace1
srcAction -pos 194 6 3 -win $_nTrace1 -name "tf_data_in" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "wb_dat_i" -line 190 -pos 1 -win $_nTrace1
srcSearchString "wb_dat_i" -win $_nTrace1 -prev -case
srcSelect -win $_nTrace1 -range {164 164 9 10 1 1}
srcHBSelect "tb_DandSocSimple.u_DandSocSimple.axi_uartCtrl.uartCtrl.Uregs" -win \
           $_nTrace1
srcSetScope -win $_nTrace1 \
           "tb_DandSocSimple.u_DandSocSimple.axi_uartCtrl.uartCtrl.Uregs" \
           -delim "."
srcHBSelect "tb_DandSocSimple.u_DandSocSimple.axi_uartCtrl.uartCtrl.Uregs" -win \
           $_nTrace1
srcSearchString "wb_dat_i" -win $_nTrace1 -prev -case
srcSelect -win $_nTrace1 -range {899 899 13 14 1 1}
nsMsgSwitchTab -tab general
srcSearchString "wb_dat_i" -win $_nTrace1 -prev -case
srcSelect -win $_nTrace1 -range {549 549 10 11 1 1}
srcSearchString "wb_dat_i" -win $_nTrace1 -prev -case
srcSelect -win $_nTrace1 -range {535 535 6 7 1 1}
srcSearchString "wb_dat_i" -win $_nTrace1 -prev -case
srcSelect -win $_nTrace1 -range {526 526 6 6 1 9}
srcSearchString "wb_dat_i" -win $_nTrace1 -prev -case
srcSelect -win $_nTrace1 -range {514 514 6 6 1 9}
srcSearchString "wb_dat_i" -win $_nTrace1 -prev -case
srcSelect -win $_nTrace1 -range {513 513 6 6 1 9}
srcSearchString "wb_dat_i" -win $_nTrace1 -prev -case
srcSelect -win $_nTrace1 -range {512 512 6 6 1 9}
srcSearchString "wb_dat_i" -win $_nTrace1 -prev -case
srcSelect -win $_nTrace1 -range {501 501 6 6 1 9}
srcSearchString "wb_dat_i" -win $_nTrace1 -prev -case
srcSelect -win $_nTrace1 -range {498 498 10 11 1 1}
srcSearchString "wb_dat_i" -win $_nTrace1 -prev -case
srcSelect -win $_nTrace1 -range {485 485 6 7 1 1}
srcSearchString "wb_dat_i" -win $_nTrace1 -prev -case
srcSelect -win $_nTrace1 -range {384 384 17 18 1 1}
srcSearchString "wb_dat_i" -win $_nTrace1 -prev -case
srcSelect -win $_nTrace1 -range {303 303 9 10 1 1}
srcSearchString "wb_dat_i" -win $_nTrace1 -next -case
srcSearchString "wb_dat_i" -win $_nTrace1 -next -case
srcSearchString "wb_dat_i" -win $_nTrace1 -prev -case
srcSelect -win $_nTrace1 -range {384 384 17 18 1 1}
srcSearchString "wb_dat_i" -win $_nTrace1 -prev -case
srcSelect -win $_nTrace1 -range {303 303 9 10 1 1}
srcSearchString "wb_dat_i" -win $_nTrace1 -prev -case
srcSelect -win $_nTrace1 -range {257 257 9 10 1 1}
srcDeselectAll -win $_nTrace1
srcSelect -signal "wb_dat_i" -line 257 -pos 1 -win $_nTrace1
srcHBSelect "tb_DandSocSimple.u_DandSocSimple.axi_uartCtrl.uartCtrl" -win \
           $_nTrace1
srcSetScope -win $_nTrace1 \
           "tb_DandSocSimple.u_DandSocSimple.axi_uartCtrl.uartCtrl" -delim "."
srcHBSelect "tb_DandSocSimple.u_DandSocSimple.axi_uartCtrl.uartCtrl" -win \
           $_nTrace1
srcSearchString "wb_dat_i" -win $_nTrace1 -next -case
srcDeselectAll -win $_nTrace1
srcSelect -signal "in_pwrite" -line 85 -pos 1 -win $_nTrace1
wvSelectGroup -win $_nWave2 {G6}
wvSetPosition -win $_nWave2 {("G6" 0)}
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G7" 0)}
wvSetPosition -win $_nWave2 {("G4" 21)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "in_pwrite" -line 85 -pos 1 -win $_nTrace1
srcSelect -signal "reg_dat8_w" -line 85 -pos 1 -win $_nTrace1
srcSelect -signal "reg_dat8_w_reg" -line 85 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
srcDeselectAll -win $_nTrace1
srcSelect -signal "in_pwrite" -line 85 -pos 1 -win $_nTrace1
srcSearchString "in_pwrite" -win $_nTrace1 -prev -case
srcSelect -win $_nTrace1 -range {43 43 21 22 1 1}
srcSearchString "in_pwrite" -win $_nTrace1 -prev -case
srcSelect -win $_nTrace1 -range {42 42 20 21 1 1}
srcSearchString "in_pwrite" -win $_nTrace1 -prev -case
srcSelect -win $_nTrace1 -range {41 41 2 2 54 63}
srcSearchString "in_pwrite" -win $_nTrace1 -prev -case
srcSelect -win $_nTrace1 -range {14 14 8 9 1 1}
srcHBSelect "tb_DandSocSimple.u_DandSocSimple.axi_uartCtrl" -win $_nTrace1
srcSetScope -win $_nTrace1 "tb_DandSocSimple.u_DandSocSimple.axi_uartCtrl" -delim \
           "."
srcHBSelect "tb_DandSocSimple.u_DandSocSimple.axi_uartCtrl" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSearchString "in_pwrite" -win $_nTrace1 -next -case
srcDeselectAll -win $_nTrace1
srcSelect -signal "io_apb_PWRITE" -line 3796 -pos 1 -win $_nTrace1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
srcDeselectAll -win $_nTrace1
srcSelect -signal "io_apb_PWRITE" -line 3796 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSelectSignal -win $_nWave2 {( "G4" 1 )} 
wvSelectSignal -win $_nWave2 {( "G4" 1 2 )} 
wvSelectSignal -win $_nWave2 {( "G4" 1 2 7 )} 
wvSelectSignal -win $_nWave2 {( "G4" 4 )} 
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSelectSignal -win $_nWave2 {( "G4" 22 )} 
wvSetCursor -win $_nWave2 671150.672653 -snap {("G4" 23)}
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
srcDeselectAll -win $_nTrace1
debReload
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 636275.848234 864955.287420
wvZoom -win $_nWave2 663976.708135 708937.982261
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G4" 23 )} 
wvSelectSignal -win $_nWave2 {( "G4" 22 )} 
wvSetCursor -win $_nWave2 674935.604848 -snap {("G4" 22)}
wvZoom -win $_nWave2 669274.060020 695429.734953
wvSetCursor -win $_nWave2 679039.102134 -snap {("G4" 24)}
srcActiveTrace \
           "tb_DandSocSimple.u_DandSocSimple.axi_uartCtrl.uartCtrl.reg_dat8_w_reg\[7:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 679000 -TraceValue \
           00000000
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 661820.270477 713784.932458
wvSelectSignal -win $_nWave2 {( "G4" 24 )} 
wvSelectSignal -win $_nWave2 {( "G4" 23 )} 
wvSelectSignal -win $_nWave2 {( "G4" 7 )} 
wvSetCursor -win $_nWave2 675194.091804 -snap {("G4" 6)}
wvSetCursor -win $_nWave2 674639.240848 -snap {("G4" 7)}
wvSelectSignal -win $_nWave2 {( "G4" 17 )} 
wvSelectSignal -win $_nWave2 {( "G4" 20 )} 
wvSelectSignal -win $_nWave2 {( "G4" 22 )} 
wvSelectSignal -win $_nWave2 {( "G4" 23 )} 
wvSelectSignal -win $_nWave2 {( "G4" 19 )} 
wvSelectSignal -win $_nWave2 {( "G4" 18 )} 
wvSelectSignal -win $_nWave2 {( "G4" 17 )} 
wvSelectSignal -win $_nWave2 {( "G4" 18 )} 
wvSelectSignal -win $_nWave2 {( "G4" 19 )} 
wvSelectSignal -win $_nWave2 {( "G4" 17 )} 
wvSelectSignal -win $_nWave2 {( "G4" 18 )} 
wvSelectSignal -win $_nWave2 {( "G4" 19 )} 
srcHBSelect "tb_DandSocSimple.u_DandSocSimple.axi_uartCtrl.uartCtrl.Uregs" -win \
           $_nTrace1
srcSetScope -win $_nTrace1 \
           "tb_DandSocSimple.u_DandSocSimple.axi_uartCtrl.uartCtrl.Uregs" \
           -delim "."
srcHBSelect "tb_DandSocSimple.u_DandSocSimple.axi_uartCtrl.uartCtrl.Uregs" -win \
           $_nTrace1
srcHBSelect \
           "tb_DandSocSimple.u_DandSocSimple.axi_uartCtrl.uartCtrl.Uregs.transmitter" \
           -win $_nTrace1
srcSetScope -win $_nTrace1 \
           "tb_DandSocSimple.u_DandSocSimple.axi_uartCtrl.uartCtrl.Uregs.transmitter" \
           -delim "."
srcHBSelect \
           "tb_DandSocSimple.u_DandSocSimple.axi_uartCtrl.uartCtrl.Uregs.transmitter" \
           -win $_nTrace1
srcHBSelect \
           "tb_DandSocSimple.u_DandSocSimple.axi_uartCtrl.uartCtrl.Uregs.transmitter.fifo_tx" \
           -win $_nTrace1
srcSetScope -win $_nTrace1 \
           "tb_DandSocSimple.u_DandSocSimple.axi_uartCtrl.uartCtrl.Uregs.transmitter.fifo_tx" \
           -delim "."
srcHBSelect \
           "tb_DandSocSimple.u_DandSocSimple.axi_uartCtrl.uartCtrl.Uregs.transmitter.fifo_tx" \
           -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "push" -line 168 -pos 1 -win $_nTrace1
srcSelect -signal "pop" -line 169 -pos 1 -win $_nTrace1
srcSelect -signal "data_in" -line 170 -pos 1 -win $_nTrace1
srcSelect -signal "fifo_reset" -line 171 -pos 1 -win $_nTrace1
srcSelect -signal "reset_status" -line 172 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvSetCursor -win $_nWave2 677049.972589 -snap {("G4" 26)}
srcHBSelect "tb_DandSocSimple.u_DandSocSimple.axi_uartCtrl.uartCtrl" -win \
           $_nTrace1
srcSetScope -win $_nTrace1 \
           "tb_DandSocSimple.u_DandSocSimple.axi_uartCtrl.uartCtrl" -delim "."
srcHBSelect "tb_DandSocSimple.u_DandSocSimple.axi_uartCtrl.uartCtrl" -win \
           $_nTrace1
srcHBSelect "tb_DandSocSimple.u_DandSocSimple.axi_uartCtrl" -win $_nTrace1
srcSetScope -win $_nTrace1 "tb_DandSocSimple.u_DandSocSimple.axi_uartCtrl" -delim \
           "."
srcHBSelect "tb_DandSocSimple.u_DandSocSimple.axi_uartCtrl" -win $_nTrace1
srcHBSelect "tb_DandSocSimple.u_DandSocSimple.axi_uartCtrl.uartCtrl" -win \
           $_nTrace1
srcSetScope -win $_nTrace1 \
           "tb_DandSocSimple.u_DandSocSimple.axi_uartCtrl.uartCtrl" -delim "."
srcHBSelect "tb_DandSocSimple.u_DandSocSimple.axi_uartCtrl.uartCtrl" -win \
           $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "uart_rx" -line 18 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "uart_tx" -line 19 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 465309.491668 1780421.054962
wvZoom -win $_nWave2 603793.257170 1183391.394601
wvSetCursor -win $_nWave2 923681.919912 -snap {("G4" 31)}
wvSelectSignal -win $_nWave2 {( "G4" 28 )} 
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 958893.146965 1042973.289141
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 662136.061954 757732.335532
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 506843.276701 1140960.531773
wvZoom -win $_nWave2 651130.634445 780709.086789
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvZoom -win $_nWave2 1146448.562365 1193012.836845
wvSetCursor -win $_nWave2 1161072.761972 -snap {("G4" 25)}
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 612879.582114 1210877.333902
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G4" 31 )} 
wvSetCursor -win $_nWave2 723057.664534 -snap {("G4" 31)}
wvZoom -win $_nWave2 604162.677065 1658364.899289
wvSetCursor -win $_nWave2 808715.170110 -snap {("G4" 31)}
srcActiveTrace "tb_DandSocSimple.u_DandSocSimple.axi_uartCtrl.uartCtrl.uart_tx" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 685000 -TraceValue 0
srcDeselectAll -win $_nTrace1
srcSelect -signal "serial_out" -line 401 -pos 1 -win $_nTrace1
srcAction -pos 400 14 3 -win $_nTrace1 -name "serial_out" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "lcr" -line 349 -pos 1 -win $_nTrace1
srcSelect -win $_nTrace1 -range {349 351 7 1 2 1}
srcDeselectAll -win $_nTrace1
srcSelect -signal "lcr" -line 349 -pos 1 -win $_nTrace1
srcAction -pos 348 6 1 -win $_nTrace1 -name "lcr" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "lcr" -line 482 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 527877.401409 1804098.648344
srcDeselectAll -win $_nTrace1
srcBackwardHistory -win $_nTrace1
srcHBSelect "tb_DandSocSimple.u_DandSocSimple.axi_uartCtrl.uartCtrl.Uregs" -win \
           $_nTrace1
srcHBSelect \
           "tb_DandSocSimple.u_DandSocSimple.axi_uartCtrl.uartCtrl.Uregs.transmitter" \
           -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "stx_pad_o" -line 349 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "stx_pad_o" -line 349 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
srcDeselectAll -win $_nTrace1
srcSelect -signal "lcr" -line 349 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G4" 34 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G7" 0)}
wvSetPosition -win $_nWave2 {("G4" 33)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "stx_o_tmp" -line 349 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
srcDeselectAll -win $_nTrace1
srcSelect -signal "stx_o_tmp" -line 349 -pos 1 -win $_nTrace1
srcAction -pos 348 21 4 -win $_nTrace1 -name "stx_o_tmp" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "tstate" -line 290 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSelectSignal -win $_nWave2 {( "G4" 35 )} 
wvSelectSignal -win $_nWave2 {( "G4" 35 )} 
wvSetRadix -win $_nWave2 -format Bin
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoom -win $_nWave2 677581.383682 792704.434307
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 546622.555548 1304162.747293
wvSelectSignal -win $_nWave2 {( "G4" 13 )} 
wvSelectAll -win $_nWave2
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G4" 0)}
wvSelectGroup -win $_nWave2 {G7}
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G4" 0)}
wvSelectGroup -win $_nWave2 {G4}
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G5" 0)}
wvSelectGroup -win $_nWave2 {G5}
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 0)}
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G2" 0)}
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 0)}
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 0)}
srcHBSelect \
           "tb_DandSocSimple.u_DandSocSimple.axi_uartCtrl.uartCtrl.Uregs.transmitter" \
           -win $_nTrace1
srcSetScope -win $_nTrace1 \
           "tb_DandSocSimple.u_DandSocSimple.axi_uartCtrl.uartCtrl.Uregs.transmitter" \
           -delim "."
srcHBSelect \
           "tb_DandSocSimple.u_DandSocSimple.axi_uartCtrl.uartCtrl.Uregs.transmitter" \
           -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {160 189 2 1 28 1}
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 3 )} 
wvZoom -win $_nWave2 629238.097414 910387.034557
wvZoom -win $_nWave2 665986.209596 724886.704896
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 606527.633484 1147128.350286
wvSelectSignal -win $_nWave2 {( "G1" 4 )} 
wvSetCursor -win $_nWave2 675595.545388 -snap {("G1" 4)}
wvSetCursor -win $_nWave2 683358.221365 -snap {("G1" 17)}
wvSelectSignal -win $_nWave2 {( "G1" 6 )} 
wvSelectSignal -win $_nWave2 {( "G1" 12 )} 
wvSelectSignal -win $_nWave2 {( "G1" 9 )} 
wvSelectSignal -win $_nWave2 {( "G1" 8 )} 
wvSelectSignal -win $_nWave2 {( "G1" 7 )} 
wvSelectSignal -win $_nWave2 {( "G1" 8 )} 
wvSetCursor -win $_nWave2 844981.116079 -snap {("G1" 8)}
srcActiveTrace \
           "tb_DandSocSimple.u_DandSocSimple.axi_uartCtrl.uartCtrl.Uregs.transmitter.lsr_mask" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 657000 -TraceValue 0
srcDeselectAll -win $_nTrace1
srcSelect -signal "lsr_mask_condition" -line 460 -pos 1 -win $_nTrace1
srcSelect -signal "lsr_mask_d" -line 460 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
srcDeselectAll -win $_nTrace1
srcSelect -signal "lsr_mask_condition" -line 460 -pos 1 -win $_nTrace1
srcAction -pos 459 6 9 -win $_nTrace1 -name "lsr_mask_condition" -ctrlKey off
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 460187.355392 1275467.376017
wvSetCursor -win $_nWave2 842012.166230 -snap {("G1" 22)}
srcActiveTrace \
           "tb_DandSocSimple.u_DandSocSimple.axi_uartCtrl.uartCtrl.Uregs.lsr_mask_condition" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 657000 -TraceValue 0
srcDeselectAll -win $_nTrace1
srcSelect -signal "wb_re_i" -line 444 -pos 1 -win $_nTrace1
srcSelect -signal "wb_addr_i" -line 444 -pos 1 -win $_nTrace1
srcSelect -signal "dlab" -line 444 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvZoom -win $_nWave2 825502.445635 909251.755560
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
srcHBSelect "tb_DandSocSimple.u_DandSocSimple.axi_uartCtrl" -win $_nTrace1
srcHBSelect "tb_DandSocSimple.u_DandSocSimple.axi_uartCtrl.uartCtrl" -win \
           $_nTrace1
srcSetScope -win $_nTrace1 \
           "tb_DandSocSimple.u_DandSocSimple.axi_uartCtrl.uartCtrl" -delim "."
srcHBSelect "tb_DandSocSimple.u_DandSocSimple.axi_uartCtrl.uartCtrl" -win \
           $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {8 19 7 10 8 2}
wvSetPosition -win $_nWave2 {("G1" 0)}
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
wvSetPosition -win $_nWave2 {("G1" 11)}
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
wvSetPosition -win $_nWave2 {("G2" 0)}
wvAddSignal -win $_nWave2 \
           "/tb_DandSocSimple/u_DandSocSimple/axi_uartCtrl/uartCtrl/in_psel" \
           "/tb_DandSocSimple/u_DandSocSimple/axi_uartCtrl/uartCtrl/in_penable" \
           "/tb_DandSocSimple/u_DandSocSimple/axi_uartCtrl/uartCtrl/in_pprot\[2:0\]" \
           "/tb_DandSocSimple/u_DandSocSimple/axi_uartCtrl/uartCtrl/in_pready" \
           "/tb_DandSocSimple/u_DandSocSimple/axi_uartCtrl/uartCtrl/in_pslverr" \
           "/tb_DandSocSimple/u_DandSocSimple/axi_uartCtrl/uartCtrl/in_paddr\[31:0\]" \
           "/tb_DandSocSimple/u_DandSocSimple/axi_uartCtrl/uartCtrl/in_pwrite" \
           "/tb_DandSocSimple/u_DandSocSimple/axi_uartCtrl/uartCtrl/in_prdata\[31:0\]" \
           "/tb_DandSocSimple/u_DandSocSimple/axi_uartCtrl/uartCtrl/in_pwdata\[31:0\]" \
           "/tb_DandSocSimple/u_DandSocSimple/axi_uartCtrl/uartCtrl/in_pstrb\[3:0\]" \
           "/tb_DandSocSimple/u_DandSocSimple/axi_uartCtrl/uartCtrl/uart_rx" \
           "/tb_DandSocSimple/u_DandSocSimple/axi_uartCtrl/uartCtrl/uart_tx"
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G2" 12)}
wvSetPosition -win $_nWave2 {("G2" 12)}
wvSetCursor -win $_nWave2 844188.779146 -snap {("G2" 2)}
wvZoom -win $_nWave2 835308.145398 858249.782579
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 4 )} 
wvSelectSignal -win $_nWave2 {( "G1" 12 )} 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 575196.511590 1773162.178587
wvZoom -win $_nWave2 859691.303642 1164916.723952
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 10 )} 
wvZoom -win $_nWave2 636503.643578 1280219.110270
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 4 )} 
wvSelectSignal -win $_nWave2 {( "G1" 12 )} 
wvZoom -win $_nWave2 620861.073327 1130903.666965
wvZoom -win $_nWave2 711001.148785 924896.036176
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 672569.372259 917493.193977
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 9 )} 
wvSelectSignal -win $_nWave2 {( "G1" 12 )} 
wvZoom -win $_nWave2 663551.558499 929035.995589
wvSetCursor -win $_nWave2 715064.923133 -snap {("G1" 12)}
wvSetCursor -win $_nWave2 747321.868729 -snap {("G1" 12)}
wvSetCursor -win $_nWave2 779285.569366 -snap {("G1" 12)}
wvSetCursor -win $_nWave2 810956.025042 -snap {("G1" 12)}
wvSetCursor -win $_nWave2 845167.937038 -snap {("G1" 9)}
wvSelectSignal -win $_nWave2 {( "G2" 4 )} 
wvSetCursor -win $_nWave2 844776.943758 -snap {("G2" 4)}
srcActiveTrace "tb_DandSocSimple.u_DandSocSimple.axi_uartCtrl.uartCtrl.in_pready" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 677000 -TraceValue 0
srcDeselectAll -win $_nTrace1
srcSelect -signal "in_penable" -line 39 -pos 1 -win $_nTrace1
srcAction -pos 38 11 3 -win $_nTrace1 -name "in_penable" -ctrlKey off
srcBackwardHistory -win $_nTrace1
srcHBSelect "tb_DandSocSimple.u_DandSocSimple.apb3Router_1" -win $_nTrace1
srcHBSelect "tb_DandSocSimple.u_DandSocSimple.axi_uartCtrl.uartCtrl" -win \
           $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "in_psel" -line 39 -pos 1 -win $_nTrace1
srcSelect -signal "in_penable" -line 39 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave2 {("G1" 2)}
wvSetPosition -win $_nWave2 {("G1" 3)}
wvSetPosition -win $_nWave2 {("G1" 5)}
wvSetPosition -win $_nWave2 {("G1" 6)}
wvSetPosition -win $_nWave2 {("G1" 9)}
wvSetPosition -win $_nWave2 {("G1" 11)}
wvSetPosition -win $_nWave2 {("G1" 13)}
wvSetPosition -win $_nWave2 {("G1" 18)}
wvSetPosition -win $_nWave2 {("G1" 26)}
wvSetPosition -win $_nWave2 {("G2" 12)}
wvSetPosition -win $_nWave2 {("G2" 11)}
wvSetPosition -win $_nWave2 {("G2" 12)}
wvAddSignal -win $_nWave2 \
           "/tb_DandSocSimple/u_DandSocSimple/axi_uartCtrl/uartCtrl/in_psel" \
           "/tb_DandSocSimple/u_DandSocSimple/axi_uartCtrl/uartCtrl/in_penable"
wvSetPosition -win $_nWave2 {("G2" 12)}
wvSetPosition -win $_nWave2 {("G2" 14)}
wvSelectSignal -win $_nWave2 {( "G2" 13 )} 
wvSelectSignal -win $_nWave2 {( "G2" 13 14 )} 
wvSetCursor -win $_nWave2 843506.215599 -snap {("G2" 13)}
srcActiveTrace "tb_DandSocSimple.u_DandSocSimple.axi_uartCtrl.uartCtrl.in_psel" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 843000 -TraceValue 1
srcDeselectAll -win $_nTrace1
srcSelect -signal "io_input_PSEL\[0\]" -line 1646 -pos 1 -win $_nTrace1
srcAction -pos 1645 7 8 -win $_nTrace1 -name "io_input_PSEL\[0\]" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcBackwardHistory -win $_nTrace1
srcHBSelect "tb_DandSocSimple.u_DandSocSimple.io_apb_decoder" -win $_nTrace1
srcHBSelect "tb_DandSocSimple.u_DandSocSimple.apb3Router_1" -win $_nTrace1
srcBackwardHistory -win $_nTrace1
srcHBSelect "tb_DandSocSimple.u_DandSocSimple.apb3Router_1" -win $_nTrace1
srcHBSelect "tb_DandSocSimple.u_DandSocSimple.axi_uartCtrl.uartCtrl" -win \
           $_nTrace1
srcHBSelect "tb_DandSocSimple" -win $_nTrace1
srcSetScope -win $_nTrace1 "tb_DandSocSimple" -delim "."
srcHBSelect "tb_DandSocSimple" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -signal \
          "tb_DandSocSimple.u_DandSocSimple.core_cpu.writeback_PC\[63:0\]" \
          -line 53 -pos 1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -signal \
          "tb_DandSocSimple.u_DandSocSimple.core_cpu.writeback_PC\[63:0\]" \
          -line 53 -pos 1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -signal \
          "tb_DandSocSimple.u_DandSocSimple.core_cpu.writeback_PC\[63:0\]" \
          -line 53 -pos 1
srcAction -pos 52 6 4 -win $_nTrace1 -name \
          "tb_DandSocSimple.u_DandSocSimple.core_cpu.writeback_PC\[63:0\]" \
          -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "memaccess_to_writeback_PC" -line 6389 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
srcDeselectAll -win $_nTrace1
debReload
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcHBSelect "tb_DandSocSimple" -win $_nTrace1
srcSetScope -win $_nTrace1 "tb_DandSocSimple" -delim "."
srcHBSelect "tb_DandSocSimple" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -signal \
          "tb_DandSocSimple.u_DandSocSimple.core_cpu.writeback_arbitration_isFiring" \
          -line 52 -pos 1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -signal \
          "tb_DandSocSimple.u_DandSocSimple.core_cpu.writeback_PC\[63:0\]" \
          -line 53 -pos 1
srcSelect -signal "instrCnt" -line 53 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvZoom -win $_nWave2 672055.662338 698154.463775
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 657660.962576 752062.518290
wvZoom -win $_nWave2 673753.716735 704479.407181
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 631918.811261 1006238.268355
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 4352910.800027 4926242.516343
wvZoom -win $_nWave2 4548595.078755 4667652.180376
wvZoom -win $_nWave2 4593088.067762 4643849.527142
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 4624486.908615 4641793.650657
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvSetCursor -win $_nWave2 4632936.371040 -snap {("G2" 15)}
srcActiveTrace "tb_DandSocSimple.u_DandSocSimple.core_cpu.writeback_PC\[63:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 4631000 -TraceValue \
           0000000000000000000000000000000000110000000000000000000001000100
srcDeselectAll -win $_nTrace1
srcSelect -signal "memaccess_to_writeback_PC" -line 6389 -pos 1 -win $_nTrace1
srcAction -pos 6388 7 2 -win $_nTrace1 -name "memaccess_to_writeback_PC" -ctrlKey \
          off
srcDeselectAll -win $_nTrace1
srcSelect -signal "decode_PC_NEXT" -line 8447 -pos 1 -win $_nTrace1
srcAction -pos 8446 5 7 -win $_nTrace1 -name "decode_PC_NEXT" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "fetch_to_decode_PC_NEXT" -line 6384 -pos 1 -win $_nTrace1
srcAction -pos 6383 7 3 -win $_nTrace1 -name "fetch_to_decode_PC_NEXT" -ctrlKey \
          off
srcDeselectAll -win $_nTrace1
srcSelect -signal "fetch_PC_NEXT" -line 8444 -pos 1 -win $_nTrace1
srcAction -pos 8443 5 4 -win $_nTrace1 -name "fetch_PC_NEXT" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "fetch_FetchPlugin_pc_stream_fifo_next_payload" -line 6385 -pos \
          1 -win $_nTrace1
srcAction -pos 6384 7 6 -win $_nTrace1 -name \
          "fetch_FetchPlugin_pc_stream_fifo_next_payload" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "_zz_next_payload" -line 64714 -pos 1 -win $_nTrace1
srcAction -pos 64713 7 5 -win $_nTrace1 -name "_zz_next_payload" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "fifo_ram_1" -line 64697 -pos 1 -win $_nTrace1
srcAction -pos 64696 9 1 -win $_nTrace1 -name "fifo_ram_1" -ctrlKey off
srcHBSelect \
           "tb_DandSocSimple.u_DandSocSimple.core_cpu.fetch_FetchPlugin_pc_stream_fifo" \
           -win $_nTrace1
srcSetScope -win $_nTrace1 \
           "tb_DandSocSimple.u_DandSocSimple.core_cpu.fetch_FetchPlugin_pc_stream_fifo" \
           -delim "."
srcHBSelect \
           "tb_DandSocSimple.u_DandSocSimple.core_cpu.fetch_FetchPlugin_pc_stream_fifo" \
           -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "ports_s_ports_payload" -line 64650 -pos 1 -win $_nTrace1
srcAction -pos 64649 9 10 -win $_nTrace1 -name "ports_s_ports_payload" -ctrlKey \
          off
srcDeselectAll -win $_nTrace1
srcSelect -signal "pc_next" -line 6532 -pos 1 -win $_nTrace1
srcAction -pos 6531 7 2 -win $_nTrace1 -name "pc_next" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "pc_next" -line 8250 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvZoom -win $_nWave2 4627902.377588 4639474.190382
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 4629044.220677 -snap {("G2" 17)}
srcActiveTrace "tb_DandSocSimple.u_DandSocSimple.core_cpu.pc_next\[63:0\]" -win \
           $_nTrace1 -TraceByDConWave -TraceTime 4629000 -TraceValue \
           0010000000100000001000000010000000000000000000000000000000000000
srcDeselectAll -win $_nTrace1
srcSelect -signal "when_FetchPlugin_l97" -line 8243 -pos 1 -win $_nTrace1
srcSelect -signal "_zz_pc_next" -line 8244 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvSetCursor -win $_nWave2 4627024.692229 -snap {("G2" 18)}
srcActiveTrace "tb_DandSocSimple.u_DandSocSimple.core_cpu.when_FetchPlugin_l97" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 4627000 -TraceValue 1
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
srcDeselectAll -win $_nTrace1
srcSelect -signal "execute_REDIRECT_VALID" -line 6444 -pos 1 -win $_nTrace1
srcAction -pos 6443 7 7 -win $_nTrace1 -name "execute_REDIRECT_VALID" -ctrlKey \
          off
srcDeselectAll -win $_nTrace1
srcSelect -signal "execute_ALUPlugin_redirect_valid" -line 6337 -pos 1 -win \
          $_nTrace1
srcAction -pos 6336 7 4 -win $_nTrace1 -name "execute_ALUPlugin_redirect_valid" \
          -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "execute_ALUPlugin_branch_or_jump" -line 7434 -pos 1 -win \
          $_nTrace1
srcSelect -signal "execute_ALUPlugin_branch_taken" -line 7435 -pos 1 -win \
          $_nTrace1
srcSelect -signal "when_AluPlugin_l234" -line 7436 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
srcDeselectAll -win $_nTrace1
srcSelect -signal "when_AluPlugin_l234" -line 7436 -pos 1 -win $_nTrace1
srcAction -pos 7435 3 10 -win $_nTrace1 -name "when_AluPlugin_l234" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "execute_PREDICT_TAKEN" -line 7600 -pos 1 -win $_nTrace1
srcSelect -signal "execute_PC_NEXT" -line 7600 -pos 1 -win $_nTrace1
srcSelect -signal "execute_ALUPlugin_pc_next" -line 7600 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSetCursor -win $_nWave2 4627024.692229 -snap {("G2" 25)}
srcActiveTrace \
           "tb_DandSocSimple.u_DandSocSimple.core_cpu.execute_ALUPlugin_pc_next\[63:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 4627000 -TraceValue \
           0010000000100000001000000010000000000000000000000000000000000000
srcDeselectAll -win $_nTrace1
srcSelect -signal "when_AluPlugin_l226" -line 7593 -pos 1 -win $_nTrace1
srcSelect -signal "_zz_execute_ALUPlugin_pc_next" -line 7594 -pos 1 -win \
          $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvSetCursor -win $_nWave2 4627101.383182 -snap {("G2" 27)}
srcActiveTrace \
           "tb_DandSocSimple.u_DandSocSimple.core_cpu._zz_execute_ALUPlugin_pc_next\[63:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 4627000 -TraceValue \
           0010000000100000001000000010000000000000000000000000000000000000
srcDeselectAll -win $_nTrace1
srcSelect -signal "_zz_execute_ALUPlugin_pc_next_1" -line 6022 -pos 1 -win \
          $_nTrace1
srcSelect -signal "_zz_execute_ALUPlugin_pc_next_4" -line 6022 -pos 1 -win \
          $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSetCursor -win $_nWave2 4627016.171012 -snap {("G2" 28)}
srcActiveTrace \
           "tb_DandSocSimple.u_DandSocSimple.core_cpu._zz_execute_ALUPlugin_pc_next_1\[63:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 4619000 -TraceValue \
           0000000000000000000000000000000010000000000011111111111111110000
srcDeselectAll -win $_nTrace1
srcSelect -signal "_zz_execute_ALUPlugin_pc_next_2" -line 6023 -pos 1 -win \
          $_nTrace1
srcSelect -signal "_zz_execute_ALUPlugin_pc_next_3" -line 6023 -pos 1 -win \
          $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSetCursor -win $_nWave2 4627007.649795 -snap {("G2" 30)}
srcActiveTrace \
           "tb_DandSocSimple.u_DandSocSimple.core_cpu._zz_execute_ALUPlugin_pc_next_2\[63:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 4609000 -TraceValue \
           0000000000000000000000000000000010000000000011111111111111100000
srcDeselectAll -win $_nTrace1
srcSelect -signal "execute_ALUPlugin_branch_src1" -line 6024 -pos 1 -win \
          $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvSetCursor -win $_nWave2 4627050.255880 -snap {("G2" 32)}
srcActiveTrace \
           "tb_DandSocSimple.u_DandSocSimple.core_cpu.execute_ALUPlugin_branch_src1\[63:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 4627000 -TraceValue \
           0010000000100000001000000010000000000000000000000000000000000000
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
srcSearchString "excute_INS" -win $_nTrace1 -next -case
srcSearchString "excute_INS" -win $_nTrace1 -next -case
srcSearchString "excute_INS" -win $_nTrace1 -prev -case
srcDeselectAll -win $_nTrace1
srcSearchString "execute_INS" -win $_nTrace1 -next -case
srcDeselectAll -win $_nTrace1
srcSelect -signal "execute_INSTRUCTION" -line 8456 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
srcSearchString "execute_PC" -win $_nTrace1 -next -case
srcSearchString "execute_PC" -win $_nTrace1 -next -case
srcDeselectAll -win $_nTrace1
srcSelect -signal "execute_PC" -line 5401 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
srcSearchString "execute_PC" -win $_nTrace1 -prev -case
srcSelect -win $_nTrace1 -range {5377 5377 10 10 1 11}
srcDeselectAll -win $_nTrace1
srcSelect -signal "execute_PC_NEXT" -line 5377 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvSelectSignal -win $_nWave2 {( "G2" 34 )} 
wvSelectSignal -win $_nWave2 {( "G2" 33 )} 
wvSelectSignal -win $_nWave2 {( "G2" 32 )} 
wvSetCursor -win $_nWave2 4627075.819531 -snap {("G2" 32)}
srcActiveTrace \
           "tb_DandSocSimple.u_DandSocSimple.core_cpu.execute_ALUPlugin_branch_src1\[63:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 4627000 -TraceValue \
           0010000000100000001000000010000000000000000000000000000000000000
wvSelectSignal -win $_nWave2 {( "G2" 32 33 )} 
wvSelectSignal -win $_nWave2 {( "G2" 32 33 34 )} 
wvSelectSignal -win $_nWave2 {( "G2" 32 33 34 35 )} 
wvSetPosition -win $_nWave2 {("G2" 32)}
wvSetPosition -win $_nWave2 {("G2" 33)}
wvSetPosition -win $_nWave2 {("G2" 34)}
wvSetPosition -win $_nWave2 {("G2" 35)}
wvSetPosition -win $_nWave2 {("G3" 0)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G3" 4)}
wvSetPosition -win $_nWave2 {("G3" 4)}
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSelectSignal -win $_nWave2 {( "G2" 16 )} 
wvSelectSignal -win $_nWave2 {( "G2" 17 )} 
wvSelectSignal -win $_nWave2 {( "G2" 18 )} 
wvSelectSignal -win $_nWave2 {( "G2" 18 19 )} 
wvSelectSignal -win $_nWave2 {( "G2" 18 19 20 )} 
wvSelectSignal -win $_nWave2 {( "G2" 18 19 )} 
wvSelectSignal -win $_nWave2 {( "G2" 18 19 20 )} 
wvSelectSignal -win $_nWave2 {( "G2" 18 19 20 21 )} 
wvSelectSignal -win $_nWave2 {( "G2" 18 19 20 21 22 )} 
wvSelectSignal -win $_nWave2 {( "G2" 18 19 20 21 22 23 )} 
wvSelectSignal -win $_nWave2 {( "G2" 18 19 20 21 22 23 24 )} 
wvSelectSignal -win $_nWave2 {( "G2" 18 19 20 21 22 23 24 25 )} 
wvSelectSignal -win $_nWave2 {( "G2" 18 19 20 21 22 23 24 25 26 )} 
wvSelectSignal -win $_nWave2 {( "G2" 18 19 20 21 22 23 24 25 26 27 )} 
wvSelectSignal -win $_nWave2 {( "G2" 18 19 20 21 22 23 24 25 26 27 28 )} 
wvSelectSignal -win $_nWave2 {( "G2" 18 19 20 21 22 23 24 25 26 27 28 29 )} 
wvSelectSignal -win $_nWave2 {( "G2" 18 19 20 21 22 23 24 25 26 27 28 29 30 )} \
           
wvSelectSignal -win $_nWave2 {( "G2" 18 19 20 21 22 23 24 25 26 27 28 29 30 31 \
           )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G3" 4)}
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSetCursor -win $_nWave2 4627058.777097 -snap {("G3" 4)}
srcActiveTrace \
           "tb_DandSocSimple.u_DandSocSimple.core_cpu.execute_PC_NEXT\[63:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 4627000 -TraceValue \
           0000000000000000000000000000000000110000000000000000000001001000
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSelectSignal -win $_nWave2 {( "G3" 2 )} 
wvSelectSignal -win $_nWave2 {( "G3" 3 )} 
wvSelectSignal -win $_nWave2 {( "G3" 4 )} 
wvSelectSignal -win $_nWave2 {( "G3" 1 )} 
wvSetCursor -win $_nWave2 4627084.340748 -snap {("G3" 1)}
srcActiveTrace \
           "tb_DandSocSimple.u_DandSocSimple.core_cpu.execute_ALUPlugin_branch_src1\[63:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 4627000 -TraceValue \
           0010000000100000001000000010000000000000000000000000000000000000
srcDeselectAll -win $_nTrace1
srcSelect -signal "execute_RS1" -line 7503 -pos 1 -win $_nTrace1
srcAction -pos 7502 5 6 -win $_nTrace1 -name "execute_RS1" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "execute_RS1" -line 6426 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSetCursor -win $_nWave2 4627024.692229 -snap {("G3" 5)}
srcActiveTrace "tb_DandSocSimple.u_DandSocSimple.core_cpu.execute_RS1\[63:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 4627000 -TraceValue \
           0010000000100000001000000010000000000000000000000000000000000000
srcDeselectAll -win $_nTrace1
srcSelect -signal "decode_to_execute_RS1" -line 6426 -pos 1 -win $_nTrace1
srcAction -pos 6425 7 10 -win $_nTrace1 -name "decode_to_execute_RS1" -ctrlKey \
          off
srcDeselectAll -win $_nTrace1
srcSelect -signal "decode_RS1" -line 8471 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvSetCursor -win $_nWave2 4625005.163781 -snap {("G3" 6)}
srcActiveTrace "tb_DandSocSimple.u_DandSocSimple.core_cpu.decode_RS1\[63:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 4619000 -TraceValue \
           0000000000000000000000000000000000110000000000000000000000110000
srcDeselectAll -win $_nTrace1
srcSelect -signal "decode_DecodePlugin_rs1" -line 6373 -pos 1 -win $_nTrace1
srcAction -pos 6372 7 4 -win $_nTrace1 -name "decode_DecodePlugin_rs1" -ctrlKey \
          off
srcDeselectAll -win $_nTrace1
srcSelect -signal "regFileModule_1_read_ports_rs1_value" -line 7127 -pos 1 -win \
          $_nTrace1
srcAction -pos 7126 7 8 -win $_nTrace1 -name \
          "regFileModule_1_read_ports_rs1_value" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "write_ports_rd_wen" -line 55335 -pos 1 -win $_nTrace1
srcSelect -signal "write_ports_rd_addr" -line 55335 -pos 1 -win $_nTrace1
srcSelect -signal "read_ports_rs1_addr" -line 55335 -pos 1 -win $_nTrace1
srcSelect -signal "write_ports_rd_addr" -line 55335 -pos 2 -win $_nTrace1
srcSelect -signal "read_ports_rs1_req" -line 55335 -pos 1 -win $_nTrace1
srcSelect -signal "write_ports_rd_value" -line 55335 -pos 1 -win $_nTrace1
srcSelect -signal "read_value_1" -line 55335 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 4622525.489611 4649640.002358
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSetCursor -win $_nWave2 4627079.849226 -snap {("G3" 1)}
wvSetCursor -win $_nWave2 4625073.215550 -snap {("G3" 6)}
wvSelectSignal -win $_nWave2 {( "G2" 15 )} {( "G3" 7 8 9 10 11 12 )} 
wvSelectSignal -win $_nWave2 {( "G2" 15 16 )} {( "G3" 7 8 9 10 11 12 )} 
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
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
srcHBSelect "tb_DandSocSimple.u_DandSocSimple.core_cpu" -win $_nTrace1
srcSetScope -win $_nTrace1 "tb_DandSocSimple.u_DandSocSimple.core_cpu" -delim "."
srcHBSelect "tb_DandSocSimple.u_DandSocSimple.core_cpu" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {5071 5084 5 1 9 1}
wvSetPosition -win $_nWave2 {("G1" 16)}
wvSetPosition -win $_nWave2 {("G1" 17)}
wvSetPosition -win $_nWave2 {("G2" 11)}
wvSetPosition -win $_nWave2 {("G2" 12)}
wvSetPosition -win $_nWave2 {("G2" 13)}
wvSetPosition -win $_nWave2 {("G2" 14)}
wvSetPosition -win $_nWave2 {("G2" 15)}
wvSetPosition -win $_nWave2 {("G2" 16)}
wvSetPosition -win $_nWave2 {("G2" 17)}
wvAddSignal -win $_nWave2 \
           "/tb_DandSocSimple/u_DandSocSimple/core_cpu/dcache_ar_valid" \
           "/tb_DandSocSimple/u_DandSocSimple/core_cpu/dcache_ar_ready" \
           "/tb_DandSocSimple/u_DandSocSimple/core_cpu/dcache_ar_payload_addr\[63:0\]" \
           "/tb_DandSocSimple/u_DandSocSimple/core_cpu/dcache_ar_payload_id\[1:0\]" \
           "/tb_DandSocSimple/u_DandSocSimple/core_cpu/dcache_ar_payload_len\[7:0\]" \
           "/tb_DandSocSimple/u_DandSocSimple/core_cpu/dcache_ar_payload_size\[2:0\]" \
           "/tb_DandSocSimple/u_DandSocSimple/core_cpu/dcache_ar_payload_burst\[1:0\]" \
           "/tb_DandSocSimple/u_DandSocSimple/core_cpu/dcache_r_valid" \
           "/tb_DandSocSimple/u_DandSocSimple/core_cpu/dcache_r_ready" \
           "/tb_DandSocSimple/u_DandSocSimple/core_cpu/dcache_r_payload_data\[63:0\]" \
           "/tb_DandSocSimple/u_DandSocSimple/core_cpu/dcache_r_payload_id\[1:0\]" \
           "/tb_DandSocSimple/u_DandSocSimple/core_cpu/dcache_r_payload_resp\[1:0\]" \
           "/tb_DandSocSimple/u_DandSocSimple/core_cpu/dcache_r_payload_last"
wvSetPosition -win $_nWave2 {("G2" 17)}
wvSetPosition -win $_nWave2 {("G2" 30)}
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
wvZoom -win $_nWave2 4599426.240864 4732003.828964
wvZoom -win $_nWave2 4612459.457367 4662835.035761
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 4605893.568283 4651558.028521
wvZoom -win $_nWave2 4611509.153599 4647506.064266
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 4609653.642740 4645411.987725
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
wvSetCursor -win $_nWave2 4614933.133292 -snap {("G2" 30)}
srcActiveTrace "tb_DandSocSimple.u_DandSocSimple.core_cpu.dcache_r_payload_last" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 4561000 -TraceValue x
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
srcDeselectAll -win $_nTrace1
srcSelect -signal "errorSlave_io_axi_r_payload_last" -line 3741 -pos 1 -win \
          $_nTrace1
srcAction -pos 3740 5 6 -win $_nTrace1 -name "errorSlave_io_axi_r_payload_last" \
          -ctrlKey off
srcDeselectAll -win $_nTrace1
srcAction -pos 9386 7 4 -win $_nTrace1 -name "2'b11" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "remainingZero" -line 9388 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "remainingZero" -line 9388 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "remainingZero" -line 9388 -pos 1 -win $_nTrace1
srcAction -pos 9387 7 3 -win $_nTrace1 -name "remainingZero" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "remaining" -line 9382 -pos 1 -win $_nTrace1
srcAction -pos 9381 8 4 -win $_nTrace1 -name "remaining" -ctrlKey off
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoom -win $_nWave2 4608837.362405 4643147.468086
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G3" 12)}
wvSetPosition -win $_nWave2 {("G2" 17)}
wvScrollUp -win $_nWave2 8
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 582109.598593 2276695.318943
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G2" 13 )} 
wvSetCursor -win $_nWave2 839167.520826 -snap {("G2" 13)}
wvZoom -win $_nWave2 616425.583357 1076259.779196
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoom -win $_nWave2 672127.148317 910340.223997
wvZoom -win $_nWave2 678968.319121 709841.295056
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 655120.195589 888463.512965
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 624362.865832 900147.861699
wvZoom -win $_nWave2 808557.999301 864507.017241
wvSelectSignal -win $_nWave2 {( "G2" 15 )} 
wvSelectSignal -win $_nWave2 {( "G2" 15 16 )} 
wvSelectSignal -win $_nWave2 {( "G2" 15 )} 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 587687.097113 1040882.382334
wvSelectSignal -win $_nWave2 {( "G2" 12 )} 
wvSelectSignal -win $_nWave2 {( "G2" 11 )} 
wvSelectSignal -win $_nWave2 {( "G2" 12 )} 
wvSelectSignal -win $_nWave2 {( "G2" 13 )} 
wvSelectSignal -win $_nWave2 {( "G2" 13 )} 
wvSelectSignal -win $_nWave2 {( "G2" 14 )} 
wvZoom -win $_nWave2 649092.054757 932756.261265
wvScrollUp -win $_nWave2 8
wvSelectSignal -win $_nWave2 {( "G1" 11 )} 
wvSelectSignal -win $_nWave2 {( "G1" 17 )} 
wvSelectSignal -win $_nWave2 {( "G1" 14 )} 
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 634052.420833 953226.874106
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 15 )} 
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G1" 9 )} 
wvSetMarker -win $_nWave2 1007000.000000
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 865559.664187 1270286.032769
wvZoomOut -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G2" 12 )} 
wvSelectSignal -win $_nWave2 {( "G2" 6 )} 
wvSelectSignal -win $_nWave2 {( "G2" 7 )} 
wvSetCursor -win $_nWave2 996991.423056 -snap {("G2" 7)}
wvZoom -win $_nWave2 986560.331082 1061962.224493
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 789726.964263 1266124.788610
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 9 )} 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G2" 9 12 )} 
wvSetCursor -win $_nWave2 994248.268824 -snap {("G2" 10)}
wvZoom -win $_nWave2 593567.834163 1574428.155866
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 688909.190912 -snap {("G2" 12)}
wvZoom -win $_nWave2 545174.872783 1298516.047699
srcHBSelect "tb_DandSocSimple.u_DandSocSimple" -win $_nTrace1
srcSetScope -win $_nTrace1 "tb_DandSocSimple.u_DandSocSimple" -delim "."
srcHBSelect "tb_DandSocSimple.u_DandSocSimple" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "io_axiClk" -line 9 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave2 {("G1" 5)}
wvSetPosition -win $_nWave2 {("G1" 8)}
wvSetPosition -win $_nWave2 {("G1" 11)}
wvSetPosition -win $_nWave2 {("G1" 17)}
wvSetPosition -win $_nWave2 {("G2" 7)}
wvSetPosition -win $_nWave2 {("G2" 8)}
wvSetPosition -win $_nWave2 {("G2" 9)}
wvSetPosition -win $_nWave2 {("G2" 10)}
wvSetPosition -win $_nWave2 {("G2" 11)}
wvSetPosition -win $_nWave2 {("G2" 12)}
wvSetPosition -win $_nWave2 {("G2" 13)}
wvSetPosition -win $_nWave2 {("G2" 14)}
wvSetPosition -win $_nWave2 {("G2" 15)}
wvSetPosition -win $_nWave2 {("G2" 16)}
wvSetPosition -win $_nWave2 {("G2" 17)}
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSetPosition -win $_nWave2 {("G3" 1)}
wvSetPosition -win $_nWave2 {("G3" 2)}
wvSetPosition -win $_nWave2 {("G3" 3)}
wvSetPosition -win $_nWave2 {("G3" 4)}
wvSetPosition -win $_nWave2 {("G3" 6)}
wvSetPosition -win $_nWave2 {("G3" 7)}
wvSetPosition -win $_nWave2 {("G3" 8)}
wvSetPosition -win $_nWave2 {("G3" 9)}
wvSetPosition -win $_nWave2 {("G3" 10)}
wvSetPosition -win $_nWave2 {("G3" 11)}
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
wvSetPosition -win $_nWave2 {("G2" 17)}
wvSetPosition -win $_nWave2 {("G2" 16)}
wvSetPosition -win $_nWave2 {("G2" 15)}
wvSetPosition -win $_nWave2 {("G2" 14)}
wvSetPosition -win $_nWave2 {("G2" 13)}
wvSetPosition -win $_nWave2 {("G2" 12)}
wvAddSignal -win $_nWave2 "/tb_DandSocSimple/u_DandSocSimple/io_axiClk"
wvSetPosition -win $_nWave2 {("G2" 12)}
wvSetPosition -win $_nWave2 {("G2" 13)}
wvZoom -win $_nWave2 636984.861332 1183406.847556
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 954859.212670 1419197.189181
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 563351.861340 1412016.705008
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
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
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 503357.881228 1731984.598939
wvSelectSignal -win $_nWave2 {( "G2" 9 )} 
wvSetCursor -win $_nWave2 1006389.144149 -snap {("G2" 8)}
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 490365.008100 2270878.543045
srcDeselectAll -win $_nTrace1
wvSetCursor -win $_nWave2 674578.669116 -snap {("G2" 9)}
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 523140.574700 2276120.395188
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 983630.797652 -snap {("G2" 8)}
wvSetCursor -win $_nWave2 586047.745583 -snap {("G2" 8)}
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
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
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
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
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvZoom -win $_nWave2 314968.391899 2382916.604285
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollUp -win $_nWave2 4
wvScrollUp -win $_nWave2 2
wvScrollDown -win $_nWave2 2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 3
wvSelectSignal -win $_nWave2 {( "G2" 12 )} 
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvSetCursor -win $_nWave2 717746.228553 -snap {("G1" 10)}
wvZoom -win $_nWave2 624094.671070 1173060.304771
wvZoom -win $_nWave2 665327.730450 837132.144531
wvSetCursor -win $_nWave2 682470.218011 -snap {("G1" 13)}
wvSetCursor -win $_nWave2 684747.448831 -snap {("G1" 12)}
wvSetCursor -win $_nWave2 714857.500783 -snap {("G1" 12)}
wvSelectSignal -win $_nWave2 {( "G1" 13 )} 
wvSetCursor -win $_nWave2 684114.884714 -snap {("G1" 13)}
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
debReload
srcHBSelect "tb_DandSocSimple.u_DandSocSimple" -win $_nTrace1
srcSetScope -win $_nTrace1 "tb_DandSocSimple.u_DandSocSimple" -delim "."
srcHBSelect "tb_DandSocSimple.u_DandSocSimple" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "io_asyncResetn" -line 8 -pos 1 -win $_nTrace1
srcSelect -signal "io_axiClk" -line 9 -pos 1 -win $_nTrace1
srcSelect -signal "io_uart_txd" -line 10 -pos 1 -win $_nTrace1
srcSelect -signal "io_uart_rxd" -line 11 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 0.000000 190275.286288
srcHBSelect "tb_DandSocSimple.u_DandSocSimple.core_cpu" -win $_nTrace1
srcSetScope -win $_nTrace1 "tb_DandSocSimple.u_DandSocSimple.core_cpu" -delim "."
srcHBSelect "tb_DandSocSimple.u_DandSocSimple.core_cpu" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "io_axiClk" -line 5103 -pos 1 -win $_nTrace1
srcSelect -signal "resetCtrl_axiReset" -line 5104 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 0.000000 26341.497660
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 0.000000 238664.055381
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 185237.050347 -snap {("G2" 19)}
srcActiveTrace "tb_DandSocSimple.u_DandSocSimple.core_cpu.resetCtrl_axiReset" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 181000 -TraceValue 0
wvZoom -win $_nWave2 0.000000 64674.795567
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
