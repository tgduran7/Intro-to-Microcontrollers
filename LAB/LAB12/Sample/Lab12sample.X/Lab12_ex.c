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
#include "Fan_Support.h"
#include "Main.h"
#include "ST7735_TFT.h"

#pragma config OSC = INTIO67
#pragma config BOREN =OFF
#pragma config WDT=OFF
#pragma config LVP=OFF
#pragma config CCP2MX = PORTBE

#define RD               ST7735_RED
#define BU               ST7735_BLUE
#define GR               ST7735_GREEN
#define MA               ST7735_MAGENTA
#define BK               ST7735_BLACK

#define D3R 0x10
#define D3B 0x40
#define D3M 0x50
#define D3W 0x70

#define D3_RED PORTDbits.RD4
#define D3_GREEN PORTDbits.RD5
#define D3_BLUE PORTDbits.RD6

#define D6 PORTBbits.RB7 

void Initialize_Screen();
char second = 0x00;
char minute = 0x00;
char hour = 0x00;
char dow = 0x00;
char day = 0x00;
char month = 0x00;
char year = 0x00;

char found;
char tempSecond = 0xff; 
signed int DS1621_tempC, DS1621_tempF;
char setup_second, setup_minute, setup_hour, setup_day, setup_month, setup_year;
char alarm_second, alarm_minute, alarm_hour, alarm_date;
char setup_alarm_second, setup_alarm_minute, setup_alarm_hour;
unsigned char setup_fan_temp = 75;
unsigned char Nec_state = 0;

short nec_ok = 0;
char Nec_code1;
char FAN;
char duty_cycle;
int rps;
int rpm;
int ALARMEN;

char buffer[33]     = " ECE3301L Sp'22 L12\0";
char *nbr;
char *txt;
char tempC[]        = "+25";
char tempF[]        = "+77";
char time[]         = "00:00:00";
char date[]         = "00/00/00";
char alarm_time[]   = "00:00:00";
char Alarm_SW_Txt[] = "OFF";
char Fan_SW_Txt[]   = "OFF";                // text storage for Heater Mode

char array1[21]={0xa2, 0x62, 0xe2, 0x22, 0x2, 0xc2, 0xe0, 0xa8, 0x90, 0x68,             // Array for IR values          
                0x98, 0xb0, 0x30, 0x18, 0x7a, 0x10, 0x38, 0x5a, 0x42, 0x4a, 0x52};

char txt1[21][4] ={"CH-\0", "CH \0", "CH+\0", "PRV\0", "NXT\0", "P/P\0", "VL-",         // Array for Remote Button Labels 
                    "VL+", "EQ \0", " 0 \0", "100\0", "200\0", " 1 \0", " 2 \0", 
                    " 3 \0", " 4 \0", " 5 \0", " 6 \0", " 7 \0", " 8 \0", " 9 \0"};
int color[21]={RD, RD, RD, BU, BU, GR, MA, MA, MA, BK, BK, BK, BK, BK,                  // Array for LCD Button Fill Colors 
                BK, BK, BK, BK, BK, BK, BK};

char D3[21] ={D3R,0,0,D3B,0,0,D3M,0,0,D3W,0,0,D3W,0,0,D3W,0,0,D3W,0,0};                 // Array for RGB LED Sequence D3
    
char DC_Txt[]       = "000";                // text storage for Duty Cycle value
char RTC_ALARM_Txt[]= "0";                      //
char RPM_Txt[]      = "0000";               // text storage for RPM

char setup_time[]       = "00:00:00";
char setup_date[]       = "01/01/00";
char setup_alarm_time[] = "00:00:00"; 
char setup_fan_text[]   = "075F";


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

void Do_Init()                      // Initialize the ports 
{ 
    init_UART();                    // Initialize the uart
    OSCCON=0x70;                    // Set oscillator to 8 MHz 
    
    ADCON1=0x0F;
    TRISA = 0x00;
    TRISB = 0x01;
    TRISC = 0x01;
    TRISD = 0x00;
    TRISE = 0x00;


    RBPU=0;
    TMR3L = 0x00;                   
    T3CON = 0x03;
    I2C_Init(100000); 

    DS1621_Init();
    init_INTERRUPT();
    FAN = 0;
}

