;; Tom Murray
;;
;; testJmp.asm
;; This file test the functionality of JMP as well as RET


SEGMENT  CodeSegment:
	;; R0 is assumed to contain zero, because of the construction
	;;    of the register file.  (After reset, all registers contain
	;;    zero.)

	;; R1 holds one
	;; R2 holds one
	;; R3 holds place to jump to
	;; R7 holds return address 


    LDR  R1, R0, ONE
    
    LDR  R3, R0, JUMP_LENGTH
    JMP  R3

HALT:				; Infinite loop to keep the processor
    BRnzp HALT			; from trying to execute the data below
				; Your own programs should also make use
				; of an infinite loop at the end.

    ;; adding no ops
    ADD  R0, R0, R0
    ADD  R0, R0, R0
    ADD  R0, R0, R0
    ADD  R0, R0, R0
    ADD  R0, R0, R0
    ADD  R0, R0, R0
    ADD  R0, R0, R0
    ADD  R0, R0, R0
    ADD  R0, R0, R0
    ADD  R0, R0, R0

    ;; jump to here hopefully
    LDR  R2, R0, ONE
    LDR  R7, R0, RET_LENGTH
    RET

ONE:		DATA2 4x0001
JUMP_LENGTH:	DATA2 4x001D
RET_LENGTH:	DATA2 4x0006