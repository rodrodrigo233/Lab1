library ieee;
use ieee.std_logic_1164.all;

entity Antirrebote_v2 is
port(
    input,rst,clk : in std_logic;
    output        : out std_logic);
end  Antirrebote_v2;

architecture behave of Antirrebote_v2 is
    signal valor_inicial : std_logic;
    begin 
    process(clk,rst,input,valor_inicial)
    variable flag : boolean :=false;
    variable c : integer :=0;
        begin
            if(rst='0') then
                output<='0';
                flag:=false;
                c:=0;
            elsif (rising_edge(input) or falling_edge(input)) then
                if (flag=false)then
                    valor_inicial<=input;
                    flag:=true;
                end if;
            elsif (rising_edge(clk)) then
                if (flag=true) then
                    c:=c+1;
                    if(c>=1333200)then
                        c:=0;
                        if(valor_inicial = input)then
                            output<=valor_inicial;
                            flag:=false;
                        end if;
                    end if;
                end if;
            end if;
     end process;
end behave;
                