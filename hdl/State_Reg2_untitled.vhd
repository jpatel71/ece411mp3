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
      CLK                    : IN     std_logic;
      RESET_L                : IN    std_logic;
      ADDRESSMUXout          : IN     LC3b_word;
      ALUSHFMuxOut           : IN     lc3b_word;
      Opcode_EX              : IN     lc3b_opcode;
      ADDRESSMUXOut_MEM      : OUT    lc3b_word;
      nzp_MEM                : OUT    lc3b_reg;
     -- ISBRANCH_MEM           : OUT    std_logic;
    --  ISJMP_JSR_JSRR_RET_MEM : OUT    std_logic;
    --  ISTRAP_MEM             : OUT    std_logic;
      opcode_MEM             : OUT    lc3b_opcode;
      destReg_EX             : IN     lc3b_reg;
      destreg_MEM            : OUT    LC3B_REG;
      ALUSHFMuxOut_MEM       : OUT    lc3b_word;
      PCPlus2_EX             : IN     lc3b_word;
      PCPlus2_MEM            : OUT    lc3b_word;
      INSCC_EX               : IN     lc3b_nzp;
      INSCC_MEM              : OUT    lc3b_nzp;
      NZP_EX              : IN  lc3b_nzp
   );

-- Declarations

END State_Reg2 ;

--
ARCHITECTURE untitled OF State_Reg2 IS
SIGNAL opcode : lc3b_opcode;
SIGNAL ADDRESSMUX : lc3b_word;
SIGNAL alushfmux : lc3b_word;
SIGNAL destreg : lc3b_reg;
signal inscc : lc3b_nzp;
signal pcplus2 : lc3b_word;
signal nzp : lc3b_nzp;


BEGIN
	
	-------------------------------------------------------------------
	PROCESS(CLK, RESET_L)
	-------------------------------------------------------------------
	BEGIN
		-- ON RESET, CLEAR THE REGISTER FILE CONTENTS
		IF (RESET_L = '0') THEN
      opcode <= "0000";
      ADDRESSMux<= x"0000";
      ALUSHFmux <= x"0000";
      DESTREG <= "000";		
      inscc <= "000";
      pcplus2 <= x"0000";
      nzp <= "000";
		END IF;
		
		-- WRITE VALUE TO REGISTER FILE ON RISING EDGE OF CLOCK IF REGWRITE ACTIVE
		IF (CLK'EVENT AND (CLK = '1') AND (CLK'LAST_VALUE = '0')) THEN
				opcode <= Opcode_EX;
				ADDRESSMux<= addressmuxout;
				ALUSHFmux <= ALUSHFMUXOut;
				DESTREG <= DESTREG_EX;		
				inscc <= inscc_EX;
				pcplus2 <= pcplus2_EX;
				nzp <= nzp_EX;
		END IF;
	END PROCESS;
	addressmuxout_mem <= addressmux after DELAY_REGFILE_READ;
  opcode_MEM <= opcode AFTER DELAY_REGFILE_READ;
  destreg_MEM <= destreg AFTER DELAY_REGFILE_READ;
  inscc_MEM <= inscc after DELAY_REGFILE_READ;
  pcplus2_MEM <= pcplus2 after delay_REGFILE_READ;
  alushfmuxout_MEM <= alushfmux after delay_REGFILE_READ;
  nzp_MEM <= nzp after delay_REGFILE_READ;
END ARCHITECTURE untitled;
