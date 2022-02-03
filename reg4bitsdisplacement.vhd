library ieee;
use ieee.std_logic_1164.all;

entity reg4bitsdisplacement is port (
    CLK: in std_logic;
    D0: in std_logic;
    LEDR: out std_logic_vector(3 downto 0)
);
end reg4bitsdisplacement;

architecture behv of reg4bitsdisplacement is
    signal Q1, Q2, Q3, Q4: std_logic;
    component flipFlopD is port(
        CLK: in std_logic;
        D: in std_logic;
        Q: out std_logic);
    end component;
begin
    idOne: flipFlopD port map (
        D => D0,
        CLK => CLK,
        Q => Q1
    );
    idTwo: flipFlopD port map (
        D => Q1,
        CLK => CLK,
        Q => Q2
    );
    idThree: flipFlopD port map (
        D => Q2,
        CLK => CLK,
        Q => Q3
    );
    idFour: flipFlopD port map (
        D => Q3,
        CLK => CLK,
        Q => Q4
    );

    LEDR(3)<= Q1;
    LEDR(2) <= Q2;
    LEDR(1) <= Q3;
    LEDR(0) <= Q4;

end behv;