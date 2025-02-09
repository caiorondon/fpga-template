
# Usage:
#   vivado -mode batch -source build.tcl -tclargs <TOP_NAME> <SRC_DIR> <CONSTR_DIR>
# Example:
#   vivado -mode batch -source build.tcl -tclargs top src constraints

# 1) Parse arguments
set top_name [lindex $argv 0]
set src_dir  [lindex $argv 1]
set constr_dir [lindex $argv 2]

# 2) Get VHDL source files using glob
set vhdl_files [glob -nocomplain "$src_dir/*.vhd"]
if {[llength $vhdl_files] == 0} {
    error "No VHDL files found in directory: $src_dir"
}
read_vhdl $vhdl_files

# 3) Get constraint files
set xdc_files [glob -nocomplain "$constr_dir/*.xdc"]
if {[llength $xdc_files] == 0} {
    error "No constraint files found in directory: $constr_dir"
}
read_xdc $xdc_files

# 4) Synthesize
synth_design -top $top_name -part xc7a100tcsg324-1  ;# Adjust part if needed

# 5) Implementation flow
opt_design
place_design
route_design

# 6) Generate bitstream
write_bitstream -force $top_name.bit

exit
