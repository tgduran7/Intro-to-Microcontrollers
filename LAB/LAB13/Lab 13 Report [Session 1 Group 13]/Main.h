
#define _XTAL_FREQ      8000000

#define ACK             1
#define NAK             0

#define ACCESS_CFG      0xAC
#define START_CONV      0xEE
#define READ_TEMP       0xAA
#define CONT_CONV       0x02

//#define D1R 0x01    // Port Hex value for D1 Red
//#define D1G 0x02    // Port Hex value for D1 Green
//#define D1B 0x04    // Port Hex value for D1 Blue
//#define D1M 0x05    // Port Hex value for D1 Magenta
//#define D1W 0x07    // Port Hex value for D1 White
//
//#define D2R 0x01    // Port Hex value for D2 Red
//#define D2G 0x02    // Port Hex value for D2 Green
//#define D2B 0x04    // Port Hex value for D2 Blue
//#define D2M 0x05    // Port Hex value for D2 Magenta
//#define D2W 0x07    // Port Hex value for 3 White
//
//#define D3R 0x01    // Port Hex value for D1 Red
//#define D3G 0x02    // Port Hex value for D3 Green
//#define D3B 0x04    // Port Hex value for D3 Blue
//#define D3M 0x05    // Port Hex value for D3 Magenta
//#define D3W 0x07    // Port Hex value for D3 White
//
//#define OFF 0x00                                                                // Define colors for RGB D1 and D2  
//#define RD 0x01                                                                                                    
//#define GN 0x02
//#define YW 0x03
//#define BL 0x04
//#define PU 0x05
//#define CY 0x06
//#define WH 0x07
//
//#define D3RD 0x20                                                              //Define colors for RGB D3                                      
//#define D3GN 0x40
//#define D3YW 0x60
//#define D3BL 0x80
//#define D3PU 0xA0
//#define D3CY 0xC0
//#define D3WH 0xE0
//
//#define D1_RED PORTDbits.RD0        // Output for D1
//#define D1_GREEN PORTDbits.RD1      // Output for D1
//#define D1_BLUE PORTDbits.RD2       // Output for D1
//
//#define D2_RED PORTEbits.RE0        // Output for D2
//#define D2_GREEN PORTEbits.RE1      // Output for D2
//#define D2_BLUE PORTEbits.RE2       // Output for D2
//
//#define D3_RED PORTDbits.RD4        // Output for D3
//#define D3_GREEN PORTDbits.RD5      // Output for D3
//#define D3_BLUE PORTDbits.RD6       // Output for D3

#define FAN_EN PORTAbits.RA4            // set port definition for FAN Enable
#define FAN_LED	PORTDbits.RD3           // set port definition for FAN LED
#define RTC_ALARM_NOT PORTAbits.RA5     // set port definition for RTC_Matched
#define KEY_PRESSED	PORTBbits.RB7       // set port definition KEY_PRESSED LED

#define Ch_Minus        0
#define Channel         1
#define Ch_Plus         2
#define Prev            3
#define Next            4
#define Play_Pause      5
#define Minus           6
#define Plus            7
#define EQ              8

//char D1[11]={ OFF, RD, GN, YW, BL, PU, CY, WH , WH, WH, WH} ;         // Array for RGB D1
//char D2[7]={ RD, YW, GN, BL, PU, CY, WH}  ;                              // Array for RGB D2
//char D3[8]={ OFF, D3RD, D3GN, D3YW, D3BL, D3PU, D3CY, D3WH} ;



