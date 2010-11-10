--
-- VHDL Architecture ece411.JSRBlock.untitled
--
-- Created:
--          by - bjohns38.stdt (eelnx26.ews.illinois.edu)
--          at - 13:36:23 11/10/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.NUMERIC_STD.all;
USE ieee.std_logic_1164.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY JSRBlock IS
   PORT( 
      JSR_ID      : IN     std_logic;
      PCPlus2_ID  : IN     lc3b_word;
      RegFileIn   : IN     lc3b_word;
      clk         : IN     std_logic;
      dest        : IN     LC3B_REG;
      regwrite_wb : IN     std_logic;
      DEST1       : OUT    LC3B_REG;
      DIN         : OUT    LC3B_WORD;
      REGWRITE    : OUT    STD_LOGIC
   );

-- Declarations

END JSRBlock ;
