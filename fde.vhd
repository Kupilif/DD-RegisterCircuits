library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity fde is
	Port(
	D, CE, C: in std_logic;
	Q: out std_logic
	);
end fde;

architecture Beh of fde is
	signal res: std_logic;
begin
	Main: process(D, CE, C)
	begin
		if rising_edge(C) then
			if CE = '1' then
				res<=D;
			end if;
		end if;
	end process;

	Q<=res;
end Beh;

