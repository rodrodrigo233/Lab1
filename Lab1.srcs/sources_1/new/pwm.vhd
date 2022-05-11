library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 
entity pwm is
port(
    DC: in std_logic_vector(7 downto 0);
    load,clk,rst: in std_logic;
    pwm_out : out std_logic);
end pwm;

architecture behave of pwm is
begin 

process(rst,load,clk,DC)
variable ton,aux_on,toff,aux_off: integer :=0;
variable flag : boolean :=true;
    begin
        if(rst='1') then
            pwm_out<='0';   
            ton:=0;
            toff:=0;
            aux_on:=0;
            aux_off:=0;
            flag:=true;         
        elsif(load='1' and flag=true)then
                ton:=to_integer(unsigned(DC));
                toff:=255-ton;
                aux_on:=ton;
                aux_off:=toff;
                flag:=false;
        elsif(rising_edge(clk))then  
            if(aux_on>0)then
                flag:=false;                -- pongo false ya que solo puede cambiar el pwm luego de que termine un periodo
                aux_on:=aux_on-1;
                pwm_out<='1';
            elsif(aux_off>0)then
                flag:=false;
                aux_off:=aux_off -1;
                pwm_out<='0';
            else                    -- pongo en true cuando termina para ver si hubo cambios en duty
                flag:=true;
                aux_on:=ton;
                aux_off:=toff;
            end if;
        end if;
  end process;              
end behave;