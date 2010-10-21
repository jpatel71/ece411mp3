
SEGMENT  CodeSegment:
	;; R0 is assumed to contain zero, because of the construction
	;;    of the register file.  (After reset, all registers contain
	;;    zero.)

	;; R1 holds -1
	;; R2 holds factorial variable
	;; R3 holds number of multiplications left to do
	;; R4 holds number of additions left to do

    LDR  R1, R0, MINUS_ONE
    LDR  R2, R0, VARIABLE
    ADD  R3, R2, R1		; number of multiplications remaining
    BRnz RESULT			; checking for 1, 0, or negative variable
    ADD  R4, R0, R3    

MULTIPLICATION_LOOP:
    ADD  R4, R4, R1		; number of additions remaining
    BRnz FACTORIAL_LOOP		; completed multiplication
    ADD  R2, R2, R2		; R2 holds the sum
    BRnzp MULTIPLICATION_LOOP

FACTORIAL_LOOP:
    ADD  R3, R3, R1		; number of multiplications remaining
    BRp  MULTIPLICATION_LOOP

RESULT:				; R2 holds the result
    STR  R2, R0, ANSWER

HALT:				; Infinite loop to keep the processor
    BRnzp HALT			; from trying to execute the data below.
				; Your own programs should also make use
				; of an infinite loop at the end.

VARIABLE:	DATA2 4x0005
ONE:		DATA2 4x0001
MINUS_ONE:	DATA2 4xFFFF
ANSWER:		DATA2 4x0000
