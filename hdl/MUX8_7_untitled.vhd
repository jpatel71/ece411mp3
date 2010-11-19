--
-- VHDL Architecture ece411.MUX8_7.untitled
--
-- Created:
--          by - tmurray5.stdt (gllnx15.ews.illinois.edu)
--          at - 16:35:01 11/08/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.NUMERIC_STD.all;
USE ieee.std_logic_1164.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY MUX8_7 IS
    PORT( 
	      A   : IN     lc3b_l2tag;
	      B   : IN     lc3b_l2tag;
	      C   : IN     lc3b_l2tag;
	      D   : IN     lc3b_l2tag;
	      E   : IN     lc3b_l2tag;
	      F   : IN     lc3b_l2tag;
	      G   : IN     lc3b_l2tag;
	      H   : IN     lc3b_l2tag;
	      SEL : IN     STD_LOGIC_VECTOR (2 DOWNTO 0);
	      Output   : OUT    lc3b_l2tag
      );
-- Declarations

END MUX8_7 ;

--
ARCHITECTURE untitled OF MUX8_7 IS
SIGNAL TEMP : lc3b_l2tag;
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

