-- Module Name:    DivisorFrecuencia - Behavioral 

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity DivisorFrecuencia is
    Port ( clk,clr : in  STD_LOGIC;
           clk_out : out  STD_LOGIC);
end DivisorFrecuencia;

architecture Behavioral of DivisorFrecuencia is
signal contador: std_logic_vector(27 downto 0):=x"0000000";
begin
    process(clk,clr)
    begin
        if (clr='1') then
            contador<=x"0000000";
        elsif ( clk'event and clk='1') then
            contador <= contador + 1;
        end if;
    end process;
    clk_out<=contador(27);
end Behavioral;

