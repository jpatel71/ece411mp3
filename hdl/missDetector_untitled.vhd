--
-- VHDL Architecture ece411.missDetector.untitled
--
-- Created:
--          by - tmurray5.stdt (eelnx28.ews.illinois.edu)
--          at - 22:18:56 09/26/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY missDetector IS
   PORT( 
      AccessOut : IN     std_logic;
      f1        : IN     std_logic;
      miss      : OUT    std_logic
   );

-- Declarations

END missDetector ;

--
ARCHITECTURE untitled OF missDetector IS
BEGIN
  miss <= f1 and AccessOut after DELAY_LOGIC;
END ARCHITECTURE untitled;

