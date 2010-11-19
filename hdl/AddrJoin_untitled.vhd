--
-- VHDL Architecture ece411.AddrJoin.untitled
--
-- Created:
--          by - tmurray5.stdt (gllnx15.ews.illinois.edu)
--          at - 16:45:18 11/08/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.NUMERIC_STD.all;
USE ieee.std_logic_1164.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY AddrJoin IS
     PORT( 
        Index     : IN     LC3b_index5;
        tagOut    : IN     lc3b_l2tag;
        newAddr   : OUT    LC3b_word
     );
-- Declarations

END AddrJoin ;

--
ARCHITECTURE untitled OF AddrJoin IS
BEGIN
  newAddr <= tagOut & index & "0000";
END ARCHITECTURE untitled;

