-- Module Name:    Nivel - Behavioral 
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Nivel is
    Port ( clk,clr : in  STD_LOGIC;
           na : out  STD_LOGIC);
end Nivel;

architecture Behavioral of Nivel is
signal pclk,nclk: std_logic;
begin
    process(clk,clr)
    begin
        if ( clr ='1' ) then
            pclk<='0';
        elsif ( rising_edge(clk) ) then
            pclk<= not pclk;
        end if;
    end process;

    process(clk,clr)
    begin
        if ( clr ='1' ) then
            nclk<='0';
        elsif ( falling_edge(clk) ) then
            nclk<= not nclk;
        end if;
    end process;

    na <= pclk xor nclk;
end Behavioral;

