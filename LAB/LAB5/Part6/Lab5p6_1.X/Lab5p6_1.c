// Lab 5 Part 6
#include <stdio.h>
#include <stdlib.h>
#include <xc.h>
#include <math.h>
#include <p18f4620.h>
#include <usart.h>

#pragma config OSC = INTIO67
#pragma config BOREN = OFF
#pragma config WDT = OFF
#pragma config LVP = OFF

#define D1_RED PORTBbits.RB5                                                    // Define D1_RED as PORTB bit 5
#define D1_GREEN PORTBbits.RB6                                                  // Define D1_GREEN as PORTB bit 6
#define D1_BLUE PORTBbits.RB7                                                   // Define D1_BLUE as PORTB bit 7

#define D3_RED PORTAbits.RA4                                                    // Define D3_RED as PORTA bit 4
#define D3_GREEN PORTAbits.RA5                                                  // Define D3_GREEN as PORTA bit 5

void Init_ADC();                                                                // Prototype the Init_ADC Function
void Init_TRIS();                                                               // Prototype the Init_TRIS Function
unsigned int Get_Full_ADC();                                                    // Prototype the Get_Full_ADC Function
void Display_Upper_Digit(char);                                                 // Prototype the Display_Upper_Digit Function
void Display_Lower_Digit(char);                                                 // Prototype the Display_Lower_Digit Function
void DO_DISPLAY_D1(int);                                                        // Prototype the DO_DISPLAY_D1 Function
void DO_DISPLAY_D2(int);                                                        // Prototype the DO_DISPLAY_D2 Function
void DO_DISPLAY_D3(int);                                                        // Prototype the DO_DISPLAY_D3 Function

void SET_D1_CLEAR();                                                            // Prototype SET_D1_CLEAR Function
void SET_D1_RED();                                                              // Prototype SET_D1_RED Function
void SET_D1_GREEN();                                                            // Prototype SET_D1_GREEN Function
void SET_D1_BLUE();                                                             // Prototype SET_D1_BLUE Function
void SET_D1_WHITE();                                                            // Prototype SET_D1_WHITE Function

void SET_D3_RED();                                                              // Prototype SET_D1_RED Function
void SET_D3_GREEN();                                                            // Prototype SET_D1_GREEN Function
void SET_D3_YELLOW();                                                           // Prototype SET_D1_YELLOW Function


void Select_ADC_Channel (char channel)
{
    ADCON0 = channel * 4 + 1;
}

void putch (char c)
{
    while (!TRMT);
    TXREG = c;
}

void Init_UART() 
{
    OpenUSART (USART_TX_INT_OFF & USART_RX_INT_OFF &
    USART_ASYNCH_MODE & USART_EIGHT_BIT & USART_CONT_RX &
    USART_BRGH_HIGH, 25);
    OSCCON = 0x60;
}

void WAIT_1_SEC()
{
    for (int j=0; j<17000; j++);                                                // Wait for 17000 clock cycles
}

char array[10] = {0x40, 0x79, 0x24, 0x30, 0x19, 0x12, 0x02, 0x78, 0x00, 0x18};  // Array for digits 0-9 using Common Anode

