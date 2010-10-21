--
-- VHDL Architecture ece411.notGate.untitled
--
-- Created:
--          by - tmurray5.stdt (eelnx28.ews.illinois.edu)
--          at - 22:16:57 09/26/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY notGate IS
   PORT( 
      A : IN     std_logic;
      f : OUT    std_logic
   );

-- Declarations

END notGate ;

--
ARCHITECTURE untitled OF notGate IS
BEGIN
  f <= not(A) after delay_logic;
END ARCHITECTURE untitled;

