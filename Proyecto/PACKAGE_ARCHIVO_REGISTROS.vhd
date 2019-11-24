
library IEEE;
use IEEE.STD_LOGIC_1164.all;

package ARCHIVO_REGISTROS is

component Demultiplexor_AR is
    Port ( 
        d : in  STD_LOGIC;
        l : out std_logic_vector(15 downto 0);
        seldemux : in  STD_LOGIC_VECTOR (3 downto 0));
end component;

component Registro_AR is
    Port ( 
        d : in  STD_LOGIC_VECTOR ( 15 downto 0 );
        q : out  STD_LOGIC_VECTOR ( 15 downto 0 );
        clk,clr,l : in  STD_LOGIC);
end component;

component Multiplexor16C_AR is
    Port ( 
        cn0, cn1,cn2,cn3,cn4,cn5,cn6,
        cn7, cn8,cn9,cn10,cn11,cn12,cn13,
        cn14,cn15 : in  STD_LOGIC_VECTOR (15 downto 0);
        sel : in  STD_LOGIC_VECTOR ( 3 downto 0);
        salida : out  STD_LOGIC_VECTOR (15 downto 0));
end component;

component barrel_shifter is
    Port ( 
        dato : in  STD_LOGIC_VECTOR (15 downto 0);
        salida : out  STD_LOGIC_VECTOR (15 downto 0);
        sh : in  STD_LOGIC_VECTOR (3 downto 0);
        dir : in STD_LOGIC
    );
end component;

component Multiplexor2C_AR is
    Port ( 
        bs,dato : in  STD_LOGIC_VECTOR (15 downto 0);
        she : in  STD_LOGIC;
        sal : out  STD_LOGIC_VECTOR (15 downto 0));
end component;



end ARCHIVO_REGISTROS;

package body ARCHIVO_REGISTROS is

 
end ARCHIVO_REGISTROS;
