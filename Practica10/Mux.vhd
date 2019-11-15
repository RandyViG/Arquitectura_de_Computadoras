library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux is
    Port ( 
        Opcode : in  STD_LOGIC_VECTOR (4 downto 0);
        sdopc : in  STD_LOGIC;
        salida : out  STD_LOGIC_VECTOR (4 downto 0));
end Mux;

architecture A_Mux of Mux is

constant ceros : std_logic_vector(4 downto 0):="00000";
begin
    with sdopc select  
        salida <= 
            Opcode when '1',
            ceros when others;
                
end A_Mux;

