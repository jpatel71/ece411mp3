--
-- VHDL Architecture ece411.NANDgate2.untitled
--
-- Created:
--          by - tmurray5.stdt (eelnx27.ews.illinois.edu)
--          at - 21:13:20 10/06/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY NANDgate2 IS
   PORT( 
      a : IN     std_logic;
      b : IN     std_logic;
      w : OUT    std_logic
   );

-- Declarations

END NANDgate2 ;

--
ARCHITECTURE untitled OF NANDgate2 IS
BEGIN
  w <= not(a and b) after delay_logic;
END ARCHITECTURE untitled;

