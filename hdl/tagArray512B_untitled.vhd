--
-- VHDL Architecture ece411.tagArray512B.untitled
--
-- Created:
--          by - tmurray5.stdt (eelnx36.ews.illinois.edu)
--          at - 18:12:47 11/06/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.NUMERIC_STD.all;
USE ieee.std_logic_1164.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY tagArray512B IS
   PORT( 
      dataWrite : IN     std_logic;
      index     : IN     lc3b_index5;
      reset_l   : IN     std_logic;
      tagIn     : IN     lc3b_l2tag;
      tagOut    : OUT    lc3b_l2tag
   );

-- Declarations

END tagArray512B ;

--
ARCHITECTURE untitled OF tagArray512B IS
TYPE TagArray512B IS array (31 downto 0) of LC3B_l2tag;
  SIGNAL Tag : TagArray512B;
  
  BEGIN
    --------------------------------------------------------------
	  ReadFromTagArray : PROCESS (Tag, index)
	  --------------------------------------------------------------
    
		  VARIABLE TagIndex : integer;
		  BEGIN
			  TagIndex := to_integer(unsigned(Index));
			  TagOut <= Tag(TagIndex) after DELAY_4KB_SINGLE;
	  
	  END PROCESS ReadFromTagArray;
	  
	  --------------------------------------------------------------
	  WriteToTagArray : PROCESS (reset_l, index, dataWrite, TagIn)
	  --------------------------------------------------------------	
		  VARIABLE TagIndex : integer;
		  BEGIN
			  TagIndex := to_integer(unsigned(index));
		  IF RESET_L = '0' THEN
		    for i in 31 downto 0 loop
		      Tag(i) <= (OTHERS => 'X');
        end loop;
		  END IF;

		  IF (dataWrite = '1') THEN
			  Tag(TagIndex) <= TagIN;
		  END IF;
	  
	  END PROCESS WriteToTagArray;


END ARCHITECTURE untitled;

