library ieee;
use ieee.std_logic_1164.all;

entity tb_sinc is
end tb_sinc;

architecture test_bench of tb_sinc is
signal clk1,input1,rst1,output1 : std_logic;

begin
uut: entity work.sincronizador port map (clk=>clk1,input=>input1,rst=>rst1,output=>output1);

process 
begin
    rst1<='0'; wait for 10 us;
    rst1<='1'; wait for 10 us;
    input1<='1'; wait for 10 us;
    clk1<='0';wait for 10 us;
    clk1<='1';wait for 10 us;
    clk1<='0';wait for 10 us;
    clk1<='1';wait for 10 us;
    clk1<='0';wait for 10 us;
    clk1<='1';wait for 10 us;
    clk1<='0';wait for 10 us;
    assert output1='0'
        report "All OK"
        severity note;
    assert output1='1'
        report "Wrong Result"
        severity note;
   wait for 10 us;
    assert false
        report "Simulacion terminada"
        severity failure;
     
end process;
end test_bench;