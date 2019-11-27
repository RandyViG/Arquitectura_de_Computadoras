library IEEE;
use IEEE.STD_LOGIC_1164.all;

package ESCO_MIPS is

    component Archivo_Registro is
        Port ( 
            wr,she,dir,clk,clr : in  STD_LOGIC;
            write_reg,read_reg1,read_reg2,shamt : in  STD_LOGIC_VECTOR (3 downto 0);
            write_data : in  STD_LOGIC_VECTOR (15 downto 0);
            read_data1,read_data2 : out  STD_LOGIC_VECTOR (15 downto 0)
        );
    end component;

    component ExtensionDireccion is
        Port ( 
            lit_in : in  STD_LOGIC_VECTOR (11 downto 0);
            lit_out : out  STD_LOGIC_VECTOR (15 downto 0)
        );
    end component;

    component ExtensorSigno is
        Port ( 
            Slit_in : in  STD_LOGIC_VECTOR (11 downto 0);
            Slit_out : out  STD_LOGIC_VECTOR (15 downto 0)
        );
    end component;

    component MemoriaDatos is
        Port ( 
            dir : in  STD_LOGIC_VECTOR (8 downto 0);
            data_in : in  STD_LOGIC_VECTOR (15 downto 0);
            data_out : out  STD_LOGIC_VECTOR (15 downto 0);
            WD, CLK : in  STD_LOGIC
        );
    end component;
    
    component MemoriaPrograma is
        Port ( 
            dir : in  STD_LOGIC_VECTOR (8 downto 0);
            dout : out  STD_LOGIC_VECTOR (24 downto 0)
        );
    end component;
    
    component Multiplexor_16bits is
        Port ( 
            data_in1, data_in2 : in  STD_LOGIC_VECTOR (15 downto 0);
            selec : in STD_LOGIC;	
            data_out : out  STD_LOGIC_VECTOR (15 downto 0)
        );
    end component;
    
    component Multiplexor_4bits is
        Port ( 
            data_in1, data_in2 : in  STD_LOGIC_VECTOR (3 downto 0);
            selec : in STD_LOGIC;	
            data_out : out  STD_LOGIC_VECTOR (3 downto 0)
        );
    end component;

    component UnidadControl is
        Port (
            clk,clr,lf: STD_LOGIC;
            cOperacion : in  STD_LOGIC_VECTOR (4 downto 0);
            cFuncion,flags : in  STD_LOGIC_VECTOR (3 downto 0);
            s : out  STD_LOGIC_VECTOR (19 downto 0)
        );
    end component;

    component pila is
        Port ( 
            clk, clr, up, dw, wpc : in  STD_LOGIC;
            pcin : in  STD_LOGIC_VECTOR (15 downto 0);
            pcout : out  STD_LOGIC_VECTOR (15 downto 0)
        );
    end component;

    component Alu_16bits is    
        Port ( 
            a,b : in  STD_LOGIC_VECTOR (15 downto 0);
            aluop : in STD_LOGIC_VECTOR	 (3 downto 0);
            s : out  STD_LOGIC_VECTOR (15 downto 0);
            flags : out STD_LOGIC_VECTOR (3 downto 0)	
        );	
    end component;

    component DivisorFrecuencia is
        Port ( 
            clk,clr : in  STD_LOGIC;
            clk_out : out  STD_LOGIC
        );
    end component;

end ESCO_MIPS;

package body ESCO_MIPS is
 
end ESCO_MIPS;
