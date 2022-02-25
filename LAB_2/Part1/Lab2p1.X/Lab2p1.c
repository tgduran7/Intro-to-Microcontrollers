#include <stdio.h>
#include <stdlib.h>
#include <xc.h>
#include <math.h>
#include <p18f4620.h>
#include <usart.h>

#pragma config OSC = INTIO67
#pragma config BOREN = OFF
#pragma config WDT = OFF
#pragma config LVP = OFF
#pragma config CCP2MX = PORTBE

void main()
{
    char in;                // Use variable ?in? as char
    
    TRISA = 0xFF;           // Initialize TRISA as an INPUT
    TRISB = 0x00;           // Initialize TRISB as an OUTPUT
    
    ADCON1 = 0x0F;          // Set the ADC as all Digital
    
    while (1)
    {
        in = PORTA;         // read data from PORTA and save it into ?in?
                            
        in = in & 0x0F;     // Mask out the unused upper four bits
        PORTB = in;         // Output the data to PORTB
    }
}
