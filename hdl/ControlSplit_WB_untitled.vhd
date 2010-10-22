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

ENTITY ControlSplit_WB IS
   PORT( 
      ControlWord_WB : IN     LC3b_ControlWord;
      clk        : IN     std_logic;
      WBMUXSel  :  OUT    std_logic_vector(1 downto 0);
      regwrite_wb : out std_logic
   );

-- Declarations

END ControlSplit_WB ;

--
ARCHITECTURE untitled OF ControlSplit_WB IS
BEGIN
  --   13          12            11-10              9            8      7-5    4        3                2        1-0      
 --  1RegWrite-ADDRESSMUX1Sel-2ADDRESSMUX2Sel-ADDRESSMUXSel-SR2MuxSel-ALUop-ALUSHFSel-MEMMUX_MEMSel-DRMUXSEL-2WBMUXSEL
  
  WBMUXSel <= ControlWord_WB(1 downto 0);
  regwrite_wb <= ControlWord_WB(13);
END ARCHITECTURE untitled;
