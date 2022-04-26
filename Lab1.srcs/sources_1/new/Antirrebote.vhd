library ieee;
use ieee.std_logic_1164.all;

entity antirrebote is
port(
    input,clk,rst: in std_logic;
    output : out std_logic);
end antirrebote;

architecture behave of antirrebote is               
signal valor_inicial : std_logic;
signal flag : std_logic;
begin
   p1:process(rst,clk,flag,input,valor_inicial)
   variable c: integer :=0;
   begin
    if(rst='0') then
        c:=0;
        flag<='0';
        output<='0';
    elsif (rising_edge(clk) )  then
                    if (flag='1') then
                        c:=c+1;
                        if(c>= 5)then             --Delay de 40 ms (para reloj de 33.33MHz ) 1333200
                            c:=0;
                            if(input= valor_inicial)then
                                output<=input;
                                flag<='0';
                            end if;
                        end if;
                    end if;
        
     end if;
     end process p1;
     
     p2: process(input,flag)
     begin
        if(flag='0' ) then
            flag<='1';
            valor_inicial<=input;
        end if;
     end process p2;
 end behave;     