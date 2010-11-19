--
-- VHDL Architecture ece411.IsTrap.untitled
--
-- Created:
--          by - bjohns38.stdt (gllnx4.ews.illinois.edu)
--          at - 19:10:11 11/11/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.NUMERIC_STD.all;
USE ieee.std_logic_1164.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY IsTrap IS
   PORT( 
      clk        : IN     std_logic;
      opcode_mem : IN     lc3b_opcode;
      Sel        : OUT    std_logic
   );

-- Declarations

END IsTrap ;

--
ARCHITECTURE untitled OF IsTrap IS
BEGIN
  PROCESS(opcode_MEM)
    begin
      if(Opcode_MEM=op_TRAP) then
        sel<='1';
      else
        sel<='0';
      end if;
    end process;
      
END ARCHITECTURE untitled;

