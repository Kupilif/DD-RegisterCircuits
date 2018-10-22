library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity lde is
    Port ( D : in  STD_LOGIC;
           E : in  STD_LOGIC;
           Q : out  STD_LOGIC);
end lde;

architecture Beh of lde is
	signal q_t: std_logic;
begin
	Main: process (D,E)
	begin
		if E = '1' then
			q_t<=D;
		end if;
	end process;
	
	Q<=q_t;
end Beh;
