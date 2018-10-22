library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;  
use IEEE.NUMERIC_STD.all;

entity SyncRegisterTB is
	generic (n: integer := 4);
end SyncRegisterTB;

architecture TB of SyncRegisterTB is
	component SyncRegisterBeh
		Generic (n: integer);
		Port(
		Din: in std_logic_vector(n-1 downto 0);
		CE, C: in std_logic;
		Dout: out std_logic_vector(n-1 downto 0)
		);
	end component;
	component SyncRegisterStruct
		Generic (n: integer);
		Port(
		Din: in std_logic_vector(n-1 downto 0);
		CE, C: in std_logic;
		Dout: out std_logic_vector(n-1 downto 0)
		);
	end component;
	
	signal Dout_Beh, Dout_Struct: std_logic_vector(n-1 downto 0);
	signal Din: std_logic_vector(n-1 downto 0) := (others => '0');
	signal CE: std_logic := '0';
	signal C: std_logic := '0';
	
	constant clock_period : time := 10 ns;
begin
	BEH: SyncRegisterBeh
		generic map (n => n)
		port map (Din => Din, CE => CE, C => C, Dout => Dout_Beh);
	STRUCT: SyncRegisterStruct
		generic map (n => n)
		port map (Din => Din, CE => CE, C => C, Dout => Dout_Struct);
	
	C<=not C after clock_period;
	CE<=not CE after clock_period * 2;
	Din<=Din + "1" after clock_period * 4;
end TB;
