--
-- VHDL Architecture ece411.dataArray512B.untitled
--
-- Created:
--          by - tmurray5.stdt (eelnx36.ews.illinois.edu)
--          at - 18:17:19 11/06/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.NUMERIC_STD.all;
USE ieee.std_logic_1164.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY dataArray512B IS
   PORT( 
      dataIn    : IN     lc3b_oword;
      dataWrite : IN     std_logic;
      index     : IN     lc3b_index5;
      reset_l   : IN     std_logic;
      dataOut   : OUT    lc3b_oword
   );

-- Declarations

END dataArray512B ;

--
ARCHITECTURE untitled OF dataArray512B IS
TYPE DataArray512B IS array (31 downto 0) of LC3B_oword;
  SIGNAL Data : DataArray512B;
  
  BEGIN
    --------------------------------------------------------------
	  ReadFromDataArray : PROCESS (Data, index)
	  --------------------------------------------------------------
    
		  VARIABLE DataIndex : integer;
		  BEGIN
			  DataIndex := to_integer(unsigned(Index));
			  DataOut <= Data(DataIndex) after DELAY_4KB_SINGLE;
	  
	  END PROCESS ReadFromDataArray;
	  
	  --------------------------------------------------------------
	  WriteToDataArray : PROCESS (reset_l, index, dataWrite, dataIN)
	  --------------------------------------------------------------	
		  VARIABLE DataIndex : integer;
		  BEGIN
			  DataIndex := to_integer(unsigned(index));
		  IF RESET_L = '0' THEN
		    for i in 31 downto 0 loop
		      Data(i) <= (OTHERS => 'X');
        end loop;
		  END IF;

		  IF (dataWrite = '1') THEN
			  Data(DataIndex) <= dataIN;
		  END IF;
	  
	  END PROCESS WriteToDataArray;

END ARCHITECTURE untitled;

