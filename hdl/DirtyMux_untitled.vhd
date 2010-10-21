--
-- VHDL Architecture ece411.DirtyMux.untitled
--
-- Created:
--          by - tmurray5.stdt (eelnx28.ews.illinois.edu)
--          at - 22:31:26 09/26/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY DirtyMux IS
   PORT( 
      dirtyOut0 : IN     std_logic;
      dirtyOut1 : IN     std_logic;
      dirty     : OUT    std_logic;
      LRUout   : IN     std_logic
   );

-- Declarations

END DirtyMux ;

--
ARCHITECTURE untitled OF DirtyMux IS
BEGIN
  	PROCESS (dirtyOut0, dirtyOut1, LRUout)
	  VARIABLE STATE : std_logic;
	  BEGIN
		  CASE LRUout IS
			  WHEN '0' =>
				  STATE := dirtyOut0;
			  WHEN '1' =>
				  STATE := dirtyOut1;
			  WHEN OTHERS =>
				  STATE := 'X';
		  END CASE;
	  dirty <= STATE AFTER DELAY_MUX2;
	  END PROCESS;
END ARCHITECTURE untitled;

