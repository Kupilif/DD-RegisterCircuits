library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity AsyncRegisterBeh is
	Generic (n: integer := 4);
	Port(
	Din: in std_logic_vector(n-1 downto 0);
	EN: in std_logic;
	Dout: out std_logic_vector(n-1 downto 0)
	);
end AsyncRegisterBeh;

architecture Beh of AsyncRegisterBeh is
	signal res: std_logic_vector(n-1 downto 0);
begin
	Main: process(Din, EN)
	begin
		if EN = '1' then
			res<=Din;
		end if;
	end process;
	
	Dout<=res;
end Beh;
