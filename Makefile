clean:
	rm -rf  *simv*  *.vpd DVEfiles csrc simv* ucli* *.log   vpd2fsdb* v* V* *fsdb* verdilog*

all: clean com sim
re: com sim

com:
	vcs -sverilog +v2k -timescale=1ns/1ns  -full64               \
	-f ./hw/verilog/tb/tb_DandRiscvSimple.f                       \
	-debug_all                                 \
	-o ./simWorkspace/tb_DandRiscvSimple/tb_DandRiscvSimple.simv  \
	-l compile.log                             \
	-fsdb                                      \
	-top tb_DandRiscvSimple


sim:
	./simWorkspace/tb_DandRiscvSimple/tb_DandRiscvSimple.simv -l sim.log  +nospecify +notimingcheck +fsdb+autoflush \
	-lca -cm line+tgl+cond+fsm \
  urg -dir ./simWorkspace/tb_DandRiscvSimple/tb_DandRiscvSimple.simv.vdb/ -report both  


ver:
	verdi  ./simWorkspace/tb_DandRiscvSimple/tb_DandRiscvSimple.fsdb -f ./hw/verilog/tb/tb_DandRiscvSimple.f -ssf -sv -v2k &


all2: clean com2 sim2
re2: com2 sim2
com2:
	vcs -sverilog +v2k -timescale=1ns/1ns  -full64               \
	-f ./hw/verilog/tb/tb_DandRiscvSmallest.f                       \
	-debug_all                                 \
	-o ./simWorkspace/tb_DandRiscvSmallest/tb_DandRiscvSmallest.simv  \
	-l compile.log                             \
	-fsdb                                      \
	-top tb_DandRiscvSmallest


sim2:
	./simWorkspace/tb_DandRiscvSmallest/tb_DandRiscvSmallest.simv -l sim.log  +nospecify +notimingcheck +fsdb+autoflush \
	-lca -cm line+tgl+cond+fsm \
  urg -dir ./simWorkspace/tb_DandRiscvSmallest/tb_DandRiscvSmallest.simv.vdb/ -report both  


ver2:
	verdi  ./simWorkspace/tb_DandRiscvSmallest/tb_DandRiscvSmallest.fsdb -f ./hw/verilog/tb/tb_DandRiscvSmallest.f -ssf -sv -v2k &


push:
	git push https://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@github.com/linux1299/DandRiscvSoC.git main
