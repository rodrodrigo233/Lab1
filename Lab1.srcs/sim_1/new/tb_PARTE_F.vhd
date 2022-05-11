library ieee;
use ieee.std_logic_1164.all;

entity tb_PARTE_F is
end tb_PARTE_F;

architecture tb of tb_PARTE_F is
signal llaves : std_logic_vector(4 downto 0);
signal clk1,rst1 : std_logic:='0';
signal leds_1 : std_logic_vector(3 downto 0);
begin
uut: entity work.PARTE_F port map(clk=>clk1,rst=>rst1,llave=>llaves,led=>leds_1);
clock: process
        begin
        clk1<= not clk1;
        wait for 15 ns;
        end process clock;
 
 control:process
 begin
        wait for 20 ns;
        rst1<='1';
        --configuro clock de freq_divider en 1Hz
        llaves(4)<='1';
        llaves(3)<='0';
        llaves(2)<='0';
        --configuro en binario up
        llaves(1)<='1';
        llaves(0)<='1';
        wait for 16000 ms;
        end process control;
end tb;