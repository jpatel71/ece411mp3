--
-- VHDL Architecture ece411.NZP.untitled
--
-- Created:
--          by - tmurray5.stdt (gllnx5.ews.illinois.edu)
--          at - 15:48:48 08/31/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY NZP IS
   PORT( 
      GenCCout : IN     LC3b_cc;
      LoadNZP  : IN     std_logic;
      RESET_L  :  IN  STD_LOGIC;
      clk      : IN     std_logic;
      n        : OUT    std_logic;
      p        : OUT    std_logic;
      z        : OUT    std_logic
   );

-- Declarations

END NZP ;

--
ARCHITECTURE UNTITLED OF NZP IS
SIGNAL PRE_NZP : STD_LOGIC_VECTOR (2 DOWNTO 0);
BEGIN
	------------------------------
	VHDL_NZP : PROCESS (CLK, GENCCOUT)
	------------------------------
	BEGIN
	  if(RESET_L = '0') then
	    PRE_NZP <= "000";
	  end if;
		IF (CLK'EVENT AND (CLK = '1') AND (CLK'LAST_VALUE = '0')) THEN
			IF (LOADNZP = '1') THEN
				PRE_NZP <= GENCCOUT;
			END IF;
		END IF;
	END PROCESS VHDL_NZP;
	N <= PRE_NZP(2) AFTER DELAY_REG;
	Z <= PRE_NZP(1) AFTER DELAY_REG;
	P <= PRE_NZP(0) AFTER DELAY_REG;
END UNTITLED;
