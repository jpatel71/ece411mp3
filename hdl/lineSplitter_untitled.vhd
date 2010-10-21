--
-- VHDL Architecture ece411.lineSplitter.untitled
--
-- Created:
--          by - tmurray5.stdt (eelnx28.ews.illinois.edu)
--          at - 22:54:16 09/26/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY lineSplitter IS
   PORT( 
      line0          : OUT    lc3b_word;
      line1          : OUT    lc3b_word;
      line2          : OUT    lc3b_word;
      line3          : OUT    lc3b_word;
      line4          : OUT    lc3b_word;
      line5          : OUT    lc3b_word;
      line6          : OUT    lc3b_word;
      line7          : OUT    lc3b_word;
      WaySelecterOut : IN     LC3B_oWORD
   );

-- Declarations

END lineSplitter ;

--
ARCHITECTURE untitled OF lineSplitter IS
BEGIN
  line0 <= waySelecterOut(15 downto 0);
  line1 <= waySelecterOut(31 downto 16);
  line2 <= waySelecterOut(47 downto 32);
  line3 <= waySelecterOut(63 downto 48);
  line4 <= waySelecterOut(79 downto 64);
  line5 <= waySelecterOut(95 downto 80);
  line6 <= waySelecterOut(111 downto 96);
  line7 <= waySelecterOut(127 downto 112);
END ARCHITECTURE untitled;

