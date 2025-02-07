
# In your local project:
SCRIPTS_DIR = /path/to/global/fpga-scripts

all: bit

bit:
    vivado -mode batch -source $(SCRIPTS_DIR)/build.tcl \
        -tclargs top src constraints # pass arguments as you wish

sim:
    vivado -mode batch -source $(SCRIPTS_DIR)/simulate.tcl \
        -tclargs testbench # etc.

prog:
    vivado -mode batch -source $(SCRIPTS_DIR)/program.tcl

clean:
    rm -rf *.log *.jou
