--
-- VHDL Architecture ece411.MUX8_1.untitled
--
-- Created:
--          by - tmurray5.stdt (gllnx15.ews.illinois.edu)
--          at - 16:32:16 11/08/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.NUMERIC_STD.all;
USE ieee.std_logic_1164.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY MUX8_1 IS
  PORT( 
	    A   : IN     STD_LOGIC;
	    B   : IN     STD_LOGIC;
	    C   : IN     STD_LOGIC;
	    D   : IN     STD_LOGIC;
	    E   : IN     STD_LOGIC;
	    F   : IN     STD_LOGIC;
	    G   : IN     STD_LOGIC;
	    H   : IN     STD_LOGIC;
	    SEL : IN     STD_LOGIC_VECTOR (2 DOWNTO 0);
	    Output   : OUT    STD_LOGIC
    );
-- Declarations

END MUX8_1 ;

--
ARCHITECTURE untitled OF MUX8_1 IS
SIGNAL TEMP : STD_LOGIC;
BEGIN
	PROCESS (A, B, C, D, E, F, G, H, SEL)
	BEGIN  -- PROCESS
		CASE SEL IS
    		WHEN "000" =>
    			TEMP <= A;
    		WHEN "001" => 
    			TEMP <= B;
    		WHEN "010" => 
    			TEMP <= C;
    		WHEN "011" => 
    			TEMP <= D;
    		WHEN "100" =>
    			TEMP <= E;
    		WHEN "101" => 
    			TEMP <= F;
    		WHEN "110" => 
    			TEMP <= G;
    		WHEN "111" => 
    			TEMP <= H;
    		WHEN OTHERS =>
    			TEMP <= 'X';
		END CASE;
	END PROCESS;
	output <= TEMP AFTER DELAY_MUX8;
END ARCHITECTURE untitled;