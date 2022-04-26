library ieee;
use ieee.std_logic_1164.all;

entity tb_ff is
end tb_ff;

architecture testbench of tb_ff is
    component FFD is
    port(
        d,clk,rst : in std_logic;
        q         : out std_logic);
end component;
signal d1,clk1,rst1,q1 : std_logic; 
begin
uut: FFD port map(d=>d1,clk=>clk1,rst=>rst1,q=>q1);
    process begin
        rst1<='0'; wait for 10 us;
        rst1<='1'; wait for 10 us;
        d1 <='0'; wait for 10 us;
        clk1<='1'; wait for 10 us;
        clk1<='0'; wait for 10 us;
        d1<='1'; wait for 10 us;
        clk1<='1'; wait for 10 us;
        clk1<='0'; wait for 10 us;
        end process;
        end testbench;