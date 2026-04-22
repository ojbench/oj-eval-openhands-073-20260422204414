# Minimal Makefile to compile a trivial testbench locally
VVP     := vvp
IVERILOG:= iverilog
TOP_TB  := sim/top_tb.v
SRC     := src/cpu.v
OUTDIR  := testspace
OUT     := $(OUTDIR)/tb.vvp

.PHONY: all clean test_sim

all: test_sim

$(OUT): $(SRC) $(TOP_TB)
	@mkdir -p $(OUTDIR)
	$(IVERILOG) -g2012 -o $(OUT) $(SRC) $(TOP_TB)

test_sim: $(OUT)
	$(VVP) $(OUT)

clean:
	rm -rf $(OUTDIR)
