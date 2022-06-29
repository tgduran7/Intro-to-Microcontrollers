#include <p18f4620.h>
#include "Main.h"
#include "Utils.h"
#include "stdio.h"
#include "Fan_Support.h"

char duty_cycle;                    // Use the duty_cycle variable from the Fan_support.h

void Do_Beep()
{
    Activate_Buzzer();              // Turn on buzzer      
    Wait_Half_Second();                 // Wait One Second
    Deactivate_Buzzer();            // Turn off buzzer
    do_update_pwm(duty_cycle);      // Update the pwm
}

void Wait_One_Sec()
{
    Wait_Half_Second();             // Wait Half a Second
    Wait_Half_Second();             // Wait Half a Second
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
    CCP2CON = 0x00;
    PORTBbits.RB3 = 0;
}

void Wait_Half_Second()
{
    T0CON = 0x03;                   // Timer 0, 16-bit mode, prescaler 1:16
    TMR0L = 0xDB;                   // Set the lower byte of TMR
    TMR0H = 0x0B;                   // Set the upper byte of TMR
    INTCONbits.TMR0IF = 0;          // Clear the Timer 0 flag
    T0CONbits.TMR0ON = 1;           // Turn on the Timer 0
    while (INTCONbits.TMR0IF == 0); // Wait for the Timer Flag to be 1 for done
    T0CONbits.TMR0ON = 0;           // Turn off the Timer 0
}

