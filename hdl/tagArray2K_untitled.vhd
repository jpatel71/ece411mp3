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

ENTITY tagArray1K IS
   PORT( 
      index     : IN     lc3b_index6;
      reset_l   : IN     std_logic;
      writeData : IN     std_logic;
      tagIN     : IN     lc3b_l1tag;
      tagOUT    : OUT    lc3b_l1tag
   );

-- Declarations

END tagArray1K ;

--
ARCHITECTURE untitled OF tagArray1K IS
  TYPE TagArray1K IS array (63 downto 0) of LC3B_l1tag;
  SIGNAL Tag : TagArray1K;
  
  BEGIN
    --------------------------------------------------------------
	  ReadFromTagArray : PROCESS (Tag, index)
	  --------------------------------------------------------------
    
		  VARIABLE TagIndex : integer;
		  BEGIN
			  TagIndex := to_integer(unsigned(Index));
			  TagOut <= Tag(TagIndex) after DELAY_1KB_SINGLE;
	  
	  END PROCESS ReadFromTagArray;
	  
	  --------------------------------------------------------------
	  WriteToTagArray : PROCESS (reset_l, index, writeData, TagIN)
	  --------------------------------------------------------------	
		  VARIABLE TagIndex : integer;
		  BEGIN
			  TagIndex := to_integer(unsigned(index));
		  IF RESET_L = '0' THEN
		    for i in 63 downto 0 loop
		      Tag(i) <= (OTHERS => 'X');
        end loop;
		  END IF;

		  IF (writeData = '1') THEN
			  Tag(TagIndex) <= TagIN;
		  END IF;
	  
	  END PROCESS WriteToTagArray;

END ARCHITECTURE untitled;
  
