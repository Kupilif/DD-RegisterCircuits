library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SyncRegisterBeh is
	Generic (n: integer := 4);
	Port(
	Din: in std_logic_vector(n-1 downto 0);
	CE, C: in std_logic;
	Dout: out std_logic_vector(n-1 downto 0)
	);
end SyncRegisterBeh;

architecture Beh of SyncRegisterBeh is
	signal res: std_logic_vector(n-1 downto 0);
begin
	Main: process(Din, CE, C)
	begin
		if rising_edge(C) then
			if CE = '1' then
				res<=Din;
			end if;
		end if;
	end process;

	Dout<=res;
end Beh;

