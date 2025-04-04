onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix binary /tb_control/clk
add wave -noupdate -radix binary /tb_control/rst
add wave -noupdate -radix binary /tb_control/neg
add wave -noupdate -radix binary /tb_control/sel_pc
add wave -noupdate -radix binary /tb_control/sel_mem
add wave -noupdate -radix binary /tb_control/write_op1
add wave -noupdate -radix binary /tb_control/write_acc
add wave -noupdate -radix binary /tb_control/write_mem
add wave -noupdate -radix binary /tb_control/write_pc
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {26462 ps} 0}
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
WaveRestoreZoom {0 ps} {273 ns}
