--
-- VHDL Architecture ece411.ANDgate3.untitled
--
-- Created:
--          by - tmurray5.stdt (eelnx30.ews.illinois.edu)
--          at - 21:36:14 09/28/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY ANDgate3 IS
   PORT( 
      a : IN     std_logic;
      b : IN     std_logic;
      c : IN     std_logic;
      x : OUT    std_logic
   );

-- Declarations

END ANDgate3 ;

--
ARCHITECTURE untitled OF ANDgate3 IS
BEGIN
  x <= a and b and c after delay_logic4;
END ARCHITECTURE untitled;

