--
-- VHDL Architecture ece411.L2AddrSplit.untitled
--
-- Created:
--          by - tmurray5.stdt (eelnx36.ews.illinois.edu)
--          at - 18:30:56 11/06/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.NUMERIC_STD.all;
USE ieee.std_logic_1164.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY L2AddrSplit IS
   PORT( 
      pm_address : IN     LC3B_WORD;
      index      : OUT    lc3b_index5;
      tag        : OUT    lc3b_l2tag;
      offset     : OUT    lc3b_offset
   );

-- Declarations

END L2AddrSplit ;

--
ARCHITECTURE untitled OF L2AddrSplit IS
BEGIN
  tag <= PM_ADDRESS(15 downto 9);
  index <= PM_ADDRESS(8 downto 4);
  offset <= PM_ADDRESS(3 downto 0);
END ARCHITECTURE untitled;

