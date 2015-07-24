lappend auto_path "C:/lscc/diamond/3.2_x64/data/script"
package require simulation_generation
set ::bali::simulation::Para(PROJECT) {func_sim}
set ::bali::simulation::Para(PROJECTPATH) {C:/FPGA/AtlysAFE/sim}
set ::bali::simulation::Para(FILELIST) {"C:/FPGA/AtlysAFE/hdl/spi_mux.vhd" "C:/FPGA/AtlysAFE/coregen/tx_mux.vhd" "C:/FPGA/AtlysAFE/coregen/rx_mux.vhd" "C:/FPGA/AtlysAFE/coregen/pll_main.vhd" "C:/FPGA/AtlysAFE/hdl/main.vhd" }
set ::bali::simulation::Para(GLBINCLIST) {}
set ::bali::simulation::Para(INCLIST) {"none" "none" "none" "none" "none"}
set ::bali::simulation::Para(WORKLIBLIST) {"work" "work" "work" "work" "work" }
set ::bali::simulation::Para(COMPLIST) {"VHDL" "VHDL" "VHDL" "VHDL" "VHDL" }
set ::bali::simulation::Para(SIMLIBLIST) {pmi_work ovi_machxo2}
set ::bali::simulation::Para(MACROLIST) {}
set ::bali::simulation::Para(SIMULATIONTOPMODULE) {main}
set ::bali::simulation::Para(SIMULATIONINSTANCE) {}
set ::bali::simulation::Para(LANGUAGE) {VHDL}
set ::bali::simulation::Para(SDFPATH)  {}
set ::bali::simulation::Para(ADDTOPLEVELSIGNALSTOWAVEFORM)  {1}
set ::bali::simulation::Para(RUNSIMULATION)  {0}
set ::bali::simulation::Para(POJO2LIBREFRESH)    {}
set ::bali::simulation::Para(POJO2MODELSIMLIB)   {}
::bali::simulation::ActiveHDL_Run
