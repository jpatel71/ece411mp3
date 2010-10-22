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

ENTITY ControlSplit_MEM IS
   PORT( 
      ControlWord_MEM : IN     LC3b_ControlWord;
      MEMMUX_MEMSel  :  OUT    std_logic;
      MEMMUX_MEM1Sel :  OUT    std_logic
   );

-- Declarations

END ControlSplit_MEM ;

--
ARCHITECTURE untitled OF ControlSplit_MEM IS
BEGIN
  MEMMUX_MEMSel <= ControlWord_MEM(7);
  MEMMUX_MEM1Sel <= ControlWord_MEM(8);
END ARCHITECTURE untitled;

