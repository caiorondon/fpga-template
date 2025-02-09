set PROJECT_ROOT [file normalize "[file dirname [info script]]/.."]
puts "Project root: $PROJECT_ROOT"

set src_files [glob -directory $PROJECT_ROOT/src *.vhd]
puts "Found source files: $src_files"

set tb_files [glob -directory $PROJECT_ROOT/test *.vhd]
puts "Found testbench files: $tb_files"

eval exec xvhdl $src_files 
eval exec xvhdl $tb_files 

set tb_name [lindex $argv 0]

# Create a list of just the base names in test/.
set tb_base_names {}
foreach f $tb_files {
  lappend tb_base_names [file tail $f]
}

# Now see if tb_name.vhd is in there.
if {[lsearch -exact $tb_base_names "$tb_name.vhd"] == -1} {
  puts "ERROR: Test bench '$tb_name' not found in test/ directory"
  exit 1
}

exec xelab -debug typical $tb_name -s sim_snapshot
exec xsim sim_snapshot -gui --tclbatch scripts/xsim_script.tcl
