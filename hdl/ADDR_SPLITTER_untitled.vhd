--
-- VHDL Architecture ece411.ADDR_SPLITTER.untitled
--
-- Created:
--          by - tmurray5.stdt (eelnx23.ews.illinois.edu)
--          at - 23:37:25 09/23/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY ADDR_SPLITTER IS
   PORT( 
      ADDRESS : IN     LC3b_word;
      Index   : OUT    LC3b_index;
      offset : OUT    lc3b_offset;
      tag     : OUT    lc3b_tag
   );

-- Declarations

END ADDR_SPLITTER ;

--
ARCHITECTURE untitled OF ADDR_SPLITTER IS
BEGIN
  tag <= ADDRESS(15 DOWNTO 7);
  index <= ADDRESS(6 DOWNTO 4);
  offset <= ADDRESS(3 DOWNTO 0);
END ARCHITECTURE untitled;

