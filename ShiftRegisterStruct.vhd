library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ShiftRegisterStruct is
	Generic (n: integer := 4);
	Port(
	Sin, SE, CLK, RST: in std_logic;
	Pout: out std_logic_vector(0 to n-1)
	);
end ShiftRegisterStruct;

architecture Struct of ShiftRegisterStruct is
	component fdce
		Port(
		D, CE, C, CLR: in std_logic;
		Q: out std_logic
		);
	end component;
	
	signal buff: std_logic_vector(0 to n-1);
begin
	U0: fdce port map (D => Sin, CE => SE, C => CLK, CLR => RST, Q => buff(0));
	reg: for i in 1 to n-1 generate
		U_i: fdce port map (D => buff(i-1), CE => SE, C => CLK, CLR => RST, Q => buff(i));
	end generate;
	
	Pout<=buff;
end Struct;

