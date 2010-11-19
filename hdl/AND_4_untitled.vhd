--
-- VHDL Architecture ece411.AND_4.untitled
--
-- Created:
--          by - tmurray5.stdt (gllnx15.ews.illinois.edu)
--          at - 16:07:53 11/08/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.NUMERIC_STD.all;
USE ieee.std_logic_1164.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY AND_4 IS
  PORT( 
	  A : IN     STD_LOGIC;
	  B : IN     STD_LOGIC;
	  C : IN     STD_LOGIC;
	  D : IN     std_logic;
	  F : OUT    STD_LOGIC
  );
-- Declarations

END AND_4 ;

--
ARCHITECTURE untitled OF AND_4 IS
BEGIN
  	F <= A AND B AND C AND C AFTER DELAY_LOGIC4;
END ARCHITECTURE untitled;

