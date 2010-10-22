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

ENTITY State_Reg2 IS
   PORT( 
      ADDRESSMUXout          : IN     LC3b_word;
      ALUSHFMuxOut           : IN     lc3b_word;
      Opcode_EX              : IN     lc3b_opcode;
      ADDRESSMUXOut_MEM      : OUT    lc3b_word;
      EX_DATAOUT             : OUT    lc3b_word;
      b                      : OUT    lc3b_word;
      nzp_MEM                : OUT    lc3b_reg;
      ISBRANCH_MEM           : OUT    std_logic;
      ISJMP_JSR_JSRR_RET_MEM : OUT    std_logic;
      ISTRAP_MEM             : OUT    std_logic;
      opcode_MEM             : OUT    lc3b_opcode;
      destReg_EX             : IN     lc3b_reg;
      destreg_MEM            : OUT    LC3B_REG
   );

-- Declarations

END State_Reg2 ;

--
ARCHITECTURE untitled OF State_Reg2 IS
SIGNAL opcode : lc3b_opcode;
SIGNAL ADDRESSMUX : lc3b_word;
SIGNAL alushfmux : lc3b_word;
SIGNAL destreg : lc3b_reg;


BEGIN
	
	-------------------------------------------------------------------
	PROCESS(CLK, RESET_L)
	-------------------------------------------------------------------
	BEGIN
		-- ON RESET, CLEAR THE REGISTER FILE CONTENTS
		IF (RESET_L = '0') THEN

		END IF;
		
		-- WRITE VALUE TO REGISTER FILE ON RISING EDGE OF CLOCK IF REGWRITE ACTIVE
		IF (CLK'EVENT AND (CLK = '1') AND (CLK'LAST_VALUE = '0')) THEN
				opcode <= Opcode_EX;
				ADDRESSMux<= addressmuxout;
				ALUSHFmux <= ALUSHFMUXOut;
				DESTREG <= DESTREG_EX;
		END IF;
	END PROCESS;
  opcode_MEM <= opcode AFTER DELAY_REGFILE_READ;
  destreg_MEM <= destreg AFTER DELAY_REGFILE_READ;
END ARCHITECTURE untitled;

