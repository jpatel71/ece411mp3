--
-- VHDL Architecture ece411.splitNZP.untitled
--
-- Created:
--          by - bjohns38.stdt (eelnx24.ews.illinois.edu)
--          at - 11:53:47 10/22/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.NUMERIC_STD.all;
USE ieee.std_logic_1164.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY splitNZP IS
   PORT( 
      INSCC_MEM : IN     lc3b_nzp;
      clk       : IN     std_logic;
      CheckN      : OUT    std_logic;
      CheckZ      : OUT    std_logic;
      CheckP      : OUT    std_logic
   );

-- Declarations

END splitNZP ;

--
ARCHITECTURE untitled OF splitNZP IS
BEGIN
  	CHECKN <= INSCC_MEM(2);
	  CHECKZ <= INSCC_MEM(1);
	  CHECKP <= INSCC_MEM(0);
END ARCHITECTURE untitled;

