--
-- VHDL Architecture ece411.Seven.untitled
--
-- Created:
--          by - bjohns38.stdt (eelnx26.ews.illinois.edu)
--          at - 13:51:40 11/10/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.NUMERIC_STD.all;
USE ieee.std_logic_1164.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY Seven IS
   PORT( 
      clk : IN     std_logic;
      B1  : OUT    STD_LOGIC_VECTOR (2 DOWNTO 0)
   );

-- Declarations

END Seven ;

--
ARCHITECTURE untitled OF Seven IS
BEGIN
  B1<="111";
END ARCHITECTURE untitled;

