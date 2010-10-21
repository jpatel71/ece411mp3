;; Tom Murray
;;
;; testShf.asm
;; This file test the functionality of SHF instruction


SEGMENT  CodeSegment:
	;; R0 is assumed to contain zero, because of the construction
	;;    of the register file.  (After reset, all registers contain
	;;    zero.)

;Initialize constants
    LDR   R1, R0, ONE
    LDR   R2, R0, MINUS_ONE
    LDR   R3, R0, NEGATIVE


    LSHF  R4, R1, 3 	; R4 <- R1 << 3 = 8
    RSHFL R5, R2, 8 	; R5 <- R2 >> 8,0 = 0x00FF
    RSHFA R6, R2, 8 	; R6 <- R2 >> 8,R2[15] = 0xFFFF
    RSHFA R7, R3, 3	; R7 <- R1 >> 1,R3[15] = 0xF000

HALT:				; Infinite loop to keep the processor
    BRnzp HALT			; from trying to execute the data below
				; Your own programs should also make use
				; of an infinite loop at the end.

ONE:		DATA2 4x0001
MINUS_ONE:	DATA2 4xFFFF
NEGATIVE:	DATA2 4x8000
