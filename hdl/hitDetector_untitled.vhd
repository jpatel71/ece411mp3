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

ENTITY hitDetector IS
   PORT( 
      AccessOut  : IN     std_logic;
      in_idleHit : IN     std_logic;
      protoHit   : IN     std_logic;
      hitgate    : IN     std_logic;
      hit        : OUT    std_logic
   );

-- Declarations

END hitDetector ;

--
ARCHITECTURE untitled OF hitDetector IS
BEGIN
  hit <= AccessOut and in_idleHit and protoHit and hitGate after delay_logic4;
END ARCHITECTURE untitled;

