-- VHDL Test Bench Created by ISE for module: pila
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_arith.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;
LIBRARY STD;
USE STD.TEXTIO.ALL;
USE ieee.std_logic_TEXTIO.ALL;	--PERMITE USAR STD_LOGIC 
 
ENTITY tb_pila_archivos IS
END tb_pila_archivos;
 
ARCHITECTURE behavior OF tb_pila_archivos IS 
 
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
	file ARCH_RES : TEXT;	--Apuntadores tipo txt
			VARIABLE LINEA_RES : line;
			VARIABLE VAR_pcout : STD_LOGIC_VECTOR(15 DOWNTO 0);
    
	file ARCH_EN : TEXT; --Apuntadores tipo rxt
			VARIABLE LINEA_EN: line;
			VARIABLE VAR_pcin : STD_LOGIC_VECTOR(15 DOWNTO 0);
			VARIABLE VAR_sp : STD_LOGIC_VECTOR(2 DOWNTO 0);
			VARIABLE VAR_clr,VAR_up,VAR_dw,VAR_wpc:STD_LOGIC;
			VARIABLE  CADENA : STRING(1 TO 6);
   begin		
		--Los Archivos ya deben de existir
    file_open(ARCH_EN, "Estimulos.txt", READ_MODE); 
    file_open(ARCH_RES, "Resultado.txt", WRITE_MODE);	
    
    CADENA := "PC_IN ";
    write(LINEA_RES, CADENA, left, CADENA'LENGTH+1);--ESCRIBE LA CADENA "PC_IN"
    CADENA := "CLR   ";
    write(LINEA_RES, CADENA, left, CADENA'LENGTH+1);--ESCRIBE LA CADENA "CLR"
    CADENA := "UP    ";
    write(LINEA_RES, CADENA, left, CADENA'LENGTH+1);--ESCRIBE LA CADENA "UP"
    CADENA := "WPC   ";
    write(LINEA_RES, CADENA, left, CADENA'LENGTH+1);--ESCRIBE LA CADENA "WPC"
	 CADENA := "DW    ";
    write(LINEA_RES, CADENA, left, CADENA'LENGTH+1);--ESCRIBE LA CADENA "DW"
	 CADENA := "SP    ";
    write(LINEA_RES, CADENA, left, CADENA'LENGTH+1);--ESCRIBE LA CADENA "SP"
	 CADENA := "PC_OUT";
    write(LINEA_RES, CADENA, left, CADENA'LENGTH+1);--ESCRIBE LA CADENA "PC_OUT"
    
    writeline(ARCH_RES,LINEA_RES);-- escribe la linea en el archivo
	 
    WAIT FOR 1 NS;
    
    for I in 0 to 24 loop
        readline( ARCH_EN , LINEA_EN ); -- lee una linea completa
        --Lee pcin
        Hread(LINEA_EN , VAR_pcin);
        pcin <= VAR_pcin;
        --Lee clr
        read(LINEA_EN, VAR_clr);
        clr <= VAR_clr;
        --Lee wpc
        read(LINEA_EN, VAR_wpc);
        wpc <= VAR_wpc;
		  --Lee up
        read(LINEA_EN, VAR_up);
        up <= VAR_up;
		  --Lee dw
        read(LINEA_EN, VAR_dw);
        dw <= VAR_dw;
        
        WAIT UNTIL RISING_EDGE(clk);--ESPERA AL FLANCO DE SUBIDA 
        VAR_pcout := pcout;
            
        Hwrite(LINEA_RES, VAR_pcin, left, 7);--ESCRIBE EL CAMPO PC_IN
        write(LINEA_RES, VAR_clr, left, 7);--ESCRIBE EL CAMPO CLR		
        write(LINEA_RES, VAR_up, left, 7);--ESCRIBE EL CAMPO UP
        write(LINEA_RES, VAR_wpc, left, 7);--ESCRIBE EL CAMPO WPC
		  write(LINEA_RES, VAR_dw, left, 7);--ESCRIBE EL CAMPO DW
		  write(LINEA_RES, sp1, left, 7);--ESCRIBE EL CAMPO SP
		  Hwrite(LINEA_RES, VAR_pcout, left, 7);--ESCRIBE EL CAMPO PC_OUT
            
        writeline(ARCH_RES, LINEA_RES);
    end loop;
    
    file_close(ARCH_EN);  -- cierra el archivo
    file_close(ARCH_RES);  -- cierra el archivo
	 wait;
   end process;

END;
