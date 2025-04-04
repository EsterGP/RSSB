if {[file isdirectory work]} { vdel -all -lib work }
vlib work
vmap work work

vlog ../rtl/control.sv
vlog ../tb/tb_control.sv
vsim -voptargs=+acc work.tb_control

do wave_control.do
run -all
