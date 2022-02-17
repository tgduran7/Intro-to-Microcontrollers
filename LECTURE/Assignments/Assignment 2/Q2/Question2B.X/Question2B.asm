#include <XC.INC>

PSECT	Addition
SUM	EQU 0x50
	ORG 0x100
	MOVLW	0x6E	; Dec = 06, Move literal value into working register (Opcode / Operand), WREG equal 0x06
	ADDLW	0x3B	; Dec = 14, WREG will equal 1A
	MOVWF	SUM	; Sum = 26 = 0x1A, Move SUM from Working Reg to File Reg
HERE:	BRA HERE
	; Carry	    0 0000 100
	;   0x06    = 0000 0110
	;   +0x14   = 0001 0100
	; Sum	    = 0001 1010 = 0x1A = 26
	;		 S 0ZDC
	; Status    = 0000 0000
	END





