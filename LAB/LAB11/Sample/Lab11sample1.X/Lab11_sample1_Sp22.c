#include <stdio.h>
#include <stdlib.h>
#include <xc.h>
#include <math.h>
#include <p18f4620.h>
#include <usart.h>
#include <string.h>

#include "I2C_Soft.h"
#include "I2C_Support.h"
#include "Interrupt.h"
#include "ST7735.h"

#pragma config OSC = INTIO67
#pragma config BOREN = OFF
#pragma config WDT = OFF
#pragma config LVP = OFF
#pragma config CCP2MX = PORTBE

#define Circle_Size     20              // Size of Circle for Light
#define Circle_X        60              // Location of Circle
#define Circle_Y        80              // Location of Circle
#define Text_X          52
#define Text_Y          77
#define TS_1            1               // Size of Normal Text
#define TS_2            2               // Size of Big Text

#define D6 PORTBbits.RB7


// colors
#define RD               ST7735_RED
#define BU               ST7735_BLUE
#define GR               ST7735_GREEN
#define MA               ST7735_MAGENTA
#define BK               ST7735_BLACK

#define kp               PORTEbits.RE1     

#define Circle_Size     20              // Size of Circle for Light
#define Circle_X        60              // Location of Circle
#define Circle_Y        80              // Location of Circle
#define Text_X          52
#define Text_Y          77
#define TS_1            1               // Size of Normal Text
#define TS_2            2               // Size of Big Text

#define D1R 0x01
#define D1G 0x02
//#define D1B 0x04
#define D1M 0x05
#define D1W 0x07

#define D2R 0x01
//#define D2G 0x02
#define D2B 0x04
#define D2M 0x05
#define D2W 0x07

#define D3R 0x10
//#define D3G 0x20
#define D3B 0x40
#define D3M 0x50
#define D3W 0x70

#define RD               ST7735_RED
#define BU               ST7735_BLUE
#define GR               ST7735_GREEN
#define MA               ST7735_MAGENTA
#define BK               ST7735_BLACK

char tempSecond = 0xff; 
char second = 0x00;
char minute = 0x00;
char hour = 0x00;
char dow = 0x00;
char day = 0x00;
char month = 0x00;
char year = 0x00;



char setup_second, setup_minute, setup_hour, setup_day, setup_month, setup_year;
char alarm_second, alarm_minute, alarm_hour, alarm_date;
char setup_alarm_second, setup_alarm_minute, setup_alarm_hour;

char array1[21]={0xa2, 0x62, 0xe2, 0x22, 0x2, 0xc2, 0xe0, 0xa8, 0x90, 0x68, 0x98, 0xb0, 0x30, 0x18, 0x7a, 0x10, 0x38, 0x5a, 0x42, 0x4a, 0x52};
char txt1[21][4] ={"CH-\0", "CH \0", "CH+\0", "PRV\0", "NXT\0", "P/P\0", "VL-", "VL+", "EQ \0", " 0 \0", "100\0", "200\0", " 1 \0", " 2 \0", " 3 \0", " 4 \0", " 5 \0", " 6 \0", " 7 \0", " 8 \0", " 9 \0"};
int color[21]={RD, RD, RD, BU, BU, GR, MA, MA, MA, BK, BK, BK, BK, BK, BK, BK, BK, BK, BK, BK, BK};
char D3[21] ={D3R,0,0,D3B,0,0,D3M,0,0,D3W,0,0,D3W,0,0,D3W,0,0,D3W,0,0};
char D2[21] ={0,D2R,0,0,D2B,0,0,D2M,0,0,D2W,0,0,D2W,0,0,D2W,0,0,D2W,0};
char D1[21] ={0,0,D1R,0,0,D1G,0,0,D1M,0,0,D1W,0,0,D1W,0,0,D1W,0,0,D1W};

char TempSecond;

char buffer[31];                        // general buffer for display purpose
char *nbr;                              // general pointer used for buffer
char *txt;

short nec_ok = 0;
char Nec_code1;
char found;

void Deactivate_Buzzer();
void Activate_Buzzer();
void Initialize_Screen();
void Wait_One_Sec();
void Wait_Half_Second();

void putch (char c)
{   
    while (!TRMT);       
    TXREG = c;
}

