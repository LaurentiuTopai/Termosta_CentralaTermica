----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/28/2024 08:24:18 AM
-- Design Name: 
-- Module Name: DCD7seg - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity DCD7seg is
  Port ( a:in integer; 
        output :out std_logic_vector(6 downto 0));
end DCD7seg;

architecture Behavioral of DCD7seg is

begin

	with a select
output <="1000000" when 0,--0
         "1111001" when 1,--1
         "0100100" when 2,--2
         "0110000" when 3,--3
         "0011001" when 4,--4
         "0010010" when 5,--5
         "0000010" when 6,--6
         "1111000" when 7,--7
         "0000000" when 8,--8
         "0010000" when 9,--9
         "0011100" when 10, --grad
         "1000110" when 11, --C
		 "1111111" when others	; --Eroare la afisare

end Behavioral;
