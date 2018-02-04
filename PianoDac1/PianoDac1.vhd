library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity PianoDac1 is 
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
		
		o_audio : out std_logic_vector (3 downto 0)
		);
end PianoDac1;



architecture PianoDac1 of PianoDac1 is

	--50Mhz clock / frequencie of the note / 2 for rising and falling time / 8 for each value of 3 bits
	constant c_freq_A   : natural := 3788;
	constant c_freq_A_s : natural := 3575;
	constant c_freq_B   : natural := 3375;
	constant c_freq_C   : natural := 3185;
	constant c_freq_C_s : natural := 3006;
	constant c_freq_D   : natural := 2837;
	constant c_freq_D_s : natural := 2678;
	constant c_freq_E   : natural := 2528;
	constant c_freq_F   : natural := 2386;
	constant c_freq_F_s : natural := 2252;
	constant c_freq_G   : natural := 2126;
	constant c_freq_G_s : natural := 2006;
	
	-- step counters
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
	
	
	-- 0 for value rising, 1 for value falling
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


	-- digital result value for each note
	signal r_vector_A   : std_logic_vector (3 downto 0) := "0000";
	signal r_vector_A_s : std_logic_vector (3 downto 0) := "0000";
	signal r_vector_B   : std_logic_vector (3 downto 0) := "0000";
	signal r_vector_C   : std_logic_vector (3 downto 0) := "0000";
	signal r_vector_C_s : std_logic_vector (3 downto 0) := "0000";
	signal r_vector_D   : std_logic_vector (3 downto 0) := "0000";
	signal r_vector_D_s : std_logic_vector (3 downto 0) := "0000";
	signal r_vector_E   : std_logic_vector (3 downto 0) := "0000";
	signal r_vector_F   : std_logic_vector (3 downto 0) := "0000";
	signal r_vector_F_s : std_logic_vector (3 downto 0) := "0000";
	signal r_vector_G   : std_logic_vector (3 downto 0) := "0000";
	signal r_vector_G_s : std_logic_vector (3 downto 0) := "0000";
	

