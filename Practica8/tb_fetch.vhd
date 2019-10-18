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
        pcout : OUT  std_logic_vector(15 downto 0);
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
    signal pcout : std_logic_vector(15 downto 0);

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
        pcout => pcout,
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
    variable  CADENA : STRING(1 TO 6);
   begin	
        file_open(ARCH_RES, "Resultado.txt", WRITE_MODE);
        --Encabezados
        CADENA := "cpout ";
        write(LINEA_RES, CADENA, left, CADENA'LENGTH+1);--ESCRIBE LA CADENA "cpout"
        CADENA := "sp    ";
        write(LINEA_RES, CADENA, left, CADENA'LENGTH+1);--ESCRIBE LA CADENA "sp"
        CADENA := "OPCODE";
        write(LINEA_RES, CADENA, left, CADENA'LENGTH+1);--ESCRIBE LA CADENA "OPCODE"
        CADENA := "19..16";
        write(LINEA_RES, CADENA, left, CADENA'LENGTH+1);--ESCRIBE LA CADENA "19..16"
        CADENA := "15..12";
        write(LINEA_RES, CADENA, left, CADENA'LENGTH+1);--ESCRIBE LA CADENA "15..12"
        CADENA := "11...8";
        write(LINEA_RES, CADENA, left, CADENA'LENGTH+1);--ESCRIBE LA CADENA "11...8"
        CADENA := "7...4 ";
        write(LINEA_RES, CADENA, left, CADENA'LENGTH+1);--ESCRIBE LA CADENA "7...4"
        CADENA := "3...0 ";
        write(LINEA_RES, CADENA, left, CADENA'LENGTH+1);--ESCRIBE LA CADENA "3...0"
        writeline(ARCH_RES,LINEA_RES);-- escribe la linea en el archivo
    
        wait for 10 ns;
    
        pcin<=x"0000"; 
        wpc<='0';
        up<='0';
        dw<='0';
        clr<='1';
        Hwrite(LINEA_RES, pcout, left, 7); --ESCRIBE PCout
        write(LINEA_RES, sp, left, 7); --ESCRIBE SP
        write(LINEA_RES, dataout(24 downto 20), left, 7); --ESCRIBE daout 
        write(LINEA_RES, dataout(19 downto 16), left, 7);
        write(LINEA_RES, dataout(15 downto 12), left, 7);
        write(LINEA_RES, dataout(11 downto 8), left, 7);
        write(LINEA_RES, dataout(7 downto 4), left, 7);
        write(LINEA_RES, dataout(3 downto 0), left, 7);
        wait for 10 ns;
        writeline(ARCH_RES, LINEA_RES);
        
        clr<='0';
        Hwrite(LINEA_RES, pcout, left, 7); --ESCRIBE PCout
        write(LINEA_RES, sp, left, 7); --ESCRIBE SP
        write(LINEA_RES, dataout(24 downto 20), left, 7); --ESCRIBE daout 
        write(LINEA_RES, dataout(19 downto 16), left, 7);
        write(LINEA_RES, dataout(15 downto 12), left, 7);
        write(LINEA_RES, dataout(11 downto 8), left, 7);
        write(LINEA_RES, dataout(7 downto 4), left, 7);
        write(LINEA_RES, dataout(3 downto 0), left, 7);
        writeline(ARCH_RES, LINEA_RES);
        wait for 10 ns;
        
        Hwrite(LINEA_RES, pcout, left, 7); --ESCRIBE PCout
        write(LINEA_RES, sp, left, 7); --ESCRIBE SP
        write(LINEA_RES, dataout(24 downto 20), left, 7); --ESCRIBE daout 
        write(LINEA_RES, dataout(19 downto 16), left, 7);
        write(LINEA_RES, dataout(15 downto 12), left, 7);
        write(LINEA_RES, dataout(11 downto 8), left, 7);
        write(LINEA_RES, dataout(7 downto 4), left, 7);
        write(LINEA_RES, dataout(3 downto 0), left, 7);
        writeline(ARCH_RES, LINEA_RES);
        wait for 10 ns;
        
        for i in 0 to 9 loop
            pcin<=x"0005"; 
            wpc<='1';
            up<='1';
            Hwrite(LINEA_RES, pcout, left, 7); --ESCRIBE PCout
            write(LINEA_RES, sp, left, 7); --ESCRIBE SP
            write(LINEA_RES, dataout(24 downto 20), left, 7); --ESCRIBE daout 
            write(LINEA_RES, dataout(19 downto 16), left, 7);
            write(LINEA_RES, dataout(15 downto 12), left, 7);
            write(LINEA_RES, dataout(11 downto 8), left, 7);
            write(LINEA_RES, dataout(7 downto 4), left, 7);
            write(LINEA_RES, dataout(3 downto 0), left, 7);
            writeline(ARCH_RES, LINEA_RES);
            wait for 10 ns;

            pcin<=x"0000"; 
            wpc<='0';
            up<='0';
            Hwrite(LINEA_RES, pcout, left, 7); --ESCRIBE PCout
            write(LINEA_RES, dataout(24 downto 20), left, 7); --ESCRIBE daout 
            write(LINEA_RES, dataout(19 downto 16), left, 7);
            write(LINEA_RES, sp, left, 7); --ESCRIBE SP
            write(LINEA_RES, dataout(15 downto 12), left, 7);
            write(LINEA_RES, dataout(11 downto 8), left, 7);
            write(LINEA_RES, dataout(7 downto 4), left, 7);
            write(LINEA_RES, dataout(3 downto 0), left, 7);
            writeline(ARCH_RES, LINEA_RES);
            wait for 10 ns;
            pcin<=x"0003"; 
            dw<='1';
            Hwrite(LINEA_RES, pcout, left, 7); --ESCRIBE PCout
            write(LINEA_RES, sp, left, 7); --ESCRIBE SP
            write(LINEA_RES, dataout(24 downto 20), left, 7); --ESCRIBE daout 
            write(LINEA_RES, dataout(19 downto 16), left, 7);
            write(LINEA_RES, dataout(15 downto 12), left, 7);
            write(LINEA_RES, dataout(11 downto 8), left, 7);
            write(LINEA_RES, dataout(7 downto 4), left, 7);
            write(LINEA_RES, dataout(3 downto 0), left, 7);
            writeline(ARCH_RES, LINEA_RES);
            wait for 10 ns;

            pcin<=x"0000"; 
            dw<='0';
            Hwrite(LINEA_RES, pcout, left, 7); --ESCRIBE PCout
            write(LINEA_RES, sp, left, 7); --ESCRIBE SP
            write(LINEA_RES, dataout(24 downto 20), left, 7); --ESCRIBE daout 
            write(LINEA_RES, dataout(19 downto 16), left, 7);
            write(LINEA_RES, dataout(15 downto 12), left, 7);
            write(LINEA_RES, dataout(11 downto 8), left, 7);
            write(LINEA_RES, dataout(7 downto 4), left, 7);
            write(LINEA_RES, dataout(3 downto 0), left, 7);
            writeline(ARCH_RES, LINEA_RES);
            wait for 10 ns;
    
            pcin<=x"0002"; 
            wpc<='1';
    
            Hwrite(LINEA_RES, pcout, left, 7); --ESCRIBE PCout
            write(LINEA_RES, sp, left, 7); --ESCRIBE SP
            write(LINEA_RES, dataout(24 downto 20), left, 7); --ESCRIBE daout 
            write(LINEA_RES, dataout(19 downto 16), left, 7);
            write(LINEA_RES, dataout(15 downto 12), left, 7);
            write(LINEA_RES, dataout(11 downto 8), left, 7);
            write(LINEA_RES, dataout(7 downto 4), left, 7);
            write(LINEA_RES, dataout(3 downto 0), left, 7);
            writeline(ARCH_RES, LINEA_RES);
            wait for 10 ns;
    
            CADENA:="      ";
            write(LINEA_RES, CADENA, left, 19);
            writeline(ARCH_RES, LINEA_RES);
    
            end loop;
    
            file_close(ARCH_RES);  -- cierra el archivo
            wait;
    
   end process;

END;
