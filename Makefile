clean:
	rm -rf  *simv*  *.vpd DVEfiles csrc simv* ucli* *.log   vpd2fsdb* v* V* *fsdb* verdilog* *bin*

all: clean com sim
re: com sim

com:
	vcs -sverilog +v2k -timescale=1ns/1ns  -full64 -cpp g++ -cc gcc -LDFLAGS -Wl,--no-as-needed \
	-f ./hw/verilog/tb/tb_DandRiscvSimple.f                       \
	-debug_all                                 \
	-o ./simWorkspace/tb_DandRiscvSimple/tb_DandRiscvSimple.simv  \
	-l ./simWorkspace/tb_DandRiscvSimple/compile.log                             \
	-fsdb                                      \
	-top tb_DandRiscvSimple


sim:
	./simWorkspace/tb_DandRiscvSimple/tb_DandRiscvSimple.simv -l ./simWorkspace/tb_DandRiscvSimple/sim.log  +nospecify +notimingcheck +fsdb+autoflush \
	-lca -cm line+tgl+cond+fsm \
  urg -dir ./simWorkspace/tb_DandRiscvSimple/tb_DandRiscvSimple.simv.vdb/ -report both  


ver:
	verdi  ./simWorkspace/tb_DandRiscvSimple/tb_DandRiscvSimple.fsdb -f ./hw/verilog/tb/tb_DandRiscvSimple.f -ssf -sv -v2k &


all2: clean com2 sim2
re2: com2 sim2
com2:
	vcs -sverilog +v2k -timescale=1ns/1ns  -full64 -cpp g++ -cc gcc -LDFLAGS -Wl,--no-as-needed \
	-f ./hw/verilog/tb/tb_DandRiscvSmallest.f                       \
	-debug_all                                 \
	-o ./simWorkspace/tb_DandRiscvSmallest/tb_DandRiscvSmallest.simv  \
	-l ./simWorkspace/tb_DandRiscvSmallest/compile.log                             \
	-fsdb                                      \
	-top tb_DandRiscvSmallest


sim2:
	./simWorkspace/tb_DandRiscvSmallest/tb_DandRiscvSmallest.simv -l ./simWorkspace/tb_DandRiscvSmallest/sim.log  +nospecify +notimingcheck +fsdb+autoflush \
	-lca -cm line+tgl+cond+fsm \
  urg -dir ./simWorkspace/tb_DandRiscvSmallest/tb_DandRiscvSmallest.simv.vdb/ -report both  


ver2:
	verdi  ./simWorkspace/tb_DandRiscvSmallest/tb_DandRiscvSmallest.fsdb -f ./hw/verilog/tb/tb_DandRiscvSmallest.f -ssf -sv -v2k &

all3: clean com3 sim3
re3: com3 sim3
com3:
	vcs -sverilog +v2k -timescale=1ns/1ns  -full64 -cpp g++ -cc gcc -LDFLAGS -Wl,--no-as-needed \
	-f ./hw/verilog/tb/tb_DandRiscvYsyx3rd.f                       \
	-debug_all                                 \
	-o ./simWorkspace/tb_DandRiscvYsyx3rd/tb_DandRiscvYsyx3rd.simv  \
	-l ./simWorkspace/tb_DandRiscvYsyx3rd/compile.log                             \
	-fsdb                                      \
	-top tb_DandRiscvYsyx3rd


sim3:
	./simWorkspace/tb_DandRiscvYsyx3rd/tb_DandRiscvYsyx3rd.simv -l ./simWorkspace/tb_DandRiscvYsyx3rd/sim.log  +nospecify +notimingcheck +fsdb+autoflush \
	-lca -cm line+tgl+cond+fsm \
  urg -dir ./simWorkspace/tb_DandRiscvYsyx3rd/tb_DandRiscvYsyx3rd.simv.vdb/ -report both  


ver3:
	verdi  ./simWorkspace/tb_DandRiscvYsyx3rd/tb_DandRiscvYsyx3rd.fsdb -f ./hw/verilog/tb/tb_DandRiscvYsyx3rd.f -ssf -sv -v2k &

soc: clean com_soc sim_soc
re_soc: com_soc cp_bin sim_soc rm_bin
com_soc:
	vcs -sverilog +v2k -timescale=1ns/1ns  -full64 -cpp g++ -cc gcc -LDFLAGS -Wl,--no-as-needed \
	-f ./hw/verilog/tb/tb_DandSocSimple.f                       \
	-debug_all                                 \
	-o ./simWorkspace/tb_DandSocSimple/tb_DandSocSimple.simv  \
	-l ./simWorkspace/tb_DandSocSimple/compile.log                             \
	-fsdb                                      \
	-top tb_DandSocSimple

cp_bin:
	cp ./hw/gen/*.bin ./
rm_bin:
	rm ./*.bin


sim_soc:
	./simWorkspace/tb_DandSocSimple/tb_DandSocSimple.simv -l ./simWorkspace/tb_DandSocSimple/sim.log  +nospecify +notimingcheck +fsdb+autoflush \
	-lca -cm line+tgl+cond+fsm \
  urg -dir ./simWorkspace/tb_DandSocSimple/tb_DandSocSimple.simv.vdb/ -report both  


ver_soc:
	verdi  ./simWorkspace/tb_DandSocSimple/tb_DandSocSimple.fsdb -f ./hw/verilog/tb/tb_DandSocSimple.f -ssf -sv -v2k &


push:
	git push https://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@github.com/linux1299/DandRiscvSoC.git main
