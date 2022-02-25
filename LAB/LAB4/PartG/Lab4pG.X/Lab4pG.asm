; Creates SUBROUTINES for the previous ALU operations
; Uses PORTD (2,1,0) to select with operation to do
#include <P18F4620.inc>

config OSC = INTIO67
config WDT = OFF
config LVP = OFF
config BOREN = OFF
    
Input_A EQU 0x50	    ; Initialize Input_A in memory address 0x50
Input_C EQU 0x51	    ; Initialize Input_C in memory address 0x51
Result EQU 0x52		    ; Initialize Result in memory address 0x52

ORG 0x0000
 
START:
    MOVLW 0x0F		    ; Move 0x0F into WREG
    MOVWF ADCON1	    ; Move WREG into ADCON1
    
    MOVLW 0xFF		    ; Move 0xFF into WREG
    MOVWF TRISA		    ; Move WREG into PORTA
    MOVWF TRISC		    ; Move WREG into PORTC
    
    MOVLW 0x00		    ; Move 0x00 into WREG
    MOVWF TRISB		    ; Move WREG into PORTB
    MOVWF TRISE		    ; Move WREG into PORTE
    
    MOVLW 0x07		    ; Move 0x07 into WREG
    MOVWF TRISD		    ; Move WREG into PORTD
    
    MOVLW 0x00		    ; Move 0x00 into WREG
    MOVWF PORTE		    ; Move WREG into PORTE
    
MAIN_LOOP:
    BTFSC PORTD,2	    ; Check if PORTD bit 2 is 0
    GOTO PORTD2EQ1	    ; If bit 2 is 1 go to PORTD2EQ1
    GOTO PORTD2EQ0	    ; If bit 2 is 0 go to PORTD2EQ0

PORTD2EQ1:
    GOTO TASK_BCD	    ; BCD (100)	

PORTD2EQ0:
    BTFSC PORTD,1	    ; PORTD = 0XX
    GOTO PORTD21EQ01	    ; PORTD = 010
    GOTO PORTD21EQ00	    ; PORTD = 000

PORTD21EQ01:
    BTFSC PORTD,0	    ; PORTD = 01X
    GOTO TASK_XOR	    ; XOR (011)
    GOTO TASK_AND	    ; AND (010)
    
PORTD21EQ00:
    BTFSC PORTD,0	    ; PORTD = 00X
    GOTO TASK_ADD	    ; ADD (001)
    GOTO TASK_COMP	    ; COMP (000)

TASK_COMP:
    BCF PORTD,7		    ; Set RGB to CLEAR
    BCF PORTD,6
    BCF PORTD,5
    CALL SUBROUTINE_COMP    ; Call COMP SUBROUTINE
    GOTO MAIN_LOOP	    ; Loop to Main

TASK_ADD:
    BCF PORTD,7		    ; Set RGB to RED
    BCF PORTD,6
    BSF PORTD,5
    CALL SUBROUTINE_ADD	    ; Call ADD SUBROUTINE
    GOTO MAIN_LOOP	    ; Loop to Main
    
TASK_AND:
    BCF PORTD,7		    ; Set RGB to GREEN
    BSF PORTD,6
    BCF PORTD,5
    CALL SUBROUTINE_AND	    ; Call AND SUBROUTINE
    GOTO MAIN_LOOP	    ; Loop to Main
    
TASK_XOR:
    BCF PORTD,7		    ; Set RGB to YELLOW
    BSF PORTD,6
    BSF PORTD,5
    CALL SUBROUTINE_XOR	    ; Call XOR SUBROUTINE
    GOTO MAIN_LOOP	    ; Loop to Main

TASK_BCD:
    BSF PORTD,7		    ; Set RGB to BLUE
    BCF PORTD,6
    BCF PORTD,5
    CALL SUBROUTINE_BCD	    ; Call BCD SUBROUTINE
    GOTO MAIN_LOOP	    ; Loop to Main

SUBROUTINE_COMP:
    MOVF PORTA, W	    ; Move PORTA into WREG
    ANDLW 0x0F		    ; Mask the lower 4 bits and store into WREG
    
    MOVWF Input_A	    ; Move WREG into Input_A
    COMF Input_A,0	    ; 1's Complement Input_A and store in WREG
    ANDLW 0x0F		    ; Mask the lower 4 bits and store in WREG
    
    MOVWF Result	    ; Move the WREG into Result
    MOVFF Result, PORTB	    ; Move the Result into PORTB
    
    BZ CHECK_Z0		    ; Check if Zero Flag equals to 1
    BCF PORTE,1		    ; If Zero Flag is 0, (WREG != 0) then set PORTE bit 1 to 1
    GOTO JUMP0		    ; After clearing PORTE, go to JUMP
    
CHECK_Z0:		    
    BSF PORTE,1		    ; If Zero Flag is 1, (WREG = 0) then set PORTE bit 1 to 1

JUMP0:
    RETURN		    ; Return to TASK_COMP

