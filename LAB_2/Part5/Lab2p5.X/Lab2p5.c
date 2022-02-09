#include <stdio.h>
#include <stdlib.h>
#include <xc.h>
#include <math.h>
#include <p18f4620.h>

#pragma config OSC = INTIO67
#pragma config WDT = OFF
#pragma config LVP = OFF
#pragma config BOREN = OFF

void Delay_One_Sec();

void main()
{
    char in;                                                                // Use variable ?in? as char
    char L2;                                                                // Initialize L2 as char
    char L3;                                                                // Initialize L3 as char
    
    TRISC = 0x00;                                                           // Assign TRISC as an OUTPUT
    TRISD = 0x00;                                                           // Assign TRISD as an OUTPUT
    
    ADCON1 = 0x0F;                                                          // fill out the ?? with the proper values
    
    char L2_array[8] = {0x01, 0x07, 0x03, 0x04, 0x02, 0x06, 0x05, 0x00};    // Create array for LED D2
    char L3_array[8] = {0x04, 0x06, 0x02, 0x03, 0x00, 0x07, 0x05, 0x01};    // Create array for LED D3
    
    for (int I=0; I<=7; I++){                                               // For loop to go through colors
        
        
        L2 = L2_array[I];                                                   // Call array for LED D2 and assign it to L2
        L3 = L3_array[I];                                                   // Call array for LED D3 and assign it to L3
        L3 = L3 << 5;                                                       // Shift L3 5 bits to the LEFT
        in = L2 | L3;                                                       // Assign char in as L2 OR L3
        
        PORTC = I;                                                          // Output I to PORTC
        PORTD = in;                                                         // Output in to PORTD (should be data of LED D3 with LED D2)
        
        Delay_One_Sec();                                                    // Delay for 1 sec
    }
    
}

void Delay_One_Sec()                                                        // Given delay function
{
    for(int I=0; I <17000; I++);                                            // Delay for 17000 clock cycles
}
