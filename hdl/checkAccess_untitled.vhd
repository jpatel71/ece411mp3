--
-- VHDL Architecture ece411.checkAccess.untitled
--
-- Created:
--          by - tmurray5.stdt (eelnx25.ews.illinois.edu)
--          at - 10:55:21 09/24/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY checkAccess IS
   PORT( 
      MREAD_L   : IN     std_logic;
      MWRITEH_L : IN     std_logic;
      MWRITEL_L : IN     std_logic;
      AccessOut : OUT    std_logic
   );

-- Declarations

END checkAccess ;

--
ARCHITECTURE untitled OF checkAccess IS
BEGIN
  --4 input nand gate
  AccessOut <= not (mread_l and mwriteh_l and mwritel_l) after delay_logic4;
END ARCHITECTURE untitled;
