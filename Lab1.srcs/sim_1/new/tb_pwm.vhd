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
        begin
        clk1<= not clk1;
        wait for 1 us;
    end process;
    
    control: process
        begin
        wait for 2 us;
        DC1<="10001001";
        rst1<='1';
        load1<='0';
        wait for 2 us;
        rst1<='0';
        wait for 2 us;
        load1<='1';
--        wait for 255 us;
--        assert pwm_out1='0'
--            report "Va bien"
--            severity Note;
--        assert pwm_out1='1'
--            report "Va mal"
--            severity Note;
--        wait for 10 us;
--        assert pwm_out1='1'
--            report "Va bien"
--            severity Note;
--        assert pwm_out1='0'
--            report "Va mal"
--            severity Note;
--         wait for 254 us;
--        assert pwm_out1='0'
--            report "Va bien"
--            severity Note;  
        wait for 1000 us;
        assert false
            report "Simulacion terminada"
            severity failure;
     end process;
        
    
    
end tb;