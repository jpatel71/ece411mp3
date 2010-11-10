--
-- VHDL Architecture ece411.MakeByte.untitled
--
-- Created:
--          by - bjohns38.stdt (eelnx37.ews.illinois.edu)
--          at - 16:36:00 11/06/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.NUMERIC_STD.all;
USE ieee.std_logic_1164.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY MakeByte IS
   PORT( 
      byteWordOut : OUT    lc3b_word;
      clk         : IN     std_logic;
      rfbout_ex   : IN     LC3b_word
   );

-- Declarations

END MakeByte ;

--
ARCHITECTURE untitled OF MakeByte IS
BEGIN
     byteWordOut <= rfbout_ex(7 downto 0) & rfbout_ex(7 downto 0);
END ARCHITECTURE untitled;

