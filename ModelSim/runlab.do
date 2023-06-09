# Create work library
vlib work

# Compile Verilog
#     All Verilog files that are part of this design should have
#     their own "vlog" line below.

vlog "../src/RPSC_Connection.sv"
vlog "../src/RPSC_FPGA_TOP_Simulation.sv"
vlog "../src/RPSC_FPGA_TOP.sv"
vlog "../src/RPSC_CARD1.sv"
vlog "../src/RPSC_CARD2.sv"
vlog "../src/RPSC_CARD3.sv"
vlog "../src/RPSC_CARD5.sv"
vlog "../src/RPSC_CARD6.sv"
vlog "../src/RPSC_CARD7.sv"
vlog "../src/RPSC_CARD8.sv"
vlog "../src/RPSC_CARD9.sv"
vlog "../src/RPSC_CARD10.sv"
vlog "../src/RPSC_CARD11.sv"
vlog "../src/RPSC_CARD12.sv"
vlog "../src/RPSC_CARD18.sv"
vlog "../src/timer.sv"
vlog "../src/special_60s_timer.sv"
vlog "../src/inputFF.sv"
vlog "../src/FF.sv"
vlog "../src/FF_Hold_Error.sv"
vlog "../src/clock_divider.sv"
vlog "../src/timer_card18.sv"

# Call vsim to invoke simulator
#     Make sure the last item on the line is the name of the
#     testbench module you want to execute.
vsim -voptargs="+acc" -t 1ps -lib work RPSC_FPGA_TOP_Simulation_testbench
#vsim -voptargs="+acc" -t 1ps -lib work FF_Hold_Error_testbench

# Source the wave do file
#     This should be the file that sets up the signal window for
#     the module you are testing.

do RPSC_FPGA_TOP_Simulation_testbench_wave.do
#do FF_Hold_Error_testbench_wave.do

# Set the window types
view wave
view structure
view signals

# Run the simulation
run -all

# End
