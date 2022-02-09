# Intro-to-Microcontrollers

MICROCONTROLLER LAB USING C AND ASSEMBLY:

LAB 1: Introduction to Microcontroller programming using PIC microcontroller / Tutorial

- Part 1: Created C program to blink four LEDs at different rates depending on the voltage V_Var supplied by the potentiometer to the pin RA0. The lower the voltage, the faster the LEDs will blink.
- Part 2: Utilized the UART to USB translator chip designed to connect a serial port to a USB port on your laptop. Linked Peripheral Library onto the project. LED on board will continuously blink to visually show good serial communication. Used TeraTerm to output C code onto the terminal using UART. 
- Part 3: Tested A/D channels. Potentiometer changes the value of AN0, AN1, AN2, and AN4 voltages, but all four should be around the same. Voltage on AN3 should remove a constant value of about 4.096V. Outputs should also show on TeraTerm terminal using UART. 

LAB 2: Input / Output Control using C Language

- Part 1: Wrote a C program that will input from a bank of a 4 switch DIP and output each input to a corresponding LED with the PIC18F. We used PORTA as an input and PORTB as an output and the Analog to Digital Converter (ADCON1).
- Part 2: Added an additional output, PORTC, for our RGB LED. Used 3 inputs from the DIP Switch to turn on a specific RGB color on the LED. 
- Part 3: Wrote an endless loop that will cycle through all 8 colors (000-->111) of the RGB LED with a one second delay.
- Part 4: Used the code for part 3 and added another RGB LED to show the inverse color or bits within the endless loop. 
- Part 5: Used arrays to write specific values for the three RGB LEDs and call them inside an endless for loop. 

LAB 3: Introduction to Assembly Program

LAB 4: Assembly Program

LAB 5: A/D converter, Temperature Sensor & Light Sensor

LAB 6: Digital Voltage & Ohm Meters

LAB 7: Traffic Light Controller with use of System Timer

LAB 8: Implementation of LCD Panel with SPI bus

LAB 9: External Interrupt

LAB 10: IR Receiver

LAB 11: Hardware and Soft I2C with Real-Time Clock

LAB 12: Special Final Integration Project

MICROCONTROLLER LECTURE USING ASSEMBLY:
