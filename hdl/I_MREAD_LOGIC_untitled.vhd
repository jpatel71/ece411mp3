--
-- VHDL Architecture ece411.I_MREAD_LOGIC.untitled
--
-- Created:
--          by - tmurray5.stdt (eelnx25.ews.illinois.edu)
--          at - 22:36:18 10/28/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.NUMERIC_STD.all;
USE ieee.std_logic_1164.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY I_MREAD_LOGIC IS
   PORT( 
      clk       : IN     std_logic;
      I_MREAD_Lin : IN     std_logic;
      RESET_L   : IN     std_logic;
      loadin      : IN     std_logic;
      I_MRESP_H : IN     std_logic;
      load      : OUT    std_logic;
      I_MREAD_L : OUT    std_logic
   );

-- Declarations

END I_MREAD_LOGIC ;

--
ARCHITECTURE untitled OF I_MREAD_LOGIC IS
BEGIN
  PROCESS(RESET_L, CLK, I_MREAD_Lin, loadin, I_MRESP_H)
  BEGIN
    IF (RESET_L = '0') THEN
      I_MREAD_L <= '0';
      load <= '0';
    ELSE
      IF(CLK'EVENT AND CLK = '1') THEN
        IF(I_MREAD_Lin = '1' and loadin = '1') THEN
          I_MREAD_L <= '0';
          load <= '0';
        ELSE
          IF(I_MRESP_H = '1') THEN
            I_MREAD_L <= '1';
            load <= '1';
          ELSE
            I_MREAD_L <= '0';
            load <= '0';
          END IF;
        END IF;
      ELSE
       I_MREAD_L <= I_MREAD_Lin;
       load <= loadin;
      END IF;
    END IF;
  END PROCESS;
END ARCHITECTURE untitled;

