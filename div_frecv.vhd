library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity div_frecv is
  Port (
    clk_in  : in std_logic;
    rst     : in std_logic;
    clk_out : out std_logic
  );
end div_frecv;

architecture Behavioral of div_frecv is
  signal cnt : integer := 0;
  signal clk_int : std_logic := '0';
begin
  process(clk_in, rst)
  begin
    if rst = '1' then
      cnt <= 0;
      clk_int <= '0';
    elsif rising_edge(clk_in) then
      cnt <= cnt + 1;
      if cnt = 50000000 then
        clk_int <= not clk_int;
        cnt <= 0;
      end if;
    end if;
  end process;

  clk_out <= clk_int;

end Behavioral;