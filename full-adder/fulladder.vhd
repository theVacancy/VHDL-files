

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity fulladder is
  Port ( 
			x_i : in std_logic;
			y_i : in std_logic;
			z_i : in std_logic;
			
			carry_o : out std_logic;
			sum_o : out std_logic);
end fulladder;

architecture Behavioral of fulladder is

	signal carry1, carry2, sum1, sum2: std_logic; 
	
	component halfadder is 
	Port (
			A_i : in std_logic;
			B_i : in std_logic;
			C_o : out std_logic;
			S_o : out std_logic
		);
	end component;

begin

	halfadder1: halfadder Port map (
							A_i => x_i,
							B_i => y_i,
							C_o => carry1,
							S_o => sum1								
						);
	halfadder2: halfadder Port map (
							A_i => sum1,
							B_i => z_i,
							C_o => carry2,
							S_o => sum2							
						);	
	
	carry_o <= carry1 or carry2;
	sum_o <= sum2;

end Behavioral;
