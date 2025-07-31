-- Team 8
-- Aaron Bernstein, Sengi Mathias
-- azb6642@psu.edu, svm6631@psu.edu
-- RippleCarryAdder_4bit_Template.vhd
-- Version 3.0 , 03/25/2025
-- This file implements a design of 4-bits Ripple Carry Adder
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity RippleCarryAdder_4bit is
port (
EX_Cin: in std_logic;
EX_A: in std_logic_vector(3 downto 0);
EX_B: in std_logic_vector(3 downto 0);
EX_SUM: out std_logic_vector(3 downto 0);
EX_Cout: out std_logic
);
end RippleCarryAdder_4bit;
architecture Structural of RippleCarryAdder_4bit is
-- Full Adder VHDL Code Component Decalaration
-- (The original FullAdder_1bit.vhd File MUST EXIST in same folder)
-- The same folder in this case is basically the VHDL project resources
component FullAdder_1bit is
port(
--
Cin: in std_logic;
A: in std_logic;
B: in std_logic;
SUM: out std_logic;
Cout: out std_logic
);
end component;
-- declaring internal signals in order to use as wires
-- between the two instances of the FullAdder_1bit module
signal c1,c2,c3: STD_LOGIC;
begin
-- Port Mapping Full Adder 4 times
FA0: FullAdder_1bit port map(EX_Cin,EX_A(0) ,EX_B(0) , EX_SUM(0) , c1 );
FA1: FullAdder_1bit port map(c1,EX_A(1) ,EX_B(1) , EX_SUM(1) , c2 );
FA2: FullAdder_1bit port map(c2,EX_A(2) ,EX_B(2) , EX_SUM(2) , c3 );
FA3: FullAdder_1bit port map(c3,EX_A(3) ,EX_B(3) , EX_SUM(3) , EX_Cout );
end Structural;