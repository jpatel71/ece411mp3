--
-- VHDL Architecture ece411.BR_add.untitled
--
-- Created:
--          by - bjohns38.ece411_G8 (gllnx6.ews.illinois.edu)
--          at - 16:03:32 10/20/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.NUMERIC_STD.all;
USE ieee.std_logic_1164.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY BR_add IS
   PORT( 
      F            : IN     LC3b_word;
      LEFTSHIFTOUT : IN     LC3b_word;
      BR_add_EX    : OUT    lc3b_word
   );

-- Declarations

END BR_add ;

--
ARCHITECTURE untitled OF BR_add IS
BEGIN
  BR_add_EX <= PCPlus2_EX + ADJ9out_EX;
END ARCHITECTURE untitled;

