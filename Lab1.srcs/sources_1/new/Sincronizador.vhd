library ieee;
use ieee.std_logic_1164.all;

entity sincronizador is
generic( q_ff: integer:=2); --Cantidad de FF
port(
    clk,rst,input: in std_logic;
    output         : out std_logic);
end sincronizador;

architecture estructura of sincronizador is
    signal s: std_logic_vector(q_ff-1 downto 0);
   component ffd is
   port(
        clk,rst,d: in std_logic;
        q : out std_logic);
   end component;
   begin
   sinc:for i in (q_ff-1) downto 0 generate
        if1:if (i=(q_ff-1)) generate
            u:ffd port map(clk => clk, rst=>rst, d=>input,q=>s(i));
        end generate if1;
        if2:if(i=0)generate
            u:ffd port map(clk => clk, rst=>rst, d=>s(i+1),q=>output);
        end generate if2;
        ifn:if (((q_ff-1)>i) and (i>0))generate 
         u:ffd port map(clk => clk, rst=>rst, d=>s(i+1),q=>s(i));
         end generate ifn;
   end generate sinc;
 end estructura;
   