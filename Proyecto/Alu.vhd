-- Module Name:    Alu_Nbits - Behavioral 
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library WORK;
use WORK.ALU.ALL;

entity Alu_16bits is    
    Port ( 
        a,b : in  STD_LOGIC_VECTOR (15 downto 0);
        aluop : in STD_LOGIC_VECTOR	 (3 downto 0);
        s : out  STD_LOGIC_VECTOR (15 downto 0);
        flags : out STD_LOGIC_VECTOR (3 downto 0)	
    );
end Alu_16bits;

architecture Behavioral of Alu_16bits is

signal c: std_logic_vector (16 downto 0);
signal sAux: std_logic_vector (15 downto 0);
signal sn: std_logic;

begin
     --aluop  [SelA , SelB, Op1, OP2 ]
    c(0) <= aluop(2);
    ciclo: for i in 0 to 15 generate 
        Al1: Alu_1bit Port map ( 
            a => a(i) ,
            b => b(i),
            cin => c(i),
            op=> aluop (1 downto 0),
            sela => aluop(3),
            selb => aluop(2),
            s=>sAux(i),
            cout => c(i+1)
        );
    end generate;
    s<=sAux;
    
    process(aluop,c,sAux)
    variable ov, carry ,z: std_logic;
    begin
        case aluop(1 downto 0) is
            when "11" => 
                ov := c(16) xor c(15);
                carry := c(16);
            when others => 
                ov := '0';
                carry := '0';
        end case;
                        
        z := sAux(15);
        zero: for j in 14 downto 0 loop
            z :=  z or sAux(j);
        end loop; 
        flags(0) <= carry;
        flags(1)<= not z;
        flags(3) <= ov;
    end process;
    sn <= sAux(15);
    flags(2)<=sn;
		
		
end Behavioral;

