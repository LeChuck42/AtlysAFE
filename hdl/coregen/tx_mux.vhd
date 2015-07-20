-- VHDL netlist generated by SCUBA Diamond (64-bit) 3.2.0.134
-- Module  Version: 5.6
--C:\lscc\diamond\3.2_x64\ispfpga\bin\nt64\scuba.exe -w -n tx_mux -lang vhdl -synth synplify -bus_exp 7 -bb -arch xo2c00 -type iol -mode out -io_type LVCMOS25 -width 1 -freq_in 250 -gear 4 -clk eclk -del -1 

-- Thu Oct 02 22:10:50 2014

library IEEE;
use IEEE.std_logic_1164.all;
-- synopsys translate_off
library MACHXO2;
use MACHXO2.components.all;
-- synopsys translate_on

entity tx_mux is
    port (
        clk_s: in  std_logic; 
        clkop: in  std_logic; 
        clkos: in  std_logic; 
        clkout: out  std_logic; 
        lock_chk: in  std_logic; 
        reset: in  std_logic; 
        sclk: out  std_logic; 
        tx_ready: out  std_logic; 
        dataout: in  std_logic_vector(7 downto 0); 
        dout: out  std_logic_vector(0 downto 0));
 attribute dont_touch : boolean;
 attribute dont_touch of tx_mux : entity is true;
end tx_mux;

architecture Structure of tx_mux is

    -- internal signal declarations
    signal opensync_0: std_logic;
    signal opensync_1: std_logic;
    signal opensync_cken: std_logic;
    signal opensync_2: std_logic;
    signal buf_clkout: std_logic;
    signal scuba_vhi: std_logic;
    signal d70: std_logic;
    signal d60: std_logic;
    signal d50: std_logic;
    signal d40: std_logic;
    signal d30: std_logic;
    signal d20: std_logic;
    signal d10: std_logic;
    signal d00: std_logic;
    signal eclkc: std_logic;
    signal sclk_t: std_logic;
    signal cdiv1: std_logic;
    signal scuba_vlo: std_logic;
    signal eclkd: std_logic;
    signal xstop: std_logic;
    signal xstart: std_logic;
    signal opensync_3: std_logic;
    signal buf_douto0: std_logic;

    -- local component declarations
    component FD1P3BX
        port (D: in  std_logic; SP: in  std_logic; CK: in  std_logic; 
            PD: in  std_logic; Q: out  std_logic);
    end component;
    component FD1P3DX
        port (D: in  std_logic; SP: in  std_logic; CK: in  std_logic; 
            CD: in  std_logic; Q: out  std_logic);
    end component;
    component ROM16X1A
        generic (INITVAL : in std_logic_vector(15 downto 0));
        port (AD3: in  std_logic; AD2: in  std_logic; AD1: in  std_logic; 
            AD0: in  std_logic; DO0: out  std_logic);
    end component;
    component VHI
        port (Z: out  std_logic);
    end component;
    component VLO
        port (Z: out  std_logic);
    end component;
    component OB
        port (I: in  std_logic; O: out  std_logic);
    end component;
    component ODDRX4B
        port (D0: in  std_logic; D1: in  std_logic; D2: in  std_logic; 
            D3: in  std_logic; D4: in  std_logic; D5: in  std_logic; 
            D6: in  std_logic; D7: in  std_logic; ECLK: in  std_logic; 
            SCLK: in  std_logic; RST: in  std_logic; Q: out  std_logic);
    end component;
    component CLKDIVC
        generic (DIV : in String);
        port (RST: in  std_logic; CLKI: in  std_logic; 
            ALIGNWD: in  std_logic; CDIV1: out  std_logic; 
            CDIVX: out  std_logic);
    end component;
    component ECLKSYNCA
        port (ECLKI: in  std_logic; STOP: in  std_logic; 
            ECLKO: out  std_logic);
    end component;
    attribute GSR : string; 
    attribute IO_TYPE : string; 
    attribute GSR of FF_3 : label is "ENABLED";
    attribute GSR of FF_2 : label is "ENABLED";
    attribute GSR of FF_1 : label is "ENABLED";
    attribute GSR of FF_0 : label is "ENABLED";
    attribute IO_TYPE of Inst7_OB : label is "LVCMOS25";
    attribute IO_TYPE of Inst1_OB0 : label is "LVCMOS25";
    attribute syn_keep : boolean;
    attribute syn_noprune : boolean;
    attribute syn_noprune of Structure : architecture is true;
    attribute NGD_DRC_MASK : integer;
    attribute NGD_DRC_MASK of Structure : architecture is 1;

