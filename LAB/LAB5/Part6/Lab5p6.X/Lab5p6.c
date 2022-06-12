// Test Code for Lab 5
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

#define D1_RED PORTBbits.RB5
#define D1_GREEN PORTBbits.RB6
#define D1_BLUE PORTBbits.RB7

#define D3_RED PORTAbits.RA4
#define D3_GREEN PORTAbits.RA5

void Init_ADC();
void Init_TRIS();
unsigned int Get_Full_ADC();
void Display_Upper_Digit(char);
void Display_Lower_Digit(char);
void DO_DISPLAY_D1(int);
void DO_DISPLAY_D2(int);
void DO_DISPLAY_D3(int);

void SET_D1_CLEAR();
void SET_D1_RED();
void SET_D1_GREEN();
void SET_D1_BLUE();
void SET_D1_WHITE();

void SET_D3_RED();
void SET_D3_GREEN();
void SET_D3_YELLOW();


void Select_ADC_Channel (char channel)
{
    ADCON0 = channel * 4 + 1;
}

void putch (char c) // Part 5
{
    while (!TRMT);
    TXREG = c;
}

void Init_UART() 
{
    OpenUSART (USART_TX_INT_OFF & USART_RX_INT_OFF &
    USART_ASYNCH_MODE & USART_EIGHT_BIT & USART_CONT_RX &
    USART_BRGH_HIGH, 25);
    OSCCON = 0x60;
}

void WAIT_1_SEC()
{
    for (int j=0; j<17000; j++);
}

char array[10] = {0x40, 0x79, 0x24, 0x30, 0x19, 0x12, 0x02, 0x78, 0x00, 0x18};  // Array for digits 0-9

void main(void)
{
    Init_UART();
    Init_ADC();
    Init_TRIS();
    PORTA = 0x00;
    PORTB = 0x00;
    PORTC = 0xFF;
    PORTD = 0xFF;
    PORTE = 0xFF;
    
    while(1)
    {
        Select_ADC_Channel(0);  
        int num_step = Get_Full_ADC();
        float voltage_mv = num_step * 4.0;
        float temperature_C = (1035.0 - voltage_mv) / 5.50;
        float temperature_F = 1.80 * temperature_C + 32.0;
        int tempF = (int)temperature_F;
        char U = tempF / 10;
        char L = tempF % 10;
        Display_Upper_Digit(U); 
        Display_Lower_Digit(L); 
        printf("Voltage = %f (mV) \r\n", voltage_mv);
        printf("Temperature = %d F \r\n\n", tempF); 
        DO_DISPLAY_D1(tempF);
        DO_DISPLAY_D2(tempF);
        
        Select_ADC_Channel(1);
        int num_step = Get_Full_ADC();
        int voltage_mv1 = num_step * 4;
        printf("Light Volt = %d mV \r\n\n", voltage_mv1);
        DO_DISPLAY_D3(voltage_mv1);
        WAIT_1_SEC();
    }
}

void Init_TRIS(void)
{
    TRISA = 0x0F;
    TRISB = 0x00;
    TRISC = 0x00;
    TRISD = 0x00;
    TRISE = 0x00;
}
void Init_ADC(void)
{
    ADCON0 = 0x01;
    ADCON1 = 0x1B;
    ADCON2 = 0xA9;
}

unsigned int Get_Full_ADC(void) 
{
    int result;
    ADCON0bits.GO=1; // Start Conversion
    while(ADCON0bits.DONE==1); // wait for conversion to be completed
    result = (ADRESH * 0x100) + ADRESL; // combine result of upper byte and
    // lower byte into result
    return result; // return the result.
}

void Display_Upper_Digit(char digit)
{
    PORTC = array[digit] & 0x3F;
    char PE = array[digit] & 0x40;
    if (PE == 0) PORTE = 0x00;
    else PORTE = 0x03;
}

void Display_Lower_Digit(char digit)
{
    PORTD = array[digit];
}

void DO_DISPLAY_D1(int temp)
{
    if (temp < 46) 
    {
        PORTB = 0x00;
        //SET_D1_CLEAR();
    }
    if (temp >= 46 && temp < 56) 
    {
        PORTB = 0x20;
        //SET_D1_RED();
    }
    if (temp >= 56 && temp < 66) 
    {
        PORTB = 0x40;
        //SET_D1_GREEN();
    }
    if (temp >= 66 && temp < 76) 
    {
        PORTB = 0x80;
        //SET_D1_BLUE();
    }
    if (temp >= 76) 
    {
        PORTB = 0xE0;
        //SET_D1_WHITE();
    }
}

void DO_DISPLAY_D2(int temp)
{
    int T = temp / 10;
    if (T > 0 && T < 8)
    {
        PORTB = T | PORTB;
    }
    if (T <= 0)
    {
        PORTB = 0x00;
    }
    if (T >= 8)
    {
        PORTB = 0x07 | PORTB;
        // printf ("PORTB = %x \r\n", PORTB);
    }
}

void DO_DISPLAY_D3(int voltage)
{
    if (voltage < 2500)
    {
        SET_D3_RED();
    }
    if (voltage >= 2500 && voltage < 3500)
    {
        SET_D3_GREEN();
    }
    if (voltage >= 3500)
    {
        SET_D3_YELLOW();
    }
}

void SET_D1_CLEAR()
{
    D1_RED = 0;
    D1_GREEN = 0;
    D1_BLUE = 0;
}

void SET_D1_RED()
{
    D1_RED = 1;
    D1_GREEN = 0;
    D1_BLUE = 0;
}

void SET_D1_GREEN()
{
    D1_RED = 0;
    D1_GREEN = 1;
    D1_BLUE = 0;
}

void SET_D1_BLUE()
{
    D1_RED = 0;
    D1_GREEN = 0;
    D1_BLUE = 1;
}

void SET_D1_WHITE()
{
    D1_RED = 1;
    D1_GREEN = 1;
    D1_BLUE = 1;
}

void SET_D3_RED()
{
    D3_RED = 1;
    D3_GREEN = 0;
}

void SET_D3_GREEN()
{
    D3_RED = 0;
    D3_GREEN = 1;
}

void SET_D3_YELLOW()
{
    D3_RED = 1;
    D3_GREEN = 1;
}