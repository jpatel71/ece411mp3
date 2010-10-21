;; Tom Murray
;;
;; testAnd.asm
;; This file test the add reg and add imm5 instructions


SEGMENT  CodeSegment:
	;; R0 is assumed to contain zero, because of the construction
	;;    of the register file.  (After reset, all registers contain
	;;    zero.)

	;; R1 holds 0x0001
	;; R2 holds 0x00FF
	;; R3 holds 1 & 0x000F = 1 then 0xFFF0 & 0x000F = 0
	;; R4 holds 0x0001 & 0x000F = 1 then 0xFFF0 & 0x000F = 0 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;Successful AND
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;Initialize constants
    LDR  R1, R0, ONE
    LDR  R2, R0, BIT_MASK

;;Test Add reg
    AND  R3, R2, R1    

;;Test Add imm5
    AND  R4, R3, 15

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;Unsuccessful AND
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;Initialize constants
    LDR  R1, R0, BIT_MASK
    LDR  R2, R0, BIT_MASK2

;;Test Add reg
    AND  R3, R2, R1

;;Test Add imm5
    AND  R4, R2, 15 


HALT:				; Infinite loop to keep the processor
    BRnzp HALT			; from trying to execute the data below
				; Your own programs should also make use
				; of an infinite loop at the end.

ONE:		DATA2 4x0001
BIT_MASK:	DATA2 4x000F
BIT_MASK2:	DATA2 4xFFF0
