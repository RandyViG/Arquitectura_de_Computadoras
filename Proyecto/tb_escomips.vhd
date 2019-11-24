-- Module Name:   tb_escomips.vhd
-- Project Name:  ESCOMips
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY tb_escomips IS
END tb_escomips;
 
ARCHITECTURE behavior OF tb_escomips IS 
 
    COMPONENT ESCOMips
    PORT(
         CLK_Nexys : IN  std_logic;
         Reset : IN  std_logic;
         pc_out : OUT  std_logic_vector(15 downto 0);
         reg1 : OUT  std_logic_vector(15 downto 0);
         reg2 : OUT  std_logic_vector(15 downto 0);
         alu_out : OUT  std_logic_vector(15 downto 0);
         data_out : OUT  std_logic_vector(15 downto 0);
         banderas : OUT  std_logic_vector(3 downto 0);
         micro : OUT  std_logic_vector(19 downto 0);
         instr : OUT  std_logic_vector(24 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CLK_Nexys : std_logic := '0';
   signal Reset : std_logic := '0';

 	--Outputs
   signal pc_out : std_logic_vector(15 downto 0);
   signal reg1 : std_logic_vector(15 downto 0);
   signal reg2 : std_logic_vector(15 downto 0);
   signal alu_out : std_logic_vector(15 downto 0);
   signal data_out : std_logic_vector(15 downto 0);
   signal banderas : std_logic_vector(3 downto 0);
   signal micro : std_logic_vector(19 downto 0);
   signal instr : std_logic_vector(24 downto 0);

   -- Clock period definitions
   constant CLK_Nexys_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ESCOMips PORT MAP (
          CLK_Nexys => CLK_Nexys,
          Reset => Reset,
          pc_out => pc_out,
          reg1 => reg1,
          reg2 => reg2,
          alu_out => alu_out,
          data_out => data_out,
          banderas => banderas,
          micro => micro,
          instr => instr
        );

   -- Clock process definitions
   CLK_Nexys_process :process
   begin
        CLK_Nexys <= '0';
        wait for CLK_Nexys_period/2;
        CLK_Nexys <= '1';
        wait for CLK_Nexys_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
        reset <= '1';
        wait for 20 ns;
        reset <= '0';
        wait for 200 ns;

      wait;
   end process;

END;
