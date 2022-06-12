
#include <p18f4620.h>
#include "Main.h"
#include "Fan_Support.h"
#include "stdio.h"

extern char HEATER;
extern char duty_cycle;
extern char heater_set_temp;
extern signed int DS1621_tempF;

int rpm;

char D2[7] = {0x01, 0x03, 0x02, 0x04, 0x05, 0x06, 0x07};

int get_duty_cycle(signed int temp, int set_temp)
{
if (temp >= set_temp)
        {
            duty_cycle = 0;                                         // If temp is greater than or equal to the set temp, then set DC to 0.
        }
    if (temp < set_temp) 
        {
           int diff = set_temp - temp;                              // If not, then calculate the difference and assign new DC based on the handout

            if (diff > 50)
            {
                duty_cycle = 100;                                   // Set DC = 100 if diff > 50
            }
            if (diff >= 25 & diff < 50)
            {
                duty_cycle = diff * 2;                              // Set DC = diff * 2 if diff is between 25 and 50
            }
            if (diff >= 10 & diff < 25)
            {
                duty_cycle = diff * 3/2;                            // Set DC = diff * 3 / 2 if diff is between 10 and 25
            }
            if (diff >= 0 & diff < 10)
            {
                duty_cycle = diff;                                  // Set DC = diff if diff is between 0 and 10
            }
        }
    return duty_cycle;                                              // Return the new duty_cycle
}

void Monitor_Heater()
{
    duty_cycle = get_duty_cycle(DS1621_tempF, heater_set_temp);
    do_update_pwm(duty_cycle);
    if (duty_cycle >= 70)                   
        PORTD = ((PORTD & 0xF8) | 0x07);                            // Assign the LED D1 based on the DC
    else
        PORTD = ((PORTD & 0xF8) | duty_cycle/10);
    if (rpm < 1)
        PORTE = 0x00;                                               // Assign the LED D2 based on the RPM
    else
        PORTE = D2[(rpm / 500)];
    if (HEATER == 1)                                                // Enable FAN_EN based on the HEATER
    {
        FAN_EN = 1;
    }
    else FAN_EN = 0;
}

void Toggle_Heater()
{
// add code just to flip the variable FAN
    if (HEATER==0) Turn_On_Fan();                                   // HEATER is initially set to off, turn on
    else Turn_Off_Fan();                                            // If HEATER is already running, then turn off
}

int get_RPM()
{
// add old code
    int RPS = TMR3L / 2;                                            // read the count. Since there are 2 pulses per rev
                                                                    // then RPS = count /2
    TMR3L = 0;                                                      // clear out the count
    return (RPS * 60);                                              // return RPM = 60 * RPS 
}

void Turn_Off_Fan()
{
// add old code   
    printf ("Fan is turned off\r\n");
    HEATER = 0;                                                     // Turn off HEATER flag
    do_update_pwm(0);                                               // Turn off PWM
    FAN_EN = 0;                                                     // Turn off FAN_EN pin
    FAN_LED = 0;                                                    // Turn off FAN_LED pin
}

void Turn_On_Fan()
{
// add old code 
    printf ("Fan is turned on\r\n");
    HEATER = 1;                                                     // Turn on HEATER flag
    do_update_pwm(duty_cycle);                                      // Update the PWM with the current duty cycle
    FAN_EN = 1;                                                     // Turn on FAN_EN pin
    FAN_LED = 1;                                                    // Turn on FAN_LED pin
}
