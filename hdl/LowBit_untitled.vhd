--
-- VHDL Architecture ece411.LowBit.untitled
--
-- Created:
--          by - tmurray5.stdt (eelnx38.ews.illinois.edu)
--          at - 23:44:21 09/16/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY LowBit IS
   PORT( 
      ADDRESSin : IN lc3b_word;
      clk : IN     std_logic;
      ADDRESS : OUT lc3b_word;
      ADDRESS0 : OUT std_logic
   );

-- Declarations

END LowBit ;

--
ARCHITECTURE untitled OF LowBit IS
BEGIN
  ADDRESS <= ADDRESSin;
  ADDRESS0 <= ADDRESSin(0);
END ARCHITECTURE untitled;

