--
-- VHDL Architecture ece411.delayClk.untitled
--
-- Created:
--          by - tmurray5.stdt (eelnx30.ews.illinois.edu)
--          at - 21:06:31 09/28/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY delayClk IS
   PORT( 
      Clk     : IN     std_logic;
      hitgate : OUT    std_logic
   );

-- Declarations

END delayClk ;

--
ARCHITECTURE untitled OF delayClk IS
BEGIN
  hitgate <= Clk'delayed(34ns) AND NOT(CLK);
END ARCHITECTURE untitled;

