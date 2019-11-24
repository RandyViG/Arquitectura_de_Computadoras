-- Module Name:    Alu_1bit - Behavioral 
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library WORK;
use WORK.ALU.ALL;

entity Alu_1bit is
   Port ( a,b,cin,sela,selb : in  STD_LOGIC;
           op : in  STD_LOGIC_VECTOR (1 downto 0);
           s,cout : out  STD_LOGIC);
end Alu_1bit;

architecture Behavioral of Alu_1bit is
signal Aaux, Baux , auxAnd, auxOr, auxXor,auxSuma: std_logic;
begin

Aaux <= a xor sela;
Baux <= b xor selb;
auxAnd <= Aaux and Baux;
auxOr <= Aaux or Baux;
auxXor <= Aaux xor Baux;

suma : sumador_1bit port map (
    a => Aaux,
    b => Baux,
    cin => cin,
    s=> auxSuma,
    cout => cout
    );
    
    process(op,auxAnd,auxXor,auxOr,auxSuma)
    begin
        case op is
            when "00" => s <= auxAnd;
            when "01" => s <= auxOr;
            when "10" => s <= auxXor;
            when others => s <= auxSuma;
            end case;  
    end process;
end Behavioral;

