library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Multiplexor2C_AR is
    Port ( 
        bs,dato : in  STD_LOGIC_VECTOR (15 downto 0);
        she : in  STD_LOGIC;
        sal : out  STD_LOGIC_VECTOR (15 downto 0));
end Multiplexor2C_AR;

architecture Behavioral of Multiplexor2C_AR is
begin

with she select  sal <= 
    bs when '1' ,
    dato when others;

end Behavioral;

