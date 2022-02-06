library ieee;
use ieee.std_logic_1164.all;

entity rightShift is port(
    BIN: in std_logic_vector(7 downto 0);
    RIGHT: out std_logic_vector(7 downto 0));
end rightShift;

architecture behavior of rightShift is
begin
    RIGHT <= "0" & BIN(7 downto 1);
end behavior;