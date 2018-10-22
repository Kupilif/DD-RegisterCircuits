library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SyncRegisterStruct is
	Generic (n: integer := 4);
	Port(
	Din: in std_logic_vector(n-1 downto 0);
	CE, C: in std_logic;
	Dout: out std_logic_vector(n-1 downto 0)
	);
end SyncRegisterStruct;

architecture Struct of SyncRegisterStruct is
	component fde
		Port(
		D, CE, C: in std_logic;
		Q: out std_logic
		);
	end component;
begin
	reg: for i in n-1 downto 0 generate
		U_i: fde port map (D => Din(i), CE => CE, C => C, Q => Dout(i));
	end generate;
end Struct;

