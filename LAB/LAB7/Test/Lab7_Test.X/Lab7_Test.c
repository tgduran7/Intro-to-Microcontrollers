
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

#define EW_RED PORTBbits.RB5
#define EW_GREEN PORTBbits.RB6

#define EWLT_RED PORTEbits.RE1
#define EWLT_GREEN PORTEbits.RE2

#define SEG_G PORTEbits.RE0

#define NSLT_SW PORTAbits.RA1
#define EWLT_SW PORTAbits.RA2
#define NSPED_SW PORTAbits.RA3
#define EWPED_SW PORTAbits.RA4


// colors
#define OFF 0
#define RED 1
#define GREEN 2
#define YELLOW 3

// Prototypes
void Init_ADC(); 
unsigned int Get_Full_ADC(void);  
void Set_NS(char);
void Set_NSLT(char);
void Set_EW(char);
void Set_EWLT(char);
void DO_DISPLAY_7SEG_Upper(char);
void DO_DISPLAY_7SEG_Lower(char);
void Wait_One_Second();
void Wait_One_Second_With_Beep();
void Wait_N_Seconds(char);
void PED_Control (char, char);
void Day_Mode();
void Night_Mode();

char SW_MODE;
int MODE;
float volt;
char array[10] = {0x7F, 0x79, 0x24, 0x30, 0x19, 0x12, 0x02, 0x78, 0x00, 0x10};

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
    
//    int nStep = Get_Full_ADC();
//    volt = nStep * 5 / 1024.0;
//    SW_MODE = volt < 2.5 ? 1:0;
        
    while(1)
    {
//        for (int i=0; i<4; i++)
//        {
//            Set_NS(i);
//            Set_NSLT(i);
//            Set_EW(i);
//            Set_EWLT(i);
//            Wait_One_Second();
//        }
//         PED_Control(0,8);
//         PED_Control(1,6);     
        
        int nStep = Get_Full_ADC();
        volt = nStep * 5 / 1024.0;
        SW_MODE = volt < 2.5 ? 1:0;
        
        if (SW_MODE)
        {
            MODE_LED = 1;
            Day_Mode();
        }
        else
        {
            MODE_LED = 0;
            Night_Mode();
        }
        
//        MODE_LED = 1;
//        Day_Mode();
    }
}

void Night_Mode()
{
    //DO_DISPLAY_7SEG_Lower(0x00);
    //DO_DISPLAY_7SEG_Upper(0x00);
    
    Set_NSLT(RED);      // Step 1
    Set_EW(RED);
    Set_EWLT(RED);
    Set_NS(GREEN);
    Wait_N_Seconds(8);  // Step 2
    Set_NS(YELLOW);     // Step 3
    Wait_N_Seconds(3);  //
    Set_NS(RED);        // Step 4
    if (EWLT_SW == 1)
    {
        Set_EWLT(GREEN);    // Step 6
        Wait_N_Seconds(6);  //
        Set_EWLT(YELLOW);   // Step 7
        Wait_N_Seconds(3);  //
        Set_EWLT(RED);      // Step 8
    }
    Set_EW(GREEN);      // Step 9
    Wait_N_Seconds(8);  //
    Set_EW(YELLOW);     // Step 10
    Wait_N_Seconds(3);  //
    Set_EW(RED);        // Step 11
    if(NSLT_SW == 1)    // Step 12
    {
        Set_NSLT(GREEN);    // Step 13
        Wait_N_Seconds(6);  //
        Set_NSLT(YELLOW);   // Step 14
        Wait_N_Seconds(3);  //
        Set_NSLT(RED);      // Step 15
    }
}

void Day_Mode()
{
    Set_NS(GREEN);  // Step 1
    Set_NSLT(RED);  //
    Set_EW(RED);    //
    Set_EWLT(RED);  //
    if(NSPED_SW == 1)   // Step 1 Part A
    {
        PED_Control(0,6);   //
    }
    Wait_N_Seconds(9);  // Step 2
    Set_NS(YELLOW); // Step 3
    Wait_N_Seconds(3);  //
    Set_NS(RED);    // Step 4
    if(EWLT_SW == 1)    // Step 5                                                       
    {
        Set_EWLT(GREEN);    // Step 6                                                       
        Wait_N_Seconds(6);  //                                                      
        
        Set_EWLT(YELLOW);   // Step 7                                                       
        Wait_N_Seconds(3);  //                                                     
        
        Set_EWLT(RED);      // Step 8                                                          
    }
    
    Set_EW(GREEN);      // Step 9                                                              
    if(EWPED_SW == 1)   //                                                           
    {
        PED_Control(1,9);   // Step 9 Part A
    }
    
    Wait_N_Seconds(7);  // Step 10                                                        //Step10
        
    Set_EW(YELLOW);     // Step 11                                                             //Step11
    Wait_N_Seconds(3);  //                                                           //Step11
        
    Set_EW(RED);        // Step 12                                                                        //Step12
    
    if(NSLT_SW == 1)    // Step 13                                                            //Step13ab
    {
        Set_NSLT(GREEN);    // Step 14                                                        //Step14
        Wait_N_Seconds(6);  //                                                      //Step14
        
        Set_NSLT(YELLOW);   // Step 15                                                       //Step15
        Wait_N_Seconds(3);  //                                                       //Step15
        
        Set_NSLT(RED);      // Step 17                                                          //Step16
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

void DO_DISPLAY_7SEG_Upper(char digit)
{
    PORTC = array[digit] & 0x3F;
    if ((array[digit] & 0x40) == 0x40) SEG_G = 1;
    else SEG_G = 0;
}

void DO_DISPLAY_7SEG_Lower(char digit)
{
    PORTD = (PORTD & 0x80) | array[digit];
}

void PED_Control (char Direction, char Num_Sec)
{
    DO_DISPLAY_7SEG_Lower(0x00);
    DO_DISPLAY_7SEG_Upper(0x00);
    for (char i=Num_Sec-1; i>0; i--)
    {
        if (Direction == 0)
        {
            DO_DISPLAY_7SEG_Upper(i);
        }
        else
        {
            DO_DISPLAY_7SEG_Lower(i);
        }
        Wait_One_Second_With_Beep();
    }
    DO_DISPLAY_7SEG_Upper(0x00);
    DO_DISPLAY_7SEG_Lower(0x00);
    Wait_One_Second_With_Beep();
}


void Activate_Beep()
{
    PR2 = 0b11111001;
    T2CON = 0b00000101;
    CCPR2L = 0b01001010;
    CCP2CON = 0b00111100;
}

void Deactivate_Beep()
{
    CCP2CON = 0x0;
    PORTBbits.RB3 = 0;
}

void Wait_One_Second()
{
    SEC_LED = 0;
    Wait_Half_Second();
    SEC_LED = 1;
    Wait_Half_Second();
}

void Wait_One_Second_With_Beep()
{
    SEC_LED = 1;
    Activate_Beep();
    Wait_Half_Second();
    SEC_LED = 0;
    Deactivate_Beep();
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