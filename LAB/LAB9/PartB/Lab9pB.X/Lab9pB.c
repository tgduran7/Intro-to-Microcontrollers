#include <stdio.h>
#include <stdlib.h>
#include <xc.h>
#include <math.h>
#include <p18f4620.h>

#pragma config OSC = INTIO67
#pragma config WDT = OFF
#pragma config LVP = OFF
#pragma config BOREN = OFF
#pragma config CCP2MX = PORTBE

#define debug 1

//LEDS
#define _XTAL_FREQ      8000000                                                             // Set operation for 8 Mhz
#define TMR_CLOCK       _XTAL_FREQ/4                                                        // Timer Clock 2 Mhz

#define TFT_DC PORTCbits.RC0                                                                // Location of TFT D/C
#define TFT_CS PORTCbits.RC1                                                                // Location of TFT Chip Select
#define TFT_RST PORTCbits.RC2                                                               // Location of TFT Reset
#define SEC_LED PORTDbits.RD7                                                               // Location of SEC_LED

#define NS_RED PORTDbits.RD2                                                              // Location of the RED Pin for the NS LED
#define NS_GREEN PORTDbits.RD3                                                              // Location of the GREEN Pin for the NS LED

#define NSLT_RED PORTDbits.RD4                                                             // Location of the RED Pin for the NSLT LED
#define NSLT_GREEN PORTDbits.RD5                                                          // Location of the GREEN Pin for the NSLT LED

#define EW_RED PORTBbits.RB4                                                                // Location of the RED Pin for the EW LED
#define EW_GREEN PORTBbits.RB5                                                              // Location of the GREEN Pin for the EW LED

#define EWLT_RED PORTEbits.RE1                                                              // Location of the RED Pin for the EWLT LED
#define EWLT_GREEN PORTEbits.RE2                                                            // Location of the GREEN Pin for the EWLT LED

#define NS_LT_SW PORTAbits.RA1                                                              // Location of the NSLT SW                                                        // Location of the EWPED SW
#define EW_LT_SW PORTAbits.RA2                                                              // Location of the EWLT SW

#define MODE_LED PORTBbits.RB7      

//Colors
#define OFF 		0                                                                       // Defines OFF as decimal value 0
#define RED 		1                                                                       // Defines RED as decimal value 1
#define GREEN 		2                                                                       // Defines GREEN as decimal value 2
#define YELLOW 		3                                                                       // Defines YELLOW as decimal value 3

#define Circle_Size     7                                                                   // Size of Circle for Light
#define Circle_Offset   15                                                                  // Location of Circle
#define TS_1            1                                                                   // Size of Normal Text
#define TS_2            2                                                                   // Size of PED Text
#define Count_Offset    10                                                                  // Location of Count

#define XTXT            30                                                                  // X location of Title Text 
#define XRED            40                                                                  // X location of Red Circle
#define XYEL            60                                                                  // X location of Yellow Circle
#define XGRN            80                                                                  // X location of Green Circle
#define XCNT            100                                                                 // X location of Sec Count

#define NS              0                                                                   // Number definition of North/South
#define NSLT            1                                                                   // Number definition of North/South Left Turn
#define EW              2                                                                   // Number definition of East/West
#define EWLT            3                                                                   // Number definition of East/West Left Turn
 
#define Color_Off       0                                                                   // Number definition of Off Color
#define Color_Red       1                                                                   // Number definition of Red Color
#define Color_Green     2                                                                   // Number definition of Green Color
#define Color_Yellow    3                                                                   // Number definition of Yellow Color

#define NS_Txt_Y        20
#define NS_Cir_Y        NS_Txt_Y + Circle_Offset
#define NS_Count_Y      NS_Txt_Y + Count_Offset
#define NS_Color        ST7735_BLUE 

#define NSLT_Txt_Y      50
#define NSLT_Cir_Y      NSLT_Txt_Y + Circle_Offset
#define NSLT_Count_Y    NSLT_Txt_Y + Count_Offset
#define NSLT_Color      ST7735_MAGENTA

#define EW_Txt_Y        80
#define EW_Cir_Y        EW_Txt_Y + Circle_Offset
#define EW_Count_Y      EW_Txt_Y + Count_Offset
#define EW_Color        ST7735_CYAN

#define EWLT_Txt_Y      110
#define EWLT_Cir_Y      EWLT_Txt_Y + Circle_Offset
#define EWLT_Count_Y    EWLT_Txt_Y + Count_Offset
#define EWLT_Color      ST7735_WHITE

#define PED_NS_Count_Y  30
#define PED_EW_Count_Y  90
#define PED_Count_X  2
#define Switch_Txt_Y    140

#include "ST7735_TFT.c"