void main(void)
{
    Init_UART();                                                                // Initialize the UART
    Init_ADC();                                                                 // Initialize the ADC
    Init_TRIS();                                                                // Initialize the TRIS PORTS
    PORTA = 0x00;                                                               // Clear PORTA
    PORTB = 0x00;                                                               // Clear PORTB
    PORTC = 0xFF;                                                               // Clear PORTC
    PORTD = 0xFF;                                                               // Clear PORTD
    PORTE = 0xFF;                                                               // Clear PORTE
    
    while(1)
    {
        Select_ADC_Channel(0);                                                  // Select ADC Channel to 0 for the Temperature Sensor
        int num_step = Get_Full_ADC();                                          // Run the ADC conversion and assign it to num_step
        float voltage_mv = num_step * 4.0;                                      // Convert the steps into voltage
        float temperature_C = (1035.0 - voltage_mv) / 5.50;                     // Convert the voltage into Celsius
        float temperature_F = 1.80 * temperature_C + 32.0;                      // Convert the temperature from Celsius to Farenheit
        int tempF = (int)temperature_F;                                         // Convert the temperature value into an int data type
        char U = tempF / 10;                                                    // Divide the int temp by 10 and assign it to U, for the upper 7seg
        char L = tempF % 10;                                                    // Do temp modulus 10 and assign it to L, for the lower 7seg 
        Display_Upper_Digit(U);                                                 // Display the Upper Digit using the Display Upper Function
        Display_Lower_Digit(L);                                                 // Display the Lower Digit using the Display Lower Function
        printf("Voltage = %f (mV) \r\n", voltage_mv);                           // Print out the voltage using TeraTerm
        printf("Temperature = %d F \r\n\n", tempF);                             // Print out the temperature using TeraTerm
        DO_DISPLAY_D2(tempF);                                                   // Display the temp using the LED D2 Function
        DO_DISPLAY_D1(tempF);                                                   // Display the temp using the LED D1 Function
        
        Select_ADC_Channel(1);                                                  // Select ADC Channel to 1 for Photo-resistor
        int num_step = Get_Full_ADC();                                          // Run the ADC conversion and assign it to num_step
        int voltage_mv1 = num_step * 4;                                         // Convert the steps into voltage
        printf("Light Volt = %d mV \r\n\n", voltage_mv1);                       // Print our the voltage into TeraTerm
        DO_DISPLAY_D3(voltage_mv1);                                             // Display the voltage using the LED D3 Function
        WAIT_1_SEC();                                                           // Wait for 1 second
    }
}

void Init_TRIS(void)
{
    TRISA = 0x0F;                                                               // Make PORTA bits 0-3 Inputs, bits 4-7 Outputs
    TRISB = 0x00;                                                               // Make PORTB bits Outputs
    TRISC = 0x00;                                                               // Make PORTC bits Outputs
    TRISD = 0x00;                                                               // Make PORTD bits Outputs
    TRISE = 0x00;                                                               // Make PORTE bits Outputs
}
void Init_ADC(void)
{
    ADCON0 = 0x01;                                                              // Set ADCON0 as 0x01
    ADCON1 = 0x1B;                                                              // Set ADCON1 as 0x1B
    ADCON2 = 0xA9;                                                              // Set ADCON2 as 0xA9
}

unsigned int Get_Full_ADC(void) 
{
    int result;                                                                 // Declare a new int variable called result
    ADCON0bits.GO=1;                                                            // Start Conversion
    while(ADCON0bits.DONE==1);                                                  // wait for conversion to be completed
    result = (ADRESH * 0x100) + ADRESL;                                         // combine result of upper byte and
                                                                                // lower byte into result
    return result;                                                              // return the result.
}

void Display_Upper_Digit(char digit) 
{
    PORTC = array[digit] & 0x3F;                                                // Mask bits 0-5 and assign to PORTC
    char PE = array[digit] & 0x40;                                              // Make bit 6 and assign it to PE
    if (PE == 0) PORTE = 0x00;                                                  // If PE = 0, then turn off PORTE
    else PORTE = 0x03;                                                          // If PE = 1, then turn on PORTE
}

void Display_Lower_Digit(char digit)
{
    PORTD = array[digit];                                                       // Assign the array into PORTD
}

void DO_DISPLAY_D1(int temp)
{
    if (temp < 46) 
    {
        SET_D1_CLEAR();                                                         // Set D1 as OFF if the temp is less than 46
    }
    if (temp >= 46 && temp < 56) 
    {
        SET_D1_RED();                                                           // Set D1 as RED if the temp is greater than 45, but less than 56
    }
    if (temp >= 56 && temp < 66) 
    {
        SET_D1_GREEN();                                                         // Set D1 as GREEN if the temp is greater than 55, but less than 66
    }
    if (temp >= 66 && temp < 76) 
    {
        SET_D1_BLUE();                                                          // Set D1 as BLUE if the temp is greater than 65, but less than 76
    }
    if (temp >= 76) 
    {
        SET_D1_WHITE();                                                         // Set D1 as WHITE if the temp is greater than 75
    }
}

