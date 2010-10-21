--
-- VHDL Architecture ece411.ByteMask.untitled
--
-- Created:
--          by - tmurray5.stdt (eelnx30.ews.illinois.edu)
--          at - 17:48:17 09/12/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY ByteMask IS
   PORT( 
      clk         : IN     std_logic;
      RFMuxout    : IN     lc3b_word;
      ByteMaskout : OUT    lc3b_word;
      ADDRESS0    : IN     std_logic;
      ByteSel     : IN     std_logic
   );

-- Declarations

END ByteMask ;

--
ARCHITECTURE untitled OF ByteMask IS
SIGNAL sel : std_logic_vector(1 downto 0);
BEGIN
    	PROCESS (RFMuxout, ADDRESS0, ByteSel)
      VARIABLE STATE : LC3B_WORD;
      BEGIN
        sel <= ByteSel & ADDRESS0;
        CASE sel IS
				      WHEN "00" =>
            STATE := RFMuxout;
          WHEN "01" =>
            STATE := RFMuxout;
	        WHEN "10" =>
		        STATE := "00000000" & RFMuxout(7 downto 0);
	        WHEN "11" =>
		        STATE := "00000000" & RFMuxout(15 downto 8);
	        WHEN OTHERS =>
		        STATE := (OTHERS => 'X');
        END CASE;
      ByteMaskout <= STATE AFTER DELAY_MUX2;
      END PROCESS;
END ARCHITECTURE untitled;

