-- Module Name:    ExtensorSigno - Behavioral 
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ExtensorSigno is
    Port ( Slit_in : in  STD_LOGIC_VECTOR (11 downto 0);
           Slit_out : out  STD_LOGIC_VECTOR (15 downto 0)
    );
end ExtensorSigno;

architecture Behavioral of ExtensorSigno is
signal lit: std_logic_vector(15 downto 0);
signal signo : std_logic;
begin
    
    signo <= Slit_in(11);
    lit(15) <= signo;
    lit(14) <= signo;
    lit(13) <= signo;
    lit(12) <= signo;
    lit(11 downto 0) <= Slit_in;
    Slit_out <= lit;

end Behavioral;

