library ieee;
use ieee.std_logic_1164.all;


entity pwm_8 is
generic(
        DC1:std_logic_vector(7 downto 0):="00000001";
        DC2:std_logic_vector(7 downto 0):="00000010";
        DC3:std_logic_vector(7 downto 0):="00000100";
        DC4:std_logic_vector(7 downto 0):="00001000";
        DC5:std_logic_vector(7 downto 0):="00010000";
        DC6:std_logic_vector(7 downto 0):="00100000";
        DC7:std_logic_vector(7 downto 0):="01000000";
        DC8:std_logic_vector(7 downto 0):="10000000");       
port (
        rst,clk,load: in std_logic;
        output : out std_logic_vector(7 downto 0));  
end pwm_8;

architecture beh of pwm_8 is
type matrix is array (0 to 7) of std_logic_vector(7 downto 0);
signal DC8x8: matrix :=(DC1,DC2,DC3,DC4,DC5,DC6,DC7,DC8);
    begin
    instance:for i in 7 downto 0 generate
        u:entity work.pwm port map(DC=>DC8x8(i),load=>load,clk=>clk,rst=>rst,pwm_out=>output(i));
    end generate instance;    
end beh;