SUBROUTINE_ADD:
    MOVF PORTA, W	    ; Move PORTA into WREG
    ANDLW 0x0F		    ; Mask the lower 4 bits and store into WREG
    MOVWF Input_A	    ; Move masked WREG into Input_A
    
    MOVF PORTC, W	    ; Move PORTC into WREG
    ANDLW 0x0F		    ; Mask the lower 4 bits and store into WREG
    MOVWF Input_C	    ; Move masked WREG into Input_C
    
    ADDWF Input_A,0	    ; Add the WREG(has contents of Input_C) with Input_A and store into WREG
    
    MOVWF Result	    ; Move the WREG into Result
    MOVFF Result, PORTB	    ; Move the Result into PORTB
    
    BZ CHECK_Z1		    ; Check if Zero Flag equals to 1
    BCF PORTE,1		    ; If Zero Flag is 0, (WREG != 0) then set PORTE bit 1 to 1
    GOTO JUMP1		    ; After clearing PORTE, go to JUMP
    
CHECK_Z1:		    
    BSF PORTE,1		    ; If Zero Flag is 1, (WREG = 0) then set PORTE bit 1 to 1

JUMP1:
    RETURN		    ; Return to TASK_ADD
    
SUBROUTINE_AND:
    MOVF PORTA, W	    ; Move PORTA into WREG
    ANDLW 0x0F		    ; Mask the lower 4 bits and store into WREG
    MOVWF Input_A	    ; Move masked WREG into Input_A
    
    MOVF PORTC, W	    ; Move PORTC into WREG
    ANDLW 0x0F		    ; Mask the lower 4 bits and store into WREG
    MOVWF Input_C	    ; Move masked WREG into Input_C
    
    ANDWF Input_A,0	    ; Add the WREG(has contents of Input_C) with Input_A and store into WREG
    
    MOVWF Result	    ; Move the WREG into Result
    MOVFF Result, PORTB	    ; Move the Result into PORTB
    
    BZ CHECK_Z2		    ; Check if Zero Flag equals to 1
    BCF PORTE,1		    ; If Zero Flag is 0, (WREG != 0) then set PORTE bit 1 to 1
    GOTO JUMP2		    ; After clearing PORTE, go to JUMP
    
CHECK_Z2:		    
    BSF PORTE,1		    ; If Zero Flag is 1, (WREG = 0) then set PORTE bit 1 to 1

JUMP2:
    RETURN		    ; Return to TASK_AND

SUBROUTINE_XOR:
    MOVF PORTA, W	    ; Move PORTA into WREG
    ANDLW 0x0F		    ; Mask the lower 4 bits and store into WREG
    MOVWF Input_A	    ; Move masked WREG into Input_A
    
    MOVF PORTC, W	    ; Move PORTC into WREG
    ANDLW 0x0F		    ; Mask the lower 4 bits and store into WREG
    MOVWF Input_C	    ; Move masked WREG into Input_C
    
    XORWF Input_A,0	    ; Add the WREG(has contents of Input_C) with Input_A and store into WREG
    
    MOVWF Result	    ; Move the WREG into Result
    MOVFF Result, PORTB	    ; Move the Result into PORTB
    
    BZ CHECK_Z3		    ; Check if Zero Flag equals to 1
    BCF PORTE,1		    ; If Zero Flag is 0, (WREG != 0) then set PORTE bit 1 to 1
    GOTO JUMP3		    ; After clearing PORTE, go to JUMP
    
CHECK_Z3:		    
    BSF PORTE,1		    ; If Zero Flag is 1, (WREG = 0) then set PORTE bit 1 to 1

JUMP3:
    RETURN		    ; Return to TASK_XOR
    
SUBROUTINE_BCD:
    MOVF PORTA, W	    ; Move PORTA into WREG
    ANDLW 0x0F		    ; Mask the lower 4 bits and store into WREG
    
    MOVWF Input_A	    ; Move WREG into Input_A
    MOVLW 0x09		    ; Move 0x09 into WREG
    
    CPFSGT Input_A,1	    ; Compare if Input_A is >= WREG
    GOTO NGREATER	    ; If less than or equal to, go to NGREATER
    
    MOVLW 0x06		    ; If greater than 0x09, move 0x06 into WREG
    ADDWF Input_A,0	    ; Add WREG with Input_A and store into WREG
    GOTO L1		    ; Go to Loop 1

NGREATER:
    MOVF Input_A, W	    ; If less than or equal to 0x09, move Input_A into WREG

L1:
    MOVWF Result	    ; Move WREG into Result
    MOVFF Result, PORTB	    ; Move Result into PORTB

    BZ CHECK_Z4		    ; Check if Zero Flag equals to 1
    BCF PORTE,1		    ; If Zero Flag is 0, (WREG != 0) then set PORTE bit 1 to 1
    GOTO JUMP4		    ; After clearing PORTE, go to JUMP
    
CHECK_Z4:		    
    BSF PORTE,1		    ; If Zero Flag is 1, (WREG = 0) then set PORTE bit 1 to 1

JUMP4:
    RETURN		    ; Return to TASK_BCD
    
    END


