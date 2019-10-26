-- Module Name:    main - Behavioral 
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library WORK;
use WORK.PACKAGE_P9.ALL;

entity main is
    Port ( ini,clk,clr : in  STD_LOGIC;
           dato : in  STD_LOGIC_VECTOR (8 downto 0);
           display : out  STD_LOGIC_VECTOR (6 downto 0);
           a : out  STD_LOGIC_VECTOR (8 downto 0);
           d1 : out  STD_LOGIC_VECTOR (7 downto 0)
        );
end main;

architecture Behavioral of main is

signal auxCLK,auxLA,auxEA,auxLB,auxEB,auxEC,auxZ: std_logic;
signal auxA: std_logic_vector(8 downto 0);
signal auxB: std_logic_vector(3 downto 0);
signal auxNUM: std_logic_vector(6 downto 0);

begin

    Frec: DivisorFrecuencia port map(
        clr=>clr,
        clk=>clk,
        clk_out=>auxCLK
    );

    Cont: Contador port map(
        clr=>clr,
        clk=>auxCLK,
        lb=>auxLB,
        eb=>auxEB,
        b=>auxB
    );
    
    Deco: Decodificador port map(
        b=>auxB,
        num_out=>auxNUM
    );
        
    Mux: Multiplexor port map(
        num=>auxNUM,
        ec=>auxEC,
        display=>display
    );

    Reg: Registro port map(
        clr=>clr,
        clk=>auxCLK,
        la=>auxLA,
        ea=>auxEA,
        a=>auxA,
        dato=>dato
    );
    
    auxZ <= '0' when auxA = "000000000" else '1';
    
    ASM: CartaASM port map(
        ini=>ini,
        clk=>auxCLK,
        clr=>clr,
        a0=>auxA(0),
        z=> auxZ,
        la=>auxLA,
        ea=>auxEA,
        lb=>auxLB,
        eb=>auxEB,
        ec=>auxEC
    );

    a<=auxA;
    d1<="11111110";

end Behavioral;

