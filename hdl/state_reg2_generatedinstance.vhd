-- VHDL Entity ece411.State_Reg2.generatedInstance
--
-- Created:
--          by - jpatel71.stdt (eelnx34.ews.illinois.edu)
--          at - 12:13:27 10/21/10
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.NUMERIC_STD.all;
USE ieee.std_logic_1164.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY State_Reg2 IS
   PORT( 
      ADDRESS       : OUT    LC3b_word;
      sig2          : OUT    lc3b_word;
      EX_DATAOUT    : OUT    lc3b_word;
      AlUSHFMuxOut  : IN     LC3b_word;
      ADDRESSMUXOut : IN     LC3b_word;
      IR11_9        : OUT    LC3b_nzp
   );

END State_Reg2 ;

-- 
-- Auto generated dummy architecture for leaf level instance.
-- 
ARCHITECTURE generatedInstance OF State_Reg2 IS 
BEGIN


END generatedInstance;
