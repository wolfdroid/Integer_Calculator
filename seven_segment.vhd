library ieee;
use ieee.std_logic_1164.all;

--              7 Segment Port Mapping
    --                   Port 0
    --                  _________
    --                 |        |
    --          Port 5 |        | Port 1
    --                 | Port 6 |
    --                 ----------
    --                 |        |
    --          Port 4 |        | Port 2
    --                 |________|
    --                   Port 3

--Entity for 7 Segment Display
entity seven_seg is
    port (  datain  : in std_logic_vector( 3 downto 0 );
            display : out std_logic_vector( 6 downto 0 )
    );
end entity;

--Behavior Model for 7 Segment Display
architecture behavior of seven_seg is
    begin
        process (datain)
        begin
            case (datain) is
            --  |  Binary   |             |  7 Seg  |
            when "0000" => display  <= "0000001";   -- 0
            when "0001" => display  <= "1001111";   -- 1
            when "0010" => display  <= "0010010";   -- 2   
            when "0011" => display  <= "0000110";   -- 3
            when "0100" => display  <= "1001100";   -- 4
            when "0101" => display  <= "0100100";   -- 5
            when "0110" => display  <= "1100000";   -- 6
            when "0111" => display  <= "0001111";   -- 7
            when "1000" => display  <= "0000000";   -- 8
            WHEN "1010" => display  <= "1110111";   -- A
		    WHEN "1011" => display  <= "1111111";   -- B
	    	WHEN "1100" => display  <= "1001110";   -- C
		    WHEN "1101" => display  <= "1111110";   -- D
		    WHEN "1110" => display  <= "1001111";   -- E
		    WHEN "1111" => display  <= "1000111";   -- F
            when others => display  <= "1111111";   -- Other Cases ( All Off )
            end case;
        end process;
end behavior;

