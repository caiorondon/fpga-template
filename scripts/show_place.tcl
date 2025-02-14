
# show_place.tcl
# Usage (example):
#   vivado -mode tcl -source show_place.tcl -tclargs <TOP_NAME> <SRC_DIR> <CONSTR_DIR>
# This script reads sources, runs synthesis/place/route, then launches the GUI so you can see the placed design on the device.

set top_name   [lindex $argv 0]
set src_dir    [lindex $argv 1]
set constr_dir [lindex $argv 2]

# Read VHDL files
set vhdl_files [glob -nocomplain "$src_dir/*.vhd"]
if {[llength $vhdl_files] == 0} {
    error "No VHDL files found in directory: $src_dir"
}
read_vhdl $vhdl_files

# Read XDC files
set xdc_files [glob -nocomplain "$constr_dir/*.xdc"]
if {[llength $xdc_files] == 0} {
    error "No constraint files found in directory: $constr_dir"
}
read_xdc $xdc_files

# Synthesis
synth_design -top $top_name -part xc7a100tcsg324-1

# Implementation (opt, place, route)
opt_design
place_design
route_design

# Write out a checkpoint of the placed design
write_checkpoint -force placed.dcp

# Open the placed design checkpoint, then launch the GUI
start_gui
