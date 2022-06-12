#include <pic18f4620.h>

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

// LEDS
#define SEC_LED PORTDbits.RD7
#define MODE_LED PORTBbits.RB7

#define NS_RED PORTAbits.RA5
#define NS_GREEN PORTBbits.RB0

#define NSLT_RED PORTBbits.RB1
#define NSLT_GREEN PORTBbits.RB2

#define EW_RED PORTBbits.RB4
#define EW_GREEN PORTBbits.RB5

#define EWLT_RED PORTEbits.RE1
#define EWLT_GREEN PORTEbits.RE2

// colors
#define OFF 0
#define RED 1
#define GREEN 2
#define YELLOW 3

// Prototypes 
unsigned int Get_Full_ADC(void);  
void Set_NS(char);
void Set_NSLT(char);
void Set_EW(char);
void Set_EWLT(char);
void Wait_One_Second();
void Wait_N_Seconds(char);

void Select_ADC_Channel (char channel)
{
    ADCON0 = channel * 4 + 1;
}

void Init_UART() 
{
    OpenUSART (USART_TX_INT_OFF & USART_RX_INT_OFF &
    USART_ASYNCH_MODE & USART_EIGHT_BIT & USART_CONT_RX &
    USART_BRGH_HIGH, 25);
    OSCCON = 0x60;
}

void putch (char c)
{
    while (!TRMT);
    TXREG = c;
}

void Init_ADC()
{
    ADCON0 = 0x01;
    ADCON1 = 0x0E;
    ADCON2 = 0xA9;
}

void Wait_Half_Second()
{
    T0CON = 0x02; // Timer 0, 16-bit mode, prescaler 1:8
    TMR0L = 0xDC; // set the lower byte of TMR 
    TMR0H = 0x0B; // set the upper byte of TMR
    INTCONbits.TMR0IF = 0; // clear the Timer 0 flag
    T0CONbits.TMR0ON = 1; // Turn on the Timer 0
    while(INTCONbits.TMR0IF == 0); // wait for the Timer Flag to be 1 for done
    T0CONbits.TMR0ON = 0; // turn off the Timer 0
}

void main(void)
{
    TRISA = 0x1F;
    TRISB = 0x00;
    TRISC = 0x00;
    TRISD = 0x00;
    TRISE = 0x00;
    
    Init_ADC();
    Init_UART(); 
        
    while(1)
    {
        for (int i=0; i<4; i++)
        {
            Set_NS(i);
            Set_NSLT(i);
            Set_EW(i);
            Set_EWLT(i);
            Wait_One_Second();
        }        
    }
}

void Set_NS(char color)
{
    switch(color)
    {
        case OFF: NS_RED =0; NS_GREEN=0; break;
        case RED: NS_RED =1; NS_GREEN=0; break;
        case GREEN: NS_RED =0; NS_GREEN=1; break;
        case YELLOW: NS_RED =1; NS_GREEN=1; break;
    }
}

void Set_NSLT(char color)
{
    switch(color)
    {
        case OFF: NSLT_RED =0; NSLT_GREEN=0; break;
        case RED: NSLT_RED =1; NSLT_GREEN=0; break;
        case GREEN: NSLT_RED =0; NSLT_GREEN=1; break;
        case YELLOW: NSLT_RED =1; NSLT_GREEN=1; break;
    }
}

void Set_EW(char color)
{
    switch(color)
    {
        case OFF: EW_RED =0; EW_GREEN=0; break;
        case RED: EW_RED =1; EW_GREEN=0; break;
        case GREEN: EW_RED =0; EW_GREEN=1; break;
        case YELLOW: EW_RED =1; EW_GREEN=1; break;
    }
}

void Set_EWLT(char color)
{
    switch(color)
    {
        case OFF: EWLT_RED =0; EWLT_GREEN=0; break;
        case RED: EWLT_RED =1; EWLT_GREEN=0; break;
        case GREEN: EWLT_RED =0; EWLT_GREEN=1; break;
        case YELLOW: EWLT_RED =1; EWLT_GREEN=1; break;
    }
}

void Wait_One_Second()
{
    SEC_LED = 0;
    Wait_Half_Second();
    SEC_LED = 1;
    Wait_Half_Second();
}

void Wait_N_Seconds(char seconds)
{
    char I;
    for (I=0; I<seconds; I++)
    {
        Wait_One_Second();
    }
}

unsigned int Get_Full_ADC(void) 
{
    int result;                                                                 // Declare a new int variable called result
    ADCON0bits.GO=1;                                                            // Start Conversion
    while(ADCON0bits.DONE==1);                                                  // wait for conversion to be completed
    result = (ADRESH * 0x100) + ADRESL;                                         // combine result of upper byte and
                                                                                // lower byte into result
    return result;                                                              // return the result.
}

