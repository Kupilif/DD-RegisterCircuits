library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ShiftRegisterTB is
	Generic (DATA: std_logic_vector := "1011");
end ShiftRegisterTB;

architecture TB of ShiftRegisterTB is
	component ShiftRegisterBeh
		Generic (n: integer);
		Port(
		Sin, SE, CLK, RST: in std_logic;
		Pout: out std_logic_vector(0 to n-1)
		);
	end component;
	component ShiftRegisterStruct
		Generic (n: integer);
		Port(
		Sin, SE, CLK, RST: in std_logic;
		Pout: out std_logic_vector(0 to n-1)
		);
	end component;
	
	signal Sin: std_logic := '0';
	signal SE: std_logic := '0';
	signal CLK: std_logic := '0';
	signal RST: std_logic := '0';
	signal Pout_Beh: std_logic_vector(0 to DATA'Length-1);
	signal Pout_Struct: std_logic_vector(0 to DATA'Length-1);
	
	constant clock_period : time := 10 ns;
begin
	BEH: ShiftRegisterBeh
		generic map (n => DATA'Length)
		port map (Sin => Sin, SE => SE, CLK => CLK, RST => RST, Pout => Pout_Beh);
	STRUCT: ShiftRegisterStruct
		generic map (n => DATA'Length)
		port map (Sin => Sin, SE => SE, CLK => CLK, RST => RST, Pout => Pout_Struct);
	
	CLK<=not CLK after clock_period;
	SE<=not SE after clock_period * 2;
	
	DataFlow: process
	begin
		Sin<='U';
		wait for clock_period;
		for i in DATA'Length-1 downto 0 loop
			Sin<=DATA(i);
			wait for clock_period * 4;
		end loop;
	end process;
	
	Reset: process
	begin
		RST<='1';
		wait for clock_period;
		RST<='0';
		wait for clock_period * 4 * (DATA'Length);
	end process;
end TB;
