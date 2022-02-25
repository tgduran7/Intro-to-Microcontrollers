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
    TRISC = 0x00;           // Initialize TRSIC as an OUTPUT
    
    ADCON1 = 0x0F;          // Set the ADC to all DIGITAL
    
    while (1)
    {
        in = PORTA;         // read data from PORTA and save it into ?in?
                            
        in = in & 0x07;     // Mask out the unused upper five bits
        PORTC = in;         // Output the data to PORTC
    }
    
}
