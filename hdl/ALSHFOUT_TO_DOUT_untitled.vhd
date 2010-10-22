--
-- VHDL Architecture ece411.ALSHFOUT_TO_DOUT.untitled
--
-- Created:
--          by - jpatel71.stdt (eelnx6.ews.illinois.edu)
--          at - 17:57:54 10/21/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.NUMERIC_STD.all;
USE ieee.std_logic_1164.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY ALSHFOUT_TO_DOUT IS
   PORT( 
      ALUSHFMUXOut_MEM : IN     LC3b_word;
      D_DATOUT         : OUT    LC3b_word
   );

-- Declarations

END ALSHFOUT_TO_DOUT ;

--
ARCHITECTURE untitled OF ALSHFOUT_TO_DOUT IS
BEGIN
  D_DATOUT <= ALUSHFMUXOut_MEM;
END ARCHITECTURE untitled;
