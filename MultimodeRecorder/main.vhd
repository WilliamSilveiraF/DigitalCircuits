library ieee;
use ieee.std_logic_1164.all;

entity main is 
    port(   ENTER: in std_logic_vector(7 downto 0);
            CLK: in std_logic;
            EN: in std_logic;
            SEL: in std_logic_vector(17 downto 16);
            RES: out std_logic_vector(7 downto 0));
end main;

architecture behavior of main is
    signal FORREG, RSUM, RRIGHT, RLEFT: std_logic_vector(7 downto 0);

    component soma8 is
        port (  A:  in std_logic_vector(7 downto 0);
                B:  in std_logic_vector(7 downto 0);
                S:  out std_logic_vector(7 downto 0));
    end component;

    component rightShift is
        port (  BIN: in std_logic_vector(7 downto 0);
                RIGHT: out std_logic_vector(7 downto 0));
    end component;

    component leftShift is
        port (  BIN: in std_logic_vector(7 downto 0);
                LEFT: out std_logic_vector(7 downto 0));
    end component;

begin
    SUM: soma8 port map(A => ENTER(7 downto 0),
                        B => FORREG(7 downto 0),
                        S => RSUM(7 downto 0));

    SHIFTRIGHT: rightShift port map(BIN => FORREG(7 downto 0),
                                    RIGHT => RRIGHT(7 downto 0));

    SHIFTLEFT: leftShift port map(  BIN => FORREG(7 downto 0),
                                    LEFT => RLEFT(7 downto 0));
    
    process(CLK, EN)
    begin
        if (CLK'event and CLK = '1') then
            if (EN = '1' and SEL = "00") then
                FORREG(7 downto 0) <= RSUM(7 downto 0);
            end if;
            if (EN = '1' and SEL = "01") then
                FORREG(7 downto 0) <= ENTER(7 downto 0);
            end if;
            if (EN = '1' and SEL = "10") then
                FORREG(7 downto 0) <= RRIGHT(7 downto 0);
            end if;
            if (EN = '1' and SEL = "11") then
                FORREG(7 downto 0) <= RLEFT(7 downto 0);
            end if;
        end if;
    end process;
    RES <= FORREG;
end behavior;