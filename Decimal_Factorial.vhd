library ieee;
use ieee.std_logic_1164.all;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

--Entity for Decimal_Factorial Programming Component
entity Decimal_Factorial is
    port (  input   : in std_logic_vector( 3 downto 0 );    
            clock   : in std_logic;
			dataout  : out std_logic_vector( 7 downto 0)
    );
end entity;

--Behavior Model of Decimal_Factorial Component
architecture behavior of Decimal_Factorial is
    SIGNAL temp      : STD_LOGIC_VECTOR(7 DOWNTO 0):= "00000001";
    SIGNAL calculate : STD_LOGIC_VECTOR(3 DOWNTO 0):= "0010";
    begin
        process
        begin
            wait until clock'event and clock = '1' ;
            if input < "0110" then
                if calculate <= input then
                    temp        <= temp(4 downto 0) * calculate(2 downto 0);
                    calculate   <= calculate + 1;
                end if;
                else temp  <= "00000000";
            end if;
        dataout <= temp; 	 
        end process;
end behavior;
        