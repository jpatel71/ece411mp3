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
      clk               : IN     std_logic;
      RESET_L           : IN     std_logic;
      Opcode_EX         : IN     lc3b_opcode;
      ADDRESSMUXOUT_MEM : OUT    lc3b_word;
      Opcode_MEM        : OUT    lc3b_opcode;
      DESTREG_EX        : IN     lc3b_reg;
      destreg_MEM       : OUT    LC3B_REG;
      ALUSHFMuxOut_MEM  : OUT    lc3b_word;
      PCPlus2_EX        : IN     lc3b_word;
      PCPlus2_MEM       : OUT    lc3b_word;
      INSCC_EX          : IN     lc3b_nzp;
      INSCC_MEM         : OUT    lc3b_nzp;
      ArithOut          : IN     LC3B_WORD;
      load              : IN     std_logic;
      SRCA_EX           : IN     std_logic;
      SRCB_EX           : IN     std_logic;
      RegWrite_EX       : IN     std_logic;
      RegWrite_MEM      : OUT    std_logic;
      ADDRESS_EX        : IN     LC3b_word;
      DestValid_EX      : IN     std_logic;
      DestValid_MEM     : OUT    std_logic
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
signal regwrite : std_logic;
signal destvalid : std_logic;

BEGIN
	
	-------------------------------------------------------------------
	PROCESS(CLK, RESET_L, load)
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
      regwrite <= '0';
      destvalid<='0';
		
		-- WRITE VALUE TO REGISTER FILE ON RISING EDGE OF CLOCK IF REGWRITE ACTIVE
		ELSIF (CLK'EVENT AND (CLK = '1')) THEN
		  IF(load='1') then
				opcode <= Opcode_EX;
				ADDRESSMux<= address_ex;
				ALUSHFmux <= arithout;
				DESTREG <= DESTREG_EX;		
				inscc <= inscc_EX;
				pcplus2 <= pcplus2_EX;
				regwrite<=RegWrite_EX;
				destvalid<=DestValid_EX;
			end if;
		END IF;
	END PROCESS;
	addressmuxout_mem <= addressmux after DELAY_REGFILE_READ;
  opcode_MEM <= opcode AFTER DELAY_REGFILE_READ;
  destreg_MEM <= destreg AFTER DELAY_REGFILE_READ;
  inscc_MEM <= inscc after DELAY_REGFILE_READ;
  pcplus2_MEM <= pcplus2 after delay_REGFILE_READ;
  alushfmuxout_MEM <= alushfmux after delay_REGFILE_READ;
  regwrite_MEM <= regwrite after delay_REGFILE_READ;
   destvalid_MEM <= destvalid after delay_REGFILE_READ;
END ARCHITECTURE untitled;

