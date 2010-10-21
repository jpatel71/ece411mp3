--
-- VHDL Architecture ece411.StoreMux.untitled
--
-- Created:
--          by - tmurray5.stdt (eelnx33.ews.illinois.edu)
--          at - 15:50:39 08/29/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY StoreMux IS
   PORT( 
      SrcA        : IN     LC3b_reg;
      StoreSR     : IN     std_logic;
      dest        : IN     LC3b_reg;
      StoreMuxout : OUT    LC3b_reg
   );

-- Declarations

END StoreMux ;

--
ARCHITECTURE untitled OF StoreMux IS
BEGIN
  PROCESS (SrcA, dest, StoreSR)
    variable state : LC3b_reg;
  BEGIN
    case StoreSR is
      when '0' =>
        state := dest;
      when '1' =>
        state := SrcA;
      when others =>
        state := (OTHERS => 'X');
    end case;
    StoreMuxout <= state after delay_MUX2;
  END PROCESS;
END ARCHITECTURE untitled;

