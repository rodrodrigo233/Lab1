library ieee;
use ieee.std_logic_1164.all;

entity tb_rst_async_sync is
end entity;

architecture behave of tb_rst_async_sync is
signal rst1,out_rst1 : std_logic;
signal clk1 :std_logic := '0';
constant clk_time : time :=  7 us;
    begin
    uut: entity work.rst_async_sync port map(clk=>clk1,rst=>rst1,out_rst=>out_rst1);
    clock: process
        begin
            clk1<=not (clk1);
            wait for clk_time;
        end process clock;
    
    control: process
        begin
         wait for 5us;
         rst1<='1'; 
         wait for 5 us;
         rst1<='0';
         wait for 5 us;
         rst1<='1';
         wait for 50 us;
         assert out_rst1='1'
            report "Funciona Mal"
            severity note;
         assert out_rst1='0'
            report "Funciona Bien"
            severity note;
         assert false
            report "Simulacion terminada"
            severity failure;
     end process control;
end behave;  