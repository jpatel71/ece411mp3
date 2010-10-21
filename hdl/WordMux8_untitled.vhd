--
-- VHDL Architecture ece411.WordMux8.untitled
--
-- Created:
--          by - tmurray5.stdt (eelnx10.ews.illinois.edu)
--          at - 22:45:34 09/12/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY WordMux8 IS
   PORT( 
      A   : IN     lc3b_word;
      B   : IN     lc3b_word;
      C   : IN     lc3b_word;
      D   : IN     lc3b_word;
      E   : IN     lc3b_word;
      F   : IN     lc3b_word;
      G   : IN     lc3b_word;
      H   : IN     lc3b_word;
      Sel : IN     lc3b_8mux_sel;
      Y   : OUT    lc3b_word
   );

-- Declarations

END WordMux8 ;

--
ARCHITECTURE untitled OF WordMux8 IS
BEGIN
    	PROCESS (A, B, C, D, E, F, G, H, SEL)
	    VARIABLE STATE : LC3B_WORD;
	    BEGIN
		    CASE SEL IS
			    WHEN "000" =>
				    STATE := A;
			    WHEN "001" =>
				    STATE := B;
			    WHEN "010" =>
            STATE := C;
          WHEN "011" =>
            STATE := D;
  			    WHEN "100" =>
            STATE := E;
          WHEN "101" =>
            STATE := F;
          WHEN "110" =>
            STATE := G;
          WHEN "111" =>
            STATE := H;
          WHEN OTHERS =>
				    STATE := (OTHERS => 'X');
		    END CASE;
	    Y <= STATE AFTER DELAY_MUX8;
	    END PROCESS;
END ARCHITECTURE untitled;

