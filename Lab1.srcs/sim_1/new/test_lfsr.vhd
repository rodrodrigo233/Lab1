library ieee;
use ieee.std_logic_1164.all;

entity test_lfsr is
end test_lfsr;

architecture tb of test_lfsr is
    constant clk_time : time :=10 us;
    signal clk1 : std_logic:='1';
    signal rst1 : std_logic:='1';
    signal sel1:  std_logic_vector(1 downto 0);
    signal q_lfsr_b1:  std_logic_vector(31 downto 0);
begin
    uut: entity work.LFSR port map(clk=>clk1,rst=>rst1,sel=>sel1,q_lfsr_b=>q_lfsr_b1);
process
    begin
        clk1<= not clk1;
        wait for clk_time;
    end process;
    
    process
        begin
            wait for 5 us;
            rst1<='0';
            sel1<="00";
            wait until q_lfsr_b1="10100010101011001010010001010110";
            assert false
                    report "Simulación Terminada"
                    severity failure;
          end process;  
end tb;