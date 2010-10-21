--
-- VHDL Architecture ece411.wordSelecter.untitled
--
-- Created:
--          by - tmurray5.stdt (eelnx25.ews.illinois.edu)
--          at - 10:38:16 09/24/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY wordSelecter IS
   PORT( 
      offset         : IN     lc3b_offset;
      DATAIN         : OUT    lc3b_word;
      WaySelecterOut : IN     LC3B_oWORD
   );

-- Declarations

END wordSelecter ;

--
ARCHITECTURE untitled OF wordSelecter IS
BEGIN
    PROCESS (offset(3 downto 1), WaySelecterOut)
      variable state : LC3b_word;
    BEGIN
      case ( offset(3 downto 1) ) is
        when "000" =>
          state := WaySelecterOut(15 downto 0);
        when "001" =>
          state := WaySelecterOut(31 downto 16);
        when "010" =>
          state := WaySelecterOut(47 downto 32);
        when "011" =>
          state := WaySelecterOut(63 downto 48);
        when "100" =>
          state := WaySelecterOut(79 downto 64);
        when "101" =>
          state := WaySelecterOut(95 downto 80);
        when "110" =>
          state := WaySelecterOut(111 downto 96);
        when "111" =>
          state := WaySelecterOut(127 downto 112);
        when others =>
          state := (OTHERS => 'X');
      end case;
      DATAIN <= state after delay_MUX8;
    END PROCESS;
END ARCHITECTURE untitled;

