// Test Run for 7Seg and all 3 RGB LEDs
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

void Init_ADC();
void Display_Upper_Digit(char);
void Display_Lower_Digit(char);

void WAIT_1_SEC()
{
    for (int j=0; j<17000; j++);
}

char array[10] = {0x40, 0x79, 0x24, 0x30, 0x19, 0x12, 0x02, 0x78, 0x00, 0x18};  // Array for digits 0-9

void main(void)
{
    
    Init_ADC();
    TRISA = 0x0F;
    TRISB = 0x00;
    TRISC = 0x00;
    TRISC = 0x00;
    TRISD = 0x00;
    TRISE = 0x00;
    
    while(1)
    {
        PORTA = 0x00;
        PORTB = 0x00;
        PORTC = 0xFF;
        PORTD = 0xFF;
        PORTE = 0xFF;
        
        for (int i=0; i<10; i++)
        {
            Display_Upper_Digit(i);
            Display_Lower_Digit(i);
            WAIT_1_SEC();
        }
//        PORTC = 0xFF;
//        PORTD = 0xFF;
//        PORTE = 0xFF;
//        
//        for (int i=0; i<8; i++)
//        {
//            PORTB = i;
//            WAIT_1_SEC();
//        }
//        PORTB = 0x00;
//        
//        for (int i=0; i<8; i++)
//        {
//            PORTB = i<<5;
//            WAIT_1_SEC();
//        }
//        PORTB = 0x00;
//        
//        for (int i=0; i<4; i++)
//        {
//            PORTA = i<<4;
//            WAIT_1_SEC();
//        }
//        PORTA = 0x00;
    }
}

void Init_ADC(void)
{
    ADCON1 = 0x1B;
    ADCON2 = 0xA9;
}

void Display_Upper_Digit(char digit)
{
    PORTC = array[digit] & 0x3F;
    char PE = array[digit] & 0x40;
    if (PE == 0) PORTE = 0x00;
    else PORTE = 0x01;
}

void Display_Lower_Digit(char digit)
{
    PORTD = array[digit];
}
