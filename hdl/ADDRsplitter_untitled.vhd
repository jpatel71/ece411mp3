--
-- VHDL Architecture ece411.ADDRsplitter.untitled
--
-- Created:
--          by - tmurray5.stdt (eelnx25.ews.illinois.edu)
--          at - 22:42:01 10/26/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.NUMERIC_STD.all;
USE ieee.std_logic_1164.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY ADDRsplitter IS
   PORT( 
      tag     : OUT    lc3b_l1tag;
      index   : OUT    lc3b_index7;
      offset  : OUT    lc3b_offset;
      Address : IN     lc3b_word
   );

-- Declarations

END ADDRsplitter ;

--
ARCHITECTURE untitled OF ADDRsplitter IS
BEGIN
  tag <= Address(15 downto 11);
  index <= Address(10 downto 4);
  offset <= Address(3 downto 0);
END ARCHITECTURE untitled;

