--
-- VHDL Architecture ece411.StateReg_3.untitled
--
-- Created:
--          by - bjohns38.stdt (eelnx24.ews.illinois.edu)
--          at - 13:50:04 10/22/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.NUMERIC_STD.all;
USE ieee.std_logic_1164.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY StateReg_3 IS
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

END StateReg_3 ;

--
ARCHITECTURE untitled OF StateReg_3 IS
signal addressmuxout : lc3b_word;
signal alushfmuxout  :  lc3b_word;
signal destreg :  lc3b_reg;
signal datain : lc3b_word;
signal opcode: lc3b_opcode;
signal pcplus2:  lc3b_word;

BEGIN
  PROCESS(clk ,reset_L)
    begin
    IF (RESET_L = '0') THEN
      addressmuxout <= "0000000000000000";
      alushfmuxout <= "0000000000000000";
      destreg <= "000";
      datain <= "0000000000000000";
      opcode <= "0000";
      pcplus2 <= "0000000000000000";
  		ELSIF (CLK'EVENT AND (CLK = '1')) THEN
      addressmuxout<=addressmuxout_mem;
      alushfmuxout<=alushfmuxout_mem;
      destreg<=destreg_mem;
      datain<=d_datain;
      opcode<=opcode_mem;
      pcplus2<=pcplus2_mem;
		END IF;
	end process;
	addressmuxout_wb <= addressmuxout ;
  alushfmuxout_wb <= alushfmuxout ;
  dest<=destreg;
  d_datain_wb <= datain ;
  opcode_WB <= opcode;
  pcplus2_wb <= pcplus2;
  
END ARCHITECTURE untitled;

