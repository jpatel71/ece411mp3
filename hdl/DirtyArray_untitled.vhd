--
-- VHDL Architecture ece411.DirtyArray.untitled
--
-- Created:
--          by - tmurray5.stdt (eelnx38.ews.illinois.edu)
--          at - 18:10:08 09/26/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY DirtyArray IS
   PORT( 
      dirtyOut  : OUT    std_logic;
      index     : IN     lc3b_index;
      reset_l   : IN     std_logic;
      dirtyIn   : IN     std_logic;
      DataWrite : IN     std_logic
   );

-- Declarations

END DirtyArray ;

--
ARCHITECTURE untitled OF DirtyArray IS

  TYPE DirtyArray IS	array (7 downto 0) of std_logic;
  SIGNAL Dirty : DirtyArray;

  BEGIN
	  --------------------------------------------------------------
	  ReadFromDirtyArray : PROCESS (Dirty, Index)
	  --------------------------------------------------------------
    
		  VARIABLE DirtyIndex : integer;
		  BEGIN
			  DirtyIndex := to_integer(unsigned(Index));
			  DirtyOut <= Dirty(DirtyIndex) after 20 ns;
	  
	  END PROCESS ReadFromDirtyArray;
  
	  --------------------------------------------------------------
	  WriteToDirtyArray : PROCESS (RESET_L, Index, DataWrite, DirtyIn)
	  --------------------------------------------------------------	
		  VARIABLE DirtyIndex : integer;
		  BEGIN
			  DirtyIndex := to_integer(unsigned(Index));
		  IF RESET_L = '0' THEN
			  Dirty(0) <= '0';
			  Dirty(1) <= '0';
			  Dirty(2) <= '0';
			  Dirty(3) <= '0';
			  Dirty(4) <= '0';
			  Dirty(5) <= '0';
			  Dirty(6) <= '0';
			  Dirty(7) <= '0';
		  END IF;

		  IF (DataWrite = '1') THEN
			  Dirty(DirtyIndex) <= DirtyIn;
		  END IF;
	  
	  END PROCESS WriteToDirtyArray;

END ARCHITECTURE untitled;
