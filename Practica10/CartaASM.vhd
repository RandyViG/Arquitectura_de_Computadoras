-- Module Name:    CartaASM - Behavioral 
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity CartaASM is
    Port ( clk,clr,eq,neq,lt,le,g_t,get,na,bgeti,bgti,bleti,blti,bneqi,beqi,tipo_r : in  STD_LOGIC;
           sdopc,sm : out  STD_LOGIC);
end CartaASM;

architecture Behavioral of CartaASM is

type estados is (e0);
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
	
	process( actual,eq,neq,lt,le,g_t,get,na,bgeti,bgti,bleti,blti,bneqi,beqi,tipo_r )
	begin
		sdopc<='0';
		sm<='0';
		case actual is
			when e0 =>
				if ( tipo_r = '1' ) then
					sm<='0';
				else
					if ( beqi = '0' ) then
						if ( bneqi = '0' ) then 
							if ( blti = '0' ) then
								if ( bleti = '0' ) then
									if ( bgti = '0' ) then
										if ( bgeti = '0' ) then
											sdopc<='1';
											sm<= '1';
											siguiente<=e0;
										else
											if ( na = '1' ) then
												sdopc<='0';
												siguiente<=e0;
											else
												if ( get = '1' ) then
													sm<='1';
													sdopc<='1';
													siguiente<=e0;
												else
													sdopc<='0';
													siguiente<=e0;
												end if;
											end if;
										end if;
									else
										if ( na = '1' ) then
											sdopc<='0';
											siguiente<=e0;
										else
											if ( g_t = '1' ) then
												sdopc<='1';
												sm<='1';
												siguiente<=e0;
											else
												sdopc<='0';
												siguiente<=e0;
											end if;
										end if;
									end if;
								else
									if ( na = '1' ) then
										sdopc<='0';
										siguiente<=e0;
									else
										if ( le = '1' ) then
											sdopc<='1';
											sm<='1';
											siguiente<=e0;
										else
											sdopc<='0';
											siguiente<=e0;
										end if;
									end if;
								end if;
							else
								if ( na = '1' ) then
									sdopc<='0';
									siguiente<=e0;
								else
									if ( lt = '1' ) then
										sdopc<='1';
										sm<='1';
										siguiente<=e0;
									else
										sdopc<='0';
										siguiente<=e0;
									end if;
								end if;
							end if;
						else
							if ( na = '1' ) then
								sdopc<='0';
								siguiente<=e0;
							else
								if ( neq = '1' ) then
									sdopc<='1';
									sm<='1';
									siguiente<=e0;
								else
									sdopc<='0';
									siguiente<=e0;
								end if;
							end if;
						end if;
					else
						if ( na = '1' ) then
							sdopc<='0';
							siguiente<=e0;
						else
							if ( eq = '1' ) then
								sm<='1';
								sdopc<='1';
								siguiente<=e0;
							else
								sdopc<='0';
								siguiente<=e0;
							end if;
						end if;
					end if;
				end if;
		end case;
	end process;

end Behavioral;