// Initialize Variables
char buffer[31];                                                                            // General buffer for display purpose
char *nbr;                                                                                  // General pointer used for buffer
char *txt;

char NS_Count[]     = "00";                                                                 // Text storage for NS Count
char NSLT_Count[]   = "00";                                                                 // Text storage for NS Left Turn Count
char EW_Count[]     = "00";                                                                 // Text storage for EW Count
char EWLT_Count[]   = "00";                                                                 // Text storage for EW Left Turn Count

char PED_NS_Count[] = "00";                                                                 // Text storage for NS Pedestrian Count
char PED_EW_Count[] = "00";                                                                 // Text storage for EW Pedestrian Count

char SW_NSPED_Txt[] = "0";                                                                  // Text storage for NS Pedestrian Switch
char SW_NSLT_Txt[]  = "0";                                                                  // Text storage for NS Left Turn Switch
char SW_EWPED_Txt[] = "0";                                                                  // Text storage for EW Pedestrian Switch
char SW_EWLT_Txt[]  = "0";                                                                  // Text storage for EW Left Turn Switch

char SW_MODE_Txt[]  = "D";                                                                  // Text storage for Mode Light Sensor
	
char Act_Mode_Txt[]  = "D";                                                                 // Text storage for Actual Mode
char FlashingS_Txt[] = "0";                                                                 // Text storage for Emergency Status
char FlashingR_Txt[] = "0";                                                                 // Text storage for Flashing Request

char dir;
char Count;                                                                                 // RAM variable for Second Count
char PED_Count;                                                                             // RAM variable for Second Pedestrian Count

char SW_NSPED;                                                                              // RAM variable for NS Pedestrian Switch
char SW_NSLT;                                                                               // RAM variable for NS Left Turn Switch
char SW_EWPED;                                                                              // RAM variable for EW Pedestrian Switch
char SW_EWLT;                                                                               // RAM variable for EW Left Turn Switch
char SW_MODE;                                                                               // RAM variable for Mode Light Sensor
char FLASHING;
char FLASHING_REQUEST;
int MODE;
char direction;
float volt;

// Start of Prototyping
unsigned int get_full_ADC(void);
void Init_ADC(void);
void init_IO(void);


void Set_NS(char color);
void Set_NS_LT(char color);
void Set_EW(char color);
void Set_EW_LT(char color);

void PED_Control(char Direction, char Num_Sec); 
void Day_Mode(void);
void Night_Mode(void);


void Wait_One_Second(void);
void Wait_Half_Second(void);
void Wait_N_Seconds (char);
void Wait_One_Second_With_Beep(void);

void Initialize_Screen(void);
void update_LCD_color(char , char );
void update_LCD_PED_Count(char direction, char count);
void update_LCD_misc(void);
void update_LCD_count(char, char);

