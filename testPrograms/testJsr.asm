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


    LDR  R1, R0, ONE   ;0

    JSR  JSR_TEST      ;2

    LDR  R3, R0, JUMP_LENGTH    ;4
    JSRR R3  			;6
HALT:				; Infinite loop to keep the processor
    BRnzp HALT			;8 from trying to execute the data below
				; Your own programs should also make use
				; of an infinite loop at the end.
    ADD R1,R1,7 ;10
    ADD R1,R1,6
    ADD R1,R1,5
    ADD R1,R1,4
    ADD R1,R1,3
    ADD R1,R1,2
    ADD R1,R1,1   ;22
    ;; first jump to here hopefully
JSR_TEST:
    LDR  R2, R0, ONE   ;24
    ADD  R5, R0, 5
    RET

    ;; then jump to here maybe
    LDR  R4, R0, ONE
    ADD  R5, R0, 6
    RET

ONE:		DATA2 4x0001
JUMP_LENGTH:	DATA2 4x0024
