--
-- VHDL Architecture ece411.State_Reg1.untitled
--
-- Created:
--          by - jpatel71.stdt (eelnx34.ews.illinois.edu)
--          at - 12:03:13 10/21/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.NUMERIC_STD.all;
USE ieee.std_logic_1164.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY State_Reg1 IS
   PORT( 
      ADJ11_ID   : IN     LC3b_word;
      ADJ6_ID    : IN     lc3b_word;
      ADJ9_ID    : IN     LC3b_word;
      PCPlus2_ID : IN     lc3b_word;
      RFAout_ID  : IN     LC3b_word;
      RFBout_ID  : IN     LC3b_word;
      IR5_4_EX   : OUT    lc3b_shfop (1 DOWNTO 0);
      RFAout_EX  : OUT    LC3b_word;
      RFBOut_EX  : OUT    LC3b_word;
      SEXTimm11  : OUT    LC3b_word;
      SEXTimm6   : OUT    LC3b_word;
      SEXTimm9   : OUT    LC3b_word;
      SHFTAMT    : OUT    STD_LOGIC_VECTOR (3 DOWNTO 0);
      imm5SEXT   : OUT    LC3b_word;
      imm8       : OUT    LC3b_imm8;
      PCPlus2_EX : OUT    lc3b_word;
      reset_L    : IN     std_logic
   );

-- Declarations

END State_Reg1 ;

--
ARCHITECTURE untitled OF State_Reg1 IS
SIGNAL adj6 : lc3b_word;
SIGNAL adj9 : lc3b_word;
SIGNAL adj11 : lc3b_word;
SIGNAL pcplus2 : lc3b_word;
SIGNAL rfa : lc3b_word;
SIGNAL rfb : lc3b_word;

BEGIN
	
	-------------------------------------------------------------------
	PROCESS(CLK, adj6_ID, adj9_ID, adj11_ID, pcplus2_ID, rfaout_ID, rfbout_ID, RESET_L)
	-------------------------------------------------------------------
	BEGIN
		-- ON RESET, CLEAR THE REGISTER FILE CONTENTS
		IF (RESET_L = '0') THEN

		END IF;
		
		-- WRITE VALUE TO REGISTER FILE ON RISING EDGE OF CLOCK IF REGWRITE ACTIVE
		IF (CLK'EVENT AND (CLK = '1') AND (CLK'LAST_VALUE = '0')) THEN
				adj6 <= adj6_ID;
				adj9 <= adj9_ID;
				adj11 <= adj11_ID;
				pcplus2 <= pcplus2_ID;
				rfa <= rfaout_ID;
				rfb <= rfbout_ID;
		END IF;
	END PROCESS;
	SEXTimm6 <= adj6 AFTER DELAY_REGFILE_READ;
  SEXTimm9 <= adj9 AFTER DELAY_REGFILE_READ;
  SEXTimm11  <= adj11 AFTER DELAY_REGFILE_READ;
  pcplus2_EX <= pcplus2 after DELAY_REGFILE_READ;
  rfaout_EX <= rfa after DELAY_REGFILE_READ;
  rfbout_EX <= rfb after DELAY_REGFILE_READ;
END ARCHITECTURE untitled;

