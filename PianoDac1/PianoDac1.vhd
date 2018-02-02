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
		
		o_audio : out std_logic_vector (3 downto 0);
		);
end PianoDac1;



architecture PianoDac1 of PianoDac1 is


	constant c_freq_A   : natural := 7102;
	constant c_freq_A_s : natural := 6704;
	constant c_freq_B   : natural := 6327;
	constant c_freq_C   : natural := 5972;
	constant c_freq_C_s : natural := 5637;
	constant c_freq_D   : natural := 5320;
	constant c_freq_D_s : natural := 5022;
	constant c_freq_E   : natural := 4740;
	constant c_freq_F   : natural := 4474;
	constant c_freq_F_s : natural := 4223;
	constant c_freq_G   : natural := 3986;
	constant c_freq_G_s : natural := 3762;
	
	
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


	signal r_vector_A   : std_logic_vector (2 downto 0);
	signal r_vector_A_s : std_logic_vector (2 downto 0);
	signal r_vector_B   : std_logic_vector (2 downto 0);
	signal r_vector_C   : std_logic_vector (2 downto 0);
	signal r_vector_C_s : std_logic_vector (2 downto 0);
	signal r_vector_D   : std_logic_vector (2 downto 0);
	signal r_vector_D_s : std_logic_vector (2 downto 0);
	signal r_vector_E   : std_logic_vector (2 downto 0);
	signal r_vector_F   : std_logic_vector (2 downto 0);
	signal r_vector_F_s : std_logic_vector (2 downto 0);
	signal r_vector_G   : std_logic_vector (2 downto 0);
	signal r_vector_G_s : std_logic_vector (2 downto 0);
	

begin


	p_A : process (i_clock) is
	begin
	
	 if rising_edge(i_clock) then
	 
		if r_vector_A = '110' and r_rise_A = '0' then
			r_rise_A = '1';
		elsif r_vector_A = '001' and r_rise_A = '1' then
			r_rise_A = '0';
		end if;
	 
		if r_vector_A() =
		
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



end PianoDac1;






