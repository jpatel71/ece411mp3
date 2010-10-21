--
-- VHDL Architecture ece411.TagMux.untitled
--
-- Created:
--          by - tmurray5.stdt (eelnx28.ews.illinois.edu)
--          at - 21:43:27 09/26/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY TagMux IS
   PORT( 
      tagOut0   : IN     lc3b_tag;
      tagOut1   : IN     lc3b_tag;
      tagMuxOut : OUT    lc3b_tag;
      LRUOut    : IN     std_logic
   );

-- Declarations

END TagMux ;

--
ARCHITECTURE untitled OF TagMux IS
BEGIN
	PROCESS (tagOut0, tagOut1, LRUOut)
	VARIABLE STATE : LC3B_TAG;
	BEGIN
		CASE LRUOut IS
			WHEN '0' =>
				STATE := tagOut0;
			WHEN '1' =>
				STATE := tagOut1;
			WHEN OTHERS =>
				STATE := (OTHERS => 'X');
		END CASE;
	tagMuxOut <= STATE AFTER DELAY_MUX2;
	END PROCESS;
END UNTITLED;
