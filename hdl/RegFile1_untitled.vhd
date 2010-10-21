--
-- VHDL Architecture ece411.RegFile.untitled
--
-- Created:
--          by - tmurray5.stdt (eelnx33.ews.illinois.edu)
--          at - 15:29:00 08/29/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.NUMERIC_STD.all;
USE ieee.std_logic_1164.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY RegFile1 IS
   PORT( 
      reset_L     : IN     std_logic;
      RegWrite    : IN     std_logic;
      clk         : IN     std_logic;
      DestMuxout  : IN     LC3b_reg;
      RegFileIn   : IN     lc3b_word;
      SrcB_ID     : IN     LC3b_reg;
      StoreMuxout : IN     LC3b_reg;
      RFAout_ID   : OUT    LC3b_word;
      RFBout_ID   : OUT    LC3b_word
   );

-- Declarations

END RegFile1 ;

--
ARCHITECTURE UNTITLED OF REGFILE1 IS
TYPE RAMMEMORY IS ARRAY (7 DOWNTO 0) OF LC3B_WORD;
SIGNAL RAM : RAMMEMORY;
BEGIN
	-------------------------------------------------------------------
	VHDL_REGFILE1_READ : PROCESS (RAM, STOREMUXOUT, SRCB)
	-------------------------------------------------------------------
	VARIABLE RADDR1 : INTEGER RANGE 0 TO 7;
	VARIABLE RADDR2 : INTEGER RANGE 0 TO 7;
	BEGIN
		--READ FROM REGFILE, THE OUTPUTS ARE VALID AFTER REGFILE_READ DELAY.
		RADDR1 := TO_INTEGER(UNSIGNED('0' & STOREMUXOUT));
		RADDR2 := TO_INTEGER(UNSIGNED('0' & SRCB));
		RFAOUT <= RAM(RADDR1) AFTER DELAY_REGFILE_READ;
		RFBOUT <= RAM(RADDR2) AFTER DELAY_REGFILE_READ;
	END PROCESS VHDL_REGFILE1_READ;
	-------------------------------------------------------------------
	VHDL_REGFILE1_WRITE: PROCESS(CLK, RegFileIn, REGWRITE, DESTMUXOUT, RESET_L)
	-------------------------------------------------------------------
	VARIABLE WADDR : INTEGER RANGE 0 TO 7;
	BEGIN
		-- ON RESET, CLEAR THE REGISTER FILE CONTENTS
		IF (RESET_L = '0') THEN
			RAM(0) <= "0000000000000000";
			RAM(1) <= "0000000000000000";
			RAM(2) <= "0000000000000000";
			RAM(3) <= "0000000000000000";
			RAM(4) <= "0000000000000000";
			RAM(5) <= "0000000000000000";
			RAM(6) <= "0000000000000000";
			RAM(7) <= "0000000000000000";
		END IF;
		-- WRITE VALUE TO REGISTER FILE ON RISING EDGE OF CLOCK IF REGWRITE ACTIVE
		WADDR := TO_INTEGER(UNSIGNED('0' & DESTMUXOUT));
		IF (CLK'EVENT AND (CLK = '1') AND (CLK'LAST_VALUE = '0')) THEN
			IF (REGWRITE = '1') THEN
				RAM(WADDR) <= RegFileIn;
			END IF;
		END IF;
	END PROCESS VHDL_REGFILE1_WRITE;
END UNTITLED;
