-- VHDL Test Bench Created by ISE for module: main
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_arith.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;
LIBRARY STD;
USE STD.TEXTIO.ALL;
USE ieee.std_logic_TEXTIO.ALL;	--PERMITE USAR STD_LOGIC 
 
ENTITY tb_UnidadControl IS
END tb_UnidadControl;
 
ARCHITECTURE behavior OF tb_UnidadControl IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT main
    PORT(
         clk : IN  std_logic;
         clr : IN  std_logic;
         lf : IN  std_logic;
         cOperacion : IN  std_logic_vector(4 downto 0);
         cFuncion : IN  std_logic_vector(3 downto 0);
         flags : IN  std_logic_vector(3 downto 0);
         s : OUT  std_logic_vector(19 downto 0)
        );
    END COMPONENT;
    

    --Inputs
    signal clk : std_logic := '0';
    signal clr : std_logic := '0';
    signal lf : std_logic := '0';
    signal cOperacion : std_logic_vector(4 downto 0) := (others => '0');
    signal cFuncion : std_logic_vector(3 downto 0) := (others => '0');
    signal flags : std_logic_vector(3 downto 0) := (others => '0');

    --Outputs
    signal s : std_logic_vector(19 downto 0);

    -- Clock period definitions
    constant clk_period : time := 10 ns;
 
BEGIN
 
    -- Instantiate the Unit Under Test (UUT)
    uut: main PORT MAP (
        clk => clk,
        clr => clr,
        lf => lf,
        cOperacion => cOperacion,
        cFuncion => cFuncion,
        flags => flags,
        s => s
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
        file ARCH_EN : TEXT; --Apuntadores tipo rxt
            VARIABLE LINEA_EN: line;
            VARIABLE VAR_opcode : STD_LOGIC_VECTOR(4 DOWNTO 0);
            VARIABLE VAR_funcode, VAR_flags : STD_LOGIC_VECTOR(3 DOWNTO 0);
            VARIABLE VAR_LF,VAR_NA,VAR_CLR:STD_LOGIC;
            VARIABLE  CADENA : STRING(1 TO 7);
            VARIABLE  CADENA2 : STRING(1 TO 16);
            VARIABLE VAR_S: STD_LOGIC_VECTOR(19 downto 0);
        begin		
        --Los Archivos ya deben de existir
            file_open(ARCH_EN, "Estimulos.txt", READ_MODE); 
            file_open(ARCH_RES, "Resultado.txt", WRITE_MODE);
    
            CADENA := "OP_CODE";
            write(LINEA_RES, CADENA, left, CADENA'LENGTH+1);--ESCRIBE LA CADENA "OP_CODE"
            CADENA := "FUNCODE";
            write(LINEA_RES, CADENA, left, CADENA'LENGTH+1);--ESCRIBE LA CADENA "FUN_CODE"
            CADENA := "FLAGS  ";
            write(LINEA_RES, CADENA, left, CADENA'LENGTH+1);--ESCRIBE LA CADENA "FLAGS"
            CADENA := "CLR    ";
            write(LINEA_RES, CADENA, left, CADENA'LENGTH+1);--ESCRIBE LA CADENA "CLR"
            CADENA := "LF     ";
            write(LINEA_RES, CADENA, left, CADENA'LENGTH+1);--ESCRIBE LA CADENA "LF"
            CADENA2 := "Microinstruccion";
            write(LINEA_RES, CADENA2, left, CADENA2'LENGTH+5);--ESCRIBE LA CADENA "Microinstruccion"
            CADENA := "Nivel  ";
            write(LINEA_RES, CADENA, left, CADENA'LENGTH+1);--ESCRIBE LA CADENA "Nivel"
    
            writeline(ARCH_RES,LINEA_RES);-- escribe la linea en el archivo
    
            clr<='1';
            wait until falling_edge(clk);
            clr<='0';		
    
            while not endfile(arch_en) loop
                wait until rising_edge(clk);
        
                readline(arch_en,linea_en); -- lee una linea completa	
                --Lee op_code
                read(linea_en,VAR_opcode);
                cOperacion<=VAR_opcode;
                --Lee fun_code
                read(linea_en, VAR_funcode);
                cFuncion<=Var_funcode;
                read(linea_en, VAR_flags);
                flags<=VAR_flags;
                read(linea_en, VAR_LF);
                lf<= VAR_LF;
                CADENA:="ALTO   ";
                VAR_CLR:=clr;
                wait for 4 ns;
                VAR_S:=s;
                write(LINEA_RES,VAR_opcode,left,  8); 		
                write(LINEA_RES,VAR_funcode,left, 8); 		
                write(LINEA_RES,VAR_flags,left, 8);
                write(LINEA_RES,clr,left, 7); 
                write(LINEA_RES,VAR_LF,left, 8);
                write(LINEA_RES,VAR_S,left,22);
                write(LINEA_RES,CADENA,left,5);
                writeline(arch_res,LINEA_RES);
        
                wait until falling_edge(clk);
        
                lf<= VAR_LF;
                CADENA:="BAJO   ";
                VAR_CLR:=CLR;
                wait for 4 ns;
                VAR_S:=s;
                write(LINEA_RES,VAR_opcode,left,  8); 		
                write(LINEA_RES,VAR_funcode,left, 8); 		
                write(LINEA_RES,VAR_flags,left, 8);	
                write(LINEA_RES,VAR_CLR,left, 7); 
                write(LINEA_RES,VAR_LF,left, 8);
                write(LINEA_RES,VAR_S,left,22);
                write(LINEA_RES,CADENA,left,5);
                writeline(arch_res,LINEA_RES);
        
            end loop;
    
            file_close(ARCH_EN);  -- cierra el archivo
            file_close(ARCH_RES);  -- cierra el archivo
    
        wait;
   end process;
END;
