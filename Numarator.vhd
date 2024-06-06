library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Numarator is
    Port (
        btn_up : in std_logic;
        btn_down : in std_logic;
        clk : in std_logic;
        rst : in std_logic;
        data_out : out integer
    );
end Numarator;

architecture Behavioral of Numarator is
    signal count : integer := 0;
begin
    process(clk, rst)
    begin
        if rst = '1' then
            count <= 22; -- Initialize la 22
        elsif rising_edge(clk) then
            if btn_up = '1' and count < 32 then
                count <= count + 1;
            elsif btn_down = '1' and count > 10 then
                count <= count - 1;
            end if;
        end if;
    end process;

    data_out <= count;
end Behavioral;
