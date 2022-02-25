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

void Delay_One_Sec();                                                       // Start of prototyping area

void main()
{   
    TRISC = 0x00;                                                           // Initialize TRISC as an OUTPUT    
    TRISD = 0x00;                                                           // Initialize TRISD as an OUTPUT              
    
    ADCON1 = 0x0F;                                                          // Set ADC as all DIGITAL     
    
    char D3_array[8] = {0x81, 0xC7, 0x43, 0x64, 0x02, 0xE6, 0xA5, 0x20};    // Create char array for LED D3 values
    
    while(1)
    {
        for (char i=0; i<8; i++)
        {         
            PORTC = i;                                                      // Assign PORTC as char i
            
            PORTD = D3_array[i];                                            // Assign PORTD as value for D3_array                           

            Delay_One_Sec();                                                // Delay for 1 second                           
        }    
    }
    
    
}

void Delay_One_Sec()                              
{
    for(int I=0; I <17000; I++);                                            // Delay for 17000 clock cycles
}