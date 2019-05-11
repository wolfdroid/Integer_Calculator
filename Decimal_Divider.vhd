library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--Entity for Decimal_Divider Programming Component
entity Decimal_Divider is
    port (  input1  : in std_logic_vector( 3 downto 0 );    
            input2  : in std_logic_vector( 3 downto 0 );
            clock   : in std_logic;
			dataout : out std_logic_vector( 4 downto 0)
    );
end entity;

--Behavior Model of Decimal_Dividers Component
architecture behavior of Decimal_Divider is
    begin
        process(clock)
        begin
            if clock'event and clock = '1' then
                dataout <= std_logic_vector(to_unsigned(to_integer(unsigned(input1)/unsigned(input2)),5)); 	 
            end if;
        end process;
end behavior;
        