#include <p18f4620.h>
#include "Main.h"
#include "Fan_Support.h"
#include "stdio.h"

extern char FAN;
extern char duty_cycle;

int get_RPM()
{
    int RPS = TMR3L / 2;                        // read the count. Since there are 2 pulses per rev
                                                // then RPS = count /2
    TMR3L = 0;                                  // clear out the count
    return (RPS * 60);                          // return RPM = 60 * RPS 
}

void Toggle_Fan()
{
    if (FAN==0) Turn_On_Fan();                  // Fan is initially set to off, turn on
    else Turn_Off_Fan();                        // If fan is already running, then turn off
}

void Turn_Off_Fan()
{
    printf ("Fan is turned off\r\n");
    FAN = 0;                                    // Turn of FAN flag
    do_update_pwm(0);
    FAN_EN = 0;                                 // Turn off FAN pin
}

void Turn_On_Fan()
{
    printf ("Fan is turned on\r\n");
    FAN = 1;                                    // Turn on FAN flag
    do_update_pwm(duty_cycle);                  // Update the PWM with the current duty cycle
    FAN_EN = 1;                                 // Turn on FAN pin
}

void Increase_Speed()
{
    if(duty_cycle == 100)                       // Check if duty cycle is at 100
    {
        Do_Beep();                              // Beep twice
        do_update_pwm(duty_cycle);              // Update the duty cycle which should be at 100
    }
    else                                        // If duty cycle is not at the max value
    {
        duty_cycle = duty_cycle + 5;            // Add 5 duty cycle  
        //duty_cycle += 5;
        do_update_pwm(duty_cycle);              // Update with the new duty cycle
    }
}

void Decrease_Speed()
{
    if(duty_cycle == 0)                         // Check if duty cycle is at 0
    {
        Do_Beep();                              // Beep twice
        do_update_pwm(duty_cycle);              // Update the duty cycle which should be 0
    }
    else                                        // If duty cycle is not at minimum value
    {
        duty_cycle = duty_cycle - 5;            // Subtract 5 duty cycle
        //duty_cycle -= 5;
        do_update_pwm(duty_cycle);              // Update with the new duty cycle
    }
}

void do_update_pwm(char duty_cycle) 
{ 
    float dc_f;
    int dc_I;
    PR2 = 0b00000100 ;                          // set the frequency for 25 Khz
    T2CON = 0b00000111 ;                        //
    dc_f = ( 4.0 * duty_cycle / 20.0) ;         // calculate factor of duty cycle versus a 25 Khz
                                                // signal
    dc_I = (int) dc_f;                          // get the integer part
    if (dc_I > duty_cycle) dc_I++;              // round up function
    CCP1CON = ((dc_I & 0x03) << 4) | 0b00001100;
    CCPR1L = (dc_I) >> 2; 
}

void Set_DC_RGB(int duty_cycle)
{
    if (duty_cycle >= 70) PORTD = PORTD | 7;    // If duty cycle is greater or equal to 70, write 7 along with current PORTD
    else PORTD = PORTD | (duty_cycle/10);       // If not, then write duty_cycle/10 to the current PORTD
}

void Set_RPM_RGB(int rpm)
{
    int temp[7] = { 1, 3, 2, 4, 5, 6, 7};       // Create array for LED colors
    if (rpm < 1) PORTE = 0x00;                  // If rmp is less than 1, turn off PORTE LED
    else PORTE = temp[(rpm/500)];               // Assign PORTE as rpm/500 which will select the color
}



