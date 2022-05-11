
library ieee;
use ieee.std_logic_1164.all;

entity lfsr is
 generic(initial_value: std_logic_vector(31 downto 0):= "10000000000000000000000000000000";
         width : integer := 32);
 
 port(
     clk : in std_logic;
     rst : in std_logic;
     sel: in std_logic_vector(1 downto 0);
     q_lfsr: out std_logic_vector(width-1 downto 0)
);
end lfsr;

architecture beh of lfsr is
signal s: std_logic_vector(width-1 downto 0);
begin

lfsr_cnt_proc: process(rst, clk,sel)
begin
if(rst= '0' ) then
    s <= initial_value;
elsif (rising_edge(clk)) then
     -- shift operation: b3->b2, b2->b1, b1->b0
    shifter_loop: for i in 31 downto 1 loop
                         s(i-1) <= s(i);
                    end loop shifter_loop;
     -- Serial Input to the b3 of the LFSR
    case sel is
                when "00" => 
                             s(31) <= s(29) xor s(28);
                when "01"=> 
                            s(31) <= (((s(28) xor s(27)) xor s(26))xor s(24));
                when "10" => 
                            s(31)<=(((s(21) xor s(20)) xor s(19))xor s(16));
                when "11" => 
                            s(31)<=(((s(22) xor s(2)) xor s(1))xor s(0));
                when others => 
                             s(31)<=(((s(22) xor s(2)) xor s(1))xor s(0));
            end case;
end if;
end process lfsr_cnt_proc;
q_lfsr <= s;
end architecture beh;
-------------------------------------------------------------------
 -- EoF --
------------------------------------------------------------------