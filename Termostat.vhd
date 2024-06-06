library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Termostat is
    Port (
        clk : in std_logic;
        rst : in std_logic;
        btn_up : in std_logic;
        btn_down : in std_logic;
        Data_out_catods : out std_logic_vector(6 downto 0);
        Data_out_anods : out std_logic_vector(3 downto 0) 
    );
end Termostat;

architecture Behavioral of Termostat is
   
component div_frecv is
  Port (
    clk_in  : in std_logic;
    rst     : in std_logic;
    clk_out : out std_logic
  );
end component;

    component Debouncer is
        Port (
            btn : in std_logic;
            clk : in std_logic;
            en : out std_logic
        );
    end component;

    component Numarator is
        Port (
            btn_up : in std_logic;
            btn_down : in std_logic;
            clk : in std_logic;
            rst : in std_logic;
            data_out : out integer
        );
    end component;

    component afisor is
	port(clk:in std_logic;
	     numar:in integer;    
	     segment:out std_logic_vector(6 downto 0); 
	     anozi:out std_logic_vector(3 downto 0) );
    end component; 

    signal btn_up_debounced : std_logic;
    signal btn_down_debounced : std_logic;
   -- signal temperature : std_logic_vector(7 downto 0);
    signal clk_div:std_logic := '0';
    signal temp : integer := 22;
begin
divizor : div_frecv port map(clk,rst,clk_div);
    Debouncer_up : Debouncer
        port map (
            btn => btn_up,
            clk => clk_div,
            en => btn_up_debounced
        );

    Debouncer_down : Debouncer
        port map (
            btn => btn_down,
            clk => clk_div,
            en => btn_down_debounced
        );

    Counter : Numarator
        port map (
            btn_up => btn_up_debounced,
            btn_down => btn_down_debounced,
            clk => clk_div,
            rst => rst,
            data_out => temp
        );
    
    Display : afisor
        port map ( clk, temp, Data_out_catods, Data_out_anods
        );

end Behavioral;
