--
-- VHDL Architecture ece411.ADJ8.untitled
--
-- Created:
--          by - tmurray5.stdt (eelnx10.ews.illinois.edu)
--          at - 22:49:53 09/12/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY ADJ8 IS
   PORT( 
      trapvect8 : IN     lc3b_trapvect8;
      ADJ8out   : OUT    lc3b_word
   );

-- Declarations

END ADJ8 ;

--
ARCHITECTURE untitled OF ADJ8 IS
BEGIN
  	ADJ8out <= "0000000" & trapvect8 & '0' AFTER DELAY_MUX2;
END ARCHITECTURE untitled;

