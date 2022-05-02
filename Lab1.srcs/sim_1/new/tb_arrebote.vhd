library ieee;
use ieee.std_logic_1164.all;

entity tb_arrebote is
end entity;

architecture tb of tb_arrebote is
signal rst1,clk1 : std_logic :='0';
signal input1 :std_logic :='0';
signal output1 : std_logic;
constant clk_time : time :=30 ns;
    begin
    
uut: entity work.arrebote port map(clk=>clk1,rst=>rst1,input=>input1,output=>output1);
    clock:process           --Clock de T=60 ns
        begin
        clk1<=not clk1;
        wait for clk_time;
    end process clock;
    control: process
        begin
            wait for 10 ms;
            rst1<='1';
            wait for 10 ms;
            input1<='1';        -- primer cambio de entrada
            wait for 10 ms;
           for i in 7 downto 0 loop --Simulación de rebote
           input1<= not input1;         
           wait for 2 ms;
           end loop; 
           wait for 40 ms;
           for i in 6 downto 0 loop     --Simulación de cambio y rebote
           input1<= not input1;
           wait for 2 ms;
           end loop; 
           wait for 40 ms;
       
            assert false
                    report "Simulación Terminada"
                    severity failure;
    end process control;
end tb;
