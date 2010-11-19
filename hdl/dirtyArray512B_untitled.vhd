--
-- VHDL Architecture ece411.dirtyArray512B.untitled
--
-- Created:
--          by - tmurray5.stdt (eelnx36.ews.illinois.edu)
--          at - 18:18:51 11/06/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.NUMERIC_STD.all;
USE ieee.std_logic_1164.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY dirtyArray512B IS
   PORT( 
      dataWrite : IN     std_logic;
      dirtyIn   : IN     std_logic;
      index     : IN     lc3b_index5;
      reset_l   : IN     std_logic;
      dirtyOut  : OUT    std_logic
   );

-- Declarations

END dirtyArray512B ;

--
ARCHITECTURE untitled OF dirtyArray512B IS
TYPE DirtyArray512B IS array (31 downto 0) of std_logic;
  SIGNAL Dirty : DirtyArray512B;
  
  BEGIN
    --------------------------------------------------------------
	  ReadFromDirtyArray : PROCESS (Dirty, index)
	  --------------------------------------------------------------
    
		  VARIABLE DirtyIndex : integer;
		  BEGIN
			  DirtyIndex := to_integer(unsigned(Index));
			  DirtyOut <= Dirty(DirtyIndex) after DELAY_4KB_SINGLE;
	  
	  END PROCESS ReadFromDirtyArray;
	  
	  --------------------------------------------------------------
	  WriteToDirtyArray : PROCESS (reset_l, index, dataWrite, dirtyIN)
	  --------------------------------------------------------------	
		  VARIABLE DirtyIndex : integer;
		  BEGIN
			  DirtyIndex := to_integer(unsigned(index));
		  IF RESET_L = '0' THEN
		    for i in 31 downto 0 loop
		      Dirty(i) <= '0';
        end loop;
		  END IF;

		  IF (dataWrite = '1') THEN
			  Dirty(dirtyIndex) <= dirtyIN;
		  END IF;
	  
	  END PROCESS WriteToDirtyArray;

END ARCHITECTURE untitled;

