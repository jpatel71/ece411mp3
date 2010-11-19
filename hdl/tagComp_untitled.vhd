--
-- VHDL Architecture ece411.tagComp.untitled
--
-- Created:
--          by - tmurray5.stdt (eelnx36.ews.illinois.edu)
--          at - 18:36:38 11/06/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.NUMERIC_STD.all;
USE ieee.std_logic_1164.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY tagComp IS
  PORT( 
	  A : IN     LC3B_l2tag;
	  B : IN     LC3B_l2tag;
	  F : OUT    STD_LOGIC
  );
-- Declarations

END tagComp ;

--
ARCHITECTURE untitled OF tagComp IS
BEGIN
	PROCESS(A,B)
	BEGIN
		IF(A = B) THEN
			F <= '1' AFTER DELAY_COMPARE8;
		ELSE
			F <= '0' AFTER DELAY_COMPARE8;
		END IF;
	END PROCESS;
END ARCHITECTURE untitled;

