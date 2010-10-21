--
-- VHDL Architecture ece411.PCAdder.untitled
--
-- Created:
--          by - bjohns38.stdt (eelnx36.ews.illinois.edu)
--          at - 12:29:17 10/18/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.NUMERIC_STD.all;
USE ieee.std_logic_1164.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY PCAdder IS
   PORT( 
      sig0 : IN     std_logic;
      AdderMuxOut : IN     std_logic;
      B    : OUT    LC3b_word
   );

-- Declarations

END PCAdder ;

--
ARCHITECTURE untitled OF PCAdder IS
BEGIN
  B <= STD_LOGIC_VECTOR( SIGNED(sig0) + SIGNED(AdderMuxOut) ) AFTER DELAY_ADDER;
END ARCHITECTURE untitled;

