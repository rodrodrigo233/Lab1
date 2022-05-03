library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity LFSR is
 port(
 clk : in std_logic;
 rst : in std_logic;
 sel: in std_logic_vector(1 downto 0);
 q_lfsr_b: out std_logic_vector(31 downto 0));
end LFSR;

architecture beh of LFSR is
signal q_lfsr_b_i : std_logic_vector (31 downto 0);
signal initial_value : std_logic_vector(31 downto 0):="10100010101011001010010001010110";
begin
    process(rst,clk,sel)
variable width : integer:=32; --valor por defecto
        begin
            
            case sel is
                when "00" => width:=4;     
                when "01"=> width:=8;
                when "10" => width:=16;
                when "11" => width:=32;
                when others => width :=32;
            end case;
            
            if(rst='1') then
                q_lfsr_b_i<= initial_value;
            elsif(rising_edge(clk))then
                for i in 31 downto 1 loop
                    q_lfsr_b_i(i-1) <= q_lfsr_b_i(i);
                end loop; 
            end if;
            
            case sel is
                when "00" =>q_lfsr_b_i(31) <= q_lfsr_b_i(29) xor q_lfsr_b_i(28);      
                when "01"=> q_lfsr_b_i(31) <= (((q_lfsr_b_i(28) xor q_lfsr_b_i(27)) xor q_lfsr_b_i(26))xor q_lfsr_b_i(24));
                when "10" => q_lfsr_b_i(31)<=(((q_lfsr_b_i(21) xor q_lfsr_b_i(20)) xor q_lfsr_b_i(19))xor q_lfsr_b_i(16));
                when "11" =>q_lfsr_b_i(31)<=(((q_lfsr_b_i(22) xor q_lfsr_b_i(2)) xor q_lfsr_b_i(1))xor q_lfsr_b_i(0));
                when others => q_lfsr_b_i(31)<=(((q_lfsr_b_i(22) xor q_lfsr_b_i(2)) xor q_lfsr_b_i(1))xor q_lfsr_b_i(0));
            end case;
      end process;
      q_lfsr_b <= q_lfsr_b_i;
         
end beh;