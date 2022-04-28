library ieee;
use ieee.std_logic_1164.all;

entity freq_divider is
port(
    clk,rst : in std_logic;     --33.3333MHZ   T=30ns
    clk01,clk05,clk1,clk2,clk5 : out std_logic);
end freq_divider;

architecture behave of freq_divider is
    signal clk_01,clk_05,clk_1,clk_2,clk_5 : std_logic;
    constant time01 :integer :=83333333; 
    constant time05 :integer :=16666666;
    constant time1 : integer :=8333333;
    constant time2 : integer :=4166666;
    constant time5 : integer :=1666666; 
    begin
        process(clk,rst)
            variable c01,c05,c1,c2,c5: integer;
            begin
                if(rst='0')then
                    clk_01<='0';
                    clk_05<='0';
                    clk_1<='0';
                    clk_2<='0';
                    clk_5<='0';
                    c01:=0;
                    c05:=0;
                    c1:=0;
                    c2:=0;
                    c5:=0;
                elsif (rising_edge(clk))then
                    c01:=c01 + 1;
                    c05:= c05 + 1;
                    c1:= c1 + 1;
                    c2:= c2 + 1;
                    c5:= c5 + 1;
                        if(c01>=time01)then
                            c01:=0;
                            clk_01<= not clk_01;
                        end if;
                        if(c05>=time05) then
                            c05:=0;
                            clk_05<= not clk_05;
                        end if;
                        if(c1>=time1)then
                            c1:=0;
                            clk_1<=not clk_1;
                        end if;
                        if(c2>=time2)then
                            c2:=0;
                            clk_2<= not clk_2;
                        end if;
                        if(c5>=time5)then
                            c5:=0;
                            clk_5<= not clk_5;
                        end if;
                end if;
        end process;
        clk01<=clk_01;
        clk05<=clk_05;
        clk1<=clk_1;
        clk2<=clk_2;
        clk5<=clk_5;
end behave;        
                
                    
                