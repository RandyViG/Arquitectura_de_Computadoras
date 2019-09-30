library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity barrel_shifter is
generic(
n:integer :=16;
c:integer := 4
);
    Port ( 
        dato : in  STD_LOGIC_VECTOR (15 downto 0);
        salida : out  STD_LOGIC_VECTOR (15 downto 0);
        sh : in  STD_LOGIC_VECTOR (3 downto 0);
        dir : in STD_LOGIC
    );
    end barrel_shifter;

architecture Behavioral of barrel_shifter is
begin

process (dato,sh,dir)
variable aux: std_logic_vector(15 downto 0);
begin
    aux:= dato;
    for j in 0 to c-1 loop
        if (sh(j) = '0') then
            aux := aux;
        else
            case dir is
                when '1' => --left
                    for i in n-1 downto 0 loop
                        if ( i < 2 **j ) then
                            aux(i):= '0';
                        else
                            aux(i) := aux(i-2**j);
                        end if;
                    end loop;
                when others => --rigth
                    for i in 0 to n-1 loop 
                        if ( i <=  (n-1) - 2 **j ) then 
                            aux(i) := aux (i+2**j) ; 
                        else
                            aux(i):= '0';  
                        end if;
                    end loop;
            end case;
        end if;
    end loop;
    salida <= aux;
end process;

end Behavioral;
