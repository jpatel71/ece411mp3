;; Tom Murray
;;
;; testAdd.asm
;; This file test the add reg and add imm5 instructions


SEGMENT  CodeSegment:
	;; R0 is assumed to contain zero, because of the construction
	;;    of the register file.  (After reset, all registers contain
	;;    zero.)

	;; R1 holds 1
	;; R2 holds 2
	;; R3 holds 1 + 2 = 3 then -1 + -2 = -3 (0xFFFD)
	;; R4 holds 3 + 1 = 4 then -3 + -1 = -4 (OXFFFC)
	;; R6 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;Positve input tests
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;Initialize constants
    LDR  R1, R0, ONE
    LDR  R2, R0, TWO

;;Test Add reg
    ADD  R3, R2, R1    

;;Test Add imm5
    ADD  R4, R3, 1

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;Negative input tests
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;Initialize constants
    LDR  R1, R0, MINUS_ONE
    LDR  R2, R0, MINUS_TWO

;;Test Add reg
    ADD  R3, R2, R1

;;Test Add imm5
    ADD  R4, R3, -1


HALT:				; Infinite loop to keep the processor
    BRnzp HALT			; from trying to execute the data below
				; Your own programs should also make use
				; of an infinite loop at the end.

ONE:		DATA2 4x0001
TWO:		DATA2 4x0002
MINUS_ONE:	DATA2 4xFFFF
MINUS_TWO:	DATA2 4xFFFE
