library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity clkdiv is 
port(
    clk     : in std_logic;
    slwclk  : out std_logic
);
end clkdiv;

architecture rtl of clkdiv is
    signal count : unsigned(17 downto 0) := (others => '0');
    signal slwclk_reg : std_logic := '0';
begin
    process(clk) begin
        if(rising_edge(clk)) then
            if(count = 250000) then
                count <= (others => '0');
                slwclk_reg <= not slwclk_reg;
            else 
                count <= count + 1;
            end if;
        end if;
    end process;

    slwclk <= slwclk_reg;

end rtl;