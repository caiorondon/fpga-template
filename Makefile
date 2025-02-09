
SCRIPTS_DIR = scripts/

all: bit

bit:
	vivado -mode batch -source $(SCRIPTS_DIR)/build.tcl -tclargs top src constraints

sim:
	vivado -mode batch -source $(SCRIPTS_DIR)/simulate.tcl -tclargs $(TESTBENCH)

prog:
	vivado -mode batch -source $(SCRIPTS_DIR)/program.tcl -tclargs top.bit

clean:
	rm -rf *.log *.jou
