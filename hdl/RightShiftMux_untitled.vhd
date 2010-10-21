--
-- VHDL Architecture ece411.RightShiftMux.untitled
--
-- Created:
--          by - tmurray5.stdt (eelnx22.ews.illinois.edu)
--          at - 20:12:19 09/13/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY RightShiftMux IS
   PORT( 
      clk     : IN     std_logic;
      input   : IN     lc3b_word;
      ADJ6out : OUT    LC3b_word;
      ByteSel : IN     std_logic
   );

-- Declarations

END RightShiftMux ;

--
ARCHITECTURE untitled OF RightShiftMux IS
BEGIN
    	PROCESS (input, ByteSel)
      VARIABLE STATE : LC3B_WORD;
      BEGIN
	      CASE ByteSel IS
		      WHEN '0' =>
			      STATE := input;
		      WHEN '1' =>
			      STATE := input(15) & input(15 downto 1);
		      WHEN OTHERS =>
			      STATE := (OTHERS => 'X');
	      END CASE;
      ADJ6out <= STATE AFTER DELAY_MUX2;
      END PROCESS;
END ARCHITECTURE untitled;
