library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Debouncer is
    Port (
        btn : in std_logic;
        clk : in std_logic;
        en : out std_logic
    );
end Debouncer;

architecture Behavioral of Debouncer is
    signal btn_sync : std_logic_vector(1 downto 0);
begin
    process(clk)
    begin
        if rising_edge(clk) then
            btn_sync <= btn_sync(0) & btn;
            if btn_sync = "11" then
                en <= '1';
            else
                en <= '0';
            end if;
        end if;
    end process;
end Behavioral;
