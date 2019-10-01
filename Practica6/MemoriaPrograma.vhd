
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_arith.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;

entity MemoriaPrograma is
    generic(
        bus_datos: Integer:=12;
        instruccion : Integer :=25
    );
    Port ( 
        dir : in  STD_LOGIC_VECTOR (bus_datos-1 downto 0);
        dout : out  STD_LOGIC_VECTOR (instruccion-1 downto 0));
end MemoriaPrograma;

architecture Behavioral of MemoriaPrograma is
constant op_li : std_logic_vector(4 downto 0) := "00001";
constant op_bgti : std_logic_vector(4 downto 0):="10001";
constant op_swi : std_logic_vector(4 downto 0):="00011";
constant op_b : std_logic_vector(4 downto 0):="10011";
constant op_nop: std_logic_vector(4 downto 0):="10110";

constant r0 : std_logic_vector(3 downto 0) := "0000";
constant r1 : std_logic_vector(3 downto 0) := "0001";
constant r2 : std_logic_vector(3 downto 0) := "0010";

constant su : std_logic_vector(3 downto 0) := "0000";

type arreglo is array ( 0 to (2**bus_datos)-1 ) of std_logic_vector(24 downto 0);
constant aux : arreglo := (
op_li & r0 & x"0023",       --li r0, 23
op_li & r1 & x"FFd3",       -- li r1,-45
op_li & r2 & x"0165",       --li r2, 165
op_bgti & r1 & r0 & x"006", --BGTI R1,R0,5
op_bgti & r2 & r1 & x"003", --BGTI R2,R1,3
op_swi & r2 & x"0020",      --SWI, R2, 0x20
op_b & su & x"000D",        --B PC = 13
op_swi & r1 & x"0020",      --SWI, R1, 0x20
op_b & su & x"000D",        --B PC = 13
op_bgti & r2 & r0 & x"003", --BGTI R2,R0,3
op_swi & r2 & x"0020",      --SWI, R2, 0x20
op_b & su & x"000D",        --B PC = 13
op_swi & r0 & x"0020",      --SWI, R0, 0x20
op_nop & su & su &su & su & su, --NOP
op_b & su & x"000D",        --B PC = 13
others => (others => '0')
);
begin

	dout <= aux(conv_integer(dir));

end Behavioral;

