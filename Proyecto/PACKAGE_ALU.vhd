library IEEE;
use IEEE.STD_LOGIC_1164.all;

package ALU is

component Alu_1bit is
   Port ( a,b,cin,sela,selb : in  STD_LOGIC;
           op : in  STD_LOGIC_VECTOR (1 downto 0);
           s,cout : out  STD_LOGIC);
end component;

component sumador_1bit is
    Port ( a,b,cin : in  STD_LOGIC;
           s,cout : out  STD_LOGIC);
end component;
end ALU;

package body ALU is
 
end ALU;
