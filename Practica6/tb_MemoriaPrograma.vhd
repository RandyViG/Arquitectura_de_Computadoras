-- VHDL Test Bench Created by ISE for module: MemoriaPrograma
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.all;
USE IEEE.STD_LOGIC_unsigned.ALL;
LIBRARY STD;
USE STD.TEXTIO.ALL;
USE ieee.std_logic_TEXTIO.ALL;	--PERMITE USAR STD_LOGIC 
 
 
ENTITY tb_MemoriaPrograma IS
END tb_MemoriaPrograma;
 
ARCHITECTURE behavior OF tb_MemoriaPrograma IS 
 
    COMPONENT MemoriaPrograma
    PORT(
         dir : IN  std_logic_vector(11 downto 0);
         dout : OUT  std_logic_vector(24 downto 0)
        );
    END COMPONENT;
  
   --Inputs
   signal dir : std_logic_vector(11 downto 0) := (others => '0');

    --Outputs
   signal dout : std_logic_vector(24 downto 0);
 
BEGIN
    -- Instantiate the Unit Under Test (UUT)
   uut: MemoriaPrograma PORT MAP (
          dir => dir,
          dout => dout
        ); 

   stim_proc: process
    file ARCH_RES : TEXT;	--Apuntadores tipo txt									
        variable LINEA_RES : line;
        variable VAR_dout : STD_LOGIC_VECTOR(24 DOWNTO 0);
        variable A : STD_LOGIC_VECTOR(11 downto 0);
        
        VARIABLE  CADENA : STRING(1 TO 6);
   begin
        file_open(ARCH_RES, "Resultado.txt", WRITE_MODE);	
        CADENA := "A     ";
        write(LINEA_RES, CADENA, left, CADENA'LENGTH+1);--ESCRIBE LA CADENA "A"
        CADENA := "OPCODE";
        write(LINEA_RES, CADENA, left, CADENA'LENGTH+1);--ESCRIBE LA CADENA "OPCODE"
        CADENA := "19..16";
        write(LINEA_RES, CADENA, left, CADENA'LENGTH+1);--ESCRIBE LA CADENA "19...16"
        CADENA := "15..12";
        write(LINEA_RES, CADENA, left, CADENA'LENGTH+1);--ESCRIBE LA CADENA "15..12"
        CADENA := "11...8";
        write(LINEA_RES, CADENA, left, CADENA'LENGTH+1);--ESCRIBE LA CADENA "11...8"
        CADENA := "7...4 ";
        write(LINEA_RES, CADENA, left, CADENA'LENGTH+1);--ESCRIBE LA CADENA "7...4"
        CADENA := "3...0 ";
        write(LINEA_RES, CADENA, left, CADENA'LENGTH+1);--ESCRIBE LA CADENA "3..0"
    
        writeline(ARCH_RES,LINEA_RES);-- escribe la linea en el archivo
        for i in 0 to 1 loop
            A := x"000";
            for j in 0 to 14 loop
                dir <= A;
                wait for 10 ns;
                VAR_dout := dout;
                Hwrite(LINEA_RES, A, left, 7);--ESCRIBE EL CAMPO A
                write(LINEA_RES, VAR_dout(24 downto 20), left, 8);--ESCRIBE EL CAMPO OPCODE
                write(LINEA_RES, VAR_dout(19 downto 16), left, 7);--ESCRIBE EL CAMPO 19..16
                write(LINEA_RES, VAR_dout(15 downto 12), left, 7);--ESCRIBE EL CAMPO 15..12
                write(LINEA_RES, VAR_dout(11 downto 8), left, 7);--ESCRIBE EL CAMPO 11..8
                write(LINEA_RES, VAR_dout(7 downto 4), left, 7);--ESCRIBE EL CAMPO 7 .. 4
                write(LINEA_RES, VAR_dout(3 downto 0), left, 7);--ESCRIBE EL CAMPO 3 .. 0
                
                writeline(ARCH_RES, LINEA_RES);
                A := A + x"1";
                wait for 10 ns;
            end loop;
            wait for 10 ns;
        end loop;
        
        file_close(ARCH_RES);  -- cierra el archivo
      wait;
   end process;
END;
