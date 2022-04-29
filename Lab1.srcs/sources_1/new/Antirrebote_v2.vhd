library ieee;
use ieee.std_logic_1164.all;

entity Antirrebote_v2 is
port(
    input,rst,clk : in std_logic;
    output        : out std_logic);
end  Antirrebote_v2;

architecture behave of Antirrebote_v2 is 
signal copia_input : std_logic ;
    begin 
    copia_input<=input;
    process(clk,rst,copia_input)
    variable flag : boolean :=false;
    variable c : integer :=0;
        begin
            if(rst='0') then 
                output<='0';
                flag:=false;
                c:=0;
            
            elsif (rising_edge(clk) and (flag)) then
                    c:=c+1;
                    if(c>=1333333)then
                        c:=0;
                        output<=input;
                        flag:=false;
                    end if;
            else
                if (rising_edge(copia_input) or falling_edge(copia_input)) then 
                    if (flag=false)then
                        flag:=true;
                    end if;
                end if;
            end if;
     end process;
end behave;
                