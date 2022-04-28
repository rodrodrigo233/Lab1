library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
------------------------------------------------------------------
 -- Enitiy --
------------------------------------------------------------------
entity LFSR is
 port(
 clk : in std_logic;
 rst : in std_logic;
 sel: in std_logic_vector(1 downto 0);
 q_lfsr_b: out std_logic_vector(31 downto 0)  -- como lo hago que se reajuste?
);
end LFSR;
-------------------------------------------------------------------
 -- Architecture --
-------------------------------------------------------------------
architecture beh of LFSR is
signal q_lfsr_b_i: std_logic_vector(31 downto 0);-- como hago reajustable? -- como llevo un generic a al entity

begin
-- Shifter Process
lfsr_cnt_proc: process(rst, clk,sel)
    variable lfsr_width : integer;
    variable initial_value_4b: std_logic_vector(3 downto 0) := "1000";
    variable initial_value_8b: std_logic_vector(7 downto 0) := "10000000";
    variable initial_value_16b: std_logic_vector(15 downto 0) := "1000000000000000";
    variable initial_value_32b: std_logic_vector(31 downto 0) := "10000000000000000000000000000000";
begin
if(rst= '1' ) then
    case sel is
    when "00"=> q_lfsr_b_i <= initial_value_4b;
                lfsr_width:=4;
    when "01"=>q_lfsr_b_i <= initial_value_8b;
                lfsr_width:=8;
    when "10"=> q_lfsr_b_i <= initial_value_16b;
                lfsr_width:=16;
    when "11"=>q_lfsr_b_i <= initial_value_32b;
                lfsr_width:=32;
    when others =>q_lfsr_b_i <= initial_value_32b;
                  lfsr_width:=32;
    end case;
elsif (rising_edge(clk)) then
 -- shift operation: b3->b2, b2->b1, b1->b0
shifter_loop: for i in (lfsr_width)-1 downto 1 loop
q_lfsr_b_i(i-1) <= q_lfsr_b_i(i);
end loop shifter_loop;
 -- Serial Input to the b3 of the LFSR
 case lfsr_width is
        when 4=>q_lfsr_b_i(3) <= q_lfsr_b_i(1) xor q_lfsr_b_i(0);
        when 8=>q_lfsr_b_i(7) <= (((q_lfsr_b_i(4) xor q_lfsr_b_i(3)) xor q_lfsr_b_i(2))xor q_lfsr_b_i(0));
        when 16=>q_lfsr_b_i(15)<=(((q_lfsr_b_i(4) xor q_lfsr_b_i(4)) xor q_lfsr_b_i(3))xor q_lfsr_b_i(0));
        when 32=>q_lfsr_b_i(31)<=(((q_lfsr_b_i(22) xor q_lfsr_b_i(2)) xor q_lfsr_b_i(1))xor q_lfsr_b_i(0));
        when others =>q_lfsr_b_i(31)<=(((q_lfsr_b_i(22) xor q_lfsr_b_i(2)) xor q_lfsr_b_i(1))xor q_lfsr_b_i(0));
 end case;
 
end if;
end process lfsr_cnt_proc;
q_lfsr_b <= q_lfsr_b_i;
end architecture beh;
