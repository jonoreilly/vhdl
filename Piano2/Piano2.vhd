library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Piano2 is 
	port (
		i_clock : in std_logic;
		
		i_tecla_A   : in std_logic;
		i_tecla_A_s : in std_logic;
		i_tecla_B   : in std_logic;
		i_tecla_C   : in std_logic;
		i_tecla_C_s : in std_logic;
		i_tecla_D   : in std_logic;
		i_tecla_D_s : in std_logic;
		i_tecla_E   : in std_logic;
		i_tecla_F   : in std_logic;
		i_tecla_F_s : in std_logic;
		i_tecla_G   : in std_logic;
		i_tecla_G_s : in std_logic;
		
		o_audio : out std_logic
		);
end Piano2;
	
	
architecture Piano2 of Piano2 is

	constant c_freq_A   : natural := 56818;
	constant c_freq_A_s : natural := 53630;
	constant c_freq_B   : natural := 50620;
	constant c_freq_C   : natural := 47778;
	constant c_freq_C_s : natural := 45096;
	constant c_freq_D   : natural := 42565;
	constant c_freq_D_s : natural := 40176;
	constant c_freq_E   : natural := 37921;
	constant c_freq_F   : natural := 35793;
	constant c_freq_F_s : natural := 33784;
	constant c_freq_G   : natural := 31888;
	constant c_freq_G_s : natural := 30098;
	
	signal r_value_A   : natural range 0 to c_freq_A  ;
	signal r_value_A_s : natural range 0 to c_freq_A_s;
	signal r_value_B   : natural range 0 to c_freq_B  ;
	signal r_value_C   : natural range 0 to c_freq_C  ;
	signal r_value_C_s : natural range 0 to c_freq_C_s;
	signal r_value_D   : natural range 0 to c_freq_D  ;
	signal r_value_D_s : natural range 0 to c_freq_D_s;
	signal r_value_E   : natural range 0 to c_freq_E  ;
	signal r_value_F   : natural range 0 to c_freq_F  ;
	signal r_value_F_s : natural range 0 to c_freq_F_s;
	signal r_value_G   : natural range 0 to c_freq_G  ;
	signal r_value_G_s : natural range 0 to c_freq_G_s;
	
	signal r_rise_A   : std_logic := '0';
	signal r_rise_A_s : std_logic := '0';
	signal r_rise_B   : std_logic := '0';
	signal r_rise_C   : std_logic := '0';
	signal r_rise_C_s : std_logic := '0';
	signal r_rise_D   : std_logic := '0';
	signal r_rise_D_s : std_logic := '0';
	signal r_rise_E   : std_logic := '0';
	signal r_rise_F   : std_logic := '0';
	signal r_rise_F_s : std_logic := '0';
	signal r_rise_G   : std_logic := '0';
	signal r_rise_G_s : std_logic := '0';
	
	signal r_toggle_A   : std_logic := '0';
	signal r_toggle_A_s : std_logic := '0';
	signal r_toggle_B   : std_logic := '0';
	signal r_toggle_C   : std_logic := '0';
	signal r_toggle_C_s : std_logic := '0';
	signal r_toggle_D   : std_logic := '0';
	signal r_toggle_D_s : std_logic := '0';
	signal r_toggle_E   : std_logic := '0';
	signal r_toggle_F   : std_logic := '0';
	signal r_toggle_F_s : std_logic := '0';
	signal r_toggle_G   : std_logic := '0';
	signal r_toggle_G_s : std_logic := '0';
	
	
