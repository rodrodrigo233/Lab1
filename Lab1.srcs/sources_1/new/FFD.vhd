library ieee;
use ieee.std_logic_1164.all;

entity FFD is
    port(
        d,clk,rst : in std_logic;
        q         : out std_logic);
end FFD;

architecture behave of FFD is
begin
    process(clk,rst)
        begin
            if (rst='0')then
                q<='0';
            elsif (rising_edge(clk)) then
                q<=d;
            end if;
        end process;
end behave;