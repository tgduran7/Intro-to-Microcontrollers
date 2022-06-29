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
#include "Main_Screen.h"

#pragma config OSC = INTIO67
#pragma config BOREN =OFF
#pragma config WDT=OFF
#pragma config LVP=OFF
#pragma config CCP2MX = PORTBE

// colors
#define RD               ST7735_RED
#define BU               ST7735_BLUE
#define GR               ST7735_GREEN
#define MA               ST7735_MAGENTA
#define BK               ST7735_BLACK

//#define PORTD
#define D1R 0x01    // Port Hex value for D1 Red
#define D1G 0x02    // Port Hex value for D1 Green
#define D1B 0x04    // Port Hex value for D1 Blue
#define D1M 0x05    // Port Hex value for D1 Magenta
#define D1W 0x07    // Port Hex value for D1 White

#define D2R 0x01    // Port Hex value for D2 Red
#define D2G 0x02    // Port Hex value for D2 Green
#define D2B 0x04    // Port Hex value for D2 Blue
#define D2M 0x05    // Port Hex value for D2 Magenta
#define D2W 0x07    // Port Hex value for 3 White

#define D3R 0x01    // Port Hex value for D1 Red
#define D3G 0x02    // Port Hex value for D3 Green
#define D3B 0x04    // Port Hex value for D3 Blue
#define D3M 0x05    // Port Hex value for D3 Magenta
#define D3W 0x07    // Port Hex value for D3 White

#define D1_RED PORTDbits.RD0
#define D1_GREEN PORTDbits.RD1
#define D1_BLUE PORTDbits.RD2

#define D2_RED PORTEbits.RE0
#define D2_GREEN PORTEbits.RE1
#define D2_BLUE PORTEbits.RE2

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

char array1[21]={0xa2,0x62,0xe2,0x22,0x02,0xc2,0xe0,0xa8,0x90,0x68,0x98,0xb0,
                 0x30,0x18,0x7a,0x10,0x38,0x5a,0x42,0x4a,0x52}; // Array for Nec_code1 values
char color[21] = { D3R, D3R, D3R, D3B, D3B, D3G, D3M, D3M, D3M ,D3W ,D3W ,D3W ,
                   D3W ,D3W ,D3W ,D3W ,D3W ,D3W ,D3W ,D3W, D3W };
//char color[21] = { D3R, D2R, D1R, D3B, D2B, D1G, D3M, D2M, D1M ,D3W ,D2W ,D1W ,
//                   D3W ,D2W ,D1W ,D3W ,D2W ,D1W ,D3W ,D2W, D1W };
    
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

//    FAN_EN = 1;
//    FAN_LED = 1;
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
    
//    FAN_EN = 1;
//    duty_cycle = 40;
//    do_update_pwm(duty_cycle);
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
//        }    
    
//    FAN_EN = 1;
//    duty_cycle = 30;    
//    do_update_pwm(duty_cycle);
//    while (1)
//    {
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
//        }
//    }
//  
    FAN_EN = 0;
    duty_cycle = 50;
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
            Update_Screen();
        }
        
       if (nec_ok == 1)
        {
            nec_ok = 0;

            printf ("NEC_Code = %x\r\n", Nec_code1);       // make sure to use Nec_code1

            INTCONbits.INT0IE = 1;          // Enable external interrupt
            INTCON2bits.INTEDG0 = 0;        // Edge programming for INT0 falling edge

            found = 0xff;
            for (int j=0; j< 21; j++)
            {
                if (Nec_code1 == array1[j]) 
                {
                    found = j;
                    j = 21;
                }
            }
            //PORTD = color[found] << 4;
            if (found == 0xff) 
            {
                printf ("Cannot find button \r\n");
            }
            else
            {
                Do_Beep();
                printf ("button = %d \r\n", found);
                
                if(found == 5)  // Pause / Play Button
                {
                    Toggle_Fan();   // Call Toggle_Fan()
                    //PORTD = color[found] << 4;  // Shift the button color value to bits 4,5,6
                }
                else if(found == 6) // Decrease Button
                {
                    Decrease_Speed();   // Call Decrease_Speed()
                    //PORTD = color[found] << 4; // Shift the button color value to bits 4,5,6
                }
                else if(found == 7) // Increase Button
                {
                    Increase_Speed();   // Call Increase_Speed()
                    //PORTD = color[found] << 4;  // Shift the button color value to bits 4,5,6
                }
                else if(found == 8) // Reset Time Button
                {
                    DS3231_Setup_Time(); // Call DS3231_Setup_Time()
                    //PORTD = color[found] << 4;  // Shift the button color value to bits 4,5,6
                }
                PORTD = color[found] << 4;
            Set_DC_RGB(duty_cycle); // Set D1 LED based on duty cycle
            }
            D6 = 1;
            Wait_Half_Second();
            D6 = 0;
        }
        Set_RPM_RGB(rpm);   // Set D2 LED based on rpm
        
        
    }
}