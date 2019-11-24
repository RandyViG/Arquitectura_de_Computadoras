library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MultiplexorSm_UC is
    Port ( 
        microFuncion,microOpcode : in  STD_LOGIC_VECTOR (19 downto 0);
        sm : in  STD_LOGIC;
        s : out  STD_LOGIC_VECTOR (19 downto 0));
end MultiplexorSm_UC  ;

architecture Behavioral of MultiplexorSm_UC    is
begin

with sm select  
    s <=  microFuncion when '0' ,
    microOpcode when others;

end Behavioral;

