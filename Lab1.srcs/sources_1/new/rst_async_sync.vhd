library ieee;
use ieee.std_logic_1164.all;

entity rst_async_sync is
    generic(rst_width:integer:=2;
     rst_active_value: std_logic:='0');
    port(
     clk : in std_logic;
     rst : in std_logic;
     out_rst: out std_logic);
end entity rst_async_sync;

architecture behave of rst_async_sync is
    signal sys_rst_i: std_logic_vector(rst_width downto 0);
    begin
    asyn_ass: process(rst, clk)
        begin
         if (rst= rst_active_value) then
             sys_rst_i <= (others => rst_active_value);     --(0,0,0);
             out_rst <= '0';
         elsif (rising_edge(clk)) then
             sys_rst_i(0) <= not rst_active_value;          --(0,0,1)
            for i in 0 to rst_width-1 loop 
             sys_rst_i(i+1) <= sys_rst_i(i);                --(0,1,1), (1,1,1);
             end loop; 
         end if;
         out_rst <= sys_rst_i(rst_width-1);               
    end process asyn_ass;
end behave;
