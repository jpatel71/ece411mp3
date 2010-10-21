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
      Opcode_IF     : IN     LC3B_Opcode;
      PCPlus2out_IF : IN     LC3b_word;
      SrcA_IF       : IN     LC3b_reg;
      SrcB_IF       : IN     LC3b_reg;
      bit11_IF      : IN     std_logic;
      bit5_IF       : IN     std_logic;
      dest_IF       : IN     LC3b_reg;
      imm4_IF       : IN     LC3b_imm4;
      imm5_IF       : IN     LC3b_imm5;
      index6_IF     : IN     LC3b_index6;
      offset11_IF   : IN     LC3b_offset11;
      offset9_IF    : IN     LC3b_offset9;
      trapvect8_IF  : IN     lc3b_trapvect8;
      DestMuxout    : OUT    LC3b_reg;
      Opcode_ID     : OUT    LC3B_Opcode;
      PCPlus2_ID    : OUT    lc3b_word;
      SrcA_ID       : OUT    LC3b_reg;
      SrcB_ID       : OUT    LC3b_reg;
      index6_ID     : OUT    LC3b_index6;
      offset9_ID    : OUT    LC3b_offset9;
      offset11      : OUT    LC3b_offset11;
      reset_L       : IN     std_logic
   );

-- Declarations

END State_Reg ;

--
ARCHITECTURE UNTITLED OF State_reg IS
SIGNAL dest : lc3b_reg;
SIGNAL srcA : lc3b_reg;
SIGNAL srcB : lc3b_reg;
SIGNAL opcode : lc3b_opcode;
SIGNAL bit11 : std_logic;
SIGNAL bit5 : std_logic;
SIGNAL imm4 : lc3b_imm4;
SIGNAL imm5 : lc3b_imm5;
SIGNAL index6 : lc3b_index6;
SIGNAL offset11 : lc3b_offset11;
SIGNAL offset9 : lc3b_offset9;
SIGNAL trapvect8 : lc3b_trapvect8;
SIGNAL PCPlus2 : lc3b_trapvect8;
BEGIN
	
	-------------------------------------------------------------------
	VHDL_REGFILE1_WRITE: PROCESS(CLK, dest_IF, srcA_IF, srcB_IF, opcode_IF, bit11_IF, RESET_L)
	-------------------------------------------------------------------
	BEGIN
		-- ON RESET, CLEAR THE REGISTER FILE CONTENTS
		IF (RESET_L = '0') THEN
			dest <= "000";
			srcA <= "000";
			srcB <= "000";
			opcode <= "00000";
		END IF;
		
		-- WRITE VALUE TO REGISTER FILE ON RISING EDGE OF CLOCK IF REGWRITE ACTIVE
		IF (CLK'EVENT AND (CLK = '1') AND (CLK'LAST_VALUE = '0')) THEN
				dest <= dest_IF;
				srcA <= srcA_IF;
				srcB <= srcB_IF;
				opcode <= opcode_IF;
				bit11 <= bit11_IF;
				bit5 <= bit5_IF;
				imm4 <= imm4_IF;
				imm5 <= imm5_IF;
				index6 <= index6_IF;
				offset11 <= offset11_IF;
				offset9 <= offset9_IF;
				trapvect8 <= trapvect8_IF;
				pcplus2 <= pcplus2out_IF;
		END IF;
	END PROCESS;
	destmuxout <= dest AFTER DELAY_REGFILE_READ;
	srcA_ID <= srcA AFTER DELAY_REGFILE_READ;
	srcB_ID <= srcB after DELAY_REGFILE_READ;
	index6_ID <= index6 after DELAY_REGFILE_READ;
	opcode_ID <= opcode after DELAY_REGFILE_READ;
	offset9_ID <= offset9 after DELAY_REGFILE_READ;
	pcplus2_ID <= pcplus2 after DELAY_REGFILE_READ;
END UNTITLED;



