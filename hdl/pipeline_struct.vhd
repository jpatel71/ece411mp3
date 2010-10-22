-- VHDL Entity ece411.PipeLine.symbol
--
-- Created:
--          by - bjohns38.stdt (gllnx19.ews.illinois.edu)
--          at - 01:59:27 10/22/10
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.NUMERIC_STD.all;
USE ieee.std_logic_1164.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY PipeLine IS
   PORT( 
      D_DATAIN     : IN     lc3b_word;
      IDATAIn      : IN     LC3b_word;
      RESET_L      : IN     std_logic;
      clk          : IN     std_logic;
      D_ADDRESSOut : OUT    LC3b_word;
      D_DATAOUt    : OUT    LC3b_word;
      D_MREAD_L    : OUT    std_logic;
      IDATAAddress : OUT    LC3b_word;
      I_MREAD_L    : OUT    std_logic;
      MWRITEL_H    : OUT    std_logic;
      MWRITEL_L    : OUT    std_logic
   );

-- Declarations

END PipeLine ;

--
-- VHDL Architecture ece411.PipeLine.struct
--
-- Created:
--          by - bjohns38.stdt (gllnx19.ews.illinois.edu)
--          at - 01:59:29 10/22/10
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.NUMERIC_STD.all;
USE ieee.std_logic_1164.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

LIBRARY ece411;
LIBRARY mp3lib;

