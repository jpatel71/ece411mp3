-- VHDL Entity ece411.LoadSTILDI.generatedInstance
--
-- Created:
--          by - bjohns38.stdt (gllnx4.ews.illinois.edu)
--          at - 20:53:33 11/11/10
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.NUMERIC_STD.all;
USE ieee.std_logic_1164.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY LoadSTILDI IS
   PORT( 
      load2      : IN     std_logic;
      load       : OUT    std_logic;
      opcode_MEM : IN     lc3b_opcode;
      D_MRESP_H  : IN     std_logic;
      clk        : IN     std_logic
   );

END LoadSTILDI ;

-- 
-- Auto generated dummy architecture for leaf level instance.
-- 
ARCHITECTURE generatedInstance OF LoadSTILDI IS 
BEGIN


END generatedInstance;