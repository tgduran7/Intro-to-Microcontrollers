#include <stdio.h>
#include <stdlib.h>
#include <xc.h>
#include <math.h>
#include <p18f4620.h>
#include <usart.h>
#include <string.h>

#pragma config OSC = INTIO67
#pragma config WDT = OFF
#pragma config LVP = OFF
#pragma config BOREN = OFF
#pragma config CCP2MX = PORTBE

#include "ST7735.h"                                                                     // Include the ST7735 header file
#define _XTAL_FREQ  8000000                                                             // Set operation for 8 Mhz

// Start of prototyping
void TIMER1_isr(void);
void INT0_isr(void);
void Initialize_Screen();
void Activate_Buzzer();
void Deactivate_Buzzer();
void Wait_One_Second();
void Wait_One_Second_With_Beep();
void Wait_Half_Second();

unsigned char Nec_state = 0;
unsigned char i,bit_count;
short nec_ok = 0;
unsigned long long Nec_code;
char Nec_code1;
unsigned int Time_Elapsed;

// colors
#define RD               ST7735_RED
#define BU               ST7735_BLUE
#define GR               ST7735_GREEN
#define MA               ST7735_MAGENTA
#define BK               ST7735_BLACK

#define Circle_Size     20                                                              // Size of Circle for Light
#define Circle_X        60                                                              // Location of Circle
#define Circle_Y        80                                                              // Location of Circle
#define Text_X          52
#define Text_Y          77
#define TS_1            1                                                               // Size of Normal Text
#define TS_2            2                                                               // Size of Big Text

                                                                                        // Defined values for D1, D2, and D3 LEDs
#define D1R 0x01
#define D1G 0x02
#define D1M 0x05
#define D1W 0x07

#define D2R 0x01
#define D2B 0x04
#define D2M 0x05
#define D2W 0x07

#define D3R 0x10
#define D3B 0x40
#define D3M 0x50
#define D3W 0x70

#define D6 PORTBbits.RB7                                                                // Defined pin number for D6 Flashing LED

char buffer[31];                                                                        // general buffer for display purpose
char *nbr;                                                                              // general pointer used for buffer
char *txt;

char array1[21]={0xa2, 0x62, 0xe2, 0x22, 0x2, 0xc2, 0xe0, 0xa8, 0x90, 0x68, 0x98, 0xb0, 0x30, 0x18, 0x7a, 0x10, 0x38, 0x5a, 0x42, 0x4a, 0x52};
char txt1[21][4] ={"CH-\0", "CH \0", "CH+\0", "PRV\0", "NXT\0", "P/P\0", "VL-", "VL+", "EQ \0", " 0 \0", "100\0", "200\0", " 1 \0", " 2 \0", " 3 \0", " 4 \0", " 5 \0", " 6 \0", " 7 \0", " 8 \0", " 9 \0"};
int color[21]={RD, RD, RD, BU, BU, GR, MA, MA, MA, BK, BK, BK, BK, BK, BK, BK, BK, BK, BK, BK, BK};
char D3[21] ={D3R,0,0,D3B,0,0,D3M,0,0,D3W,0,0,D3W,0,0,D3W,0,0,D3W,0,0};
char D2[21] ={0,D2R,0,0,D2B,0,0,D2M,0,0,D2W,0,0,D2W,0,0,D2W,0,0,D2W,0};
char D1[21] ={0,0,D1R,0,0,D1G,0,0,D1M,0,0,D1W,0,0,D1W,0,0,D1W,0,0,D1W};

void putch (char c)
{
    while (!TRMT);
    TXREG = c;
}
void init_UART()
{
    OpenUSART (USART_TX_INT_OFF & USART_RX_INT_OFF &
    USART_ASYNCH_MODE & USART_EIGHT_BIT & USART_CONT_RX &
    USART_BRGH_HIGH, 25);
    OSCCON = 0x60;
}

void interrupt high_priority chkisr()
{
    if (PIR1bits.TMR1IF == 1) TIMER1_isr();                                             // Check for TMR1 interrupt flag
    if (INTCONbits.INT0IF == 1) INT0_isr();                                             // Check for INT0 intterupt flag
}

