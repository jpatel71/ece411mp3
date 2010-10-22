--
-- VHDL Architecture ece411.BR_add.untitled
--
-- Created:
--          by - bjohns38.ece411_G8 (gllnx6.ews.illinois.edu)
--          at - 16:03:32 10/20/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.NUMERIC_STD.all;
USE ieee.std_logic_1164.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY BR_add IS
   PORT( 
      ADDRESSMUX1Out : IN     LC3b_word;
      ADDRESSMUX2Out : IN     LC3b_word;
      clk        : IN     std_logic;
      BR_add_EX      : OUT    lc3b_word
   );

-- Declarations

END BR_add ;

--
ARCHITECTURE untitled OF BR_add IS

BEGIN
  PROCESS(ADDRESSMUX1Out, ADDRESSMUX2Out,clk)
    VARIABLE ADDRESS : LC3b_WORD;
  BEGIN
      ADDRESS := STD_LOGIC_VECTOR(UNSIGNED(ADDRESSMUX1Out) + UNSIGNED(ADDRESSMUX2Out));
  
  BR_ADD_EX <= ADDRESS after delay_ALU;
  END PROCESS;
END ARCHITECTURE untitled;

