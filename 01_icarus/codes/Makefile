
TARGET = lut_tb

# Targets

.PHONY: compile run viewer clean

all: compile sim

compile:
	@echo "Compilation ..."
	iverilog -o $(TARGET).vvp $(TARGET).v

sim:
	@echo "Simulation ..."
	vvp $(TARGET).vvp

view:
	@echo "Viewer ..."
	gtkwave $(TARGET).vcd &

clean:
	@echo "Clean ..."
	rm *.vvp *.vcd *.txt *.gtkw

help:
	@echo ""
	@echo "=================================================================="
	@echo ""
	@echo "---------------------------- Targets -----------------------------"
	@echo "  all                 : Runs compilation and simulation"
	@echo "  compile             : Runs compilation"
	@echo "  sim                 : Runs simulation"
	@echo "  view                : Runs viewer"
	@echo "  clean               : Removes generated files"
	@echo ""
	@echo "=================================================================="
	@echo ""
