--
-- VHDL Architecture ece411.State_Reg3.untitled
--
-- Created:
--          by - bjohns38.stdt (gllnx19.ews.illinois.edu)
--          at - 00:27:15 10/22/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.NUMERIC_STD.all;
USE ieee.std_logic_1164.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY State_Reg3 IS
   PORT( 
      ADDRESSMUXOut_MEM : IN     lc3b_word;
      ALUSHFMuxOut_MEM  : IN     lc3b_word;
      D_DATAIN          : IN     lc3b_word;
      PCPlus2_MEM       : IN     lc3b_word;
      RESET_L           : IN     std_logic;
      clk               : IN     std_logic;
      destreg_MEM       : IN     LC3B_REG;
      opcode_MEM        : IN     lc3b_opcode;
      ADDRESSMUXOut_WB  : OUT    LC3b_word;
      ALUSHFMUXOut_WB   : OUT    lc3b_word;
      DEST              : OUT    LC3B_REG;
      D_DATAIN_WB       : OUT    LC3b_word;
      Opcode_WB         : OUT    LC3b_opcode;
      PCPLus2_WB        : OUT    LC3b_word
   );

-- Declarations

END State_Reg3 ;

--
ARCHITECTURE untitled OF State_Reg3 IS

  SIGNAL ALUSHFMuxOut : lc3b_opcode;
  SIGNAL ADDRESSMUXOut : lc3b_word;
  SIGNAL DATAIN : lc3b_word;
  SIGNAL destreg : lc3b_reg;
  signal opcode : lc3b_opcode;
  signal PCPlus2: lc3b_word;
 BEGIN 
	  
	  -------------------------------------------------------------------
	  PROCESS(CLK, RESET_L)
	  -------------------------------------------------------------------
	  BEGIN
		  -- ON RESET, CLEAR THE REGISTER FILE CONTENTS
		  IF (RESET_L = '0') THEN
        opcode <= "0000";
        ADDRESSMuxOut <= x"0000";
        ALUSHFmuxOUT <= x"0000";
        DESTREG <= "000";		
        DATAIN <= x"0000";
        PCPlus2 <= x"0000";
		  END IF;
		  
		  -- WRITE VALUE TO REGISTER FILE ON RISING EDGE OF CLOCK IF REGWRITE ACTIVE
		  IF (CLK'EVENT AND (CLK = '1') AND (CLK'LAST_VALUE = '0')) THEN
				  opcode <= Opcode_MEM;
				  ADDRESSMuxOut <= addressmuxout_MEM;
				  ALUSHFmuxOUT <= ALUSHFMUXOut_MEM;
				  DESTREG <= DESTREG_MEM;		
				  DATAIN <= D_DATAIN;
				  PCPlus2 <= PCPLUS2_MEM;
		  END IF;
	  END PROCESS;
--	  DELAY_REGFILE_READ;
	  ADDRESSMUXOut_WB  <= ADDRESSMUXOUT after DELAY_REGFILE_READ;
    ALUSHFMUXOut_WB   <= ALUSHFMUXOut_MEM after DELAY_REGFILE_READ;
    DEST              <= DESTREG after DELAY_REGFILE_READ;
    D_DATAIN_WB       <= DATAIN after DELAY_REGFILE_READ;
    Opcode_WB         <= opcode after DELAY_REGFILE_READ;
    PCPLus2_WB        <= PCPLUS2 after DELAY_REGFILE_READ;
END ARCHITECTURE untitled;

