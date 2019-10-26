-- Module Name:    Contador - Behavioral 
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Contador is
    Port ( clk,clr,lb,eb : in  STD_LOGIC;
           b: out  STD_LOGIC_VECTOR (3 downto 0));
end Contador;

architecture Behavioral of Contador is
constant cero: std_logic_vector(3 downto 0):="0000";
--signal b: std_logic_vector(3 downto 0):="0000";
begin

process(clk,clr,lb,eb)
variable auxb: std_logic_vector(3 downto 0);
begin
    if (clr = '1') then
        b<="0000";
    elsif( clk'event and clk ='1' ) then
        if (lb='0' and eb='0') then
            auxb:=auxb;
        elsif ( lb='1' and eb='0') then
            auxb:=cero;
        elsif ( lb='0' and eb='1') then
            auxb:= auxb+1;
        end if;
    end if;
    b<=auxb;
end process;

end Behavioral;