ARCHITECTURE struct OF PipeLine IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL ADDRESSMUX1Out    : LC3b_word;
   SIGNAL ADDRESSMUX1Sel    : std_logic;
   SIGNAL ADDRESSMUX2Out    : LC3b_word;
   SIGNAL ADDRESSMUX2Sel    : lc3b_4mux_sel;
   SIGNAL ADDRESSMUXOut_MEM : lc3b_word;
   SIGNAL ADDRESSMUXOut_WB  : LC3b_word;
   SIGNAL ADDRESSMUXSel     : std_logic;
   SIGNAL ADDRESSMUXout     : LC3b_word;
   SIGNAL ADJ11_EX          : LC3b_word;
   SIGNAL ADJ11_ID          : LC3b_word;
   SIGNAL ADJ5out           : LC3b_word;
   SIGNAL ADJ6_EX           : LC3b_word;
   SIGNAL ADJ6_ID           : lc3b_word;
   SIGNAL ADJ8out           : lc3b_word;
   SIGNAL ADJ8out_EX        : LC3b_word;
   SIGNAL ADJ9_EX           : LC3b_word;
   SIGNAL ADJ9_ID           : LC3b_word;
   SIGNAL ADRESSMUXSel      : std_logic;
   SIGNAL ALUMuxout         : LC3b_word;
   SIGNAL ALUSHFMUXOut_WB   : lc3b_word;
   SIGNAL ALUSHFMuxOut      : lc3b_word;
   SIGNAL ALUSHFMuxOut_MEM  : lc3b_word;
   SIGNAL ALUSHFSel         : std_logic;
   SIGNAL ALUop             : lc3b_aluop;
   SIGNAL ALUout            : LC3b_word;
   SIGNAL BRANCHLOAD_MEM    : std_logic;
   SIGNAL BR_add_EX         : lc3b_word;
   SIGNAL ControlWord_EX    : LC3b_ControlWord;
   SIGNAL ControlWord_ID    : LC3B_ControlWord;
   SIGNAL ControlWord_MEM   : LC3b_ControlWord;
   SIGNAL ControlWord_WB    : LC3b_ControlWord;
   SIGNAL DEST              : LC3B_REG;
   SIGNAL DEST_ID           : LC3b_reg;
   SIGNAL DRMuxSel          : STD_LOGIC;
   SIGNAL D_DATAIN_WB       : LC3b_word;
   SIGNAL DestReg_ID        : lc3b_reg;
   SIGNAL IMM4_ID           : lc3b_imm4;
   SIGNAL INSCC_EX          : lc3b_nzp;
   SIGNAL INSCC_ID          : lc3b_nzp;
   SIGNAL INSCC_MEM         : lc3b_nzp;
   SIGNAL IR5_4_EX          : lc3b_shfop;
   SIGNAL IR8_6_ID          : LC3B_REG;
   SIGNAL IR_2_0_ID         : STD_LOGIC_VECTOR(2 DOWNTO 0);
   SIGNAL IR_Bit11          : std_logic;
   SIGNAL IR_Bit5           : std_logic;
   SIGNAL Imm4_EX           : lc3b_imm4;
   SIGNAL MEMMUX_MEMSel     : std_logic;
   SIGNAL NZP_EX            : lc3b_nzp;
   SIGNAL Opcode_EX         : lc3b_opcode;
   SIGNAL Opcode_WB         : LC3b_opcode;
   SIGNAL PCMuxOut          : LC3b_word;
   SIGNAL PCPLus2_WB        : LC3b_word;
   SIGNAL PCPlus2_EX        : lc3b_word;
   SIGNAL PCPlus2_ID        : lc3b_word;
   SIGNAL PCPlus2_MEM       : lc3b_word;
   SIGNAL PCPlus2out_IF     : LC3b_word;
   SIGNAL RFAout_EX         : LC3b_word;
   SIGNAL RFAout_ID         : LC3b_word;
   SIGNAL RFBOut_EX         : LC3b_word;
   SIGNAL RFBout_ID         : LC3b_word;
   SIGNAL RegFileIn         : lc3b_word;
   SIGNAL SEVEN             : LC3b_reg;
   SIGNAL SHFUnitOut        : STD_LOGIC_VECTOR(15 DOWNTO 0);
   SIGNAL SR2MuxSel         : std_logic;
   SIGNAL SRCB              : STD_LOGIC_VECTOR(2 DOWNTO 0);
   SIGNAL WBMUXSel          : std_logic_vector(1 DOWNTO 0);
   SIGNAL ZERO              : LC3b_word;
   SIGNAL destReg_EX        : lc3b_reg;
   SIGNAL destreg_MEM       : LC3B_REG;
   SIGNAL imm5SEXT          : LC3b_word;
   SIGNAL imm5_ID           : LC3b_imm5;
   SIGNAL index6_ID         : LC3b_index6;
   SIGNAL load              : std_logic;
   SIGNAL nzp_MEM           : lc3b_reg;
   SIGNAL offset11_ID       : LC3b_offset11;
   SIGNAL offset9_ID        : LC3b_offset9;
   SIGNAL opcode_ID         : LC3B_Opcode;
   SIGNAL opcode_MEM        : lc3b_opcode;
   SIGNAL regwrite_wb       : std_logic;
   SIGNAL trapvect8_ID      : lc3b_trapvect8;

   -- Implicit buffer signal declarations
   SIGNAL IDATAAddress_internal : LC3b_word;
   SIGNAL D_ADDRESSOut_internal : LC3b_word;


   -- Component Declarations
   COMPONENT ADJ11
   PORT (
      offset11 : IN     LC3b_offset11 ;
      ADJ11out : OUT    LC3b_word 
   );
   END COMPONENT;
   COMPONENT ADJ5
   PORT (
      ADJ5out : OUT    LC3b_word ;
      imm5    : IN     LC3b_imm5 
   );
   END COMPONENT;
   COMPONENT ADJ6
   PORT (
      index6 : IN     LC3b_index6 ;
      input  : OUT    lc3b_word 
   );
   END COMPONENT;
   COMPONENT ADJ8
   PORT (
      trapvect8 : IN     lc3b_trapvect8 ;
      ADJ8out   : OUT    lc3b_word 
   );
   END COMPONENT;
   COMPONENT ADJ9
   PORT (
      offset9 : IN     LC3b_offset9 ;
      ADJ9out : OUT    LC3b_word 
   );
   END COMPONENT;
   COMPONENT ALU
   PORT (
      ALUMuxout : IN     LC3b_word ;
      ALUop     : IN     LC3b_aluop ;
      RFAout    : IN     LC3b_word ;
      ALUout    : OUT    LC3b_word 
   );
   END COMPONENT;
   COMPONENT ALUSHFtoD
   PORT (
      ALUSHFMuxOut_MEM : IN     lc3b_word ;
      clk              : IN     std_logic ;
      D_DATAOUt        : OUT    LC3b_word 
   );
   END COMPONENT;
   COMPONENT BRANCHLogic
   PORT (
      INSCC_MEM      : IN     lc3b_nzp ;
      nzp_MEM        : IN     lc3b_reg ;
      BRANCHLOAD_MEM : OUT    std_logic ;
      opcode_MEM     : IN     lc3b_opcode ;
      clk            : IN     std_logic 
   );
   END COMPONENT;
   COMPONENT BR_add
   PORT (
      ADDRESSMUX1Out : IN     LC3b_word ;
      ADDRESSMUX2Out : IN     LC3b_word ;
      BR_add_EX      : OUT    lc3b_word ;
      clk            : IN     std_logic 
   );
   END COMPONENT;
   COMPONENT ControlReg
   PORT (
      RESET_L        : IN     std_logic ;
      IR_Bit5        : IN     std_logic ;
      IR_Bit11       : IN     std_logic ;
      ControlWord_ID : OUT    LC3B_ControlWord ;
      opcode_ID      : IN     LC3B_Opcode ;
      clk            : IN     std_logic 
   );
   END COMPONENT;
   COMPONENT ControlSplit_EX
   PORT (
      ControlWord_EX : IN     LC3b_ControlWord ;
      ADDRESSMUX1Sel : OUT    std_logic ;
      ADDRESSMUX2Sel : OUT    lc3b_4mux_sel ;
      ADDRESSMUXSel  : OUT    std_logic ;
      SR2MuxSel      : OUT    std_logic ;
      ALUop          : OUT    lc3b_aluop ;
      ALUSHFSel      : OUT    std_logic ;
      clk            : IN     std_logic 
   );
   END COMPONENT;
   COMPONENT ControlSplit_MEM
   PORT (
      ControlWord_MEM : IN     LC3b_ControlWord ;
      MEMMUX_MEMSel   : OUT    std_logic ;
      clk             : IN     std_logic 
   );
   END COMPONENT;
   COMPONENT ControlSplit_WB
   PORT (
      ControlWord_WB : IN     LC3b_ControlWord ;
      WBMUXSel       : OUT    std_logic_vector (1 DOWNTO 0);
      regwrite_wb    : OUT    std_logic ;
      clk            : IN     std_logic 
   );
   END COMPONENT;
   COMPONENT ControlWordReg
   PORT (
      Input  : IN     LC3b_ControlWord ;
      RESET  : IN     std_logic ;
      clk    : IN     std_logic ;
      load   : IN     std_logic ;
      Output : OUT    LC3b_ControlWord 
   );
   END COMPONENT;
   COMPONENT Plus2
   PORT (
      PCout      : IN     LC3b_word ;
      PCPlus2out : OUT    LC3b_word 
   );
   END COMPONENT;
   COMPONENT READLOGIC
   PORT (
      opcode_MEM : IN     lc3b_opcode ;
      D_MREAD_L  : OUT    std_logic ;
      clk        : IN     std_logic 
   );
   END COMPONENT;
   COMPONENT Reg16
   PORT (
      Input  : IN     LC3b_word ;
      RESET  : IN     std_logic ;
      clk    : IN     std_logic ;
      load   : IN     std_logic ;
      Output : OUT    LC3b_word 
   );
   END COMPONENT;
   COMPONENT State_Reg
   PORT (
      PCPlus2out_IF : IN     LC3b_word ;
      PCPlus2_ID    : OUT    lc3b_word ;
      index6_ID     : OUT    LC3b_index6 ;
      offset9_ID    : OUT    LC3b_offset9 ;
      offset11_ID   : OUT    LC3b_offset11 ;
      RESET_L       : IN     std_logic ;
      IDATAIn       : IN     LC3b_word ;
      IR_Bit5       : OUT    std_logic ;
      IR_Bit11      : OUT    std_logic ;
      IR_2_0_ID     : OUT    STD_LOGIC_VECTOR (2 DOWNTO 0);
      IR8_6_ID      : OUT    LC3B_REG ;
      opcode_ID     : OUT    LC3B_Opcode ;
      DEST_ID       : OUT    LC3b_reg ;
      IMM4_ID       : OUT    lc3b_imm4 ;
      INSCC_ID      : OUT    lc3b_nzp ;
      clk           : IN     std_logic ;
      imm5_ID       : OUT    LC3b_imm5 ;
      trapvect8_ID  : OUT    lc3b_trapvect8 
   );
   END COMPONENT;
   COMPONENT State_Reg1
   PORT (
      clk        : IN     std_logic ;
      ADJ11_ID   : IN     LC3b_word ;
      ADJ6_ID    : IN     lc3b_word ;
      ADJ9_ID    : IN     LC3b_word ;
      PCPlus2_ID : IN     lc3b_word ;
      RFAout_ID  : IN     LC3b_word ;
      RFBout_ID  : IN     LC3b_word ;
      IR5_4_EX   : OUT    lc3b_shfop ;
      RFAout_EX  : OUT    LC3b_word ;
      RFBOut_EX  : OUT    LC3b_word ;
      imm5SEXT   : OUT    LC3b_word ;
      PCPlus2_EX : OUT    lc3b_word ;
      RESET_L    : IN     std_logic ;
      opcode_ID  : IN     LC3B_Opcode ;
      Opcode_EX  : OUT    lc3b_opcode ;
      ADJ6_EX    : OUT    LC3b_word ;
      ADJ11_EX   : OUT    LC3b_word ;
      ADJ9_EX    : OUT    LC3b_word ;
      ADJ5out    : IN     LC3b_word ;
      ADJ8out    : IN     lc3b_word ;
      ADJ8out_EX : OUT    LC3b_word ;
      destReg_EX : OUT    lc3b_reg ;
      DestReg_ID : IN     lc3b_reg ;
      Imm4_EX    : OUT    lc3b_imm4 ;
      IMM4_ID    : IN     lc3b_imm4 ;
      INSCC_ID   : IN     lc3b_nzp ;
      INSCC_EX   : OUT    lc3b_nzp 
   );
   END COMPONENT;
   COMPONENT State_Reg2
   PORT (
      clk               : IN     std_logic ;
      RESET_L           : IN     std_logic ;
      ADDRESSMUXout     : IN     LC3b_word ;
      ALUSHFMuxOut      : IN     lc3b_word ;
      Opcode_EX         : IN     lc3b_opcode ;
      ADDRESSMUXOut_MEM : OUT    lc3b_word ;
      nzp_MEM           : OUT    lc3b_reg ;
      opcode_MEM        : OUT    lc3b_opcode ;
      destReg_EX        : IN     lc3b_reg ;
      destreg_MEM       : OUT    LC3B_REG ;
      ALUSHFMuxOut_MEM  : OUT    lc3b_word ;
      PCPlus2_EX        : IN     lc3b_word ;
      PCPlus2_MEM       : OUT    lc3b_word ;
      INSCC_EX          : IN     lc3b_nzp ;
      INSCC_MEM         : OUT    lc3b_nzp ;
      NZP_EX            : IN     lc3b_nzp 
   );
   END COMPONENT;
   COMPONENT State_Reg3
   PORT (
      ADDRESSMUXOut_MEM : IN     lc3b_word ;
      ALUSHFMuxOut_MEM  : IN     lc3b_word ;
      D_DATAIN          : IN     lc3b_word ;
      PCPlus2_MEM       : IN     lc3b_word ;
      RESET_L           : IN     std_logic ;
      clk               : IN     std_logic ;
      destreg_MEM       : IN     LC3B_REG ;
      opcode_MEM        : IN     lc3b_opcode ;
      ADDRESSMUXOut_WB  : OUT    LC3b_word ;
      ALUSHFMUXOut_WB   : OUT    lc3b_word ;
      DEST              : OUT    LC3B_REG ;
      D_DATAIN_WB       : OUT    LC3b_word ;
      Opcode_WB         : OUT    LC3b_opcode ;
      PCPLus2_WB        : OUT    LC3b_word 
   );
   END COMPONENT;
   COMPONENT WordMux2
   PORT (
      A   : IN     LC3b_word ;
      B   : IN     LC3b_word ;
      Sel : IN     std_logic ;
      F   : OUT    LC3b_word 
   );
   END COMPONENT;
   COMPONENT WordMux4
   PORT (
      A   : IN     LC3b_word ;
      B   : IN     LC3b_word ;
      C   : IN     LC3b_word ;
      D   : IN     LC3b_word ;
      Sel : IN     LC3b_4MUX_Sel ;
      F   : OUT    LC3b_word 
   );
   END COMPONENT;
   COMPONENT WriteLogic
   PORT (
      D_ADDRESSOut : IN     LC3b_word ;
      opcode_MEM   : IN     lc3b_opcode ;
      MWRITEL_H    : OUT    std_logic ;
      MWRITEL_L    : OUT    std_logic ;
      clk          : IN     std_logic 
   );
   END COMPONENT;
   COMPONENT MUX2_3
   PORT (
      A   : IN     STD_LOGIC_VECTOR (2 DOWNTO 0);
      B   : IN     STD_LOGIC_VECTOR (2 DOWNTO 0);
      SEL : IN     STD_LOGIC ;
      F   : OUT    STD_LOGIC_VECTOR (2 DOWNTO 0)
   );
   END COMPONENT;
   COMPONENT REGFILE
   PORT (
      CLK      : IN     STD_LOGIC ;
      DEST     : IN     LC3B_REG ;
      DIN      : IN     LC3B_WORD ;
      RESET_L  : IN     STD_LOGIC ;
      REGWRITE : IN     STD_LOGIC ;
      SRCA     : IN     LC3B_REG ;
      SRCB     : IN     LC3B_REG ;
      A        : OUT    LC3B_WORD ;
      B        : OUT    LC3B_WORD 
   );
   END COMPONENT;
   COMPONENT SHIFT16
   PORT (
      A       : IN     STD_LOGIC_VECTOR (15 DOWNTO 0);
      SHFTAMT : IN     STD_LOGIC_VECTOR (3 DOWNTO 0);
      SHFTOP  : IN     STD_LOGIC_VECTOR (1 DOWNTO 0);
      F       : OUT    STD_LOGIC_VECTOR (15 DOWNTO 0)
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : ADJ11 USE ENTITY ece411.ADJ11;
   FOR ALL : ADJ5 USE ENTITY ece411.ADJ5;
   FOR ALL : ADJ6 USE ENTITY ece411.ADJ6;
   FOR ALL : ADJ8 USE ENTITY ece411.ADJ8;
   FOR ALL : ADJ9 USE ENTITY ece411.ADJ9;
   FOR ALL : ALU USE ENTITY ece411.ALU;
   FOR ALL : ALUSHFtoD USE ENTITY ece411.ALUSHFtoD;
   FOR ALL : BRANCHLogic USE ENTITY ece411.BRANCHLogic;
   FOR ALL : BR_add USE ENTITY ece411.BR_add;
   FOR ALL : ControlReg USE ENTITY ece411.ControlReg;
   FOR ALL : ControlSplit_EX USE ENTITY ece411.ControlSplit_EX;
   FOR ALL : ControlSplit_MEM USE ENTITY ece411.ControlSplit_MEM;
   FOR ALL : ControlSplit_WB USE ENTITY ece411.ControlSplit_WB;
   FOR ALL : ControlWordReg USE ENTITY ece411.ControlWordReg;
   FOR ALL : MUX2_3 USE ENTITY mp3lib.MUX2_3;
   FOR ALL : Plus2 USE ENTITY ece411.Plus2;
   FOR ALL : READLOGIC USE ENTITY ece411.READLOGIC;
   FOR ALL : REGFILE USE ENTITY mp3lib.REGFILE;
   FOR ALL : Reg16 USE ENTITY ece411.Reg16;
   FOR ALL : SHIFT16 USE ENTITY mp3lib.SHIFT16;
   FOR ALL : State_Reg USE ENTITY ece411.State_Reg;
   FOR ALL : State_Reg1 USE ENTITY ece411.State_Reg1;
   FOR ALL : State_Reg2 USE ENTITY ece411.State_Reg2;
   FOR ALL : State_Reg3 USE ENTITY ece411.State_Reg3;
   FOR ALL : WordMux2 USE ENTITY ece411.WordMux2;
   FOR ALL : WordMux4 USE ENTITY ece411.WordMux4;
   FOR ALL : WriteLogic USE ENTITY ece411.WriteLogic;
   -- pragma synthesis_on


BEGIN
   -- Architecture concurrent statements
   -- HDL Embedded Text Block 1 ZEROBLOCK
   -- ZEROBLOCK 1
   ZERO <= "0000000000000000";                                        

   -- HDL Embedded Text Block 2 eb1
   -- eb1 2   
   SEVEN <= "111";                                     

   -- HDL Embedded Text Block 3 eb2
   -- eb2 3 
   I_MREAD_L <= '1';
   load <= '1';                                       


   -- Instance port mappings.
   U_3 : ADJ11
      PORT MAP (
         offset11 => offset11_ID,
         ADJ11out => ADJ11_ID
      );
   U_13 : ADJ5
      PORT MAP (
         ADJ5out => ADJ5out,
         imm5    => imm5_ID
      );
   U_1 : ADJ6
      PORT MAP (
         index6 => index6_ID,
         input  => ADJ6_ID
      );
   U_14 : ADJ8
      PORT MAP (
         trapvect8 => trapvect8_ID,
         ADJ8out   => ADJ8out
      );
   U_2 : ADJ9
      PORT MAP (
         offset9 => offset9_ID,
         ADJ9out => ADJ9_ID
      );
   U_0 : ALU
      PORT MAP (
         ALUMuxout => ALUMuxout,
         ALUop     => ALUop,
         RFAout    => RFAout_EX,
         ALUout    => ALUout
      );
   U_18 : ALUSHFtoD
      PORT MAP (
         ALUSHFMuxOut_MEM => ALUSHFMuxOut_MEM,
         clk              => clk,
         D_DATAOUt        => D_DATAOUt
      );
   aBRANCHLOGIC : BRANCHLogic
      PORT MAP (
         INSCC_MEM      => INSCC_MEM,
         nzp_MEM        => nzp_MEM,
         BRANCHLOAD_MEM => BRANCHLOAD_MEM,
         opcode_MEM     => opcode_MEM,
         clk            => clk
      );
   aBR_add : BR_add
      PORT MAP (
         ADDRESSMUX1Out => ADDRESSMUX1Out,
         ADDRESSMUX2Out => ADDRESSMUX2Out,
         BR_add_EX      => BR_add_EX,
         clk            => clk
      );
   aControlReg : ControlReg
      PORT MAP (
         RESET_L        => RESET_L,
         IR_Bit5        => IR_Bit5,
         IR_Bit11       => IR_Bit11,
         ControlWord_ID => ControlWord_ID,
         opcode_ID      => opcode_ID,
         clk            => clk
      );
   U_6 : ControlSplit_EX
      PORT MAP (
         ControlWord_EX => ControlWord_EX,
         ADDRESSMUX1Sel => ADDRESSMUX1Sel,
         ADDRESSMUX2Sel => ADDRESSMUX2Sel,
         ADDRESSMUXSel  => ADDRESSMUXSel,
         SR2MuxSel      => SR2MuxSel,
         ALUop          => ALUop,
         ALUSHFSel      => ALUSHFSel,
         clk            => clk
      );
   U_17 : ControlSplit_MEM
      PORT MAP (
         ControlWord_MEM => ControlWord_MEM,
         MEMMUX_MEMSel   => MEMMUX_MEMSel,
         clk             => clk
      );
   U_5 : ControlSplit_WB
      PORT MAP (
         ControlWord_WB => ControlWord_WB,
         WBMUXSel       => WBMUXSel,
         regwrite_wb    => regwrite_wb,
         clk            => clk
      );
   U_10 : ControlWordReg
      PORT MAP (
         Input  => ControlWord_ID,
         RESET  => RESET_L,
         clk    => clk,
         load   => load,
         Output => ControlWord_EX
      );
   U_11 : ControlWordReg
      PORT MAP (
         Input  => ControlWord_EX,
         RESET  => RESET_L,
         clk    => clk,
         load   => load,
         Output => ControlWord_MEM
      );
   U_12 : ControlWordReg
      PORT MAP (
         Input  => ControlWord_MEM,
         RESET  => RESET_L,
         clk    => clk,
         load   => load,
         Output => ControlWord_WB
      );
   U_4 : Plus2
      PORT MAP (
         PCout      => IDATAAddress_internal,
         PCPlus2out => PCPlus2out_IF
      );
   READLOGIC_MEM : READLOGIC
      PORT MAP (
         opcode_MEM => opcode_MEM,
         D_MREAD_L  => D_MREAD_L,
         clk        => clk
      );
   PC : Reg16
      PORT MAP (
         Input  => PCMuxOut,
         RESET  => RESET_L,
         clk    => clk,
         load   => load,
         Output => IDATAAddress_internal
      );
   theIF_Reg : State_Reg
      PORT MAP (
         PCPlus2out_IF => PCPlus2out_IF,
         PCPlus2_ID    => PCPlus2_ID,
         index6_ID     => index6_ID,
         offset9_ID    => offset9_ID,
         offset11_ID   => offset11_ID,
         RESET_L       => RESET_L,
         IDATAIn       => IDATAIn,
         IR_Bit5       => IR_Bit5,
         IR_Bit11      => IR_Bit11,
         IR_2_0_ID     => IR_2_0_ID,
         IR8_6_ID      => IR8_6_ID,
         opcode_ID     => opcode_ID,
         DEST_ID       => DEST_ID,
         IMM4_ID       => IMM4_ID,
         INSCC_ID      => INSCC_ID,
         clk           => clk,
         imm5_ID       => imm5_ID,
         trapvect8_ID  => trapvect8_ID
      );
   theID_Reg : State_Reg1
      PORT MAP (
         clk        => clk,
         ADJ11_ID   => ADJ11_ID,
         ADJ6_ID    => ADJ6_ID,
         ADJ9_ID    => ADJ9_ID,
         PCPlus2_ID => PCPlus2_ID,
         RFAout_ID  => RFAout_ID,
         RFBout_ID  => RFBout_ID,
         IR5_4_EX   => IR5_4_EX,
         RFAout_EX  => RFAout_EX,
         RFBOut_EX  => RFBOut_EX,
         imm5SEXT   => imm5SEXT,
         PCPlus2_EX => PCPlus2_EX,
         RESET_L    => RESET_L,
         opcode_ID  => opcode_ID,
         Opcode_EX  => Opcode_EX,
         ADJ6_EX    => ADJ6_EX,
         ADJ11_EX   => ADJ11_EX,
         ADJ9_EX    => ADJ9_EX,
         ADJ5out    => ADJ5out,
         ADJ8out    => ADJ8out,
         ADJ8out_EX => ADJ8out_EX,
         destReg_EX => destReg_EX,
         DestReg_ID => DestReg_ID,
         Imm4_EX    => Imm4_EX,
         IMM4_ID    => IMM4_ID,
         INSCC_ID   => INSCC_ID,
         INSCC_EX   => INSCC_EX
      );
   theEX_Reg : State_Reg2
      PORT MAP (
         clk               => clk,
         RESET_L           => RESET_L,
         ADDRESSMUXout     => ADDRESSMUXout,
         ALUSHFMuxOut      => ALUSHFMuxOut,
         Opcode_EX         => Opcode_EX,
         ADDRESSMUXOut_MEM => ADDRESSMUXOut_MEM,
         nzp_MEM           => nzp_MEM,
         opcode_MEM        => opcode_MEM,
         destReg_EX        => destReg_EX,
         destreg_MEM       => destreg_MEM,
         ALUSHFMuxOut_MEM  => ALUSHFMuxOut_MEM,
         PCPlus2_EX        => PCPlus2_EX,
         PCPlus2_MEM       => PCPlus2_MEM,
         INSCC_EX          => INSCC_EX,
         INSCC_MEM         => INSCC_MEM,
         NZP_EX            => NZP_EX
      );
   theMEM_Reg : State_Reg3
      PORT MAP (
         ADDRESSMUXOut_MEM => ADDRESSMUXOut_MEM,
         ALUSHFMuxOut_MEM  => ALUSHFMuxOut_MEM,
         D_DATAIN          => D_DATAIN,
         PCPlus2_MEM       => PCPlus2_MEM,
         RESET_L           => RESET_L,
         clk               => clk,
         destreg_MEM       => destreg_MEM,
         opcode_MEM        => opcode_MEM,
         ADDRESSMUXOut_WB  => ADDRESSMUXOut_WB,
         ALUSHFMUXOut_WB   => ALUSHFMUXOut_WB,
         DEST              => DEST,
         D_DATAIN_WB       => D_DATAIN_WB,
         Opcode_WB         => Opcode_WB,
         PCPLus2_WB        => PCPLus2_WB
      );
   ADDRESSMUX : WordMux2
      PORT MAP (
         A   => BR_add_EX,
         B   => ADJ8out_EX,
         Sel => ADRESSMUXSel,
         F   => ADDRESSMUXout
      );
   BRANCHLOAD : WordMux2
      PORT MAP (
         A   => PCPlus2out_IF,
         B   => ADDRESSMUXOut_MEM,
         Sel => BRANCHLOAD_MEM,
         F   => PCMuxOut
      );
   MEMMUX_MEM : WordMux2
      PORT MAP (
         A   => ADDRESSMUXOut_MEM,
         B   => D_DATAIN,
         Sel => MEMMUX_MEMSel,
         F   => D_ADDRESSOut_internal
      );
   U_7 : WordMux2
      PORT MAP (
         A   => PCPlus2_EX,
         B   => RFAout_EX,
         Sel => ADDRESSMUX1Sel,
         F   => ADDRESSMUX1Out
      );
   aALUMuxOut : WordMux2
      PORT MAP (
         A   => RFBOut_EX,
         B   => imm5SEXT,
         Sel => SR2MuxSel,
         F   => ALUMuxout
      );
   aALUSHFMuxOut : WordMux2
      PORT MAP (
         A   => SHFUnitOut,
         B   => ALUout,
         Sel => ALUSHFSel,
         F   => ALUSHFMuxOut
      );
   ADDRESSMUX2 : WordMux4
      PORT MAP (
         A   => ADJ6_EX,
         B   => ADJ11_EX,
         C   => ADJ9_EX,
         D   => ZERO,
         Sel => ADDRESSMUX2Sel,
         F   => ADDRESSMUX2Out
      );
   WBMUX : WordMux4
      PORT MAP (
         A   => ADDRESSMUXOut_WB,
         B   => ALUSHFMUXOut_WB,
         C   => D_DATAIN_WB,
         D   => PCPLus2_WB,
         Sel => WBMUXSel,
         F   => RegFileIn
      );
   U_16 : WriteLogic
      PORT MAP (
         D_ADDRESSOut => D_ADDRESSOut_internal,
         opcode_MEM   => opcode_MEM,
         MWRITEL_H    => MWRITEL_H,
         MWRITEL_L    => MWRITEL_L,
         clk          => clk
      );
   DRMux : MUX2_3
      PORT MAP (
         A   => DEST_ID,
         B   => SEVEN,
         SEL => DRMuxSel,
         F   => DestReg_ID
      );
   SRCBMUX : MUX2_3
      PORT MAP (
         A   => DEST_ID,
         B   => IR_2_0_ID,
         SEL => IR_Bit5,
         F   => SRCB
      );
   U_15 : REGFILE
      PORT MAP (
         CLK      => clk,
         DEST     => DEST,
         DIN      => RegFileIn,
         RESET_L  => RESET_L,
         REGWRITE => regwrite_wb,
         SRCA     => IR8_6_ID,
         SRCB     => SRCB,
         A        => RFAout_ID,
         B        => RFBout_ID
      );
   U_8 : SHIFT16
      PORT MAP (
         A       => RFAout_EX,
         SHFTAMT => Imm4_EX,
         SHFTOP  => IR5_4_EX,
         F       => SHFUnitOut
      );

   -- Implicit buffered output assignments
   IDATAAddress <= IDATAAddress_internal;
   D_ADDRESSOut <= D_ADDRESSOut_internal;

END struct;
