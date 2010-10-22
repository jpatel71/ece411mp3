--
-- VHDL Architecture ece411.GenCC.untitled
--
-- Created:
--          by - tmurray5.stdt (eelnx33.ews.illinois.edu)
--          at - 15:25:46 08/29/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY GenCC IS
   PORT( 
      ByteMaskout : IN     lc3b_word;
      clk         : IN     std_logic;
      GenCCout    : OUT    LC3b_cc
   );

-- Declarations

END GenCC ;

--
ARCHITECTURE UNTITLED OF GENCC IS
BEGIN
	VHDL_GENCC : PROCESS (ByteMaskout)
	BEGIN    
		IF (ByteMaskout = "0000000000000000") THEN
			GENCCOUT <= "010" AFTER DELAY_GENCC;
		ELSIF (ByteMaskout(15) = '1') THEN
			GENCCOUT <= "100" AFTER DELAY_GENCC;
		ELSE
			GENCCOUT <= "001" AFTER DELAY_GENCC;
		END IF;
	END PROCESS VHDL_GENCC;
END UNTITLED;