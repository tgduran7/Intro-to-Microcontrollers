; XORs two inputs from PORTA and PORTC and displays it onto PORTB
; Displays the Zero Flag on PORTE bit 1
#include <P18F4620.inc>

config OSC = INTIO67
config WDT = OFF
config LVP = OFF
config BOREN = OFF

ORG 0x0000 
    
START:
    MOVLW 0x0F		    ; Load W with 0x0F
    MOVWF ADCON1	    ; Make ADCON1 to be all digital
    
    MOVLW 0xFF		    ; Load W with 0xFF
    MOVWF TRISA		    ; Set PORT A as all inputs
    
    MOVLW 0x00		    ; Load W with 0x00
    MOVWF TRISB		    ; Make PORT B as outputs
    
    MOVLW 0xFF		    ; Load W with 0xFF
    MOVWF TRISC		    ; Make PORT C as inputs
    
    MOVLW 0x07		    ; Load W with 0x07
    MOVWF TRISD		    ; Make PORT D2, D1, D0 as inputs & D7, D6, D5 as outputs
    
    MOVLW 0x00		    ; Load W with 0x00
    MOVWF TRISE		    ; Make PORT E as outputs

    Input_A EQU 0x50	    ; Declare Input_A in memory location 0x50
    Input_C EQU 0x51	    ; Declare Input_C in memory location 0x51
    Result  EQU 0x52	    ; Declare Result in memory location 0x52
  
MAIN_LOOP:		    ; Start of While LOOP
    MOVF PORTA, W	    ; Move PORTA into WREG
    ANDLW 0x0F		    ; Mask the lower 4 bits and store into WREG
    MOVWF Input_A	    ; Move masked WREG into Input_A
    
    MOVF PORTC, W	    ; Move PORTC into WREG
    ANDLW 0x0F		    ; Mask the lower 4 bits and store into WREG
    MOVWF Input_C	    ; Move masked WREG into Input_C
    
    XORWF Input_A,0	    ; Add the WREG(has contents of Input_C) with Input_A and store into WREG
    
    MOVWF Result	    ; Move the WREG into Result
    MOVFF Result, PORTB	    ; Move the Result into PORTB
    
    BZ CHECK_Z		    ; Check if Zero Flag equals to 1
    BCF PORTE,1		    ; If Zero Flag is 0, (WREG != 0) then set PORTE bit 1 to 1
    GOTO JUMP		    ; After clearing PORTE, go to JUMP
    
CHECK_Z:		    
    BSF PORTE,1		    ; If Zero Flag is 1, (WREG = 0) then set PORTE bit 1 to 1

JUMP:
    GOTO MAIN_LOOP	    ; Loop forever
    END


