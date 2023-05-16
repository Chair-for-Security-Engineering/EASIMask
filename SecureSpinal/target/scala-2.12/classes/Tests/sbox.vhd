library ieee;
use ieee.std_logic_1964.all;
use ieee.numeric_std.all;

entity sbox is 
	port (
		clk : in std_logic;
		sboxIn  : in std_logic_vector(1 downto 0);
		sboxOut : out std_logic_vector(1 downto 0)
	);
end entity sbox;

architecture behave of sbox is
	
	begin
		if (sboxIn = '00') then
			sboxOut <= '10';
		elsif (sboxIn = '01') then
			sboxOut <= '00'
		elsif (sboxIn = '10') then
			sboxOut <= '11'
		else 
			sboxOut <= '01'
		end if;
end architecture;