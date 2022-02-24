library ieee;
use ieee.std_logic_1164.all;

entity fsm is port (
    clock: in std_logic;
    reset: in std_logic;
    x: out std_logic);
end fsm;

architecture behavior of fsm is
    type STATES is (Off, On1);
    signal EAtual, PEstado: STATES;
begin
    REG: process(clock, reset)
    begin
        if (reset = "1") then
            EAtual <= Off;
        elsif (clock'event AND clock = "1") then
            EAtual <= PEstado;
        end if;
    end process;
    process(EAtual)
    begin
        case EAtual is
            when Off => Pestado <= On1;
                        x <= "0"
            when On1 => Pestado <= Off;
                        x <= "1"
        end case;
    end process;
end behavior;
