--
-- VHDL Architecture ece411.LoadPC.untitled
--
-- Created:
--          by - bjohns38.stdt (gllnx14.ews.illinois.edu)
--          at - 15:07:19 11/08/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.NUMERIC_STD.all;
USE ieee.std_logic_1164.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY LoadPC IS
   PORT( 
      Hazard  : IN     std_logic;
      clk     : IN     std_logic;
      load1   : OUT    std_logic;
      load    : IN     std_logic;
      JSR_MEM : IN     std_logic
   );

-- Declarations

END LoadPC ;

--
ARCHITECTURE untitled OF LoadPC IS
BEGIN
  PROCESS (load, Hazard, JSR_MEM)
    Begin
    if(load='1' and Hazard='0') then
      load1 <='1';
    else
      load1 <= '0';
    end if;
  END PROCESS;
END ARCHITECTURE untitled;

