--
-- VHDL Architecture ece411.ADJ9.untitled
--
-- Created:
--          by - tmurray5.stdt (eelnx33.ews.illinois.edu)
--          at - 15:30:43 08/29/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY ADJ9 IS
   PORT( 
      offset9 : IN     LC3b_offset9;
      ADJ9out : OUT    LC3b_word
   );

-- Declarations

END ADJ9 ;

--
ARCHITECTURE untitled OF ADJ9 IS
BEGIN
  ADJ9out <= offset9(8) & 
             offset9(8) & 
             offset9(8) & 
             offset9(8) & 
             offset9(8) & 
             offset9(8) & 
             offset9 & '0' AFTER DELAY_MUX2;
END ARCHITECTURE untitled;

