library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_arith.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;


entity pila is
    Port ( 
        clk, clr, up, dw, wpc : in  STD_LOGIC;
        sp1 : out std_logic_vector(2 downto 0);
        pcin : in  STD_LOGIC_VECTOR (15 downto 0);
        pcout : out  STD_LOGIC_VECTOR (15 downto 0)
    );
end pila;

architecture Behavioral of pila is
type contadores is array (0 to 7) of std_logic_Vector(15 downto 0);
signal stack : contadores;
begin
    process(clk, clr, stack) 
    variable sp : integer range 0 to 7;
    begin
        if (clr = '1') then
            sp := 0;
            stack <= (others => (others => '0'));
        elsif (rising_edge(clk)) then
            if (wpc = '1' and up = '0' and dw = '0') then
                stack(Sp) <= pcin;
            elsif (wpc = '0' and up = '0' and dw = '0') then
                stack(sp) <= stack(sp) + 1;
            elsif (wpc = '1' and up = '1' and dw = '0') then
                sp := sp + 1;
                stack(sp) <= pcin;
            elsif (wpc = '0' and up = '0' and dw = '1') then
                sp := sp - 1;
                stack(sp) <= stack(sp) + 1;
            end if;
        end if;
        pcout <= stack(sp);
        sp1 <= conv_std_logic_vector(sp, 3);
    end process;
end Behavioral;

