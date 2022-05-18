library ieee;
use ieee.std_logic_1164.all;

entity tb_pwm is
end tb_pwm;

architecture tb of tb_pwm is
signal DC1: std_logic_vector(7 downto 0) ;
signal load1,clk1,rst1: std_logic:='0';
signal pwm_out1 :  std_logic;
    begin
    uut: entity work.pwm port map (DC=>DC1,load=>load1,clk=>clk1,rst=>rst1,pwm_out=>pwm_out1);
    clock:process
        begin                   --clock de 1 us de periodo
        clk1<= not clk1;
        wait for 500 ns;
    end process;
    
    control: process
        begin
        wait for 1 us;              -- se prueban 3 cambios de ancgo de pulso
        rst1<='1';
        wait for 1 us;
        rst1<='0';
        DC1<="00000110";
        load1<='1';
        wait for 1 us;
        load1<='0';
        wait for 245 us;
        load1<='1';
        DC1<="00010000";
        wait for 20 us;
        load1<='0';
        wait for 245 us;
        load1<='1';
        DC1<="10010000";
        wait for 300 us;
        assert false
            report "Simulacion terminada"
            severity failure;
     end process;
        
    
    
end tb;