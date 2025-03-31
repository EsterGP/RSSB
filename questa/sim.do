if {[file isdirectory work]} { vdel -all -lib work }
vlib work
vmap work work

vlog ../rtl/inc.sv
vlog ../tb/tb_inc.sv
vsim -voptargs=+acc work.tb_inc

do wave_inc.do
run -all
