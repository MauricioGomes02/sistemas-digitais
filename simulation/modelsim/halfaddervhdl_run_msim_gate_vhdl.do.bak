transcript on
if {[file exists gate_work]} {
	vdel -lib gate_work -all
}
vlib gate_work
vmap work gate_work

vcom -93 -work work {halfaddervhdl.vho}

vcom -93 -work work {D:/Downloads/Faculdade/Trabalhos/SISTEMAS DIGITAIS/AULA 2/halfaddervhdl_test.vhd}

vsim -t 1ps -L altera -L cycloneive -L gate_work -L work -voptargs="+acc"  halfaddervhdl_test

add wave *
view structure
view signals
run -all
