-- VHDL Entity ece411.Datapath.interface
--
-- Created:
--          by - tmurray5.stdt (eelnx37.ews.illinois.edu)
--          at - 15:42:49 10/14/10
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY Datapath IS
   PORT( 
      ALUMuxSel   : IN     LC3b_4MUX_Sel;
      ALUop       : IN     LC3b_aluop;
      AdderMuxSel : IN     std_logic;
      ByteSel     : IN     std_logic;
      DATAIN      : IN     LC3b_word;
      DestMuxSel  : IN     std_logic;
      LoadIR      : IN     std_logic;
      LoadMAR     : IN     std_logic;
      LoadMDR     : IN     std_logic;
      LoadNZP     : IN     std_logic;
      LoadPC      : IN     std_logic;
      MARMuxSel   : IN     lc3b_4mux_sel;
      MDRMuxSel   : IN     std_logic;
      PCMuxSel    : IN     LC3B_4MUX_SEL;
      RESET_L     : IN     std_logic;
      RFMuxSel    : IN     LC3B_4MUX_SEL;
      RegWrite    : IN     std_logic;
      StoreSR     : IN     std_logic;
      clk         : IN     std_logic;
      ADDRESS     : OUT    LC3b_word;
      ADDRESS0    : OUT    std_logic;
      CheckN      : OUT    std_logic;
      CheckP      : OUT    std_logic;
      CheckZ      : OUT    std_logic;
      D           : OUT    std_logic;
      DATAOUT     : OUT    LC3b_word;
      Opcode      : OUT    LC3B_Opcode;
      bit11       : OUT    std_logic;
      bit5        : OUT    std_logic;
      n           : OUT    std_logic;
      p           : OUT    std_logic;
      z           : OUT    std_logic
   );

-- Declarations

END Datapath ;

--
-- VHDL Architecture ece411.Datapath.struct
--
-- Created:
--          by - tmurray5.stdt (eelnx37.ews.illinois.edu)
--          at - 15:42:50 10/14/10
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

LIBRARY ece411;

