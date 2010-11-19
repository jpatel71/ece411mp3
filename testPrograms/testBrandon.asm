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


    ADD R1, R0, 1   ;0    

    BRNZP  br1      ;2
    ADD R7,R7,7 ;8
    ADD R7,R7,6
    ADD R7,R7,5
    ADD R7,R7,4

Back:
    ADD r2,r0,1    ;4

HALT:
    ADD r6,r6,2		;6	; Infinite loop to keep the processor
    BRnzp HALT			;8 from trying to execute the data below
				; Your own programs should also make use
				; of an infinite loop at the end.
    ADD R4,R4,7 ;8
    ADD R4,R4,6
    ADD R4,R4,5
    ADD R4,R4,4
    ADD R4,R4,3
    ADD R4,R4,2
    ADD R4,R4,1   ;20
    ;; first jump to here hopefully
br1:
    ADD  R5, R0, 5 ;22
    BRNZP Back
