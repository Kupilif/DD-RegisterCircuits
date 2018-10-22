library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SignatureAnalyzerTB is
end SignatureAnalyzerTB;

architecture TB of SignatureAnalyzerTB is
	component SignatureAnalyzer
		Generic (polynom: std_logic_vector);
		Port(
			RST, CLK, Sin: in std_logic;
			State: out std_logic_vector(0 to polynom'Length-1);
			Gen: out std_logic
		);
	end component;
	
	constant polynom: std_logic_vector := "0010000001";
	--constant data: std_logic_vector := "1111"; -- частное: 0; остаток: x^3 + x^2 + x + 1
	constant data: std_logic_vector := "111110000111"; -- частное: x + 1; остаток: x^9 + x^2
	constant clock_period: time := 10 ns;
	
	signal RST: std_logic;
	signal CLK: std_logic := '1';
	signal Sin: std_logic := '0';
	signal State: std_logic_vector(0 to polynom'Length-1);
	signal Gen: std_logic;
begin
	BEH: SignatureAnalyzer
		generic map (polynom => polynom)
		port map (RST => RST, CLK => CLK, Sin => Sin, State => State, Gen => Gen);
		
	CLK<=not CLK after clock_period;	
	
	DataFlow: process
	begin
		wait for clock_period;
		for i in data'Length-1 downto 0 loop
			Sin<=data(i);
			wait for clock_period * 2;
		end loop;
	end process;
	
	Reset: process
	begin
		RST<='1';
		wait for clock_period;
		RST<='0';
		wait for clock_period * 2 * (data'Length);
	end process;
end TB;
