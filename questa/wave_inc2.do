onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix binary /tb_inc2/clk
add wave -noupdate -radix decimal /tb_inc2/in
add wave -noupdate -radix decimal /tb_inc2/out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {287549 ps} 0}
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
WaveRestoreZoom {200782 ps} {641812 ps}
