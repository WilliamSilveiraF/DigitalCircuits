library ieee;
use ieee.std_logic_1164.all;

entity FSM1 is port (
    clock: in std_logic;
    reset: in std_logic;
    B: in std_logic;
    S: out std_logic_vector(1 downto 0));
end FSM1;

architecture behavior of FSM1 is
    type STATES is (Init, On1, Off1, On2, Off2);
    signal CurrentState, NextState: STATES;
begin
    REG: process(clock, reset)
    begin
        if (reset = '1') then
            CurrentState <= Init;
        elsif (clock'event AND clock = '1') then
            CurrentState <= NextState;
        end if;
    end process;
    
    COMB: process(CurrentState, B)
    begin
        case CurrentState is
            when Init =>
                S <= "10";
                if (B = '1') then
                    NextState <= On1;
                else
                    NextState <= Init;
                end if;
            when On1 =>
                S <= "01";
                NextState <= Off1;
            when Off1 =>
                S <= "00";
                NextState <= On2;
            when On2 =>
                S <= "01";
                NextState <= Off2;
            when Off2 =>
                S <= "10";
                if (B = '1') then
                    NextState <= On1;
                else
                    NextState <= Off2;
                end if ;
            end case;
    end process;
end behavior;