
library ieee;
use ieee.std_logic_1164.all;

entity lfsr is
 generic(initial_value: std_logic_vector(31 downto 0):= "10000000000000000000000000000000";
         width : integer := 32);
 
 port(
     clk : in std_logic;
     rst : in std_logic;
     sel: in std_logic_vector(2 downto 0);              -- seleción con 3 llaves ya que hay 5 lfsr distintos (4,8,12,16,32) bits
     q_lfsr: out std_logic_vector(width-1 downto 0)     -- vector de salida fijo de 32 bits
);
end lfsr;

architecture beh of lfsr is
signal s: std_logic_vector(width-1 downto 0);       --será utilizado como copia interna de la salida q_lfsr
begin       
                                     -- se trabaja con los bits mas significativos, desde el 31 hasta 31-cantidad de bits del lfsr
lfsr_cnt_proc: process(rst, clk,sel)
begin
if(rst= '0' ) then
    s <= initial_value;
elsif (rising_edge(clk)) then
    shifter_loop: for i in 31 downto 1 loop     --operación de registro de desplazamiento
                         s(i-1) <= s(i);
                    end loop shifter_loop;
    case sel is                                 -- selección de cantidad de bits del lfsr con 3 switches
                when "000" => 
                             s(31) <= s(29) xor s(28);                          -- lfsr de 4 bits
                when "001"=> 
                            s(31) <= (((s(28) xor s(27)) xor s(26))xor s(24));  -- lfsr de 8 bits
                when "010"=> 
                            s(31) <= (((s(26) xor s(24)) xor s(21))xor s(20));  -- lfsr de 12 bits
                when "011" => 
                            s(31)<=(((s(21) xor s(20)) xor s(19))xor s(16));    -- lfsr de 16 bits
                when "100" => 
                            s(31)<=(((s(22) xor s(2)) xor s(1))xor s(0));       -- lfsr de 32 bits
                when others => 
                             s(31)<=(((s(22) xor s(2)) xor s(1))xor s(0));      -- lfsr de 32 bits por default
            end case;
end if;
end process lfsr_cnt_proc;
q_lfsr <= s;            -- asignación concurrente a la salida
end architecture beh;

