AtlysAFE
========

The goal of this project is an analog frontend for the [Digilent Atlys](http://www.digilentinc.com/Products/Detail.cfm?NavPath=2,400,836&Prod=ATLYS) FPGA Development Board.
The board consists of a XILINX Spartan 6 FPGA and several peripherals. Other expansion modules
can be connected via the VHDCI connector.

The analog frontend will use this expansion port to connect two high speed ADCs and two high speed
DACs to the FPGA. My plan it to use this board as a base for a [Software Defined Radio](http://en.wikipedia.org/wiki/Software-defined_radio).

Layout
------
For most of the ICs free samples are available and the footprints are designed in a way that allows the board to be hand-soldered (using QFN with long pads and no BGA).

I chose a 6 layer layout because the impedance controlled traces need a small distance to their reference plane. In small quantities it seems to be cheaper to use 6 layers instead of defining a low prepreg thickness for a 4 layer design.
