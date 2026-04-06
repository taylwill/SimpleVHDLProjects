library ieee;
use ieee.std_logic_1164.all;

entity stopwatch is 
port(
    start   : in std_logic;
    stoper  : in std_logic;
    reset   : in std_logic;
    clk     : in std_logic;
    numout  : out std_logic_vector(3 downto 0)
);
end stopwatch;

architecture rtl of stopwatch is  
    component DFF is 
    port(
        D       : in std_logic_vector(3 downto 0);
        clk     : in std_logic;
        reset   : in std_logic;
        Q       : out std_logic_vector(3 downto 0)
    );
    end component;

    component counter is 
    port(
        running     : in std_logic;
        numin       : in std_logic_vector(3 downto 0);
        numout      : out std_logic_vector(3 downto 0)
    );
    end component; 

    signal numin : std_logic_vector(3 downto 0);
    signal running : std_logic;
begin
    process (start, stoper) 
    begin
        if(falling_edge(start)) then
            running <= '1';
        elsif(falling_edge(stopper)) then
            running <= '0';
        end if;
    end process;

    REG1: DFF 
        port map (
            clk   => clk,
            reset => reset,
            D     => numin,    
            Q     => numout  
        );

    counter: counter
    port(
        running  => running,
        numin    => numout,
        numout   => numin
    );
end rtl;
