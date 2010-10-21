--
-- VHDL Architecture ece411.byteCombiner.untitled
--
-- Created:
--          by - tmurray5.stdt (eelnx30.ews.illinois.edu)
--          at - 21:31:36 09/28/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY byteCombiner IS
   PORT( 
      high : IN     lc3b_byte;
      low  : IN     lc3b_byte;
      lineDataOut : OUT  lc3b_word
   );

-- Declarations

END byteCombiner ;

--
ARCHITECTURE untitled OF byteCombiner IS
BEGIN
  lineDataOut <= high & low;
END ARCHITECTURE untitled;

