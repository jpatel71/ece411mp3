--
-- VHDL Architecture ece411.DestMux2.untitled
--
-- Created:
--          by - tmurray5.stdt (eelnx34.ews.illinois.edu)
--          at - 19:04:55 09/11/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY DestMux2 IS
   PORT( 
      dest       : IN     LC3b_reg;
      clk        : IN     std_logic;
      DestMuxSel : IN     std_logic;
      DestMuxout : OUT    LC3b_reg
   );

-- Declarations

END DestMux2 ;

--
ARCHITECTURE untitled OF DestMux2 IS
BEGIN
  	PROCESS (dest, DestMuxSel)
	  VARIABLE STATE : LC3B_REG;
	  BEGIN
		  CASE DestMuxSel IS
			  WHEN '0' =>
				  STATE := dest;
			  WHEN '1' =>
				  STATE := "111";
			  WHEN OTHERS =>
				  STATE := (OTHERS => 'X');
		  END CASE;
	  DestMuxout <= STATE AFTER DELAY_MUX2;
	  END PROCESS;
END ARCHITECTURE untitled;

