library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity spi_mux is
	generic (
		TARGETS:	natural := 3);
	
	port (
		-- slave port
		spi_cs:		in std_logic;
		spi_clk:	in std_logic;
		spi_mosi:	in std_logic;
		spi_miso:	out std_logic;
		spi_oe:		in std_logic;
		
		-- mux outputs
		spi_mux_cs:		out std_logic_vector(TARGETS-1 downto 0);
		spi_mux_clk:	out std_logic_vector(TARGETS-1 downto 0);
		spi_mux_mosi:	out std_logic_vector(TARGETS-1 downto 0);
		spi_mux_miso:	in  std_logic_vector(TARGETS-1 downto 0));
		
end entity spi_mux;

architecture rtl of spi_mux is
	signal mux_buf: std_logic_vector(7 downto 0);
	signal bit_cnt: integer range 0 to 7;
	signal mux_ignore: std_logic;
	signal spi_mux_cs_int: std_logic_vector(TARGETS-1 downto 0);
begin
	
	mux_proc: process(spi_clk, spi_cs)
	begin
		if spi_cs = '1' then
			spi_mux_cs_int <= (others => '1');
			bit_cnt <= 0;
			mux_buf <= "01111111";
			mux_ignore <= '0';
		elsif rising_edge(spi_clk) then
			if bit_cnt = 7 then
				spi_mux_cs_int <= mux_buf(spi_mux_cs_int'RANGE);
			else
				bit_cnt <= bit_cnt + 1;
				if spi_mosi = '1' then
					mux_ignore <= '1';
				end if;
				if mux_ignore = '0' then
					mux_buf <= '1' & mux_buf(7 downto 1);
				end if;
			end if;
		end if;
	end process;
	spi_mux_cs <= spi_mux_cs_int;
	
	gen_mux: for i in 0 to TARGETS-1 generate
		spi_mux_clk(i) <= spi_clk when spi_mux_cs_int(i) = '0' else '0';
		spi_mux_mosi(i) <= spi_mosi when (spi_mux_cs_int(i) = '0') and (spi_oe = '1') else 'Z';
		spi_miso <= spi_mux_miso(i) when spi_mux_cs_int(i) = '0' else 'Z';
	end generate;
end architecture rtl;