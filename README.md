# FPGA Project Template

This repository provides a simple structure for VHDL-based FPGA designs targeting a Nexys A7 board (or similar). It uses Vivado (batch/TCL mode) and a Makefile to streamline synthesis, simulation, and programming steps.

## Folder Structure

. 
├── constraints/ 
│ └── Nexys-A7-100T-Master.xdc # Pin and timing constraints 
├── scripts/ 
│ ├── build.tcl # Synthesis & implementation (batch mode) 
│ ├── program.tcl # Board programming 
│ └── simulate.tcl # Testbench simulation 
├── src/ 
│ └── sample.vhd # Example top-level VHDL source 
├── test/ 
│ └── sample_tb.vhd # Example VHDL testbench 
├── Makefile # Orchestrates build, sim, and program 
└── README.md # This file

## Usage

1. **Clone / Copy the Template**  
   - Either clone or “Use this template” to start a new project.  
   - Rename files as needed (`sample.vhd`, `sample_tb.vhd`, etc.) to match your design.

2. **Edit Source and Constraints**  
   - Put your main VHDL files under `src/`.  
   - Testbenches go under `test/`.  
   - Constraints for the Nexys A7 are in `constraints/`. Adjust if you use different pins/boards.

3. **Make Targets**  
   - `make bit`  
     Runs `scripts/build.tcl` in batch mode to generate a bitstream (`.bit`).  
   - `make sim`  
     Runs `scripts/simulate.tcl` to compile and simulate your testbenches using XSIM.  
   - `make prog`  
     Runs `scripts/program.tcl` to flash the generated bitstream to the board.  
   - `make clean`  
     Removes build artifacts (log/jou files, etc.).

4. **Vivado GUI (Optional)**  
   - You can open Vivado normally and run the same `build.tcl`/`simulate.tcl`/`program.tcl` commands in the Tcl Console.  
   - Or create a project (`create_project`) within your scripts if you prefer.

