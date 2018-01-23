library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity butonled is
	Port (btnA0, btnA1, btnR0, btnR1 : in bit;
			led0, led1, led2 : out bit);
end butonled;

--architecture Behavioral of butonled is
--begin	
--	led0 <= (btnA0 xor btnA1)xor(btnR0 xor btnR1);
--	led1 <= ((btnA0 and (btnA1 xor btnR0)) 
--				or (btnR1 and ((btnA0 and not btnR0) 
--				or (not btnA0 and btnA1))) 
--				or (btnR0 and (btnA1 xor btnR1)));
--	led2 <= ((btnA0 and btnA1) and (btnR0 and btnR1));
--end Behavioral;

architecture Behavioral of butonled is
begin	
	led0 <= (btnA0 xor btnR0);
	led1 <= ((btnA1 xor btnR1) xor (btnA0 and btnR0));
	led2 <= ((btnA1 and btnR1) or (btnA1 and btnA0 and btnR0) or (btnA0 and btnR0 and btnR1));

end Behavioral;
