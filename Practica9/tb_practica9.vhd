-- VHDL Test Bench Created by ISE for module: main
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY tb_practica9 IS
END tb_practica9;
 
ARCHITECTURE behavior OF tb_practica9 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT main
    PORT(
         ini : IN  std_logic;
         clk : IN  std_logic;
         clr : IN  std_logic;
         dato : IN  std_logic_vector(8 downto 0);
         display : OUT  std_logic_vector(6 downto 0);
         a : OUT  std_logic_vector(8 downto 0);
         d1 : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal ini : std_logic := '0';
   signal clk : std_logic := '0';
   signal clr : std_logic := '0';
   signal dato : std_logic_vector(8 downto 0) := (others => '0');

 	--Outputs
   signal display : std_logic_vector(6 downto 0);
   signal a : std_logic_vector(8 downto 0);
   signal d1 : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: main PORT MAP (
          ini => ini,
          clk => clk,
          clr => clr,
          dato => dato,
          display => display,
          a => a,
          d1 => d1
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      clr<='1';
		wait for 20 ns;
		clr<='0';
		dato<="111111111";
		wait for 20 ns;
		ini<='1';
		wait for 100 ns;
		ini<='0';
		clr<='1';
		wait for 20 ns;
		clr<='0';
		dato<="101010101";
		wait for 20 ns;
		ini<='1';
		wait for 100 ns;
		ini<='0';
		clr<='1';
		wait for 20 ns;
		clr<='0';
		dato<="111100111";
		wait for 20 ns;
		ini<='1';
		wait for 100 ns;
      wait;
   end process;

END;
