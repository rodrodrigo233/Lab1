library ieee;
use ieee.std_logic_1164.all;

entity tb_antirrebote is
end tb_antirrebote;

architecture test of tb_antirrebote is
    signal input1,output1 : std_logic;
    signal clk1: std_logic :='0';
    signal rst1: std_logic :='0';
    constant bounce_period : time := 5 ms;
    constant clk_time : time :=  15 ns; --30ns
    begin
    uut: entity work.Antirrebote port map(input=>input1,clk=>clk1,rst=>rst1,output=>output1);
    process
        begin 
        input1<='0';
        rst1<='0';
        wait for 10 ms;
        rst1<='1';
        wait for 10 ms;
        input1<='1';
        wait for 10 ms;
        for i in 5 downto 0 loop
        input1<= not(input1);    --simulo el rebote 
        wait for 5 ms;
        end loop;
        wait for 30 ms;
        assert output1='0'
            report "Funciona bien"
            severity note;
        assert output1='1'
            report "Funciona mal"
            severity note;
        assert false
            report "Simulacion terminada"
            severity failure;
            
    end process;
    process
        begin
            clk1<=not(clk1);
            wait for clk_time;
    end process;
end test;
        
        