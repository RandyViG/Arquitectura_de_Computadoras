-- VHDL Test Bench Created by ISE for module: Registro
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;
USE ieee.std_logic_unsigned.ALL;
 
ENTITY tb_Registro IS
END tb_Registro;
 
ARCHITECTURE behavior OF tb_Registro IS  
    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT Registro
    PORT(
         d : IN  std_logic_vector(15 downto 0);
         q : OUT  std_logic_vector(15 downto 0);
         clk : IN  std_logic;
         clr : IN  std_logic;
         l : IN  std_logic
        );
    END COMPONENT;
    
   --Inputs
   signal d : std_logic_vector(15 downto 0) := (others => '0');
   signal clk : std_logic := '0';
   signal clr : std_logic := '0';
   signal l : std_logic := '0';

    --Outputs
   signal q : std_logic_vector(15 downto 0);
   
   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
    -- Instantiate the Unit Under Test (UUT)
   uut: Registro PORT MAP (
        d => d,
        q => q,
        clk => clk,
        clr => clr,
        l => l
    );

   -- Clock process definitions
   clk_process :process
   begin
        clk <= '0';
        wait for clk_period/2;
        clk <= '1';
        wait for clk_period/2;
   end process;

   stim_proc: process
   begin		
        clr<='1';
        wait for 30 ns;
        clr<='0';
    wait;
   end process;

    Enable_l: process
    begin
    wait for 100 ns;
        l<='1';
    wait for 100 ns;
        l<='0';
    end process;

    datos: process
	begin
        d <= d + x"0020";
        wait for 25 ns;
    end process;

END;
