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

ENTITY DataArray2K IS
  PORT(
    index  : IN  lc3b_index7;
    reset_l: IN  std_logic;
    writeData : IN std_logic;
    dataIN : IN  lc3b_oword;
    dataOUT: OUT lc3b_oword
  );
-- Declarations

END DataArray2K ;

--
ARCHITECTURE untitled OF DataArray2K IS
  TYPE DataArray2K IS array (127 downto 0) of LC3B_oword;
  SIGNAL Data : DataArray2K;
  
  BEGIN
    --------------------------------------------------------------
	  ReadFromDataArray : PROCESS (Data, index)
	  --------------------------------------------------------------
    
		  VARIABLE DataIndex : integer;
		  BEGIN
			  DataIndex := to_integer(unsigned(Index));
			  DataOut <= Data(DataIndex) after 20 ns;
	  
	  END PROCESS ReadFromDataArray;
	  
	  --------------------------------------------------------------
	  WriteToDataArray : PROCESS (reset_l, index, writeData, dataIN)
	  --------------------------------------------------------------	
		  VARIABLE DataIndex : integer;
		  BEGIN
			  DataIndex := to_integer(unsigned(index));
		  IF RESET_L = '0' THEN
		    for i in 127 downto 0 loop
		      Data(i) <= (OTHERS => 'X');
        end loop;
		  END IF;

		  IF (writeData = '1') THEN
			  Data(DataIndex) <= dataIN;
		  END IF;
	  
	  END PROCESS WriteToDataArray;

END ARCHITECTURE untitled;
  
