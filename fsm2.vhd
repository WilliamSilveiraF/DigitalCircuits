library ieee;
use ieee.std_logic_1164.all;

entity fsm2 is port(
    clock, reset, a, b: in std_logic;
    y: out std_logic);
end fsm2;

architecture behavior of fsm2 is
    type STATES is (Travado, Destrav);
    signal EAtual, PEstado: STATES;
begin
    REG: process(clock, reset)
    begin
        if (reset = "1") then
            EAtual <= Travado;
        elsif (clock'event AND clock = "1") then
            EAtual <= PEstado 
        end if;
    end process;
    COMB: process(EAtual, a, b)
    begin
        case EAtual is
            when Travado =>
                y <= "1";
                if ((a="1") AND (b="1")) then
                    PEstado <= Destrav;
                else
                    PEstado <= Travado;
                end if;
            when Destrav =>
                y <= "0";
                if ((a="1") AND (b="1")) then
                    PEstado <= Destrav;
                else
                    PEstado <= Travado;
                end if;
            end case;
    end process;
end behavior;

