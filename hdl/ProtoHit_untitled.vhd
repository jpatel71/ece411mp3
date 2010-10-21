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

ENTITY ProtoHit IS
   PORT( 
      preHit1  : IN     std_logic;
      preHit0  : IN     std_logic;
      protoHit : OUT    std_logic
   );

-- Declarations

END ProtoHit ;

--
ARCHITECTURE untitled OF ProtoHit IS
BEGIN
  protoHit <= preHit0 or preHit1 after delay_logic;
END ARCHITECTURE untitled;

