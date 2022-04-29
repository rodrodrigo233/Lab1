library ieee;
use ieee.std_logic_1164.all;

entity Arrebote is
    port(
        input,clk,rst : in std_logic;
        output         : out std_logic);
end Arrebote;

architecture behave of Arrebote is
signal flag,clr:std_logic;
begin
    process(clk,input,clr,rst)
variable c: integer :=0;
        begin
            if (flag='1') then
                if(rising_edge(clk))then
                    c:=c+1;
                    if(c>=1333333) then
                       output<=input;
                       clr<='0';
                       c:=0;
                    end if;
                end if;
             elsif(rst='0')then
                output<='0';
            end if;
        end process;
        
        process(input,rst,clr)
        begin
                if(flag='0')then
                    flag<='1';
                elsif(rst='0')then
                    flag<='0';
                elsif(clr='0')then
                     flag<='0';
                    clr<='1';
                end if;
        end process;
        
end behave;