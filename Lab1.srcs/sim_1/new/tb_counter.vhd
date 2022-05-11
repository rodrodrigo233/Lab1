library ieee;
use ieee.std_logic_1164.all;

use ieee.numeric_std.all;
entity tb_counter is
end tb_counter;

architecture tb of tb_counter is
signal clk1,rst1 : std_logic:='0';
signal en1 : std_logic_vector(1 downto 0):="11";
signal output1 : std_logic_vector(3 downto 0);
begin
uut: entity work.bin_counter port map (clk=>clk1,rst=>rst1,en=>en1,output=>output1);

process
    begin
    clk1<=not clk1;
    wait for 500 ns;
    end process;
    
    process
    begin
        wait for 100 ns;
        rst1<='1';
        wait for 30 us;
    end process;
end tb;