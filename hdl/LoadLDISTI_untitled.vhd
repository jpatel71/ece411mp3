--
-- VHDL Architecture ece411.LoadLDISTI.untitled
--
-- Created:
--          by - bjohns38.stdt (gllnx4.ews.illinois.edu)
--          at - 21:06:28 11/11/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.NUMERIC_STD.all;
USE ieee.std_logic_1164.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY LoadLDISTI IS
   PORT( 
      clk        : IN     std_logic;
      LoadOut    : IN     std_logic;
      opcode_mem : IN     lc3b_opcode;
      load       : OUT    std_logic
   );

-- Declarations

END LoadLDISTI ;

--
ARCHITECTURE untitled OF LoadLDISTI IS
BEGIN
  PROCESS(opcode_mem, loadout)
    BEGIN
      if(opcode_mem/=op_ldi and opcode_mem/=op_sti and loadout='1') then
        load<='1';
      else
        load<='0';
      end if;
    END PROCESS;  
END ARCHITECTURE untitled;

