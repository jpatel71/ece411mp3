--
-- VHDL Architecture ece411.L1TagCompare.untitled
--
-- Created:
--          by - tmurray5.stdt (eelnx29.ews.illinois.edu)
--          at - 14:08:18 10/27/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.NUMERIC_STD.all;
USE ieee.std_logic_1164.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY L1TagCompare IS
     PORT( 
        tag      : IN     lc3b_l1tag;
        cacheTag : IN     lc3b_l1tag;
        match    : OUT    std_logic
     );
-- Declarations

END L1TagCompare ;

--
ARCHITECTURE untitled OF L1TagCompare IS
BEGIN
    process(tag, cacheTag)
    Begin
      IF (tag = cacheTag) then
        match <= '1' after DELAY_COMPARATOR;
      else
        match <= '0' after DELAY_COMPARATOR;
      end if;
    end process;
END ARCHITECTURE untitled;

