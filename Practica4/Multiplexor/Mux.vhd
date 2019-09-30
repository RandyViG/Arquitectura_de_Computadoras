library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux is
    generic ( 
        I : integer := 16 
    );
    Port ( 
        cn0, cn1,cn2,cn3,cn4,cn5,cn6,
        cn7, cn8,cn9,cn10,cn11,cn12,cn13,
        cn14,cn15 : in  STD_LOGIC_VECTOR (I-1 downto 0);
        sel : in  STD_LOGIC_VECTOR ( 3 downto 0);
        salida : out  STD_LOGIC_VECTOR (I-1 downto 0));
end Mux;

architecture A_Mux of Mux is

begin
    with sel select  salida <= 
        cn0 when "0000",
        cn1 when "0001",
        cn2 when "0010",
        cn3 when "0011",
        cn4 when "0100",
        cn5 when "0101",
        cn6 when "0110",
        cn7 when "0111",
        cn8 when "1000",
        cn9 when "1001",
        cn10 when "1010",
        cn11 when "1011",
        cn12 when "1100",
        cn13 when "1101",
        cn14 when "1110",
        cn15 when others;
                
end A_Mux;

