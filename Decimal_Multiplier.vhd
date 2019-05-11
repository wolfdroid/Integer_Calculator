library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--Entity for Decimal_Multiplier Programming Component
entity Decimal_Multiplier is
    port (  input1  : in std_logic_vector( 3 downto 0 );    
            input2  : in std_logic_vector( 3 downto 0 );
            clock   : in std_logic;
			dataout : out std_logic_vector( 7 downto 0 )
    );
end entity;

--Behavior Model of Decimal_Multipler Component
architecture behavior of Decimal_Multiplier is
    begin
        process(clock)
        begin
            if clock'event and clock = '1' then
                dataout <= std_logic_vector(to_unsigned(to_integer(unsigned(input2)*unsigned(input1)),8)); 	 
            end if;
        end process;
end behavior;
        