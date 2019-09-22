-- VHDL Test Bench Created by ISE for module: sumador_restador_8bits
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY tb_sumador_restador IS
END tb_sumador_restador;
 
ARCHITECTURE behavior OF tb_sumador_restador IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT sumador_restador_8bits
    PORT(
         a : IN  std_logic_vector(7 downto 0);
         b : IN  std_logic_vector(7 downto 0);
         cen : IN  std_logic;
         s : OUT  std_logic_vector(7 downto 0);
         co : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic_vector(7 downto 0) := (others => '0');
   signal b : std_logic_vector(7 downto 0) := (others => '0');
   signal cen : std_logic := '0';

 	--Outputs
   signal s : std_logic_vector(7 downto 0);
   signal co : std_logic;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: sumador_restador_8bits PORT MAP (
          a => a,
          b => b,
          cen => cen,
          s => s,
          co => co
        );

   -- Stimulus process
   stim_proc: process
   begin		
      cen<='0';
		a<="00001000";
		b<="00000100";
		
		wait for 100 ns;
		cen<='1';
		
		wait for 100 ns;
		a<="11111111";
		b<="00000010";
		cen<='1';
		
		wait for 100 ns;
		a<="11111101";
		b<="00000010";
      wait;
   end process;

END;
