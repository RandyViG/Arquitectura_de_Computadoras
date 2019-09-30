-- VHDL Test Bench Created by ISE for module: barrel_shifter
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY tb_bs IS
END tb_bs;
 
ARCHITECTURE behavior OF tb_bs IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT barrel_shifter
    PORT(
         dato : IN  std_logic_vector(15 downto 0);
         salida : OUT  std_logic_vector(15 downto 0);
         sh : IN  std_logic_vector(3 downto 0);
         dir : IN  std_logic
        );
    END COMPONENT;
   --Inputs
   signal dato : std_logic_vector(15 downto 0) := (others => '0');
   signal sh : std_logic_vector(3 downto 0) := (others => '0');
   signal dir : std_logic := '0';

 	--Outputs
   signal salida : std_logic_vector(15 downto 0);
 
BEGIN
    -- Instantiate the Unit Under Test (UUT)
   uut: barrel_shifter PORT MAP (
          dato => dato,
          salida => salida,
          sh => sh,
          dir => dir
        );

   -- Stimulus process
   stim_proc: process
   begin		
        dato<= "1010111100001100";
        --1100 0011 0000 0000
        sh<= "0110";
        dir<='0';
        wait for 100 ns;
        dato<= "1010111100001100";
        --0000 0011 0000 1100 
        sh<= "0110";
        dir<='1';
        wait;
   end process;
END;
