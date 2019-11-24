-- Module Name:    Condicion - Behavioral 
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Condicion_UC  is
    Port ( Rflags : in  STD_LOGIC_VECTOR (3 downto 0);
           eq,neq,lt,le,g_t,get : out  STD_LOGIC);
end Condicion_UC;

architecture Behavioral of Condicion_UC  is

begin
    --flags[ov,sn,z,c]
    eq <= Rflags(1);
    neq <= not Rflags(1);
    lt <= not Rflags(0);
    le <= not Rflags(0) or Rflags(1);
    g_t <= Rflags(0) and not Rflags(1);
    get <= Rflags(0);

end Behavioral;

