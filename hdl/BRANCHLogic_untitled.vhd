--
-- VHDL Architecture ece411.BRANCHLogic.untitled
--
-- Created:
--          by - bjohns38.stdt (gllnx19.ews.illinois.edu)
--          at - 23:29:05 10/21/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.NUMERIC_STD.all;
USE ieee.std_logic_1164.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY BRANCHLogic IS
   PORT( 
      INSCC_MEM      : IN     lc3b_nzp;
      nzp_MEM        : IN     lc3b_reg;
      BRANCHLOAD_MEM : OUT    std_logic;
      clk        : IN     std_logic;
      opcode_MEM     : IN     lc3b_opcode
   );

-- Declarations

END BRANCHLogic ;

--
ARCHITECTURE untitled OF BRANCHLogic IS
BEGIN
  PROCESS(INSCC_MEM, nzp_MEM, opcode_MEM, clk)
    BEGIN
      BRANCHLOAD_MEM <= '0';
      IF(opcode_MEM = "0000" and nzp_MEM = INSCC_MEM) THEN
        BRANCHLOAD_MEM <= '1' after 1ns;
      END IF;
    END PROCESS;
END ARCHITECTURE untitled;

