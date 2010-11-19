--
-- VHDL Architecture ece411.waySelect_L2.untitled
--
-- Created:
--          by - tmurray5.stdt (eelnx30.ews.illinois.edu)
--          at - 18:13:34 11/07/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.NUMERIC_STD.all;
USE ieee.std_logic_1164.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY waySelect_L2 IS
   PORT( 
      preHit0      : IN     STD_LOGIC;
      preHit1      : IN     STD_LOGIC;
      preHit2      : IN     STD_LOGIC;
      preHit3      : IN     STD_LOGIC;
      preHit4      : IN     STD_LOGIC;
      preHit5      : IN     STD_LOGIC;
      preHit6      : IN     STD_LOGIC;
      preHit7      : IN     STD_LOGIC;
      way0_dataOut : IN     lc3b_oword;
      way1_dataOut : IN     lc3b_oword;
      way2_dataOut : IN     lc3b_oword;
      way3_dataOut : IN     lc3b_oword;
      way4_dataOut : IN     lc3b_oword;
      way5_dataOut : IN     lc3b_oword;
      way6_dataOut : IN     lc3b_oword;
      way7_dataOut : IN     lc3b_oword;
      F            : OUT    lc3b_oword
   );

-- Declarations

END waySelect_L2 ;

--
ARCHITECTURE untitled OF waySelect_L2 IS
SIGNAL SEL : std_logic_vector(7 downto 0);
SIGNAL TEMP : lc3b_oword;
BEGIN
	PROCESS (way0_dataOut, way1_dataOut, way2_dataOut, way3_dataOut,
	         way4_dataOut, way5_dataOut, way6_dataOut, way7_dataOut,
	         preHit0, preHit1, preHit2, preHit3, preHit4, preHit5, preHit6, preHit7)
	BEGIN  -- PROCESS
	  sel <= preHit7 & preHit6 & preHit5 & preHit4 & preHit3 & preHit2 & preHit1 & preHit0;
		CASE SEL IS
    		WHEN "00000001" =>
    			TEMP <= way0_dataOut;
   			WHEN "00000010" =>
    			TEMP <= way1_dataOut;
 			WHEN "00000100" =>
    			TEMP <= way2_dataOut;
   			WHEN "00001000" =>
    			TEMP <= way3_dataOut;
 			WHEN "00010000" =>
    			TEMP <= way4_dataOut;
   			WHEN "00100000" =>
    			TEMP <= way5_dataOut;
 			WHEN "01000000" =>
    			TEMP <= way6_dataOut;
   			WHEN "10000000" =>
    			TEMP <= way7_dataOut;
    		WHEN OTHERS =>
    			TEMP <= (OTHERS => 'X');
    		END CASE;
	END PROCESS;
	F <= TEMP AFTER DELAY_MUX8;
END ARCHITECTURE untitled;

