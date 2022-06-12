
#include <p18f4620.h>
#include "Main.h"
#include "Fan_Support.h"
#include "stdio.h"

extern char HEATER;
extern int duty_cycle;
extern char heater_set_temp;
extern signed int DS1621_tempF;

int get_duty_cycle(signed int temp, int set_temp)
{
// add code to check if temp is greater than set_temp. If so, set dc according to the handout
// check if dc is greater than 100. If so, set it to 100
// if dc is negative, set to 0
// return dc
    if (temp >= set_temp) duty_cycle = 0; 
    else
    {
        int diff = set_temp - temp;
        if (diff > 50) duty_cycle = 100;
        if (diff >= 25 && diff < 50) duty_cycle = diff * 2;
        if (diff >= 10 && diff < 25) duty_cycle = diff*3/2;
        if (diff >= 0 && diff < 10) duty_cycle = diff;
    }
}

void Monitor_Heater()
{
    duty_cycle = get_duty_cycle(DS1621_tempF, heater_set_temp);
    do_update_pwm(duty_cycle);
    int rpm = get_RPM(); // Measure RPM
    Set_DC_RGB(duty_cycle); // Update D1
    Set_RPM_RGB(rpm); // Update D2
    if (HEATER == 1) 
    {
        FAN_EN = 1;
    }
    else FAN_EN = 0;
}

void Toggle_Heater()
{
// add code just to flip the variable FAN
    if (HEATER==0) Turn_On_Fan();                  // Fan is initially set to off, turn on
    else Turn_Off_Fan();                        // If fan is already running, then turn off

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
    HEATER = 0;                                    // Turn of FAN flag
    do_update_pwm(0);
    FAN_EN = 0;                                 // Turn off FAN pin

}

void Turn_On_Fan()
{
// add old code 
    printf ("Fan is turned on\r\n");
    HEATER = 1;                                    // Turn on FAN flag
    do_update_pwm(duty_cycle);                  // Update the PWM with the current duty cycle
    FAN_EN = 1;                                 // Turn on FAN pin
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





