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
      ADDRESSMUX1Sel  :  OUT  std_logic;
      ADDRESSMUX2Sel  : OUT  std_logic;
      ADDRESSMUXSel  : OUT  std_logic;
      SR2MuxSel  : OUT  std_logic;
      ALUop   :  OUT  lc3b_aluop;
      ALUSHFSel  : OUT  std_logic
   );

-- Declarations

END ControlSplit_EX ;

--
ARCHITECTURE untitled OF ControlSplit_EX IS
BEGIN
END ARCHITECTURE untitled;

