;; Tom Murray
;;
;; testLeaNot.asm
;; This file test the functionality of LEA and NOT instruction


SEGMENT  CodeSegment:
	;; R0 is assumed to contain zero, because of the construction
	;;    of the register file.  (After reset, all registers contain
	;;    zero.)

	;; R1 holds 4 because PC = 2 + (1 << 1 = 2) = 4
	;; R2 holds not(0x0004) = 0xFFFB


    LEA  R1, 1
    NOT  R2, R1
    
HALT:				; Infinite loop to keep the processor
    BRnzp HALT			; from trying to execute the data below
				; Your own programs should also make use
				; of an infinite loop at the end.
