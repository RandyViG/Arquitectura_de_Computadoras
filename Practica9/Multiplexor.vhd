-- Module Name:    Multiplexor - Behavioral 

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Multiplexor is
    Port ( num : in  STD_LOGIC_VECTOR (6 downto 0);
           ec : in STD_LOGIC;
           display : out  STD_LOGIC_VECTOR (6 downto 0));
end Multiplexor;

architecture Behavioral of Multiplexor is
constant guion : std_logic_vector (6 downto 0) := "1111110";
begin
    with ec select  
    display <= num when '1' ,
   guion when others;
end Behavioral;

