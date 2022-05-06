library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;  

entity LFSR is
generic (width: integer:=32);
 port(
 clk : in std_logic;
 rst : in std_logic;
 sel: in std_logic_vector(1 downto 0);
 q_lfsr_b: out std_logic_vector(31 downto 0));
end LFSR;

architecture beh of LFSR is
signal s : std_logic_vector (31 downto 0);
signal out_xor : std_logic; 

       component ffd is
           port(
                clk,rst,d: in std_logic;
                q : out std_logic);
       end component;
  begin     
       sr: for i in (width-1) downto 0 generate
            primero:if(i=31) generate
                u: ffd port map(rst=>rst,clk=>clk,d=>out_xor,q=>s(i));
            end generate primero;
            otros:if(i/=31) generate
            u: ffd port map(rst=>rst,clk=>clk,d=>s(i+1),q=>s(i));
            end generate otros;
            end generate sr;
        process(rst,sel)
        variable initial_value : std_logic_vector(31 downto 0):="10000000000000001000000010001000";
            begin
                case sel is
                when "00" => 
                             out_xor <= s(29) xor s(28);
                when "01"=> 
                            out_xor <= (((s(28) xor s(27)) xor s(26))xor s(24));
                when "10" => 
                            out_xor<=(((s(21) xor s(20)) xor s(19))xor s(16));
                when "11" => 
                            out_xor<=(((s(22) xor s(2)) xor s(1))xor s(0));
                when others => 
                             out_xor<=(((s(22) xor s(2)) xor s(1))xor s(0));
            end case;
         
         
         if(rst='0') then
            --q_lfsr_b<=initial_value;
            s<=initial_value;
         elsif(rising_edge(clk)) then
            for i in 31 downto 1 loop
            s(i-1) <= s(i);
            end loop;
         end if;
         q_lfsr_b<=s; 
        end process;
         
end beh;