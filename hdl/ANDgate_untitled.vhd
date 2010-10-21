--
-- VHDL Architecture ece411.hitDetector.untitled
--
-- Created:
--          by - tmurray5.stdt (eelnx28.ews.illinois.edu)
--          at - 22:07:47 09/26/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY ANDgate IS
   PORT( 
      a : IN     std_logic;
      b : IN     std_logic;
      f : OUT    std_logic
   );

-- Declarations

END ANDgate ;

--
ARCHITECTURE untitled OF ANDgate IS
BEGIN
  f <= a and b after delay_logic;
END ARCHITECTURE untitled;

