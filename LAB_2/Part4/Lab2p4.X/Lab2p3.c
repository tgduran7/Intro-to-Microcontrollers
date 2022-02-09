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
    char in;            // Use variable ?in? as char
    TRISA = 0xFF;       // fill out the ?? with the proper values, input
    TRISB = 0x00;       // fill out the ?? with the proper values, output
    TRISC = 0x00;
    ADCON1 = 0x0F;      // fill out the ?? with the proper values
    
    for (int i=0; i<7; i++) {
        in = PORTA;
        
        in = in & 0x07;
        PORTC = in;
        Delay_One_Sec();
    }
}

void Delay_One_Sec()
{
    for(int I=0; I <17000; I++);
}
