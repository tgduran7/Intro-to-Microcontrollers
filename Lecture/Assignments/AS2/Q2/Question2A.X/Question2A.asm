#include <XC.INC>

PSECT	Subtraction
DIFF	EQU 0x50
	ORG 0x100
	MOVLW	0xA7	; Dec = 06, Move literal value into working register (Opcode / Operand), WREG equal 0x06
	SUBLW	0xA7	; Dec = 14, WREG will equal 1A
	MOVWF	DIFF	; Sum = 26 = 0x1A, Move SUM from Working Reg to File Reg
HERE:	BRA HERE
	; Carry	    0 0000 100
	;   0x06    = 0000 0110
	;   +0x14   = 0001 0100
	; Sum	    = 0001 1010 = 0x1A = 26
	;		 S 0ZDC
	; Status    = 0000 0000
	END





