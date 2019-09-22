-- Module Name:    suma_resta_1bit - Behavioral 
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity suma_resta_1bit is
    Port ( 
        a,b,cin,c0 : in  STD_LOGIC;
        s,cout : out  STD_LOGIC
    );
end suma_resta_1bit;

architecture A_suma_resta_1bit of suma_resta_1bit is
 signal eb : std_logic;
begin
    eb <= b xor c0;
	s <= a xor eb xor cin;
	cout <= (eb and cin) or (a and cin) or (a and eb);

end A_suma_resta_1bit;

