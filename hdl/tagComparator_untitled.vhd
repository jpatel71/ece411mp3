--
-- VHDL Architecture ece411.tagComparator.untitled
--
-- Created:
--          by - tmurray5.stdt (eelnx25.ews.illinois.edu)
--          at - 10:20:25 09/24/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY tagComparator IS
   PORT( 
      addrTag  : IN     lc3b_tag;
      cacheTag : IN     lc3b_tag;
      match    : OUT    std_logic
   );

-- Declarations

END tagComparator ;

--
ARCHITECTURE untitled OF tagComparator IS
SIGNAL sel : lc3b_tag;
BEGIN
  process(addrTag, cacheTag)
  Begin
    IF (addrTag = cacheTag) then
      match <= '1' after DELAY_COMPARATOR;
    else
      match <= '0' after DELAY_COMPARATOR;
    end if;
  end process;
END ARCHITECTURE untitled;

