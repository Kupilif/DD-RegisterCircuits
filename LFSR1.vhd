library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity LFSR1 is
	Generic (
		polynom: std_logic_vector := 			"0010000001"; -- 1 + x^3 + x^10 (v21)
		initState: std_logic_vector := 		"1111111111"
	);
	Port(
		RST, CLK: in std_logic;
		State: out std_logic_vector(0 to polynom'Length-1);
		Gen: out std_logic
	);
end LFSR1;

architecture Beh of LFSR1 is
	signal reg: std_logic_vector(0 to polynom'Length-1);
	signal dat: std_logic_vector(0 to polynom'Length-1);
begin
	Main: process(RST, CLK, dat)
	begin
		if RST = '1' then
			reg<=initState;
		elsif rising_edge(CLK) then
			reg<=dat;
		end if;
	end process;

	Data: process(reg)
		variable newRes: std_logic;
	begin
		newRes:='0';
		for i in polynom'Length-1 downto 0 loop
			if polynom(i) = '1' then
				newRes := newRes xor reg(i);
			end if;
		end loop;
		dat<=newRes & reg(0 to polynom'Length-2);
	end process;

	State<=reg;
	Gen<=reg(polynom'Length-1);
end Beh;
