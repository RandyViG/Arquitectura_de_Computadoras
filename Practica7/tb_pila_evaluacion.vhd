-- VHDL Test Bench Created by ISE for module: pila
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY tb_pruba_evaluacion IS
END tb_pruba_evaluacion;
 
ARCHITECTURE behavior OF tb_pruba_evaluacion IS 
 
    COMPONENT pila
    PORT(
         clk : IN  std_logic;
         clr : IN  std_logic;
         up : IN  std_logic;
         dw : IN  std_logic;
         wpc : IN  std_logic;
         sp1 : OUT  std_logic_vector(2 downto 0);
         pcin : IN  std_logic_vector(15 downto 0);
         pcout : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal clr : std_logic := '0';
   signal up : std_logic := '0';
   signal dw : std_logic := '0';
   signal wpc : std_logic := '0';
   signal pcin : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal sp1 : std_logic_vector(2 downto 0);
   signal pcout : std_logic_vector(15 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: pila PORT MAP (
          clk => clk,
          clr => clr,
          up => up,
          dw => dw,
          wpc => wpc,
          sp1 => sp1,
          pcin => pcin,
          pcout => pcout
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
      pcin<=x"0000";
		dw<='0';
		up<='0';
		clr<='1';
		wpc<='0';
		wait for 10 ns;
		
		pcin<=x"0000";
		dw<='0';
		up<='0';
		clr<='0';
		wpc<='0';
		wait for 30 ns;
		
		pcin<=x"0005";
		dw<='0';
		up<='1';
		clr<='0';
		wpc<='1';
		wait for 10 ns;
		
		pcin<=x"0000";
		dw<='0';
		up<='0';
		clr<='0';
		wpc<='0';
		wait for 30 ns;
		
		pcin<=x"000D";
		dw<='0';
		up<='1';
		clr<='0';
		wpc<='1';
		wait for 10 ns;
		
		pcin<=x"0000";
		dw<='0';
		up<='0';
		clr<='0';
		wpc<='0';
		wait for 40 ns;
		
		pcin<=x"0013";
		dw<='0';
		up<='1';
		clr<='0';
		wpc<='1';
		wait for 10 ns;
		
		pcin<=x"0000";
		dw<='0';
		up<='0';
		clr<='0';
		wpc<='0';
		wait for 50 ns;
		
		pcin<=x"0012";
		dw<='1';
		up<='0';
		clr<='0';
		wpc<='0';
		wait for 10 ns;
		
		pcin<=x"0000";
		dw<='0';
		up<='0';
		clr<='0';
		wpc<='0';
		wait for 10 ns;
		
		pcin<=x"0009";
		dw<='1';
		up<='0';
		clr<='0';
		wpc<='0';
		wait for 10 ns;
		
		pcin<=x"0000";
		dw<='0';
		up<='0';
		clr<='0';
		wpc<='0';
		wait for 40 ns;
		
		pcin<=x"0004";
		dw<='1';
		up<='0';
		clr<='0';
		wpc<='0';
		wait for 10 ns;
		
		pcin<=x"0000";
		dw<='0';
		up<='0';
		clr<='0';
		wpc<='1';
		wait for 10 ns;

      wait;
   end process;

END;
