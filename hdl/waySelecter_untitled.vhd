--
-- VHDL Architecture ece411.waySelecter.untitled
--
-- Created:
--          by - tmurray5.stdt (eelnx25.ews.illinois.edu)
--          at - 10:34:21 09/24/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY waySelecter IS
   PORT( 
      a   : IN     lc3b_oword;
      b   : IN     lc3b_oword;
      sel : IN     std_logic;
      f   : OUT    lc3b_oword
   );

-- Declarations

END waySelecter ;

--
ARCHITECTURE untitled OF waySelecter IS
BEGIN
    PROCESS (a, b, sel)
      variable state : lc3b_oword;
    BEGIN
      case sel is
        when '0' =>
          state := a;
        when '1' =>
          state := b;
        when others =>
          state := (OTHERS => 'X');
      end case;
      f <= state after delay_MUX2;
    END PROCESS;
END ARCHITECTURE untitled;

