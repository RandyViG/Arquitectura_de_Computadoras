-- VHDL Test Bench Created by ISE for module: Archivo_Registro
LIBRARY ieee;
LIBRARY STD;
USE STD.TEXTIO.ALL;
USE ieee.std_logic_TEXTIO.ALL;	--PERMITE USAR STD_LOGIC 

USE ieee.std_logic_1164.ALL;
 USE ieee.std_logic_UNSIGNED.ALL;
USE ieee.std_logic_ARITH.ALL;

ENTITY tb_Archivo_registro IS
END tb_Archivo_registro;
 
ARCHITECTURE behavior OF tb_Archivo_registro IS 
 
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
    file arch_res : TEXT;	--Apuntadores tipo txt									
    variable linea_res : line;
    variable var_read_data1 : STD_LOGIC_VECTOR(15 DOWNTO 0);
    variable var_read_data2 : STD_LOGIC_VECTOR(15 DOWNTO 0);
    
    file arch_en : TEXT; --Apuntadores tipo rxt
    variable linea_en: line;
    variable var_write : STD_LOGIC_VECTOR(15 DOWNTO 0);
    variable var_wr, var_she, var_dir, var_clr : STD_LOGIC;
    variable var_write_reg, var_read_reg1, var_read_reg2, var_shamt:STD_LOGIC_VECTOR (3 downto 0);
    variable var_write_data : STD_LOGIC_VECTOR (15 downto 0);
    variable  cadena : STRING(1 TO 5);
   
    begin
        file_open(arch_en, "Estimulos.txt", READ_MODE); 
        file_open(arch_res, "Resultado.txt", WRITE_MODE);	
    
        cadena := "  RR1";
        write(linea_res, cadena, right, cadena'LENGTH+1);--ESCRIBE LA cadena "read_reg1"
        cadena := "  RR2";
        write(linea_res, cadena, right, cadena'LENGTH+1);--ESCRIBE LA cadena "read_reg2"
        cadena := "shamt";
        write(linea_res, cadena, right, cadena'LENGTH+1);--ESCRIBE LA cadena "shamt"
        cadena := " WREG";
        write(linea_res, cadena, right, cadena'LENGTH+1);--ESCRIBE LA cadena "write_reg"
        cadena := "   WD";
        write(linea_res, cadena, right, cadena'LENGTH+1);--ESCRIBE LA cadena "write_data"
        cadena := "   WR";
        write(linea_res, cadena, right, cadena'LENGTH+1);--ESCRIBE LA cadena "WR"
        cadena := "  SHE";
        write(linea_res, cadena, right, cadena'LENGTH+1);--ESCRIBE LA cadena "SHE"
        cadena := "  DIR";
        write(linea_res, cadena, right, cadena'LENGTH+1);--ESCRIBE LA cadena "DIR"
        cadena := "  RD1";
        write(linea_res, cadena, right, cadena'LENGTH+1);--ESCRIBE LA cadena "READ_DATA1"
        cadena := "  RD2";
        write(linea_res, cadena, right, cadena'LENGTH+1);--ESCRIBE LA cadena "READ_DATA2"

        writeline(arch_res,linea_res);-- escribe la linea en el archivo
    
        WAIT FOR 100 NS;
    
        FOR I IN 0 TO 16 LOOP
            readline(arch_en,linea_en); -- lee una linea completa
            --Lee read_r1
            Hread(linea_en, var_read_reg1);
            read_reg1<= var_read_reg1;
            --Lee read_r2
            Hread(linea_en, var_read_reg2);
            read_reg2<= var_read_reg2;
            --Lee shamt
            Hread(linea_en, var_shamt);
            shamt<= var_shamt;
            --Lee write_reg
            Hread(linea_en, var_write_reg);
            write_reg<= var_write_reg;
            --Lee write_data
            Hread(linea_en, var_write_data);
            write_data<= var_write_data;
            --Lee wr
            read(linea_en, var_wr);
            WR <= var_wr;
            --Lee she
            read(linea_en, var_she);
            SHE <= var_she;
            --Lee dir
            read(linea_en, var_dir);
            DIR <= var_dir;
            --Lee clr
            read(linea_en, var_clr);
            CLR <= var_clr;
            WAIT UNTIL RISING_EDGE(clk);--ESPERA AL FLANCO DE SUBIDA 
            var_read_data1 := READ_DATA1;
            var_read_data2 := READ_DATA2; 
            Hwrite(linea_res, var_read_reg1, right, 5);--ESCRIBE EL CAMPO RR1
            Hwrite(linea_res, var_read_reg2, right, 5);--ESCRIBE EL CAMPO RR2
            Hwrite(linea_res, var_shamt, right, 5);--ESCRIBE EL CAMPO shamt
            Hwrite(linea_res, var_write_reg, right, 8);--ESCRIBE EL CAMPO WREG
            Hwrite(linea_res, var_write_data, right, 8);--ESCRIBE EL CAMPO WD
            write(linea_res, var_wr, right, 5);--ESCRIBE EL CAMPO WR
            write(linea_res, var_she,right, 5);--ESCRIBE EL CAMPO SHE
            write(linea_res, var_dir,right, 6);--ESCRIBE EL CAMPO DIR
            hwrite(linea_res, var_read_data1,right, 8);--ESCRIBE EL CAMPO RD1
            Hwrite(linea_res, var_read_data2,right, 5);--ESCRIBE EL CAMPO RD2
            writeline(arch_res,linea_res);-- escribe la linea en el archivo
        
        end loop;
        file_close(arch_en);  -- cierra el archivo
        file_close(arch_res);  -- cierra el archivo
    
      --wait for clk_period*10;
      wait;
   end process;

END;
