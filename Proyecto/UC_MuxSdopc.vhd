library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MuxSdopc_UC is
    Port ( 
        Opcode : in  STD_LOGIC_VECTOR (4 downto 0);
        sdopc : in  STD_LOGIC;
        salida : out  STD_LOGIC_VECTOR (4 downto 0));
end MuxSdopc_UC;

architecture Behavioral of MuxSdopc_UC is

constant ceros : std_logic_vector(4 downto 0):="00000";
begin
    with sdopc select  
        salida <= 
        Opcode when '1',
        ceros when others;
                
end Behavioral;

