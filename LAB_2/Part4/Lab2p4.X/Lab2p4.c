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
    TRISC = 0x00;                   // Assign TRISC as an OUTPUT
    TRISD = 0x00;                   // Assign TRISD as an OUTPUT
    
    ADCON1 = 0x0F;                  // fill out the ?? with the proper values
    
    for (int i=0; i<=7; i++) {      // For loop to go through colors
        PORTC = i;                  // Assign PORTC as int i, similar to part 3
        PORTD = 0b00000111 ^ i;     // Assign PORTD as 0x03 XOR i
        // PORTD = ~i; // Assign PORTD as inverse of i
        Delay_One_Sec();            // Delay loop for 1 sec
    }
}

void Delay_One_Sec()                // Given delay function
{
    for(int I=0; I <17000; I++);    // Delay for 17000 cycles
}
