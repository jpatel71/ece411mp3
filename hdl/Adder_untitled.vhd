--
-- VHDL Architecture ece411.Adder.untitled
--
-- Created:
--          by - tmurray5.stdt (eelnx34.ews.illinois.edu)
--          at - 16:01:03 09/11/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY Adder IS
   PORT( 
      clk         : IN     std_logic;
      PCout       : IN     LC3b_word;
      AdderMuxout : IN     LC3b_word;
      Adderout    : OUT    LC3b_word
   );

-- Declarations

END Adder ;

--
ARCHITECTURE untitled OF Adder IS
BEGIN
  Adderout <= STD_LOGIC_VECTOR( SIGNED(PCout) + SIGNED(AdderMuxout) ) AFTER DELAY_ADDER; 
END ARCHITECTURE untitled;
