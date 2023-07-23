

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity jk is
    Port ( 
		   j : in STD_LOGIC;
           k : in STD_LOGIC;
           clk : in STD_LOGIC;
           q : out STD_LOGIC := '0'
		   );
end jk;

architecture Behavioral of jk is
	-- Q değerini hafızada tutması için değişken 
	-- Q inout yapınca da çöülebiliyormuş
	signal buff : std_logic := '0'; 

begin
	flipflop : process(clk) is
	begin
	
	if rising_edge(clk) then
	
		if (j = '0' and k = '0') then
		buff <= buff;
		end if;
		
		if (j = '0' and k = '1') then
		buff <= '0';
		end if;
		
		if (j = '1' and k = '0') then
		buff <= '1';
		end if;
		
		if (j = '0' and k = '1') then
		buff <= not buff;
		end if;	
		
		q <= buff;
	
	end if;
	end process flipflop;

end Behavioral;
