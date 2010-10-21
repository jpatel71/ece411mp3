-- VHDL Entity ece411.way.symbol
--
-- Created:
--          by - tmurray5.stdt (eelnx37.ews.illinois.edu)
--          at - 15:42:48 10/14/10
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY way IS
   PORT( 
      DataWrite : IN     std_logic;
      dataIn    : IN     lc3b_oword;
      dirtyIn   : IN     std_logic;
      index     : IN     lc3b_index;
      reset_l   : IN     std_logic;
      tagIn     : IN     lc3b_tag;
      dataOut   : OUT    lc3b_oword;
      dirtyOut  : OUT    std_logic;
      tagOut    : OUT    lc3b_tag;
      validOut  : OUT    std_logic
   );

-- Declarations

END way ;

--
-- VHDL Architecture ece411.way.struct
--
-- Created:
--          by - tmurray5.stdt (eelnx37.ews.illinois.edu)
--          at - 15:42:48 10/14/10
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

LIBRARY ece411;

ARCHITECTURE struct OF way IS

   -- Architecture declarations

   -- Internal signal declarations


   -- Component Declarations
   COMPONENT DataArray
   PORT (
      reset_l   : IN     std_logic ;
      index     : IN     lc3b_index ;
      dataIn    : IN     lc3b_oword ;
      dataOut   : OUT    lc3b_oword ;
      DataWrite : IN     std_logic 
   );
   END COMPONENT;
   COMPONENT DirtyArray
   PORT (
      dirtyOut  : OUT    std_logic ;
      index     : IN     lc3b_index ;
      reset_l   : IN     std_logic ;
      dirtyIn   : IN     std_logic ;
      DataWrite : IN     std_logic 
   );
   END COMPONENT;
   COMPONENT TagArray
   PORT (
      reset_l   : IN     std_logic ;
      index     : IN     lc3b_index ;
      tagIn     : IN     lc3b_tag ;
      tagOut    : OUT    lc3b_tag ;
      DataWrite : IN     std_logic 
   );
   END COMPONENT;
   COMPONENT ValidArray
   PORT (
      reset_l   : IN     std_logic ;
      index     : IN     lc3b_index ;
      validOut  : OUT    std_logic ;
      DataWrite : IN     std_logic 
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : DataArray USE ENTITY ece411.DataArray;
   FOR ALL : DirtyArray USE ENTITY ece411.DirtyArray;
   FOR ALL : TagArray USE ENTITY ece411.TagArray;
   FOR ALL : ValidArray USE ENTITY ece411.ValidArray;
   -- pragma synthesis_on


BEGIN

   -- Instance port mappings.
   aDataArray : DataArray
      PORT MAP (
         reset_l   => reset_l,
         index     => index,
         dataIn    => dataIn,
         dataOut   => dataOut,
         DataWrite => DataWrite
      );
   aDirtyArray : DirtyArray
      PORT MAP (
         dirtyOut  => dirtyOut,
         index     => index,
         reset_l   => reset_l,
         dirtyIn   => dirtyIn,
         DataWrite => DataWrite
      );
   aTagArray : TagArray
      PORT MAP (
         reset_l   => reset_l,
         index     => index,
         tagIn     => tagIn,
         tagOut    => tagOut,
         DataWrite => DataWrite
      );
   aValidArray : ValidArray
      PORT MAP (
         reset_l   => reset_l,
         index     => index,
         validOut  => validOut,
         DataWrite => DataWrite
      );

END struct;
