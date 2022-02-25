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

void Delay_One_Sec();                   // Start of prototyping area

void main()
{
    char in;
    
    TRISC = 0x00;                       // Initialize TRISC as an OUTPUT
    TRISD = 0x00;                       // Initialize TRISD as an OUTPUT
    
    ADCON1 = 0x0F;                      // Set ADC as all DIGITAL
    
    while(1)
    {
        for (char i=0; i<8; i++) 
        {      
            PORTC = i;                  // Assign PORTC as char i
            
            in = ~i;                    // Invert all values of char i and assign it to char in
            in = in & 0x07;             // Mask unused upper 5 bits of char in
            
            PORTD = in;                 // Assign PORTD as char in
            
            Delay_One_Sec();            // Delay for 1 second
        }
    }
    
}

void Delay_One_Sec()                
{
    for(int I=0; I <17000; I++);        // Delay for 17000 cycles
}