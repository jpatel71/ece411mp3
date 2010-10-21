--Example code for the DataArray within an Cache Way
--Can be easily modified for use with Tag, Valid, and Dirty Arrays

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY LRU IS
   PORT( 
      LRUOut  : OUT    std_logic;
      Index   : IN     LC3b_index;
      preHit0 : IN     std_logic;
      RESET_L : IN     std_logic;
      hit     : IN     std_logic
   );

-- Declarations

END LRU ;

--
ARCHITECTURE untitled OF LRU IS

	TYPE LRU IS	array (7 downto 0) of std_logic;
	SIGNAL Data : LRU;

	BEGIN
		--------------------------------------------------------------
		ReadFromLRU : PROCESS (Data, Index)
		--------------------------------------------------------------
    
			VARIABLE LRUIndex : integer;
			BEGIN
				LRUIndex := to_integer(unsigned(Index));
				LRUOut <= Data(LRUIndex) after 20 ns;
		
		END PROCESS ReadFromLRU;
	
		--------------------------------------------------------------
		WriteToLRU : PROCESS (RESET_L, Index, preHit0, hit)
		-------------------------------------------------------	------	
			VARIABLE LRUIndex : integer;
			BEGIN
				LRUIndex := to_integer(unsigned(Index));
			IF RESET_L = '0' THEN
				Data(0) <= '0';
				Data(1) <= '0';
				Data(2) <= '0';
				Data(3) <= '0';
				Data(4) <= '0';
				Data(5) <= '0';
				Data(6) <= '0';
				Data(7) <= '0';
			END IF;
      if(hit = '1') then
			  Data(LRUIndex) <= preHit0;
		  end if;
		END PROCESS WriteToLRU;

END ARCHITECTURE untitled;

