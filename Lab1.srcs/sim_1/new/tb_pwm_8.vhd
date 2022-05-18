library ieee;
use ieee.std_logic_1164.all;

entity tb_pwm_8 is
end tb_pwm_8;

architecture tb of tb_pwm_8 is
    signal rst1,clk1,load1:  std_logic:='0';
    signal  output1 : std_logic_vector(7 downto 0); 
begin
uut: entity work.pwm_8 port map(rst=>rst1,clk=>clk1,load=> load1,output=>output1);
    clock:process
        begin
            clk1<=not clk1;
            wait for 1 us;
    end process clock;
    
    control: process
    begin
        wait for 2 us;
        rst1<='1';
        wait for 2 us;
        rst1<='0';
        load1<='1';         -- se cargan todos los Duty Cicle
        wait for 2 us;
        load1<='0';
        wait for 1 ms;  -- se simula 1 ms para ver varios ciclos
        assert false
            report "Simulación terminada"
            severity failure;
    end process control;

end tb;


