library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Demultiplexor_AR is
    Port ( 
        d : in  STD_LOGIC;
        l : out std_logic_vector(15 downto 0);
        seldemux : in  STD_LOGIC_VECTOR (3 downto 0));
end Demultiplexor_AR;

architecture Behavioral of Demultiplexor_AR is
begin
process(d,seldemux)
    begin
    case seldemux is				 
        when "0000" => 
            l<=  (others =>'0');
            l(0)<=d;
        when "0001" => 
            l<=  (others =>'0');
            l(1)<=d;
        when "0010" => 
            l<=  (others =>'0');
            l(2)<=d;
        when "0011" => 
            l<=  (others =>'0');
            l(3)<=d;
        when "0100" => 
            l<=  (others =>'0');
            l(4)<=d;
        when "0101" =>
            l<=  (others =>'0');
            l(5)<=d;
        when "0110" => 
            l<=  (others =>'0');
            l(6)<=d;
        when "0111" => 
            l<=  (others =>'0');
            l(7)<=d;
        when "1000" => 
            l<=  (others =>'0');
            l(8)<=d;
        when "1001" => 
            l<=  (others =>'0');
            l(9)<=d;
        when "1010" => 
            l<=  (others =>'0');
            l(10)<=d;
        when "1011" => 
            l<=  (others =>'0');
            l(11)<=d;
        when "1100" => 
            l<=  (others =>'0');
            l(12)<=d;
        when "1101" => 
            l<=  (others =>'0');
            l(13)<=d;
        when "1110" => 
            l<=  (others =>'0');
            l(14)<=d;
        when others => 
            l<=  (others =>'0');
            l(15)<=d;
        end case;
end process;
end Behavioral;
