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
#define SEC_LED PORTDbits.RD7                                                   // Define the SEC_LED on the board
#define MODE_LED PORTBbits.RB7                                                  // Define the MODE_LED on the board

#define NS_RED PORTAbits.RA5                                                    // Define the RED pin on the NS LED
#define NS_GREEN PORTBbits.RB0                                                  // Define the GREEN pin on the NS LED

#define NSLT_RED PORTBbits.RB1                                                  // Define the RED pin on the NSLT LED
#define NSLT_GREEN PORTBbits.RB2                                                // Define the GREEN pin on the NSLT LED

#define EW_RED PORTBbits.RB5                                                    // Define the RED pin on the EW LED
#define EW_GREEN PORTBbits.RB6                                                  // Define the GREEN pin on the EW LED

#define EWLT_RED PORTEbits.RE1                                                  // Define the RED pin on the EWLT LED
#define EWLT_GREEN PORTEbits.RE2                                                // Define the GREEN pin on the EWLT LED

#define SEG_G PORTEbits.RE0                                                     // Define the SEG_G pin on the board

#define NSLT_SW PORTAbits.RA1                                                   // Define the NSLT switch
#define EWLT_SW PORTAbits.RA2                                                   // Define the EWLT switch
#define NSPED_SW PORTAbits.RA3                                                  // Define the NSPED switch
#define EWPED_SW PORTAbits.RA4                                                  // Define the EWPED switch


// colors
#define OFF 0                                                                   // Define OFF as 0
#define RED 1                                                                   // Define RED as 1
#define GREEN 2                                                                 // Define GREEN as 2
#define YELLOW 3                                                                // Define YELLOW as 3

// Prototypes
void Init_ADC();                                                                // Beginning of Prototyping
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

char SW_MODE;                                                                   // Create variable SW_MODE for ADC
int MODE;                                                                       // Create variable MODE for ADC
float volt;                                                                     // Create variable volt for ADC
char array[10] = {0x7F, 0x79, 0x24, 0x30, 0x19, 0x12, 0x02, 0x78, 0x00, 0x10};  // Array for Upper and Lower Digits Individually

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
    T0CON = 0x02;                                                               // Timer 0, 16-bit mode, prescaler 1:8
    TMR0L = 0xDC;                                                               // set the lower byte of TMR 
    TMR0H = 0x0B;                                                               // set the upper byte of TMR
    INTCONbits.TMR0IF = 0;                                                      // clear the Timer 0 flag
    T0CONbits.TMR0ON = 1;                                                       // Turn on the Timer 0
    while(INTCONbits.TMR0IF == 0);                                              // wait for the Timer Flag to be 1 for done
    T0CONbits.TMR0ON = 0;                                                       // turn off the Timer 0
}

void main(void)
{
    TRISA = 0x1F;                                                               // Make PORTA as bits 0-4 INPUTS and 5-7 OUTPUTS
    TRISB = 0x00;                                                               // Make PORTB as OUTPUT
    TRISC = 0x00;                                                               // Make PORTC as OUTPUT
    TRISD = 0x00;                                                               // Make PORTD as OUTPUT
    TRISE = 0x00;                                                               // Make PORTE as OUTPUT
    
    Init_ADC();                                                                 // Call the ADC function
    Init_UART();                                                                // Call the UART function
        
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
        
        int nStep = Get_Full_ADC();                                             // Begin the ADC conversion
        volt = nStep * 5 / 1024.0;                                              // Convert the conversion to volts
        SW_MODE = volt < 2.5 ? 1:0;                                             // If SW_MODE is less than 2.5, equal to 1, else equal to 0
        
        if (SW_MODE)
        {
            MODE_LED = 1;                                                       // If Day_Mode, then turn MODE_LED on and do Day_Mode function
            Day_Mode();
        }
        else
        {
            MODE_LED = 0;                                                       // If Night_Mode, then turn MODE_LED off and do Night_Mode function
            Night_Mode();
        }
    }
}

