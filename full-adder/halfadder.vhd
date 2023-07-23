

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity halfadder is
  Port ( 
			A_i : in std_logic;
			B_i : in std_logic;
			
			C_o : out std_logic;
			S_o : out std_logic );
end halfadder;

architecture Behavioral of halfadder is

begin

	islem : process(A_i,B_i) is
	begin
	
	S_o <= A_i xor B_i;
	C_o <= A_i and B_i;
	
	end process islem;


end Behavioral;