void Initialize_Screen()
{
  LCD_Reset();
  TFT_GreenTab_Initialize();
  fillScreen(ST7735_BLACK);
  
  /* TOP HEADER FIELD */
  txt = buffer;
  strcpy(txt, "ECE3301L SPRING 22-S1");  
  drawtext(2, 2, txt, ST7735_WHITE, ST7735_BLACK, TS_1);
  
  /* MODE FIELD */
  strcpy(txt, "Mode:");
  drawtext(2, 10, txt, ST7735_WHITE, ST7735_BLACK, TS_1);
  drawtext(35,10, Act_Mode_Txt, ST7735_WHITE, ST7735_BLACK, TS_1);

  /* FLASHING REQUEST FIELD */
  strcpy(txt, "FR:");
  drawtext(50, 10, txt, ST7735_WHITE, ST7735_BLACK, TS_1);
  drawtext(70, 10, FlashingR_Txt, ST7735_WHITE, ST7735_BLACK, TS_1);
  
  /* FLASHING STATUS FIELD */
  strcpy(txt, "FS:");
  drawtext(80, 10, txt, ST7735_WHITE, ST7735_BLACK, TS_1);
  drawtext(100, 10, FlashingR_Txt, ST7735_WHITE, ST7735_BLACK, TS_1); 

  /* SECOND UPDATE FIELD */
  strcpy(txt, "*");
  drawtext(120, 10, txt, ST7735_WHITE, ST7735_BLACK, TS_1);
      
  /* NORTH/SOUTH UPDATE FIELD */
  strcpy(txt, "NORTH/SOUTH");
  drawtext  (XTXT, NS_Txt_Y  , txt, NS_Color, ST7735_BLACK, TS_1);
  drawRect  (XTXT, NS_Cir_Y-8, 60, 18, NS_Color);
  drawCircle(XRED, NS_Cir_Y  , Circle_Size, ST7735_RED);
  drawCircle(XYEL, NS_Cir_Y  , Circle_Size, ST7735_YELLOW);
  fillCircle(XGRN, NS_Cir_Y  , Circle_Size, ST7735_GREEN);
  drawtext  (XCNT, NS_Count_Y, NS_Count, NS_Color, ST7735_BLACK, TS_2);
    
  /* NORTH/SOUTH LEFT TURN UPDATE FIELD */
  strcpy(txt, "N/S LT");
  drawtext  (XTXT, NSLT_Txt_Y, txt, NSLT_Color, ST7735_BLACK, TS_1);
  drawRect  (XTXT, NSLT_Cir_Y-8, 60, 18, NSLT_Color);
  fillCircle(XRED, NSLT_Cir_Y, Circle_Size, ST7735_RED);
  drawCircle(XYEL, NSLT_Cir_Y, Circle_Size, ST7735_YELLOW);
  drawCircle(XGRN, NSLT_Cir_Y, Circle_Size, ST7735_GREEN);  
  drawtext  (XCNT, NSLT_Count_Y, NSLT_Count, NSLT_Color, ST7735_BLACK, TS_2);
  
  /* EAST/WEST UPDATE FIELD */
  strcpy(txt, "EAST/WEST");
  drawtext  (XTXT, EW_Txt_Y, txt, EW_Color, ST7735_BLACK, TS_1);
  drawRect  (XTXT, EW_Cir_Y-8, 60, 18, EW_Color);
  fillCircle(XRED, EW_Cir_Y, Circle_Size, ST7735_RED);
  drawCircle(XYEL, EW_Cir_Y, Circle_Size, ST7735_YELLOW);
  drawCircle(XGRN, EW_Cir_Y, Circle_Size, ST7735_GREEN);  
  drawtext  (XCNT, EW_Count_Y, EW_Count, EW_Color, ST7735_BLACK, TS_2);

  /* EAST/WEST LEFT TURN UPDATE FIELD */
  strcpy(txt, "E/W LT");
  drawtext  (XTXT, EWLT_Txt_Y, txt, EWLT_Color, ST7735_BLACK, TS_1);
  drawRect  (XTXT, EWLT_Cir_Y-8, 60, 18, EWLT_Color);  
  fillCircle(XRED, EWLT_Cir_Y, Circle_Size, ST7735_RED);
  drawCircle(XYEL, EWLT_Cir_Y, Circle_Size, ST7735_YELLOW);
  drawCircle(XGRN, EWLT_Cir_Y, Circle_Size, ST7735_GREEN);   
  drawtext  (XCNT, EWLT_Count_Y, EWLT_Count, EWLT_Color, ST7735_BLACK, TS_2);

  /* NORTH/SOUTH PEDESTRIAM UPDATE FIELD */
  strcpy(txt, "PNS");  
  drawtext(3, NS_Txt_Y, txt, NS_Color, ST7735_BLACK, TS_1);
  drawtext(2, PED_NS_Count_Y, PED_NS_Count, NS_Color, ST7735_BLACK, TS_2);
  
  /* EAST/WEST PEDESTRIAM UPDATE FIELD */  
  drawtext(2, PED_EW_Count_Y, PED_EW_Count, EW_Color, ST7735_BLACK, TS_2);
  strcpy(txt, "PEW");  
  drawtext(3, EW_Txt_Y, txt, EW_Color, ST7735_BLACK, TS_1);
      
  /* MISCELLANEOUS UPDATE FIELD */  
  strcpy(txt, "NSP NSLT EWP EWLT MR");
  drawtext(1,  Switch_Txt_Y, txt, ST7735_WHITE, ST7735_BLACK, TS_1);
  drawtext(6,  Switch_Txt_Y+9, SW_NSPED_Txt, ST7735_WHITE, ST7735_BLACK, TS_1);
  drawtext(32, Switch_Txt_Y+9, SW_NSLT_Txt, ST7735_WHITE, ST7735_BLACK, TS_1);
  drawtext(58, Switch_Txt_Y+9, SW_EWPED_Txt, ST7735_WHITE, ST7735_BLACK, TS_1);
  drawtext(87, Switch_Txt_Y+9, SW_EWLT_Txt, ST7735_WHITE, ST7735_BLACK, TS_1);  
  drawtext(112,Switch_Txt_Y+9, SW_MODE_Txt, ST7735_WHITE, ST7735_BLACK, TS_1);
}

void init_UART()
{
    OpenUSART (USART_TX_INT_OFF & USART_RX_INT_OFF &
    USART_ASYNCH_MODE & USART_EIGHT_BIT & USART_CONT_RX &
    USART_BRGH_HIGH, 25);
    OSCCON = 0x60;
}

void putch (char c)
{
    while (!TRMT);
    TXREG = c;
}
char NS_PED_SW;
char EW_PED_SW;
char FLASHING_REQUEST;

