--
-- VHDL Architecture ece411.DEMUX2_128.untitled
--
-- Created:
--          by - tmurray5.stdt (eelnx31.ews.illinois.edu)
--          at - 15:28:12 11/05/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.NUMERIC_STD.all;
USE ieee.std_logic_1164.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY DEMUX2_128 IS
   PORT( 
      DataIN     : IN     LC3B_OWORD;
      sel        : IN     std_logic;
      A          : OUT    lc3b_oword;
      B          : OUT    lc3b_oword
   );

-- Declarations

END DEMUX2_128 ;

--
ARCHITECTURE untitled OF DEMUX2_128 IS
BEGIN
	DEMUX2_128: PROCESS(DataIn,SEL)
	BEGIN
		CASE SEL IS
		WHEN '0' =>
			A <= DataIn AFTER DELAY_MUX2;
			B <= (OTHERS => 'X') AFTER DELAY_MUX2;
		WHEN '1' =>
			A <= (OTHERS => 'X') AFTER DELAY_MUX2;
      B <= DataIn AFTER DELAY_MUX2;
		WHEN OTHERS =>
			A <= (OTHERS => 'X') AFTER DELAY_MUX2;
			B <= (OTHERS => 'X') AFTER DELAY_MUX2;
		END CASE;
	END PROCESS DEMUX2_128;
END ARCHITECTURE untitled;

