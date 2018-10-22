library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;  
use IEEE.NUMERIC_STD.all;

entity AsyncRegisterTB is
	generic (n: integer := 4);
end AsyncRegisterTB;

architecture TB of AsyncRegisterTB is
	component AsyncRegisterBeh
		Generic (n: integer);
		Port(
		Din: in std_logic_vector(n-1 downto 0);
		EN: in std_logic;
		Dout: out std_logic_vector(n-1 downto 0)
		);
	end component;
	
	component AsyncRegisterStruct
		Generic (n: integer);
		Port(
		Din: in std_logic_vector(n-1 downto 0);
		EN: in std_logic;
		Dout: out std_logic_vector(n-1 downto 0)
		);
	end component;
	
	signal Dout_Beh, Dout_Struct: std_logic_vector(n-1 downto 0);
	signal Din: std_logic_vector(n-1 downto 0) := (others => '0');
	signal EN: std_logic := '0';
	
	constant clock_period : time := 10 ns;
begin
	BEH: AsyncRegisterBeh
		generic map (n => n)
		port map (Din => Din, EN => EN, Dout => Dout_Beh);
	STRUCT: AsyncRegisterStruct
		generic map (n => n)
		port map (Din => Din, EN => EN, Dout => Dout_Struct);
	
	EN<=not EN after clock_period;
	Din<=Din + "1" after clock_period * 2;
end TB;