void Do_Init()
{
    
    init_UART();
    Init_ADC();
    
    OSCCON = 0x70;
    TRISB = 0x07; // Configure the PORTB to make sure
    // that all the INTx pins are
    // inputs
    INTCONbits.INT0IF = 0; // Clear INT0IF
    INTCON3bits.INT1IF = 0; // Clear INT1IF
    INTCON3bits.INT2IF =0; // Clear INT2IF
    
    INTCON2bits.INTEDG0=0 ; // INT0 EDGE falling
    INTCON2bits.INTEDG1=0; // INT1 EDGE falling
    INTCON2bits.INTEDG2=0; // INT2 EDGE rising
    
    INTCONbits.INT0IE =1; // Set INT0 IE
    INTCON3bits.INT1IE=1; // Set INT1 IE
    INTCON3bits.INT2IE=1; // Set INT2 IE
    
    INTCONbits.GIE=1; // Set the Global Interrupt Enable
    }

void INT0_ISR()
{
    INTCONbits.INT0IF=0; // Clear the interrupt flag
    if(MODE == 1)
    {
        NS_PED_SW = 1;
    }
    else NS_PED_SW = 0; // set software INT0_flag
}

void INT1_ISR()
{
    INTCON3bits.INT1IF=0; // Clear the interrupt flag
    if(MODE == 1)
    {
        EW_PED_SW = 1;
    }
    else EW_PED_SW = 0; // set software INT0_flag
}

void INT2_ISR()
{
    INTCON3bits.INT2IF=0; // Clear the interrupt flag
    FLASHING_REQUEST = 1; // set software INT2_flag
}

void interrupt high_priority chkisr()
{
    if (INTCONbits.INT0IF == 1) INT0_ISR(); // check if INT0
    // has occured
    if (INTCON3bits.INT1IF == 1) INT1_ISR();
    if (INTCON3bits.INT2IF == 1) INT2_ISR();
}

void Do_Flashing()
{
    char FLASHING = 1;
    FLASHING_REQUEST = 0;
    while(FLASHING == 1)
    {
        if(FLASHING_REQUEST == 1)
        {
            FLASHING_REQUEST = 0;
            FLASHING = 0;
        }
        else
        {
            Set_NS(RED);
            Set_NS_LT(RED);
            Set_EW(RED);
            Set_EW_LT(RED);
            Wait_One_Second();
            Set_NS(OFF);
            Set_NS_LT(OFF);
            Set_EW(OFF);
            Set_EW_LT(OFF);
            Wait_One_Second();
        }
    }
}
void main(void)
{
    RBPU = 0;
    Do_Init();
    init_IO();                                                                              // Initialize the IO PORTS                                                                             // Initialize the ADCON Values
    init_UART();                                                                            // Initialize the UART
    OSCCON = 0x70;                                                                          // Set the system clock to be 1MHz 1/4 of the 4MHz
    Initialize_Screen();                                                                    // Initialize the TFT screen


    int nStep = get_full_ADC();                                                             // Calculates the # of steps for analog conversion
    volt = nStep * 5 /1024.0;                                                               // Gets the voltage in Volts, using 5V as reference s instead of 4, also divide by 1024 
    SW_MODE = volt < 2.5 ? 1:0;                                                             // Mode = 1, Day_mode, Mode = 0 Night_mode

    while(1)                                                                                // Forever loop
    {
        if (SW_MODE)    
        {
            Day_Mode();                                                                     // Calls Day_Mode() function
        }
        else
        {
            Night_Mode();                                                                   // Calls Night_Mode() function
        }
        if(FLASHING_REQUEST == 1)
        {
            Do_Flashing();
        }
    } 
}

void init_IO()
{
    TRISA = 0x1F;                                                                           // Make PORTA bits 0-4 inputs & 5-7 outputs
    TRISB = 0x07;                                                                           // Make PORTB outputs
    TRISC = 0x00;                                                                           // Make PORTC outputs
    TRISD = 0x00;                                                                           // Make PORTD outputs
    TRISE = 0x00;                                                                           // Make PORTE outputs
}

void Init_ADC()
{
    ADCON0 = 0x01;
    ADCON1= 0x0E; 
    ADCON2= 0xA9;
}

unsigned int get_full_ADC()
{
unsigned int result;
   ADCON0bits.GO=1;                                                                         // Start Conversion
   while(ADCON0bits.DONE==1);                                                               // Wait for conversion to be completed
   result = (ADRESH * 0x100) + ADRESL;                                                      // Combine result of upper byte and
                                                                                            // Lower byte into result
   return result;                                                                           // Return the result.
}

