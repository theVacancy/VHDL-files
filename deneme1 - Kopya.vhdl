library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity deneme1 is 
end entity;

architecture sim of deneme1 is 

	signal mysignal : integer := 0;
	
	-- logic variable
	signal signalA : std_logic := '0';
	signal signalB : std_logic;
	signal signalC : std_logic;
	
	signal signalV1 : std_logic_vector(7 downto 0); -- 8 bitlik 
	signal signalV2 : std_logic_vector(7 downto 0) := (others => '0'); -- initial value atama
	signal signalV3 : std_logic_vector(7 downto 0) := x"AA";   		-- hex değer atama 1000 0000
	signal signalV4 : std_logic_vector(7 downto 0) := "10101010";
	signal signalV5 : std_logic_vector(0 to 7) := "10101010"; 		-- bu sefer en düşük değerlikli bit 1 oluyor ters yani
	-- signalV1'left yapınca left most bit oluyor yani 7 
	
	signal unsignelsignal : unsigned(7 downto 0) := (others => '0'); 
	signal signelsignal :     signed(7 downto 0) := (others => '0'); 
	
	signal mux1 : unsigned(7 downto 0) := (others => '0'); 
	signal mux2 : unsigned(7 downto 0) := (others => '0'); 
	signal muxout :    unsigned(7 downto 0) := (others => '0'); 
	signal muxselect : unsigned(1 downto 0) := (others => '0'); 

begin 
	process is
		variable myvar : integer := 0; 
	begin 
 
		for i in 0 to 10 loop
			report "i=" & integer'image(i);
			myvar := myvar + 1; -- her artış satırına gelince artıyor.
			mysignal <= mysignal + 1; -- her bekelmeden sonra artıyor
		end loop;
		wait for 10 ns;
	end process;
	
	
	-- her mysignal değeri değişince print yapacak
	process is 
		begin
		wait on mysignal; 
		report "mysignal = " & integer'image(mysignal);
	end process;


	-- her mysignal değeri 10 olunca print yapacak
	process is 
	begin
		wait until mysignal = 10; 
		report "mysignal = " & integer'image(mysignal);
	end process;
	
	
	-- if else komutu 
	process is 
	begin
		if mysignal > 10 then -- 10 dan büyükse yazacak
			report "mysignal = " & integer'image(mysignal);
		end if;
		wait;
	end process;
	
	
	-- mysignal değeri değişince (wait on gibi) aktifleşecek
	-- sensitiv to variable process
	process(mysignal) is 
	begin
		report "mysignal = " & integer'image(mysignal);
	end process;
	
	
	-- LOGIC 
	process is
	begin
		wait for 10 ns;
		signalA <= not signalA; 
	end process;
	
	-- SWITCH / CASE
	process(mux1,mux2) is
	begin
	
		case muxselect is 
			when "00" =>
				muxout <= mux1;
			when "01" =>
				muxout <=  mux2;
			when others => 
				muxout <= (others => 'X');
		end case;
		
	end process;
	
	



end architecture;
