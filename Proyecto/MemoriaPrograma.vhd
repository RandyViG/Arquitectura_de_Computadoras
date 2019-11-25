
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_arith.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;

entity MemoriaPrograma is
    Port ( 
        dir : in  STD_LOGIC_VECTOR (15 downto 0);
        dout : out  STD_LOGIC_VECTOR (24 downto 0));
end MemoriaPrograma;

architecture Behavioral of MemoriaPrograma is

--CONSTANTES DE INSTRUCCIONES PARA EL ESCOMips
--Instrucciones tipo R
constant tipo_r : std_logic_vector (4 downto 0) := "00000";
--Carga y Almacenamiento
constant li : std_logic_vector (4 downto 0) := "00001";
constant lwi : std_logic_vector (4 downto 0) := "00010";
constant lw : std_logic_vector (4 downto 0) := "10111";
constant swi : std_logic_vector (4 downto 0) := "00011";
constant sw : std_logic_vector (4 downto 0) := "00100";
--Aritmticas
constant addi : std_logic_vector (4 downto 0) := "00101";
constant subi : std_logic_vector (4 downto 0) := "00110";
--Identificador Aritmticas R
constant add : std_logic_vector (3 downto 0) := "0000";
constant sub : std_logic_vector (3 downto 0) := "0001";
--Logicas
constant andi : std_logic_vector (4 downto 0) := "00111";
constant ori : std_logic_vector (4 downto 0) := "01000";
constant xori : std_logic_vector (4 downto 0) := "01001";
constant nandi : std_logic_vector (4 downto 0) := "01010";
constant nori : std_logic_vector (4 downto 0) := "01011";
constant xnori : std_logic_vector (4 downto 0) := "01100";
--Identificador Logicas R
constant andr : std_logic_vector (3 downto 0) := "0010";
constant orr : std_logic_vector (3 downto 0) := "0011";
constant xorr : std_logic_vector (3 downto 0) := "0100";
constant nandr : std_logic_vector (3 downto 0) := "0101";
constant norr : std_logic_vector (3 downto 0) := "0110";
constant xnorr : std_logic_vector (3 downto 0) := "0111";
constant notr : std_logic_vector (3 downto 0) := "1000";
--Identificador Corrimiento R
constant sllr : std_logic_vector (3 downto 0) := "1001";
constant srlr : std_logic_vector (3 downto 0) := "1010";
constant dos : std_logic_vector (3 downto 0) := "0010";
--Saltos Condicionales e Incondicionales
constant beqi : std_logic_vector (4 downto 0) := "01101";
constant bnei : std_logic_vector (4 downto 0) := "01110";
constant blti : std_logic_vector (4 downto 0) := "01111";
constant bleti : std_logic_vector (4 downto 0) := "10000";
constant bgti : std_logic_vector (4 downto 0) := "10001";
constant bgeti : std_logic_vector (4 downto 0) := "10010";
constant b : std_logic_vector (4 downto 0) := "10011";
--Manejo de Subrutinas
constant call : std_logic_vector (4 downto 0) := "10100";
constant ret : std_logic_vector (4 downto 0) := "10101";
--Otros
constant nop : std_logic_vector (4 downto 0) := "10110";
constant opr : std_logic_vector ( 4 downto 0) := "00000";
constant su : std_logic_vector (3 downto 0) := "0000"; 
--Registros
constant R0 : std_logic_vector (3 downto 0) := "0000";
constant R1 : std_logic_vector (3 downto 0) := "0001";
constant R2 : std_logic_vector (3 downto 0) := "0010";
constant R3 : std_logic_vector (3 downto 0) := "0011";
constant R4 : std_logic_vector (3 downto 0) := "0100";
constant R5 : std_logic_vector (3 downto 0) := "0101";
constant R6 : std_logic_vector (3 downto 0) := "0110";
constant R7 : std_logic_vector (3 downto 0) := "0111";
constant R8 : std_logic_vector (3 downto 0) := "1000";
constant R9 : std_logic_vector (3 downto 0) := "1001";
constant R10 : std_logic_vector (3 downto 0) := "1010";
constant R11 : std_logic_vector (3 downto 0) := "1011";
constant R12 : std_logic_vector (3 downto 0) := "1100";
constant R13 : std_logic_vector (3 downto 0) := "1101";
constant R14 : std_logic_vector (3 downto 0) := "1110";
constant R15 : std_logic_vector (3 downto 0) := "1111";

