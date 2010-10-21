--
-- VHDL Architecture ece411.highLow.unititled
--
-- Created:
--          by - tmurray5.stdt (gllnx25.ews.illinois.edu)
--          at - 15:27:20 09/27/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY highLow IS
  PORT( 
     datain    : IN     lc3b_word;
     highByte  : OUT    lc3b_byte;
     lowByte   : OUT    LC3b_byte
  );
-- Declarations

END highLow ;

--
ARCHITECTURE unititled OF highLow IS
BEGIN
  highByte <= datain(15 downto 8);
  lowByte <= datain(7 downto 0);
END ARCHITECTURE unititled;

