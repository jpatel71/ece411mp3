--
-- VHDL Architecture ece411.DEMUX2_1.untitled
--
-- Created:
--          by - tmurray5.stdt (eelnx31.ews.illinois.edu)
--          at - 15:38:48 11/05/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.NUMERIC_STD.all;
USE ieee.std_logic_1164.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY DEMUX2_1 IS
     PORT( 
        DataIN     : IN     std_logic;
        sel        : IN     std_logic;
        A          : OUT    std_logic;
        B          : OUT    std_logic
     );
-- Declarations

END DEMUX2_1 ;

--
ARCHITECTURE untitled OF DEMUX2_1 IS
BEGIN
	DEMUX2_1: PROCESS(DataIn,SEL)
	BEGIN
		CASE SEL IS
		WHEN '0' =>
			A <= DataIn AFTER DELAY_MUX2;
			B <= '0' AFTER DELAY_MUX2;
		WHEN '1' =>
			A <= '0' AFTER DELAY_MUX2;
      B <= DataIn AFTER DELAY_MUX2;
		WHEN OTHERS =>
			A <= '0' AFTER DELAY_MUX2;
			B <= '0' AFTER DELAY_MUX2;
		END CASE;
	END PROCESS DEMUX2_1;
END ARCHITECTURE untitled;

