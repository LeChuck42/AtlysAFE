library ieee;
use ieee.NUMERIC_STD.all;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity main_tb is
end main_tb;

architecture TB_ARCHITECTURE of main_tb is
	-- Component declaration of the tested unit
	component main
	port(
		CLK_FPGA : in STD_LOGIC;
		CLK_REFSEL : out STD_LOGIC;
		CLK_PDN : out STD_LOGIC;
		CLK_SYNC : out STD_LOGIC;
		CLK_SPI_LE : out STD_LOGIC;
		CLK_SPI_CLK : out STD_LOGIC;
		CLK_SPI_MOSI : out STD_LOGIC;
		CLK_SPI_MISO : in STD_LOGIC;
		CLKIN_SEL0 : out STD_LOGIC;
		CLKIN_SEL1 : out STD_LOGIC;
		CLKOUT_TYPE0 : out STD_LOGIC;
		CLKOUT_TYPE1 : out STD_LOGIC;
		MUX_CLK : in STD_LOGIC;
		MUX1 : in STD_LOGIC;
		MUX2 : in STD_LOGIC;
		MUX3 : out STD_LOGIC;
		ENAB_3V3_LDO : out STD_LOGIC;
		ENAB_DAC_LDO : out STD_LOGIC;
		FPGA_PGOOD : in STD_LOGIC;
		PDN_IN1 : out STD_LOGIC;
		PDN_IN2 : out STD_LOGIC;
		ADC_PDNA : out STD_LOGIC;
		ADC_PDNB : out STD_LOGIC;
		ADC_RESET : out STD_LOGIC;
		ADC_SPI_CS : out STD_LOGIC;
		ADC_SPI_SDATA : inout STD_LOGIC;
		ADC_SPI_CLK : out STD_LOGIC;
		DAC_TXEN : out STD_LOGIC;
		DAC_ALARM : in STD_LOGIC;
		DAC_SPI_CS : out STD_LOGIC;
		DAC_SPI_SDIO : inout STD_LOGIC;
		DAC_SPI_CLK : out STD_LOGIC;
		SIO_RX : in STD_LOGIC;
		SIO_TX : out STD_LOGIC;
		SIO_RTSn : in STD_LOGIC;
		SIO_CTSn : out STD_LOGIC;
		SIO_DTRn : in STD_LOGIC;
		SIO_DSRn : out STD_LOGIC;
		SIO_DCDn : out STD_LOGIC;
		LED : out STD_LOGIC_VECTOR(3 downto 0);
		GPIO : inout STD_LOGIC_VECTOR(13 downto 0) );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal CLK_FPGA : STD_LOGIC;
	signal CLK_SPI_MISO : STD_LOGIC;
	signal MUX_CLK : STD_LOGIC;
	signal MUX1 : STD_LOGIC;
	signal MUX2 : STD_LOGIC;
	signal FPGA_PGOOD : STD_LOGIC;
	signal DAC_ALARM : STD_LOGIC;
	signal SIO_RX : STD_LOGIC;
	signal SIO_RTSn : STD_LOGIC;
	signal SIO_DTRn : STD_LOGIC;
	signal ADC_SPI_SDATA : STD_LOGIC;
	signal DAC_SPI_SDIO : STD_LOGIC;
	signal GPIO : STD_LOGIC_VECTOR(13 downto 0);
	-- Observed signals - signals mapped to the output ports of tested entity
	signal CLK_REFSEL : STD_LOGIC;
	signal CLK_PDN : STD_LOGIC;
	signal CLK_SYNC : STD_LOGIC;
	signal CLK_SPI_LE : STD_LOGIC;
	signal CLK_SPI_CLK : STD_LOGIC;
	signal CLK_SPI_MOSI : STD_LOGIC;
	signal CLKIN_SEL0 : STD_LOGIC;
	signal CLKIN_SEL1 : STD_LOGIC;
	signal CLKOUT_TYPE0 : STD_LOGIC;
	signal CLKOUT_TYPE1 : STD_LOGIC;
	signal MUX3 : STD_LOGIC;
	signal ENAB_3V3_LDO : STD_LOGIC;
	signal ENAB_DAC_LDO : STD_LOGIC;
	signal PDN_IN1 : STD_LOGIC;
	signal PDN_IN2 : STD_LOGIC;
	signal ADC_PDNA : STD_LOGIC;
	signal ADC_PDNB : STD_LOGIC;
	signal ADC_RESET : STD_LOGIC;
	signal ADC_SPI_CS : STD_LOGIC;
	signal ADC_SPI_CLK : STD_LOGIC;
	signal DAC_TXEN : STD_LOGIC;
	signal DAC_SPI_CS : STD_LOGIC;
	signal DAC_SPI_CLK : STD_LOGIC;
	signal SIO_TX : STD_LOGIC;
	signal SIO_CTSn : STD_LOGIC;
	signal SIO_DSRn : STD_LOGIC;
	signal SIO_DCDn : STD_LOGIC;
	signal LED : STD_LOGIC_VECTOR(3 downto 0);

	signal mux_sig : std_logic_vector(7 downto 0);
	signal mux_ready : std_logic;
	signal i: integer range 0 to 7;
	
	signal spi_cs_fpga: std_logic;
	signal spi_cs_adc: std_logic;
	signal spi_cs_dac: std_logic;
	signal spi_cs_clk: std_logic;
	signal spi_clk: std_logic;
	signal spi_mosi: std_logic;
	signal spi_miso: std_logic;
	signal spi_cs_oe: std_logic;
	
	constant spi_clk_period : time := 800ns;
