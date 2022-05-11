library ieee;
use ieee.std_logic_1164.all;

entity PARTE_F is
port(
    clk,rst: in std_logic;
    llave : in std_logic_vector(4 downto 0);
    led: out std_logic_vector(3 downto 0));
end PARTE_F;

architecture beh of PARTE_F is
    signal rst_i,clk_i : std_logic ;
    signal llave_i : std_logic_vector(4 downto 0);
begin    
     --instancio 5 sincronizadores
    s: for i in llave'range generate
        sinc: entity work.sincronizador port map(clk=>clk,rst=>rst_i,input=>llave(i),output=>llave_i(i));
       end generate s;
       --instancio divisor de frecuencia
       freq: entity work.freq_divider port map (clk=>clk,rst=>rst_i,sel(2)=>llave_i(4),sel(1)=>llave_i(3),sel(0)=>llave_i(2),output=>clk_i); 
       -- instancio modulo reset
       reset: entity work.rst_async_sync port map(clk=>clk,rst=>rst,out_rst=>rst_i);
       -- instancio modulo de ocntador binario up down bcd y lfsr de 4 bits
       counter: entity work.bin_counter port map(clk=>clk_i,rst=>rst_i,en(1)=>llave_i(1),en(0)=>llave_i(0),output=>led);
       
       
   
    
end beh;