ARCHITECTURE struct OF Datapath IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL ADDRESSin      : lc3b_word;
   SIGNAL ADJ11out       : LC3b_word;
   SIGNAL ADJ4out        : LC3b_word;
   SIGNAL ADJ5out        : LC3b_word;
   SIGNAL ADJ6out        : LC3b_word;
   SIGNAL ADJ8out        : lc3b_word;
   SIGNAL ADJ9out        : LC3b_word;
   SIGNAL ALUMuxout      : LC3b_word;
   SIGNAL ALUout         : LC3b_word;
   SIGNAL AdderMuxout    : LC3b_word;
   SIGNAL Adderout       : LC3b_word;
   SIGNAL ByteMaskout    : lc3b_word;
   SIGNAL DestMuxout     : LC3b_reg;
   SIGNAL GenCCout       : LC3b_cc;
   SIGNAL MARMuxout      : LC3b_word;
   SIGNAL MDRMuxout      : LC3b_word;
   SIGNAL MDRout         : LC3b_word;
   SIGNAL PCMuxout       : LC3b_word;
   SIGNAL PCPlus2out     : LC3b_word;
   SIGNAL PCout          : LC3b_word;
   SIGNAL RFAout         : LC3b_word;
   SIGNAL RFBout         : LC3b_word;
   SIGNAL RFMuxout       : lc3b_word;
   SIGNAL SrcA           : LC3b_reg;
   SIGNAL SrcB           : LC3b_reg;
   SIGNAL StoreMuxout    : LC3b_reg;
   SIGNAL byteWordOut    : LC3b_word;
   SIGNAL dest           : LC3b_reg;
   SIGNAL highByteSelOut : LC3b_word;
   SIGNAL imm4           : LC3b_imm4;
   SIGNAL imm5           : LC3b_imm5;
   SIGNAL index6         : LC3b_index6;
   SIGNAL input          : lc3b_word;
   SIGNAL offset11       : LC3b_offset11;
   SIGNAL offset9        : LC3b_offset9;
   SIGNAL trapvect8      : lc3b_trapvect8;

   -- Implicit buffer signal declarations
   SIGNAL ADDRESS0_internal : std_logic;


   -- Component Declarations
   COMPONENT ADJ11
   PORT (
      clk      : IN     std_logic ;
      offset11 : IN     LC3b_offset11 ;
      ADJ11out : OUT    LC3b_word 
   );
   END COMPONENT;
   COMPONENT ADJ4
   PORT (
      clk     : IN     std_logic ;
      imm4    : IN     LC3b_imm4 ;
      ADJ4out : OUT    LC3b_word 
   );
   END COMPONENT;
   COMPONENT ADJ5
   PORT (
      clk     : IN     std_logic ;
      imm5    : IN     LC3b_imm5 ;
      ADJ5out : OUT    LC3b_word 
   );
   END COMPONENT;
   COMPONENT ADJ6
   PORT (
      clk    : IN     std_logic ;
      index6 : IN     LC3b_index6 ;
      input  : OUT    lc3b_word 
   );
   END COMPONENT;
   COMPONENT ADJ8
   PORT (
      clk       : IN     std_logic ;
      trapvect8 : IN     lc3b_trapvect8 ;
      ADJ8out   : OUT    lc3b_word 
   );
   END COMPONENT;
   COMPONENT ADJ9
   PORT (
      clk     : IN     std_logic ;
      offset9 : IN     LC3b_offset9 ;
      ADJ9out : OUT    LC3b_word 
   );
   END COMPONENT;
   COMPONENT ALU
   PORT (
      ALUMuxout : IN     LC3b_word ;
      ALUop     : IN     LC3b_aluop ;
      RFAout    : IN     LC3b_word ;
      clk       : IN     std_logic ;
      ALUout    : OUT    LC3b_word 
   );
   END COMPONENT;
   COMPONENT Adder
   PORT (
      clk         : IN     std_logic ;
      PCout       : IN     LC3b_word ;
      AdderMuxout : IN     LC3b_word ;
      Adderout    : OUT    LC3b_word 
   );
   END COMPONENT;
   COMPONENT ByteMask
   PORT (
      clk         : IN     std_logic ;
      RFMuxout    : IN     lc3b_word ;
      ByteMaskout : OUT    lc3b_word ;
      ADDRESS0    : IN     std_logic ;
      ByteSel     : IN     std_logic 
   );
   END COMPONENT;
   COMPONENT DestMux2
   PORT (
      dest       : IN     LC3b_reg ;
      clk        : IN     std_logic ;
      DestMuxSel : IN     std_logic ;
      DestMuxout : OUT    LC3b_reg 
   );
   END COMPONENT;
   COMPONENT GenCC
   PORT (
      ByteMaskout : IN     lc3b_word ;
      clk         : IN     std_logic ;
      GenCCout    : OUT    LC3b_cc 
   );
   END COMPONENT;
   COMPONENT IR
   PORT (
      LoadIR    : IN     std_logic ;
      MDRout    : IN     LC3b_word ;
      clk       : IN     std_logic ;
      SrcA      : OUT    LC3b_reg ;
      SrcB      : OUT    LC3b_reg ;
      imm4      : OUT    LC3b_imm4 ;
      imm5      : OUT    LC3b_imm5 ;
      index6    : OUT    LC3b_index6 ;
      bit11     : OUT    std_logic ;
      bit5      : OUT    std_logic ;
      offset9   : OUT    LC3b_offset9 ;
      offset11  : OUT    LC3b_offset11 ;
      dest      : OUT    LC3b_reg ;
      Opcode    : OUT    LC3B_Opcode ;
      D         : OUT    std_logic ;
      trapvect8 : OUT    lc3b_trapvect8 
   );
   END COMPONENT;
   COMPONENT LowBit
   PORT (
      ADDRESSin : IN     lc3b_word ;
      clk       : IN     std_logic ;
      ADDRESS   : OUT    LC3b_word ;
      ADDRESS0  : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT NZP
   PORT (
      GenCCout : IN     LC3b_cc ;
      LoadNZP  : IN     std_logic ;
      clk      : IN     std_logic ;
      n        : OUT    std_logic ;
      p        : OUT    std_logic ;
      z        : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT NZPsplit
   PORT (
      clk    : IN     std_logic ;
      dest   : IN     LC3b_reg ;
      CheckN : OUT    std_logic ;
      CheckP : OUT    std_logic ;
      CheckZ : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT Plus2
   PORT (
      PCout      : IN     LC3b_word ;
      clk        : IN     std_logic ;
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
   COMPONENT RegFile
   PORT (
      RESET_L     : IN     std_logic ;
      RegWrite    : IN     std_logic ;
      SrcB        : IN     LC3b_reg ;
      StoreMuxout : IN     LC3b_reg ;
      clk         : IN     std_logic ;
      RFAout      : OUT    LC3b_word ;
      RFBout      : OUT    LC3b_word ;
      DestMuxout  : IN     LC3b_reg ;
      ByteMaskout : IN     lc3b_word 
   );
   END COMPONENT;
   COMPONENT RightShiftMux
   PORT (
      clk     : IN     std_logic ;
      input   : IN     lc3b_word ;
      ADJ6out : OUT    LC3b_word ;
      ByteSel : IN     std_logic 
   );
   END COMPONENT;
   COMPONENT StoreMux
   PORT (
      SrcA        : IN     LC3b_reg ;
      StoreSR     : IN     std_logic ;
      clk         : IN     std_logic ;
      dest        : IN     LC3b_reg ;
      StoreMuxout : OUT    LC3b_reg 
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
   COMPONENT byteReplicate
   PORT (
      ALUout      : IN     LC3b_word ;
      clk         : IN     std_logic ;
      byteWordOut : OUT    LC3b_word 
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : ADJ11 USE ENTITY ece411.ADJ11;
   FOR ALL : ADJ4 USE ENTITY ece411.ADJ4;
   FOR ALL : ADJ5 USE ENTITY ece411.ADJ5;
   FOR ALL : ADJ6 USE ENTITY ece411.ADJ6;
   FOR ALL : ADJ8 USE ENTITY ece411.ADJ8;
   FOR ALL : ADJ9 USE ENTITY ece411.ADJ9;
   FOR ALL : ALU USE ENTITY ece411.ALU;
   FOR ALL : Adder USE ENTITY ece411.Adder;
   FOR ALL : ByteMask USE ENTITY ece411.ByteMask;
   FOR ALL : DestMux2 USE ENTITY ece411.DestMux2;
   FOR ALL : GenCC USE ENTITY ece411.GenCC;
   FOR ALL : IR USE ENTITY ece411.IR;
   FOR ALL : LowBit USE ENTITY ece411.LowBit;
   FOR ALL : NZP USE ENTITY ece411.NZP;
   FOR ALL : NZPsplit USE ENTITY ece411.NZPsplit;
   FOR ALL : Plus2 USE ENTITY ece411.Plus2;
   FOR ALL : Reg16 USE ENTITY ece411.Reg16;
   FOR ALL : RegFile USE ENTITY ece411.RegFile;
   FOR ALL : RightShiftMux USE ENTITY ece411.RightShiftMux;
   FOR ALL : StoreMux USE ENTITY ece411.StoreMux;
   FOR ALL : WordMux2 USE ENTITY ece411.WordMux2;
   FOR ALL : WordMux4 USE ENTITY ece411.WordMux4;
   FOR ALL : byteReplicate USE ENTITY ece411.byteReplicate;
   -- pragma synthesis_on


BEGIN
   -- Architecture concurrent statements
   -- HDL Embedded Text Block 1 eb1
   -- Dataout = MDRout
   DATAOUT <= MDRout;                                      


   -- Instance port mappings.
   aADJ11 : ADJ11
      PORT MAP (
         clk      => clk,
         offset11 => offset11,
         ADJ11out => ADJ11out
      );
   aADJ4 : ADJ4
      PORT MAP (
         clk     => clk,
         imm4    => imm4,
         ADJ4out => ADJ4out
      );
   aADJ5 : ADJ5
      PORT MAP (
         clk     => clk,
         imm5    => imm5,
         ADJ5out => ADJ5out
      );
   aADJ6 : ADJ6
      PORT MAP (
         clk    => clk,
         index6 => index6,
         input  => input
      );
   aADJ8 : ADJ8
      PORT MAP (
         clk       => clk,
         trapvect8 => trapvect8,
         ADJ8out   => ADJ8out
      );
   aADJ9 : ADJ9
      PORT MAP (
         clk     => clk,
         offset9 => offset9,
         ADJ9out => ADJ9out
      );
   aALU : ALU
      PORT MAP (
         ALUMuxout => ALUMuxout,
         ALUop     => ALUop,
         RFAout    => RFAout,
         clk       => clk,
         ALUout    => ALUout
      );
   aAdder : Adder
      PORT MAP (
         clk         => clk,
         PCout       => PCout,
         AdderMuxout => AdderMuxout,
         Adderout    => Adderout
      );
   aByteMask : ByteMask
      PORT MAP (
         clk         => clk,
         RFMuxout    => RFMuxout,
         ByteMaskout => ByteMaskout,
         ADDRESS0    => ADDRESS0_internal,
         ByteSel     => ByteSel
      );
   aDestMux2 : DestMux2
      PORT MAP (
         dest       => dest,
         clk        => clk,
         DestMuxSel => DestMuxSel,
         DestMuxout => DestMuxout
      );
   aGenCC : GenCC
      PORT MAP (
         ByteMaskout => ByteMaskout,
         clk         => clk,
         GenCCout    => GenCCout
      );
   aIR : IR
      PORT MAP (
         LoadIR    => LoadIR,
         MDRout    => MDRout,
         clk       => clk,
         SrcA      => SrcA,
         SrcB      => SrcB,
         imm4      => imm4,
         imm5      => imm5,
         index6    => index6,
         bit11     => bit11,
         bit5      => bit5,
         offset9   => offset9,
         offset11  => offset11,
         dest      => dest,
         Opcode    => Opcode,
         D         => D,
         trapvect8 => trapvect8
      );
   aLowBit : LowBit
      PORT MAP (
         ADDRESSin => ADDRESSin,
         clk       => clk,
         ADDRESS   => ADDRESS,
         ADDRESS0  => ADDRESS0_internal
      );
   aNZP : NZP
      PORT MAP (
         GenCCout => GenCCout,
         LoadNZP  => LoadNZP,
         clk      => clk,
         n        => n,
         p        => p,
         z        => z
      );
   aNZPsplit : NZPsplit
      PORT MAP (
         clk    => clk,
         dest   => dest,
         CheckN => CheckN,
         CheckP => CheckP,
         CheckZ => CheckZ
      );
   aPlus2 : Plus2
      PORT MAP (
         PCout      => PCout,
         clk        => clk,
         PCPlus2out => PCPlus2out
      );
   MAR : Reg16
      PORT MAP (
         Input  => MARMuxout,
         RESET  => RESET_L,
         clk    => clk,
         load   => LoadMAR,
         Output => ADDRESSin
      );
   MDR : Reg16
      PORT MAP (
         Input  => MDRMuxout,
         RESET  => RESET_L,
         clk    => clk,
         load   => LoadMDR,
         Output => MDRout
      );
   PC : Reg16
      PORT MAP (
         Input  => PCMuxout,
         RESET  => RESET_L,
         clk    => clk,
         load   => LoadPC,
         Output => PCout
      );
   aRegFile : RegFile
      PORT MAP (
         RESET_L     => RESET_L,
         RegWrite    => RegWrite,
         SrcB        => SrcB,
         StoreMuxout => StoreMuxout,
         clk         => clk,
         RFAout      => RFAout,
         RFBout      => RFBout,
         DestMuxout  => DestMuxout,
         ByteMaskout => ByteMaskout
      );
   aRightShiftMux : RightShiftMux
      PORT MAP (
         clk     => clk,
         input   => input,
         ADJ6out => ADJ6out,
         ByteSel => ByteSel
      );
   aStoreMux : StoreMux
      PORT MAP (
         SrcA        => SrcA,
         StoreSR     => StoreSR,
         clk         => clk,
         dest        => dest,
         StoreMuxout => StoreMuxout
      );
   AdderMux : WordMux2
      PORT MAP (
         A   => ADJ9out,
         B   => ADJ11out,
         Sel => AdderMuxSel,
         F   => AdderMuxout
      );
   MDRMux : WordMux2
      PORT MAP (
         A   => DATAIN,
         B   => highByteSelOut,
         Sel => MDRMuxSel,
         F   => MDRMuxout
      );
   highByteSel : WordMux2
      PORT MAP (
         A   => ALUout,
         B   => byteWordOut,
         Sel => ByteSel,
         F   => highByteSelOut
      );
   ALUMux : WordMux4
      PORT MAP (
         A   => RFBout,
         B   => ADJ4out,
         C   => ADJ5out,
         D   => ADJ6out,
         Sel => ALUMuxSel,
         F   => ALUMuxout
      );
   MARMux : WordMux4
      PORT MAP (
         A   => PCout,
         B   => ADJ8out,
         C   => MDRout,
         D   => ALUout,
         Sel => MARMuxSel,
         F   => MARMuxout
      );
   PCMux : WordMux4
      PORT MAP (
         A   => PCPlus2out,
         B   => Adderout,
         C   => MDRout,
         D   => ALUout,
         Sel => PCMuxSel,
         F   => PCMuxout
      );
   RFMux : WordMux4
      PORT MAP (
         A   => MDRout,
         B   => ALUout,
         C   => PCout,
         D   => Adderout,
         Sel => RFMuxSel,
         F   => RFMuxout
      );
   U_1 : byteReplicate
      PORT MAP (
         ALUout      => ALUout,
         clk         => clk,
         byteWordOut => byteWordOut
      );

   -- Implicit buffered output assignments
   ADDRESS0 <= ADDRESS0_internal;

END struct;