begin

	-- Unit Under Test port map
	UUT : main
		port map (
			CLK_FPGA => CLK_FPGA,
			CLK_REFSEL => CLK_REFSEL,
			CLK_PDN => CLK_PDN,
			CLK_SYNC => CLK_SYNC,
			CLK_SPI_LE => CLK_SPI_LE,
			CLK_SPI_CLK => CLK_SPI_CLK,
			CLK_SPI_MOSI => CLK_SPI_MOSI,
			CLK_SPI_MISO => CLK_SPI_MISO,
			CLKIN_SEL0 => CLKIN_SEL0,
			CLKIN_SEL1 => CLKIN_SEL1,
			CLKOUT_TYPE0 => CLKOUT_TYPE0,
			CLKOUT_TYPE1 => CLKOUT_TYPE1,
			MUX_CLK => MUX_CLK,
			MUX1 => MUX1,
			MUX2 => MUX2,
			MUX3 => MUX3,
			ENAB_3V3_LDO => ENAB_3V3_LDO,
			ENAB_DAC_LDO => ENAB_DAC_LDO,
			FPGA_PGOOD => FPGA_PGOOD,
			PDN_IN1 => PDN_IN1,
			PDN_IN2 => PDN_IN2,
			ADC_PDNA => ADC_PDNA,
			ADC_PDNB => ADC_PDNB,
			ADC_RESET => ADC_RESET,
			ADC_SPI_CS => ADC_SPI_CS,
			ADC_SPI_SDATA => ADC_SPI_SDATA,
			ADC_SPI_CLK => ADC_SPI_CLK,
			DAC_TXEN => DAC_TXEN,
			DAC_ALARM => DAC_ALARM,
			DAC_SPI_CS => DAC_SPI_CS,
			DAC_SPI_SDIO => DAC_SPI_SDIO,
			DAC_SPI_CLK => DAC_SPI_CLK,
			SIO_RX => SIO_RX,
			SIO_TX => SIO_TX,
			SIO_RTSn => SIO_RTSn,
			SIO_CTSn => SIO_CTSn,
			SIO_DTRn => SIO_DTRn,
			SIO_DSRn => SIO_DSRn,
			SIO_DCDn => SIO_DCDn,
			LED => LED,
			GPIO => GPIO
		);

	osc: process
	begin
		CLK_FPGA <= '0';
		wait;
		wait for 50 ns;
		CLK_FPGA <= '1';
		wait for 50 ns;
	end process;

	CLK_SPI_MISO <= 'L';
				
	MUX1 <= 'L';
	
	process
	begin
		MUX_CLK <= '0';
		wait for 2 ns;
		if FPGA_PGOOD = '1' then
			MUX_CLK <= '1';
		end if;
		wait for 2 ns;
	end process;
	
	process	(MUX_CLK, FPGA_PGOOD)
	
	begin
		if FPGA_PGOOD = '0' then
			MUX2 <= '0';		  
		elsif MUX_CLK'event then
			MUX2 <= mux_sig(i) after 1 ns;
			if i < 7 then
				i <= i + 1;
			else
				i <= 0;
			end if;
		end if;
	end process;
	
	process				  
	begin
		mux_sig <= "00000001";
		mux_ready <= '0';
		wait for 12 us;
		wait until i = 0;
		mux_sig <= "10000001";
		wait for 100 ns;
		mux_ready <= '1';
		loop 
			wait until i = 0;
			mux_sig(7) <= not mux_sig(7);
			mux_sig(6) <= spi_clk;
			mux_sig(5) <= spi_mosi;
			mux_sig(4) <= spi_cs_fpga;
			mux_sig(3) <= spi_cs_adc;
			mux_sig(2) <= spi_cs_dac;
			mux_sig(1) <= spi_cs_clk;
			mux_sig(0) <= spi_cs_oe;
		end loop;
	end	process;
		
	spi_proc: process
		procedure spi_send16(data: in std_logic_vector(15 downto 0) ) is
		begin
			for i in 15 downto 0 loop
				spi_clk <= '0';
				spi_mosi <= data(i);
				wait for spi_clk_period / 2;
				spi_clk <= '1';
				wait for spi_clk_period / 2;
			end loop;
			spi_clk <= '0';
		end procedure;
	begin
		spi_cs_oe <= '1';
		spi_cs_clk <= '1';
		spi_cs_dac <= '1';
		spi_cs_adc <= '1';
		spi_cs_fpga <= '1';
		spi_mosi <= '0';
		spi_clk <= '0';
		wait until mux_ready = '1';
		wait for 100ns;
		spi_cs_fpga <= '0';
		wait for 100ns;
		spi_send16(x"2003");
		wait for 100 ns;
		spi_cs_fpga <= '1';
		wait;
	end process;
	
	
	reset_proc: process
	begin
		FPGA_PGOOD <= '0';
		wait for 10 us;
		FPGA_PGOOD <= '1';
		wait;
	end process;
	
	DAC_ALARM <= 'L';
	SIO_RX <= 'H';
	SIO_RTSn <= 'H';
	SIO_DTRn <= 'H';
	ADC_SPI_SDATA <= 'L';
	DAC_SPI_SDIO <= 'L';
	GPIO <= (others =>  'L');

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_main of main_tb is
	for TB_ARCHITECTURE
		for UUT : main
			use entity work.main(rtl);
		end for;
	end for;
end TESTBENCH_FOR_main;

