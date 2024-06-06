library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity afisor is
	port(clk:in std_logic;
	     numar:in integer;    
	     segment:out std_logic_vector(6 downto 0); 
	     anozi:out std_logic_vector(3 downto 0) );
end; 

architecture arh of afisor is 
signal clkdiv:std_logic_vector(15 downto 0);
signal clock: std_logic;
signal cifra: integer;

component DCD7seg is
  Port ( a:in integer; 
        output :out std_logic_vector(6 downto 0));
end component;

begin
	convert : DCD7seg port map (cifra, segment);
	
	process(clk)
	begin			
		if(clk'event and clk='1')then
		clkdiv <= clkdiv+1;
		end if;
	end process;
	clock<=clkdiv(15); 
	
	process(clock)
	variable x: integer:=0;
	begin					
		if(rising_edge(clock)) then
			if(x=0)	then
				
				anozi<="1110";	
				cifra<= 11;
				x:=x+1;
			elsif (x=1)	then
				
				anozi<="1101";  
				cifra<=10;
				x:=x+1;	
			elsif (x=2)	then
				 
				anozi<="1011";  
				cifra<= numar mod 10;
				x:=x+1;	 
			elsif (x=3)then
				
				anozi<="0111";  
				cifra<= (numar / 10) mod 10;
				x:=0;	
			end if;
		end if;
	end process;

end arh;