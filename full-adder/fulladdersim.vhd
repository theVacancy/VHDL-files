

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity fulladdersim is
    Port ( asd : in STD_LOGIC);
end fulladdersim;

architecture Behavioral of fulladdersim is

	component fulladder
		Port (
			x_i : in std_logic;
			y_i : in std_logic;
			z_i : in std_logic;		
			carry_o : out std_logic;
			sum_o :   out std_logic 
			);
	end component;
	
	signal signal_i : std_logic_vector(2 downto 0);
	signal co : std_logic;
	signal so : std_logic;
	
	
begin

	pm : fulladder Port map (
						x_i => signal_i(2),
						y_i => signal_i(1),
						z_i => signal_i(0),
						carry_o => co,
						sum_o => so
						);
						
	process  is
	begin
		wait for 10 ns;
		signal_i <= "001";
		wait for 10 ns;
		signal_i <= "010";
		wait for 10 ns;
		signal_i <= "011";
		wait;
	end process;

end Behavioral;
