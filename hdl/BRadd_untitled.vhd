--
-- VHDL Architecture ece411.BRadd.untitled
--
-- Created:
--          by - tmurray5.stdt (eelnx33.ews.illinois.edu)
--          at - 15:37:35 08/29/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY BRadd IS
   PORT( 
      clk : IN     std_logic
   );

-- Declarations

END BRadd ;

--
ARCHITECTURE untitled OF BRadd IS
BEGIN
	VHDL_ADD_BR : PROCESS (PCOUT, ADJ9out)
	BEGIN  -- PROCESS
		BRaddout <= STD_LOGIC_VECTOR( SIGNED(PCOUT) + SIGNED(ADJ9out) ) AFTER DELAY_ADDER;
	END PROCESS;
END ARCHITECTURE untitled;

