-- VHDL Entity ece411.D_Mapped_Cache_Controller.interface
--
-- Created:
--          by - bjohns38.stdt (gllnx4.ews.illinois.edu)
--          at - 01:24:16 11/12/10
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.NUMERIC_STD.all;
USE ieee.std_logic_1164.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY D_Mapped_Cache_Controller IS
   PORT( 
      PMRESP_H     : IN     std_logic;
      clk          : IN     std_logic;
      dirty        : IN     std_logic;
      miss         : IN     STD_LOGIC;
      reset_l      : IN     std_logic;
      PMREAD_L     : OUT    std_logic;
      PMWRITE_L    : OUT    std_logic;
      in_idleHit   : OUT    STD_LOGIC;
      in_load      : OUT    std_logic;
      in_writeBack : OUT    STD_LOGIC
   );

-- Declarations

END D_Mapped_Cache_Controller ;

--
-- VHDL Architecture ece411.D_Mapped_Cache_Controller.fsm
--
-- Created:
--          by - bjohns38.stdt (gllnx4.ews.illinois.edu)
--          at - 01:24:16 11/12/10
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.NUMERIC_STD.all;
USE ieee.std_logic_1164.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;
 
ARCHITECTURE fsm OF D_Mapped_Cache_Controller IS

   TYPE STATE_TYPE IS (
      writeBack,
      IdleHit,
      Load
   );
 
   -- State vector declaration
   ATTRIBUTE state_vector : string;
   ATTRIBUTE state_vector OF fsm : ARCHITECTURE IS "current_state";

   -- Declare current and next state signals
   SIGNAL current_state : STATE_TYPE;
   SIGNAL next_state : STATE_TYPE;

BEGIN

   -----------------------------------------------------------------
   clocked_proc : PROCESS ( 
      clk,
      RESET_L
   )
   -----------------------------------------------------------------
   BEGIN
      IF (RESET_L = '0') THEN
         current_state <= IdleHit;
      ELSIF (clk'EVENT AND clk = '1') THEN
         current_state <= next_state;
      END IF;
   END PROCESS clocked_proc;
 
   -----------------------------------------------------------------
   nextstate_proc : PROCESS ( 
      PMRESP_H,
      current_state,
      dirty,
      miss
   )
   -----------------------------------------------------------------
   BEGIN
      CASE current_state IS
         WHEN writeBack => 
            IF (pmresp_h = '1') THEN 
               next_state <= Load;
            ELSE
               next_state <= writeBack;
            END IF;
         WHEN IdleHit => 
            IF ((miss = '1') and
                (dirty = '1')) THEN 
               next_state <= writeBack;
            ELSIF ((miss = '1') and
                   (dirty = '0')) THEN 
               next_state <= Load;
            ELSE
               next_state <= IdleHit;
            END IF;
         WHEN Load => 
            IF (pmresp_h = '1') THEN 
               next_state <= IdleHit;
            ELSE
               next_state <= Load;
            END IF;
         WHEN OTHERS =>
            next_state <= IdleHit;
      END CASE;
   END PROCESS nextstate_proc;
 
   -----------------------------------------------------------------
   output_proc : PROCESS ( 
      current_state
   )
   -----------------------------------------------------------------
   BEGIN
      -- Default Assignment
      PMREAD_L <= '1';
      PMWRITE_L <= '1';
      in_idleHit <= '0';
      in_load <= '0';
      in_writeBack <= '0';

      -- Combined Actions
      CASE current_state IS
         WHEN writeBack => 
            in_writeBack <= '1';
            pmwrite_l <= '0' after 4ns;
         WHEN IdleHit => 
            in_idleHit <= '1';
         WHEN Load => 
            in_load <= '1';
            pmread_l <= '0' after 4ns;
         WHEN OTHERS =>
            NULL;
      END CASE;
   END PROCESS output_proc;
 
END fsm;
