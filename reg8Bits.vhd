library ieee;
use ieee.std_logic_1164.all;

entity reg8Bits is port(
    CLK: in std_logic;
    EN: in std_logic;
    REQ: in std_logic_vector(7 downto 0);
    RES: out std_logic_vector(7 downto 0));
end reg8Bits;

architecture behavior of reg8Bits is
begin
    process(CLK, EN)
    begin
        if (CLK'event and CLK = '1') then
            if (EN = '1') then
                RES <= REQ;
            end if;
        end if;
end behavior;
