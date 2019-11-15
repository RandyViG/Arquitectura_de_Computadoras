-- Module Name:    Condicion - Behavioral 
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Condicion is
    Port ( Rflags : in  STD_LOGIC_VECTOR (3 downto 0);
           eq,neq,lt,le,g_t,get : out  STD_LOGIC);
end Condicion;

architecture Behavioral of Condicion is

begin
    --flags[c,z,sn,ov]
    eq <= Rflags(1);
    neq <= not Rflags(1);
    lt <= not Rflags(0);
    le <= not Rflags(0) or Rflags(1);
    g_t <= Rflags(0) and not Rflags(1);
    get <= Rflags(0);

end Behavioral;

