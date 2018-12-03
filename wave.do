onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider Top
add wave -noupdate /top_tb/clk
add wave -noupdate /top_tb/reset
add wave -noupdate /top_tb/input_enable
add wave -noupdate /top_tb/input_pin
add wave -noupdate /top_tb/output_pin
add wave -noupdate -divider bus
add wave -noupdate /top_tb/topTB/bus
add wave -noupdate /top_tb/topTB/start_fetch
add wave -noupdate /top_tb/topTB/fetch_done
add wave -noupdate -divider PC_reg
add wave -noupdate /top_tb/topTB/PC_comp/register
add wave -noupdate -divider MAR_reg
add wave -noupdate /top_tb/topTB/MAR_comp/register
add wave -noupdate -divider MDR_reg
add wave -noupdate /top_tb/topTB/MDR_comp/register
add wave -noupdate -divider IR_reg
add wave -noupdate /top_tb/topTB/IR_comp/register
add wave -noupdate -divider ALU_regs
add wave -noupdate /top_tb/topTB/ALU_comp/IN1_reg
add wave -noupdate /top_tb/topTB/ALU_comp/IN2_reg
add wave -noupdate /top_tb/topTB/ALU_comp/OUT_reg
add wave -noupdate -divider GP_regs
add wave -noupdate /top_tb/topTB/R0_comp/register
add wave -noupdate /top_tb/topTB/R1_comp/register
add wave -noupdate /top_tb/topTB/R2_comp/register
add wave -noupdate /top_tb/topTB/R3_comp/register
add wave -noupdate /top_tb/topTB/P0_comp/register
add wave -noupdate /top_tb/topTB/P1_comp/register
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {744144 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
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
WaveRestoreZoom {0 ps} {3755740 ps}
