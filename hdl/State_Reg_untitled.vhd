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
      PCPlus2out_IF : IN     LC3b_word;
      PCPlus2_ID    : OUT    lc3b_word;
      index6_ID     : OUT    LC3b_index6;
      offset9_ID    : OUT    LC3b_offset9;
      offset11_ID   : OUT    LC3b_offset11;
      RESET_L       : IN     std_logic;
      IDATAIn       : IN     LC3b_word;
      IR_Bit5       : OUT    std_logic;
      IR_Bit11      : OUT    std_logic;
      IR_2_0_ID     : OUT    STD_LOGIC_VECTOR (2 DOWNTO 0);
      IR8_6_ID      : OUT    LC3B_REG;
      opcode_ID     : OUT    LC3B_Opcode;
      DEST_ID       : OUT    LC3b_reg;
      IMM4_ID       : OUT    lc3b_imm4;
      INSCC_ID      : OUT    lc3b_nzp;
      clk           : IN     std_logic;
      imm5_ID       : OUT    LC3b_imm5;
      trapvect8_ID  : OUT    lc3b_trapvect8
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
SIGNAL PCPlus2 : lc3b_word;
BEGIN
	
	-------------------------------------------------------------------
	VHDL_REGFILE1_WRITE: PROCESS(CLK, RESET_L, IDATAIN, PCPLUS2OUT_IF)
	-------------------------------------------------------------------
	BEGIN
		-- ON RESET, CLEAR THE REGISTER FILE CONTENTS
		IF (RESET_L = '0') THEN
			dest <= "000";
			srcA <= "000";
			srcB <= "000";
			opcode <= "0000";
		END IF;
		
		-- WRITE VALUE TO REGISTER FILE ON RISING EDGE OF CLOCK IF REGWRITE ACTIVE
		IF (CLK'EVENT AND (CLK = '1') AND (CLK'LAST_VALUE = '0')) THEN
				dest <= IDataIN(11 downto 9);
				srcA <= IDataIn(8 downto 6);
				srcB <= IDataIn(2 downto 0);
				opcode <= IDataIn(15 downto 12);
				bit11 <= IDataIn(11);
				bit5 <= IDataIn(5);
				imm4 <= IDataIn(3 downto 0);
				imm5 <= IDataIn(4 downto 0);
				index6 <= IDataIn(5 downto 0);
				offset11 <= IDataIn(10 downto 0);
				offset9 <= IDataIn(8 downto 0);
				trapvect8 <= IDataIn(7 downto 0);
				pcplus2 <= pcplus2out_IF;
		END IF;
	END PROCESS;
	INSCC_ID <= dest AFTER DELAY_REGFILE_READ;
	IR8_6_ID <= srcA AFTER DELAY_REGFILE_READ;
	IR_2_0_ID <= srcB after DELAY_REGFILE_READ;
	index6_ID <= index6 after DELAY_REGFILE_READ;
	opcode_ID <= opcode after DELAY_REGFILE_READ;
	offset9_ID <= offset9 after DELAY_REGFILE_READ;
	pcplus2_ID <= pcplus2 after DELAY_REGFILE_READ;
	imm5_ID <= imm5 after DELAY_REGFILE_READ;
	imm4_ID <= imm4 after DELAY_REGFILE_READ;
	offset11_ID <= offset11 after DELAY_REGFILE_READ;
	trapvect8_ID <= trapvect8 after DELAY_REGFILE_READ;
END UNTITLED;



