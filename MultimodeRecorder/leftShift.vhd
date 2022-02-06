library ieee;
use ieee.std_logic_1164.all;

entity leftShift is port(
    BIN: in std_logic_vector(7 downto 0);
    LEFT: out std_logic_vector(7 downto 0));
end leftShift;

architecture behavior of leftShift is
begin
    LEFT <= BIN(6 downto 0) & "0";
end behavior;