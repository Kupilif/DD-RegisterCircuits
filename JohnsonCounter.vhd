library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity JohnsonCounter is
	Generic (n: integer := 4);
	Port(
	CLK, RST: in std_logic;
	Pout: out std_logic_vector(0 to n-1)
	);
end JohnsonCounter;

architecture Beh of JohnsonCounter is
	signal reg: std_logic_vector(0 to n-1);
	signal dat: std_logic_vector(0 to n-1);
begin
	Main: process(CLK, RST, dat)
	begin
		if RST = '1' then
			reg<=(others => '0');
		elsif rising_edge(CLK) then
			reg<=dat;
		end if;
	end process;

	Data: process(reg)
	begin
		dat<=not reg(n-1) & reg(0 to n-2);
	end process;

	Pout<=reg;
end Beh;