void Night_Mode()
{   
    Set_NSLT(RED);                                                              // Step 1
    Set_EW(RED);                                                                //
    Set_EWLT(RED);                                                              //
    Set_NS(GREEN);                                                              //
    Wait_N_Seconds(8);                                                          // Step 2
    Set_NS(YELLOW);                                                             // Step 3
    Wait_N_Seconds(3);                                                          //
    Set_NS(RED);                                                                // Step 4
    if (EWLT_SW == 1)
    {
        Set_EWLT(GREEN);                                                        // Step 6
        Wait_N_Seconds(6);                                                      //
        Set_EWLT(YELLOW);                                                       // Step 7
        Wait_N_Seconds(3);                                                      //
        Set_EWLT(RED);                                                          // Step 8
    }
    Set_EW(GREEN);                                                              // Step 9
    Wait_N_Seconds(8);                                                          //
    Set_EW(YELLOW);                                                             // Step 10
    Wait_N_Seconds(3);                                                          //
    Set_EW(RED);                                                                // Step 11
    if(NSLT_SW == 1)                                                            // Step 12
    {
        Set_NSLT(GREEN);                                                        // Step 13
        Wait_N_Seconds(6);                                                      //
        Set_NSLT(YELLOW);                                                       // Step 14
        Wait_N_Seconds(3);                                                      //
        Set_NSLT(RED);                                                          // Step 15
    }
}

void Day_Mode()
{
    Set_NS(GREEN);                                                              // Step 1
    Set_NSLT(RED);                                                              //
    Set_EW(RED);                                                                //
    Set_EWLT(RED);                                                              //
    if(NSPED_SW == 1)                                                           // Step 1 Part A
    {
        PED_Control(0,6);                                                       //
    }
    Wait_N_Seconds(9);                                                          // Step 2
    Set_NS(YELLOW);                                                             // Step 3
    Wait_N_Seconds(3);                                                          //
    Set_NS(RED);                                                                // Step 4
    if(EWLT_SW == 1)                                                            // Step 5                                                       
    {
        Set_EWLT(GREEN);                                                        // Step 6                                                       
        Wait_N_Seconds(6);                                                      //                                                      
        
        Set_EWLT(YELLOW);                                                       // Step 7                                                       
        Wait_N_Seconds(3);                                                      //                                                     
        
        Set_EWLT(RED);                                                          // Step 8                                                          
    }
    
    Set_EW(GREEN);                                                              // Step 9                                                              
    if(EWPED_SW == 1)                                                           //                                                           
    {
        PED_Control(1,9);                                                       // Step 9 Part A
    }
    
    Wait_N_Seconds(7);                                                          // Step 10  
        
    Set_EW(YELLOW);                                                             // Step 11
    Wait_N_Seconds(3);                                                          // 
        
    Set_EW(RED);                                                                // Step 12  
    
    if(NSLT_SW == 1)                                                            // Step 13 
    {
        Set_NSLT(GREEN);                                                        // Step 14   
        Wait_N_Seconds(6);                                                      //  
        
        Set_NSLT(YELLOW);                                                       // Step 15     
        Wait_N_Seconds(3);                                                      //      
        
        Set_NSLT(RED);                                                          // Step 17  
    }        
}
void Set_NS(char color)
{
    switch(color)
    {
        case OFF: NS_RED =0; NS_GREEN=0; break;                                 // Turn NS LED OFF
        case RED: NS_RED =1; NS_GREEN=0; break;                                 // Make NS LED RED
        case GREEN: NS_RED =0; NS_GREEN=1; break;                               // Make NS LED GREEN
        case YELLOW: NS_RED =1; NS_GREEN=1; break;                              // Make NS LED YELLOW
    }
}

