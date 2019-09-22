--VHDL Test Bench Created by ISE for module: suma_resta_1bit
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY tb_suma_resta1bit IS
END tb_suma_resta1bit;
 
ARCHITECTURE behavior OF tb_suma_resta1bit IS 

    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT suma_resta_1bit
    PORT(
         a : IN  std_logic;
         b : IN  std_logic;
         cin : IN  std_logic;
         c0 : IN  std_logic;
         s : OUT  std_logic;
         cout : OUT  std_logic
        );
    END COMPONENT;
    
   --Inputs
   signal a : std_logic := '0';
   signal b : std_logic := '0';
   signal cin : std_logic := '0';
   signal c0 : std_logic := '0';

 	--Outputs
   signal s : std_logic;
   signal cout : std_logic;
    
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: suma_resta_1bit PORT MAP (
          a => a,
          b => b,
          cin => cin,
          c0 => c0,
          s => s,
          cout => cout
        ); 

   -- Stimulus process
   stim_proc: process
   begin		
        a<='1';
        b<='1';
        cin<='1';
        c0<='1';
      wait for 100 ns;
        cin<='0';
        c0<='0';
      wait for 100 ns;
        b<='0';
      wait for 100 ns;
        a<='0';
        b<='1';
      wait;
   end process;

END;