begin
	
	
	
	p_A : process (i_clock) is
	begin
	
	 if rising_edge(i_clock) then
	 
		if r_value_A = c_freq_A -1 then
		  r_rise_A <= '1';
		  r_toggle_A <= '1';
		end if;
		
		if r_value_A = 0 then
		  r_rise_A <= '0';
		  r_toggle_A <= '0';
		end if;
		
		if r_rise_A = '0' then
		  r_value_A <= r_value_A + 1;
		else
			r_value_A <= r_value_A -1;
		end if;
		
	 end if;
	 
	end process p_A;
	
	
	
	p_A_s : process (i_clock) is
	begin
	
	 if rising_edge(i_clock) then
	 
		if r_value_A_s = c_freq_A_s -1 then
		  r_rise_A_s <= '1';
		  r_toggle_A_s <= '1';
		end if;
		
		if r_value_A_s = 0 then
		  r_rise_A_s <= '0';
		  r_toggle_A_s <= '0';
		end if;
		
		if r_rise_A_s = '0' then
		  r_value_A_s <= r_value_A_s + 1;
		else
			r_value_A_s <= r_value_A_s -1;
		end if;
		
	 end if;
	 
	end process p_A_s;
	
	
	
	p_B : process (i_clock) is
	begin
	
	 if rising_edge(i_clock) then
	 
		if r_value_B = c_freq_B -1 then
		  r_rise_B <= '1';
		  r_toggle_B <= '1';
		end if;
		
		if r_value_B = 0 then
		  r_rise_B <= '0';
		  r_toggle_B <= '0';
		end if;
		
		if r_rise_B = '0' then
		  r_value_B <= r_value_B + 1;
		else
			r_value_B <= r_value_B -1;
		end if;
		
	 end if;
	 
	end process p_B;
	
	
	
	p_C : process (i_clock) is
	begin
	
	 if rising_edge(i_clock) then
	 
		if r_value_C = c_freq_C -1 then
		  r_rise_C <= '1';
		  r_toggle_C <= '1';
		end if;
		
		if r_value_C = 0 then
		  r_rise_C <= '0';
		  r_toggle_C <= '0';
		end if;
		
		if r_rise_C = '0' then
		  r_value_C <= r_value_C + 1;
		else
			r_value_C <= r_value_C -1;
		end if;
		
	 end if;
	 
	end process p_C;
	
	
	
	p_C_s : process (i_clock) is
	begin
	
	 if rising_edge(i_clock) then
	 
		if r_value_C_s = c_freq_C_s -1 then
		  r_rise_C_s <= '1';
		  r_toggle_C_s <= '1';
		end if;
		
		if r_value_C_s = 0 then
		  r_rise_C_s <= '0';
		  r_toggle_C_s <= '0';
		end if;
		
		if r_rise_C_s = '0' then
		  r_value_C_s <= r_value_C_s + 1;
		else
			r_value_C_s <= r_value_C_s -1;
		end if;
		
	 end if;
	 
	end process p_C_s;
	
	
	
	
	p_D : process (i_clock) is
	begin
	
	 if rising_edge(i_clock) then
	 
		if r_value_D = c_freq_D -1 then
		  r_rise_D <= '1';
		  r_toggle_D <= '1';
		end if;
		
		if r_value_D = 0 then
		  r_rise_D <= '0';
		  r_toggle_D <= '0';
		end if;
		
		if r_rise_D = '0' then
		  r_value_D <= r_value_D + 1;
		else
			r_value_D <= r_value_D -1;
		end if;
		
	 end if;
	 
	end process p_D;
	
	
	
	
	p_D_s : process (i_clock) is
	begin
	
	 if rising_edge(i_clock) then
	 
		if r_value_D_s = c_freq_D_s -1 then
		  r_rise_D_s <= '1';
		  r_toggle_D_s <= '1';
		end if;
		
		if r_value_D_s = 0 then
		  r_rise_D_s <= '0';
		  r_toggle_D_s <= '0';
		end if;
		
		if r_rise_D_s = '0' then
		  r_value_D_s <= r_value_D_s + 1;
		else
			r_value_D_s <= r_value_D_s -1;
		end if;
		
	 end if;
	 
	end process p_D_s;
	
	
	
	
	p_E : process (i_clock) is
	begin
	
	 if rising_edge(i_clock) then
	 
		if r_value_E = c_freq_E -1 then
		  r_rise_E <= '1';
		  r_toggle_E <= '1';
		end if;
		
		if r_value_E = 0 then
		  r_rise_E <= '0';
		  r_toggle_E <= '0';
		end if;
		
		if r_rise_E = '0' then
		  r_value_E <= r_value_E + 1;
		else
			r_value_E <= r_value_E -1;
		end if;
		
	 end if;
	 
	end process p_E;
	
	
	
	
	p_F : process (i_clock) is
	begin
	
	 if rising_edge(i_clock) then
	 
		if r_value_F = c_freq_F -1 then
		  r_rise_F <= '1';
		  r_toggle_F <= '1';
		end if;
		
		if r_value_F = 0 then
		  r_rise_F <= '0';
		  r_toggle_F <= '0';
		end if;
		
		if r_rise_F = '0' then
		  r_value_F <= r_value_F + 1;
		else
			r_value_F <= r_value_F -1;
		end if;
		
	 end if;
	 
	end process p_F;
	
	
	
	
	p_F_s : process (i_clock) is
	begin
	
	 if rising_edge(i_clock) then
	 
		if r_value_F_s = c_freq_F_s -1 then
		  r_rise_F_s <= '1';
		  r_toggle_F_s <= '1';
		end if;
		
		if r_value_F_s = 0 then
		  r_rise_F_s <= '0';
		  r_toggle_F_s <= '0';
		end if;
		
		if r_rise_F_s = '0' then
		  r_value_F_s <= r_value_F_s + 1;
		else
			r_value_F_s <= r_value_F_s -1;
		end if;
		
	 end if;
	 
	end process p_F_s;
	
	
	
	
	p_G : process (i_clock) is
	begin
	
	 if rising_edge(i_clock) then
	 
		if r_value_G = c_freq_G -1 then
		  r_rise_G <= '1';
		  r_toggle_G <= '1';
		end if;
		
		if r_value_G = 0 then
		  r_rise_G <= '0';
		  r_toggle_G <= '0';
		end if;
		
		if r_rise_G = '0' then
		  r_value_G <= r_value_G + 1;
		else
			r_value_G <= r_value_G -1;
		end if;
		
	 end if;
	 
	end process p_G;
	
	
	
	
	p_G_s : process (i_clock) is
	begin
	
	 if rising_edge(i_clock) then
	 
		if r_value_G_s = c_freq_G_s -1 then
		  r_rise_G_s <= '1';
		  r_toggle_G_s <= '1';
		end if;
		
		if r_value_G_s = 0 then
		  r_rise_G_s <= '0';
		  r_toggle_G_s <= '0';
		end if;
		
		if r_rise_G_s = '0' then
		  r_value_G_s <= r_value_G_s + 1;
		else
			r_value_G_s <= r_value_G_s -1;
		end if;
		
	 end if;
	 
	end process p_G_s;
	
	
	
	o_audio <=  (r_toggle_A   and i_tecla_A)   or
					(r_toggle_A_s and i_tecla_A_s) or
					(r_toggle_B   and i_tecla_B)   or
					(r_toggle_C   and i_tecla_C)   or
					(r_toggle_C_s and i_tecla_C_s) or
					(r_toggle_D   and i_tecla_D)   or
					(r_toggle_D_s and i_tecla_D_s) or
					(r_toggle_E   and i_tecla_E)   or
					(r_toggle_F   and i_tecla_F)   or
					(r_toggle_F_s and i_tecla_F_s) or
					(r_toggle_G   and i_tecla_G)   or
					(r_toggle_G_s and i_tecla_G_s);
	
	
	
end Piano2;
	
	
	

