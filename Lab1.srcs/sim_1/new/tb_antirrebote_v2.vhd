library ieee;
use ieee.std_logic_1164.all;

entity tb_antirrebote_v2 is
end tb_antirrebote_v2;

architecture behave of tb_antirrebote_v2 is
signal input1,output1 : std_logic;
signal clk1,rst1 : std_logic :='0';
constant clk_time : time := 5 ns;
    begin
    uut: entity work.Antirrebote_v2 port map(clk=>clk1,rst=>rst1,input=>input1,output=>output1);
    
       clock: process
            begin
                clk1<=not clk1;
                wait for clk_time;
            end process clock;
          
       control: process
            begin
                wait for 10 us;
                rst1<='0';
                input1<='1';
                wait for 10 us;
                rst1<='1';
                input1<='0';
                wait for 5 us;
                for i in 5 downto 0 loop
                    input1<= not input1;
                    wait for 5 us;
                end loop;
                wait for 30 us;
                assert output1='1'
                    report "Funciona Bien"
                    severity note;
                assert output1='0'
                    report "Funciona mal"
                    severity note;
                assert false
                    report "Simulación Terminada"
                    severity failure;
              end process;
end behave;
         