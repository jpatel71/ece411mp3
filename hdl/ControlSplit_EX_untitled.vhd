--
-- VHDL Architecture ece411.ControlSplit.untitled
--
-- Created:
--          by - bjohns38.stdt (gllnx19.ews.illinois.edu)
--          at - 19:13:59 10/21/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.NUMERIC_STD.all;
USE ieee.std_logic_1164.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY ControlSplit_EX IS
   PORT( 
      ControlWord_EX : IN     LC3b_ControlWord;
      ADDRESSMUX1Sel : OUT    std_logic;
      ADDRESSMUX2Sel : OUT    lc3b_4mux_sel;
      ADDRESSMUXSel  : OUT    std_logic;
      SR2MuxSel      : OUT    std_logic;
      ALUop          : OUT    lc3b_aluop;
      ALUSHFSel      : OUT    std_logic;
      clk            : IN     std_logic;
      StoreMux      :   out std_logic
   );

-- Declarations

END ControlSplit_EX ;

--
ARCHITECTURE untitled OF ControlSplit_EX IS
BEGIN
   --   14        13          12            11-10              9            8      7-5    4        3                2        1-0      
   --  LoadNZP-1RegWrite-ADDRESSMUX1Sel-2ADDRESSMUX2Sel-ADDRESSMUXSel-SR2MuxSel-ALUop-ALUSHFSel-MEMMUX_MEMSel-DRMUXSEL-2WBMUXSEL
  ADDRESSMUX1Sel <= ControlWord_EX(12);
  ADDRESSMUX2Sel <= ControlWord_EX(11 downto 10);
  ADDRESSMUXSel <= ControlWord_EX(9);
  SR2MuxSel <= ControlWord_EX(8);
  ALUop <= ControlWord_EX(7 downto 5);
  ALUSHFSel <= ControlWord_EX(4);
  storemux <= ControlWord_EX(16);
END ARCHITECTURE untitled;

