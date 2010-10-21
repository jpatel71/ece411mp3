--
-- VHDL Architecture ece411.writeSel.untitled
--
-- Created:
--          by - tmurray5.stdt (gllnx25.ews.illinois.edu)
--          at - 15:42:24 09/27/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY writeSel IS
   PORT( 
      decodeOut : IN     std_logic;
      mwrite    : IN     std_logic;
      sel       : OUT    std_logic
   );

-- Declarations

END writeSel ;

--
ARCHITECTURE untitled OF writeSel IS
BEGIN
  sel <= decodeOut and mwrite after delay_logic;
END ARCHITECTURE untitled;

