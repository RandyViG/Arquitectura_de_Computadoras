-- Module Name:    Multiplexor_4bits - Behavioral 
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Multiplexor_4bits is
    Port (  data_in1, data_in2 : in  STD_LOGIC_VECTOR (3 downto 0);
            selec : in STD_LOGIC;	
            data_out : out  STD_LOGIC_VECTOR (3 downto 0));
end Multiplexor_4bits;

architecture Behavioral of Multiplexor_4bits is

begin

    with selec select  
    data_out <= data_in1 when '0' ,
    data_in2 when others;

end Behavioral;

