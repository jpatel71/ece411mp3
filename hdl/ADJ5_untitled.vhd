--
-- VHDL Architecture ece411.ADJ5.untitled
--
-- Created:
--          by - tmurray5.stdt (eelnx34.ews.illinois.edu)
--          at - 15:18:20 09/11/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY ADJ5 IS
   PORT( 
      clk    : IN     std_logic;
      ADJ5out : OUT    LC3b_word;
      imm5   : IN     LC3b_imm5
   );

-- Declarations

END ADJ5 ;

--
ARCHITECTURE untitled OF ADJ5 IS
BEGIN
  	ADJ5OUT <= IMM5(4) & 
  	          IMM5(4) &
             IMM5(4) & 
             IMM5(4) & 
             IMM5(4) & 
             IMM5(4) & 
             IMM5(4) & 
             IMM5(4) & 
             IMM5(4) & 
             IMM5(4) & 
             IMM5(4) & 
	           IMM5 AFTER DELAY_MUX2;
END ARCHITECTURE untitled;


