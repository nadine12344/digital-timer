LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_ARITH.all;
USE ieee.std_logic_UNSIGNED.all;



ENTITY  sixty_counter IS 
PORT ( clk, reset,pause : IN std_logic;
f1,f2 : OUT std_logic_vector(3 downto 0 ));
 END  sixty_counter ;
 
 ARCHITECTURE arch2 OF sixty_counter Is
   signal temp1: std_logic_vector(0 to 3):= "0000";
	signal temp2: std_logic_vector(0 to 3):= "0000";
	
begin 
  process(clk, reset)
   begin
	if Reset='1' then
         temp1 <= "0000";
			temp2 <= "0000";
	
	
	
	
	elsif pause='0' then
      if Reset='1' then
         temp1 <= "0000";
			temp2 <= "0000";
      elsif(clk'event and clk='1') then   --elsif(rising_edge(Clock))
            if temp1="1001" then
               temp1<="0000";
					
					if(temp2="0101") then
					temp2 <= "0000";
					
					else
					temp2 <= temp2 + 1;
				   end if;
					
            else
               temp1 <= temp1 + 1;	
				end if;
         end if;
      end if;
   end process;
   f1 <= temp1;
	f2 <= temp2;
end arch2;