void Set_NS(char color)
{
    direction = NS;                                                                         // Set the direction as NS // Part E.a
    update_LCD_color(direction, color);                                                     // Update the LCD color with NS and the new color
    
    switch (color)
    {
        case OFF: NS_RED =0;NS_GREEN=0;break;                                               // Turns off the NS LED
        case RED: NS_RED =1;NS_GREEN=0;break;                                               // Sets NS LED RED
        case GREEN: NS_RED =0;NS_GREEN=1;break;                                             // Sets NS LED GREEN
        case YELLOW: NS_RED =1;NS_GREEN=1;break;                                            // Sets NS LED YELLOW
    }
}

void Set_NS_LT(char color)
{
    direction = NSLT;                                                                       // Set the direction as NSLT // Part E.b
    update_LCD_color(direction, color);                                                     // Update the LCD Color with NSLT and the new color
    
    switch(color)
    {
        case OFF: NSLT_RED =0; NSLT_GREEN=0; break;                                         // Turns off the NSLT LED
        case RED: NSLT_RED =1; NSLT_GREEN=0; break;                                         // Sets NSLT LED RED
        case GREEN: NSLT_RED =0; NSLT_GREEN=1; break;                                       // Sets NSLT LED GREEN
        case YELLOW: NSLT_RED =1; NSLT_GREEN=1; break;                                      // Sets NSLT LED YELLOW
    }
}

void Set_EW(char color)
{
    direction = EW;                                                                         // Set the direction as EW // Part E.b
    update_LCD_color(direction, color);                                                     // Update the LCD Color with EW and the new color
    
    switch(color)
    {
        case OFF: EW_RED =0; EW_GREEN=0; break;                                             // Turns off the EW LED
        case RED: EW_RED =1; EW_GREEN=0; break;                                             // Sets EW LED RED
        case GREEN: EW_RED =0; EW_GREEN=1; break;                                           // Sets EW LED GREEN
        case YELLOW: EW_RED =1; EW_GREEN=1; break;                                          // Sets EW LED YELLOW
    }
}

void Set_EW_LT(char color)
{
    direction = EWLT;                                                                       // Set the direction as EWLT // Part E.b
    update_LCD_color(direction, color);                                                     // Update the LCD Color with EWLT and the new color
    
    switch(color)
    {
        case OFF: EWLT_RED =0; EWLT_GREEN=0; break;                                         // Turns off the EWLT LED
        case RED: EWLT_RED =1; EWLT_GREEN=0; break;                                         // Sets EWLT LED RED
        case GREEN: EWLT_RED =0; EWLT_GREEN=1; break;                                       // Sets EWLT LED GREEN
        case YELLOW: EWLT_RED =1; EWLT_GREEN=1; break;                                      // Sets EWLT LED YELLOW
    }
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
    CCP2CON = 0x0;
    PORTBbits.RB3 = 0;
}

void PED_Control( char direction, char Num_Sec)
{ 
    for(char i = Num_Sec-1;i>0; i--)
    {
        update_LCD_PED_Count(direction, i);                                                 // Part E.c
        Wait_One_Second_With_Beep();                                                        // Hold the number on 7-Segment for 1 second
    }
    
    update_LCD_PED_Count(direction, 0);                                                     //
    Wait_One_Second_With_Beep();                                                            // Leaves the 7-Segment off for 1 second
    
    switch(direction)
    {
        case NS: NS_PED_SW = 0;
        break;
        case EW: EW_PED_SW = 0;
        break;
    }
}

