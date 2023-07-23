


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity jk_sim is
end jk_sim;

architecture sim of jk_sim is

	signal signaljk : std_logic_vector(1 downto 0); 
	signal CLK : std_logic := '0';
	signal q_out : std_logic;
	
	constant clk_f : integer := 100e6;
	constant clk_T : time    := 1000 ms / clk_f; -- 10 ns şuan  

	component jk is 
    Port ( 
		   j : in STD_LOGIC;
           k : in STD_LOGIC;
           clk : in STD_LOGIC;
           q : out STD_LOGIC);
	end component;

begin

	-- generating clock signal 
	CLK <= not CLK after clk_T / 2; 

	pm : jk Port map(
				j => signaljk(1),
				k => signaljk(0),
				clk => CLK,
				q => q_out
				);
				
	switching : process is
	begin
	signaljk <= "10"; -- q=1
	wait for 20 ns; 
	signaljk <= "00"; -- q=1 hold
	wait for 20 ns;
	signaljk <= "01"; -- q=0 reset
	wait for 20 ns;
	signaljk <= "11"; -- q=1 toggle
	wait;
	
	
	end process switching;


end sim;
