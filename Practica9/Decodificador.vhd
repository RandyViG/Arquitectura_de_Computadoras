-- Module Name:    Decodificador - Behavioral 
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Decodificador is
    Port ( b : in  STD_LOGIC_VECTOR (3 downto 0);
           num_out : out  STD_LOGIC_VECTOR (6 downto 0));
end Decodificador;

architecture Behavioral of Decodificador is

constant dig0: std_logic_vector(6 downto 0):= "0000001";
constant dig1: std_logic_vector(6 downto 0):= "1001111";
constant dig2: std_logic_vector(6 downto 0):= "0010010";
constant dig3: std_logic_vector(6 downto 0):= "0000110";
constant dig4: std_logic_vector(6 downto 0):= "1001100";
constant dig5: std_logic_vector(6 downto 0):= "0100100";
constant dig6: std_logic_vector(6 downto 0):= "0100000";
constant dig7: std_logic_vector(6 downto 0):= "0001110";
constant dig8: std_logic_vector(6 downto 0):= "0000000";
constant dig9: std_logic_vector(6 downto 0):= "0001100";

begin
    
    process (b)
    begin
    
    CASE b IS
        WHEN "0000" => num_out <= dig0;
        WHEN "0001" => num_out <= dig1;
        WHEN "0010" => num_out <= dig2;
        WHEN "0011" => num_out <= dig3;
        WHEN "0100" => num_out <= dig4;
        WHEN "0101" => num_out <= dig5;
        WHEN "0110" => num_out <= dig6;
        WHEN "0111" => num_out <= dig7;
        WHEN "1000" => num_out <= dig8;
        WHEN OTHERS => num_out <= dig9;
    END CASE;
    
    end process;

end Behavioral;

