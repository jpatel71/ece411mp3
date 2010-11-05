-- VHDL Entity ece411.ControlSplit_EX1.generatedInstance
--
-- Created:
--          by - tmurray5.stdt (eelnx23.ews.illinois.edu)
--          at - 16:25:58 11/04/10
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.NUMERIC_STD.all;
USE ieee.std_logic_1164.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY ControlSplit_EX1 IS
   PORT( 
      ADDRESSMUX1Sel : OUT    std_logic;
      ADDRESSMUX2Sel : OUT    lc3b_4mux_sel;
      ADDRESSMUXSel  : OUT    std_logic;
      ALUop          : OUT    lc3b_aluop;
      ALUSHFSel      : OUT    std_logic;
      SR2MuxSel      : OUT    std_logic;
      ControlWord_EX : IN     LC3b_ControlWord;
      storemux       : OUT    std_logic;
      clk            : IN     std_logic
   );

END ControlSplit_EX1 ;

-- 
-- Auto generated dummy architecture for leaf level instance.
-- 
ARCHITECTURE generatedInstance OF ControlSplit_EX1 IS 
BEGIN


END generatedInstance;
