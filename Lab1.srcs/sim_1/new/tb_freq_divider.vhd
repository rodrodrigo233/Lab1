library ieee;
use ieee.std_logic_1164.all;

entity tb_freq_divider is
end tb_freq_divider;

architecture tb of tb_freq_divider is
signal rst1,clk1,clk_01,clk_05,clk_1,clk_2,clk_5 : std_logic :='0';
constant clk_time : time:= 30 ns;
    begin
    uut: entity work.freq_divider port map(rst=>rst1,clk=>clk1,clk01=>clk_01,clk05=>clk_05,clk1=>clk_1,clk2=>clk_2,clk5=>clk_5);
    process
    begin
        rst1<='1';
        clk1<= not clk1;
        wait for clk_time;
    end process;
    process 
        begin
            wait for 12000 ms;
            assert false
                    report "Simulación Terminada"
                    severity failure;
    end process;
end tb;
    
    
    