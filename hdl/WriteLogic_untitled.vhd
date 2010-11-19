--
-- VHDL Architecture ece411.WriteLogic.untitled
--
-- Created:
--          by - bjohns38.stdt (gllnx19.ews.illinois.edu)
--          at - 00:01:17 10/22/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.NUMERIC_STD.all;
USE ieee.std_logic_1164.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY WriteLogic IS
   PORT( 
      D_ADDRESSOut : IN     LC3b_word;
      clk          : IN     std_logic;
      opcode_mem   : IN     lc3b_opcode;
      D_MWRITEH_L  : OUT    std_logic;
      D_MWRITEL_L  : OUT    std_logic
   );

-- Declarations

END WriteLogic ;

--
ARCHITECTURE untitled OF WriteLogic IS
BEGIN
  PROCESS(opcode_MEM, D_ADDRESSOut, clk)
  BEGIN
    if(opcode_MEM = op_str) then
      D_MWRITEH_L <= '0' after 1ns;
      D_MWRITEL_L <= '0' after 1ns;
    elsif(opcode_MEM = op_stb) then
      if(D_ADDRESSOut(0)='1') then
        D_MWRITEH_L <= '0' after 1ns;
        D_MWRITEL_L <= '1' after 1ns;
      else   
        D_MWRITEH_L <= '1' after 1ns;
        D_MWRITEL_L <= '0' after 1ns; 
      end if;    
    else
      D_MWRITEH_L <= '1' after 1ns;
      D_MWRITEL_L <= '1' after 1ns;
    END IF;
  END PROCESS;
END ARCHITECTURE untitled;

