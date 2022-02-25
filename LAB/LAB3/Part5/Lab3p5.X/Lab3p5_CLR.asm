#include <P18F4620.inc>
config OSC = INTIO67
config WDT = OFF
config LVP = OFF
config BOREN = OFF

Delay1 equ 0xFF
Delay2 equ 0xFF
 
ORG 0x0000
    
			    ; CODE STARTS FROM THE NEXT LINE
START:
    ORG 0x0000
    
START:
    MOVLW 0x0F		    ; Load W with 0x0F
    MOVWF ADCON1	    ; Make ADCON1 to be all digital
    
    MOVLW 0x00		    ; Load W with 0x00
    MOVWF TRISC		    ; Make PORT C as outputs
    
    MOVLW 0x00		    ; Load W with 0x00
    MOVWF TRISD		    ; Make PORT D as outputs
    
MAIN_LOOP:		    ; start of While LOOP
    MOVLW 0x00		    ; load W with 0
    MOVWF 0x20		    ; store W to location 0x20
    MOVLW 0x08		    ; load W with 08
    MOVWF 0x21		    ; store W to location 0x21
    
			    ; Beginning of Array Initialization
    
    MOVLW 0x81		    ; Load 81 into W
    MOVWF 0x50		    ; Move 81 into address 50
    
    MOVLW 0xC7		    ; Load C7 into W
    MOVWF 0x51		    ; Move C7 into address 51
    
    MOVLW 0x43		    ; Load 43 into W
    MOVWF 0x52		    ; Move 43 into address 52
    
    MOVLW 0x64		    ; Load 64 into W
    MOVWF 0x53		    ; Move 64 into address 53
    
    MOVLW 0x02		    ; Load 02 into W
    MOVWF 0x54		    ; Move 02 into address 54
    
    MOVLW 0xE6		    ; Load E6 into W
    MOVWF 0x55		    ; Move E6 into address 55
    
    MOVLW 0xA5		    ; Load A5 into W
    MOVWF 0x56		    ; Move A5 into address 56
    
    MOVLW 0x20		    ; Load 20 into W
    MOVWF 0x57		    ; Move 20 into address 57
    
			    ; End of Array Intialization
    
    LFSR 0, 0x0050	    ; Initialize LFSR0 starting at address 50
    
FOR_LOOP:
    MOVF 0x20,W		    ; read content of 0x20 into W
    MOVWF PORTC		    ; output W to PORT C
    
    
    MOVF INDF0, W	    ; Move address pointing at LFSR0 into W
    MOVWF PORTD		    ; Move value from W into PORTD address
    
    
    CALL DELAY_ONE_SEC	    ; wait one sec
    
    CLRF POSTINC0	    ; Clear data in the LFSR memory address, then increment by 1
    INCF 0x20,F		    ; increment location 0x20 by 1
    DECF 0x21,F		    ; decrement location 0x21 by 1
    
    
    BNZ FOR_LOOP	    ; if not equal, then (0x21) not equal to 0
    
			    ; go back to FOR_LOOP
    GOTO MAIN_LOOP	    ; go back to While LOOP
    
DELAY_ONE_SEC:
    MOVLW Delay1	    ; Load constant Delay1 into W
    MOVWF 0x28		    ; Load W to memory 0x21
    
LOOP_1_OUTER:
    NOP			    ; Do nothing
    MOVLW Delay2	    ; Load constant Delay2 into W
    MOVWF 0x29		    ; Load W to memory 0x29
    
LOOP_1_INNER:
    NOP			    ; Do nothing
    DECF 0x29,F		    ; Decrement memory location 0x20
    BNZ LOOP_1_INNER	    ; If value not zero, go back to
    
    DECF 0x28,F		    ; Decrement memory location 0x28
    BNZ LOOP_1_OUTER	    ; If value not zero, go back to
    RETURN
    
    END    



