-- VHDL Entity ece411.mp3_cpu.symbol
--
-- Created:
--          by - bjohns38.stdt (gllnx14.ews.illinois.edu)
--          at - 16:29:09 11/08/10
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.NUMERIC_STD.all;
USE ieee.std_logic_1164.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY mp3_cpu IS
   PORT( 
      RESET_L : IN     std_logic;
      clk     : IN     std_logic
   );

-- Declarations

END mp3_cpu ;

--
-- VHDL Architecture ece411.mp3_cpu.struct
--
-- Created:
--          by - bjohns38.stdt (gllnx14.ews.illinois.edu)
--          at - 16:29:10 11/08/10
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.NUMERIC_STD.all;
USE ieee.std_logic_1164.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

LIBRARY ece411;

ARCHITECTURE struct OF mp3_cpu IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL D_ADDRESSOut : LC3b_word;
   SIGNAL D_DATAIN     : lc3b_word;
   SIGNAL D_DATAOUt    : LC3b_word;
   SIGNAL D_MREAD_L    : std_logic;
   SIGNAL D_MRESP_H    : STD_LOGIC;
   SIGNAL D_MWRITEH_L  : std_logic;
   SIGNAL D_MWRITEL_L  : std_logic;
   SIGNAL IDATAAddress : LC3b_word;
   SIGNAL IDATAIn      : LC3b_word;
   SIGNAL I_MREAD_L    : std_logic;
   SIGNAL I_MRESP_H    : std_logic;


   -- Component Declarations
   COMPONENT CacheBlock
   PORT (
      D_Address     : IN     lc3b_word ;
      D_DATAOUT     : IN     lc3b_word ;
      D_MREAD_L     : IN     std_logic ;
      D_MWRITEH_L   : IN     std_logic ;
      D_MWRITEL_L   : IN     std_logic ;
      I_DATAAddress : IN     lc3b_word ;
      I_MREAD_L     : IN     std_logic ;
      clk           : IN     std_logic ;
      reset_l       : IN     std_logic ;
      D_DATAIN      : OUT    lc3b_word ;
      D_MRESP_H     : OUT    STD_LOGIC ;
      I_DATAIN      : OUT    LC3B_WORD ;
      I_MRESP_H     : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT PipeLine
   PORT (
      D_DATAIN     : IN     lc3b_word ;
      D_MRESP_H    : IN     std_logic ;
      IDATAIn      : IN     LC3b_word ;
      I_MRESP_H    : IN     std_logic ;
      RESET_L      : IN     std_logic ;
      clk          : IN     std_logic ;
      D_ADDRESSOut : OUT    LC3b_word ;
      D_DATAOUt    : OUT    LC3b_word ;
      D_MREAD_L    : OUT    std_logic ;
      D_MWRITEH_L  : OUT    std_logic ;
      D_MWRITEL_L  : OUT    std_logic ;
      IDATAAddress : OUT    LC3b_word ;
      I_MREAD_L    : OUT    std_logic 
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : CacheBlock USE ENTITY ece411.CacheBlock;
   FOR ALL : PipeLine USE ENTITY ece411.PipeLine;
   -- pragma synthesis_on


BEGIN

   -- Instance port mappings.
   TheCacheBlockWorker : CacheBlock
      PORT MAP (
         D_Address     => D_ADDRESSOut,
         D_DATAOUT     => D_DATAOUt,
         D_MREAD_L     => D_MREAD_L,
         D_MWRITEH_L   => D_MWRITEH_L,
         D_MWRITEL_L   => D_MWRITEL_L,
         I_DATAAddress => IDATAAddress,
         I_MREAD_L     => I_MREAD_L,
         clk           => clk,
         reset_l       => RESET_L,
         D_DATAIN      => D_DATAIN,
         D_MRESP_H     => D_MRESP_H,
         I_DATAIN      => IDATAIn,
         I_MRESP_H     => I_MRESP_H
      );
   thePipeline : PipeLine
      PORT MAP (
         D_DATAIN     => D_DATAIN,
         D_MRESP_H    => D_MRESP_H,
         IDATAIn      => IDATAIn,
         I_MRESP_H    => I_MRESP_H,
         RESET_L      => RESET_L,
         clk          => clk,
         D_ADDRESSOut => D_ADDRESSOut,
         D_DATAOUt    => D_DATAOUt,
         D_MREAD_L    => D_MREAD_L,
         D_MWRITEH_L  => D_MWRITEH_L,
         D_MWRITEL_L  => D_MWRITEL_L,
         IDATAAddress => IDATAAddress,
         I_MREAD_L    => I_MREAD_L
      );

END struct;