void Day_Mode()
{
    MODE = 1;                                                                               // Turns on the MODE_LED
    MODE_LED = 1;                                                                           // Turns on the MODE_LED on the breadboard
    Act_Mode_Txt[0] = 'D';                                                                  // Displays Day Mode for the LCD
     
    Set_NS(GREEN);                                                                          // Step 1
    Set_NS_LT(RED);                                                                         //
    Set_EW(RED);                                                                            //
    Set_EW_LT(RED);                                                                         //
    if(NS_PED_SW == 1)                                                                      // Step 1 Part A
    {
        PED_Control(0,7);                                                                   // Part E.c
    }
    Set_NS(GREEN);                                                                          //
    Wait_N_Seconds(9);                                                                      // Step 2
    Set_NS(YELLOW);                                                                         // Step 3
    Wait_N_Seconds(3);                                                                      //
    Set_NS(RED);                                                                            // Step 4
    if(EW_LT_SW == 1)                                                                       // Step 5                                                       
    {
        Set_EW_LT(GREEN);                                                                   // Step 6                                                       
        Wait_N_Seconds(6);                                                                  //                                                      
        
        Set_EW_LT(YELLOW);                                                                  // Step 7                                                       
        Wait_N_Seconds(3);                                                                  //                                                     
        
        Set_EW_LT(RED);                                                                     // Step 8                                                          
    }
    
    Set_EW(GREEN);                                                                          // Step 9                                                              
    if(EW_PED_SW == 1)                                                                      //                                                           
    {
        PED_Control(2,10);                                                                  // Step 9 Part A // Part E.c
    }
    
    Wait_N_Seconds(7);                                                                      // Step 10                                                       
        
    Set_EW(YELLOW);                                                                         // Step 11                                                          
    Wait_N_Seconds(3);                                                                      //                                                          
        
    Set_EW(RED);                                                                            // Step 12                                                                      
    
    if(NS_LT_SW == 1)                                                                       // Step 13                                                            
    {
        Set_NS_LT(GREEN);                                                                   // Step 14                                                       
        Wait_N_Seconds(6);                                                                  //                                                     
        
        Set_NS_LT(YELLOW);                                                                  // Step 15                                                     
        Wait_N_Seconds(3);                                                                  //                                                     
        
        Set_NS_LT(RED);                                                                     // Step 17                                                       
    }        
}
void Night_Mode()
{ 
    NS_PED_SW = 0;
    EW_PED_SW = 0;
    
    MODE = 0;                                                                               // Turns off the MODE_LED
    MODE_LED = 0;                                                                           // Turns off the MODE_LED on the breadboard
    Act_Mode_Txt[0] = 'N';                                                                  // Displays Night Mode for the LCD
    
    Set_NS_LT(RED);                                                                         // Step 1
    Set_EW(RED);                                                                            //
    Set_EW_LT(RED);                                                                         //
    Set_NS(GREEN);                                                                          //
    Wait_N_Seconds(8);                                                                      // Step 2
    Set_NS(YELLOW);                                                                         // Step 3
    Wait_N_Seconds(3);                                                                      //
    Set_NS(RED);                                                                            // Step 4
    if (EW_LT_SW == 1)
    {
        Set_EW_LT(GREEN);                                                                   // Step 6
        Wait_N_Seconds(6);                                                                  //
        Set_EW_LT(YELLOW);                                                                  // Step 7
        Wait_N_Seconds(3);                                                                  //
        Set_EW_LT(RED);                                                                     // Step 8
    }
    Set_EW(GREEN);                                                                          // Step 9
    Wait_N_Seconds(8);                                                                      //
    Set_EW(YELLOW);                                                                         // Step 10
    Wait_N_Seconds(3);                                                                      //
    Set_EW(RED);                                                                            // Step 11
    if(NS_LT_SW == 1)                                                                       // Step 12
    {
        Set_NS_LT(GREEN);                                                                   // Step 13
        Wait_N_Seconds(6);                                                                  //
        Set_NS_LT(YELLOW);                                                                  // Step 14
        Wait_N_Seconds(3);                                                                  //
        Set_NS_LT(RED);                                                                     // Step 15
    }

}

void Old_Wait_One_Second()                                                                  // Creates one second delay and blinking asterisk
{
    SEC_LED = 1;                                                                            // Turns on the SEC_LED
    Wait_Half_Second();                                                                     // Wait for half second (or 500 msec)
    SEC_LED = 0;                                                                            // Turns off the SEC_LED
    Wait_Half_Second();                                                                     // Wait for half second (or 500 msec)

}

void Wait_One_Second()                                                                      // Creates one second delay and blinking asterisk
{
    SEC_LED = 1;                                                                            // Turns on the SEC_LED
    strcpy(txt,"*");                                                                        // Writes "*" on the LCD
    drawtext(120,10,txt,ST7735_WHITE,ST7735_BLACK,TS_1);
    Wait_Half_Second();                                                                     // Wait for half second (or 500 msec)

    SEC_LED = 0;                                                                            // Turns off the SEC_LED
    strcpy(txt," ");                                                                        // Clears the "*" on the LCD
    drawtext(120,10,txt,ST7735_WHITE,ST7735_BLACK,TS_1);
    Wait_Half_Second();                                                                     // Wait for half second (or 500 msec)
    update_LCD_misc();                                                                      // Updates the misc items on the LCD
}

void Wait_One_Second_With_Beep()                                                            // Creates one second delay as well as sound buzzer
{
    SEC_LED = 1;                                                                            // Turns on the SEC_LED
    strcpy(txt,"*");                                                                        // Writes "*" on the LCD
    drawtext(120,10,txt,ST7735_WHITE,ST7735_BLACK,TS_1);    //
    Activate_Buzzer();                                                                      // Runs the Buzzer On Function
    Wait_Half_Second();                                                                     // Waits Half a Second
    
    SEC_LED = 0;                                                                            // Turns off the SEC_LED
    strcpy(txt," ");                                                                        // Clears the "*" on the LCD
    drawtext(120,10,txt,ST7735_WHITE,ST7735_BLACK,TS_1);
    Deactivate_Buzzer();                                                                    // Runs the Buzzer Off Function
    Wait_Half_Second();                                                                     // Waits Half a Second
    update_LCD_misc();                                                                      // Updates the misc items on the LCD
}
    
