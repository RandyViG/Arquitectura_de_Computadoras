-- Module Name:    sumador_restador_8bits - Behavioral 
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sumador_restador_8bits is
	generic (
		N : integer := 8
	);
    Port ( a,b : in  STD_LOGIC_VECTOR (7 downto 0);
           cen : in  STD_LOGIC;
           s : out  STD_LOGIC_VECTOR (7 downto 0);
           co : out  STD_LOGIC);
end sumador_restador_8bits;

architecture A_sumador_restador_8bits  of sumador_restador_8bits is

	signal  c: std_logic_vector(8 downto 0);

	component suma_resta_1bit is
    Port ( a,b,cin ,c0: in  STD_LOGIC;
           s,cout : out  STD_LOGIC);
	end component;

begin
c(0) <= cen;
  ciclo: for i in 0 to N-1 generate
	 a1 : suma_resta_1bit Port map (
	 a => a(i),
	 b => b(i),
	 s => s(i),
	 c0 => c(0),
	 cin => c(i),
	 cout => c(i+1)
	);
end generate;
co <= c(N);
	
end A_sumador_restador_8bits;

