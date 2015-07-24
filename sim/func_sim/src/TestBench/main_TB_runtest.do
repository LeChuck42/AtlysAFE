SetActiveLib -work
comp -include "C:\FPGA\AtlysAFE\hdl\spi_mux.vhd" 
comp -include "C:\FPGA\AtlysAFE\coregen\tx_mux.vhd" 
comp -include "C:\FPGA\AtlysAFE\coregen\rx_mux.vhd" 
comp -include "C:\FPGA\AtlysAFE\coregen\pll_main.vhd" 
comp -include "C:\FPGA\AtlysAFE\hdl\main.vhd" 
comp -include "$dsn\src\TestBench\main_TB.vhd" 
asim +access +r TESTBENCH_FOR_main 
wave 
wave -noreg CLK_FPGA
wave -noreg CLK_REFSEL
wave -noreg CLK_PD
wave -noreg CLK_SYNC
wave -noreg CLK_SPI_LE
wave -noreg CLK_SPI_CLK
wave -noreg CLK_SPI_MOSI
wave -noreg CLK_SPI_MISO
wave -noreg CLKIN_SEL0
wave -noreg CLKIN_SEL1
wave -noreg CLKOUT_TYPE0
wave -noreg CLKOUT_TYPE1
wave -noreg MUX_CLK
wave -noreg MUX1
wave -noreg MUX2
wave -noreg MUX3
wave -noreg ENAB_3V3_LDO
wave -noreg ENAB_DAC_LDO
wave -noreg FPGA_PGOOD
wave -noreg PDN_IN1
wave -noreg PDN_IN2
wave -noreg ADC_PDNA
wave -noreg ADC_PDNB
wave -noreg ADC_RESET
wave -noreg ADC_SPI_CS
wave -noreg ADC_SPI_SDATA
wave -noreg ADC_SPI_CLK
wave -noreg DAC_TXEN
wave -noreg DAC_ALARM
wave -noreg DAC_SPI_CS
wave -noreg DAC_SPI_SDIO
wave -noreg DAC_SPI_CLK
wave -noreg SIO_RX
wave -noreg SIO_TX
wave -noreg SIO_RTSn
wave -noreg SIO_CTSn
wave -noreg SIO_DTRn
wave -noreg SIO_DSRn
wave -noreg SIO_DCDn
wave -noreg LED
wave -noreg GPIO
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\main_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_main 
