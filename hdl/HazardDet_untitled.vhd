--
-- VHDL Architecture ece411.HazardDet.untitled
--
-- Created:
--          by - bjohns38.stdt (eelnx29.ews.illinois.edu)
--          at - 18:14:15 11/07/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.NUMERIC_STD.all;
USE ieee.std_logic_1164.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY HazardDet IS
   PORT( 
      IR8_6_ID       : IN     LC3B_REG;
      IR_2_0_ID      : IN     STD_LOGIC_VECTOR (2 DOWNTO 0);
      SRCA_EX        : IN     std_logic;
      SRCB_EX        : IN     std_logic;
      clk            : IN     std_logic;
      DESTREG_EX     : IN     lc3b_reg;
      Hazard         : OUT    std_logic;
      Opcode_EX      : IN     lc3b_opcode;
      Opcode_ID      : IN     LC3B_Opcode;
      destreg_MEM    : IN     LC3B_REG;
      dest           : IN     LC3B_REG;
      DestValid_MEM  : IN     std_logic;
      DestValid_EX   : IN     std_logic;
      destValid_WB   : IN     std_logic;
      SRCAValid      : IN     std_logic;
      Dest_ID        : IN     LC3b_reg;
      BRANCHLOAD_MEM : IN     std_logic
   );

-- Declarations

END HazardDet ;

--
ARCHITECTURE untitled OF HazardDet IS
BEGIN
  PROCESS(IR8_6_ID,IR_2_0_ID,SRCA_EX,SRCB_EX,Opcode_EX,DESTREG_EX,DESTREG_MEM,DEST,clk)
    BEGIN
      Hazard<='0';
      --check 8_6 versus every stage
      IF(SRCAValid='1') then
        IF(DESTREG_EX=IR8_6_ID AND DestValid_EX = '1') then 
          Hazard <= '1' after 1 ns;
        end if;
        IF(DESTREG_MEM=IR8_6_ID AND DestValid_MEM = '1') then 
          Hazard <= '1' after 1 ns;
        end if;
        IF(DEST=IR8_6_ID AND DestValid_WB = '1' and SRCAValid='1') then 
          Hazard <= '1' after 1 ns;
        end if;
      end if;
      
      if(Opcode_ID=op_STB or Opcode_ID=op_STR or Opcode_ID=op_STI) then
        --check 11_9 if store versus every stage
        IF(DESTREG_EX=Dest_ID AND DestValid_EX = '1') then 
          Hazard <= '1' after 1 ns;
        end if;
        IF(DESTREG_MEM=Dest_ID AND DestValid_MEM = '1') then 
          Hazard <= '1' after 1 ns;
        end if;
        IF(DEST=Dest_ID AND DestValid_WB = '1') then 
          Hazard <= '1' after 1 ns;
        end if;
      end if;

    
END PROCESS;
END ARCHITECTURE untitled;
