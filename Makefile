SCRIPTS_DIR = scripts/
TOP         = top
SRC_DIR     = src
CONSTR_DIR  = constraints

# The first target listed becomes the default. Let's make it "help".
help:
	@echo "Available targets:"
	@echo "  make bit         - Build bitstream (synth + place + route, writes .bit)"
	@echo "  make sim         - Run simulation (via testbench)"
	@echo "  make prog        - Program the FPGA with the bitfile"
	@echo "  make show_place  - Place & route and open design in Vivado GUI"
	@echo "  make clean       - Remove logs/journals"
	@echo
	@echo "Usage examples:"
	@echo "  make bit"
	@echo "  make sim TESTBENCH=<tb_name>"
	@echo "  make prog"
	@echo "  make show_place"

# Default build
bit:
	vivado -mode batch -source $(SCRIPTS_DIR)/build.tcl \
	       -tclargs $(TOP) $(SRC_DIR) $(CONSTR_DIR)

sim:
	vivado -mode batch -source $(SCRIPTS_DIR)/simulate.tcl \
	       -tclargs $(TESTBENCH)

prog:
	vivado -mode batch -source $(SCRIPTS_DIR)/program.tcl \
	       -tclargs $(TOP).bit

show_place:
	vivado -mode tcl -source $(SCRIPTS_DIR)/show_place.tcl \
	       -tclargs $(TOP) $(SRC_DIR) $(CONSTR_DIR)

clean:
	rm -rf *.log *.jou *.dcp
