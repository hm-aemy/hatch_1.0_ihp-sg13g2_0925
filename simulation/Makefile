HATCH_TOP=$(PWD)/../Hatch
RUN=croc_pl_60_2100

VERILATOR_ARGS = -Wno-fatal -Wno-style \
	-Wno-BLKANDNBLK -Wno-WIDTHEXPAND -Wno-WIDTHTRUNC -Wno-WIDTHCONCAT -Wno-ASCRANGE

VERILATOR_ARGS += --binary -j 0
VERILATOR_ARGS += --timing --autoflush --trace-fst --trace-threads 2 --trace-structs
VERILATOR_ARGS +=  --unroll-count 1 --unroll-stmts 1
VERILATOR_ARGS += --x-assign fast --x-initial fast
VERILATOR_CFLAGS += -O3 -march=native -mtune=native

build-verilator:
	HATCH_TOP=$(HATCH_TOP) RUN=${RUN} verilator $(VERILATOR_ARGS) -O3 --top tb_hatch_1_0_ihp_sg13g2_0925 -f hatch_1_0_ihp_sg13g2_0925.vlt  2>&1 | tee build.log

SW_HEX ?= ${HATCH_TOP}/simulation/sw/smoketest.hex

sim-verilator:
	obj_dir/Vtb_hatch_1_0_ihp_sg13g2_0925 +binary="$(realpath $(SW_HEX))"  2>&1 | tee sim.log
