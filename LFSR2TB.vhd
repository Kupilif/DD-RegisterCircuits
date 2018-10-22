library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity LFSR2TB is
end LFSR2TB;

architecture TB of LFSR2TB is
	component LFSR2
		Generic (
			polynom: std_logic_vector;
			initState: std_logic_vector
		);
		Port(
			RST, CLK: in std_logic;
			State: out std_logic_vector(0 to polynom'Length-1);
			Gen: out std_logic
		);
	end component;

	constant clock_period : time := 10 ns;
	constant polynom: std_logic_vector := 		"0010000001";
	constant initState: std_logic_vector := 	"0000000001";
	
	signal RST: std_logic := '1';
	signal CLK: std_logic := '1';
	signal State: std_logic_vector(0 to polynom'Length-1);
	signal Gen: std_logic;
begin
	BEH: LFSR2
		generic map (polynom => polynom, initState => initState)
		port map (RST => RST, CLK => CLK, State => State, Gen => Gen);
		
	RST<='0' after clock_period;
	CLK<=not CLK after clock_period;
end TB;
