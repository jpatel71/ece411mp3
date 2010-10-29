--
-- VHDL Architecture ece411.DataArray2K.untitled
--
-- Created:
--          by - tmurray5.stdt (eelnx25.ews.illinois.edu)
--          at - 22:26:56 10/26/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.NUMERIC_STD.all;
USE ieee.std_logic_1164.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY validArray1k IS
   PORT( 
      index     : IN     lc3b_index6;
      reset_l   : IN     std_logic;
      writeData : IN     std_logic;
      ValidOUT  : OUT    std_logic
   );

-- Declarations

END validArray1k ;

--
ARCHITECTURE untitled OF validArray1k IS
  TYPE ValidArray1K IS array (63 downto 0) of std_logic;
  SIGNAL Valid : ValidArray1k;
  
  BEGIN
    --------------------------------------------------------------
	  ReadFromValidArray : PROCESS (Valid, index)
	  --------------------------------------------------------------
    
		  VARIABLE ValidIndex : integer;
		  BEGIN
			  ValidIndex := to_integer(unsigned(Index));
			  ValidOut <= Valid(ValidIndex) after DELAY_1KB_SINGLE;
	  
	  END PROCESS ReadFromValidArray;
	  
	  --------------------------------------------------------------
	  WriteToValidArray : PROCESS (reset_l, index, writeData)
	  --------------------------------------------------------------	
		  VARIABLE ValidIndex : integer;
		  BEGIN
			  ValidIndex := to_integer(unsigned(index));
		  IF RESET_L = '0' THEN
		    for i in 63 downto 0 loop
		      Valid(i) <= '0';
        end loop;
		  END IF;

		  IF (writeData = '1') THEN
			  Valid(ValidIndex) <= '1';
		  END IF;
	  
	  END PROCESS WriteToValidArray;

END ARCHITECTURE untitled;
  
