--
-- VHDL Architecture ece411.IR.untitled
--
-- Created:
--          by - tmurray5.stdt (eelnx33.ews.illinois.edu)
--          at - 15:26:16 08/29/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.NUMERIC_STD.all;
USE ieee.std_logic_1164.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY IR1 IS
   PORT( 
      LoadIR : IN     std_logic;
      IRin   : IN     LC3b_word;
      valIR  : OUT    lc3b_word;
      clk    : IN     std_logic
   );

-- Declarations

END IR1 ;

--
ARCHITECTURE UNTITLED OF IR1 IS
SIGNAL VAL_IR : LC3B_WORD;
BEGIN
	------------------------------
	VHDL_REG_IR1 : PROCESS (CLK, LOADIR, IRin)
	------------------------------
	BEGIN
		IF (CLK'EVENT AND (CLK = '1') AND (CLK'LAST_VALUE = '0')) THEN
			IF (LOADIR = '1') THEN
				VAL_IR <= IRin AFTER DELAY_REG;
			END IF;
		END IF;
	END PROCESS VHDL_REG_IR1;
	
END UNTITLED;

