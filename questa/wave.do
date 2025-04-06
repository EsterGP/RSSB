onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix decimal /tb_top/WIDTH
add wave -noupdate -radix binary /tb_top/clk
add wave -noupdate -radix binary /tb_top/rst
add wave -noupdate -radix decimal /tb_top/i
add wave -noupdate -radix decimal /tb_top/oacc
add wave -noupdate -radix decimal /tb_top/omem
add wave -noupdate -radix decimal /tb_top/oop1
add wave -noupdate -radix decimal /tb_top/opc
add wave -noupdate -radix decimal /tb_top/osub
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
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
WaveRestoreZoom {259050 ps} {260050 ps}
