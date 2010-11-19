--
-- VHDL Architecture ece411.validArray512B.untitled
--
-- Created:
--          by - tmurray5.stdt (eelnx36.ews.illinois.edu)
--          at - 18:18:58 11/06/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.NUMERIC_STD.all;
USE ieee.std_logic_1164.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY validArray512B IS
   PORT( 
      dataWrite : IN     std_logic;
      index     : IN     lc3b_index5;
      reset_l   : IN     std_logic;
      validOut  : OUT    std_logic
   );

-- Declarations

END validArray512B ;

--
ARCHITECTURE untitled OF validArray512B IS
TYPE ValidArray512B IS array (31 downto 0) of std_logic;
  SIGNAL Valid : ValidArray512B;
  
  BEGIN
    --------------------------------------------------------------
	  ReadFromValidArray : PROCESS (Valid, index)
	  --------------------------------------------------------------
    
		  VARIABLE ValidIndex : integer;
		  BEGIN
			  ValidIndex := to_integer(unsigned(Index));
			  ValidOut <= Valid(ValidIndex) after DELAY_4KB_SINGLE;
	  
	  END PROCESS ReadFromValidArray;
	  
	  --------------------------------------------------------------
	  WriteToValidArray : PROCESS (reset_l, index, dataWrite)
	  --------------------------------------------------------------	
		  VARIABLE ValidIndex : integer;
		  BEGIN
			  ValidIndex := to_integer(unsigned(index));
		  IF RESET_L = '0' THEN
		    for i in 31 downto 0 loop
		      Valid(i) <= '0';
        end loop;
		  END IF;

		  IF (dataWrite = '1') THEN
			  Valid(ValidIndex) <= '1';
		  END IF;
	  
	  END PROCESS WriteToValidArray;

END ARCHITECTURE untitled;

