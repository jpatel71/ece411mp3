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
      Opcode_ID      : IN     LC3B_Opcode;
      clk            : IN     std_logic;
      IR_Bit4        : IN     std_logic
   );

-- Declarations

END ControlReg ;

--
ARCHITECTURE untitled OF ControlReg IS
BEGIN
  PROCESS(opcode_ID, IR_Bit5, IR_Bit11, clk, IR_BIT4)
    variable state : LC3b_ControlWord;
    --  JSRMuxSel-isJSR-EXaJMP-SrcAValid_ID-DestValid-MEMREAD-ByteSel-Storemux-SRCMuxSel-LoadNZP-1RegWrite-ADDRESSMUX1Sel-2ADDRESSMUX2Sel-ADDRESSMUXSel-SR2MuxSel-3ALUop-ALUSHFSel-MEMMUX_MEMSel-DRMUXSEL-2WBMUXSEL
  BEGIN
    case (opcode_ID) is
    when "0001" =>  --addreg
      if(IR_bit5 = '1') then
        state := "0001110001100001" & alu_add & "10001";
      else 
        state := "0001110001100000" & alu_add & "10001";
    end if;
    when "0101" =>  --and
      if(IR_bit5 = '1') then
        state := "0001110001100001" & alu_and & "10001";
      else
        state := "0001110001100000" & alu_and & "10001";       
      end if;
    when "0110" =>  --ldr
      state := "0001100001110000" & alu_pass & "00010";
    when "0010" =>  --ldb
      state := "0001101001111100" & alu_pass & "00010";
    when "1110" =>  --lea
      state := "0000100001101000" & alu_pass & "00000";
    when "0111" =>  --str
      state := "0001010110010000" & alu_pass & "10000";    
    when "0000" =>  --br
      state := "0000010000000000" & alu_pass & "00000";
    when "1001" =>  --not
      state := "0001110001100000" & alu_not & "10001";
    when "1101" =>  --shf
      state := "0001110001100000" & alu_not & "00001";
    when "0011" =>  --stb
      state := "0001011010011100" & alu_pass & "10000";
    when "1100" =>  --jmp
      state := "0011000000000000" & alu_pass & "00000";
    when "0100" =>  --jsr
      if(IR_bit11 = '0') then
        state := "1111100000100000" & alu_pass & "00011";
      else
        state := "0110100000100100" & alu_pass & "00011";        
      end if;
    when others =>
    end case;
    
    ControlWord_ID <= state after delay_control; 
  END PROCESS;
END ARCHITECTURE untitled;

