library ieee;
use ieee.std_logic_1164.all;

entity DFF is 
    port(
        D       : in std_logic_vector(3 downto 0);
        clk     : in std_logic;
        reset   : in std_logic;
        Q       : out std_logic_vector(3 downto 0)
    );
end DFF;

architecture rtl of DFF is 
begin
    process(clk, reset)
    begin
        if(reset = '1') then
            Q <= "0000";
        elsif(rising_edge(clk)) then
            Q <= D;
        end if;
    end process;
end rtl;