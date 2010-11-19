--
-- VHDL Architecture ece411.MUX8_128.untitled
--
-- Created:
--          by - tmurray5.stdt (gllnx15.ews.illinois.edu)
--          at - 16:59:59 11/08/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.NUMERIC_STD.all;
USE ieee.std_logic_1164.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY MUX8_128 IS
      PORT( 
	        A   : IN     lc3b_oword;
	        B   : IN     lc3b_oword;
	        C   : IN     lc3b_oword;
	        D   : IN     lc3b_oword;
	        E   : IN     lc3b_oword;
	        F   : IN     lc3b_oword;
	        G   : IN     lc3b_oword;
	        H   : IN     lc3b_oword;
	        SEL : IN     STD_LOGIC_VECTOR (2 DOWNTO 0);
	        Output   : OUT    lc3b_oword
        );
-- Declarations

END MUX8_128 ;

--
ARCHITECTURE untitled OF MUX8_128 IS
SIGNAL TEMP : lc3b_oword;
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
    			TEMP <= (OTHERS => 'X');
		END CASE;
	END PROCESS;
	output <= TEMP AFTER DELAY_MUX8;
END ARCHITECTURE untitled;