begin


	p_A : process (i_clock) is
	begin
	
	
	 if rising_edge(i_clock) then
	
		if r_value_A = c_freq_A-1 then
			r_value_A <= 0; -- restart counter
		 
			if r_vector_A = "1110" and r_rise_A = '0' then -- if next step is the max set to decrease for next cycle
				r_rise_A <= '1';
				
			elsif r_vector_A = "0001" and r_rise_A = '1' then -- if next step is the min set to increase next cycle
				r_rise_A <= '0';
				
			end if;
			
			
			-- Vector increase or decrease
			if r_rise_A = '0' then
			
				if r_vector_A(0) = '1' then
					
					if r_vector_A(1) = '1' then
					
						if r_vector_A(2) = '1' then
							r_vector_A(3) <= not r_vector_A(3);
							
						end if;
						r_vector_A(2) <= not r_vector_A(2);
					
					end if;
					r_vector_A(1) <= not r_vector_A(1);
				
				end if;
				r_vector_A(0) <= not r_vector_A(0);
				
			else
			
				if r_vector_A(0) = '0' then
					
					if r_vector_A(1) = '0' then
					
						if r_vector_A(2) = '0' then
							r_vector_A(3) <= not r_vector_A(3);
							
						end if;
						r_vector_A(2) <= not r_vector_A(2);
						
					end if;
					r_vector_A(1) <= not r_vector_A(1);
					
				end if;
				r_vector_A(0) <= not r_vector_A(0);
			
			end if;
		else
			r_value_A <= r_value_A+1;
			
		end if;
	end if;
		
	end process p_A;
	
	
	
	
	p_A_s : process (i_clock) is
	begin
	
	
	 if rising_edge(i_clock) then
	
		if r_value_A_s = c_freq_A_s-1 then
			r_value_A_s <= 0; -- restart counter
		 
			if r_vector_A_s = "1110" and r_rise_A_s = '0' then -- if next step is the max set to decrease for next cycle
				r_rise_A_s <= '1';
				
			elsif r_vector_A_s = "0001" and r_rise_A_s = '1' then -- if next step is the min set to increase next cycle
				r_rise_A_s <= '0';
				
			end if;
			
			
			-- Vector increase or decrease
			if r_rise_A_s = '0' then
			
				if r_vector_A_s(0) = '1' then
					
					if r_vector_A_s(1) = '1' then
					
						if r_vector_A_s(2) = '1' then
							r_vector_A_s(3) <= not r_vector_A_s(3);
							
						end if;
						r_vector_A_s(2) <= not r_vector_A_s(2);
					
					end if;
					r_vector_A_s(1) <= not r_vector_A_s(1);
				
				end if;
				r_vector_A_s(0) <= not r_vector_A_s(0);
				
			else
			
				if r_vector_A_s(0) = '0' then
					
					if r_vector_A_s(1) = '0' then
					
						if r_vector_A_s(2) = '0' then
							r_vector_A_s(3) <= not r_vector_A_s(3);
							
						end if;
						r_vector_A_s(2) <= not r_vector_A_s(2);
						
					end if;
					r_vector_A_s(1) <= not r_vector_A_s(1);
					
				end if;
				r_vector_A_s(0) <= not r_vector_A_s(0);
			
			end if;
		else
			r_value_A_s <= r_value_A_s+1;
			
		end if;
	end if;
	 
	end process p_A_s;
	
	
	
	
	
	p_B : process (i_clock) is
	begin
	
	
	 if rising_edge(i_clock) then
	
		if r_value_B = c_freq_B-1 then
			r_value_B <= 0; -- restart counter
		 
			if r_vector_B = "1110" and r_rise_B = '0' then -- if next step is the max set to decrease for next cycle
				r_rise_B <= '1';
				
			elsif r_vector_B = "0001" and r_rise_B = '1' then -- if next step is the min set to increase next cycle
				r_rise_B <= '0';
				
			end if;
			
			
			-- Vector increase or decrease
			if r_rise_B = '0' then
			
				if r_vector_B(0) = '1' then
					
					if r_vector_B(1) = '1' then
					
						if r_vector_B(2) = '1' then
							r_vector_B(3) <= not r_vector_B(3);
							
						end if;
						r_vector_B(2) <= not r_vector_B(2);
					
					end if;
					r_vector_B(1) <= not r_vector_B(1);
				
				end if;
				r_vector_B(0) <= not r_vector_B(0);
				
			else
			
				if r_vector_B(0) = '0' then
					
					if r_vector_B(1) = '0' then
					
						if r_vector_B(2) = '0' then
							r_vector_B(3) <= not r_vector_B(3);
							
						end if;
						r_vector_B(2) <= not r_vector_B(2);
						
					end if;
					r_vector_B(1) <= not r_vector_B(1);
					
				end if;
				r_vector_B(0) <= not r_vector_B(0);
			
			end if;
		else
			r_value_B <= r_value_B+1;
		end if;
	end if;
	 
	end process p_B;
	
	
	
	
	
	p_C : process (i_clock) is
	begin
	
	
	 if rising_edge(i_clock) then
	
		if r_value_C = c_freq_C-1 then
			r_value_C <= 0; -- restart counter
		 
			if r_vector_C = "1110" and r_rise_C = '0' then -- if next step is the max set to decrease for next cycle
				r_rise_C <= '1';
				
			elsif r_vector_C = "0001" and r_rise_C = '1' then -- if next step is the min set to increase next cycle
				r_rise_C <= '0';
				
			end if;
			
			
			-- Vector increase or decrease
			if r_rise_C = '0' then
			
				if r_vector_C(0) = '1' then
					
					if r_vector_C(1) = '1' then
					
						if r_vector_C(2) = '1' then
							r_vector_C(3) <= not r_vector_C(3);
							
						end if;
						r_vector_C(2) <= not r_vector_C(2);
					
					end if;
					r_vector_C(1) <= not r_vector_C(1);
				
				end if;
				r_vector_C(0) <= not r_vector_C(0);
				
			else
			
				if r_vector_C(0) = '0' then
					
					if r_vector_C(1) = '0' then
					
						if r_vector_C(2) = '0' then
							r_vector_C(3) <= not r_vector_C(3);
							
						end if;
						r_vector_C(2) <= not r_vector_C(2);
						
					end if;
					r_vector_C(1) <= not r_vector_C(1);
					
				end if;
				r_vector_C(0) <= not r_vector_C(0);
			
			end if;
		else
			r_value_C <= r_value_C+1;
			
		end if;
	end if;
	 
	end process p_C;
	
	
	
	
	p_C_s : process (i_clock) is
	begin
	
	
	 if rising_edge(i_clock) then
	
		if r_value_C_s = c_freq_C_s-1 then
			r_value_C_s <= 0; -- restart counter
		 
			if r_vector_C_s = "1110" and r_rise_C_s = '0' then -- if next step is the max set to decrease for next cycle
				r_rise_C_s <= '1';
				
			elsif r_vector_C_s = "0001" and r_rise_C_s = '1' then -- if next step is the min set to increase next cycle
				r_rise_C_s <= '0';
				
			end if;
			
			
			-- Vector increase or decrease
			if r_rise_C_s = '0' then
			
				if r_vector_C_s(0) = '1' then
					
					if r_vector_C_s(1) = '1' then
					
						if r_vector_C_s(2) = '1' then
							r_vector_C_s(3) <= not r_vector_C_s(3);
							
						end if;
						r_vector_C_s(2) <= not r_vector_C_s(2);
					
					end if;
					r_vector_C_s(1) <= not r_vector_C_s(1);
				
				end if;
				r_vector_C_s(0) <= not r_vector_C_s(0);
				
			else
			
				if r_vector_C_s(0) = '0' then
					
					if r_vector_C_s(1) = '0' then
					
						if r_vector_C_s(2) = '0' then
							r_vector_C_s(3) <= not r_vector_C_s(3);
							
						end if;
						r_vector_C_s(2) <= not r_vector_C_s(2);
						
					end if;
					r_vector_C_s(1) <= not r_vector_C_s(1);
					
				end if;
				r_vector_C_s(0) <= not r_vector_C_s(0);
			
			end if;
		else
			r_value_C_s <= r_value_C_s+1;
			
		end if;
	end if;
	 
	end process p_C_s;
	
	
	
	
	
	p_D : process (i_clock) is
	begin
	
	
	 if rising_edge(i_clock) then
	
		if r_value_D = c_freq_D-1 then
			r_value_D <= 0; -- restart counter
		 
			if r_vector_D = "1110" and r_rise_D = '0' then -- if next step is the max set to decrease for next cycle
				r_rise_D <= '1';
				
			elsif r_vector_D = "0001" and r_rise_D = '1' then -- if next step is the min set to increase next cycle
				r_rise_D <= '0';
				
			end if;
			
			
			-- Vector increase or decrease
			if r_rise_D = '0' then
			
				if r_vector_D(0) = '1' then
					
					if r_vector_D(1) = '1' then
					
						if r_vector_D(2) = '1' then
							r_vector_D(3) <= not r_vector_D(3);
							
						end if;
						r_vector_D(2) <= not r_vector_D(2);
					
					end if;
					r_vector_D(1) <= not r_vector_D(1);
				
				end if;
				r_vector_D(0) <= not r_vector_D(0);
				
			else
			
				if r_vector_D(0) = '0' then
					
					if r_vector_D(1) = '0' then
					
						if r_vector_D(2) = '0' then
							r_vector_D(3) <= not r_vector_D(3);
							
						end if;
						r_vector_D(2) <= not r_vector_D(2);
						
					end if;
					r_vector_D(1) <= not r_vector_D(1);
					
				end if;
				r_vector_D(0) <= not r_vector_D(0);
			
			end if;
		else
			r_value_D <= r_value_D+1;
			
		end if;
	end if;
	 
	end process p_D;
	
	
	
	p_D_s : process (i_clock) is
	begin
	
	
	 if rising_edge(i_clock) then
	
		if r_value_D_s = c_freq_D_s-1 then
			r_value_D_s <= 0; -- restart counter
		 
			if r_vector_D_s = "1110" and r_rise_D_s = '0' then -- if next step is the max set to decrease for next cycle
				r_rise_D_s <= '1';
				
			elsif r_vector_D_s = "0001" and r_rise_D_s = '1' then -- if next step is the min set to increase next cycle
				r_rise_D_s <= '0';
				
			end if;
			
			
			-- Vector increase or decrease
			if r_rise_D_s = '0' then
			
				if r_vector_D_s(0) = '1' then
					
					if r_vector_D_s(1) = '1' then
					
						if r_vector_D_s(2) = '1' then
							r_vector_D_s(3) <= not r_vector_D_s(3);
							
						end if;
						r_vector_D_s(2) <= not r_vector_D_s(2);
					
					end if;
					r_vector_D_s(1) <= not r_vector_D_s(1);
				
				end if;
				r_vector_D_s(0) <= not r_vector_D_s(0);
				
			else
			
				if r_vector_D_s(0) = '0' then
					
					if r_vector_D_s(1) = '0' then
					
						if r_vector_D_s(2) = '0' then
							r_vector_D_s(3) <= not r_vector_D_s(3);
							
						end if;
						r_vector_D_s(2) <= not r_vector_D_s(2);
						
					end if;
					r_vector_D_s(1) <= not r_vector_D_s(1);
					
				end if;
				r_vector_D_s(0) <= not r_vector_D_s(0);
			
			end if;
		else
			r_value_D_s <= r_value_D_s+1;
			
		end if;
	end if;
	 
	end process p_D_s;
	
	
	
	
	
	p_E : process (i_clock) is
	begin
	
	
	 if rising_edge(i_clock) then
	
		if r_value_E = c_freq_E-1 then
			r_value_E <= 0; -- restart counter
		 
			if r_vector_E = "1110" and r_rise_E = '0' then -- if next step is the max set to decrease for next cycle
				r_rise_E <= '1';
				
			elsif r_vector_E = "0001" and r_rise_E = '1' then -- if next step is the min set to increase next cycle
				r_rise_E <= '0';
				
			end if;
			
			
			-- Vector increase or decrease
			if r_rise_E = '0' then
			
				if r_vector_E(0) = '1' then
					
					if r_vector_E(1) = '1' then
					
						if r_vector_E(2) = '1' then
							r_vector_E(3) <= not r_vector_E(3);
							
						end if;
						r_vector_E(2) <= not r_vector_E(2);
					
					end if;
					r_vector_E(1) <= not r_vector_E(1);
				
				end if;
				r_vector_E(0) <= not r_vector_E(0);
				
			else
			
				if r_vector_E(0) = '0' then
					
					if r_vector_E(1) = '0' then
					
						if r_vector_E(2) = '0' then
							r_vector_E(3) <= not r_vector_E(3);
							
						end if;
						r_vector_E(2) <= not r_vector_E(2);
						
					end if;
					r_vector_E(1) <= not r_vector_E(1);
					
				end if;
				r_vector_E(0) <= not r_vector_E(0);
			
			end if;
		else
			r_value_E <= r_value_E+1;
			
		end if;
	end if;
	 
	end process p_E;
	
	
	
	
	
	p_F : process (i_clock) is
	begin
	
	
	 if rising_edge(i_clock) then
	
		if r_value_F = c_freq_F-1 then
			r_value_F <= 0; -- restart counter
		 
			if r_vector_F = "1110" and r_rise_F = '0' then -- if next step is the max set to decrease for next cycle
				r_rise_F <= '1';
				
			elsif r_vector_F = "0001" and r_rise_F = '1' then -- if next step is the min set to increase next cycle
				r_rise_F <= '0';
				
			end if;
			
			
			-- Vector increase or decrease
			if r_rise_F = '0' then
			
				if r_vector_F(0) = '1' then
					
					if r_vector_F(1) = '1' then
					
						if r_vector_F(2) = '1' then
							r_vector_F(3) <= not r_vector_F(3);
							
						end if;
						r_vector_F(2) <= not r_vector_F(2);
					
					end if;
					r_vector_F(1) <= not r_vector_F(1);
				
				end if;
				r_vector_F(0) <= not r_vector_F(0);
				
			else
			
				if r_vector_F(0) = '0' then
					
					if r_vector_F(1) = '0' then
					
						if r_vector_F(2) = '0' then
							r_vector_F(3) <= not r_vector_F(3);
							
						end if;
						r_vector_F(2) <= not r_vector_F(2);
						
					end if;
					r_vector_F(1) <= not r_vector_F(1);
					
				end if;
				r_vector_F(0) <= not r_vector_F(0);
			
			end if;
		else
			r_value_F <= r_value_F+1;
			
		end if;
	end if;
	 
	end process p_F;
	
	
	
	
	
	p_F_s : process (i_clock) is
	begin
	
	
	 if rising_edge(i_clock) then
	
		if r_value_F_s = c_freq_F_s-1 then
			r_value_F_s <= 0; -- restart counter
		 
			if r_vector_F_s = "1110" and r_rise_F_s = '0' then -- if next step is the max set to decrease for next cycle
				r_rise_F_s <= '1';
				
			elsif r_vector_F_s = "0001" and r_rise_F_s = '1' then -- if next step is the min set to increase next cycle
				r_rise_F_s <= '0';
				
			end if;
			
			
			-- Vector increase or decrease
			if r_rise_F_s = '0' then
			
				if r_vector_F_s(0) = '1' then
					
					if r_vector_F_s(1) = '1' then
					
						if r_vector_F_s(2) = '1' then
							r_vector_F_s(3) <= not r_vector_F_s(3);
							
						end if;
						r_vector_F_s(2) <= not r_vector_F_s(2);
					
					end if;
					r_vector_F_s(1) <= not r_vector_F_s(1);
				
				end if;
				r_vector_F_s(0) <= not r_vector_F_s(0);
				
			else
			
				if r_vector_F_s(0) = '0' then
					
					if r_vector_F_s(1) = '0' then
					
						if r_vector_F_s(2) = '0' then
							r_vector_F_s(3) <= not r_vector_F_s(3);
							
						end if;
						r_vector_F_s(2) <= not r_vector_F_s(2);
						
					end if;
					r_vector_F_s(1) <= not r_vector_F_s(1);
					
				end if;
				r_vector_F_s(0) <= not r_vector_F_s(0);
			
			end if;
		else
			r_value_F_s <= r_value_F_s+1;
			
		end if;
	end if;
	 
	end process p_F_s;
	
	
	
	
	
	
	p_G : process (i_clock) is
	begin
	
	
	 if rising_edge(i_clock) then
	
		if r_value_G = c_freq_G-1 then
			r_value_G <= 0; -- restart counter
		 
			if r_vector_G = "1110" and r_rise_G = '0' then -- if next step is the max set to decrease for next cycle
				r_rise_G <= '1';
				
			elsif r_vector_G = "0001" and r_rise_G = '1' then -- if next step is the min set to increase next cycle
				r_rise_G <= '0';
				
			end if;
			
			
			-- Vector increase or decrease
			if r_rise_G = '0' then
			
				if r_vector_G(0) = '1' then
					
					if r_vector_G(1) = '1' then
					
						if r_vector_G(2) = '1' then
							r_vector_G(3) <= not r_vector_G(3);
							
						end if;
						r_vector_G(2) <= not r_vector_G(2);
					
					end if;
					r_vector_G(1) <= not r_vector_G(1);
				
				end if;
				r_vector_G(0) <= not r_vector_G(0);
				
			else
			
				if r_vector_G(0) = '0' then
					
					if r_vector_G(1) = '0' then
					
						if r_vector_G(2) = '0' then
							r_vector_G(3) <= not r_vector_G(3);
							
						end if;
						r_vector_G(2) <= not r_vector_G(2);
						
					end if;
					r_vector_G(1) <= not r_vector_G(1);
					
				end if;
				r_vector_G(0) <= not r_vector_G(0);
			
			end if;
		else
			r_value_G <= r_value_G+1;
			
		end if;
	end if;
	 
	end process p_G;
	
	
	
	
	
	
	p_G_s : process (i_clock) is
	begin
	
	
	 if rising_edge(i_clock) then
	
		if r_value_G_s = c_freq_G_s-1 then
			r_value_G_s <= 0; -- restart counter
		 
			if r_vector_G_s = "1110" and r_rise_G_s = '0' then -- if next step is the max set to decrease for next cycle
				r_rise_G_s <= '1';
				
			elsif r_vector_G_s = "0001" and r_rise_G_s = '1' then -- if next step is the min set to increase next cycle
				r_rise_G_s <= '0';
				
			end if;
			
			
			-- Vector increase or decrease
			if r_rise_G_s = '0' then
			
				if r_vector_G_s(0) = '1' then
					
					if r_vector_G_s(1) = '1' then
					
						if r_vector_G_s(2) = '1' then
							r_vector_G_s(3) <= not r_vector_G_s(3);
							
						end if;
						r_vector_G_s(2) <= not r_vector_G_s(2);
					
					end if;
					r_vector_G_s(1) <= not r_vector_G_s(1);
				
				end if;
				r_vector_G_s(0) <= not r_vector_G_s(0);
				
			else
			
				if r_vector_G_s(0) = '0' then
					
					if r_vector_G_s(1) = '0' then
					
						if r_vector_G_s(2) = '0' then
							r_vector_G_s(3) <= not r_vector_G_s(3);
							
						end if;
						r_vector_G_s(2) <= not r_vector_G_s(2);
						
					end if;
					r_vector_G_s(1) <= not r_vector_G_s(1);
					
				end if;
				r_vector_G_s(0) <= not r_vector_G_s(0);
			
			end if;
		else
			r_value_G_s <= r_value_G_s+1;
			
		end if;
	end if;
	 
	end process p_G_s;
	
	
	
	
	
	
	
	
	
	
	
	-- set output vector to the selected note (signal mixing is still in development, for the moment play one note only)
	
	o_audio(0) <=  (r_vector_A  (0) and i_tecla_A  ) or
						(r_vector_A_s(0) and i_tecla_A_s) or
						(r_vector_B  (0) and i_tecla_B  ) or
						(r_vector_C  (0) and i_tecla_C  ) or
						(r_vector_C_s(0) and i_tecla_C_s) or
						(r_vector_D  (0) and i_tecla_D  ) or
						(r_vector_D_s(0) and i_tecla_D_s) or
						(r_vector_E  (0) and i_tecla_E  ) or
						(r_vector_F  (0) and i_tecla_F  ) or
						(r_vector_F_s(0) and i_tecla_F_s) or
						(r_vector_G  (0) and i_tecla_G  ) or
						(r_vector_G_s(0) and i_tecla_G_s);
						
	
	o_audio(1) <=  (r_vector_A  (1) and i_tecla_A  ) or
						(r_vector_A_s(1) and i_tecla_A_s) or
						(r_vector_B  (1) and i_tecla_B  ) or
						(r_vector_C  (1) and i_tecla_C  ) or
						(r_vector_C_s(1) and i_tecla_C_s) or
						(r_vector_D  (1) and i_tecla_D  ) or
						(r_vector_D_s(1) and i_tecla_D_s) or
						(r_vector_E  (1) and i_tecla_E  ) or
						(r_vector_F  (1) and i_tecla_F  ) or
						(r_vector_F_s(1) and i_tecla_F_s) or
						(r_vector_G  (1) and i_tecla_G  ) or
						(r_vector_G_s(1) and i_tecla_G_s);
	
	
	o_audio(2) <=  (r_vector_A  (2) and i_tecla_A  ) or
						(r_vector_A_s(2) and i_tecla_A_s) or
						(r_vector_B  (2) and i_tecla_B  ) or
						(r_vector_C  (2) and i_tecla_C  ) or
						(r_vector_C_s(2) and i_tecla_C_s) or
						(r_vector_D  (2) and i_tecla_D  ) or
						(r_vector_D_s(2) and i_tecla_D_s) or
						(r_vector_E  (2) and i_tecla_E  ) or
						(r_vector_F  (2) and i_tecla_F  ) or
						(r_vector_F_s(2) and i_tecla_F_s) or
						(r_vector_G  (2) and i_tecla_G  ) or
						(r_vector_G_s(2) and i_tecla_G_s);
						
						
	o_audio(3) <=  (r_vector_A  (3) and i_tecla_A  ) or
						(r_vector_A_s(3) and i_tecla_A_s) or
						(r_vector_B  (3) and i_tecla_B  ) or
						(r_vector_C  (3) and i_tecla_C  ) or
						(r_vector_C_s(3) and i_tecla_C_s) or
						(r_vector_D  (3) and i_tecla_D  ) or
						(r_vector_D_s(3) and i_tecla_D_s) or
						(r_vector_E  (3) and i_tecla_E  ) or
						(r_vector_F  (3) and i_tecla_F  ) or
						(r_vector_F_s(3) and i_tecla_F_s) or
						(r_vector_G  (3) and i_tecla_G  ) or
						(r_vector_G_s(3) and i_tecla_G_s);



end PianoDac1;






