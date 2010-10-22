--
-- VHDL Architecture ece411.ControlReg.untitled
--
-- Created:
--          by - bjohns38.stdt (eelnx25.ews.illinois.edu)
--          at - 12:00:41 10/19/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.NUMERIC_STD.all;
USE ieee.std_logic_1164.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY ControlReg IS
   PORT( 
      RESET_L        : IN     std_logic;
      IR_Bit5        : IN     std_logic;
      IR_Bit11       : IN     std_logic;
      ControlWord_ID : OUT    LC3B_ControlWord;
      opcode_ID      : IN     LC3B_Opcode;
      clk            : IN     std_logic
   );

-- Declarations

END ControlReg ;

--
ARCHITECTURE untitled OF ControlReg IS
BEGIN
  PROCESS(opcode_ID, IR_Bit5, IR_Bit11, clk)
    variable state : LC3b_ControlWord;
    --  1RegWrite-ADDRESSMUX1Sel-2ADDRESSMUX2Sel-ADDRESSMUXSel-SR2MuxSel-ALUop-ALUSHFSel-MEMMUX_MEMSel-DRMUXSEL-2WBMUXSEL
  BEGIN
    case (opcode_ID) is
   -- when "0000" =>
    --  state := "000000" & alu_pass & "00000";
    when "0001" =>  --addreg
      state := "10000"& IR_Bit5 & alu_add & "10001";
    when "0101" =>  --and
      state := "10000"& IR_Bit5 & alu_and & "10001";
    when "0110" =>  --ldr
      state := "110000" & alu_pass & "00010";
    when "0111" =>  --str
      state := "010000" & alu_pass & "10000";    
    when "0000" =>  --br
      state := "000000" & alu_pass & "00000";
    when others =>
    end case;
    
    ControlWord_ID <= state after delay_control; 
  END PROCESS;
END ARCHITECTURE untitled;
