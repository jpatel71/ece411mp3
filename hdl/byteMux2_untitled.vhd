--
-- VHDL Architecture ece411.byteMux2.untitled
--
-- Created:
--          by - tmurray5.stdt (gllnx25.ews.illinois.edu)
--          at - 15:34:56 09/27/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY byteMux2 IS
   PORT( 
      sel : IN     std_logic;
      a   : IN     lc3b_byte;
      b   : IN     lc3b_byte;
      f   : OUT    lc3b_byte
   );

-- Declarations

END byteMux2 ;

--
ARCHITECTURE untitled OF byteMux2 IS
BEGIN
  	  PROCESS (a, b, sel)
	    VARIABLE STATE : lc3b_byte;
	    BEGIN
		    CASE sel IS
			    WHEN '0' =>
				    STATE := a;
			    WHEN '1' =>
				    STATE := b;
			    WHEN OTHERS =>
				    STATE := (OTHERS => 'X');
		    END CASE;
	    f <= STATE AFTER DELAY_MUX2;
	    END PROCESS;
END ARCHITECTURE untitled;

