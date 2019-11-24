-- Module Name:    DecodificadorInstruccion - Behavioral 
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DecodificadorInstruccion_UC is
    Port ( opcode : in  STD_LOGIC_VECTOR (4 downto 0);
           tipo_r,beqi,bneqi,blti,bleti,bgti,bgeti : out  STD_LOGIC);
end DecodificadorInstruccion_UC;

architecture Behavioral of DecodificadorInstruccion_UC is

begin

    process (opcode)
    begin
    CASE opcode IS
        WHEN "00000" => 
            tipo_r<='1';
            beqi<='0';
            bneqi<='0';
            blti<='0';
            bleti<='0';
            bgti<='0';
            bgeti<='0';
        WHEN "01101" => 
            tipo_r<='0';
            beqi<='1';
            bneqi<='0';
            blti<='0';
            bleti<='0';
            bgti<='0';
            bgeti<='0';
        WHEN "01110" => 
            tipo_r<='0';
            beqi<='0';
            bneqi<='1';
            blti<='0';
            bleti<='0';
            bgti<='0';
            bgeti<='0';
        WHEN "01111" => 
            tipo_r<='0';
            beqi<='0';
            bneqi<='0';
            blti<='1';
            bleti<='0';
            bgti<='0';
            bgeti<='0';
        WHEN "10000" => 
            tipo_r<='0';
            beqi<='0';
            bneqi<='0';
            blti<='0';
            bleti<='1';
            bgti<='0';
            bgeti<='0';
        WHEN "10001" => 
            tipo_r<='0';
            beqi<='0';
            bneqi<='0';
            blti<='0';
            bleti<='0';
            bgti<='1';
            bgeti<='0';
        WHEN "10010" => 
            tipo_r<='0';
            beqi<='0';
            bneqi<='0';
            blti<='0';
            bleti<='0';
            bgti<='0';
            bgeti<='1';
        WHEN OTHERS => 
            tipo_r<='0';
            beqi<='0';
            bneqi<='0';
            blti<='0';
            bleti<='0';
            bgti<='0';
            bgeti<='0';
    END CASE;
    
    end process;
    
end Behavioral;

