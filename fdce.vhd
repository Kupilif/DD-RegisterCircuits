library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity fdce is
	Port(
	D, CE, C, CLR: in std_logic;
	Q: out std_logic
	);
end fdce;

architecture Beh of fdce is
	signal res: std_logic;
begin
	Main: process(D, CE, C, CLR)
	begin
		if CLR = '1' then
			res<='0';
		elsif rising_edge(C) then
			if CE = '1' then
				res<=D;
			end if;
		end if;
	end process;

	Q<=res;
end Beh;

