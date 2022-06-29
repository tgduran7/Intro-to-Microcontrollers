#include <stdio.h>
#include <stdlib.h>
#include <xc.h>
#include <math.h>
#include <p18f4620.h>

#pragma config OSC = INTIO67
#pragma config WDT = OFF
#pragma config LVP = OFF
#pragma config BOREN = OFF
#pragma config CCP2MX = PORTBE

#define debug 1

//LEDS
                                                            // Location of TFT Reset
#define SEC_LED PORTDbits.RD7                                                               // Location of SEC_LED

#define NS_RED PORTDbits.RD2                                                              // Location of the RED Pin for the NS LED
#define NS_GREEN PORTDbits.RD3                                                              // Location of the GREEN Pin for the NS LED

#define NSLT_RED PORTDbits.RD4                                                             // Location of the RED Pin for the NSLT LED
#define NSLT_GREEN PORTDbits.RD5                                                          // Location of the GREEN Pin for the NSLT LED

#define EW_RED PORTBbits.RB4                                                                // Location of the RED Pin for the EW LED
#define EW_GREEN PORTBbits.RB5                                                              // Location of the GREEN Pin for the EW LED

#define EWLT_RED PORTEbits.RE1                                                              // Location of the RED Pin for the EWLT LED
#define EWLT_GREEN PORTEbits.RE2                                                            // Location of the GREEN Pin for the EWLT LED

#define NS_LT_SW PORTAbits.RA1                                                              // Location of the NSLT SW                                                        // Location of the EWPED SW
#define EW_LT_SW PORTAbits.RA2                                                              // Location of the EWLT SW

#define MODE_LED PORTBbits.RB7                                                             // Location of the MODE_LED


void init_UART()
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
    ADCON1= 0x0E; 
    ADCON2= 0xA9;
}

int INT0_flag = 0;
int INT1_flag = 0;
int INT2_flag = 0;
    
void Do_Init()
{
    init_UART();
    Init_ADC();
    
    OSCCON = 0x70;
    TRISB = 0x07; // Configure the PORTB to make sure
    // that all the INTx pins are
    // inputs
    INTCONbits.INT0IF = 0; // Clear INT0IF
    INTCON3bits.INT1IF = 0; // Clear INT1IF
    INTCON3bits.INT2IF =0; // Clear INT2IF
    
    INTCON2bits.INTEDG0=0 ; // INT0 EDGE falling
    INTCON2bits.INTEDG1=0; // INT1 EDGE falling
    INTCON2bits.INTEDG2=0; // INT2 EDGE rising
    
    INTCONbits.INT0IE =1; // Set INT0 IE
    INTCON3bits.INT1IE=1; // Set INT1 IE
    INTCON3bits.INT2IE=1; // Set INT2 IE
    
    INTCONbits.GIE=1; // Set the Global Interrupt Enable
    }

void INT0_ISR()
{
    INTCONbits.INT0IF=0; // Clear the interrupt flag
    INT0_flag = 1; // set software INT0_flag
}

void INT1_ISR()
{
INTCON3bits.INT1IF=0; // Clear the interrupt flag
INT1_flag = 1; // set software INT1_flag
}

void INT2_ISR()
{
INTCON3bits.INT2IF=0; // Clear the interrupt flag
INT2_flag = 1; // set software INT2_flag
}

void interrupt high_priority chkisr()
{
    if (INTCONbits.INT0IF == 1) INT0_ISR(); // check if INT0
    // has occured
    if (INTCON3bits.INT1IF == 1) INT1_ISR();
    if (INTCON3bits.INT2IF == 1) INT2_ISR();
}

void main(void)
{
    RBPU = 0;
    Do_Init();                                                                              // Initialize the IO PORTS                                                                            // Initialize the UART
    while (1)
    { // Do nothing,
        if (INT0_flag == 1)
        {
            INT0_flag = 0; // clear the flag
            printf("INT0 interrupt pin detected \r\n");
        }
        if (INT1_flag == 1)
        {
            INT1_flag = 0; // clear the flag
            printf("INT1 interrupt pin detected \r\n");
        }
        if (INT2_flag == 1)
        {
            INT2_flag = 0; // clear the flag
            printf("INT2 interrupt pin detected \r\n");
        }
    }
}