library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Registro is
    generic ( 
        i: integer :=16
    );
    Port ( 
        d : in  STD_LOGIC_VECTOR ( i-1 downto 0 );
        q : out  STD_LOGIC_VECTOR ( i-1 downto 0 );
        clk,clr,l : in  STD_LOGIC);
end Registro;

architecture Behavioral of Registro is

begin
    process( clk, clr)
        begin
        if ( clr ='1') then
            q <= (others => '0');
        elsif ( rising_edge (clk) ) then
            if ( l ='1' ) then
                q<=d;
            end if;
        end if;
    end process;
end Behavioral;

