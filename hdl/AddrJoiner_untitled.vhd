--
-- VHDL Architecture ece411.AddrJoiner.untitled
--
-- Created:
--          by - tmurray5.stdt (eelnx28.ews.illinois.edu)
--          at - 21:50:22 09/26/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY AddrJoiner IS
   PORT( 
      Index     : IN     LC3b_index6;
      tagMuxOut : IN     lc3b_l1tag;
      b         : OUT    LC3b_word
   );

-- Declarations

END AddrJoiner ;

--
ARCHITECTURE untitled OF AddrJoiner IS
BEGIN
  B <= tagMuxOut & index & "0000";
END ARCHITECTURE untitled;

