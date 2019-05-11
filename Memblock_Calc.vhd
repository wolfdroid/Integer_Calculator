LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

--Entity Declaration for Calculator
ENTITY Memblock_Calc IS
PORT(   selection           : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
	din1                : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	din2                : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        enable              : IN STD_LOGIC;
        clock               : IN STD_LOGIC;
        temp0,temp1,temp2,temp3,
        temp4,temp5,temp6,temp7 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
);
END ENTITY;

--Data Flow Mode for Entity
ARCHITECTURE dataflow OF Memblock_Calc IS
    --Signal Declaration
    --General
    SIGNAL clk        	: STD_LOGIC;
    SIGNAL address      : STD_LOGIC_VECTOR(4 DOWNTO 0);
    SIGNAL enabler      : STD_LOGIC;
    SIGNAL dout         : STD_LOGIC_VECTOR(7 DOWNTO 0);
    --Temporary Signal Storing Value
    SIGNAL data         : STD_LOGIC_VECTOR(7 DOWNTO 0);
    signal datain1      : STD_LOGIC_VECTOR(3 downto 0);
    signal datain2      : STD_LOGIC_VECTOR(3 downto 0);
    --Temporary Signal Address Data
    signal data_add1 : STD_LOGIC_VECTOR(4 downto 0);
    signal data_add2 : STD_LOGIC_VECTOR(4 downto 0);
    signal data_add3 : STD_LOGIC_VECTOR(7 downto 0);
    signal data_add4 : STD_LOGIC_VECTOR(4 downto 0);
    signal data_add5 : STD_LOGIC_VECTOR(7 downto 0);
    signal data_add6 : STD_LOGIC_VECTOR(7 downto 0);
    signal data_add7 : STD_LOGIC_VECTOR(7 downto 0);
    signal data_add8 : STD_LOGIC_VECTOR(3 downto 0);
    signal data_add9 : STD_LOGIC_VECTOR(7 downto 0);
    signal data_add10: STD_LOGIC_VECTOR(7 downto 0);
    --Temporary Signal Selection
    signal case1    : STD_LOGIC_VECTOR(3 downto 0);
    SIGNAL case2    : STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL case3    : STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL case4    : STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL case5    : STD_LOGIC_VECTOR(7 DOWNTO 0);

    --Substraction Component
    component Decimal_Substractor
    port(   input1  : in std_logic_vector(3 downto 0);
            input2  : in std_logic_vector(3 downto 0);
            clock   : in std_logic;
            dataout : out std_logic_vector(4 downto 0));
    end component;

    --Addition Component
    component Decimal_Adder
    port(   input1  : in std_logic_vector(3 downto 0);
            input2  : in std_logic_vector(3 downto 0);
            clock   : in std_logic;
            dataout : out std_logic_vector(4 downto 0));
    end component;

    --Multiplier Component
    component Decimal_Multiplier
    port(   input1  : in std_logic_vector(3 downto 0);
            input2  : in std_logic_vector(3 downto 0);
            clock   : in std_logic;
            dataout : out std_logic_vector(7 downto 0));
    end component;

    --Divider Component
    component Decimal_Divider
    port(   input1  : in std_logic_vector(3 downto 0);
            input2  : in std_logic_vector(3 downto 0);
            clock   : in std_logic;
            dataout : out std_logic_vector(4 downto 0));
    end component;

    --Factorial Component
    component Decimal_Factorial
    port(   input   : in std_logic_vector(3 downto 0);
            clock   : in std_logic;
            dataout : out std_logic_vector(7 downto 0));
    end component;

    --Square Component
    component Decimal_Square
    port(   input1  : in std_logic_vector(3 downto 0);
            clock   : in std_logic;
            dataout : out std_logic_vector(7 downto 0));
    end component;

    --Volume Component
    component Decimal_Volume
    port(   input1  : in std_logic_vector(3 downto 0);
            clock   : in std_logic;
            dataout : out std_logic_vector(7 downto 0));
    end component;

    --Root Square Component
    component Squart
    port(   data_in : in std_logic_vector(3 downto 0);
            clock   : in std_logic;
            data_out: out std_logic_vector(3 downto 0));
    end component;
	 
    --7 Segment Display
    COMPONENT seven_seg
    PORT (  datain : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
            display : OUT STD_LOGIC_VECTOR(6 DOWNTO 0));
    END COMPONENT; 

    BEGIN
        --Signal Assignment   
        clk     <= clock;
        enabler <= enable;
        datain1 <= din1;
        datain2 <= din2;
        address <= selection;
        case1   <= "000" & address(4);
        case2   <= "000" & data_add1;
        case3   <= "000" & data_add2;
        case4   <= "000" & data_add4;
        case5   <= "0000" & data_add8;
        --Process Selection
        WITH selection SELECT
                    data  <= case2      WHEN "00000",
                             case3      WHEN "00001",
                             data_add3  WHEN "00010",
                             case4      WHEN "00011",
                             data_add5  WHEN "00100",
                             data_add6  WHEN "00101",
                             data_add7  WHEN "00110",
                             case5      WHEN "00111",
                             "00000000" WHEN OTHERS;
         --Ram Assignment                       
        RAM_Assigment : ENTITY work.ram32x8 PORT MAP (
                address	 => address,
                clock	 => clk,
                data	 => data,
                wren	 => enabler,
                q	 => dout
            );
        --Arithmatical operation Component Assigment
        substraction    : Decimal_Substractor PORT MAP (datain1, datain2, clk, data_add2);
        addition        : Decimal_Adder PORT MAP (datain1, datain2, clk, data_add1);
        multiplier      : Decimal_Multiplier PORT MAP (datain1, datain2, clk, data_add3);
        divider         : Decimal_Divider PORT MAP (datain1, datain2, clk, data_add4);
        factorial       : Decimal_Factorial PORT MAP (datain1, clk, data_add5);
        square          : Decimal_Square PORT MAP (datain1, clk, data_add6);
        volume          : Decimal_Square PORT MAP (datain1, clk, data_add7);
        rootsquare      : Squart PORT MAP (datain1, clk, data_add8);
        --7 Segment Display Assignment
        segment0     : seven_seg PORT MAP(address(3 DOWNTO 0), temp0);
        segment1     : seven_seg PORT MAP(case1, temp1);
        segment2     : seven_seg PORT MAP(data(3 DOWNTO 0),temp2);
        segment3     : seven_seg PORT MAP(data(7 DOWNTO 4),temp3); 
        segment4     : seven_seg PORT MAP(dout(3 DOWNTO 0),temp4); 
        segment5     : seven_seg PORT MAP(dout(7 DOWNTO 4),temp5);
        segment6     : seven_seg PORT MAP("0000",temp6);
        segment7     : seven_seg PORT MAP("0000",temp7);
        
END ARCHITECTURE;