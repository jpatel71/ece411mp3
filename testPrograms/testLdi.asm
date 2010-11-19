;; Tom Murray
;;
;; testLdi.asm
;; This file test the functionality of LDI and STI instructions


SEGMENT  CodeSegment:

; Test LDI, STI
    ldi r7, r0, MyPointer 
	;PC= 0
	;First load should see 
	;MAR <= 4 ;MDR <=(M[4] =6) 
	;Second load should see 
	;MAR <= 6 
	;MDR <= (M[6] = 4x600D) 
	;R7 <= 4x600D 
    sti r7, r0, MySPointer 
	;PC= 2 ;First load should see 
	;MAR <= 8 
	;MDR <= (M[8] = 4xA) 
	;Second store should see 
	;MAR <= 4xA 
	;MDR <= (R7 = 4x600D) 
	;M[10] <= 4x600D
    ldr r4, r0, 5

Halt:
    BRnzp Halt
 
    MyPointer: DATA2 MyData ;4 
    MyData: DATA2 4x600D ;6 
    MySpointer: DATA2 MySData ;8 
    MySData: DATA2 ? ;10

