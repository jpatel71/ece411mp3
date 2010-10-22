--
-- VHDL Architecture ece411.ALUSHFtoD.untitled
--
-- Created:
--          by - bjohns38.stdt (gllnx19.ews.illinois.edu)
--          at - 22:36:39 10/21/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.NUMERIC_STD.all;
USE ieee.std_logic_1164.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY ALUSHFtoD IS
   PORT( 
      ALUSHFMuxOut_MEM : IN     lc3b_word;
      clk        : IN     std_logic;
      D_DATAOUt        : OUT    LC3b_word
   );

-- Declarations

END ALUSHFtoD ;

--
ARCHITECTURE untitled OF ALUSHFtoD IS
BEGIN
  D_DATAOUT<= ALUSHFMUXOut_MEM;
END ARCHITECTURE untitled;
