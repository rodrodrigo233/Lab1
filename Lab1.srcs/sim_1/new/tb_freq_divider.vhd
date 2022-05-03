library ieee;
use ieee.std_logic_1164.all;

entity tb_freq_divider is
end tb_freq_divider;

architecture tb of tb_freq_divider is
signal rst1,clk1: std_logic :='0';
signal sel1 : std_logic_vector (2 downto 0):="101";
signal output1 : std_logic;
constant clk_time : time:= 30 ns;
    begin
    uut: entity work.freq_divider port map(rst=>rst1,clk=>clk1,sel=>sel1,output=>output1);
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
    
    
    