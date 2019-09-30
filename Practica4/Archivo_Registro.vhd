library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Archivo_Registro is
    generic ( 
        i: integer :=16
    );
    Port ( 
        wr,she,dir,clk,clr : in  STD_LOGIC;
        write_reg,read_reg1,read_reg2,shamt : in  STD_LOGIC_VECTOR (3 downto 0);
        write_data : in  STD_LOGIC_VECTOR (15 downto 0);
        read_data1,read_data2 : out  STD_LOGIC_VECTOR (15 downto 0));
end Archivo_Registro;

architecture A_Archivo_Registro of Archivo_Registro is

component Registro is
   Port ( 
    d : in  STD_LOGIC_VECTOR ( i-1 downto 0 );
    q : out  STD_LOGIC_VECTOR ( i-1 downto 0 );
    clk,clr,l : in  STD_LOGIC
   );
end component;

component demux is
   Port ( 
    d : in  STD_LOGIC;
    l : out std_logic_vector( i-1 downto 0);
    seldemux : in  STD_LOGIC_VECTOR (3 downto 0)
   );
end component;

component barrel_shifter is
   Port ( 
    dato : in  STD_LOGIC_VECTOR (i-1 downto 0);
    salida : out  STD_LOGIC_VECTOR (i-1 downto 0);
    sh : in  STD_LOGIC_VECTOR (3 downto 0);
    dir : in STD_LOGIC
    );
end component;

component Mux is
   Port ( 
    cn0, cn1,cn2,cn3,cn4,cn5,cn6,
    cn7, cn8,cn9,cn10,cn11,cn12,cn13,
    cn14,cn15 : in  STD_LOGIC_VECTOR (i-1 downto 0);
    sel : in  STD_LOGIC_VECTOR ( 3 downto 0);
    salida : out  STD_LOGIC_VECTOR (i-1 downto 0)
    );
end component;

component Mux2C is
   Port ( 
    bs,dato : in  STD_LOGIC_VECTOR (i-1 downto 0);
    she : in  STD_LOGIC;
    sal : out  STD_LOGIC_VECTOR (i-1 downto 0)
    );
end component;

signal auxRead_data_2 , auxBs , auxL, auxD: std_logic_vector (i-1 downto 0);

type matrizQ is array (0 to 15) of std_logic_vector(15 downto 0);
signal auxQ : matrizQ;

begin

    demultiplexor: demux Port map ( 
        d => wr,
        l => auxL,
        seldemux => write_reg
	);
	
    registros: for r in 0 to 15 generate
        R1: Registro Port map (
           d => auxD,
           q => auxQ( r ) , 
           clk => clk ,
           clr => clr,
           l => auxL(r)
    );
    end generate;
		
    multiplexor1 : Mux Port map ( 
        cn0 => auxQ(0), 
        cn1 => auxQ(1), 
        cn2 => auxQ(2), 
        cn3 => auxQ(3), 
        cn4 => auxQ(4), 
        cn5 => auxQ(5), 
        cn6 => auxQ(6), 
        cn7 => auxQ(7), 
        cn8 => auxQ(8), 
        cn9 => auxQ(9), 
        cn10 => auxQ(10), 
        cn11 => auxQ(11), 
        cn12 => auxQ(12), 
        cn13 => auxQ(13),  
        cn14 => auxQ(14), 
        cn15 => auxQ(15), 
        sel => read_reg1,
        salida => read_data1
    );

    multiplexor2 : Mux Port map ( 
        cn0 => auxQ(0), 
        cn1 => auxQ(1), 
        cn2 => auxQ(2), 
        cn3 => auxQ(3), 
        cn4 => auxQ(4), 
        cn5 => auxQ(5), 
        cn6 => auxQ(6), 
        cn7 => auxQ(7), 
        cn8 => auxQ(8), 
        cn9 => auxQ(9), 
        cn10 => auxQ(10), 
        cn11 => auxQ(11), 
        cn12 => auxQ(12), 
        cn13 => auxQ(13),  
        cn14 => auxQ(14), 
        cn15 => auxQ(15), 
        sel => read_reg2,
        salida => auxRead_data_2
    );
    read_data2<=auxRead_data_2;
		
    barrel: barrel_shifter Port map( 
        dato => auxRead_data_2,
        salida => auxBs,
        sh => shamt,
        dir => dir
    );
		
    mux_2c:  Mux2C Port map ( 
        bs => auxBs,
        dato => write_data,
        she => she,
        sal => auxD
    );
end A_Archivo_Registro;

