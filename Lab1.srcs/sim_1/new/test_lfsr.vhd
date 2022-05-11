library ieee;
use ieee.std_logic_1164.all;

entity test_lfsr is
end test_lfsr;

architecture tb of test_lfsr is
    constant clk_time : time :=500 ns;
    signal clk1 : std_logic:='1';
    signal rst1 : std_logic:='0';
    signal sel1:  std_logic_vector(1 downto 0):="11";
    signal q_lfsr_b1:  std_logic_vector(31 downto 0);
begin
    uut: entity work.lfsr port map(clk=>clk1,rst=>rst1,sel=>sel1,q_lfsr=>q_lfsr_b1);
process
    begin
        clk1<= not clk1;
        wait for clk_time;
    end process;
    
    process
        begin
            wait for 1 us;
            rst1<='1';
            --sel1<="01";
            wait until q_lfsr_b1="10000000000000000000000000000000";
            --wait for  5000000 ms;
            assert false
                    report "Simulación Terminada"
                    severity failure;
          end process;  
end tb;