void TIMER1_isr(void)
{
    Nec_state = 0;                                                                      // Reset decoding process
    INTCON2bits.INTEDG0 = 0;                                                            // Edge programming for INT0 falling edge
    T1CONbits.TMR1ON = 0;                                                               // Disable T1 Timer
    PIR1bits.TMR1IF = 0;                                                                // Clear interrupt flag
}

void force_nec_state0()
{
    Nec_state=0;                                                                        // Change Nec_state to 0
    T1CONbits.TMR1ON = 0;                                                               // Turn off TMR1
}

void INT0_isr(void)
{
    INTCONbits.INT0IF = 0;                                                              // Clear external interrupt
    if (Nec_state != 0)
    {
        Time_Elapsed = (TMR1H << 8) | TMR1L;                                            // Store Timer1 value
        TMR1H = 0;                                                                      // Reset Timer1
        TMR1L = 0;
    }
    
    switch(Nec_state)
    {
        case 0 :
        {
                                                                                        // Clear Timer 1
            TMR1H = 0;                                                                  // Reset Timer1
            TMR1L = 0;                                                                  //
            PIR1bits.TMR1IF = 0;                                                        //
            T1CON= 0x90;                                                                // Program Timer1 mode with count = 1usec using System clock running at 8Mhz
            T1CONbits.TMR1ON = 1;                                                       // Enable Timer 1
            bit_count = 0;                                                              // Force bit count (bit_count) to 0
            Nec_code = 0;                                                               // Set Nec_code = 0
            Nec_state = 1;                                                              // Set Nec_State to state 1
            INTCON2bits.INTEDG0 = 1;                                                    // Change Edge interrupt of INT0 to Low to High            
            return;
        }
        
        case 1 :
        {
            if((Time_Elapsed > 8500) && (Time_Elapsed < 9500))
            {
                Nec_state = 2;                                                          // If the Time is between 8500 and 9500, go to Nec_state 2
                INTCON2bits.INTEDG0 = 0;                                                // Change to falling edge
            }
            return;
        }
        
        case 2 :                            
        {
            if((Time_Elapsed > 4000) && (Time_Elapsed < 5000))
            {
                Nec_state = 3;                                                          // If the Time is between 4000 and 5000, go to Nec_state 3
                INTCON2bits.INTEDG0 = 1;                                                // Change to rising edge
            }
            return;
        }
        
        case 3 :                            
        {
            if((Time_Elapsed > 400) && (Time_Elapsed < 1800))
            {
                Nec_state = 4;                                                          // If the Time is between 400 and 1800, go to Nec_state 4
                INTCON2bits.INTEDG0 = 0;                                                // Change to falling edge
            }
            return;
        }
        
        case 4 :                            
        {
            if((Time_Elapsed > 400) && (Time_Elapsed < 1800))                           // Check if Time is between 400 and 1800
            {
                Nec_code = Nec_code << 1;                                               // Shift Nec_code one bit to the left
                if(Time_Elapsed > 1000)                                                 //
                {
                    Nec_code = Nec_code + 1;                                            // If Time is greater than 1000, add 1 to Nec_code
                }
                bit_count = bit_count + 1;                                              // Add 1 to bit_count
                if(bit_count > 31)                                                      // If bit_count > 31
                {
                    nec_ok = 1;                                                         // Change nec_ok to 1
                    INTCONbits.INT0IE = 0;                                              // Turn off INT0
                    Nec_state = 0;                                                      // Go to Nec_state 0 
                }
                Nec_state = 3;                                                          // Go to Nec_state 3   
            }
            else
            {
                force_nec_state0();                                                     // If Time is not between 400 and 1800, call force_nec_state0()
            }
            INTCON2bits.INTEDG0 = 1;                                                    // Change to rising edge
            return;
        }
    }
}

