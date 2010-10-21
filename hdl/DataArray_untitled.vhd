--
-- VHDL Architecture ece411.DataArray.untitled
--
-- Created:
--          by - tmurray5.stdt (eelnx38.ews.illinois.edu)
--          at - 17:31:44 09/26/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
----Example code for the DataArray within an Cache Way
  --Can be easily modified for use with Tag, Valid, and Dirty Arrays
  
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY DataArray IS
   PORT( 
      reset_l   : IN     std_logic;
      index     : IN     lc3b_index;
      dataIn    : IN     lc3b_oword;
      dataOut   : OUT    lc3b_oword;
      DataWrite : IN     std_logic
   );

-- Declarations

END DataArray ;

--
ARCHITECTURE untitled OF DataArray IS

  TYPE DataArray IS	array (7 downto 0) of LC3b_oword;
  SIGNAL Data : DataArray;

  BEGIN
	  --------------------------------------------------------------
	  ReadFromDataArray : PROCESS (Data, Index)
	  --------------------------------------------------------------
    
		  VARIABLE DataIndex : integer;
		  BEGIN
			  DataIndex := to_integer(unsigned(Index));
			  DataOut <= Data(DataIndex) after 20 ns;
	  
	  END PROCESS ReadFromDataArray;
  
	  --------------------------------------------------------------
	  WriteToDataArray : PROCESS (RESET_L, Index, DataWrite, DataIn)
	  -------------------------------------------------------	------	
		  VARIABLE DataIndex : integer;
		  BEGIN
			  DataIndex := to_integer(unsigned(Index));
		  IF RESET_L = '0' THEN
			  Data(0) <= (OTHERS => 'X');
			  Data(1) <= (OTHERS => 'X');
			  Data(2) <= (OTHERS => 'X');
			  Data(3) <= (OTHERS => 'X');
			  Data(4) <= (OTHERS => 'X');
			  Data(5) <= (OTHERS => 'X');
			  Data(6) <= (OTHERS => 'X');
			  Data(7) <= (OTHERS => 'X');
		  END IF;

		  IF (DataWrite = '1') THEN
			  Data(DataIndex) <= DataIn;
		  END IF;
	  
	  END PROCESS WriteToDataArray;

END ARCHITECTURE untitled;
  