type arreglo is array ( 0 to (2**9) ) of std_logic_vector(24 downto 0);
constant aux : arreglo := (
------------------------------------------------------------------------
--                  Programa Proyecto 1 Fibonacci
------------------------------------------------------------------------
    LI & R0 & x"0000",	--LI R0 #0
    LI & R1 & x"0001",	--L1 R1 #1
    LI & R2 & x"0000",	--LI R2 #0
    LI & R3 & x"000C",	--LI R3 #12
    tipo_r & R4 & R0 & R1 & SU & add,	--tipo_R R4 R0 R1 SU add
    SWI & R4 & x"0072",	--swi R4 #72 48
    ADDI & R0 & R1 & x"000",	--ADDI R0 R1 #0
    ADDI & R1 & R4 & x"000",	--ADDI R1 R4 #0
    ADDI & R2 & R2 & x"001",	--ADDI R2 R2 #1
    BNEI & R3 & R2 & x"FFB",	--BNEI R2 R3 5 1011
    NOP & SU & SU & SU & SU & SU,--NOP
    b & su & x"FFFF",
    
------------------------------------------------------------------------
--                  Programa Proyecto 2 Burbuja
------------------------------------------------------------------------	 
--	LI & R0 & x"0017",  --LI R0=23			0
--	SWI & R0 & x"000a", --SWI MEM[10]=R0	1
--	LI & R0 & x"0082",  --LI R0=130			2
--	SWI & R0 & x"000b", --SWI MEM[11]=R0	3
--	LI & R0 & x"0046",  --LI R0=70			4
--	SWI & R0 & x"000c", --SWI MEM[12]=R0	5
--	LI & R0 & x"0104",  --LI R0=260			6
--	SWI & R0 & x"000d", --SWI MEM[13]=R0	7
--	LI & R0 & x"002D",  --LI R0=45			8
--	SWI & R0 & x"000e", --SWI MEM[14]=R0	9
--	LI & R0 & x"00B4",  --LI R0=180			10
--	SWI & R0 & x"000f", --SWI MEM[15]=R0	11
--	LI & R0 & x"0000",  --LI R0=0				12
--	LI & R6 & x"0005",  --LI R6=5				13
--	LI & R2 & x"0000",  --LI R2=0				14
--	tipo_r & R5 & R6 & R0 & su & sub, --SUB R5= R6-R0 	15
--	LW & R3 & R2 & x"00a", --LW R3=MEM[10+R2]				16
--	ADDI & R2 & R2 & x"001", --R2=R2+1						17
--	LW & R4 & R2 & x"00a", --LW R4=MEM[10+R2]				18
--	BLETI & R4 & R3 & x"005", --R3 <= R4					19
--	SW & R3 & R2 & x"00a", -- mem[R2+10]=R3				20
--	SUBI & R2 & R2 & x"001", --R2=R2-1						21	
--	SW & R4 & R2 & x"00a", -- mem[R2+10]=R4				22	
--	ADDI & R2 & R2 & x"001", --R2=R2+1						23	
--	BNEI & R5 & R2 & x"FF8", --R2 != R5						24	
--	ADDI & R0 & R0 & x"001", --R0=R0+1						25	
--	BNEI & R6 & R0 & x"FF4", --R0 != R6						26
--	NOP & SU & SU & SU & SU & SU,--NOP						27


    others => (others => '0')
);
begin

    dout <= aux(conv_integer(dir));

end Behavioral;

