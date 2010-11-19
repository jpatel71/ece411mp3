--
-- VHDL Architecture ece411.protoHit_L2.untitled
--
-- Created:
--          by - tmurray5.stdt (eelnx30.ews.illinois.edu)
--          at - 18:26:30 11/07/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.NUMERIC_STD.all;
USE ieee.std_logic_1164.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY protoHit_L2 IS
   PORT( 
      preHit0 : IN     STD_LOGIC;
      preHit1 : IN     STD_LOGIC;
      preHit2 : IN     STD_LOGIC;
      preHit3 : IN     STD_LOGIC;
      preHit4 : IN     STD_LOGIC;
      preHit5 : IN     STD_LOGIC;
      preHit6 : IN     STD_LOGIC;
      preHit7 : IN     STD_LOGIC;
      protoHit: OUT    STD_LOGIC
   );

-- Declarations

END protoHit_L2 ;

--
ARCHITECTURE untitled OF protoHit_L2 IS
BEGIN
	OR8: PROCESS(preHit0, preHit1, preHit2, preHit3, preHit4, preHit5, preHit6, preHit7)
	BEGIN
		protoHit <= preHit0 OR preHit1 OR preHit2 OR preHit3 OR preHit4 OR preHit5 OR preHit6 OR preHit7 AFTER DELAY_LOGIC8;
	END PROCESS OR8;
END ARCHITECTURE untitled;

