library ieee;
use ieee.std_logic_1164.all;

entity usertest is
end usertest;

architecture tb of usertest is

 signal clk, Rtest, Btest : std_logic := '0';
 signal Stest: std_logic_vector(1 downto 0);

 component FSM1 is port (
    clock: in std_logic;
    reset: in std_logic;
    B: in std_logic;
    S: out std_logic_vector(1 downto 0) );
 end component;

begin

 myfsm: FSM1 port map (clock => clk, reset => Rtest, B => Btest, S => Stest);

 clk <= not clk after 5 ns;
 Rtest <= '1', '0' after 15 ns;
 Btest <= '0', '1' after 25 ns, '0' after 40 ns, '1' after 122 ns, '0' after 135 ns;

end tb;