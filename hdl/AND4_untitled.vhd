--
-- VHDL Architecture ece411.AND4.untitled
--
-- Created:
--          by - tmurray5.stdt (eelnx2.ews.illinois.edu)
--          at - 12:28:23 10/29/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.NUMERIC_STD.all;
USE ieee.std_logic_1164.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY AND4 IS
   PORT( 
      F1         : IN     STD_LOGIC;
      cacheHit   : IN     STD_LOGIC;
      hitgate    : IN     std_logic;
      in_idleHit : IN     STD_LOGIC;
      dWrite     : OUT    STD_LOGIC
   );

-- Declarations

END AND4 ;

--
ARCHITECTURE untitled OF AND4 IS
BEGIN
  dWrite <= F1 and cacheHit and hitGate and in_idleHit after DELAY_LOGIC4;
END ARCHITECTURE untitled;

