;; Tom Murray
;;
;; factorial.asm
;; This file computes 5!


SEGMENT  CodeSegment:
	;; R0 is assumed to contain zero, because of the construction
	;;    of the register file.  (After reset, all registers contain
	;;    zero.)

	;; R1 holds -1
	;; R2 holds factorial variable
	;; R3 holds number of multiplications left to do
	;; R4 holds number of additions left to do
	;; R5 holds the sum

;;Initialize constants
    LDR  R1, R0, MINUS_ONE
    LDR  R2, R0, VARIABLE
    ADD  R3, R2, R1		; number of multiplications remaining
    BRnz RESULT			; checking for 1, 0, or negative variable
    ADD  R4, R0, R3    

;;Inside loop that computes multiplication through addition 
MULTIPLICATION_LOOP:
    ADD  R5, R5, R2		; R5 holds the sum
    ADD  R4, R4, R1		; number of additions remaining
    BRnz FACTORIAL_LOOP		; completed multiplication
    BRnzp MULTIPLICATION_LOOP

;;Outside loop that updates the two variables that need to be multiplied
FACTORIAL_LOOP:
    ADD  R2, R0, R5
    ADD  R3, R3, R1		; number of multiplications remaining
    ADD  R4, R0, R3
    ADD  R4, R4, R1
    BRp  MULTIPLICATION_LOOP

RESULT:				; R5 holds the result
    STR  R5, R0, ANSWER

HALT:				; Infinite loop to keep the processor
    BRnzp HALT			; from trying to execute the data below
				; Your own programs should also make use
				; of an infinite loop at the end.

VARIABLE:	DATA2 4x0005
MINUS_ONE:	DATA2 4xFFFF
ANSWER:		DATA2 4x0000
