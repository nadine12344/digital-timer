LIBRARY ieee;
USE ieee.std_logic_1164.all ;
USE ieee.std_logic_ARITH.all;
USE ieee.std_logic_UNSIGNED.all;




ENTITY timer IS 
port(clk,rst,pause:IN std_logic;
     out1,out2:OUT std_logic_vector(6 downto 0) 
);
END timer ;

ARCHITECTURE arch4 OF timer IS
signal sig1,sig2: std_logic_vector(3 downto 0 );
signal clknew: std_logic;



COMPONENT clk_generator IS 
port (clki : in std_logic;
       clko : out std_logic
     );
 END COMPONENT ;
 
 
COMPONENT  sixty_counter IS 
PORT ( clk, reset,pause: IN std_logic;
f1,f2 : OUT std_logic_vector(3 downto 0 ));
 END  COMPONENT ;
 
COMPONENT seven_seg_dec IS
PORT(in1, in2: IN   std_logic_vector(3 downto 0  ) ; 
Hout1 , Hout2 : OUT std_logic_vector(6 downto 0) );

 END COMPONENT ;

BEGIN
ck:clk_generator port map(clk,clknew);
six:sixty_counter port map(clknew,rst,pause,sig1,sig2);
seven:seven_seg_dec port map(sig1,sig2,out1,out2);
 


END arch4;
