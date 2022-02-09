#include <stdio.h>
#include <stdlib.h>
#include <xc.h>
#include <math.h>
#include <p18f4620.h>

#pragma config OSC = INTIO67
#pragma config WDT = OFF
#pragma config LVP = OFF
#pragma config BOREN = OFF

void main()
{
    char in;                // Use variable ?in? as char
    char in1;               // Use variable ?in1? as char
    
    TRISA = 0xFF;           // fill out the ?? with the proper values, INPUT
    TRISB = 0x00;           // fill out the ?? with the proper values, OUTPUT
    TRISC = 0x00;           // fill out the ?? with the proper values, OUTPUT
    
    ADCON1 = 0x0F;          // fill out the ?? with the proper values
    
    while (1)
    {
        in = PORTA;         // read data from PORTA and save it
        // into ?in?
        in = in & 0x0F;     // Mask out the unused upper four bits
        PORTB = in;         // Output the data to PORTB
        
        in1 = PORTA;         // read data from PORTA and save it
        // into ?in?
        in1 = in1 & 0x07;     // Mask out the unused upper five bits
        PORTC = in1;         // Output the data to PORTC
    }
    
}
