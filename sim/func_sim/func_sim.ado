setenv SIM_WORKING_FOLDER .
set newDesign 0
if {![file exists "C:/FPGA/AtlysAFE/sim/func_sim/func_sim.adf"]} { 
	design create func_sim "C:/FPGA/AtlysAFE/sim"
  set newDesign 1
}
design open "C:/FPGA/AtlysAFE/sim/func_sim"
cd "C:/FPGA/AtlysAFE/sim"
designverincludedir -clear
designverlibrarysim -PL -clear
designverlibrarysim -L -clear
designverlibrarysim -PL pmi_work
designverlibrarysim ovi_machxo2
designverdefinemacro -clear
if {$newDesign == 0} { 
  removefile -Y -D *
}
addfile "C:/FPGA/AtlysAFE/hdl/spi_mux.vhd"
addfile "C:/FPGA/AtlysAFE/coregen/tx_mux.vhd"
addfile "C:/FPGA/AtlysAFE/coregen/rx_mux.vhd"
addfile "C:/FPGA/AtlysAFE/coregen/pll_main.vhd"
addfile "C:/FPGA/AtlysAFE/hdl/main.vhd"
vlib "C:/FPGA/AtlysAFE/sim/func_sim/work"
set worklib work
adel -all
vcom -dbg -work work "C:/FPGA/AtlysAFE/hdl/spi_mux.vhd"
vcom -dbg -work work "C:/FPGA/AtlysAFE/coregen/tx_mux.vhd"
vcom -dbg -work work "C:/FPGA/AtlysAFE/coregen/rx_mux.vhd"
vcom -dbg -work work "C:/FPGA/AtlysAFE/coregen/pll_main.vhd"
vcom -dbg -work work "C:/FPGA/AtlysAFE/hdl/main.vhd"
entity main
vsim +access +r main   -PL pmi_work -L ovi_machxo2
add wave *
