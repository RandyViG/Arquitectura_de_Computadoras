library IEEE;
use IEEE.STD_LOGIC_1164.all;

package UNIDAD_CONTROL is

    --constant bus_datos_funcion : Integer := 4;
    --constant bus_Opcode : Integer := 5;
    --constant tam_micro : Integer := 20;

    component CartaASM_UC is
    Port ( clk,clr,eq,neq,lt,le,g_t,get,na,bgeti,bgti,bleti,blti,bneqi,beqi,tipo_r : in  STD_LOGIC;
           sdopc,sm : out  STD_LOGIC);
    end component;

    component Condicion_UC is
    Port ( Rflags : in  STD_LOGIC_VECTOR (3 downto 0);
           eq,neq,lt,le,g_t,get : out  STD_LOGIC);
    end component;

    component DecodificadorInstruccion_UC is
    Port ( opcode : in  STD_LOGIC_VECTOR (4 downto 0);
           tipo_r,beqi,bneqi,blti,bleti,bgti,bgeti : out  STD_LOGIC);
    end component;

    component MicrocodigoFuncion_UC is
    Port ( dir : in  STD_LOGIC_VECTOR (3 downto 0);
           microFuncion : out  STD_LOGIC_VECTOR (19 downto 0));
    end component;

    component MicrocodigoOpcode_UC is
    Port ( dir : in  STD_LOGIC_VECTOR (4 downto 0);
           microOpcode : out  STD_LOGIC_VECTOR (19 downto 0));
    end component;

    component MultiplexorSm_UC  is
    Port ( 
        microFuncion,microOpcode : in  STD_LOGIC_VECTOR (19 downto 0);
        sm : in  STD_LOGIC;
        s : out  STD_LOGIC_VECTOR (19 downto 0));
    end component;

    component MuxSdopc_UC is
    Port ( 
        Opcode : in  STD_LOGIC_VECTOR (4 downto 0);
        sdopc : in  STD_LOGIC;
        salida : out  STD_LOGIC_VECTOR (4 downto 0));
    end component;

    component Nivel_UC is
    Port ( clk,clr : in  STD_LOGIC;
           na : out  STD_LOGIC);
    end component;
    
    component RegistroEstados_UC is
    Port ( flags : in  STD_LOGIC_VECTOR (3 downto 0);
           clr,clk,lf : in  STD_LOGIC;
           Rflags : out  STD_LOGIC_VECTOR (3 downto 0));
    end component;

end UNIDAD_CONTROL;

package body UNIDAD_CONTROL is

	
 
end UNIDAD_CONTROL;
