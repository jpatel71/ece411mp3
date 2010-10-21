--
-- VHDL Architecture ece411.ControlReg.untitled
--
-- Created:
--          by - bjohns38.stdt (eelnx25.ews.illinois.edu)
--          at - 12:00:41 10/19/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.NUMERIC_STD.all;
USE ieee.std_logic_1164.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY ControlReg IS
   PORT( 
      RESET_L     : IN     std_logic;
      output_word : OUT    std_logic_vector (10 DOWNTO 0);
      Opcode_ID   : IN     LC3B_Opcode
   );

-- Declarations

END ControlReg ;

--
ARCHITECTURE untitled OF ControlReg IS
BEGIN
  PROCESS(opcode)
    variable state : std_logic_vector (7 DOWNTO 0);
    --  1RegWrite-2ALUop-2ALUMuxSel-1LoadNZP-2RFMuxSel-XXX
  BEGIN
    case opcode is
    when "0000" =>
      state := "00000000000";
    when "0001" =>
      state := "10000101000";
    when others =>
    end case;
    
    output_word <= state after delay_control; 
  END PROCESS;
END ARCHITECTURE untitled;

