onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /clock_divider_testbench/clk
add wave -noupdate /clock_divider_testbench/clk_in
add wave -noupdate /clock_divider_testbench/clk_out
add wave -noupdate /clock_divider_testbench/reset
add wave -noupdate -radix unsigned /clock_divider_testbench/dut/counter
add wave -noupdate /clock_divider_testbench/dut/test_mode
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {3375 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {21032 ps}
