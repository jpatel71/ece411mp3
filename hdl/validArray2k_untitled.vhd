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

ENTITY ValidArray2K IS
  PORT(
    index  : IN  lc3b_index7;
    reset_l: IN  std_logic;
    writeData : IN std_logic;
    ValidOUT: OUT lc3b_oword
  );
-- Declarations

END ValidArray2K ;

--
ARCHITECTURE untitled OF ValidArray2K IS
  TYPE ValidArray2K IS array (127 downto 0) of std_logic;
  SIGNAL Valid : ValidArray2k;
  
  BEGIN
    --------------------------------------------------------------
	  ReadFromValidArray : PROCESS (Data, index)
	  --------------------------------------------------------------
    
		  VARIABLE ValidIndex : integer;
		  BEGIN
			  ValidIndex := to_integer(unsigned(Index));
			  ValidOut <= Valid(ValidIndex) after 20 ns;
	  
	  END PROCESS ReadFromValidArray;
	  
	  --------------------------------------------------------------
	  WriteToValidArray : PROCESS (reset_l, index, writeData)
	  --------------------------------------------------------------	
		  VARIABLE ValidIndex : integer;
		  BEGIN
			  ValidIndex := to_integer(unsigned(index));
		  IF RESET_L = '0' THEN
		    for i in 127 downto 0 loop
		      Valid(i) <= 'X';
        end loop;
		  END IF;

		  IF (writeData = '1') THEN
			  Valid(Index) <= '1';
		  END IF;
	  
	  END PROCESS WriteToValidArray;

END ARCHITECTURE untitled;
  
