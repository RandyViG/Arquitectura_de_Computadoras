-- Project Name:   ESCOMips - Behavioral 
-- Target Devices: Nexys 4
-- Description: 
--
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library WORK;
use WORK.ESCO_MIPS.ALL;
---------------------------------------------------------------------------------
--                 Entity para el anlisis del ESCOMips
---------------------------------------------------------------------------------
--entity ESCOMips is
--    Port (  clk,Reset : in  STD_LOGIC;
--            pc_out,reg1,reg2,alu_out,data_out: out STD_LOGIC_VECTOR(15 DOWNTO 0);
--            banderas:out STD_LOGIC_VECTOR(3 downto 0);
--            micro: out STD_LOGIC_VECTOR(19 downto 0);
--            instr: out STD_LOGIC_VECTOR(24 downto 0)
--    );
--end ESCOMips;

---------------------------------------------------------------------------------
--                      Entity para bajar a tarjeta
---------------------------------------------------------------------------------
entity ESCOMips is
    Port (  CLK_Nexys,Reset : in  STD_LOGIC;
            pc_out,data_out: out STD_LOGIC_VECTOR(7 DOWNTO 0)
    );
end ESCOMips;

architecture Behavioral of ESCOMips is

--[SDMP,UP,DW,WPC,SR2,SWD,SEXT,SHE,DIR,WR,SOP1,SOP2,ALUP,SDMD,WD,SR,LF]
signal  Microinstruccion: std_logic_vector(19 downto 0);
signal  auxInstruccion: std_logic_vector(24 downto 0);
signal  auxPCin,auxPCout,auxReadData1,auxReadData2,auxSlit_Signo,
        auxLit_Direccion,auxSDMD,auxMem_DataOut,auxWriteData,auxSR,
        auxS,auxSOP1,auxSOP2,auxSEXT: std_logic_vector(15 downto 0);
signal  auxSigno: std_logic_vector(11 downto 0);
signal  auxREG2,auxFlags: std_logic_vector(3 downto 0);
signal  clr: std_logic;
---------------------------------------------------------------------
--                  CLK para bajar a tarjeta
---------------------------------------------------------------------
signal clk: std_logic;

begin
    
---------------------------------------------------------------------
--                  Process para simulación
--          **Comentar el divisor de Frecuencia
---------------------------------------------------------------------
    --process(clk)
    --begin
    --    if( falling_edge(clk) ) then
    --        clr <= Reset;
    --    end if;
    --end process;
    
---------------------------------------------------------------------
--	         Process para para bajar a tarjeta
---------------------------------------------------------------------
    process(CLK_Nexys)
    begin
        if( falling_edge(CLK_Nexys) ) then
            clr <= Reset;
        end if;
    end process;
    
    Frecuencia: DivisorFrecuencia Port Map(
        clk => CLK_Nexys,
        clr => Reset,
        clk_out => clk
    );

    Stack: pila Port Map(
        clk => clk,
        clr => clr,
        up => Microinstruccion(18), 
        dw => Microinstruccion(17), 
        wpc => Microinstruccion(16),
        pcin => auxPCin,
        pcout => auxPCout
    );

    MemProg: MemoriaPrograma Port Map(
        dir => auxPCout,
        dout => auxInstruccion
    );

    ArchReg: Archivo_Registro Port Map(
        wr => Microinstruccion(10),
        she => Microinstruccion(12),
        dir => Microinstruccion(11),
        clk => clk,
        clr => clr,
        write_reg => auxInstruccion(19 downto 16),
        read_reg1 => auxInstruccion(15 downto 12),
        read_reg2 => auxREG2,
        shamt => auxInstruccion(7 downto 4),
        write_data => auxWriteData,
        read_data1 => auxReadData1,
        read_data2 => auxReadData2
    );

    ES: ExtensorSigno Port Map(
        Slit_in => auxInstruccion(11 downto 0),
        Slit_out => auxSlit_Signo
    );
    
    ED: ExtensionDireccion Port Map(
        lit_in => auxInstruccion(11 downto 0),
        lit_out => auxLit_Direccion
    );
    
    Al: Alu_16bits Port Map( 
        a => auxSOP1,
        b => auxSOP2,
        aluop => Microinstruccion(7 downto 4),
        s => auxS,
        flags => auxFlags	
    );

    UC: UnidadControl Port Map(
        clk => clk,
        clr => clr,
        lf => Microinstruccion(0), 
        cOperacion => auxInstruccion(24 downto 20), 
        cFuncion => auxInstruccion(3 downto 0),
        flags => auxFlags,
        s => Microinstruccion
    );
    
    MemDat: MemoriaDatos Port Map(
        dir => auxSDMD(8 downto 0), 
        data_in => auxReadData2,  
        data_out => auxMem_DataOut,  
        WD => Microinstruccion(2),  
        CLK => clk
    );
    
    SDMP: Multiplexor_16bits Port Map( 
        data_in1 => auxInstruccion(15 downto 0), 
        data_in2 => auxSR, 
        selec => Microinstruccion(19),
        data_out => auxPCin
    );

    SR2: Multiplexor_4bits Port Map( 
        data_in1 => auxInstruccion(11 downto 8), 
        data_in2 => auxInstruccion(19 downto 16),  
        selec => Microinstruccion(15),
        data_out => auxREG2
    );

    SWD: Multiplexor_16bits Port Map( 
        data_in1 => auxInstruccion(15 downto 0), 
        data_in2 => auxSR, 
        selec => Microinstruccion(14),
        data_out => auxWriteData
    );

    SEXT: Multiplexor_16bits Port Map( 
        data_in1 => auxSlit_Signo, 
        data_in2 => auxLit_Direccion,
        selec => Microinstruccion(13),
        data_out => auxSEXT
    );

    SOP1: Multiplexor_16bits Port Map( 
        data_in1 => auxReadData1,
        data_in2 => auxPCout,
        selec => Microinstruccion(9),
        data_out => auxSOP1
        );

    SOP2: Multiplexor_16bits Port Map( 
        data_in1 => auxReadData2,
        data_in2 => auxSEXT,
        selec => Microinstruccion(8),
        data_out => auxSOP2
    );

    SDMD: Multiplexor_16bits Port Map( 
        data_in1 => auxS,
        data_in2 => auxInstruccion(15 downto 0),
        selec => Microinstruccion(3),
        data_out => auxSDMD
    );

    SR: Multiplexor_16bits Port Map( 
        data_in1 => auxMem_DataOut,
        data_in2 => auxS,
        selec => Microinstruccion(1),
        data_out => auxSR
    );

---------------------------------------------------------------------------------
--                     Salidas para el anlisis de ESCOMips
---------------------------------------------------------------------------------

--    pc_out <= auxPCout;
--    reg1 <= auxReadData1;
--    reg2 <= auxReadData2;
--    alu_out <= auxS;
--    banderas <= auxFlags;
--    data_out <= auxReadData2;
--    micro <= microinstruccion;
--    instr<= auxInstruccion;
    
---------------------------------------------------------------------------------
--                          Salidad para la tarjeta
---------------------------------------------------------------------------------
    pc_out <= auxPCout(7 downto 0);
    data_out <= auxReadData2(7 downto 0);
    
end Behavioral;

