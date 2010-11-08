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
      clk             : IN     std_logic;
      MEMMUX_MEMSel   : OUT    std_logic;
      LoadNZP         : OUT    std_logic;
      DestValid_MEM    :  OUT  std_logic;
      D_MREAD_L       : OUT    std_logic
   );

-- Declarations

END ControlSplit_MEM ;

--
ARCHITECTURE untitled OF ControlSplit_MEM IS
BEGIN
 --  1RegWrite-ADDRESSMUX1Sel-2ADDRESSMUX2Sel-ADDRESSMUXSel-SR2MuxSel-ALUop-ALUSHFSel-MEMMUX_MEMSel-DRMUXSEL-2WBMUXSEL
  
  MEMMUX_MEMSel <= ControlWord_MEM(3);
  LoadNZP <= ControlWord_MEM(13);
  D_MREAD_L <= ControlWord_MEM(18);
  DestValid_MEM <= ControlWord_MEM(19);
END ARCHITECTURE untitled;

