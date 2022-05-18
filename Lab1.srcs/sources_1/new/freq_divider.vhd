library ieee;
use ieee.std_logic_1164.all;

entity freq_divider is
                                                     --el valor de la cuenta es la cantidad de flancos positivos del reloj 
generic ( time01 :integer :=166666666;    --0.1Hz      para medio ciclo de la frecuencia buscada.
          time05 :integer :=33333333;    --0.5Hz
          time1 : integer :=16666666;     --1Hz
          time2 : integer :=8333333;     --2Hz
          time5 : integer :=3333333);     --5Hz

port(
    clk,rst : in std_logic;     --33.3333MHZ   T=30ns
    sel : in std_logic_vector(2 downto 0);
    output : out std_logic);    --salida a cierta frecuencia
end freq_divider;

architecture behave of freq_divider is
    signal new_clk : std_logic;             --señal interna de frecuencia variable
    signal sel_i : std_logic_vector(2 downto 0);
    begin
    sinc0: entity work.sincronizador port map(clk=>clk,rst=>rst,input=>sel(0),output=>sel_i(0));    --Instaniación de los sincronizadores
    sinc1: entity work.sincronizador port map(clk=>clk,rst=>rst,input=>sel(1),output=>sel_i(1));
    sinc2: entity work.sincronizador port map(clk=>clk,rst=>rst,input=>sel(2),output=>sel_i(2));
           
        process(clk,rst,sel_i)
            variable c,clk_time: integer;
            
            begin
                case sel_i is                       --dependiendo la posición de las llaves la frecuencia de salida
                    when "000"=> clk_time:= time01;
                    when "001"=> clk_time:=time05;
                    when "010"=> clk_time:=time1;
                    when "011"=> clk_time:=time2;
                    when "100"=> clk_time:=time5;
                    when others =>clk_time:=time5;       
                end case;
                
                if(rst='0')then
                    new_clk<='0';
                    c:=0;
                elsif (rising_edge(clk))then
                    c:=c + 1;
                        if(c>=clk_time)then
                            c:=0;
                            new_clk<= not new_clk;      -- cada vez que se cumple la cuenta(medio ciclo) se cambia el estado
                        end if;
                end if;
        end process;
        output<=new_clk;        --asignación a la salida real
end behave;        
                
                    
                