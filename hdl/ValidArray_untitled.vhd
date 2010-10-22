--
-- VHDL Architecture ece411.ValidArray.untitled
--
-- Created:
--          by - tmurray5.stdt (eelnx38.ews.illinois.edu)
--          at - 18:02:58 09/26/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY ValidArray IS
   PORT( 
      reset_l   : IN     std_logic;
      index     : IN     lc3b_index;
      validOut  : OUT    std_logic;
      DataWrite : IN     std_logic
   );

-- Declarations

END ValidArray ;

--
ARCHITECTURE untitled OF ValidArray IS

  TYPE ValidArray IS	array (7 downto 0) of std_logic;
  SIGNAL Valid : ValidArray;

  BEGIN
	  --------------------------------------------------------------
	  ReadFromValidArray : PROCESS (Valid, Index)
	  --------------------------------------------------------------
    
		  VARIABLE ValidIndex : integer;
		  BEGIN
			  ValidIndex := to_integer(unsigned(Index));
			  ValidOut <= Valid(ValidIndex) after 20 ns;
	  
	  END PROCESS ReadFromValidArray;
  
	  --------------------------------------------------------------
	  WriteToValidArray : PROCESS (RESET_L, Index, DataWrite)
	  -------------------------------------------------------	------	
		  VARIABLE ValidIndex : integer;
		  BEGIN
			  ValidIndex := to_integer(unsigned(Index));
		  IF RESET_L = '0' THEN
			  Valid(0) <= '0';
			  Valid(1) <= '0';
			  Valid(2) <= '0';
			  Valid(3) <= '0';
			  Valid(4) <= '0';
			  Valid(5) <= '0';
			  Valid(6) <= '0';
			  Valid(7) <= '0';
		  END IF;

		  IF (DataWrite = '1') THEN
			  Valid(ValidIndex) <= '1';
		  END IF;
	  
	  END PROCESS WriteToValidArray;

END ARCHITECTURE untitled;