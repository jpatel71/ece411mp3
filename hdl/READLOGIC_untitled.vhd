--
-- VHDL Architecture ece411.READLOGIC.untitled
--
-- Created:
--          by - bjohns38.stdt (gllnx19.ews.illinois.edu)
--          at - 00:05:46 10/22/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.NUMERIC_STD.all;
USE ieee.std_logic_1164.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY READLOGIC IS
   PORT(
      clk        : IN     std_logic;
      opcode_MEM : IN     lc3b_opcode;
      D_MREAD_L  : OUT    std_logic
   );

-- Declarations

END READLOGIC ;

--
ARCHITECTURE untitled OF READLOGIC IS
SIGNAL read : std_logic;
BEGIN
  PROCESS(opcode_MEM,clk)
    
  BEGIN
    read <= '1';
    IF(opcode_MEM = op_ldr) then
      read <= '0';
  END IF;
  
  END PROCESS;
  D_MREAD_L <= read after 1ns;
END ARCHITECTURE untitled;

