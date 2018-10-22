library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity JohnsonCounterTB is
end JohnsonCounterTB;

architecture TB of JohnsonCounterTB is
	component JohnsonCounter
		Generic (n: integer);
		Port(
		CLK, RST: in std_logic;
		Pout: out std_logic_vector(0 to n-1)
		);
	end component;
	
	constant clock_period: time := 10 ns;
	constant n: integer := 4;
	
	signal RST: std_logic := '1';
	signal CLK: std_logic := '0';
	signal Pout: std_logic_vector(0 to n-1);
begin
	BEH: JohnsonCounter
		generic map (n => n)
		port map (CLK => CLK, RST => RST, Pout => Pout);
		
	RST<='0' after clock_period;
	CLK<=not CLK after clock_period;
end TB;
