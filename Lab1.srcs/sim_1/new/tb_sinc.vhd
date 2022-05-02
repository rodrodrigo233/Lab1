library ieee;
use ieee.std_logic_1164.all;

entity tb_sinc is
end tb_sinc;

architecture test_bench of tb_sinc is
signal input1,rst1,output1 : std_logic;
signal clk1 : std_logic :='0';

begin                                           
uut: entity work.sincronizador port map (clk=>clk1,input=>input1,rst=>rst1,output=>output1);    

control:process 
begin
    rst1<='0'; wait for 7 us;  --Inicio con un reset
    input1<='0';
    rst1<='1'; wait for 10 us;
    input1<='1'; wait for 10 us;    --Ingreso un valor a la entrada
    wait for 30 us;
    input1<='0';                    --Ingreso otro valor a la entrada
    wait for 30 us;
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
     
end process control;

clock:process
    begin
    clk1<= not clk1;
    wait for 10us;
end process clock;

end test_bench;
