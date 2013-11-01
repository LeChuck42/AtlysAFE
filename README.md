AtlysAFE
========

The goal of this project is an analog frontend for the [Digilent Atlys](http://www.digilentinc.com/Products/Detail.cfm?NavPath=2,400,836&Prod=ATLYS) FPGA Development Board.
The board consists of a XILINX Spartan 6 FPGA and several peripherals. Other expansion modules
can be connected via the VHDCI connector.

The analog frontend will use this expansion port to connect two high speed ADCs and two high speed
DACs to the FPGA. My plan it to use this board as an [SDR](http://en.wikipedia.org/wiki/Software-defined_radio).
