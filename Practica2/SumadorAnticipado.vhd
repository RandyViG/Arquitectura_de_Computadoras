library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SumadorAnticipado is
	port (  a,b: in STD_LOGIC_VECTOR (7 downto 0);
			cin: in STD_LOGIC;
			s: inout STD_LOGIC_VECTOR (7 downto 0);
			cout: out STD_LOGIC
	);
end SumadorAnticipado;

architecture Behavioral of SumadorAnticipado is 
begin
	Process (a,b,cin)
	    variable eb,p,g: STD_LOGIC_VECTOR(7 downto 0);
	    variable c: STD_LOGIC_VECTOR(8 downto 0);
	    variable PK,T1,T2: STD_LOGIC;
	begin
		c(0) := cin;
		FOR i IN 0 TO 7 LOOP
		--Sumador
		eb(i) := b(i) XOR cin;
		p(i) := a(i)XOR eb(i);
		g(i) := a(i) AND eb(i);
		s(i)<= p(i) XOR c(i);
		--T1 Multiplicatoria
		T1 := '1';
			FOR l IN 0 TO i LOOP 
				T1 := c(0) AND p(l);--PJ
			END LOOP;
		--SUMATORIA
		T2:='0';
		   IF(i>0) THEN
			FOR j IN 0 TO i-1 LOOP --Sumatoria
				PK := '1';
				FOR k IN j+1 TO i LOOP
					PK := PK AND p(k);
				END LOOP;
				T2:= T2 OR (g(j) AND PK);
			END LOOP;
			END IF;
		
		c(i+1):= g(i) OR T1 OR T2;
		
		END LOOP;
        
	    cout <= c(8);
	END PROCESS;
END Behavioral;