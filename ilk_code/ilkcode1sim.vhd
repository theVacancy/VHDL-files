library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity ilkcode1sim is
end ilkcode1sim;

architecture sim of ilkcode1sim is

	constant sizeb : integer := 7;

	signal signal1 : unsigned(sizeb downto 0) := x"AA";  
	signal signal2 : unsigned(7 downto 0) := x"BB";  
	signal signal3 : unsigned(7 downto 0) := x"CC";  
	signal signal4 : unsigned(7 downto 0) := x"DD";  
	
	signal selec : unsigned(1 downto 0) := (others => '0');  
	
	signal output : unsigned(7 downto 0); 
	
begin
	-- tasarlanan cihaza simulasyon verilerini giriyoruz
	instance_device1 : entity work.ilkcode1(rtl) 
	
	generic map(datawidth => 8); -- 8 bit uzunlukta olsun diye tanımladık
	
	port map(
	s1 => signal1,
	s2 => signal2,
	s3 => signal3,
	s4 => signal4,
	sel => selec,
	outp => output);

	process is 
	begin
		-- 00
		wait for 10 ns;
		sel <= sel + 1 ;
		-- 01
		wait for 10 ns;
		sel <= sel + 1 ;
		-- 10
		wait for 10 ns;
		sel <= sel + 1 ;
		-- 11
		wait for 10 ns;
		sel <= "01";
		wait;
	end process;

end sim;
