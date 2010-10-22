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
      reset_L        : IN     std_logic;
      IR_Bit5        : IN     std_logic;
      IR_Bit11       : IN     std_logic;
      ControlWord_ID : OUT    LC3B_ControlWord;
      opcode_ID      : IN     LC3B_Opcode
   );

-- Declarations

END ControlReg ;

--
ARCHITECTURE untitled OF ControlReg IS
BEGIN
  PROCESS(opcode_ID, IR_Bit5, IR_Bit11)
    variable state : LC3b_ControlWord;
    --  1RegWrite-ADDRESSMUX1Sel-ADDRESSMUX2Sel-ADDRESSMUXSel-SR2MuxSel-ALUop-ALUSHFSel-MEMMUX_MEMSel-MEMMUX_MEM1Sel
  BEGIN
    case (opcode_ID & IR_Bit5 & IR_Bit11) is
    when "000000" =>
      state := "00000000000";
    when "000100" =>  --addreg
      state := "10000" & alu_add & "1";
    when "000101" =>  --addreg
      state := "10000" & alu_add & "1";
    when "000110" =>  --addimm
      state := "10001" & alu_add & "1";
    when "000111" =>  --addimm
      state := "10001" & alu_add & "1";
    when others =>
    end case;
    
    ControlWord_ID <= state after delay_control; 
  END PROCESS;
END ARCHITECTURE untitled;