void main() 
{
    Do_Init();                                                  // Initialization  
    Initialize_Screen();  
    
    // PART A //
//    FAN_EN = 1;
//    //FANEN_LED = 1;
//    FAN_PWM = 1;
//    duty_cycle = 100;
//    while (1)
//    {
//        DS3231_Read_Time();
//
//        if(tempSecond != second)
//        {   
//            rpm = get_RPM();
//            tempSecond = second;
//            DS1621_tempC = DS1621_Read_Temp();
//            DS1621_tempF = (DS1621_tempC * 9 / 5) + 32;
//            
//            printf ("%02x:%02x:%02x %02x/%02x/%02x",hour,minute,second,month,day,year);
//            printf (" Temp = %d C = %d F ", DS1621_tempC, DS1621_tempF);
//            printf ("RPM = %d  dc = %d\r\n", rpm, duty_cycle);
//        }
//    }
    
    // PART B1 //
    FAN_EN = 1;
    duty_cycle = 50;
    do_update_pwm(duty_cycle);
        DS3231_Read_Time();

        if(tempSecond != second)
        {
            tempSecond = second;
            DS1621_tempC = DS1621_Read_Temp();
            DS1621_tempF = (DS1621_tempC * 9 / 5) + 32;
            rpm = get_RPM();
            printf ("%02x:%02x:%02x %02x/%02x/%02x",hour,minute,second,month,day,year);
            printf (" Temp = %d C = %d F ", DS1621_tempC, DS1621_tempF);
            printf ("RPM = %d  dc = %d\r\n", rpm, duty_cycle);
        }    
    
    FAN_EN = 1;
    duty_cycle = 50;    
    do_update_pwm(duty_cycle);
    while (1)
    {
        DS3231_Read_Time();

        if(tempSecond != second)
        {
            tempSecond = second;
            DS1621_tempC = DS1621_Read_Temp();
            DS1621_tempF = (DS1621_tempC * 9 / 5) + 32;
            rpm = get_RPM();
            printf ("%02x:%02x:%02x %02x/%02x/%02x",hour,minute,second,month,day,year);
            printf (" Temp = %d C = %d F ", DS1621_tempC, DS1621_tempF);
            printf ("RPM = %d  dc = %d\r\n", rpm, duty_cycle);
        }
    }
    
    // PART D & E //
//    FAN_EN = 0;
//    duty_cycle = 50;
//    while (1)
//    {
//
//        DS3231_Read_Time();
//
//        if(tempSecond != second)
//        {
//            tempSecond = second;
//            DS1621_tempC = DS1621_Read_Temp();
//            DS1621_tempF = (DS1621_tempC * 9 / 5) + 32;
//            rpm = get_RPM();
//            printf ("%02x:%02x:%02x %02x/%02x/%02x",hour,minute,second,month,day,year);
//            printf (" Temp = %d C = %d F ", DS1621_tempC, DS1621_tempF);
//            printf ("RPM = %d  dc = %d\r\n", rpm, duty_cycle);
//            Update_Screen();
//            
//        }
//       
//       if (nec_ok == 1)
//        {
//            nec_ok = 0;
//
//            printf ("NEC_Code = %x\r\n", Nec_code1);       // make sure to use Nec_code1
//
//            INTCONbits.INT0IE = 1;          // Enable external interrupt
//            INTCON2bits.INTEDG0 = 0;        // Edge programming for INT0 falling edge
//
//            found = 0xff;
//            for (int j=0; j< 21; j++)
//            {
//                if (Nec_code1 == array1[j]) 
//                {
//                    found = j;
//                    j = 21;
//                }
//            }
//            
//            if (found == 0xff) 
//            {
//                printf ("Cannot find button \r\n");
//            }
//            else
//            {
//                Do_Beep();
//                printf ("button = %d \r\n", found);
//                if(found == 6)
//                {
//                    Decrease_Speed();
//                    PORTD = color[found] << 4;
//                }
//                if(found == 7)
//                {
//                    Increase_Speed();
//                    PORTD = color[found] << 4;
//                    
//                }
//                if(found == 5)
//                {
//                    Toggle_Fan();
//                    PORTD = color[found] << 4;
//                }
//                if (found == 8)
//                {
//                    DS3231_Setup_Time();  
//                    PORTD = color[found] << 4;// If the EQ button was pressed, redo the time setup
//                }
//               Set_DC_RGB(duty_cycle);
//              
//            }            
//            Set_RPM_RGB(rpm);
//        }
//    }
}







