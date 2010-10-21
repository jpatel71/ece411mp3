;; Tom Murray
;;
;; testJsr.asm
;; This file test the functionality of JSR and JSRR as well as RET


SEGMENT  CodeSegment:
	;; R0 is assumed to contain zero, because of the construction
	;;    of the register file.  (After reset, all registers contain
	;;    zero.)

	;; R1 holds one
	;; R2 holds one
	;; R3 holds place to jsrr to
	;; R7 holds return address 


    LDR  R1, R0, ONE
    
    JSR  JSR_TEST

    LDR  R3, R0, JUMP_LENGTH
    JSRR R3
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

    ;; first jump to here hopefully
JSR_TEST:
    LDR  R2, R0, ONE
    RET

    ;; then jump to here maybe
    LDR  R4, R0, ONE
    RET

ONE:		DATA2 4x0001
JUMP_LENGTH:	DATA2 4x0023
