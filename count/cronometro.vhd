library ieee;
use ieee.std_logic_1164.all;
use IEEE.std_logic_arith.all; 
use IEEE.std_logic_unsigned.all;

entity cronometro is port ( 
    CLK: in std_logic;
    EN: in std_logic;
    CLR: in std_logic;
    LEDR0, LEDR1: out std_logic;
    HEX0, HEX1: out std_logic_vector(6 downto 0));
end cronometro;

architecture behv of cronometro is
    signal S0, S1: std_logic_vector(6 downto 0);
    signal MAX0, MAX1: std_logic;
    signal enable
    component contador1 is
        port(CLK: in std_logic;
            CLR: in std_logic;
            EN: in std_logic;
            MAX: out std_logic;
            S: out std_logic_vector(6 downto 0));
    end component;

    component contador2 is
        port(CLK: in std_logic;
            CLR: in std_logic;
            EN: in std_logic;
            MAX: out std_logic;
            S: out std_logic_vector(6 downto 0));
    end component;
begin
    formatS0: contador1 port map(   CLK => CLK,
                                    CLR => CLR,
                                    EN => EN,
                                    MAX => MAX0,
                                    S => S0(6 downto 0));
    formatS1: contador2 port map(   CLK => CLK,
                                    CLR => CLR,
                                    EN => MAX0,
                                    MAX => MAX1,
                                    S => S1(6 downto 0));
    LEDR0 <= MAX0;
    LEDR1 <= MAX1;
end behv;