-- VHDL Test Bench Created by ISE for module: MemoriaDatos
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.all;
USE IEEE.STD_LOGIC_unsigned.ALL;
LIBRARY STD;
USE STD.TEXTIO.ALL;
USE ieee.std_logic_TEXTIO.ALL;	--PERMITE USAR STD_LOGIC 
 
ENTITY tb_MemoriaDatos IS
END tb_MemoriaDatos;
 
ARCHITECTURE behavior OF tb_MemoriaDatos IS 
 
    COMPONENT MemoriaDatos
    PORT(
         dir : IN  std_logic_vector(10 downto 0);
         data_in : IN  std_logic_vector(15 downto 0);
         data_out : OUT  std_logic_vector(15 downto 0);
         WD : IN  std_logic;
         CLK : IN  std_logic
        );
    END COMPONENT;
  
   --Inputs
   signal dir : std_logic_vector(10 downto 0) := (others => '0');
   signal data_in : std_logic_vector(15 downto 0) := (others => '0');
   signal WD : std_logic := '0';
   signal CLK : std_logic := '0';

 	--Outputs
   signal data_out : std_logic_vector(15 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
	-- Instantiate the Unit Under Test (UUT)
   uut: MemoriaDatos PORT MAP (
          dir => dir,
          data_in => data_in,
          data_out => data_out,
          WD => WD,
          CLK => CLK
        );

   -- Clock process definitions
   CLK_process :process
   begin
        CLK <= '0';
        wait for CLK_period/2;
        CLK <= '1';
    wait for CLK_period/2;
   end process;
 
   -- Stimulus process
   stim_proc: process
	
    file ARCH_RES : TEXT;	--Apuntadores tipo txt
    variable LINEA_RES : line;
    VARIABLE VAR_data_out : STD_LOGIC_VECTOR(15 DOWNTO 0);
    
    file ARCH_EN : TEXT; --Apuntadores tipo rxt
        variable LINEA_EN: line;
        VARIABLE VAR_dir : STD_LOGIC_VECTOR(11 DOWNTO 0);
        VARIABLE VAR_data_in : STD_LOGIC_VECTOR(15 DOWNTO 0);
        VARIABLE VAR_wd:STD_LOGIC;
        VARIABLE  CADENA : STRING(1 TO 5);
   begin
    --Los Archivos ya deben de existir
    file_open(ARCH_EN, "Estimulos.txt", READ_MODE); 
    file_open(ARCH_RES, "Resultado.txt", WRITE_MODE);	
    
    CADENA := "dir  ";
    write(LINEA_RES, CADENA, left, CADENA'LENGTH+1);--ESCRIBE LA CADENA "Direccion"
    CADENA := "Di   ";
    write(LINEA_RES, CADENA, left, CADENA'LENGTH+1);--ESCRIBE LA CADENA "WD"
    CADENA := "WD   ";
    write(LINEA_RES, CADENA, left, CADENA'LENGTH+1);--ESCRIBE LA CADENA "Data_in"
    CADENA := "Do   ";
    write(LINEA_RES, CADENA, left, CADENA'LENGTH+1);--ESCRIBE LA CADENA "Data_out"
    
    writeline(ARCH_RES,LINEA_RES);-- escribe la linea en el archivo
    WAIT FOR 100 NS;
    
    for I in 0 to 9 loop
        readline( ARCH_EN , LINEA_EN ); -- lee una linea completa
        --Lee wd
        read(LINEA_EN , VAR_wd);
        wd<= VAR_wd;
        --Lee data_in
        Hread(LINEA_EN, VAR_data_in);
        data_in<= VAR_data_in;
        --Lee dir
        Hread(LINEA_EN, VAR_dir);
        dir<= VAR_dir ( 10 downto 0 );
        
        WAIT UNTIL RISING_EDGE(clk);--ESPERA AL FLANCO DE SUBIDA 
        VAR_data_out := data_out;
            
        Hwrite(LINEA_RES, VAR_dir, left, 6);--ESCRIBE EL CAMPO dir
        Hwrite(LINEA_RES, VAR_data_in, left, 6);--ESCRIBE EL CAMPO data_in			
        write(LINEA_RES, VAR_wd, left, 6);--ESCRIBE EL CAMPO wd
        Hwrite(LINEA_RES, VAR_data_out, left, 6);--ESCRIBE EL CAMPO Data_out
            
        writeline(ARCH_RES, LINEA_RES);
    end loop;
    
    file_close(ARCH_EN);  -- cierra el archivo
    file_close(ARCH_RES);  -- cierra el archivo
    wait;
    end process;
END;
