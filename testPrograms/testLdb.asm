;; Tom Murray
;;
;; testLdb.asm
;; This file test the functionality of LDB and STB instructions


SEGMENT  CodeSegment:

    LDB  R6, R0, LowByte	;0
    	;MAR <= 8
        ;MDR <= (M[8] = 4x600D)
	;R6 <= 4x00 & 4x0D
    LDB  R7, R0, HighByte 	;2
	;MAR <= 8 or 9
	;MDR <= (M[8] = 4x600D)
	;R7 <= 4x00 & 4x60
    STB  R6, R0, LowSByte	;4
    	;MAR <= 10
        ;MDR <= 4xXX & (R6(7:0) = 4x0D)
	;M[10] = 4x0D
    STB  R7, R0, HighSByte	;6
    	;MAR <= 10 or 11
        ;MDR <= (R7(7:0) = 4x60) & 4xXX
	;*only* MWRITEH_L is active (=0).
	;M[11] = 4x60
Halt:
    BRnzp Halt		;8

    LowByte: Data1 4x0D ;9
    HighByte: Data1 4x60 ;10
    LowSByte: Data1 4xAA	;11
    HighSByte: Data1 4xBB ;12


