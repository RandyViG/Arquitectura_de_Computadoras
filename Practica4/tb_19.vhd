LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY tb_19 IS
END tb_19;
 
ARCHITECTURE behavior OF tb_19 IS 
 
    COMPONENT Archivo_Registro
    PORT(
         wr : IN  std_logic;
         she : IN  std_logic;
         dir : IN  std_logic;
         clk : IN  std_logic;
         clr : IN  std_logic;
         write_reg : IN  std_logic_vector(3 downto 0);
         read_reg1 : IN  std_logic_vector(3 downto 0);
         read_reg2 : IN  std_logic_vector(3 downto 0);
         shamt : IN  std_logic_vector(3 downto 0);
         write_data : IN  std_logic_vector(15 downto 0);
         read_data1 : OUT  std_logic_vector(15 downto 0);
         read_data2 : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal wr : std_logic := '0';
   signal she : std_logic := '0';
   signal dir : std_logic := '0';
   signal clk : std_logic := '0';
   signal clr : std_logic := '0';
   signal write_reg : std_logic_vector(3 downto 0) := (others => '0');
   signal read_reg1 : std_logic_vector(3 downto 0) := (others => '0');
   signal read_reg2 : std_logic_vector(3 downto 0) := (others => '0');
   signal shamt : std_logic_vector(3 downto 0) := (others => '0');
   signal write_data : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal read_data1 : std_logic_vector(15 downto 0);
   signal read_data2 : std_logic_vector(15 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Archivo_Registro PORT MAP (
          wr => wr,
          she => she,
          dir => dir,
          clk => clk,
          clr => clr,
          write_reg => write_reg,
          read_reg1 => read_reg1,
          read_reg2 => read_reg2,
          shamt => shamt,
          write_data => write_data,
          read_data1 => read_data1,
          read_data2 => read_data2
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
      -- hold reset state for 100 ns.
      wait for 100 ns;	
        clr<='1';
        wait for 100 ns;
        clr<='0';
        write_data<=x"1234";
        wr<='1';
        write_reg<="0011";
        read_reg2<="0011";
        read_reg1<="0011";
        she<='0';
        dir<='0';
        shamt<="0000";
    
        wait for 100 ns;
    
        clr<='0';
        write_data<=x"1234";
        wr<='1';
        write_reg<="0101";
        read_reg2<="0011";
        read_reg1<="0101";
        she<='1';
        dir<='0';
        shamt<="0100";
      wait;
   end process;
END;
