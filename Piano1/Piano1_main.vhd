library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
 
entity Piano1_main is
  port (
    i_clock      : in  std_logic;
    i_enable     : in  std_logic;
    i_switch_1   : in  std_logic;
    i_switch_2   : in  std_logic;
    o_led_drive  : out std_logic
    );
end Piano1_main;
 
architecture rtl of Piano1_main is
 
  -- Constants to create the frequencies needed:
  -- Formula is: (25 MHz / 100 Hz * 50% duty cycle)
  -- So for 100 Hz: 50,000,000 / 440 * 0.5 = 56818
  constant c_A_440HZ : natural := 56818;
  constant c_B_494HZ : natural := 50617;
  constant c_C_523HZ : natural := 47774;
  constant c_D_587HZ : natural := 42560;
 
 
  -- These signals will be the counters:
  signal r_A_440HZ : natural range 0 to c_A_440HZ;
  signal r_B_494HZ : natural range 0 to c_B_494HZ;
  signal r_C_523HZ : natural range 0 to c_C_523HZ;
  signal r_D_587HZ : natural range 0 to c_D_587HZ;
   
  -- These signals will toggle at the frequencies needed:
  signal r_TOGGLE_A_440HZ : std_logic := '0';
  signal r_TOGGLE_B_494HZ : std_logic := '0';
  signal r_TOGGLE_C_523HZ : std_logic := '0';
  signal r_TOGGLE_D_587HZ : std_logic := '0';
 
  -- One bit select wire.
  signal w_LED_SELECT : std_logic;
   
begin
 
  -- All processes toggle a specific signal at a different frequency.
  -- They all run continuously even if the switches are
  -- not selecting their particular output.
   
  p_A_440_HZ : process (i_clock) is
  begin
    if rising_edge(i_clock) then
      if r_A_440HZ = c_A_440HZ-1 then  -- -1, since counter starts at 0
        r_TOGGLE_A_440HZ <= not r_TOGGLE_A_440HZ;
        r_A_440HZ    <= 0;
      else
        r_A_440HZ <= r_A_440HZ + 1;
      end if;
    end if;
  end process p_A_440_HZ;
 
 
  p_B_494HZ : process (i_clock) is
  begin
    if rising_edge(i_clock) then
      if r_B_494HZ = c_B_494HZ-1 then  -- -1, since counter starts at 0
        r_TOGGLE_B_494HZ <= not r_TOGGLE_B_494HZ;
        r_B_494HZ    <= 0;
      else
        r_B_494HZ <= r_B_494HZ + 1;
      end if;
    end if;
  end process p_B_494HZ;
 
   
  p_C_523HZ : process (i_clock) is
  begin
    if rising_edge(i_clock) then
      if r_C_523HZ = c_C_523HZ-1 then  -- -1, since counter starts at 0
        r_TOGGLE_C_523HZ <= not r_TOGGLE_C_523HZ;
        r_C_523HZ    <= 0;
      else
        r_C_523HZ <= r_C_523HZ + 1;
      end if;
    end if;
  end process p_C_523HZ;
 
   
  p_D_587HZ : process (i_clock) is
  begin
    if rising_edge(i_clock) then
      if r_D_587HZ = c_D_587HZ-1 then  -- -1, since counter starts at 0
        r_TOGGLE_D_587HZ <= not r_TOGGLE_D_587HZ;
        r_D_587HZ    <= 0;
      else
        r_D_587HZ <= r_D_587HZ + 1;
      end if;
    end if;
  end process p_D_587HZ;
 
   
  -- Create a multiplexor based on switch inputs
  w_LED_SELECT <= r_TOGGLE_A_440HZ when (i_switch_1 = '0' and i_switch_2 = '0') else
                  r_TOGGLE_B_494HZ  when (i_switch_1 = '0' and i_switch_2 = '1') else
                  r_TOGGLE_C_523HZ  when (i_switch_1 = '1' and i_switch_2 = '0') else
                  r_TOGGLE_D_587HZ;
 
   
  -- Only allow o_led_drive to drive when i_enable is high (and gate).
  o_led_drive <= w_LED_SELECT and i_enable;
 
end rtl;