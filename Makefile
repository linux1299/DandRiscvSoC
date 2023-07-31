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

push:
	git push https://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@github.com/linux1299/DandRiscvSoC.git main
