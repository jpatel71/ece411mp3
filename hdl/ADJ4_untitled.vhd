--
-- VHDL Architecture ece411.ADJ4.untitled
--
-- Created:
--          by - tmurray5.stdt (eelnx34.ews.illinois.edu)
--          at - 17:18:39 09/11/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY ADJ4 IS
   PORT( 
      clk     : IN     std_logic;
      imm4    : IN     LC3b_imm4;
      ADJ4out : OUT    LC3b_word
   );

-- Declarations

END ADJ4 ;

--
ARCHITECTURE untitled OF ADJ4 IS
BEGIN
    	ADJ4OUT <= "000000000000" & IMM4 AFTER DELAY_MUX2;
END ARCHITECTURE untitled;
