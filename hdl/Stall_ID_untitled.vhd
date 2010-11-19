--
-- VHDL Architecture ece411.Stall_ID.untitled
--
-- Created:
--          by - bjohns38.stdt (eelnx26.ews.illinois.edu)
--          at - 16:03:52 11/10/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.NUMERIC_STD.all;
USE ieee.std_logic_1164.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY Stall_ID IS
   PORT( 
      BRANCHLOAD_MEM : IN     std_logic;
      Hazard         : IN     std_logic;
      JSR_EX         : IN     std_logic;
      JSR_ID         : IN     std_logic;
      JSR_MEM        : IN     std_logic;
      clk            : IN     std_logic;
      load           : IN     std_logic;
      RESET_ID       : OUT    std_logic;
      load_ID        : OUT    std_logic
   );

-- Declarations

END Stall_ID ;

--
ARCHITECTURE untitled OF Stall_ID IS
BEGIN
  PROCESS(load, clk, Hazard, JSR_ID, BRANCHLOAD_MEM, JSR_EX)
    BEGIN
      load_ID<='0';
      reset_ID<='0';
      if(load='1' AND Hazard='0' and JSR_ID='0' and JSR_EX='0' and JSR_MEM='0') then
        load_ID<='1';
      end if;
      if(load='1' and Hazard='0' and  JSR_ID='1') then
        reset_ID<='1' after 3ns;
      end if;
      if(BRANCHLOAD_MEM='1') then
        reset_ID<='1' after 3ns;
      end if;
       
  END PROCESS;
END ARCHITECTURE untitled;

