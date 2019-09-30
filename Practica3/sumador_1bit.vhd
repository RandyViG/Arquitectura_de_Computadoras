-- Module Name:    suma_resta_1bit - Behavioral 
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sumador_1bit is
    Port ( a,b,cin : in  STD_LOGIC;
           s,cout : out  STD_LOGIC);
end sumador_1bit;

architecture Behavioral of sumador_1bit is

begin
    s <= a xor b xor cin;
    cout <= (b and cin) or (a and cin) or (a and b);

end Behavioral;

