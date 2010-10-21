--
-- VHDL Architecture ece411.State_Reg.untitled
--
-- Created:
--          by - bjohns38.ece411_G8 (gllnx6.ews.illinois.edu)
--          at - 16:04:42 10/20/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.NUMERIC_STD.all;
USE ieee.std_logic_1164.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY State_Reg IS
   PORT( 
      Opcode_IF  : IN     LC3B_Opcode;
      PCPlus2out : IN     LC3b_word;
      SrcA_IF    : IN     LC3b_reg;
      SrcB_IF    : IN     LC3b_reg;
      bit11      : IN     std_logic;
      bit5       : IN     std_logic;
      dest_IF    : IN     LC3b_reg;
      imm4       : IN     LC3b_imm4;
      imm5       : IN     LC3b_imm5;
      index7     : IN     LC3b_index6;
      offset11   : IN     LC3b_offset11;
      offset9    : IN     LC3b_offset9;
      trapvect8  : IN     lc3b_trapvect8;
      DestMuxout : OUT    LC3b_reg;
      Opcode_ID  : OUT    LC3B_Opcode;
      PCPlus2_ID : OUT    lc3b_word;
      SrcA_ID    : OUT    LC3b_reg;
      SrcB_ID    : OUT    LC3b_reg;
      index6     : OUT    LC3b_index6;
      offset10   : OUT    LC3b_offset9
   );

-- Declarations

END State_Reg ;

--
ARCHITECTURE UNTITLED OF State_reg IS
SIGNAL dest : lc3b_reg;
SIGNAL srcA : lc3b_reg;
SIGNAL srcB : lc3b_reg;
BEGIN
	
	-------------------------------------------------------------------
	VHDL_REGFILE1_WRITE: PROCESS(CLK, dest_IF, srcA_IF, RESET_L)
	-------------------------------------------------------------------
	BEGIN
		-- ON RESET, CLEAR THE REGISTER FILE CONTENTS
		IF (RESET_L = '0') THEN
			dest <= "000";
			srcA <= "000";
			srcB <= "000";
		END IF;
		
		-- WRITE VALUE TO REGISTER FILE ON RISING EDGE OF CLOCK IF REGWRITE ACTIVE
		IF (CLK'EVENT AND (CLK = '1') AND (CLK'LAST_VALUE = '0')) THEN
				dest <= dest_IF;
				srcA <= srcA_IF;
				srcB <= srcB_IF;
		END IF;
	END PROCESS;
	destmuxout <= dest AFTER DELAY_REGFILE_READ;
	srcA_ID <= srcA AFTER DELAY_REGFILE_READ;
	srcB_IF <= srcB after DELAY_REGFILE_READ;
END UNTITLED;



