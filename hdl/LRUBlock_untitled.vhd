--
-- VHDL Architecture ece411.LRUBlock.untitled
--
-- Created:
--          by - tmurray5.stdt (dcllnx27.ews.illinois.edu)
--          at - 22:06:37 11/09/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.NUMERIC_STD.all;
USE ieee.std_logic_1164.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY LRUBlock IS
   PORT( 
      LRUOut : OUT    STD_LOGIC_VECTOR (2 DOWNTO 0)
   );

-- Declarations

END LRUBlock ;

--
ARCHITECTURE untitled OF LRUBlock IS
BEGIN
  LRUOut <= "000";
END ARCHITECTURE untitled;

