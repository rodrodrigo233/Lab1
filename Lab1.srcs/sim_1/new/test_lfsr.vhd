library ieee;
use ieee.std_logic_1164.all;

entity test_lfsr is
end test_lfsr;

architecture tb of test_lfsr is
    constant clk_time : time :=500 ns;
    signal clk1 : std_logic:='1';
    signal rst1 : std_logic:='0';
    signal sel1:  std_logic_vector(2 downto 0):="010";
    signal q_lfsr_b1:  std_logic_vector(31 downto 0);
    signal c : integer :=0;
begin
    uut: entity work.lfsr port map(clk=>clk1,rst=>rst1,sel=>sel1,q_lfsr=>q_lfsr_b1);
process                             -- generador de clock
    begin
        clk1<= not clk1;
        wait for clk_time;
    end process;
    
process (rst1,clk1)                 --contador para comprobar cuantos ciclos tarda en repetirse la secuencia
begin
    if (rising_edge(clk1))then
        if(rst1='1')then
            c<=c+1;
        end if;
    end if;
end process;  
  
    process                         
        begin
            wait for 1 us;
            rst1<='1';                                              
            case sel1 is                 -- Se espera hasta que se tenga el valor inicial nuevamnete para comprobar cuantos ciclos tardó
               when "000"=>  wait until q_lfsr_b1(31 downto 28)="1000"; --4 bits
                             assert c/=15
                                  report "Funciona Bien"
                              severity note;
                              
                             assert c=15
                                  report "Funciona Mal"
                              severity note;
                              
               when "001"=> wait until  q_lfsr_b1(31 downto 24)="10000000"; --8 bits
                             assert c/=255
                                  report "Funciona Bien"
                              severity note;
                             
                             assert c=255
                                  report "Funciona Mal"
                              severity note;
                              
               when "010"=> wait until  q_lfsr_b1(31 downto 20)="100000000000"; --12 bits
                            assert c/=4095
                                  report "Funciona Bien"
                              severity note;
                              
                              assert c=4095
                                  report "Funciona Mal"
                              severity note;
                              
               when "011"=> wait until  q_lfsr_b1(31 downto 16)="1000000000000000"; --16 bits
                            assert c/=65535
                                  report "Funciona Bien"
                              severity note;
                              
                            assert c=65535
                                  report "Funciona Mal"
                              severity note;
                              
                when others=> wait until  q_lfsr_b1(31 downto 0)="10000000000000000000000000000000"; --32 bits
             end case;  
              wait for 1 us;    -- por motivos de vista en la simulación
            assert false
                    report "Simulación Terminada"
                    severity failure;
          end process; 
           
end tb;

