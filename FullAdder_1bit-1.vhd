-- Team 8
-- Aaron Bernstein, Sengi Mathias
-- azb6642@psu.edu, svm6631@psu.edu
-- RippleCarryAdder_4bit_Template.vhd
-- Version 3.0 , 03/25/2025

-- This file implements a design of 1-bit Full-Adder Unit
library IEEE;
use IEEE.std_logic_1164.all;

entity FullAdder_1bit is
port(
  
  B: in std_logic;
  A: in std_logic;
  Cin: in std_logic;
  
  
  SUM: out std_logic;
  Cout: out std_logic 
  );
  
  
end FullAdder_1bit;

architecture rtl of FullAdder_1bit is
begin		
	
	SUM <= A XOR B XOR Cin ;
	
	Cout <= (A AND B) OR (Cin AND A) OR (Cin AND B) ; 
	-- You can also use
 -- 	Cout = (A AND B) OR (Cin AND (A OR B) );
	
end rtl;

