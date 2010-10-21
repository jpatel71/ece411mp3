;; Tom Murray
;;
;; testShf.asm
;; This file test the functionality of TRAP instruction


SEGMENT  CodeSegment:
	;; R0 is assumed to contain zero, because of the construction
	;;    of the register file.  (After reset, all registers contain
	;;    zero.)

    LDR R1, R0, ONE

    TRAP cagey

HALT:				; Infinite loop to keep the processor
    BRnzp HALT			; from trying to execute the data below
				; Your own programs should also make use
				; of an infinite loop at the end.

; Insert NO Ops
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
    ADD  R0, R0, R0

cagey:  DATA2 Weasel

; Insert NO Ops
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
    ADD  R0, R0, R0



Weasel:
    ADD  R3, R1, R0
    RET


ONE:		DATA2 4x0001
