--
-- VHDL Architecture ece411.TagArray.untitled
--
-- Created:
--          by - tmurray5.stdt (eelnx38.ews.illinois.edu)
--          at - 17:53:20 09/26/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY TagArray IS
   PORT( 
      reset_l  : IN     std_logic;
      index    : IN     lc3b_index;
      tagIn    : IN     lc3b_tag;
      tagOut   : OUT    lc3b_tag;
      DataWrite : IN     std_logic
   );

-- Declarations

END TagArray ;

--
ARCHITECTURE untitled OF TagArray IS

  TYPE TagArray IS	array (7 downto 0) of LC3b_tag;
  SIGNAL Tag : TagArray;

  BEGIN
	  --------------------------------------------------------------
	  ReadFromTagArray : PROCESS (Tag, Index)
	  --------------------------------------------------------------
    
		  VARIABLE TagIndex : integer;
		  BEGIN
			  TagIndex := to_integer(unsigned(Index));
			  TagOut <= Tag(TagIndex) after 20 ns;
	  
	  END PROCESS ReadFromTagArray;
  
	  --------------------------------------------------------------
	  WriteToTagArray : PROCESS (RESET_L, Index, DataWrite, TagIn)
	  -------------------------------------------------------	------	
		  VARIABLE TagIndex : integer;
		  BEGIN
			  TagIndex := to_integer(unsigned(Index));
		  IF RESET_L = '0' THEN
			  Tag(0) <= (OTHERS => 'X');
			  Tag(1) <= (OTHERS => 'X');
			  Tag(2) <= (OTHERS => 'X');
			  Tag(3) <= (OTHERS => 'X');
			  Tag(4) <= (OTHERS => 'X');
			  Tag(5) <= (OTHERS => 'X');
			  Tag(6) <= (OTHERS => 'X');
			  Tag(7) <= (OTHERS => 'X');
		  END IF;

		  IF (DataWrite = '1') THEN
			  Tag(TagIndex) <= TagIn;
		  END IF;
	  
	  END PROCESS WriteToTagArray;

END ARCHITECTURE untitled;