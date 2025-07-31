-- Team Number 8
-- Sengi Mathias, Aaron Bernstein
-- svm6631@psu.edu, azb6642@psu.edu
-- Lab02.vhd
-- Lab02 , 1/21/2025
-- This file implements a design simple OR gate
library IEEE;
use IEEE.std_logic_1164.all;
entity IsOdd is
port (
A : in std_logic_vector(3 downto 0);
F : out std_logic
);
end IsOdd;
-- Simple OR gate design
architecture rtl of IsOdd is
begin
F <= A(0);
end rtl;
