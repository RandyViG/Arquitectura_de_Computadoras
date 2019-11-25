-- Module Name:    CartaASM - Behavioral 
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity CartaASM_UC is
    Port ( clk,clr,eq,neq,lt,le,g_t,get,na,bgeti,bgti,bleti,blti,bneqi,beqi,tipo_r : in  STD_LOGIC;
           sdopc,sm : out  STD_LOGIC);
end CartaASM_UC;

architecture Behavioral of CartaASM_UC is

type estados is (e0);
signal act,sig:estados;

begin

    --Control de estados
    process(clr,clk)
    begin
        if(clr='1') then
            act<=e0;
        elsif (clk'event and clk='1') then
            act<=sig;
        end if;
    end process;

    process(act,eq,neq,lt,le,g_t,get,na,tipo_r,beqi,bneqi,blti,bleti,bgti,bgeti)
        begin
            sdopc<='0';
            sm<='0';
            case act is
                when e0 =>
                    if(tipo_r='1') then
                        sm<='0';
                    else	
                        if(beqi='0') then
                            if(bneqi='0') then
                                if(blti='0') then
                                    if(bleti='0') then
                                        if(bgti='0') then
                                            if(bgeti='0') then
                                                sdopc<='1';
                                                sm<='1';
                                                sig<=e0;
                                            else
                                                if(na='1')then
                                                    sdopc<='0';
                                                    sm<='1';
                                                    sig<=e0;
                                                else
                                                    if(get='1')then
                                                        sdopc<='1';
                                                        sm<='1';
                                                        sig<=e0;
                                                    else
                                                        sdopc<='0';
                                                        sm<='1';
                                                        sig<=e0;
                                                    end if;
                                                end if;
                                            end if;
                                        else
                                            if(na='1')then
                                                sdopc<='0';
                                                sm<='1';
                                                sig<=e0;
                                            else
                                                if(g_t='1')then
                                                    sdopc<='1';
                                                    sm<='1';
                                                    sig<=e0;
                                                else
                                                    sdopc<='0';
                                                    sm<='1';
                                                    sig<=e0;
                                                end if;
                                            end if;
                                        end if;
                                    else
                                        if(na='1')then
                                            sdopc<='0';
                                            sm<='1';
                                            sig<=e0;
                                        else
                                            if(le='1')then
                                                sdopc<='1';
                                                sm<='1';
                                                sig<=e0;
                                            else
                                                sdopc<='0';
                                                sm<='1';
                                                sig<=e0;
                                            end if;
                                        end if;
                                    end if;
                                else
                                    if(na='1')then
                                        sdopc<='0';
                                        sm<='1';
                                        sig<=e0;
                                    else
                                        if(lt='1')then
                                            sdopc<='1';
                                            sm<='1';
                                            sig<=e0;
                                        else
                                            sdopc<='0';
                                            sm<='1';
                                            sig<=e0;
                                        end if;
                                    end if;
                                end if;
                            else
                                if(na='1')then
                                    sdopc<='0';
                                    sm<='1';
                                    sig<=e0;
                                else
                                    if(neq='1')then
                                        sdopc<='1';
                                        sm<='1';
                                        sig<=e0;
                                    else
                                        sdopc<='0';
                                        sm<='1';
                                        sig<=e0;
                                    end if;
                                end if;
                            end if;
                        else
                            if(na='1')then
                                sdopc<='0';
                                sm<='1';
                                sig<=e0;
                            else
                                if(eq='1')then
                                    sdopc<='1';
                                    sm<='1';
                                    sig<=e0;
                                else
                                    sdopc<='0';
                                    sm<='1';
                                    sig<=e0;
                                end if;
                            end if;
                        end if;
                    end if;
            end case;
    end process;

end Behavioral;

