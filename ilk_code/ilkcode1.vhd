

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;


entity ilkcode1 is
	generic(datawidth : integer);
    Port ( 
	s1 : in unsigned(datawidth-1 downto 0); -- sim dosyasında datawidth e 8 veriyoruz
	s2 : in unsigned(7 downto 0);
	s3 : in unsigned(7 downto 0);
	s4 : in unsigned(7 downto 0);
	
	sel : in unsigned(1 downto 0);
	
    outp : out unsigned(7 downto 0)); -- port parantezini unutma
	
end entity;

architecture rtl of ilkcode1 is

begin

	process(s1,s2,s3,s4,sel) is
	begin
		case sel is 
			when "00" =>
				outp <= s1;
			when "01" =>
				outp <= s2;
			when "10" =>
				outp <= s3;
			when "11" =>
				outp <= s4;
			when others => 
				outp <= (others => 'X');
		end case;
	end process;



end architecture;
