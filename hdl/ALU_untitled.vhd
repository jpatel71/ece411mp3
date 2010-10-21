--
-- VHDL Architecture ece411.ALU.untitled
--
-- Created:
--          by - tmurray5.stdt (eelnx33.ews.illinois.edu)
--          at - 15:25:10 08/29/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY ALU IS
   PORT( 
      ALUMuxout : IN     LC3b_word;
      ALUop     : IN     LC3b_aluop;
      RFAout    : IN     LC3b_word;
      ALUout    : OUT    LC3b_word
   );

-- Declarations

END ALU ;

--
ARCHITECTURE UNTITLED OF ALU IS
BEGIN
	----------------------------------------
	VHDL_ALU : PROCESS (RFAOUT, ALUMUXOUT, ALUOP)
	----------------------------------------
	VARIABLE TEMP_ALUOUT : LC3B_WORD;
	VARIABLE COUNT : integer;
	BEGIN
		-- CHECK FOR ALU OPERATION TYPE, AND EXECUTE
		CASE ALUOP IS
			WHEN ALU_ADD =>
				TEMP_ALUOUT := STD_LOGIC_VECTOR(SIGNED(RFAOUT) + SIGNED(ALUMUXOUT));
			WHEN ALU_AND =>
				TEMP_ALUOUT := (RFAOUT AND ALUMUXOUT);
			WHEN ALU_NOT =>
				TEMP_ALUOUT := (RFAOUT XOR "1111111111111111");
			WHEN ALU_PASS =>
				TEMP_ALUOUT := (RFAOUT);
			WHEN ALU_SLL =>
			  TEMP_ALUOUT := LC3B_WORD("sll"(unsigned(RFAout), to_integer(unsigned(ALUMuxout))));
			WHEN ALU_SRL =>
			  TEMP_ALUOUT := LC3B_WORD("srl"(unsigned(RFAout), to_integer(unsigned(ALUMuxout))));
			WHEN ALU_SRA =>
			  COUNT := to_integer(unsigned(ALUMuxout(3 downto 0)));
			  IF (ALUMuxout(3 downto 0) = "0000") then
			    TEMP_ALUOUT := RFAout;
			  ELSE
			    TEMP_ALUOUT(15 - COUNT downto 0) := RFAout(15 downto COUNT);
			    TEMP_ALUOUT(15 downto (15 - COUNT + 1)) := (others => RFAout(15));
			  END IF;
			WHEN OTHERS =>
		END CASE;
	--SET OUTPUT VALUE ALUOUT TO BE THE TEMPORARY VALUE CALCULATED WITHIN THE PROCESS AFTER A DELAY
	ALUOUT <= TEMP_ALUOUT AFTER DELAY_ALU;
	END PROCESS VHDL_ALU;
END UNTITLED;