void Wait_Half_Second()
{
    T0CON = 0x03;                                                                           // Timer 0, 16-bit mode, prescaler 1:16
    TMR0L = 0xDB;                                                                           // Set the lower byte of TMR
    TMR0H = 0x0B;                                                                           // Set the upper byte of TMR
    INTCONbits.TMR0IF = 0;                                                                  // Clear the Timer 0 flag
    T0CONbits.TMR0ON = 1;                                                                   // Turn on the Timer 0
    while (INTCONbits.TMR0IF == 0);                                                         // Wait for the Timer Flag to be 1 for done
    T0CONbits.TMR0ON = 0;                                                                   // Turn off the Timer 0
}

void Wait_N_Seconds (char seconds)
{
    char I;
    for (I = seconds; I> 0; I--)
    {
        update_LCD_count(direction, I);                                                     // Part E.d
        Wait_One_Second();                                                                  // Calls Wait_One_Second for x number of times       
    }
    update_LCD_count(direction, 0);                                                         // Update the current direction to show 0
}

void update_LCD_color(char direction, char color)                                           // Part A
{
    char Circle_Y;
    Circle_Y = NS_Cir_Y + direction * 30;    
    
    if (color == Color_Off)                                                                 // If the color is OFF make all circles black but leave outline
    {
            fillCircle(XRED, Circle_Y, Circle_Size, ST7735_BLACK);
            fillCircle(XYEL, Circle_Y, Circle_Size, ST7735_BLACK);
            fillCircle(XGRN, Circle_Y, Circle_Size, ST7735_BLACK); 
            drawCircle(XRED, Circle_Y, Circle_Size, ST7735_RED);            
            drawCircle(XYEL, Circle_Y, Circle_Size, ST7735_YELLOW);
            drawCircle(XGRN, Circle_Y, Circle_Size, ST7735_GREEN);                       
    }    
    
    if (color == Color_Red)                                                                 // If the color is RED only fill the RED circle with RED
    {
            fillCircle(XRED, Circle_Y, Circle_Size, ST7735_RED);
            fillCircle(XYEL, Circle_Y, Circle_Size, ST7735_BLACK);
            fillCircle(XGRN, Circle_Y, Circle_Size, ST7735_BLACK); 
            drawCircle(XRED, Circle_Y, Circle_Size, ST7735_RED);            
            drawCircle(XYEL, Circle_Y, Circle_Size, ST7735_YELLOW);
            drawCircle(XGRN, Circle_Y, Circle_Size, ST7735_GREEN);  
    }

    
    if (color == Color_Yellow)                                                              // If the color is YELLOW only fill the YELLOW circle with YELLOW
    {
            fillCircle(XRED, Circle_Y, Circle_Size, ST7735_BLACK);
            fillCircle(XYEL, Circle_Y, Circle_Size, ST7735_YELLOW);
            fillCircle(XGRN, Circle_Y, Circle_Size, ST7735_BLACK); 
            drawCircle(XRED, Circle_Y, Circle_Size, ST7735_RED);            
            drawCircle(XYEL, Circle_Y, Circle_Size, ST7735_YELLOW);
            drawCircle(XGRN, Circle_Y, Circle_Size, ST7735_GREEN);                       
    }  
    
    if (color == Color_Green)                                                               // If the color is GREEN only fill the GREEN circle with GREEN
    {
            fillCircle(XRED, Circle_Y, Circle_Size, ST7735_BLACK);
            fillCircle(XYEL, Circle_Y, Circle_Size, ST7735_BLACK);
            fillCircle(XGRN, Circle_Y, Circle_Size, ST7735_GREEN); 
            drawCircle(XRED, Circle_Y, Circle_Size, ST7735_RED);            
            drawCircle(XYEL, Circle_Y, Circle_Size, ST7735_YELLOW);
            drawCircle(XGRN, Circle_Y, Circle_Size, ST7735_GREEN);                       
    }  
}

