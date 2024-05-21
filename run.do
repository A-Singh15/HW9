acom package_timing.vhd package_utility.vhd async.vhd
alog testbench.sv
vlib work
vcom package_timing.vhd
vcom package_utility.vhd
vcom async.vhd
vlog sram_control.sv
vlog AHBTransaction.sv
vlog ahb_if.sv
vlog sram_if.sv
vlog top.sv
vlog AHBMaster.sv
vsim +access+r -t 100ps top
run -all
exit

