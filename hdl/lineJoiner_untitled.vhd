--
-- VHDL Architecture ece411.lineJoiner.untitled
--
-- Created:
--          by - tmurray5.stdt (gllnx25.ews.illinois.edu)
--          at - 16:24:07 09/27/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY lineJoiner IS
   PORT( 
      lineDataOut1 : IN     lc3b_word;
      lineDataOut2 : IN     lc3b_word;
      lineDataOut3 : IN     lc3b_word;
      lineDataOut4 : IN     lc3b_word;
      lineDataOut5 : IN     lc3b_word;
      lineDataOut6 : IN     lc3b_word;
      lineDataOut7 : IN     lc3b_word;
      lineDataOut0 : IN     lc3b_word;
      wcData       : OUT    lc3b_oword
   );

-- Declarations

END lineJoiner ;

--
ARCHITECTURE untitled OF lineJoiner IS
BEGIN
  wcData <= lineDataOut7 &
            lineDataOut6 &
            lineDataOut5 &
            lineDataOut4 &
            lineDataOut3 &
            lineDataOut2 &
            lineDataOut1 &
            lineDataOut0;
END ARCHITECTURE untitled;

