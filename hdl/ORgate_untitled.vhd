--
-- VHDL Architecture ece411.ProtoHit.untitled
--
-- Created:
--          by - tmurray5.stdt (eelnx25.ews.illinois.edu)
--          at - 10:49:42 09/24/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY ORgate IS
   PORT( 
      a : IN     std_logic;
      b : IN     std_logic;
      f : OUT    std_logic
   );

-- Declarations

END ORgate ;

--
ARCHITECTURE untitled OF ORgate IS
BEGIN
  f <= a or b after delay_logic;
END ARCHITECTURE untitled;