void main()
{
    init_UART();
    OSCCON = 0x70;                                                                      // 8 Mhz
    nRBPU = 0;                                                                          // Enable PORTB internal pull up resistor
    TRISB = 0x01;                                                                       // Assign PORTB bit 0 as input, rest as outputs
    TRISC = 0x00;                                                                       // PORTC as output
    TRISD = 0x00;                                                                       // PORTD as output
    TRISE = 0x00;                                                                       // PORTE as output
    ADCON1 = 0x0F;                                                                      //
    Initialize_Screen();
    INTCONbits.INT0IF = 0;                                                              // Clear external interrupt
    INTCON2bits.INTEDG0 = 0;                                                            // Edge programming for INT0 falling edge H to L
    INTCONbits.INT0IE = 1;                                                              // Enable external interrupt
    TMR1H = 0;                                                                          // Reset Timer1
    TMR1L = 0;                                                                          //
    PIR1bits.TMR1IF = 0;                                                                // Clear timer 1 interrupt flag
    PIE1bits.TMR1IE = 1;                                                                // Enable Timer 1 interrupt
    INTCONbits.PEIE = 1;                                                                // Enable Peripheral interrupt
    INTCONbits.GIE = 1;                                                                 // Enable global interrupts
    nec_ok = 0;                                                                         // Clear flag
    Nec_code = 0x0;                                                                     // Clear code
    
    while(1)
    {
        if (nec_ok == 1)                                                                // If signal is received
        {
            
            nec_ok = 0;                                                                 // Turn nec_ok off

            Nec_code1 = (char) ((Nec_code >> 8));                                       // Shift Nec_code 8 bits to the right
            
            INTCONbits.INT0IE = 1;                                                      // Enable external interrupt
            INTCON2bits.INTEDG0 = 0;                                                    // Edge programming for INT0 falling edge
            
            char found = 0xff;                                                          // Create char found equal to 0xff
            
            for(int i = 0; i < 21; i++)                                                 // Search for key
            {
                if (Nec_code1 == array1[i])                                             // If the key is found in array1
                {
                    found = i;                                                          // Assign found as the key
                }
            }
            if (found != 0xff)                                                          // Output to LCD if found
            {
                fillCircle(Circle_X, Circle_Y, Circle_Size, color[found]); 
                drawCircle(Circle_X, Circle_Y, Circle_Size, ST7735_WHITE);  
                drawtext(Text_X, Text_Y, txt1[found], ST7735_WHITE, ST7735_BLACK,TS_1); 
            }
            printf ("NEC_Code = %08lx %x Found = %d \r\n", Nec_code, Nec_code1, found); // Print out to TeraTerm if it is found
            PORTD=D1[found] | D3[found];                                                // Output found to PORTD
            PORTE=D2[found];                                                            // Output found to PORTE
            D6 = 1;                                                                     // Turn on D6
            Activate_Buzzer();                                                          // Turn on the Buzzer
            Wait_Half_Second();                                                         // Wait half a second
            D6 = 0;                                                                     // Turn off D6
            Deactivate_Buzzer();                                                        // Turn off the Buzzer
        }
    }
}


void Initialize_Screen()
{
    LCD_Reset();
    TFT_GreenTab_Initialize();
    fillScreen(ST7735_BLACK);
  
    /* TOP HEADER FIELD */
    txt = buffer;
    strcpy(txt, "ECE3301L Sp 22-S1");  
    drawtext(2, 2, txt, ST7735_WHITE, ST7735_BLACK, TS_1);

    strcpy(txt, "LAB 10 ");  
    drawtext(50, 10, txt, ST7735_WHITE, ST7735_BLACK, TS_1);
}

void Activate_Buzzer()
{
    PR2 = 0b11111001;
    T2CON = 0b00000101;
    CCPR2L = 0b01001010;
    CCP2CON = 0b00111100;
}

void Deactivate_Buzzer()
{
    CCP2CON = 0x0;
    PORTBbits.RB3 = 0;
}

void Wait_One_Second()                                                                      
{                                                                           
    Wait_Half_Second();                                                                     
                                                                          
    Wait_Half_Second();                                                                     
}

void Wait_One_Second_With_Beep()                                                           
{                                                                          
    Activate_Buzzer();                                                                     
    Wait_Half_Second();                                                           
                                                                             
    Deactivate_Buzzer();                                                                
    Wait_Half_Second();                                                                     
}

void Wait_Half_Second()
{
    T0CON = 0x03;                                                                       // Timer 0, 16-bit mode, prescaler 1:16
    TMR0L = 0xDB;                                                                       // Set the lower byte of TMR
    TMR0H = 0x0B;                                                                       // Set the upper byte of TMR
    INTCONbits.TMR0IF = 0;                                                              // Clear the Timer 0 flag
    T0CONbits.TMR0ON = 1;                                                               // Turn on the Timer 0
    while (INTCONbits.TMR0IF == 0);                                                     // Wait for the Timer Flag to be 1 for done
    T0CONbits.TMR0ON = 0;                                                               // Turn off the Timer 0
}
