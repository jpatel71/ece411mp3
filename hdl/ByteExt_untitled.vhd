--
-- VHDL Architecture ece411.ByteExt.untitled
--
-- Created:
--          by - tmurray5.stdt (eelnx30.ews.illinois.edu)
--          at - 17:41:11 09/12/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY ByteExt IS
   PORT( 
      clk        : IN     std_logic;
      ByteSel    : IN     std_logic;
      ByteExtout : OUT    LC3b_word;
      RFMuxout   : IN     lc3b_word
   );

-- Declarations

END ByteExt ;

--
ARCHITECTURE untitled OF ByteExt IS
BEGIN
      	PROCESS (RFMuxout, ByteSel)
	      VARIABLE STATE : LC3B_WORD;
	      BEGIN
		      CASE ByteSel IS
			      WHEN '0' =>
				      STATE := RFMuxout;
			      WHEN '1' =>
				      STATE := RFMuxout(7) & RFMuxout(7) & 
				               RFMuxout(7) & RFMuxout(7) & 
				               RFMuxout(7) & RFMuxout(7) & 
				               RFMuxout(7) & RFMuxout(7) & 
				               RFMuxout(7 downto 0);
			      WHEN OTHERS =>
				      STATE := (OTHERS => 'X');
		      END CASE;
	      ByteExtout <= STATE AFTER DELAY_MUX2;
	      END PROCESS;
END ARCHITECTURE untitled;
