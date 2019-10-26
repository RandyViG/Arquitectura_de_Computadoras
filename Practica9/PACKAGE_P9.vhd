
--	Package File Template
library IEEE;
use IEEE.STD_LOGIC_1164.all;

package PACKAGE_P9 is

component CartaASM is
    Port ( a0,z,ini,clk,clr : in  STD_LOGIC;
           la,ea,lb,eb,ec : out  STD_LOGIC	
			  );
end component;

component Contador is
    Port ( clk,clr,lb,eb : in  STD_LOGIC;
           b: inout  STD_LOGIC_VECTOR (3 downto 0));
end component;

component Decodificador is
    Port ( b : in  STD_LOGIC_VECTOR (3 downto 0);
           num_out : out  STD_LOGIC_VECTOR (6 downto 0));
end component;

component DivisorFrecuencia is
    Port ( clk,clr : in  STD_LOGIC;
           clk_out : out  STD_LOGIC);
end component;

component Multiplexor is
    Port ( num : in  STD_LOGIC_VECTOR (6 downto 0);
           ec : in STD_LOGIC;
           display : out  STD_LOGIC_VECTOR (6 downto 0));
end component;

component Registro is
    Port ( la,ea,clk,clr : in  STD_LOGIC;
           dato : in  STD_LOGIC_VECTOR (8 downto 0);
           A : out  STD_LOGIC_VECTOR (8 downto 0));
end component;


end PACKAGE_P9;

package body PACKAGE_P9 is

 
end PACKAGE_P9;
