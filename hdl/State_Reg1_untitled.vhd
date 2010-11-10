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
      clk            : IN     std_logic;
      ADJ11_ID       : IN     LC3b_word;
      ADJ6_ID        : IN     lc3b_word;
      ADJ9_ID        : IN     LC3b_word;
      PCPlus2_ID     : IN     lc3b_word;
      RFAout_ID      : IN     LC3b_word;
      RFBout_ID      : IN     LC3b_word;
      AD_EX          : OUT    lc3b_shftop;
      RFAout_EX      : OUT    LC3b_word;
      rfbout_ex      : OUT    LC3b_word;
      imm5SEXT       : OUT    LC3b_word;
      PCPlus2_EX     : OUT    lc3b_word;
      RESET_L        : IN     std_logic;
      Opcode_ID      : IN     LC3B_Opcode;
      Opcode_EX      : OUT    lc3b_opcode;
      ADJ6_EX        : OUT    LC3b_word;
      ADJ11_EX       : OUT    LC3b_word;
      ADJ9_EX        : OUT    LC3b_word;
      ADJ5out        : IN     LC3b_word;
      ADJ8out        : IN     lc3b_word;
      ADJ8out_EX     : OUT    LC3b_word;
      DESTREG_EX     : OUT    lc3b_reg;
      Imm4_EX        : OUT    lc3b_imm4;
      IMM4_ID        : IN     lc3b_imm4;
      INSCC_ID       : IN     lc3b_nzp;
      INSCC_EX       : OUT    lc3b_nzp;
      load           : IN     std_logic;
      AD_ID          : IN     lc3b_SHFTOP;
      IR8_6_ID       : IN     LC3B_REG;
      IR_2_0_ID      : IN     STD_LOGIC_VECTOR (2 DOWNTO 0);
      SRCA_EX        : OUT    std_logic;
      SRCB_EX        : OUT    std_logic;
      Dest_ID        : IN     LC3b_reg;
      Hazard         : IN     std_logic;
      EXaJMP         : IN     std_logic;
      ADJ6ns_ID      : IN     lc3b_word;
      ADJ6ns_EX      : OUT    lc3b_word;
      BRANCHLOAD_MEM : IN     std_logic;
      RegWrite_EX    : OUT    std_logic;
      RegWrite_ID    : IN     std_logic
   );

-- Declarations

END State_Reg1 ;

--
ARCHITECTURE untitled OF State_Reg1 IS
SIGNAL adj5 : lc3b_word;
SIGNAL adj6 : lc3b_word;
SIGNAL adj6ns : lc3b_word;
SIGNAL adj9 : lc3b_word;
signal adj8 : lc3b_word;
SIGNAL adj11 : lc3b_word;
SIGNAL pcplus2 : lc3b_word;
SIGNAL rfa : lc3b_word;
SIGNAL rfb : lc3b_word;
signal opcode : lc3b_opcode;
signal destreg : lc3b_reg;
signal inscc : lc3b_nzp;
signal imm4 : lc3b_imm4;
signal ad : lc3b_shftop;
signal regwrite : std_logic;

BEGIN
	
	-------------------------------------------------------------------
	PROCESS(CLK, RESET_L, load, BRANCHLOAD_MEM)
	-------------------------------------------------------------------
	BEGIN
		-- ON RESET, CLEAR THE REGISTER FILE CONTENTS
		IF (RESET_L = '0' OR EXaJMP='1' OR BRANCHLOAD_MEM='1') THEN
      adj6 <= x"0000";
      adj6ns <= x"0000";
      adj9 <= x"0000";
      adj11 <= x"0000";
      adj8 <= x"0000";
      adj5 <= x"0000";
      pcplus2 <= x"0000";
      rfa <= x"0000";
      rfb <= x"0000";
      destreg <= "000";
      inscc <= "000";
      imm4 <= "0000";
      ad <= "00";
      opcode <="0000";
      regwrite <= '0';
		END IF;
		
		-- WRITE VALUE TO REGISTER FILE ON RISING EDGE OF CLOCK IF REGWRITE ACTIVE
		IF (CLK'EVENT AND (CLK = '1') AND (CLK'LAST_VALUE = '0')) THEN
		  IF(load='1' AND Hazard/='1') then
				adj6 <= adj6_ID;
				adj6ns <= adj6ns_ID;
				adj9 <= adj9_ID;
				adj11 <= adj11_ID;
				adj8 <= adj8out;
				adj5 <= adj5out;
				pcplus2 <= pcplus2_ID;
				rfa <= rfaout_ID;
				rfb <= rfbout_ID;
				destreg <= dest_ID;
				opcode <= opcode_ID;
				inscc <= inscc_ID;
				imm4 <= IMM4_ID;
				ad <= AD_ID;
				regwrite <= RegWrite_ID;
				--shft
			end if;
		END IF;
	END PROCESS;
  pcplus2_EX <= pcplus2 after DELAY_REGFILE_READ;
 	ADJ6_EX <= adj6 AFTER DELAY_REGFILE_READ;
 	ADJ6ns_EX <= adj6ns AFTER DELAY_REGFILE_READ;
 	ADJ9_EX <= adj9 AFTER DELAY_REGFILE_READ;
 	ADJ11_EX  <= adj11 AFTER DELAY_REGFILE_READ;
 	ADJ8out_EX <= adj8 AFTER DELAY_REGFILE_READ;
  rfaout_EX <= rfa after DELAY_REGFILE_READ;
  --shft
  rfbout_EX <= rfb after DELAY_REGFILE_READ;
  imm5SEXT <= adj5 after delay_regfile_read;
  opcode_EX <= opcode AFTER DELAY_REGFILE_READ;
  destreg_EX<= destreg after DELAY_REGFILE_READ;
  imm4_EX <= imm4 after DELAY_REGFILE_READ;
  inscc_EX <= inscc after DELAY_REGFILE_READ; 
  AD_EX <= ad after DELAY_REGFILE_READ;
  RegWrite_EX <= regwrite after DELAY_REGFILE_READ;
END ARCHITECTURE untitled;

