--
-- VHDL Architecture ece411.byteReplicate.untitled
--
-- Created:
--          by - tmurray5.stdt (eelnx8.ews.illinois.edu)
--          at - 15:31:52 10/07/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY byteReplicate IS
   PORT( 
      ALUout      : IN     LC3b_word;
      clk         : IN     std_logic;
      byteWordOut : OUT    LC3b_word
   );

-- Declarations

END byteReplicate ;

--
ARCHITECTURE untitled OF byteReplicate IS
BEGIN
  
   byteWordOut <= ALUOut(7 downto 0) & ALUOut(7 downto 0);
  
END ARCHITECTURE untitled;

