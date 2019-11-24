-- Module Name:    main - Behavioral 
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library WORK;
use WORK.UNIDAD_CONTROL.ALL;

entity UnidadControl is
    Port (
        clk,clr,lf: STD_LOGIC;
        cOperacion : in  STD_LOGIC_VECTOR (4 downto 0);
        cFuncion,flags : in  STD_LOGIC_VECTOR (3 downto 0);
        s : out  STD_LOGIC_VECTOR (19 downto 0)
    );
end UnidadControl;

architecture Behavioral of UnidadControl is
--[eq,neq,lt,le,gt,get]
signal auxCondicion: STD_LOGIC_VECTOR ( 5 downto 0 );
--[tipor,beqi,bneqi,blti,bleti,bgti,bgeti]
signal auxDecodificador: STD_LOGIC_VECTOR ( 6 downto 0 );
signal auxNA,auxSM,auxSDOPC: STD_LOGIC;--auxlf
signal auxFlags: STD_LOGIC_VECTOR(3 downto 0);
signal auxDir: STD_LOGIC_VECTOR(4 downto 0);
signal auxMicroFun, auxMicroOpcode, auxS : STD_LOGIC_VECTOR(19 downto 0);
begin

    ASM: CartaASM_UC port map(
        clk => clk,
        clr => clr,
        eq => auxCondicion(5),
        neq => auxCondicion(4),
        lt => auxCondicion(3),
        le => auxCondicion(2),
        g_t => auxCondicion(1),
        get => auxCondicion(0),
        na => auxNA,
        bgeti => auxDecodificador(0),
        bgti => auxDecodificador(1),
        bleti => auxDecodificador(2),
        blti => auxDecodificador(3),
        bneqi => auxDecodificador(4),
        beqi => auxDecodificador(5),
        tipo_r => auxDecodificador(6),
        sdopc => auxSDOPC,
        sm => auxSM
    );

    Con: Condicion_UC port map(
        Rflags => auxFlags,
        eq => auxCondicion(5),
        neq => auxCondicion(4),
        lt => auxCondicion(3),
        le => auxCondicion(2),
        g_t => auxCondicion(1),
        get => auxCondicion(0) 
    );

    Deco: DecodificadorInstruccion_UC port map (
        opcode =>cOperacion,
        tipo_r => auxDecodificador(6),
        beqi => auxDecodificador(5),
        bneqi => auxDecodificador(4),
        blti => auxDecodificador(3),
        bleti => auxDecodificador(2),
        bgti => auxDecodificador(1),
        bgeti => auxDecodificador(0)
    );

    Funcion: MicrocodigoFuncion_UC port map(
        dir => cFuncion,
        microFuncion => auxMicroFun
    );

    Opcode: MicrocodigoOpcode_UC port map(
        dir => auxDir,
        microOpcode => auxMicroOpcode
    );

    MuxSdopc: MuxSdopc_UC port map(
        Opcode => cOperacion,
        sdopc => auxSDOPC, 
        salida => auxDir
    );

    MuxSm:MultiplexorSm_UC port map(
        microFuncion => auxMicroFun,
        microOpcode => auxMicroOpcode,
        sm => auxSM,
        s => auxS
    );

    Niv: Nivel_UC port map(
        clk => clk,
        clr => clr,
        na => auxNA
    );

    s <= auxS;

    Reg: RegistroEstados_UC port map(
        flags => flags,
        clr => clr,
        clk => clk,
        lf => lf,
        Rflags => auxFlags
    );
    
end Behavioral;

