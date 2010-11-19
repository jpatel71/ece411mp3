--
-- VHDL Architecture ece411.decoder3_8.untitled
--
-- Created:
--          by - tmurray5.stdt (gllnx15.ews.illinois.edu)
--          at - 17:17:58 11/08/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.NUMERIC_STD.all;
USE ieee.std_logic_1164.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY decoder3_8 IS
     PORT( 
        sel     : IN     std_logic_vector(2 downto 0);     
        lineSel : OUT    std_logic_vector(7 DOWNTO 0)
     );
-- Declarations

END decoder3_8 ;

--
ARCHITECTURE untitled OF decoder3_8 IS
BEGIN
  PROCESS(sel)
    variable state : std_logic_vector (7 DOWNTO 0);
  BEGIN
    case sel is
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

