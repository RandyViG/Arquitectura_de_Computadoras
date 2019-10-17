-- VHDL Test Bench Created by ISE for module: Fetch
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.all;
USE IEEE.STD_LOGIC_unsigned.ALL;
LIBRARY STD;
USE STD.TEXTIO.ALL;
USE ieee.std_logic_TEXTIO.ALL;	--PERMITE USAR STD_LOGIC 
 
ENTITY tb_fetch IS
END tb_fetch;
 
ARCHITECTURE behavior OF tb_fetch IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT Fetch
    PORT(
        pcin : IN  std_logic_vector(15 downto 0);
        wpc : IN  std_logic;
        up : IN  std_logic;
        dw : IN  std_logic;
        clr : IN  std_logic;
        clk : IN  std_logic;
        sp : OUT std_logic_vector(2 downto 0);
        dataout : OUT  std_logic_vector(24 downto 0)
        );
    END COMPONENT;
    
   --Inputs
    signal pcin : std_logic_vector(15 downto 0) := (others => '0');
    signal wpc : std_logic := '0';
    signal up : std_logic := '0';
    signal dw : std_logic := '0';
    signal clr : std_logic := '0';
    signal clk : std_logic := '0';

    --Outputs
    signal dataout : std_logic_vector(24 downto 0);
    signal sp : std_logic_vector(2 downto 0) := (others => '0');

    -- Clock period definitions
    constant clk_period : time := 10 ns;
 
BEGIN
 
    -- Instantiate the Unit Under Test (UUT)
    uut: Fetch PORT MAP (
        pcin => pcin,
        wpc => wpc,
        up => up,
        dw => dw,
        clr => clr,
        clk => clk,
        sp => sp,
        dataout => dataout
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
    file ARCH_RES : TEXT;	--Apuntadores tipo txt
    variable LINEA_RES : line;
   begin	
    file_open(ARCH_RES, "Resultado.txt", WRITE_MODE);
    wait for 10 ns;
    
    pcin<=x"0000"; 
    wpc<='0';
    up<='0';
    dw<='0';
    clr<='1';
    wait for 10 ns;
    write(LINEA_RES, dataout, left, 6);--ESCRIBE EL CAMPO dataout
    writeline(ARCH_RES, LINEA_RES);
    
    pcin<=x"0000"; 
    clr<='0';
    wait for 10 ns;
    write(LINEA_RES, dataout, left, 6);--ESCRIBE EL CAMPO dataout
    writeline(ARCH_RES, LINEA_RES);
    
    wait for 10 ns;
    write(LINEA_RES, dataout, left, 6);--ESCRIBE EL CAMPO dataout
    writeline(ARCH_RES, LINEA_RES);
    
    for i in 0 to 9 loop
    pcin<=x"0005"; 
    wpc<='1';
    up<='1';
    wait for 10 ns;
    write(LINEA_RES, dataout, left, 6);--ESCRIBE EL CAMPO dataout
    writeline(ARCH_RES, LINEA_RES);
    
    pcin<=x"0000";
    wpc<='0';
    up<='0';
    wait for 10 ns;
    write(LINEA_RES, dataout, left, 6);--ESCRIBE EL CAMPO dataout
    writeline(ARCH_RES, LINEA_RES);
        
    pcin<=x"0003"; 
    dw<='1';
    wait for 10 ns;
    write(LINEA_RES, dataout, left, 6);--ESCRIBE EL CAMPO dataout
    writeline(ARCH_RES, LINEA_RES);
    
    pcin<=x"0000"; 
    dw<='0';

    wait for 10 ns;
    write(LINEA_RES, dataout, left, 6);--ESCRIBE EL CAMPO dataout
    writeline(ARCH_RES, LINEA_RES);
    
    pcin<=x"0002"; 
    wpc<='1';
    wait for 10 ns;
    write(LINEA_RES, dataout, left, 6);--ESCRIBE EL CAMPO dataout
    writeline(ARCH_RES, LINEA_RES);
    
    end loop;
    
    file_close(ARCH_RES);  -- cierra el archivo
    wait;
    
   end process;

END;