void Set_NSLT(char color)
{
    switch(color)
    {
        case OFF: NSLT_RED =0; NSLT_GREEN=0; break;                             // Turn NSLT LED OFF
        case RED: NSLT_RED =1; NSLT_GREEN=0; break;                             // Make NSLT LED RED
        case GREEN: NSLT_RED =0; NSLT_GREEN=1; break;                           // Make NSLT LED GREEN
        case YELLOW: NSLT_RED =1; NSLT_GREEN=1; break;                          // Make NSLT LED YELLOW
    }
}

void Set_EW(char color)
{
    switch(color)
    {
        case OFF: EW_RED =0; EW_GREEN=0; break;                                 // Turn EW LED OFF
        case RED: EW_RED =1; EW_GREEN=0; break;                                 // Make EW LED RED
        case GREEN: EW_RED =0; EW_GREEN=1; break;                               // Make EW LED GREEN
        case YELLOW: EW_RED =1; EW_GREEN=1; break;                              // Make EW LED YELLOW
    }
}

void Set_EWLT(char color)
{
    switch(color)
    {
        case OFF: EWLT_RED =0; EWLT_GREEN=0; break;                             // Turn EWLT LED OFF
        case RED: EWLT_RED =1; EWLT_GREEN=0; break;                             // Make EWLT LED RED
        case GREEN: EWLT_RED =0; EWLT_GREEN=1; break;                           // Make EWLT LED GREEN
        case YELLOW: EWLT_RED =1; EWLT_GREEN=1; break;                          // Make EWLT LED YELLOW
    }
}

void DO_DISPLAY_7SEG_Upper(char digit)
{
    PORTC = array[digit] & 0x3F;                                                // Keep the first 6 bits of the array
    if ((array[digit] & 0x40) == 0x40) SEG_G = 1;                               // Check if the 6th bit is equal to 1, then turn on SEG_G
    else SEG_G = 0;                                                             // If the 6th bit is 0, then turn off SEC_G
}

void DO_DISPLAY_7SEG_Lower(char digit)
{
    PORTD = (PORTD & 0x80) | array[digit];                                      // Display the lower digit on the 7SEG
}

void PED_Control (char Direction, char Num_Sec)
{
    DO_DISPLAY_7SEG_Lower(0x00);                                                // Clear the lower digit
    DO_DISPLAY_7SEG_Upper(0x00);                                                // Clear the upper digit
    for (char i=Num_Sec-1; i>0; i--)
    {
        if (Direction == 0)
        {
            DO_DISPLAY_7SEG_Upper(i);                                           // If the direction is 0, display upper and count down
        }
        else
        {
            DO_DISPLAY_7SEG_Lower(i);                                           // If the direction is 1, display lower and count down
        }
        Wait_One_Second_With_Beep();
    }
    DO_DISPLAY_7SEG_Upper(0x00);                                                // Show 0 on the 7SEG upper
    DO_DISPLAY_7SEG_Lower(0x00);                                                // Show 0 on the 7SEG lower
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
    SEC_LED = 0;                                                                // Turn off the Second LED
    Wait_Half_Second();                                                         // Call Wait_Half_Second
    SEC_LED = 1;                                                                // Turn on the Second LED
    Wait_Half_Second();                                                         // Call Wait_Half_Second
}

void Wait_One_Second_With_Beep()
{
    SEC_LED = 1;                                                                // Turn on the SEC_LED
    Activate_Beep();                                                            // Turn on the Beep
    Wait_Half_Second();                                                         // Wait half a second
    SEC_LED = 0;                                                                // Turn off the SEC_LED
    Deactivate_Beep();                                                          // Turn on off the Beep
    Wait_Half_Second();                                                         // Wait half a second
}

void Wait_N_Seconds(char seconds)
{
    char I;                                                                     // Initialize a variable I
    for (I=0; I<seconds; I++)
    {
        Wait_One_Second();                                                      // Run Wait_One_Second however many times seconds is
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
