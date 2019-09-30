library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux2C is
    Port ( 
        bs,dato : in  STD_LOGIC_VECTOR (15 downto 0);
        she : in  STD_LOGIC;
        sal : out  STD_LOGIC_VECTOR (15 downto 0));
end Mux2C;

architecture Behavioral of Mux2C is
begin

with she select  sal <= 
    bs when '1' ,
    dato when others;

end Behavioral;

