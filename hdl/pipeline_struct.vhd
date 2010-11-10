-- VHDL Entity ece411.PipeLine.symbol
--
-- Created:
--          by - bjohns38.stdt (dcllnx69.ews.illinois.edu)
--          at - 22:45:37 11/09/10
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
      D_MRESP_H    : IN     std_logic;
      IDATAIn      : IN     LC3b_word;
      I_MRESP_H    : IN     std_logic;
      RESET_L      : IN     std_logic;
      clk          : IN     std_logic;
      D_ADDRESSOut : OUT    LC3b_word;
      D_DATAOUt    : OUT    LC3b_word;
      D_MREAD_L    : OUT    std_logic;
      D_MWRITEH_L  : OUT    std_logic;
      D_MWRITEL_L  : OUT    std_logic;
      IDATAAddress : OUT    LC3b_word;
      I_MREAD_L    : OUT    std_logic
   );

-- Declarations

END PipeLine ;

--
-- VHDL Architecture ece411.PipeLine.struct
--
-- Created:
--          by - bjohns38.stdt (dcllnx69.ews.illinois.edu)
--          at - 22:45:38 11/09/10
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
   SIGNAL ADJ6ns_EX         : lc3b_word;
   SIGNAL ADJ6ns_ID         : lc3b_word;
   SIGNAL ADJ8out           : lc3b_word;
   SIGNAL ADJ8out_EX        : LC3b_word;
   SIGNAL ADJ9_EX           : LC3b_word;
   SIGNAL ADJ9_ID           : LC3b_word;
   SIGNAL AD_EX             : lc3b_shftop;
   SIGNAL AD_ID             : lc3b_SHFTOP;
   SIGNAL ALUMuxout         : LC3b_word;
   SIGNAL ALUSHFMUXOut_WB   : lc3b_word;
   SIGNAL ALUSHFMuxOut      : lc3b_word;
   SIGNAL ALUSHFMuxOut_MEM  : lc3b_word;
   SIGNAL ALUSHFSel         : std_logic;
   SIGNAL ALUop             : lc3b_aluop;
   SIGNAL ALUout            : LC3b_word;
   SIGNAL ArithOut          : LC3B_WORD;
   SIGNAL B                 : LC3b_word;
   SIGNAL BRANCHLOAD_MEM    : std_logic;
   SIGNAL BR_add_EX         : lc3b_word;
   SIGNAL ByteSel           : std_logic;
   SIGNAL ByteSel_WB        : std_logic;
   SIGNAL CheckN            : std_logic;
   SIGNAL CheckP            : std_logic;
   SIGNAL CheckZ            : std_logic;
   SIGNAL ChoosePC          : lc3b_word;
   SIGNAL ControlWord_EX    : LC3b_ControlWord;
   SIGNAL ControlWord_ID    : LC3B_ControlWord;
   SIGNAL ControlWord_MEM   : LC3b_ControlWord;
   SIGNAL ControlWord_WB    : LC3b_ControlWord;
   SIGNAL DESTREG_EX        : lc3b_reg;
   SIGNAL D_DATAIN_WB       : LC3b_word;
   SIGNAL DestValid_EX      : std_logic;
   SIGNAL DestValid_MEM     : std_logic;
   SIGNAL DestValid_WB      : std_logic;
   SIGNAL Dest_ID           : LC3b_reg;
   SIGNAL EXaJMP            : std_logic;
   SIGNAL F                 : STD_LOGIC;
   SIGNAL GenCCout          : LC3b_cc;
   SIGNAL Hazard            : std_logic;
   SIGNAL IMM4_ID           : lc3b_imm4;
   SIGNAL INSCC_EX          : lc3b_nzp;
   SIGNAL INSCC_ID          : lc3b_nzp;
   SIGNAL INSCC_MEM         : lc3b_nzp;
   SIGNAL IR8_6_ID          : LC3B_REG;
   SIGNAL IR_2_0_ID         : STD_LOGIC_VECTOR(2 DOWNTO 0);
   SIGNAL IR_Bit11          : std_logic;
   SIGNAL IR_Bit4           : std_logic;
   SIGNAL IR_Bit5           : std_logic;
   SIGNAL Imm4_EX           : lc3b_imm4;
   SIGNAL LoadControl       : std_logic;
   SIGNAL LoadNZP           : std_logic;
   SIGNAL MEMMUX_MEMSel     : std_logic;
   SIGNAL Opcode_EX         : lc3b_opcode;
   SIGNAL Opcode_ID         : LC3B_Opcode;
   SIGNAL Opcode_MEM        : lc3b_opcode;
   SIGNAL Opcode_WB         : LC3b_opcode;
   SIGNAL PCMuxOut          : LC3b_word;
   SIGNAL PCPLus2_WB        : LC3b_word;
   SIGNAL PCPlus2_EX        : lc3b_word;
   SIGNAL PCPlus2_ID        : lc3b_word;
   SIGNAL PCPlus2_MEM       : lc3b_word;
   SIGNAL PCPlus2out_IF     : LC3b_word;
   SIGNAL RFAout_EX         : LC3b_word;
   SIGNAL RFAout_ID         : LC3b_word;
   SIGNAL RFBout_ID         : LC3b_word;
   SIGNAL RegFileIn         : lc3b_word;
   SIGNAL RegWrite_EX       : std_logic;
   SIGNAL RegWrite_ID       : std_logic;
   SIGNAL RegWrite_MEM      : std_logic;
   SIGNAL SHFUnitOut        : STD_LOGIC_VECTOR(15 DOWNTO 0);
   SIGNAL SR2MuxSel         : std_logic;
   SIGNAL SRCAMUXOut        : STD_LOGIC_VECTOR(2 DOWNTO 0);
   SIGNAL SRCAValid         : std_logic;
   SIGNAL SRCA_EX           : std_logic;
   SIGNAL SRCB_EX           : std_logic;
   SIGNAL SRCMuxSel         : STD_LOGIC;
   SIGNAL StoreMux          : std_logic;
   SIGNAL WBMUXSel          : std_logic_vector(1 DOWNTO 0);
   SIGNAL WBMuxout          : LC3b_word;
   SIGNAL byteWordOut       : lc3b_word;
   SIGNAL bytemuxout        : LC3b_word;
   SIGNAL dest              : LC3B_REG;
   SIGNAL destreg_MEM       : LC3B_REG;
   SIGNAL imm5SEXT          : LC3b_word;
   SIGNAL imm5_ID           : LC3b_imm5;
   SIGNAL index6_ID         : LC3b_index6;
   SIGNAL load              : std_logic;
   SIGNAL load1             : std_logic;
   SIGNAL n                 : std_logic;
   SIGNAL offset11_ID       : LC3b_offset11;
   SIGNAL offset9_ID        : LC3b_offset9;
   SIGNAL p                 : std_logic;
   SIGNAL regwrite_wb       : std_logic;
   SIGNAL rfbout_ex         : LC3b_word;
   SIGNAL trapvect8_ID      : lc3b_trapvect8;
   SIGNAL z                 : std_logic;

   -- Implicit buffer signal declarations
   SIGNAL IDATAAddress_internal : LC3b_word;
   SIGNAL D_ADDRESSOut_internal : LC3b_word;
   SIGNAL D_MWRITEH_L_internal  : std_logic;
   SIGNAL D_MWRITEL_L_internal  : std_logic;
   SIGNAL D_MREAD_L_internal    : std_logic;


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
   COMPONENT BR_add
   PORT (
      ADDRESSMUX1Out : IN     LC3b_word ;
      ADDRESSMUX2Out : IN     LC3b_word ;
      BR_add_EX      : OUT    lc3b_word ;
      clk            : IN     std_logic 
   );
   END COMPONENT;
   COMPONENT BRlog
   PORT (
      Opcode_MEM     : IN     lc3b_opcode ;
      CheckN         : IN     std_logic ;
      CheckP         : IN     std_logic ;
      CheckZ         : IN     std_logic ;
      clk            : IN     std_logic ;
      n              : IN     std_logic ;
      p              : IN     std_logic ;
      z              : IN     std_logic ;
      BRANCHLOAD_MEM : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT ControlReg
   PORT (
      RESET_L        : IN     std_logic ;
      IR_Bit5        : IN     std_logic ;
      IR_Bit11       : IN     std_logic ;
      ControlWord_ID : OUT    LC3B_ControlWord ;
      Opcode_ID      : IN     LC3B_Opcode ;
      clk            : IN     std_logic ;
      IR_Bit4        : IN     std_logic 
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
      clk            : IN     std_logic ;
      ByteSel        : OUT    std_logic ;
      StoreMux       : OUT    std_logic ;
      DestValid_EX   : OUT    std_logic ;
      EXaJMP         : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT ControlSplit_ID
   PORT (
      ControlWord_ID : IN     LC3B_ControlWord ;
      clk            : IN     std_logic ;
      SRCAValid      : OUT    std_logic ;
      SRCMuxSel      : OUT    STD_LOGIC ;
      RegWrite_ID    : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT ControlSplit_MEM
   PORT (
      ControlWord_MEM : IN     LC3b_ControlWord ;
      clk             : IN     std_logic ;
      MEMMUX_MEMSel   : OUT    std_logic ;
      LoadNZP         : OUT    std_logic ;
      DestValid_MEM   : OUT    std_logic ;
      D_MREAD_L       : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT ControlSplit_WB
   PORT (
      ControlWord_WB : IN     LC3b_ControlWord ;
      clk            : IN     std_logic ;
      WBMUXSel       : OUT    std_logic_vector (1 DOWNTO 0);
      DestValid_WB   : OUT    std_logic ;
      ByteSel_WB     : OUT    std_logic 
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
   COMPONENT GenCC
   PORT (
      INput    : IN     lc3b_word ;
      GenCCout : OUT    LC3b_cc 
   );
   END COMPONENT;
   COMPONENT HazardDet
   PORT (
      IR8_6_ID      : IN     LC3B_REG ;
      IR_2_0_ID     : IN     STD_LOGIC_VECTOR (2 DOWNTO 0);
      SRCA_EX       : IN     std_logic ;
      SRCB_EX       : IN     std_logic ;
      clk           : IN     std_logic ;
      DESTREG_EX    : IN     lc3b_reg ;
      Hazard        : OUT    std_logic ;
      Opcode_EX     : IN     lc3b_opcode ;
      Opcode_ID     : IN     LC3B_Opcode ;
      destreg_MEM   : IN     LC3B_REG ;
      dest          : IN     LC3B_REG ;
      DestValid_MEM : IN     std_logic ;
      DestValid_EX  : IN     std_logic ;
      DestValid_WB  : IN     std_logic ;
      SRCAValid     : IN     std_logic ;
      Dest_ID       : IN     LC3b_reg 
   );
   END COMPONENT;
   COMPONENT LoadGenerator
   PORT (
      D_MREAD_L   : IN     std_logic ;
      D_MRESP_H   : IN     std_logic ;
      D_MWRITEH_L : IN     std_logic ;
      D_MWRITEL_L : IN     std_logic ;
      I_MRESP_H   : IN     std_logic ;
      clk         : IN     std_logic ;
      load        : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT LoadPC
   PORT (
      Hazard : IN     std_logic ;
      clk    : IN     std_logic ;
      load   : IN     std_logic ;
      load1  : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT LowByte
   PORT (
      ADDRESSMUXOut_WB : IN     LC3b_word ;
      WBMuxout         : IN     LC3b_word ;
      clk              : IN     std_logic ;
      B                : OUT    LC3b_word 
   );
   END COMPONENT;
   COMPONENT MakeByte
   PORT (
      byteWordOut : OUT    lc3b_word ;
      clk         : IN     std_logic ;
      rfbout_ex   : IN     LC3b_word 
   );
   END COMPONENT;
   COMPONENT NZP
   PORT (
      GenCCout : IN     LC3b_cc ;
      LoadNZP  : IN     std_logic ;
      RESET_L  : IN     STD_LOGIC ;
      clk      : IN     std_logic ;
      n        : OUT    std_logic ;
      p        : OUT    std_logic ;
      z        : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT Plus2
   PORT (
      PCout      : IN     LC3b_word ;
      PCPlus2out : OUT    LC3b_word 
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
   COMPONENT StateReg_3
   PORT (
      ALUSHFMuxOut_MEM  : IN     lc3b_word ;
      D_DATAIN          : IN     lc3b_word ;
      PCPlus2_MEM       : IN     lc3b_word ;
      RESET_L           : IN     std_logic ;
      clk               : IN     std_logic ;
      destreg_MEM       : IN     LC3B_REG ;
      Opcode_MEM        : IN     lc3b_opcode ;
      ADDRESSMUXOut_WB  : OUT    LC3b_word ;
      ALUSHFMUXOut_WB   : OUT    lc3b_word ;
      dest              : OUT    LC3B_REG ;
      D_DATAIN_WB       : OUT    LC3b_word ;
      Opcode_WB         : OUT    LC3b_opcode ;
      PCPLus2_WB        : OUT    LC3b_word ;
      load              : IN     std_logic ;
      ADDRESSMUXOut_MEM : IN     lc3b_word ;
      RegWrite_MEM      : IN     std_logic ;
      regwrite_wb       : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT State_Reg
   PORT (
      PCPlus2_ID     : OUT    lc3b_word ;
      index6_ID      : OUT    LC3b_index6 ;
      offset9_ID     : OUT    LC3b_offset9 ;
      offset11_ID    : OUT    LC3b_offset11 ;
      RESET_L        : IN     std_logic ;
      IDATAIn        : IN     LC3b_word ;
      IR_Bit5        : OUT    std_logic ;
      IR_Bit11       : OUT    std_logic ;
      IR_2_0_ID      : OUT    STD_LOGIC_VECTOR (2 DOWNTO 0);
      IR8_6_ID       : OUT    LC3B_REG ;
      Opcode_ID      : OUT    LC3B_Opcode ;
      Dest_ID        : OUT    LC3b_reg ;
      IMM4_ID        : OUT    lc3b_imm4 ;
      INSCC_ID       : OUT    lc3b_nzp ;
      clk            : IN     std_logic ;
      imm5_ID        : OUT    LC3b_imm5 ;
      trapvect8_ID   : OUT    lc3b_trapvect8 ;
      IDATAAddress   : IN     LC3b_word ;
      load           : IN     std_logic ;
      AD_ID          : OUT    lc3b_SHFTOP ;
      IR_Bit4        : OUT    std_logic ;
      Hazard         : IN     std_logic ;
      BRANCHLOAD_MEM : IN     std_logic 
   );
   END COMPONENT;
   COMPONENT State_Reg1
   PORT (
      clk            : IN     std_logic ;
      ADJ11_ID       : IN     LC3b_word ;
      ADJ6_ID        : IN     lc3b_word ;
      ADJ9_ID        : IN     LC3b_word ;
      PCPlus2_ID     : IN     lc3b_word ;
      RFAout_ID      : IN     LC3b_word ;
      RFBout_ID      : IN     LC3b_word ;
      AD_EX          : OUT    lc3b_shftop ;
      RFAout_EX      : OUT    LC3b_word ;
      rfbout_ex      : OUT    LC3b_word ;
      imm5SEXT       : OUT    LC3b_word ;
      PCPlus2_EX     : OUT    lc3b_word ;
      RESET_L        : IN     std_logic ;
      Opcode_ID      : IN     LC3B_Opcode ;
      Opcode_EX      : OUT    lc3b_opcode ;
      ADJ6_EX        : OUT    LC3b_word ;
      ADJ11_EX       : OUT    LC3b_word ;
      ADJ9_EX        : OUT    LC3b_word ;
      ADJ5out        : IN     LC3b_word ;
      ADJ8out        : IN     lc3b_word ;
      ADJ8out_EX     : OUT    LC3b_word ;
      DESTREG_EX     : OUT    lc3b_reg ;
      Imm4_EX        : OUT    lc3b_imm4 ;
      IMM4_ID        : IN     lc3b_imm4 ;
      INSCC_ID       : IN     lc3b_nzp ;
      INSCC_EX       : OUT    lc3b_nzp ;
      load           : IN     std_logic ;
      AD_ID          : IN     lc3b_SHFTOP ;
      IR8_6_ID       : IN     LC3B_REG ;
      IR_2_0_ID      : IN     STD_LOGIC_VECTOR (2 DOWNTO 0);
      SRCA_EX        : OUT    std_logic ;
      SRCB_EX        : OUT    std_logic ;
      Dest_ID        : IN     LC3b_reg ;
      Hazard         : IN     std_logic ;
      EXaJMP         : IN     std_logic ;
      ADJ6ns_ID      : IN     lc3b_word ;
      ADJ6ns_EX      : OUT    lc3b_word ;
      BRANCHLOAD_MEM : IN     std_logic ;
      RegWrite_EX    : OUT    std_logic ;
      RegWrite_ID    : IN     std_logic 
   );
   END COMPONENT;
   COMPONENT State_Reg2
   PORT (
      clk               : IN     std_logic ;
      RESET_L           : IN     std_logic ;
      ADDRESSMUXout     : IN     LC3b_word ;
      Opcode_EX         : IN     lc3b_opcode ;
      ADDRESSMUXOut_MEM : OUT    lc3b_word ;
      Opcode_MEM        : OUT    lc3b_opcode ;
      DESTREG_EX        : IN     lc3b_reg ;
      destreg_MEM       : OUT    LC3B_REG ;
      ALUSHFMuxOut_MEM  : OUT    lc3b_word ;
      PCPlus2_EX        : IN     lc3b_word ;
      PCPlus2_MEM       : OUT    lc3b_word ;
      INSCC_EX          : IN     lc3b_nzp ;
      INSCC_MEM         : OUT    lc3b_nzp ;
      ArithOut          : IN     LC3B_WORD ;
      load              : IN     std_logic ;
      SRCA_EX           : IN     std_logic ;
      SRCB_EX           : IN     std_logic ;
      RegWrite_EX       : IN     std_logic ;
      RegWrite_MEM      : OUT    std_logic 
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
      Opcode_MEM   : IN     lc3b_opcode ;
      clk          : IN     std_logic ;
      D_MWRITEH_L  : OUT    std_logic ;
      D_MWRITEL_L  : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT index6ns
   PORT (
      clk       : IN     std_logic ;
      index6_ID : IN     LC3b_index6 ;
      ADJ6ns_ID : OUT    lc3b_word 
   );
   END COMPONENT;
   COMPONENT splitNZP
   PORT (
      INSCC_MEM : IN     lc3b_nzp ;
      clk       : IN     std_logic ;
      CheckN    : OUT    std_logic ;
      CheckZ    : OUT    std_logic ;
      CheckP    : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT AND2
   PORT (
      A : IN     STD_LOGIC ;
      B : IN     STD_LOGIC ;
      F : OUT    STD_LOGIC 
   );
   END COMPONENT;
   COMPONENT MUX2_16
   PORT (
      A   : IN     LC3B_WORD ;
      B   : IN     LC3B_WORD ;
      SEL : IN     STD_LOGIC ;
      F   : OUT    LC3B_WORD 
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
   COMPONENT NOT1
   PORT (
      A : IN     STD_LOGIC ;
      F : OUT    STD_LOGIC 
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
   FOR ALL : AND2 USE ENTITY mp3lib.AND2;
   FOR ALL : BR_add USE ENTITY ece411.BR_add;
   FOR ALL : BRlog USE ENTITY ece411.BRlog;
   FOR ALL : ControlReg USE ENTITY ece411.ControlReg;
   FOR ALL : ControlSplit_EX USE ENTITY ece411.ControlSplit_EX;
   FOR ALL : ControlSplit_ID USE ENTITY ece411.ControlSplit_ID;
   FOR ALL : ControlSplit_MEM USE ENTITY ece411.ControlSplit_MEM;
   FOR ALL : ControlSplit_WB USE ENTITY ece411.ControlSplit_WB;
   FOR ALL : ControlWordReg USE ENTITY ece411.ControlWordReg;
   FOR ALL : GenCC USE ENTITY ece411.GenCC;
   FOR ALL : HazardDet USE ENTITY ece411.HazardDet;
   FOR ALL : LoadGenerator USE ENTITY ece411.LoadGenerator;
   FOR ALL : LoadPC USE ENTITY ece411.LoadPC;
   FOR ALL : LowByte USE ENTITY ece411.LowByte;
   FOR ALL : MUX2_16 USE ENTITY mp3lib.MUX2_16;
   FOR ALL : MUX2_3 USE ENTITY mp3lib.MUX2_3;
   FOR ALL : MakeByte USE ENTITY ece411.MakeByte;
   FOR ALL : NOT1 USE ENTITY mp3lib.NOT1;
   FOR ALL : NZP USE ENTITY ece411.NZP;
   FOR ALL : Plus2 USE ENTITY ece411.Plus2;
   FOR ALL : REGFILE USE ENTITY mp3lib.REGFILE;
   FOR ALL : Reg16 USE ENTITY ece411.Reg16;
   FOR ALL : SHIFT16 USE ENTITY mp3lib.SHIFT16;
   FOR ALL : StateReg_3 USE ENTITY ece411.StateReg_3;
   FOR ALL : State_Reg USE ENTITY ece411.State_Reg;
   FOR ALL : State_Reg1 USE ENTITY ece411.State_Reg1;
   FOR ALL : State_Reg2 USE ENTITY ece411.State_Reg2;
   FOR ALL : WordMux2 USE ENTITY ece411.WordMux2;
   FOR ALL : WordMux4 USE ENTITY ece411.WordMux4;
   FOR ALL : WriteLogic USE ENTITY ece411.WriteLogic;
   FOR ALL : index6ns USE ENTITY ece411.index6ns;
   FOR ALL : splitNZP USE ENTITY ece411.splitNZP;
   -- pragma synthesis_on


BEGIN
   -- Architecture concurrent statements
   -- HDL Embedded Text Block 2 eb1
   -- eb1 2         
   I_MREAD_L <= '0';                               


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
   aBR_add : BR_add
      PORT MAP (
         ADDRESSMUX1Out => ADDRESSMUX1Out,
         ADDRESSMUX2Out => ADDRESSMUX2Out,
         BR_add_EX      => BR_add_EX,
         clk            => clk
      );
   U_20 : BRlog
      PORT MAP (
         Opcode_MEM     => Opcode_MEM,
         CheckN         => CheckN,
         CheckP         => CheckP,
         CheckZ         => CheckZ,
         clk            => clk,
         n              => n,
         p              => p,
         z              => z,
         BRANCHLOAD_MEM => BRANCHLOAD_MEM
      );
   aControlReg : ControlReg
      PORT MAP (
         RESET_L        => RESET_L,
         IR_Bit5        => IR_Bit5,
         IR_Bit11       => IR_Bit11,
         ControlWord_ID => ControlWord_ID,
         Opcode_ID      => Opcode_ID,
         clk            => clk,
         IR_Bit4        => IR_Bit4
      );
   EXControl : ControlSplit_EX
      PORT MAP (
         ControlWord_EX => ControlWord_EX,
         ADDRESSMUX1Sel => ADDRESSMUX1Sel,
         ADDRESSMUX2Sel => ADDRESSMUX2Sel,
         ADDRESSMUXSel  => ADDRESSMUXSel,
         SR2MuxSel      => SR2MuxSel,
         ALUop          => ALUop,
         ALUSHFSel      => ALUSHFSel,
         clk            => clk,
         ByteSel        => ByteSel,
         StoreMux       => StoreMux,
         DestValid_EX   => DestValid_EX,
         EXaJMP         => EXaJMP
      );
   U_21 : ControlSplit_ID
      PORT MAP (
         ControlWord_ID => ControlWord_ID,
         clk            => clk,
         SRCAValid      => SRCAValid,
         SRCMuxSel      => SRCMuxSel,
         RegWrite_ID    => RegWrite_ID
      );
   MEMControl : ControlSplit_MEM
      PORT MAP (
         ControlWord_MEM => ControlWord_MEM,
         clk             => clk,
         MEMMUX_MEMSel   => MEMMUX_MEMSel,
         LoadNZP         => LoadNZP,
         DestValid_MEM   => DestValid_MEM,
         D_MREAD_L       => D_MREAD_L_internal
      );
   U_5 : ControlSplit_WB
      PORT MAP (
         ControlWord_WB => ControlWord_WB,
         clk            => clk,
         WBMUXSel       => WBMUXSel,
         DestValid_WB   => DestValid_WB,
         ByteSel_WB     => ByteSel_WB
      );
   U_10 : ControlWordReg
      PORT MAP (
         Input  => ControlWord_ID,
         RESET  => RESET_L,
         clk    => clk,
         load   => LoadControl,
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
   U_9 : GenCC
      PORT MAP (
         INput    => ALUSHFMuxOut_MEM,
         GenCCout => GenCCout
      );
   aHazardDet : HazardDet
      PORT MAP (
         IR8_6_ID      => IR8_6_ID,
         IR_2_0_ID     => IR_2_0_ID,
         SRCA_EX       => SRCA_EX,
         SRCB_EX       => SRCB_EX,
         clk           => clk,
         DESTREG_EX    => DESTREG_EX,
         Hazard        => Hazard,
         Opcode_EX     => Opcode_EX,
         Opcode_ID     => Opcode_ID,
         destreg_MEM   => destreg_MEM,
         dest          => dest,
         DestValid_MEM => DestValid_MEM,
         DestValid_EX  => DestValid_EX,
         DestValid_WB  => DestValid_WB,
         SRCAValid     => SRCAValid,
         Dest_ID       => Dest_ID
      );
   U_22 : LoadGenerator
      PORT MAP (
         D_MREAD_L   => D_MREAD_L_internal,
         D_MRESP_H   => D_MRESP_H,
         D_MWRITEH_L => D_MWRITEH_L_internal,
         D_MWRITEL_L => D_MWRITEL_L_internal,
         I_MRESP_H   => I_MRESP_H,
         clk         => clk,
         load        => load
      );
   theLoadPC : LoadPC
      PORT MAP (
         Hazard => Hazard,
         clk    => clk,
         load   => load,
         load1  => load1
      );
   theLowByte : LowByte
      PORT MAP (
         ADDRESSMUXOut_WB => ADDRESSMUXOut_WB,
         WBMuxout         => WBMuxout,
         clk              => clk,
         B                => B
      );
   aMakeByte : MakeByte
      PORT MAP (
         byteWordOut => byteWordOut,
         clk         => clk,
         rfbout_ex   => rfbout_ex
      );
   U_15 : NZP
      PORT MAP (
         GenCCout => GenCCout,
         LoadNZP  => LoadNZP,
         RESET_L  => RESET_L,
         clk      => clk,
         n        => n,
         p        => p,
         z        => z
      );
   U_4 : Plus2
      PORT MAP (
         PCout      => IDATAAddress_internal,
         PCPlus2out => PCPlus2out_IF
      );
   PC : Reg16
      PORT MAP (
         Input  => PCMuxOut,
         RESET  => RESET_L,
         clk    => clk,
         load   => load1,
         Output => IDATAAddress_internal
      );
   theMEM_reg : StateReg_3
      PORT MAP (
         ALUSHFMuxOut_MEM  => ALUSHFMuxOut_MEM,
         D_DATAIN          => D_DATAIN,
         PCPlus2_MEM       => PCPlus2_MEM,
         RESET_L           => RESET_L,
         clk               => clk,
         destreg_MEM       => destreg_MEM,
         Opcode_MEM        => Opcode_MEM,
         ADDRESSMUXOut_WB  => ADDRESSMUXOut_WB,
         ALUSHFMUXOut_WB   => ALUSHFMUXOut_WB,
         dest              => dest,
         D_DATAIN_WB       => D_DATAIN_WB,
         Opcode_WB         => Opcode_WB,
         PCPLus2_WB        => PCPLus2_WB,
         load              => load,
         ADDRESSMUXOut_MEM => ADDRESSMUXOut_MEM,
         RegWrite_MEM      => RegWrite_MEM,
         regwrite_wb       => regwrite_wb
      );
   theIF_Reg : State_Reg
      PORT MAP (
         PCPlus2_ID     => PCPlus2_ID,
         index6_ID      => index6_ID,
         offset9_ID     => offset9_ID,
         offset11_ID    => offset11_ID,
         RESET_L        => RESET_L,
         IDATAIn        => IDATAIn,
         IR_Bit5        => IR_Bit5,
         IR_Bit11       => IR_Bit11,
         IR_2_0_ID      => IR_2_0_ID,
         IR8_6_ID       => IR8_6_ID,
         Opcode_ID      => Opcode_ID,
         Dest_ID        => Dest_ID,
         IMM4_ID        => IMM4_ID,
         INSCC_ID       => INSCC_ID,
         clk            => clk,
         imm5_ID        => imm5_ID,
         trapvect8_ID   => trapvect8_ID,
         IDATAAddress   => IDATAAddress_internal,
         load           => load,
         AD_ID          => AD_ID,
         IR_Bit4        => IR_Bit4,
         Hazard         => Hazard,
         BRANCHLOAD_MEM => BRANCHLOAD_MEM
      );
   theID_Reg : State_Reg1
      PORT MAP (
         clk            => clk,
         ADJ11_ID       => ADJ11_ID,
         ADJ6_ID        => ADJ6_ID,
         ADJ9_ID        => ADJ9_ID,
         PCPlus2_ID     => PCPlus2_ID,
         RFAout_ID      => RFAout_ID,
         RFBout_ID      => RFBout_ID,
         AD_EX          => AD_EX,
         RFAout_EX      => RFAout_EX,
         rfbout_ex      => rfbout_ex,
         imm5SEXT       => imm5SEXT,
         PCPlus2_EX     => PCPlus2_EX,
         RESET_L        => RESET_L,
         Opcode_ID      => Opcode_ID,
         Opcode_EX      => Opcode_EX,
         ADJ6_EX        => ADJ6_EX,
         ADJ11_EX       => ADJ11_EX,
         ADJ9_EX        => ADJ9_EX,
         ADJ5out        => ADJ5out,
         ADJ8out        => ADJ8out,
         ADJ8out_EX     => ADJ8out_EX,
         DESTREG_EX     => DESTREG_EX,
         Imm4_EX        => Imm4_EX,
         IMM4_ID        => IMM4_ID,
         INSCC_ID       => INSCC_ID,
         INSCC_EX       => INSCC_EX,
         load           => load,
         AD_ID          => AD_ID,
         IR8_6_ID       => IR8_6_ID,
         IR_2_0_ID      => IR_2_0_ID,
         SRCA_EX        => SRCA_EX,
         SRCB_EX        => SRCB_EX,
         Dest_ID        => Dest_ID,
         Hazard         => Hazard,
         EXaJMP         => EXaJMP,
         ADJ6ns_ID      => ADJ6ns_ID,
         ADJ6ns_EX      => ADJ6ns_EX,
         BRANCHLOAD_MEM => BRANCHLOAD_MEM,
         RegWrite_EX    => RegWrite_EX,
         RegWrite_ID    => RegWrite_ID
      );
   theEX_Reg : State_Reg2
      PORT MAP (
         clk               => clk,
         RESET_L           => RESET_L,
         ADDRESSMUXout     => ADDRESSMUXout,
         Opcode_EX         => Opcode_EX,
         ADDRESSMUXOut_MEM => ADDRESSMUXOut_MEM,
         Opcode_MEM        => Opcode_MEM,
         DESTREG_EX        => DESTREG_EX,
         destreg_MEM       => destreg_MEM,
         ALUSHFMuxOut_MEM  => ALUSHFMuxOut_MEM,
         PCPlus2_EX        => PCPlus2_EX,
         PCPlus2_MEM       => PCPlus2_MEM,
         INSCC_EX          => INSCC_EX,
         INSCC_MEM         => INSCC_MEM,
         ArithOut          => ArithOut,
         load              => load,
         SRCA_EX           => SRCA_EX,
         SRCB_EX           => SRCB_EX,
         RegWrite_EX       => RegWrite_EX,
         RegWrite_MEM      => RegWrite_MEM
      );
   ADDRESSMUX : WordMux2
      PORT MAP (
         A   => BR_add_EX,
         B   => ADJ8out_EX,
         Sel => ADDRESSMUXSel,
         F   => ADDRESSMUXout
      );
   BRANCHLOAD : WordMux2
      PORT MAP (
         A   => ChoosePC,
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
   PCChoose : WordMux2
      PORT MAP (
         A   => PCPlus2out_IF,
         B   => RFAout_EX,
         Sel => EXaJMP,
         F   => ChoosePC
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
         A   => rfbout_ex,
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
   aByteBack : WordMux2
      PORT MAP (
         A   => WBMuxout,
         B   => B,
         Sel => ByteSel_WB,
         F   => RegFileIn
      );
   aByteSel : WordMux2
      PORT MAP (
         A   => ALUSHFMuxOut,
         B   => byteWordOut,
         Sel => ByteSel,
         F   => bytemuxout
      );
   ADDRESSMUX2 : WordMux4
      PORT MAP (
         A   => ADJ6_EX,
         B   => ADJ11_EX,
         C   => ADJ9_EX,
         D   => ADJ6ns_EX,
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
         F   => WBMuxout
      );
   aWriteLogic : WriteLogic
      PORT MAP (
         D_ADDRESSOut => D_ADDRESSOut_internal,
         Opcode_MEM   => Opcode_MEM,
         clk          => clk,
         D_MWRITEH_L  => D_MWRITEH_L_internal,
         D_MWRITEL_L  => D_MWRITEL_L_internal
      );
   U_6 : index6ns
      PORT MAP (
         clk       => clk,
         index6_ID => index6_ID,
         ADJ6ns_ID => ADJ6ns_ID
      );
   U_19 : splitNZP
      PORT MAP (
         INSCC_MEM => INSCC_MEM,
         clk       => clk,
         CheckN    => CheckN,
         CheckZ    => CheckZ,
         CheckP    => CheckP
      );
   U_16 : AND2
      PORT MAP (
         A => F,
         B => load,
         F => LoadControl
      );
   ArithMux : MUX2_16
      PORT MAP (
         A   => bytemuxout,
         B   => rfbout_ex,
         SEL => StoreMux,
         F   => ArithOut
      );
   SRCAMUX : MUX2_3
      PORT MAP (
         A   => IR_2_0_ID,
         B   => Dest_ID,
         SEL => SRCMuxSel,
         F   => SRCAMUXOut
      );
   U_8 : NOT1
      PORT MAP (
         A => Hazard,
         F => F
      );
   theRegFile : REGFILE
      PORT MAP (
         CLK      => clk,
         DEST     => dest,
         DIN      => RegFileIn,
         RESET_L  => RESET_L,
         REGWRITE => regwrite_wb,
         SRCA     => IR8_6_ID,
         SRCB     => SRCAMUXOut,
         A        => RFAout_ID,
         B        => RFBout_ID
      );
   theShifter : SHIFT16
      PORT MAP (
         A       => RFAout_EX,
         SHFTAMT => Imm4_EX,
         SHFTOP  => AD_EX,
         F       => SHFUnitOut
      );

   -- Implicit buffered output assignments
   IDATAAddress <= IDATAAddress_internal;
   D_ADDRESSOut <= D_ADDRESSOut_internal;
   D_MWRITEH_L  <= D_MWRITEH_L_internal;
   D_MWRITEL_L  <= D_MWRITEL_L_internal;
   D_MREAD_L    <= D_MREAD_L_internal;

END struct;
