--
-- VHDL Architecture ece411.DataArray2K.untitled
--
-- Created:
--          by - tmurray5.stdt (eelnx25.ews.illinois.edu)
--          at - 22:26:56 10/26/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.NUMERIC_STD.all;
USE ieee.std_logic_1164.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY dirtyArray1k IS
   PORT( 
      index     : IN     lc3b_index6;
      reset_l   : IN     std_logic;
      writeData : IN     std_logic;
      dirtyIN   : IN     std_logic;
      dirtyOUT  : OUT    std_logic
   );

-- Declarations

END dirtyArray1k ;

--
ARCHITECTURE untitled OF dirtyArray1k IS
  TYPE DirtyArray1K IS array (63 downto 0) of std_logic;
  SIGNAL Dirty : DirtyArray1k;
  
  BEGIN
    --------------------------------------------------------------
	  ReadFromDirtyArray : PROCESS (Dirty, index)
	  --------------------------------------------------------------
    
		  VARIABLE DirtyIndex : integer;
		  BEGIN
			  DirtyIndex := to_integer(unsigned(Index));
			  DirtyOut <= Dirty(DirtyIndex) after DELAY_1KB_SINGLE;
	  
	  END PROCESS ReadFromDirtyArray;
	  
	  --------------------------------------------------------------
	  WriteToDirtyArray : PROCESS (reset_l, index, writeData, dirtyIN)
	  --------------------------------------------------------------	
		  VARIABLE DirtyIndex : integer;
		  BEGIN
			  DirtyIndex := to_integer(unsigned(index));
		  IF RESET_L = '0' THEN
		    for i in 63 downto 0 loop
		      Dirty(i) <= '0';
        end loop;
		  END IF;

		  IF (writeData = '1') THEN
			  Dirty(dirtyIndex) <= dirtyIN;
		  END IF;
	  
	  END PROCESS WriteToDirtyArray;

END ARCHITECTURE untitled;
  
