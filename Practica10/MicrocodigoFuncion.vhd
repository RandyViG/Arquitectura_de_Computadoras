-- Module Name:    MicrocodigoFuncion - Behavioral 
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_arith.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;

entity MicrocodigoFuncion is
    Port ( dir : in  STD_LOGIC_VECTOR (3 downto 0);
           microFuncion : out  STD_LOGIC_VECTOR (19 downto 0));
end MicrocodigoFuncion;

architecture Behavioral of MicrocodigoFuncion is
type arreglo is array ( 0 to (2**4)-1 ) of std_logic_vector(19 downto 0);
constant aux : arreglo := (
    "00000100010000110011",
    "00000100010001110011",
    "00000100010000000011",
    "00000100010000010011",
    "00000100010000100011",
    "00000100010011010011",
    "00000100010011000011",
    "00000100010010100011",
    "00000100010011010011",
    "00000001110000000000",
    "00000000110000000000",
    others => (others => '0')
);
begin
    microFuncion <= aux(conv_integer(dir));	
end Behavioral;

