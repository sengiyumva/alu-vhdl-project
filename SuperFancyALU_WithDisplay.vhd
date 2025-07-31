-- Sengi mathias, Aaron Bernstein
-- Team 8
-- svm6631, azb6642
-- Lab 9
-- Version 1.0 , 03/18/2025

-- This file implements a design of a 3 bit mux4_to_1_with_display and active LOW enable signal

library IEEE;
use IEEE.std_logic_1164.all;

entity FancyALU_WithDisplay is
port(
 
--input and output ports
A,B: in std_logic_vector( 3 downto 0);
OPCODE: in std_logic_vector(2 downto 0);
--F: out std_logic_vector(3 downto 0);
cin: in std_logic;

SegValue: out std_logic_vector(6 downto 0) ;
AnodeValue: out std_logic_vector(3 downto 0);
dp: out std_logic

 );
end FancyALU_WithDisplay;

architecture rtl of FancyALU_WithDisplay is

--component definitions
component Segment7_Decoder

port(
   Value: in std_logic_vector(3 downto 0);
  seg: out std_logic_vector(6 downto 0) ;   -- complete this
  an: out std_logic_vector(3 downto 0) ;
  dp: out std_logic
  );

end component;

component mux8_to_1
port(
    I7: in std_logic_vector(3 downto 0);
    I6: in std_logic_vector(3 downto 0);
    I5: in std_logic_vector(3 downto 0);
    I4: in std_logic_vector(3 downto 0);
    I3: in std_logic_vector(3 downto 0);
    I2: in std_logic_vector(3 downto 0);
    I1: in std_logic_vector(3 downto 0);
    I0: in std_logic_vector(3 downto 0);
    S: in std_logic_vector(2 downto 0);
    RouterOutput: out std_logic_vector(3 downto 0)
    );
end component;

component XOR_gate
port(
 A,B : in  std_logic_vector(3 downto 0);
 F : out  std_logic_vector(3 downto 0)
 );
end component;

component AND_gate
port(
  A,B :in  std_logic_vector(3 downto 0);
  F : out  std_logic_vector(3 downto 0)
  );
end component;

component or_gate
port(
  A,B :in  std_logic_vector(3 downto 0);
  F : out  std_logic_vector(3 downto 0)
  );
end component;
component IsPrime
  port(
    A :in  std_logic_vector(3 downto 0);
    F : out  std_logic
    );
  end component;
component IsEven
  port(
    A :in  std_logic_vector(3 downto 0);
    F : out  std_logic
    );
  end component;
component IsOdd
    port(
      A :in  std_logic_vector(3 downto 0);
      F : out  std_logic
      );
    end component;

component RippleCarryAdder_4bit
port(
  EX_Cin: in std_logic;
  EX_A: in std_logic_vector(3 downto 0);
  EX_B: in std_logic_vector(3 downto 0);
  EX_SUM: out std_logic_vector(3 downto 0);
  EX_Cout: out std_logic
);
end component;

component Comparator_4bit
port(
  A,B: in std_logic_vector(1 downto 0);
less, equal, greater : OUT STD_LOGIC
);
end component;

component Customized_Segment7_Decoder
port(
    A,B: in std_logic_vector(3 downto 0);
    seg: out std_logic_vector(6 downto 0) ;   -- complete this
    an: out std_logic_vector(3 downto 0) ;
    dp: out std_logic 
);
end component;

--Signal definitions

signal output: std_logic_vector(3 downto 0);
signal XOROutput: std_logic_vector(3 downto 0);
signal OROutput: std_logic_vector(3 downto 0);
signal ANDOutput: std_logic_vector(3 downto 0);
signal AdderOutput: std_logic_vector(3 downto 0);
signal primeOutput,evenOutput, oddOutput: std_logic;
signal primeOutput4Bit,evenOutput4Bit, oddOutput4Bit: std_logic_vector(3 downto 0);
signal AdderCout: std_logic;
signal Less, Equal, Greater: std_logic;
signal compareDummy: std_logic_vector(3 downto 0);
signal seg: std_logic_vector(6 downto 0);
signal dpSig1,dpSig: std_logic;
signal segCustom: std_logic_vector(6 downto 0);
signal dpSigCustom: std_logic;
signal segChoice: std_logic_vector(6 downto 0);

begin
 
--PORT MAP 
 MyDriver: Segment7_Decoder  port map  (output, seg, AnodeValue, dpSig1);
 myCustomDriver: Customized_Segment7_Decoder port map ( A,B, segCustom, AnodeValue, dpSigCustom);
 MyAdder: RippleCarryAdder_4bit port map (cin,A,B, AdderOutput, AdderCout);
 MyXOR: XOR_gate port map (A, B, XOROutput);
 MyOR: or_gate port map (A, B, OROutput);
 MyAND: AND_gate port map (A, B, ANDOutput);
 MyMux: mux8_to_1 port map (evenOutput4Bit,oddOutput4Bit,primeOutput4Bit,compareDummy,XOROutput,OROutput,ANDOutput,AdderOutput, OPCODE,output);
 MyPrime: IsPrime port map (A, primeOutput);
 MyEven: IsEven port map (A, evenOutput);
 MyOdd: IsOdd port map (A, oddOutput);
 
--Output Assignment
dp <= NOT(AdderCout and (OPCODE(0)) and (OPCODE(1)) and (OPCODE(2)) );
primeOutput4Bit <= "000" & primeOutput ;
evenOutput4Bit <= "000" & evenOutput;
oddOutput4Bit <= "000" & oddOutput;
segValue <= segCustom when (OPCODE = "100") else seg;
end rtl;