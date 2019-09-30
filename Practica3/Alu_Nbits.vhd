-- Module Name:    Alu_Nbits - Behavioral 
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Alu_Nbits is
    generic (
        N : integer := 4
    );
    
    Port ( 
        a,b : in  STD_LOGIC_VECTOR (N-1 downto 0);
        aluop : in STD_LOGIC_VECTOR	 (3 downto 0);
        s : out  STD_LOGIC_VECTOR (N-1 downto 0);
        flags : out STD_LOGIC_VECTOR (3 downto 0)	
    );
end Alu_Nbits;

architecture Behavioral of Alu_Nbits is
signal c: std_logic_vector (N downto 0);
signal sAux: std_logic_vector (N-1 downto 0);
signal sn: std_logic;

component Alu_1bit is
   Port ( 
        a,b,cin,sela,selb : in  STD_LOGIC;
        op : in  STD_LOGIC_VECTOR (1 downto 0);
        s,cout : out  STD_LOGIC
    );
end component;

begin
     --aluop  [SelA , SelB, Op1, OP2 ]
    c(0) <= aluop(2);
    ciclo: for i in 0 to N-1 generate 
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
                ov := c(N) xor c(N-1);
                carry := c(N);
            when others => 
                ov := '0';
                carry := '0';
        end case;
                        
        z := sAux(N-1);
        zero: for j in N-2 downto 0 loop
            z :=  z or sAux(j);
        end loop; 
        flags(0) <= carry;
        flags(1)<= not z;
        flags(3) <= ov;
    end process;
    sn <= sAux(N-1);
    flags(2)<=sn;
		
end Behavioral;

