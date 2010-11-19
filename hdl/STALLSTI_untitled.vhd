--
-- VHDL Architecture ece411.STALLSTI.untitled
--
-- Created:
--          by - bjohns38.stdt (gllnx4.ews.illinois.edu)
--          at - 19:49:09 11/11/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.NUMERIC_STD.all;
USE ieee.std_logic_1164.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY STALLSTI IS
   PORT( 
      clk      : IN     std_logic;
      StallMEM : OUT    std_logic;
      MEMSEL   : OUT    STD_LOGIC
   );

-- Declarations

END STALLSTI ;

--
ARCHITECTURE untitled OF STALLSTI IS
signal count : std_logic;
BEGIN
  PROCESS(opcode_MEM)
    BEGIN
      if(opcode_mem=op_STI or opcode_MEM=op_LDI) then
        count <= '1';
        MEMMUX_MEMSEL<='0';
      else  
        count<='0';
      end if;
  END PROCESS;
END ARCHITECTURE untitled;

