--
-- VHDL Architecture ece411.delay.untitled
--
-- Created:
--          by - tmurray5.stdt (eelnx27.ews.illinois.edu)
--          at - 22:59:46 10/06/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY delay IS
   PORT( 
      x  : IN     std_logic;
      f  : OUT    std_logic
   );

-- Declarations

END delay ;

--
ARCHITECTURE untitled OF delay IS
BEGIN
  f <= x after delay_logic;
END ARCHITECTURE untitled;

