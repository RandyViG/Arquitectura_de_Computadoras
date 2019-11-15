library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux2C is
    Port ( 
        microFuncion,microOpcode : in  STD_LOGIC_VECTOR (19 downto 0);
        sm : in  STD_LOGIC;
        s : out  STD_LOGIC_VECTOR (19 downto 0));
end Mux2C;

architecture Behavioral of Mux2C is
begin

with sm select  
    s <=  microFuncion when '1' ,
    microOpcode when others;

end Behavioral;