begin
    -- component instantiation statements
    LUT4_1: ROM16X1A
        generic map (initval=> X"0a78")
        port map (AD3=>opensync_0, AD2=>opensync_3, AD1=>lock_chk, 
            AD0=>scuba_vhi, DO0=>opensync_cken);

    LUT4_0: ROM16X1A
        generic map (initval=> X"fffe")
        port map (AD3=>opensync_0, AD2=>opensync_1, AD1=>scuba_vlo, 
            AD0=>scuba_vlo, DO0=>xstop);

    FF_3: FD1P3BX
        port map (D=>opensync_3, SP=>opensync_cken, CK=>clk_s, PD=>reset, 
            Q=>opensync_0);

    FF_2: FD1P3DX
        port map (D=>opensync_0, SP=>opensync_cken, CK=>clk_s, CD=>reset, 
            Q=>opensync_1);

    FF_1: FD1P3DX
        port map (D=>opensync_1, SP=>opensync_cken, CK=>clk_s, CD=>reset, 
            Q=>opensync_2);

    FF_0: FD1P3DX
        port map (D=>opensync_2, SP=>opensync_cken, CK=>clk_s, CD=>reset, 
            Q=>opensync_3);

    Inst7_OB: OB
        port map (I=>buf_clkout, O=>clkout);

    scuba_vhi_inst: VHI
        port map (Z=>scuba_vhi);

    Inst6_ODDRX4B: ODDRX4B
        port map (D0=>scuba_vhi, D1=>scuba_vlo, D2=>scuba_vhi, 
            D3=>scuba_vlo, D4=>scuba_vhi, D5=>scuba_vlo, D6=>scuba_vhi, 
            D7=>scuba_vlo, ECLK=>eclkc, SCLK=>sclk_t, RST=>reset, 
            Q=>buf_clkout);

    Inst5_ODDRX4B0: ODDRX4B
        port map (D0=>d00, D1=>d10, D2=>d20, D3=>d30, D4=>d40, D5=>d50, 
            D6=>d60, D7=>d70, ECLK=>eclkd, SCLK=>sclk_t, RST=>reset, 
            Q=>buf_douto0);

    Inst4_ECLKSYNCA: ECLKSYNCA
        port map (ECLKI=>clkos, STOP=>xstop, ECLKO=>eclkc);

    scuba_vlo_inst: VLO
        port map (Z=>scuba_vlo);

    Inst3_CLKDIVC: CLKDIVC
        generic map (DIV=> "4.0")
        port map (RST=>reset, CLKI=>eclkd, ALIGNWD=>scuba_vlo, 
            CDIV1=>cdiv1, CDIVX=>sclk_t);

    Inst2_ECLKSYNCA: ECLKSYNCA
        port map (ECLKI=>clkop, STOP=>xstop, ECLKO=>eclkd);

    Inst1_OB0: OB
        port map (I=>buf_douto0, O=>dout(0));

    sclk <= sclk_t;
    d70 <= dataout(7);
    d60 <= dataout(6);
    d50 <= dataout(5);
    d40 <= dataout(4);
    d30 <= dataout(3);
    d20 <= dataout(2);
    d10 <= dataout(1);
    d00 <= dataout(0);
    tx_ready <= xstart;
    xstart <= opensync_3;
end Structure;

-- synopsys translate_off
library MACHXO2;
configuration Structure_CON of tx_mux is
    for Structure
        for all:FD1P3BX use entity MACHXO2.FD1P3BX(V); end for;
        for all:FD1P3DX use entity MACHXO2.FD1P3DX(V); end for;
        for all:ROM16X1A use entity MACHXO2.ROM16X1A(V); end for;
        for all:VHI use entity MACHXO2.VHI(V); end for;
        for all:VLO use entity MACHXO2.VLO(V); end for;
        for all:OB use entity MACHXO2.OB(V); end for;
        for all:ODDRX4B use entity MACHXO2.ODDRX4B(V); end for;
        for all:CLKDIVC use entity MACHXO2.CLKDIVC(V); end for;
        for all:ECLKSYNCA use entity MACHXO2.ECLKSYNCA(V); end for;
    end for;
end Structure_CON;

-- synopsys translate_on
