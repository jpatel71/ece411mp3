--
-- VHDL Architecture ece411.ControlSplit_ID.untitled
--
-- Created:
--          by - bjohns38.stdt (eelnx24.ews.illinois.edu)
--          at - 14:17:42 10/22/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.NUMERIC_STD.all;
USE ieee.std_logic_1164.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY ControlSplit_ID IS
   PORT( 
      ControlWord_ID : IN     LC3B_ControlWord;
      clk            : IN     std_logic;
      SRCAValid      : OUT    std_logic;
      SRCMuxSel      : OUT    STD_LOGIC;
      RegWrite_ID    : OUT    std_logic;
      JSR_ID         : OUT    std_logic;
      DestValid_ID   : OUT    std_logic
   );

-- Declarations

END ControlSplit_ID ;

--
ARCHITECTURE untitled OF ControlSplit_ID IS
BEGIN
  SRCMuxSel<=ControlWord_ID(15);
  SRCAValid <= ControlWord_ID(20);
  RegWrite_ID <= ControlWord_ID(13);
  JSR_ID<=ControlWord_ID(22);
  DestValid_ID <= ControlWord_ID(19);
END ARCHITECTURE untitled;

