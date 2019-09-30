-- VHDL Test Bench Created by ISE for module: demux
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY tb_demux IS
END tb_demux;
 
ARCHITECTURE behavior OF tb_demux IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT demux
    PORT(
         d : IN  std_logic;
         l : OUT  std_logic_vector(15 downto 0);
         seldemux : IN  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    
   --Inputs
   signal d : std_logic := '0';
   signal seldemux : std_logic_vector(3 downto 0) := (others => '0');

--Outputs
   signal l : std_logic_vector(15 downto 0);
 
BEGIN
 
 -- Instantiate the Unit Under Test (UUT)
   uut: demux PORT MAP (
          d => d,
          l => l,
          seldemux => seldemux
        );
 
   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
        d<='1';
        seldemux<="0000";
        wait for 50 ns;
        seldemux<="0001";
        wait for 50 ns;
        seldemux<="0010";
        wait for 50 ns;
        seldemux<="0011";
        wait for 50 ns;
        seldemux<="0100";
        wait for 50 ns;
        seldemux<="0101";
        wait for 50 ns;
        seldemux<="0110";
        wait for 50 ns;
        seldemux<="0111";
        wait for 50 ns;
        seldemux<="1000";
        wait for 50 ns;
        seldemux<="1001";
        wait for 50 ns;
        seldemux<="1010";
        wait for 50 ns;
        seldemux<="1011";
        wait for 50 ns;
        seldemux<="1100";
        wait for 50 ns;
        seldemux<="1101";
        wait for 50 ns;
        seldemux<="1110";
        wait for 50 ns;
        seldemux<="1111";
        wait for 50 ns;
      wait;
   end process;

END;
