library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity bin_counter is
port(
    clk,rst:in std_logic;
    en: in std_logic_vector(1 downto 0);        --con 2 switches se elige el tipo de contador
    output: out std_logic_vector(3 downto 0));  --salida que excita los led
end bin_counter;

architecture beh of bin_counter is
signal s : std_logic_vector (3 downto 0);       --señal interna para la salida
begin
    process(rst,clk,en)
    variable c_up : integer:=0;                 --variables de conteo para cada tipo de contador
    variable c_down: integer:=16;
    variable c_bcd: integer:=0;
        begin
            if(rst='0') then
                s<="0001";  -- empiezo en 1 para que no haya drama con el bcd y no haya problema con el lfsr
            elsif(rising_edge(clk))then
                case en is                      --dependiendo de la posición de los switches el contador
                when "00" => c_up:=c_up+1;      --contador binario ascendente
                            if(c_up=16) then
                                 c_up:=0;
                            end if;
                            s<=std_logic_vector(to_unsigned(c_up,4));
                when "01" => c_down:= c_down-1;     --contador binario descendente
                            if(c_down=0)then
                                c_down:=16;
                            end if;
                            s<=std_logic_vector(to_unsigned(c_down,4));
                when "10"=>c_bcd:=c_bcd+1;          --contador bcd
                            if(c_bcd=10) then
                                 c_bcd:=0;
                            end if;
                            s<=std_logic_vector(to_unsigned(c_bcd,4));
                when others=>                       --lfsr  de 4 bits          
                            for i in 3 downto 1 loop
                                s(i-1) <= s(i);
                            end loop shifter_loop;
                            s(3) <= s(1) xor s(0);

                end case;
            end if;
        end process;
        output<=s;                      --asignacion de señal interna a salida
end beh;

