--
-- VHDL Architecture ece411.BRlog.untitled
--
-- Created:
--          by - bjohns38.stdt (eelnx24.ews.illinois.edu)
--          at - 11:56:35 10/22/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.NUMERIC_STD.all;
USE ieee.std_logic_1164.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY BRlog IS
   PORT( 
      opcode_mem     : IN     lc3b_opcode;
      CheckN         : IN     std_logic;
      CheckP         : IN     std_logic;
      CheckZ         : IN     std_logic;
      clk            : IN     std_logic;
      n              : IN     std_logic;
      p              : IN     std_logic;
      z              : IN     std_logic;
      BRANCHLOAD_MEM : OUT    std_logic
   );

-- Declarations

END BRlog ;

--
ARCHITECTURE untitled OF BRlog IS
BEGIN
  process(n,z,p,checkn,checkp,checkz, opcode_MEM)
    begin
     if(opcode_MEM = op_br) then 
      if (((CheckN AND n) OR (CheckP AND p) OR (CheckZ AND z)) = '1') then
        BranchLoad_MEM<='1';
      else
       BRANCHLOAD_MEM <= '0';
      END IF;
    else
      BranchLoad_Mem <= '0';
  end if;
end process;
END ARCHITECTURE untitled;

