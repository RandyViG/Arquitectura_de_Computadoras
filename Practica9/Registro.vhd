-- Module Name:    Registro - Behavioral 

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity Registro is
    Port ( la,ea,clk,clr : in  STD_LOGIC;
           dato : in  STD_LOGIC_VECTOR (8 downto 0);
           A : out  STD_LOGIC_VECTOR (8 downto 0));
end Registro;

architecture Behavioral of Registro is
signal auxA: std_logic_vector(8 downto 0);
begin
process(la,ea,clk,clr)

begin
    if (clr='1') then
        auxA<="000000000";
    elsif (clk'event and clk='1') then
        if (la='0' and ea='0') then
            auxA<=auxA;
        elsif ( la='1' and ea='0') then
            auxA<= dato;
        elsif (la='0' and ea='1') then
            auxA<= to_stdlogicvector( to_bitvector( auxA ) srl 1 );
        end if;
    end if;
end process;
A<=auxA;

end Behavioral;

