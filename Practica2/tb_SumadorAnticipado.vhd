LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY test IS
END test;
ARCHITECTURE behavior OF tb_SumadorAnticipado IS 
    COMPONENT SumadorAnticipado
    PORT(
         a : IN  std_logic_vector(7 downto 0);
         b : IN  std_logic_vector(7 downto 0);
         cin : IN  std_logic;
         s : INOUT  std_logic_vector(7 downto 0);
         cout : OUT  std_logic
        );
    END COMPONENT;
   --Inputs
   signal a : std_logic_vector(7 downto 0) := (others => '0');
   signal b : std_logic_vector(7 downto 0) := (others => '0');
   signal cin : std_logic := '0';
	--BiDirs
   signal s : std_logic_vector(7 downto 0);
 	--Outputs
   signal cout : std_logic;
BEGIN
   uut: SumadorAnticipado PORT MAP (
          a => a,
          b => b,
          cin => cin,
          s => s,
          cout => cout
        );
   stim_proc: process
   begin		
      -- insert stimulus here 
		a<="00001010";  -- 10
		b<="00000011";  -- 3
		cin<='0';
		wait for 100 ns;
		a<="00001101";	 -- 13
		b<="00010101";  -- 21
		wait for 100 ns;
		a<="10001101";  
		b<="10101010";
		wait for 100 ns;
		cin<='1';
		a<="00001010";  -- 10
		b<="00000011";  -- 3
		wait for 100 ns;
		a<="00001101";  -- 13
		b<="00010101";  -- 21
		wait for 100 ns;
		a<="10001101";
		b<="10101010";
      wait;
   end process;

END;
