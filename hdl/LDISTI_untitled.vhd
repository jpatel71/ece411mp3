--
-- VHDL Architecture ece411.LDISTI.untitled
--
-- Created:
--          by - bjohns38.stdt (gllnx4.ews.illinois.edu)
--          at - 19:43:28 11/11/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.NUMERIC_STD.all;
USE ieee.std_logic_1164.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY LDISTI IS
   PORT( 
      MEMMUX_MEMSel : IN     std_logic;
      Opcode_MEM    : IN     lc3b_opcode;
      clk           : IN     std_logic;
      Sel1          : OUT    std_logic
   );

-- Declarations

END LDISTI ;

--
ARCHITECTURE untitled OF LDISTI IS
BEGIN
END ARCHITECTURE untitled;

