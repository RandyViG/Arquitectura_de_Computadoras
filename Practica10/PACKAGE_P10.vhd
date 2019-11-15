library IEEE;
use IEEE.STD_LOGIC_1164.all;

package PACKAGE_P10 is

    --constant bus_datos_funcion : Integer := 4;
    --constant bus_Opcode : Integer := 5;
    --constant tam_micro : Integer := 20;

    component CartaASM is
    Port ( clk,clr,eq,neq,lt,le,g_t,get,na,bgeti,bgti,bleti,blti,bneqi,beqi,tipo_r : in  STD_LOGIC;
           sdopc,sm : out  STD_LOGIC);
    end component;

    component Condicion is
    Port ( Rflags : in  STD_LOGIC_VECTOR (3 downto 0);
           eq,neq,lt,le,g_t,get : out  STD_LOGIC);
    end component;

    component DecodificadorInstruccion is
    Port ( opcode : in  STD_LOGIC_VECTOR (4 downto 0);
           tipo_r,beqi,bneqi,blti,bleti,bgti,bgeti : out  STD_LOGIC);
    end component;

    component MicrocodigoFuncion is
    Port ( dir : in  STD_LOGIC_VECTOR (3 downto 0);
           microFuncion : out  STD_LOGIC_VECTOR (19 downto 0));
    end component;

    component MicrocodigoOpcode is
    Port ( dir : in  STD_LOGIC_VECTOR (4 downto 0);
           microOpcode : out  STD_LOGIC_VECTOR (19 downto 0));
    end component;

    component Mux2C is
    Port ( 
        microFuncion,microOpcode : in  STD_LOGIC_VECTOR (19 downto 0);
        sm : in  STD_LOGIC;
        s : out  STD_LOGIC_VECTOR (19 downto 0));
    end component;

    component Mux is
    Port ( 
        Opcode : in  STD_LOGIC_VECTOR (4 downto 0);
        sdopc : in  STD_LOGIC;
        salida : out  STD_LOGIC_VECTOR (4 downto 0));
    end component;
    
    component Nivel is
    Port ( clk,clr : in  STD_LOGIC;
           na : out  STD_LOGIC);
    end component;

    component RegistroEstados is
    Port ( flags : in  STD_LOGIC_VECTOR (3 downto 0);
           clr,clk,lf : in  STD_LOGIC;
           Rflags : out  STD_LOGIC_VECTOR (3 downto 0));
    end component;

end PACKAGE_P10;

package body PACKAGE_P10 is
 
end PACKAGE_P10;
