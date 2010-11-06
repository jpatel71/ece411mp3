-- VHDL Entity ece411.Arbiter.interface
--
-- Created:
--          by - tmurray5.stdt (eelnx31.ews.illinois.edu)
--          at - 16:55:59 11/05/10
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.NUMERIC_STD.all;
USE ieee.std_logic_1164.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY Arbiter IS
   PORT( 
      D_PMADDRESS : IN     lc3b_word;
      D_PMDATAOUT : IN     lc3b_oword;
      D_PMREAD_L  : IN     std_logic;
      D_PMWRITE_L : IN     std_logic;
      I_PMADDRESS : IN     lc3b_word;
      I_PMDATAOUT : IN     lc3b_oword;
      I_PMREAD_L  : IN     std_logic;
      I_PMWRITE_L : IN     std_logic;
      PM_DATAOUT  : IN     LC3B_OWORD;
      PM_MRESP_H  : IN     STD_LOGIC;
      clk         : IN     std_logic;
      reset_l     : IN     std_logic;
      D_PMRESP_H  : OUT    std_logic;
      D_WDATA     : OUT    lc3b_oword;
      I_PMRESP_H  : OUT    std_logic;
      I_WDATA     : OUT    lc3b_oword;
      PM_ADDRESS  : OUT    LC3B_WORD;
      PM_DATAIN   : OUT    LC3B_OWORD;
      PM_MREAD_L  : OUT    STD_LOGIC;
      PM_MWRITE_L : OUT    STD_LOGIC
   );

-- Declarations

END Arbiter ;

--
-- VHDL Architecture ece411.Arbiter.struct
--
-- Created:
--          by - tmurray5.stdt (eelnx31.ews.illinois.edu)
--          at - 16:55:59 11/05/10
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.NUMERIC_STD.all;
USE ieee.std_logic_1164.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

LIBRARY ece411;
LIBRARY mp3lib;

ARCHITECTURE struct OF Arbiter IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL D_ACCESS : STD_LOGIC;
   SIGNAL I_ACCESS : STD_LOGIC;
   SIGNAL sel      : std_logic;


   -- Component Declarations
   COMPONENT DEMUX2_1
   PORT (
      DataIN : IN     std_logic ;
      sel    : IN     std_logic ;
      A      : OUT    std_logic ;
      B      : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT DEMUX2_128
   PORT (
      DataIN : IN     LC3B_OWORD ;
      sel    : IN     std_logic ;
      A      : OUT    lc3b_oword ;
      B      : OUT    lc3b_oword 
   );
   END COMPONENT;
   COMPONENT arbiterControl
   PORT (
      D_ACCESS   : IN     STD_LOGIC ;
      I_ACCESS   : IN     STD_LOGIC ;
      PM_MRESP_H : IN     STD_LOGIC ;
      clk        : IN     std_logic ;
      reset_l    : IN     std_logic ;
      sel        : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT waySelecter
   PORT (
      a   : IN     lc3b_oword ;
      b   : IN     lc3b_oword ;
      sel : IN     std_logic ;
      f   : OUT    lc3b_oword 
   );
   END COMPONENT;
   COMPONENT MUX2_1
   PORT (
      A   : IN     STD_LOGIC ;
      B   : IN     STD_LOGIC ;
      SEL : IN     STD_LOGIC ;
      F   : OUT    STD_LOGIC 
   );
   END COMPONENT;
   COMPONENT MUX2_16
   PORT (
      A   : IN     LC3B_WORD ;
      B   : IN     LC3B_WORD ;
      SEL : IN     STD_LOGIC ;
      F   : OUT    LC3B_WORD 
   );
   END COMPONENT;
   COMPONENT NAND2
   PORT (
      A : IN     STD_LOGIC ;
      B : IN     STD_LOGIC ;
      F : OUT    STD_LOGIC 
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : DEMUX2_1 USE ENTITY ece411.DEMUX2_1;
   FOR ALL : DEMUX2_128 USE ENTITY ece411.DEMUX2_128;
   FOR ALL : MUX2_1 USE ENTITY mp3lib.MUX2_1;
   FOR ALL : MUX2_16 USE ENTITY mp3lib.MUX2_16;
   FOR ALL : NAND2 USE ENTITY mp3lib.NAND2;
   FOR ALL : arbiterControl USE ENTITY ece411.arbiterControl;
   FOR ALL : waySelecter USE ENTITY ece411.waySelecter;
   -- pragma synthesis_on


BEGIN

   -- Instance port mappings.
   PM_MRESP_SEL : DEMUX2_1
      PORT MAP (
         DataIN => PM_MRESP_H,
         sel    => sel,
         A      => D_PMRESP_H,
         B      => I_PMRESP_H
      );
   PM_DATAOUT_SEL : DEMUX2_128
      PORT MAP (
         DataIN => PM_DATAOUT,
         sel    => sel,
         A      => D_WDATA,
         B      => I_WDATA
      );
   theArbiterControl : arbiterControl
      PORT MAP (
         D_ACCESS   => D_ACCESS,
         I_ACCESS   => I_ACCESS,
         PM_MRESP_H => PM_MRESP_H,
         clk        => clk,
         reset_l    => reset_l,
         sel        => sel
      );
   U_0 : waySelecter
      PORT MAP (
         a   => D_PMDATAOUT,
         b   => I_PMDATAOUT,
         sel => sel,
         f   => PM_DATAIN
      );
   PM_READ_SEL : MUX2_1
      PORT MAP (
         A   => D_PMREAD_L,
         B   => I_PMREAD_L,
         SEL => sel,
         F   => PM_MREAD_L
      );
   PM_WRITE_SEL : MUX2_1
      PORT MAP (
         A   => D_PMWRITE_L,
         B   => I_PMWRITE_L,
         SEL => sel,
         F   => PM_MWRITE_L
      );
   PM_ADDR_SEL : MUX2_16
      PORT MAP (
         A   => D_PMADDRESS,
         B   => I_PMADDRESS,
         SEL => sel,
         F   => PM_ADDRESS
      );
   U_1 : NAND2
      PORT MAP (
         A => I_PMWRITE_L,
         B => I_PMREAD_L,
         F => I_ACCESS
      );
   U_2 : NAND2
      PORT MAP (
         A => D_PMWRITE_L,
         B => D_PMREAD_L,
         F => D_ACCESS
      );

END struct;
