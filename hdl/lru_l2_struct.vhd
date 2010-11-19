-- VHDL Entity ece411.LRU_L2.interface
--
-- Created:
--          by - tmurray5.stdt (eelnx39.ews.illinois.edu)
--          at - 16:45:01 11/16/10
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.NUMERIC_STD.all;
USE ieee.std_logic_1164.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY LRU_L2 IS
   PORT( 
      index   : IN     lc3b_index5;
      reset_l : IN     std_logic;
      LRUOut  : OUT    STD_LOGIC_VECTOR (2 DOWNTO 0)
   );

-- Declarations

END LRU_L2 ;

--
-- VHDL Architecture ece411.LRU_L2.struct
--
-- Created:
--          by - tmurray5.stdt (eelnx39.ews.illinois.edu)
--          at - 16:45:02 11/16/10
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.NUMERIC_STD.all;
USE ieee.std_logic_1164.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

LIBRARY ece411;

ARCHITECTURE struct OF LRU_L2 IS

   -- Architecture declarations

   -- Internal signal declarations


   -- Component Declarations
   COMPONENT LRUBlock
   PORT (
      LRUOut : OUT    STD_LOGIC_VECTOR (2 DOWNTO 0)
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : LRUBlock USE ENTITY ece411.LRUBlock;
   -- pragma synthesis_on


BEGIN

   -- Instance port mappings.
   U_0 : LRUBlock
      PORT MAP (
         LRUOut => LRUOut
      );

END struct;
