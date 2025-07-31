-- Team Number 8
-- Sengi Mathias, Aaron Bernstein
-- svm6631@psu.edu, azb6642@psu.edu
-- Lab02.vhd
-- Lab02 , 1/21/2025
-- This file implements a design simple OR gate
library IEEE;
use IEEE.std_logic_1164.all;
entity IsPrime is
port (
A :in std_logic_vector(3 downto 0);
F : out std_logic
);
end IsPrime;
-- Simple OR gate design
architecture rtl of IsPrime is
begin
F <= (A(2) and Not(A(1)) and A(0)) or (Not(A(3)) and A(1) and A(0)) or (Not(A(2)) and A(1) and Not(A(0)));
end rtl;
