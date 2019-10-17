-- Module Name:    Fetch - Behavioral 
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Fetch is
    Port ( pcin : in  STD_LOGIC_VECTOR (15 downto 0);
           wpc,up,dw,clr,clk : in  STD_LOGIC;
			  sp : out STD_LOGIC_VECTOR (2 downto 0);
           dataout : out  STD_LOGIC_VECTOR (24 downto 0));
end Fetch;

architecture Behavioral of Fetch is
	
	component MemoriaPrograma is
    generic(
        bus_datos: Integer:=16;
        instruccion : Integer :=25
    );
    Port ( 
        dir : in  STD_LOGIC_VECTOR (bus_datos-1 downto 0);
        dout : out  STD_LOGIC_VECTOR (instruccion-1 downto 0));
	end component;
	
	component pila is
    Port ( 
        clk, clr, up, dw, wpc : in  STD_LOGIC;
        sp1 : out std_logic_vector(2 downto 0);
        pcin : in  STD_LOGIC_VECTOR (15 downto 0);
        pcout : out  STD_LOGIC_VECTOR (15 downto 0)
    );
	end component;
	
	signal aux_pcout : std_logic_vector (15 downto 0);
begin

	stack: pila Port map(
		clr => clr,
		clk => clk,
		up => up,
		dw => dw,
		wpc => wpc,
		pcin => pcin,
		pcout => aux_pcout,
		sp1 => sp
	); 
	memoria: MemoriaPrograma Port map(
		dir => aux_pcout,
		dout => dataout
	);

end Behavioral;

