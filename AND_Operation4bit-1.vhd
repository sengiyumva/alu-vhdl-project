-- Team 8
-- Aaron Bernstein, Sengi Mathias
-- azb6642@psu.edu, svm6631@psu.edu
-- RippleCarryAdder_4bit_Template.vhd
-- Version 3.0 , 03/25/2025

-- This file implements a design simple OR gate


library IEEE;
use IEEE.std_logic_1164.all;

entity AND_gate is
port ( 

A,B :in  std_logic_vector(3 downto 0);
F : out  std_logic_vector(3 downto 0)
);
end AND_gate;


architecture rtl of AND_gate is
begin
 
    F <= A and B;
 
end rtl;
