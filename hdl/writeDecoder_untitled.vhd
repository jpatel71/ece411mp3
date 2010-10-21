--
-- VHDL Architecture ece411.writeDecoder.untitled
--
-- Created:
--          by - tmurray5.stdt (gllnx25.ews.illinois.edu)
--          at - 15:58:12 09/27/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY writeDecoder IS
   PORT( 
      lineSel : OUT    std_logic_vector (7 DOWNTO 0);
      offset  : IN     lc3b_offset
   );

-- Declarations

END writeDecoder ;

--
ARCHITECTURE untitled OF writeDecoder IS
BEGIN
  PROCESS(offset)
    variable state : std_logic_vector (7 DOWNTO 0);
  BEGIN
    case offset(3 downto 1) is
      when "000" =>
        state := "00000001";
      when "001" =>
        state := "00000010";
      when "010" =>
        state := "00000100";
      when "011" =>
        state := "00001000";
      when "100" =>
        state := "00010000";
      when "101" =>
        state := "00100000";
      when "110" =>
        state := "01000000";
      when "111" =>
        state := "10000000";
      when others =>
        state := "00000000";
    end case;
    lineSel <= state after delay_decoder; 
  END PROCESS;
END ARCHITECTURE untitled;

