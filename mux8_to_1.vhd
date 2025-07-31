-- Team Number (T-ZERO)
-- 
-- 
-- mux4_to_1.vhd
-- Version 1.0 , 02/24/2019

library IEEE;
use IEEE.STD_LOGIC_1164.all;
 
 
 -- This design implements mux4_to_1
 --MODIFY THE CODE IF NEEDED
 
entity mux8_to_1 is
 port(
     I0: in std_logic_vector(3 downto 0);
     I1: in std_logic_vector(3 downto 0);
     I2: in std_logic_vector(3 downto 0);
     I3: in std_logic_vector(3 downto 0);
     I4: in std_logic_vector(3 downto 0);
     I5: in std_logic_vector(3 downto 0);
     I6: in std_logic_vector(3 downto 0);
     I7: in std_logic_vector(3 downto 0);
     S: in std_logic_vector(2 downto 0);
     RouterOutput: out std_logic_vector(3 downto 0)
 );
 end mux8_to_1;
 
 architecture behv2 of mux8_to_1 is
 begin
     -- use when.. else statement
     RouterOutput <= I0 when S="000" else  
                     I1 when S="001" else
                     I2 when S="010" else
                     I3 when S="011" else
                     I4 when S="100" else  
                     I5 when S="101" else
                     I6 when S="110" else
                     I7 when S="111" else
                     "ZZZZ";
 end behv2;
