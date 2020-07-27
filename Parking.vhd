LIBRARY ieee;
USE ieee.std_logic_1164.all ;
USE ieee.std_logic_ARITH.all;
USE ieee.std_logic_UNSIGNED.all;
use ieee.numeric_std.all;


ENTITY Parking IS 
port(A : in std_logic:='0'; --Input to the IR sensor at the Entry gate
     B : in std_logic:='0';--Input to the IR sensor at the Exit gate
	  T : in std_logic_vector(5 doWnto 0 ); --Input to touch sensors at each parking spot of the available 6 spots
clknew:IN std_logic;
rst:IN std_logic:='1';
buzz: out std_logic := '1';
out1:out std_logic_vector(6 downto 0)
);
end Parking;




ARCHITECTURE arch4 OF Parking IS

COMPONENT clk_generator IS 
port (clki : in std_logic;
       clko : out std_logic
     );
 END COMPONENT ;

component  seven_seg_dec IS
PORT(in1: IN   std_logic_vector(2 downto 0  ) ; 
Hout1  : OUT std_logic_vector(6 downto 0) );

 END component ;

signal cou : std_logic_vector(2 downto 0):="110";
signal clknew1 :std_logic ;

BEGIN
ck:clk_generator port map(clknew,clknew1);

process(clknew1)
begin
if(clknew1'event and clknew1='1') then

if(rst = '0') then
cou(0) <= '0';
cou(1) <= '1';
cou(2) <= '1';
end if;

if(A='0' and B='0')then 
cou<=cou;
end if;
	
if(A = '0' and B='1' and cou >"000" ) then
	cou <= cou-1;

end if;
if(B = '0' and A='1' and cou <"110" ) then
	cou <= cou+1;
end if;
if(T="011111" OR T="101111"OR T="110111" OR T="111011" OR T="111101" OR T="111110" ) then
buzz<='0';
end if ;

	end if;
	end process;
		x:seven_seg_dec port map(cou,out1);
	end arch4;


