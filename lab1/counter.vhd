library ieee;
use ieee.std_logic_1164.all;

entity counter is 
port(
    running     : in std_logic;
    numin       : in std_logic_vector(3 downto 0);
    numout      : out std_logic_vector(3 downto 0)
);
end counter; 

architecture rtl of counter is
begin
    numout <= "0000" when numin = "1001" else 
              std_logic_vector(unsigned(numin) + 1) when running = '1' else 
              numin;
end rtl;