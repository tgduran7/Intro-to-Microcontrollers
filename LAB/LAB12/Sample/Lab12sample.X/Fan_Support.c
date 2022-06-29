#include <p18f4620.h>
#include "Main.h"
#include "Fan_Support.h"
#include "stdio.h"

extern char FAN;
extern char duty_cycle;


int get_RPM()
{
    int RPS = TMR3L / 2; // read the count. Since there are 2 pulses per rev
                         // then RPS = count /2
    TMR3L = 0;           // clear out the count
    return (RPS * 60);   // return RPM = 60 * RPS
}

// PART C //
void Toggle_Fan()
{
    if (FAN == 0) Turn_On_Fan();
    else Turn_Off_Fan();
}

void Turn_Off_Fan()
{
    printf ("Fan is turned off\r\n");
    FAN = 0;
    FAN_EN = 0;
    //FAN_LED = 0;
}

void Turn_On_Fan()
{
    printf ("Fan is turned on\r\n");
    FAN = 1;
    do_update_pwm(duty_cycle);
    FAN_EN = 1;
    //FAN_LED = 1;
}

void Increase_Speed()
{
    if (duty_cycle == 100)
    {
        Do_Beep();
        Do_Beep();
        do_update_pwm(100);
    }
    else
    {
        duty_cycle = duty_cycle + 5;
        do_update_pwm(duty_cycle);
    }

}

void Decrease_Speed()
{
    if (duty_cycle == 0)
    {
        Do_Beep();
        Do_Beep();
        do_update_pwm(0);
    }
    else
    {
        duty_cycle = duty_cycle - 5;
        do_update_pwm(duty_cycle);
    }
}

void do_update_pwm(char duty_cycle) 
{ 
    float dc_f;
    int dc_I;
    PR2 = 0b00000100 ;                  // set the frequency for 25 Khz
    T2CON = 0b00000111 ;                //
    dc_f = ( 4.0 * duty_cycle / 20.0) ; // calculate factor of duty cycle versus a 25 Khz
                                        // signal
    dc_I = (int) dc_f;                  // get the integer part
    if (dc_I > duty_cycle) dc_I++;      // round up function
    CCP1CON = ((dc_I & 0x03) << 4) | 0b00001100;
    CCPR1L = (dc_I) >> 2;
}

// PART B3 //
void Set_DC_RGB(int duty_cycle)
{
    int DC = duty_cycle / 10;
    if (DC > 0 && DC < 8) PORTD = DC;
    if (DC <= 0) PORTD = 0x00;
    if (DC >= 8) PORTD = 0x07;
}

void Set_RPM_RGB(int rpm)
{
    int R = rpm / 500;
    if (R > 0 && R < 6) PORTE = R + 1;
    if (R <= 0) PORTE = 0x00;
    if (R >= 6) PORTE = 0x07;
}



