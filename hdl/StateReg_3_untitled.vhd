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
      ALUSHFMuxOut_MEM  : IN     lc3b_word;
      D_Datain          : IN     lc3b_word;
      PCPlus2_MEM       : IN     lc3b_word;
      RESET_L           : IN     std_logic;
      clk               : IN     std_logic;
      destreg_MEM       : IN     LC3B_REG;
      opcode_mem        : IN     lc3b_opcode;
      ADDRESSMUXOut_WB  : OUT    LC3b_word;
      ALUSHFMUXOut_WB   : OUT    lc3b_word;
      dest              : OUT    LC3B_REG;
      D_DATAIN_WB       : OUT    LC3b_word;
      Opcode_WB         : OUT    LC3b_opcode;
      PCPLus2_WB        : OUT    LC3b_word;
      load              : IN     std_logic;
      ADDRESSMUXOUT_MEM : IN     lc3b_word;
      RegWrite_MEM      : IN     std_logic;
      regwrite_wb       : OUT    std_logic;
      DestValid_MEM     : IN     std_logic;
      destValid_WB      : OUT    std_logic
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
signal regwrite:  std_logic;
signal destvalid:  std_logic;

BEGIN
  PROCESS(clk ,reset_L, load)
    begin
    IF (RESET_L = '0') THEN
      addressmuxout <= "0000000000000000";
      alushfmuxout <= "0000000000000000";
      destreg <= "000";
      datain <= "0000000000000000";
      opcode <= "0000";
      pcplus2 <= "0000000000000000";
      regwrite<='0';
      destvalid<='0';
  		ELSIF (CLK'EVENT AND (CLK = '1')) THEN
  		  if(load='1') then
        addressmuxout<=addressmuxout_mem;
        alushfmuxout<=alushfmuxout_mem;
        destreg<=destreg_mem;
        datain<=d_datain;
        opcode<=opcode_mem;
        pcplus2<=pcplus2_mem;
        regwrite<=regwrite_MEM;
        destvalid<=destvalid_mem;
      end if;
		END IF;
	end process;
	addressmuxout_wb <= addressmuxout ;
  alushfmuxout_wb <= alushfmuxout ;
  dest<=destreg;
  d_datain_wb <= datain ;
  opcode_WB <= opcode;
  pcplus2_wb <= pcplus2;
  regwrite_WB<=regwrite;
  destvalid_wb<=destvalid;
END ARCHITECTURE untitled;

