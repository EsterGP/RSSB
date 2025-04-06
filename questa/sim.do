if {[file isdirectory work]} { vdel -all -lib work }
vlib work
vmap work work

vlog -sv ../rtl/*.sv ../tb/tb_top.sv
vsim -voptargs=+acc work.tb_top

do wave.do
run -all