void init_UART()
{
    OpenUSART (USART_TX_INT_OFF & USART_RX_INT_OFF & USART_ASYNCH_MODE & USART_EIGHT_BIT & USART_CONT_RX & USART_BRGH_HIGH, 25);
    OSCCON = 0x70;
}


void Wait_One_Sec()
{
    Wait_Half_Second();
    Wait_Half_Second();
}


void Do_Init()                      
{ 
    init_UART();                    // Initialize the uart
    init_INTERRUPT();
    OSCCON=0x70;                    // Set oscillator to 8 MHz 
    
    ADCON1= 0x0F;
    TRISA = 0x00;
    TRISB = 0x11;
    TRISC = 0x00;                   
    TRISD = 0x80;
    TRISE = 0x00;
    RBPU=0;
    I2C_Init(100000); 

    DS1621_Init();

}


void main() 
{ 
    Do_Init();                                                  // Initialization  
    Initialize_Screen();

//    while (1)							// This is for the DS1621 testing. Comment this section
//    {								// out to move on to the next section
//
//        signed char tempC = DS1621_Read_Temp();
//        signed char tempF = (tempC * 9 / 5) + 32;
//        printf (" Temperature = %d degreesC = %d degreesF\r\n", tempC, tempF);
//        Wait_One_Sec();
//    }
      
      DS3231_Setup_Time();
      while (1)						// This is for the DS3231 testing. Comment this section
      {							// out to move on to the next section

        DS3231_Read_Time();
        if(tempSecond != second)
        {
            tempSecond = second;
            signed char tempC = DS1621_Read_Temp();
            signed char tempF = (tempC * 9 / 5) + 32;
            printf ("%02x:%02x:%02x %02x/%02x/%02x",hour,minute,second,month,day,year);
            printf (" Temperature = %d degreesC = %d degreesF\r\n", tempC, tempF);
        }
    
        if (nec_ok == 1)
        {
            
            nec_ok = 0;

         
            
            INTCONbits.INT0IE = 1;          // Enable external interrupt
            INTCON2bits.INTEDG0 = 0;        // Edge programming for INT0 falling edge
            
            char found = 0xff;
            
            // add code here to look for code
            
            for(int i = 0; i < 21; i++)
            {
                if (Nec_code1 == array1[i])
                {
                    found = i;
                }
            }
            if (found != 0xff) 
            {
                fillCircle(Circle_X, Circle_Y, Circle_Size, color[found]); 
                drawCircle(Circle_X, Circle_Y, Circle_Size, ST7735_WHITE);  
                drawtext(Text_X, Text_Y, txt1[found], ST7735_WHITE, ST7735_BLACK,TS_1); 
            }
           printf ("NEC_Code = %x Found = %d \r\n", Nec_code1, found);
            if (found == 8)
            {
                DS3231_Setup_Time();
            }
            PORTD=D1[found] | D3[found];
            PORTE=D2[found];
            D6 = 1;
            Activate_Buzzer();
            Wait_Half_Second();
            D6 = 0;
            Deactivate_Buzzer();
        }
      }
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

void Initialize_Screen()
{
    LCD_Reset();
    TFT_GreenTab_Initialize();
    fillScreen(ST7735_BLACK);
  
    /* TOP HEADER FIELD */
    txt = buffer;
    strcpy(txt, "ECE3301L Spring 22-S1");  
    drawtext(2, 2, txt, ST7735_WHITE, ST7735_BLACK, TS_1);

    strcpy(txt, "LAB 11 ");  
    drawtext(50, 10, txt, ST7735_WHITE, ST7735_BLACK, TS_1);
}

void Wait_Half_Second()
{
    T0CON = 0x03;                                                                           // Timer 0, 16-bit mode, prescaler 1:16
    TMR0L = 0xDB;                                                                           // Set the lower byte of TMR
    TMR0H = 0x0B;                                                                           // Set the upper byte of TMR
    INTCONbits.TMR0IF = 0;                                                                  // Clear the Timer 0 flag
    T0CONbits.TMR0ON = 1;                                                                   // Turn on the Timer 0
    while (INTCONbits.TMR0IF == 0);                                                         // Wait for the Timer Flag to be 1 for done
    T0CONbits.TMR0ON = 0;                                                                   // Turn off the Timer 0
}




