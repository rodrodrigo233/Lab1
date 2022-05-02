library ieee;
use ieee.std_logic_1164.all;

entity Arrebote is
    port(
        input,clk,rst : in std_logic;
        output         : out std_logic);
end Arrebote;

architecture behave of Arrebote is
signal flag,clr:std_logic;          --Flag es el indicador de que hubo un cambio en la entrada
constant tiempo_rebote : integer :=666666;
begin                               -- clr es el encargado de limpiar el flag cuando cambia la salida
    process(clk,input,clr,rst)
variable c: integer :=0;            -- variable de conteo para la espera 
        begin
            if (flag='1') then
                if(rising_edge(clk))then
                    c:=c+1;
                    if(c>= tiempo_rebote) then  -- cuenta 40ms y luego refleja la entrada en la salida
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
                    flag<='1';          --Entra en el cambio de entrada
                elsif(rst='0')then
                    flag<='0';
                elsif(clr='0')then
                     flag<='0';
                    clr<='1';
                end if;
        end process;
end behave;

