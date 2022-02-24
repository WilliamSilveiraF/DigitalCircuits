library ieee;
use ieee.std_logic_1164.all;
use IEEE.std_logic_arith.all; 
use IEEE.std_logic_unsigned.all;

entity contador1 is port ( 
    CLK: in std_logic;
    CLR: in std_logic;
    EN: in std_logic;
    MAX: out std_logic;
    S: out std_logic_vector(6 downto 0));
end contador1;

architecture behv of contador1 is
    signal cnt: std_logic_vector(3 downto 0) := "0000";

    component bcd7seg is
        port(bcd_in:  in std_logic_vector(3 downto 0);
            out_7seg:  out std_logic_vector(6 downto 0));
    end component;
begin

    process(CLK,CLR)
    begin
        if (CLR = '1') then
            cnt <= "0000";
            MAX <= '0';
        elsif (CLK'event and CLK = '1' and EN = '1' and cnt = "1000") then
            cnt <= cnt + "0001";
            MAX <= '1';
        elsif (CLK'event and CLK = '1' and EN = '1' and not(cnt = "1001")) then 
            cnt <= cnt + "0001";
        end if;
    end process;
    
    formatDisplay: bcd7seg port map(bcd_in => cnt(3 downto 0),
                                    out_7seg => S(6 downto 0));

end behv;