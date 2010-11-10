--
-- VHDL Architecture ece411.ADJ6.untitled
--
-- Created:
--          by - tmurray5.stdt (eelnx33.ews.illinois.edu)
--          at - 15:24:40 08/29/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.NUMERIC_STD.all;
USE ieee.std_logic_1164.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY index6ns IS
   PORT( 
      clk       : IN     std_logic;
      index6_ID : IN     LC3b_index6;
      ADJ6ns_ID : OUT    lc3b_word
   );

-- Declarations

END index6ns ;

--
ARCHITECTURE UNTITLED OF index6ns IS
BEGIN
	ADJ6ns_ID <= INDEX6_ID(5) & 
	           INDEX6_ID(5) &
	           INDEX6_ID(5) & 
	           INDEX6_ID(5) & 
	           INDEX6_ID(5) & 
	           INDEX6_ID(5) & 
	           INDEX6_ID(5) & 
	           INDEX6_ID(5) & 
	           INDEX6_ID(5) &
	           INDEX6_ID(5) &  
	           INDEX6_ID  AFTER DELAY_MUX2;
END UNTITLED;

