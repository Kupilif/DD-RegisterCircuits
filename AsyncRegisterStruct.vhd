library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity AsyncRegisterStruct is
	Generic (n: integer := 4);
	Port(
	Din: in std_logic_vector(n-1 downto 0);
	EN: in std_logic;
	Dout: out std_logic_vector(n-1 downto 0)
	);
end AsyncRegisterStruct;

architecture Struct of AsyncRegisterStruct is
	component lde
		Port(
		D, E: in std_logic;
		Q: out std_logic
		);
	end component;
begin
	reg: for i in n-1 downto 0 generate
		U_i: lde port map (D => Din(i), E => EN, Q => Dout(i));
	end generate;
end Struct;
