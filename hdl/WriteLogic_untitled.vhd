--
-- VHDL Architecture ece411.WriteLogic.untitled
--
-- Created:
--          by - bjohns38.stdt (gllnx19.ews.illinois.edu)
--          at - 00:01:17 10/22/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.NUMERIC_STD.all;
USE ieee.std_logic_1164.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY WriteLogic IS
   PORT( 
      clk        : IN     std_logic;
      D_ADDRESSOut : IN     LC3b_word;
      opcode_MEM   : IN     lc3b_opcode;
      MWRITEL_H    : OUT    std_logic;
      MWRITEL_L    : OUT    std_logic
   );

-- Declarations

END WriteLogic ;

--
ARCHITECTURE untitled OF WriteLogic IS
BEGIN
  PROCESS(opcode_MEM, D_ADDRESSOut, clk)
  BEGIN
    if(opcode_MEM = op_str) then
      MWRITEL_H <= '1' after 1ns;
      MWRITEL_L <= '1' after 1ns;
    END IF;
  END PROCESS;
END ARCHITECTURE untitled;

