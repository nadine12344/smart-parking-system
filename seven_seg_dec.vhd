LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_ARITH.all;
USE ieee.std_logic_UNSIGNED.all;


ENTITY  seven_seg_dec IS
PORT(in1, in2: IN   std_logic_vector(3 downto 0  ) ; 
Hout1 , Hout2 : OUT std_logic_vector(6 downto 0) );

 END seven_seg_dec ;


 
ARCHITECTURE arch3 OF seven_seg_dec IS 
 begin
 process(in1,in2)
 begin
  case(in1) is
   when "0000" =>  Hout1 <= "1000000"; --0--
   when "0001" =>  Hout1 <= "1111001"; --1--
   when "0010" =>  Hout1 <= "0100100"; --2--
   when "0011" =>  Hout1 <= "0110000"; --3--
   when "0100" =>  Hout1 <= "0011001"; --4-- 
   when "0101" =>  Hout1 <= "0010010"; --5--    
   when "0110" =>  Hout1 <= "0000010"; --6--
   when "0111" =>  Hout1 <= "1111000"; --7--   
   when "1000" =>  Hout1 <= "0000000"; --8--
   when others =>  Hout1 <= "0010000"; --9--"1001" 
   end case;
	case(in2) is
   when "0000" =>  Hout2 <= "1000000"; --0--
   when "0001" =>  Hout2 <= "1111001"; --1--
   when "0010" =>  Hout2 <= "0100100"; --2--
   when "0011" =>  Hout2 <= "0110000"; --3--
   when "0100" =>  Hout2 <= "0011001"; --4-- 
   when others  =>  Hout2 <= "0010010"; --5-- "0101"   
   end case;
	
 end process;
 end arch3 ;
