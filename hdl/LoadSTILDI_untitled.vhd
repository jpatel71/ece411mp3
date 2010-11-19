--
-- VHDL Architecture ece411.LoadSTILDI.untitled
--
-- Created:
--          by - bjohns38.stdt (gllnx4.ews.illinois.edu)
--          at - 20:54:00 11/11/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.NUMERIC_STD.all;
USE ieee.std_logic_1164.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY LoadSTILDI IS
   PORT( 
      D_MRESP_H  : IN     std_logic;
      clk        : IN     std_logic;
      load2      : IN     std_logic;
      opcode_MEM : IN     lc3b_opcode;
      load       : OUT    std_logic
   );

-- Declarations

END LoadSTILDI ;

--
ARCHITECTURE untitled OF LoadSTILDI IS
BEGIN
  load<=load2;
END ARCHITECTURE untitled;