void DO_DISPLAY_D2(int temp)
{
    int T = temp / 10;                                                          // Divide the temp by 10 in order to get int value, and assign to T
    if (T > 0 && T < 8)
    {
        PORTB = T;                                                              // Assign T into PORTB if T is greater than 0 but less than 8
    }
    if (T <= 0)
    {
        PORTB = 0x00;                                                           // If T is less than or equal to 0, then turn D2 OFF
    }
    if (T >= 8)
    {
        PORTB = 0x07;                                                           // If T is greater than or equal to 8, then turn D2 as WHITE
    }
}

void DO_DISPLAY_D3(int voltage)
{
    if (voltage < 2500)
    {
        SET_D3_RED();                                                           // If the voltage is less than 2500, then turn D3 as RED
    }
    if (voltage >= 2500 && voltage < 3500)
    {
        SET_D3_GREEN();                                                         // If the voltage is greater than 2400, but less than 3500, turn D3 as GREEN
    }
    if (voltage >= 3500)
    {
        SET_D3_YELLOW();                                                        // If the voltage is greater than 3400, then turn D3 as YELLOW
    }
}

void SET_D1_CLEAR()                                                             // Function to turn D1 OFF
{
    D1_RED = 0;                                                                 // Set PORTB bit 5 as 0
    D1_GREEN = 0;                                                               // Set PORTB bit 6 as 0
    D1_BLUE = 0;                                                                // Set PORTB bit 7 as 0
}

void SET_D1_RED()                                                               // Function to turn D2 as RED
{
    D1_RED = 1;                                                                 // Set PORTB bit 5 as 1
    D1_GREEN = 0;                                                               // Set PORTB bit 6 as 0
    D1_BLUE = 0;                                                                // Set PORTB bit 7 as 0
}

void SET_D1_GREEN()                                                             // Function to turn D2 as GREEN
{
    D1_RED = 0;                                                                 // Set PORTB bit 5 as 0
    D1_GREEN = 1;                                                               // Set PORTB bit 6 as 1
    D1_BLUE = 0;                                                                // Set PORTB bit 7 as 0
}

void SET_D1_BLUE()                                                              // Function to turn D1 as BLUE
{
    D1_RED = 0;                                                                 // Set PORTB bit 5 as 0
    D1_GREEN = 0;                                                               // Set PORTB bit 6 as 0
    D1_BLUE = 1;                                                                // Set PORTB bit 7 as 1
}

void SET_D1_WHITE()                                                             // Function to turn D2 as WHITE
{
    D1_RED = 1;                                                                 // Set PORTB bit 5 as 1
    D1_GREEN = 1;                                                               // Set PORTB bit 6 as 1
    D1_BLUE = 1;                                                                // Set PORTB bit 7 as 1
}

void SET_D3_RED()                                                               // Function to turn D3 as RED
{
    D3_RED = 1;                                                                 // Set PORTA bit 4 as 1
    D3_GREEN = 0;                                                               // Set PORTA bit 5 as 0
}

void SET_D3_GREEN()                                                             // Function to turn D3 as GREEN
{
    D3_RED = 0;                                                                 // Set PORTA bit 4 as 0
    D3_GREEN = 1;                                                               // Set PORTA bit 5 as 1
}

void SET_D3_YELLOW()                                                            // Function to turn D3 as YELLOW
{
    D3_RED = 1;                                                                 // Set PORTA bit 4 as 1
    D3_GREEN = 1;                                                               // Set PORTA bit 5 as 1
}