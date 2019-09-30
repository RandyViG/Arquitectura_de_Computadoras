-- VHDL Test Bench Created by ISE for module: Alu_Nbits
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY tb_Alu_Nbits IS
END tb_Alu_Nbits;
 
ARCHITECTURE behavior OF tb_Alu_Nbits IS 
 
    COMPONENT Alu_Nbits
    PORT(
         a : IN  std_logic_vector(3 downto 0);
         b : IN  std_logic_vector(3 downto 0);
         aluop : IN  std_logic_vector(3 downto 0);
         s : OUT  std_logic_vector(3 downto 0);
         flags : OUT  std_logic_vector(3 downto 0)
         --cout : OUT  std_logic
        );
    END COMPONENT;
    
   --Inputs
   signal a : std_logic_vector(3 downto 0) := (others => '0');
   signal b : std_logic_vector(3 downto 0) := (others => '0');
   signal aluop : std_logic_vector(3 downto 0) := (others => '0');

    --Outputs
   signal s : std_logic_vector(3 downto 0);
   signal flags : std_logic_vector(3 downto 0);
   --signal cout : std_logic;
 
BEGIN
 
    -- Instantiate the Unit Under Test (UUT)
   uut: Alu_Nbits PORT MAP (
          a => a,
          b => b,
          aluop => aluop,
          s => s,
          flags => flags
          --cout => cout
        ); 

   -- Stimulus process
   stim_proc: process
   begin
        a<="0101";
        b<="1110";
        --A+B
        aluop<="0011";
        wait for 50 ns;
        --A-B
        aluop<="0111";
        wait for 50 ns;
        --AND
        aluop<="0000";
        wait for 50 ns;
        --NAND
        aluop<="1101";
        wait for 50 ns;
        --OR
        aluop<="0001";
        wait for 50 ns;
        --NOR
        aluop<="1100";
        wait for 50 ns;
        --XOR
        aluop<="0010";
        wait for 50 ns;
        --XNOR
        aluop<="1010";
        wait for 50 ns;
        
        b<="0111";
        --suma
        aluop<="0011";
        wait for 50 ns;
        
        b<="0101";
        --resta
        aluop<="0111";
        wait for 50 ns;
        
        aluop<="1101";
        wait for 50 ns;
    wait;
    end process;

END;
