
#include <p18f4620.h>
#include "Main.h"
#include "Fan_Support.h"
#include "stdio.h"

extern char HEATER;
extern char duty_cycle;
extern char heater_set_temp;
extern signed int DS1621_tempF;
extern int rpm;

int get_duty_cycle(signed int temp, int set_temp)
{
if (temp >= set_temp)
{
    duty_cycle = 0;
}
if (temp < set_temp)
{
    int diff = set_temp - temp;
    if (diff > 50)
    {
        duty_cycle = 100;
    }
    if (diff >= 25 && diff < 50)
    {
        duty_cycle = diff * 2;
    }
    if (diff >= 10 && diff < 25)
    {
        duty_cycle = diff * 3/2;
    }
    if(diff >= 0 && diff < 10)
    {
        duty_cycle = diff;
    }
}
return duty_cycle;
// add code to check if temp is greater than set_temp. If so, set dc according to the handout
// check if dc is greater than 100. If so, set it to 100
// if dc is negative, set to 0
// return dc

}

void Monitor_Heater()
{
    duty_cycle = get_duty_cycle(DS1621_tempF, heater_set_temp);
    do_update_pwm(duty_cycle);
    rpm = get_RPM();
    
    Set_DC_RGB(duty_cycle)
    Set_RPM_RGB(rpm);
    if (HEATER == 1) 
    {
        FAN_EN = 1;
    }
    else FAN_EN = 0;
}

void Toggle_Heater()
{
// add code just to flip the variable FAN
    if (FAN_EN==0) Turn_On_Fan();        
    else Turn_Off_Fan(); 
}

int get_RPM()
{
// add old code
    int RPS = TMR3L / 2;                        // read the count. Since there are 2 pulses per rev
                                                // then RPS = count /2
    TMR3L = 0;                                  // clear out the count
    return (RPS * 60);                          // return RPM = 60 * RPS 
}

void Turn_Off_Fan()
{
// add old code   
    printf ("Fan is turned off\r\n");
    do_update_pwm(0);
    FAN_EN = 0; 
}

void Turn_On_Fan()
{
// add old code 
    printf ("Fan is turned on\r\n");
    do_update_pwm(duty_cycle);                  // Update the PWM with the current duty cycle
    FAN_EN = 1;  
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

void Increase_Speed()
{
    if(duty_cycle == 100)                       // Check if duty cycle is at 100
    {
        //Do_Beep();                              // Beep twice
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
        //Do_Beep();                              // Beep twice
        do_update_pwm(duty_cycle);              // Update the duty cycle which should be 0
    }
    else                                        // If duty cycle is not at minimum value
    {
        duty_cycle = duty_cycle - 5;            // Subtract 5 duty cycle
        //duty_cycle -= 5;
        do_update_pwm(duty_cycle);              // Update with the new duty cycle
    }
}