void update_LCD_count(char direction, char count)                                           // Part B
{
   switch (direction)                                                                       // Update the current direction's count on the LCD                      
   {
    case NS:       
        NS_Count[0] = count/10  + '0';                                                      // NS Count Upper Digit
        NS_Count[1] = count%10  + '0';                                                      // NS Count Lower Digit
        drawtext(XCNT, NS_Count_Y, NS_Count, NS_Color, ST7735_BLACK, TS_2); 
        break;
        
    case NSLT:       
        NSLT_Count[0] = count/10  + '0';                                                    // NSLT Count Upper Digit
        NSLT_Count[1] = count%10  + '0';                                                    // NSLT Count Lower Digit
        drawtext(XCNT, NSLT_Count_Y, NSLT_Count, NSLT_Color, ST7735_BLACK, TS_2); 
        break;    
        
    case EW:       
        EW_Count[0] = count/10  + '0';                                                      // EW Count Upper Digit
        EW_Count[1] = count%10  + '0';                                                      // EW Count Lower Digit
        drawtext(XCNT, EW_Count_Y, EW_Count, EW_Color, ST7735_BLACK, TS_2); 
        break;
        
    case EWLT:       
        EWLT_Count[0] = count/10  + '0';                                                    // EWLT Count Upper Digit
        EWLT_Count[1] = count%10  + '0';                                                    // EWLT Count Lower Digit
        drawtext(XCNT, EWLT_Count_Y, EWLT_Count, EWLT_Color, ST7735_BLACK, TS_2); 
        break;
    }  
}

void update_LCD_PED_Count(char direction, char count)                                       // Part C
{
   switch (direction)                                                                       // Update the PED count on the LCD
   {
    case NS:       
        PED_NS_Count[0] = count/10  + '0';                                                  // NS PED Count Upper Digit
        PED_NS_Count[1] = count%10  + '0';                                                  // NS PED Count Lower Digit
        drawtext(PED_Count_X, PED_NS_Count_Y, PED_NS_Count, NS_Color, ST7735_BLACK, TS_2);  // Put counter digit on screen
        break;  
    
    case EW:       
        PED_EW_Count[0] = count/10  + '0';                                                  // EW PED Count Upper Digit
        PED_EW_Count[1] = count%10  + '0';                                                  // EW PED Count Lower Digit
        drawtext(PED_Count_X, PED_EW_Count_Y, PED_EW_Count, EW_Color, ST7735_BLACK, TS_2);  // Put counter digit on screen
        break;
   }
}

void update_LCD_misc()                                                                      // Part D
{
    char ch = 0;                                                                            //
    ADCON0 = ch*4+1;                                                                        //
    int nStep = get_full_ADC();                                                             // Start the ADC Conversion for the photo resistor       
    volt = nStep * 5 /1024.0;                                                               // Convert the steps into voltages  
    SW_MODE = volt < 3.5 ? 1:0;                                                             // If voltage is less than 3.5V then assign 0, else assign 1       
    
    SW_NSPED = NS_PED_SW;
    SW_NSLT = NS_LT_SW;
    SW_EWPED = EW_PED_SW;
    SW_EWLT = EW_LT_SW;
      
    if (SW_NSPED == 0) SW_NSPED_Txt[0] = '0'; else SW_NSPED_Txt[0] = '1';                   // Set Text at bottom of screen to switch states
    if (SW_NSLT == 0) SW_NSLT_Txt[0] = '0'; else SW_NSLT_Txt[0] = '1'; 
    if (SW_EWPED == 0) SW_EWPED_Txt[0] = '0'; else SW_EWPED_Txt[0] = '1'; 
    if (SW_EWLT == 0) SW_EWLT_Txt[0] = '0'; else SW_EWLT_Txt[0] = '1'; 
    if (SW_MODE == 0) SW_MODE_Txt[0] = 'N'; else SW_MODE_Txt[0] = 'D';                      // Set Text at bottom of screen to which MODE
   
    drawtext(35,10, Act_Mode_Txt, ST7735_WHITE, ST7735_BLACK, TS_1);    
    drawtext(70,10, FlashingR_Txt, ST7735_WHITE, ST7735_BLACK, TS_1); 
    drawtext(100,10, FlashingS_Txt, ST7735_WHITE, ST7735_BLACK, TS_1);     
    drawtext(6,  Switch_Txt_Y+9, SW_NSPED_Txt, ST7735_WHITE, ST7735_BLACK, TS_1);           // Show switch and sensor states at bottom of the screen
    drawtext(32,  Switch_Txt_Y+9, SW_NSLT_Txt, ST7735_WHITE, ST7735_BLACK, TS_1);
    drawtext(58,  Switch_Txt_Y+9, SW_EWPED_Txt, ST7735_WHITE, ST7735_BLACK, TS_1);
    drawtext(87,  Switch_Txt_Y+9, SW_EWLT_Txt, ST7735_WHITE, ST7735_BLACK, TS_1);
    drawtext(112,  Switch_Txt_Y+9, SW_MODE_Txt, ST7735_WHITE, ST7735_BLACK, TS_1);
    if (FLASHING_REQUEST == 0) FlashingR_Txt[0] = '0'; else FlashingR_Txt[0] = '1';
    if (FLASHING == 0) FlashingS_Txt[0] = '0'; else FlashingS_Txt[0] = '1';
            
}



