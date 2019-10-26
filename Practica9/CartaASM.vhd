-- Module Name:    CartaASM - Behavioral 
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity CartaASM is
    Port ( a0,z,ini,clk,clr : in  STD_LOGIC;
           la,ea,lb,eb,ec : out  STD_LOGIC	
			  );
end CartaASM;

architecture Behavioral of CartaASM is

type estados is (e0,e1,e2);
signal actual,siguiente:estados;

begin
    --Control de estados
    process(clr,clk)
    begin
        if(clr='1') then
            actual<=e0;
        elsif (clk'event and clk='1') then
            actual<=siguiente;
        end if;
    end process;
	
    --Carta ASM
    process (actual,ini,z,a0)
    begin
        la<='0';
        lb<='0';
        ea<='0';
        eb<='0';
        ec<='0';
        case actual is
            when e0=>
            lb<='1';
                if (ini='1') then
                siguiente<=e1;
                else 
            la<='1';
                siguiente<=e0;
                end if;
            when e1 =>
                ea<='1';
                if (z='1') then
                    if (a0='1') then
                        eb<='1';
                        siguiente<=e1;
                    else
                        siguiente<=e1;
                    end if;
                else
                    siguiente<=e2;
                end if;
            when e2 =>
                ec<='1';
                if (ini='1') then
                    siguiente<=e2;
                else
                    siguiente<=e0;
                end if;
        end case;
    end process;
    
end Behavioral;

