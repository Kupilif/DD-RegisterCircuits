library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ShiftRegisterBeh is
	Generic (n: integer := 4);
	Port(
	Sin, SE, CLK, RST: in std_logic;
	Pout: out std_logic_vector(0 to n-1)
	);
end ShiftRegisterBeh;

architecture Beh of ShiftRegisterBeh is
	signal res: std_logic_vector(0 to n-1);
begin
	Main: process(SE, CLK, RST, Sin)
	begin
		if RST = '1' then
			res<=(others => '0');
		elsif rising_edge(CLK) then
			if SE = '1' then
				res<=Sin & res(0 to n-2);
			end if;
		end if;
	end process;

	Pout<=res;
end Beh;

