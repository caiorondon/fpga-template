# Usage:
#   vivado -mode batch -source program.tcl -tclargs <BIT_FILE>
# Example:
#   vivado -mode batch -source program.tcl -tclargs top.bit

set PROJECT_ROOT [file normalize "[file dirname [info script]]/.."]
puts "Project root: $PROJECT_ROOT"

# 1) Parse arguments
if {[llength $argv] < 1} {
    error "Usage: vivado -mode batch -source program.tcl -tclargs <BIT_FILE>"
}
set bitfile [lindex $argv 0]

# 2) Open hardware manager and connect
open_hw
connect_hw_server
open_hw_target

# 3) Get the first available hw device
set hw_device_list [get_hw_devices]
if {[llength $hw_device_list] == 0} {
    error "No hardware devices found!"
}
set dev [lindex $hw_device_list 0]

# Build an absolute path properly:
set full_bitfile [file join $PROJECT_ROOT $bitfile]

puts "Programming $dev with $full_bitfile"
refresh_hw_device $dev
set_property PROGRAM.FILE $full_bitfile $dev
program_hw_devices $dev

puts "Done programming!"
exit
