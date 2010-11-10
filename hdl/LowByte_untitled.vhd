--
-- VHDL Architecture ece411.LowByte.untitled
--
-- Created:
--          by - bjohns38.stdt (dcllnx69.ews.illinois.edu)
--          at - 20:14:54 11/09/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.NUMERIC_STD.all;
USE ieee.std_logic_1164.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY LowByte IS
   PORT( 
      ADDRESSMUXOut_WB : IN     LC3b_word;
      WBMuxout         : IN     LC3b_word;
      clk              : IN     std_logic;
      B                : OUT    LC3b_word
   );

-- Declarations

END LowByte ;

--
ARCHITECTURE untitled OF LowByte IS
BEGIN
  PROCESS(ADDRESSMUXOut_WB, clk)
    Begin
      IF(ADDRESSMUXOut_WB(0)='0') then
        B<="00000000" & WBMuxout(7 downto 0);
      else
        B<="00000000" & WBMuxout(15 downto 8);
      end if;
    end process;
END ARCHITECTURE untitled;

