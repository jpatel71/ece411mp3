--
-- VHDL Architecture ece411.checkValid.untitled
--
-- Created:
--          by - tmurray5.stdt (eelnx25.ews.illinois.edu)
--          at - 10:30:38 09/24/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY checkValid IS
   PORT( 
      match    : IN     std_logic;
      validOut : IN     std_logic;
      preHit   : OUT    std_logic
   );

-- Declarations

END checkValid ;

--
ARCHITECTURE untitled OF checkValid IS
BEGIN
  preHit <= match and validOut after DELAY_LOGIC;
END ARCHITECTURE untitled;

