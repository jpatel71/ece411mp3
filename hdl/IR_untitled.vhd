--
-- VHDL Architecture ece411.IR.untitled
--
-- Created:
--          by - tmurray5.stdt (eelnx33.ews.illinois.edu)
--          at - 15:26:16 08/29/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY IR IS
   PORT( 
      LoadIR   : IN     std_logic;
      MDRout   : IN     LC3b_word;
      clk      : IN     std_logic;
      SrcA     : OUT    LC3b_reg;
      SrcB     : OUT    LC3b_reg;
      imm4     : OUT    LC3b_imm4;
      imm5     : OUT    LC3b_imm5;
      index6   : OUT    LC3b_index6;
      bit11    : OUT    std_logic;
      bit5     : OUT    std_logic;
      offset9  : OUT    LC3b_offset9;
      offset11 : OUT    LC3b_offset11;
      dest     : OUT    LC3b_reg;
      Opcode   : OUT    LC3B_Opcode;
      D        : OUT    std_logic;
      trapvect8: OUT    lc3b_trapvect8
   );

-- Declarations

END IR ;

--
ARCHITECTURE UNTITLED OF IR IS
SIGNAL VAL_IR : LC3B_WORD;
BEGIN
	------------------------------
	VHDL_REG_IR : PROCESS (CLK, LOADIR, MDROUT)
	------------------------------
	BEGIN
		IF (CLK'EVENT AND (CLK = '1') AND (CLK'LAST_VALUE = '0')) THEN
			IF (LOADIR = '1') THEN
				VAL_IR <= MDROUT AFTER DELAY_REG;
			END IF;
		END IF;
	END PROCESS VHDL_REG_IR;
	OPCODE <= VAL_IR(15 DOWNTO 12);
	SRCA <= VAL_IR(8 DOWNTO 6);
	SRCB <= VAL_IR(2 DOWNTO 0);
	DEST <= VAL_IR(11 DOWNTO 9);
	IMM4 <= VAL_IR(3 DOWNTO 0);
	IMM5 <= VAL_IR(4 DOWNTO 0);
	INDEX6 <= VAL_IR(5 DOWNTO 0);
	TRAPVECT8 <= VAL_IR(7 DOWNTO 0);
	OFFSET9 <= VAL_IR(8 DOWNTO 0);
	OFFSET11 <= VAL_IR(10 DOWNTO 0);
	bit5 <= VAL_IR(5);
	bit11 <= VAL_IR(11);
	D <= VAL_IR(4);
	
END UNTITLED;

