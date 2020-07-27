LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY clk_generator IS 
port (clki : in std_logic;
       clko : out std_logic
     );
 END clk_generator ;
 
 
 architecture arch1 of clk_generator is

signal count : integer :=1;
signal temp : std_logic :='0';
BEGIN

 --clk generation.For 50 MHz clock this generates 1 Hz clock.
PROCESS(clki) begin

if(clki'event and clki='1')
 then  count <= count+1;
 clko <=temp;

 if(count = 2)then temp <= not temp;
      count <= 1;
		clko <= temp ;
end if;

end if;
--clko <= temp ;
end process;
end arch1 ;
