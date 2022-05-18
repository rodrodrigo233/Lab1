library ieee;
use ieee.std_logic_1164.all;

entity rst_async_sync is
    generic(rst_width:integer:=2;
     rst_active_value: std_logic:='0');
    port(
     clk : in std_logic;
     rst : in std_logic;
     out_rst: out std_logic);       -- Señal que será usada como reset de otros componentes 
end entity rst_async_sync;          -- pero que es asincronica su activación y sincronica su desactivación

architecture behave of rst_async_sync is
    signal sys_rst_i: std_logic_vector(rst_width downto 0);-- Vector encargado de desplazar el valor de reset 
    begin                                                  -- para desactivar de forma sicnronica 3 
    asyn_ass: process(rst, clk)                            -- ciclos de clk despues de que rst != 0
        begin
         if (rst= rst_active_value) then
             sys_rst_i <= (others => rst_active_value);     --(0,0,0);
             out_rst <= '0';
         elsif (rising_edge(clk)) then
             sys_rst_i(0) <= not rst_active_value;          --(0,0,1)
            for i in 0 to rst_width-1 loop 
             sys_rst_i(i+1) <= sys_rst_i(i);                --(0,1,1), (1,1,1); se dezplaza el valor de desactivación
             out_rst <= sys_rst_i(rst_width-1);  
             end loop; 
         end if;             
    end process asyn_ass;
end behave;

