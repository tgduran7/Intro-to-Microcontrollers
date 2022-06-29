opt subtitle "Microchip Technology Omniscient Code Generator (Lite mode) build 201502162209"

opt pagewidth 120

	opt lm

	processor	18F4620
porta	equ	0F80h
portb	equ	0F81h
portc	equ	0F82h
portd	equ	0F83h
porte	equ	0F84h
lata	equ	0F89h
latb	equ	0F8Ah
latc	equ	0F8Bh
latd	equ	0F8Ch
late	equ	0F8Dh
trisa	equ	0F92h
trisb	equ	0F93h
trisc	equ	0F94h
trisd	equ	0F95h
trise	equ	0F96h
pie1	equ	0F9Dh
pir1	equ	0F9Eh
ipr1	equ	0F9Fh
pie2	equ	0FA0h
pir2	equ	0FA1h
ipr2	equ	0FA2h
t3con	equ	0FB1h
tmr3l	equ	0FB2h
tmr3h	equ	0FB3h
ccp1con	equ	0FBDh
ccpr1l	equ	0FBEh
ccpr1h	equ	0FBFh
adcon1	equ	0FC1h
adcon0	equ	0FC2h
adresl	equ	0FC3h
adresh	equ	0FC4h
sspcon2	equ	0FC5h
sspcon1	equ	0FC6h
sspstat	equ	0FC7h
sspadd	equ	0FC8h
sspbuf	equ	0FC9h
t2con	equ	0FCAh
pr2	equ	0FCBh
tmr2	equ	0FCCh
t1con	equ	0FCDh
tmr1l	equ	0FCEh
tmr1h	equ	0FCFh
rcon	equ	0FD0h
wdtcon	equ	0FD1h
lvdcon	equ	0FD2h
osccon	equ	0FD3h
t0con	equ	0FD5h
tmr0l	equ	0FD6h
tmr0h	equ	0FD7h
status	equ	0FD8h
fsr2	equ	0FD9h
fsr2l	equ	0FD9h
fsr2h	equ	0FDAh
plusw2	equ	0FDBh
preinc2	equ	0FDCh
postdec2	equ	0FDDh
postinc2	equ	0FDEh
indf2	equ	0FDFh
bsr	equ	0FE0h
fsr1	equ	0FE1h
fsr1l	equ	0FE1h
fsr1h	equ	0FE2h
plusw1	equ	0FE3h
preinc1	equ	0FE4h
postdec1	equ	0FE5h
postinc1	equ	0FE6h
indf1	equ	0FE7h
wreg	equ	0FE8h
fsr0	equ	0FE9h
fsr0l	equ	0FE9h
fsr0h	equ	0FEAh
plusw0	equ	0FEBh
preinc0	equ	0FECh
postdec0	equ	0FEDh
postinc0	equ	0FEEh
indf0	equ	0FEFh
intcon3	equ	0FF0h
intcon2	equ	0FF1h
intcon	equ	0FF2h
prod	equ	0FF3h
prodl	equ	0FF3h
prodh	equ	0FF4h
tablat	equ	0FF5h
tblptr	equ	0FF6h
tblptrl	equ	0FF6h
tblptrh	equ	0FF7h
tblptru	equ	0FF8h
pcl	equ	0FF9h
pclat	equ	0FFAh
pclath	equ	0FFAh
pclatu	equ	0FFBh
stkptr	equ	0FFCh
tosl	equ	0FFDh
tosh	equ	0FFEh
tosu	equ	0FFFh
clrc   macro
	bcf	status,0
endm
setc   macro
	bsf	status,0
endm
clrz   macro
	bcf	status,2
endm
setz   macro
	bsf	status,2
endm
skipnz macro
	btfsc	status,2
endm
skipz  macro
	btfss	status,2
endm
skipnc macro
	btfsc	status,0
endm
skipc  macro
	btfss	status,0
endm
pushw macro
	movwf postinc1
endm
pushf macro arg1
	movff arg1, postinc1
endm
popw macro
	movf postdec1,f
	movf indf1,w
endm
popf macro arg1
	movf postdec1,f
	movff indf1,arg1
endm
popfc macro arg1
	movff plusw1,arg1
	decfsz fsr1,f
endm
	global	__ramtop
	global	__accesstop
# 51 "D:\Program Files (x86)\Microchip\xc8\v1.34\include\pic18f4620.h"
PORTA equ 0F80h ;# 
# 189 "D:\Program Files (x86)\Microchip\xc8\v1.34\include\pic18f4620.h"
PORTB equ 0F81h ;# 
# 359 "D:\Program Files (x86)\Microchip\xc8\v1.34\include\pic18f4620.h"
PORTC equ 0F82h ;# 
# 536 "D:\Program Files (x86)\Microchip\xc8\v1.34\include\pic18f4620.h"
PORTD equ 0F83h ;# 
# 677 "D:\Program Files (x86)\Microchip\xc8\v1.34\include\pic18f4620.h"
PORTE equ 0F84h ;# 
# 1005 "D:\Program Files (x86)\Microchip\xc8\v1.34\include\pic18f4620.h"
LATA equ 0F89h ;# 
# 1137 "D:\Program Files (x86)\Microchip\xc8\v1.34\include\pic18f4620.h"
LATB equ 0F8Ah ;# 
# 1269 "D:\Program Files (x86)\Microchip\xc8\v1.34\include\pic18f4620.h"
LATC equ 0F8Bh ;# 
# 1401 "D:\Program Files (x86)\Microchip\xc8\v1.34\include\pic18f4620.h"
LATD equ 0F8Ch ;# 
# 1533 "D:\Program Files (x86)\Microchip\xc8\v1.34\include\pic18f4620.h"
LATE equ 0F8Dh ;# 
# 1635 "D:\Program Files (x86)\Microchip\xc8\v1.34\include\pic18f4620.h"
TRISA equ 0F92h ;# 
# 1640 "D:\Program Files (x86)\Microchip\xc8\v1.34\include\pic18f4620.h"
DDRA equ 0F92h ;# 
# 1856 "D:\Program Files (x86)\Microchip\xc8\v1.34\include\pic18f4620.h"
TRISB equ 0F93h ;# 
# 1861 "D:\Program Files (x86)\Microchip\xc8\v1.34\include\pic18f4620.h"
DDRB equ 0F93h ;# 
# 2077 "D:\Program Files (x86)\Microchip\xc8\v1.34\include\pic18f4620.h"
TRISC equ 0F94h ;# 
# 2082 "D:\Program Files (x86)\Microchip\xc8\v1.34\include\pic18f4620.h"
DDRC equ 0F94h ;# 
# 2298 "D:\Program Files (x86)\Microchip\xc8\v1.34\include\pic18f4620.h"
TRISD equ 0F95h ;# 
# 2303 "D:\Program Files (x86)\Microchip\xc8\v1.34\include\pic18f4620.h"
DDRD equ 0F95h ;# 
# 2519 "D:\Program Files (x86)\Microchip\xc8\v1.34\include\pic18f4620.h"
TRISE equ 0F96h ;# 
# 2524 "D:\Program Files (x86)\Microchip\xc8\v1.34\include\pic18f4620.h"
DDRE equ 0F96h ;# 
# 2682 "D:\Program Files (x86)\Microchip\xc8\v1.34\include\pic18f4620.h"
OSCTUNE equ 0F9Bh ;# 
# 2746 "D:\Program Files (x86)\Microchip\xc8\v1.34\include\pic18f4620.h"
PIE1 equ 0F9Dh ;# 
# 2825 "D:\Program Files (x86)\Microchip\xc8\v1.34\include\pic18f4620.h"
PIR1 equ 0F9Eh ;# 
# 2904 "D:\Program Files (x86)\Microchip\xc8\v1.34\include\pic18f4620.h"
IPR1 equ 0F9Fh ;# 
# 2983 "D:\Program Files (x86)\Microchip\xc8\v1.34\include\pic18f4620.h"
PIE2 equ 0FA0h ;# 
# 3048 "D:\Program Files (x86)\Microchip\xc8\v1.34\include\pic18f4620.h"
PIR2 equ 0FA1h ;# 
# 3113 "D:\Program Files (x86)\Microchip\xc8\v1.34\include\pic18f4620.h"
IPR2 equ 0FA2h ;# 
# 3178 "D:\Program Files (x86)\Microchip\xc8\v1.34\include\pic18f4620.h"
EECON1 equ 0FA6h ;# 
# 3243 "D:\Program Files (x86)\Microchip\xc8\v1.34\include\pic18f4620.h"
EECON2 equ 0FA7h ;# 
# 3249 "D:\Program Files (x86)\Microchip\xc8\v1.34\include\pic18f4620.h"
EEDATA equ 0FA8h ;# 
# 3255 "D:\Program Files (x86)\Microchip\xc8\v1.34\include\pic18f4620.h"
EEADR equ 0FA9h ;# 
# 3261 "D:\Program Files (x86)\Microchip\xc8\v1.34\include\pic18f4620.h"
EEADRH equ 0FAAh ;# 
# 3267 "D:\Program Files (x86)\Microchip\xc8\v1.34\include\pic18f4620.h"
RCSTA equ 0FABh ;# 
# 3272 "D:\Program Files (x86)\Microchip\xc8\v1.34\include\pic18f4620.h"
RCSTA1 equ 0FABh ;# 
# 3476 "D:\Program Files (x86)\Microchip\xc8\v1.34\include\pic18f4620.h"
TXSTA equ 0FACh ;# 
# 3481 "D:\Program Files (x86)\Microchip\xc8\v1.34\include\pic18f4620.h"
TXSTA1 equ 0FACh ;# 
# 3773 "D:\Program Files (x86)\Microchip\xc8\v1.34\include\pic18f4620.h"
TXREG equ 0FADh ;# 
# 3778 "D:\Program Files (x86)\Microchip\xc8\v1.34\include\pic18f4620.h"
TXREG1 equ 0FADh ;# 
# 3784 "D:\Program Files (x86)\Microchip\xc8\v1.34\include\pic18f4620.h"
RCREG equ 0FAEh ;# 
# 3789 "D:\Program Files (x86)\Microchip\xc8\v1.34\include\pic18f4620.h"
RCREG1 equ 0FAEh ;# 
# 3795 "D:\Program Files (x86)\Microchip\xc8\v1.34\include\pic18f4620.h"
SPBRG equ 0FAFh ;# 
# 3800 "D:\Program Files (x86)\Microchip\xc8\v1.34\include\pic18f4620.h"
SPBRG1 equ 0FAFh ;# 
# 3806 "D:\Program Files (x86)\Microchip\xc8\v1.34\include\pic18f4620.h"
SPBRGH equ 0FB0h ;# 
# 3812 "D:\Program Files (x86)\Microchip\xc8\v1.34\include\pic18f4620.h"
T3CON equ 0FB1h ;# 
# 3925 "D:\Program Files (x86)\Microchip\xc8\v1.34\include\pic18f4620.h"
TMR3 equ 0FB2h ;# 
# 3931 "D:\Program Files (x86)\Microchip\xc8\v1.34\include\pic18f4620.h"
TMR3L equ 0FB2h ;# 
# 3937 "D:\Program Files (x86)\Microchip\xc8\v1.34\include\pic18f4620.h"
TMR3H equ 0FB3h ;# 
# 3943 "D:\Program Files (x86)\Microchip\xc8\v1.34\include\pic18f4620.h"
CMCON equ 0FB4h ;# 
# 4038 "D:\Program Files (x86)\Microchip\xc8\v1.34\include\pic18f4620.h"
CVRCON equ 0FB5h ;# 
# 4116 "D:\Program Files (x86)\Microchip\xc8\v1.34\include\pic18f4620.h"
ECCP1AS equ 0FB6h ;# 
# 4197 "D:\Program Files (x86)\Microchip\xc8\v1.34\include\pic18f4620.h"
PWM1CON equ 0FB7h ;# 
# 4266 "D:\Program Files (x86)\Microchip\xc8\v1.34\include\pic18f4620.h"
BAUDCON equ 0FB8h ;# 
# 4271 "D:\Program Files (x86)\Microchip\xc8\v1.34\include\pic18f4620.h"
BAUDCTL equ 0FB8h ;# 
# 4437 "D:\Program Files (x86)\Microchip\xc8\v1.34\include\pic18f4620.h"
CCP2CON equ 0FBAh ;# 
# 4515 "D:\Program Files (x86)\Microchip\xc8\v1.34\include\pic18f4620.h"
CCPR2 equ 0FBBh ;# 
# 4521 "D:\Program Files (x86)\Microchip\xc8\v1.34\include\pic18f4620.h"
CCPR2L equ 0FBBh ;# 
# 4527 "D:\Program Files (x86)\Microchip\xc8\v1.34\include\pic18f4620.h"
CCPR2H equ 0FBCh ;# 
# 4533 "D:\Program Files (x86)\Microchip\xc8\v1.34\include\pic18f4620.h"
CCP1CON equ 0FBDh ;# 
# 4629 "D:\Program Files (x86)\Microchip\xc8\v1.34\include\pic18f4620.h"
CCPR1 equ 0FBEh ;# 
# 4635 "D:\Program Files (x86)\Microchip\xc8\v1.34\include\pic18f4620.h"
CCPR1L equ 0FBEh ;# 
# 4641 "D:\Program Files (x86)\Microchip\xc8\v1.34\include\pic18f4620.h"
CCPR1H equ 0FBFh ;# 
# 4647 "D:\Program Files (x86)\Microchip\xc8\v1.34\include\pic18f4620.h"
ADCON2 equ 0FC0h ;# 
# 4717 "D:\Program Files (x86)\Microchip\xc8\v1.34\include\pic18f4620.h"
ADCON1 equ 0FC1h ;# 
# 4807 "D:\Program Files (x86)\Microchip\xc8\v1.34\include\pic18f4620.h"
ADCON0 equ 0FC2h ;# 
# 4929 "D:\Program Files (x86)\Microchip\xc8\v1.34\include\pic18f4620.h"
ADRES equ 0FC3h ;# 
# 4935 "D:\Program Files (x86)\Microchip\xc8\v1.34\include\pic18f4620.h"
ADRESL equ 0FC3h ;# 
# 4941 "D:\Program Files (x86)\Microchip\xc8\v1.34\include\pic18f4620.h"
ADRESH equ 0FC4h ;# 
# 4947 "D:\Program Files (x86)\Microchip\xc8\v1.34\include\pic18f4620.h"
SSPCON2 equ 0FC5h ;# 
# 5008 "D:\Program Files (x86)\Microchip\xc8\v1.34\include\pic18f4620.h"
SSPCON1 equ 0FC6h ;# 
# 5077 "D:\Program Files (x86)\Microchip\xc8\v1.34\include\pic18f4620.h"
SSPSTAT equ 0FC7h ;# 
# 5316 "D:\Program Files (x86)\Microchip\xc8\v1.34\include\pic18f4620.h"
SSPADD equ 0FC8h ;# 
# 5322 "D:\Program Files (x86)\Microchip\xc8\v1.34\include\pic18f4620.h"
SSPBUF equ 0FC9h ;# 
# 5328 "D:\Program Files (x86)\Microchip\xc8\v1.34\include\pic18f4620.h"
T2CON equ 0FCAh ;# 
# 5398 "D:\Program Files (x86)\Microchip\xc8\v1.34\include\pic18f4620.h"
PR2 equ 0FCBh ;# 
# 5403 "D:\Program Files (x86)\Microchip\xc8\v1.34\include\pic18f4620.h"
MEMCON equ 0FCBh ;# 
# 5507 "D:\Program Files (x86)\Microchip\xc8\v1.34\include\pic18f4620.h"
TMR2 equ 0FCCh ;# 
# 5513 "D:\Program Files (x86)\Microchip\xc8\v1.34\include\pic18f4620.h"
T1CON equ 0FCDh ;# 
# 5617 "D:\Program Files (x86)\Microchip\xc8\v1.34\include\pic18f4620.h"
TMR1 equ 0FCEh ;# 
# 5623 "D:\Program Files (x86)\Microchip\xc8\v1.34\include\pic18f4620.h"
TMR1L equ 0FCEh ;# 
# 5629 "D:\Program Files (x86)\Microchip\xc8\v1.34\include\pic18f4620.h"
TMR1H equ 0FCFh ;# 
# 5635 "D:\Program Files (x86)\Microchip\xc8\v1.34\include\pic18f4620.h"
RCON equ 0FD0h ;# 
# 5767 "D:\Program Files (x86)\Microchip\xc8\v1.34\include\pic18f4620.h"
WDTCON equ 0FD1h ;# 
# 5794 "D:\Program Files (x86)\Microchip\xc8\v1.34\include\pic18f4620.h"
HLVDCON equ 0FD2h ;# 
# 5799 "D:\Program Files (x86)\Microchip\xc8\v1.34\include\pic18f4620.h"
LVDCON equ 0FD2h ;# 
# 6063 "D:\Program Files (x86)\Microchip\xc8\v1.34\include\pic18f4620.h"
OSCCON equ 0FD3h ;# 
# 6139 "D:\Program Files (x86)\Microchip\xc8\v1.34\include\pic18f4620.h"
T0CON equ 0FD5h ;# 
# 6215 "D:\Program Files (x86)\Microchip\xc8\v1.34\include\pic18f4620.h"
TMR0 equ 0FD6h ;# 
# 6221 "D:\Program Files (x86)\Microchip\xc8\v1.34\include\pic18f4620.h"
TMR0L equ 0FD6h ;# 
# 6227 "D:\Program Files (x86)\Microchip\xc8\v1.34\include\pic18f4620.h"
TMR0H equ 0FD7h ;# 
# 6233 "D:\Program Files (x86)\Microchip\xc8\v1.34\include\pic18f4620.h"
STATUS equ 0FD8h ;# 
# 6311 "D:\Program Files (x86)\Microchip\xc8\v1.34\include\pic18f4620.h"
FSR2 equ 0FD9h ;# 
# 6317 "D:\Program Files (x86)\Microchip\xc8\v1.34\include\pic18f4620.h"
FSR2L equ 0FD9h ;# 
# 6323 "D:\Program Files (x86)\Microchip\xc8\v1.34\include\pic18f4620.h"
FSR2H equ 0FDAh ;# 
# 6329 "D:\Program Files (x86)\Microchip\xc8\v1.34\include\pic18f4620.h"
PLUSW2 equ 0FDBh ;# 
# 6335 "D:\Program Files (x86)\Microchip\xc8\v1.34\include\pic18f4620.h"
PREINC2 equ 0FDCh ;# 
# 6341 "D:\Program Files (x86)\Microchip\xc8\v1.34\include\pic18f4620.h"
POSTDEC2 equ 0FDDh ;# 
# 6347 "D:\Program Files (x86)\Microchip\xc8\v1.34\include\pic18f4620.h"
POSTINC2 equ 0FDEh ;# 
# 6353 "D:\Program Files (x86)\Microchip\xc8\v1.34\include\pic18f4620.h"
INDF2 equ 0FDFh ;# 
# 6359 "D:\Program Files (x86)\Microchip\xc8\v1.34\include\pic18f4620.h"
BSR equ 0FE0h ;# 
# 6365 "D:\Program Files (x86)\Microchip\xc8\v1.34\include\pic18f4620.h"
FSR1 equ 0FE1h ;# 
# 6371 "D:\Program Files (x86)\Microchip\xc8\v1.34\include\pic18f4620.h"
FSR1L equ 0FE1h ;# 
# 6377 "D:\Program Files (x86)\Microchip\xc8\v1.34\include\pic18f4620.h"
FSR1H equ 0FE2h ;# 
# 6383 "D:\Program Files (x86)\Microchip\xc8\v1.34\include\pic18f4620.h"
PLUSW1 equ 0FE3h ;# 
# 6389 "D:\Program Files (x86)\Microchip\xc8\v1.34\include\pic18f4620.h"
PREINC1 equ 0FE4h ;# 
# 6395 "D:\Program Files (x86)\Microchip\xc8\v1.34\include\pic18f4620.h"
POSTDEC1 equ 0FE5h ;# 
# 6401 "D:\Program Files (x86)\Microchip\xc8\v1.34\include\pic18f4620.h"
POSTINC1 equ 0FE6h ;# 
# 6407 "D:\Program Files (x86)\Microchip\xc8\v1.34\include\pic18f4620.h"
INDF1 equ 0FE7h ;# 
# 6413 "D:\Program Files (x86)\Microchip\xc8\v1.34\include\pic18f4620.h"
WREG equ 0FE8h ;# 
# 6424 "D:\Program Files (x86)\Microchip\xc8\v1.34\include\pic18f4620.h"
FSR0 equ 0FE9h ;# 
# 6430 "D:\Program Files (x86)\Microchip\xc8\v1.34\include\pic18f4620.h"
FSR0L equ 0FE9h ;# 
# 6436 "D:\Program Files (x86)\Microchip\xc8\v1.34\include\pic18f4620.h"
FSR0H equ 0FEAh ;# 
# 6442 "D:\Program Files (x86)\Microchip\xc8\v1.34\include\pic18f4620.h"
PLUSW0 equ 0FEBh ;# 
# 6448 "D:\Program Files (x86)\Microchip\xc8\v1.34\include\pic18f4620.h"
PREINC0 equ 0FECh ;# 
# 6454 "D:\Program Files (x86)\Microchip\xc8\v1.34\include\pic18f4620.h"
POSTDEC0 equ 0FEDh ;# 
# 6460 "D:\Program Files (x86)\Microchip\xc8\v1.34\include\pic18f4620.h"
POSTINC0 equ 0FEEh ;# 
# 6466 "D:\Program Files (x86)\Microchip\xc8\v1.34\include\pic18f4620.h"
INDF0 equ 0FEFh ;# 
# 6472 "D:\Program Files (x86)\Microchip\xc8\v1.34\include\pic18f4620.h"
INTCON3 equ 0FF0h ;# 
# 6563 "D:\Program Files (x86)\Microchip\xc8\v1.34\include\pic18f4620.h"
INTCON2 equ 0FF1h ;# 
# 6632 "D:\Program Files (x86)\Microchip\xc8\v1.34\include\pic18f4620.h"
INTCON equ 0FF2h ;# 
# 6768 "D:\Program Files (x86)\Microchip\xc8\v1.34\include\pic18f4620.h"
PROD equ 0FF3h ;# 
# 6774 "D:\Program Files (x86)\Microchip\xc8\v1.34\include\pic18f4620.h"
PRODL equ 0FF3h ;# 
# 6780 "D:\Program Files (x86)\Microchip\xc8\v1.34\include\pic18f4620.h"
PRODH equ 0FF4h ;# 
# 6786 "D:\Program Files (x86)\Microchip\xc8\v1.34\include\pic18f4620.h"
TABLAT equ 0FF5h ;# 
# 6794 "D:\Program Files (x86)\Microchip\xc8\v1.34\include\pic18f4620.h"
TBLPTR equ 0FF6h ;# 
# 6800 "D:\Program Files (x86)\Microchip\xc8\v1.34\include\pic18f4620.h"
TBLPTRL equ 0FF6h ;# 
# 6806 "D:\Program Files (x86)\Microchip\xc8\v1.34\include\pic18f4620.h"
TBLPTRH equ 0FF7h ;# 
# 6812 "D:\Program Files (x86)\Microchip\xc8\v1.34\include\pic18f4620.h"
TBLPTRU equ 0FF8h ;# 
# 6820 "D:\Program Files (x86)\Microchip\xc8\v1.34\include\pic18f4620.h"
PCLAT equ 0FF9h ;# 
# 6827 "D:\Program Files (x86)\Microchip\xc8\v1.34\include\pic18f4620.h"
PC equ 0FF9h ;# 
# 6833 "D:\Program Files (x86)\Microchip\xc8\v1.34\include\pic18f4620.h"
PCL equ 0FF9h ;# 
# 6839 "D:\Program Files (x86)\Microchip\xc8\v1.34\include\pic18f4620.h"
PCLATH equ 0FFAh ;# 
# 6845 "D:\Program Files (x86)\Microchip\xc8\v1.34\include\pic18f4620.h"
PCLATU equ 0FFBh ;# 
# 6851 "D:\Program Files (x86)\Microchip\xc8\v1.34\include\pic18f4620.h"
STKPTR equ 0FFCh ;# 
# 6956 "D:\Program Files (x86)\Microchip\xc8\v1.34\include\pic18f4620.h"
TOS equ 0FFDh ;# 
# 6962 "D:\Program Files (x86)\Microchip\xc8\v1.34\include\pic18f4620.h"
TOSL equ 0FFDh ;# 
# 6968 "D:\Program Files (x86)\Microchip\xc8\v1.34\include\pic18f4620.h"
TOSH equ 0FFEh ;# 
# 6974 "D:\Program Files (x86)\Microchip\xc8\v1.34\include\pic18f4620.h"
TOSU equ 0FFFh ;# 
	FNCALL	_main,_Display_Lower_Digit
	FNCALL	_main,_Display_Upper_Digit
	FNCALL	_main,_Init_ADC
	FNCALL	_main,_WAIT_1_SEC
	FNROOT	_main
	global	_array
psect	idataCOMRAM,class=CODE,space=0,delta=1,noexec
global __pidataCOMRAM
__pidataCOMRAM:
	file	"Lab5_7Seg.c"
	line	23

;initializer for _array
	db	low(040h)
	db	low(079h)
	db	low(024h)
	db	low(030h)
	db	low(019h)
	db	low(012h)
	db	low(02h)
	db	low(078h)
	db	low(0)
	db	low(018h)
	global	_ADCON1
_ADCON1	set	0xFC1
	global	_ADCON2
_ADCON2	set	0xFC0
	global	_PORTA
_PORTA	set	0xF80
	global	_PORTB
_PORTB	set	0xF81
	global	_PORTC
_PORTC	set	0xF82
	global	_PORTD
_PORTD	set	0xF83
	global	_PORTE
_PORTE	set	0xF84
	global	_TRISA
_TRISA	set	0xF92
	global	_TRISB
_TRISB	set	0xF93
	global	_TRISC
_TRISC	set	0xF94
	global	_TRISD
_TRISD	set	0xF95
	global	_TRISE
_TRISE	set	0xF96
; #config settings
global __CFG_OSC$INTIO67
__CFG_OSC$INTIO67 equ 0x0
global __CFG_BOREN$OFF
__CFG_BOREN$OFF equ 0x0
global __CFG_WDT$OFF
__CFG_WDT$OFF equ 0x0
global __CFG_LVP$OFF
__CFG_LVP$OFF equ 0x0
	file	"dist/default/production\Lab5_7Seg.X.production.as"
	line	#
psect	cinit,class=CODE,delta=1,reloc=2
global __pcinit
__pcinit:
global start_initialization
start_initialization:

global __initialization
__initialization:
psect	dataCOMRAM,class=COMRAM,space=1,noexec
global __pdataCOMRAM
__pdataCOMRAM:
	file	"Lab5_7Seg.c"
	line	23
	global	_array
_array:
       ds      10
	file	"dist/default/production\Lab5_7Seg.X.production.as"
	line	#
psect	cinit
; Initialize objects allocated to COMRAM (10 bytes)
	global __pidataCOMRAM
	; load TBLPTR registers with __pidataCOMRAM
	movlw	low (__pidataCOMRAM)
	movwf	tblptrl
	movlw	high(__pidataCOMRAM)
	movwf	tblptrh
	movlw	low highword(__pidataCOMRAM)
	movwf	tblptru
	lfsr	0,__pdataCOMRAM
	lfsr	1,10
	copy_data0:
	tblrd	*+
	movff	tablat, postinc0
	movf	postdec1,w
	movf	fsr1l,w
	bnz	copy_data0
psect cinit,class=CODE,delta=1
global end_of_initialization,__end_of__initialization

;End of C runtime variable initialization code

end_of_initialization:
__end_of__initialization:movlb 0
goto _main	;jump to C main() function
psect	cstackCOMRAM,class=COMRAM,space=1,noexec
global __pcstackCOMRAM
__pcstackCOMRAM:
?_Init_ADC:	; 0 bytes @ 0x0
??_Init_ADC:	; 0 bytes @ 0x0
?_Display_Upper_Digit:	; 0 bytes @ 0x0
??_Display_Upper_Digit:	; 0 bytes @ 0x0
?_Display_Lower_Digit:	; 0 bytes @ 0x0
??_Display_Lower_Digit:	; 0 bytes @ 0x0
?_WAIT_1_SEC:	; 0 bytes @ 0x0
??_WAIT_1_SEC:	; 0 bytes @ 0x0
?_main:	; 0 bytes @ 0x0
	global	Display_Upper_Digit@PE
Display_Upper_Digit@PE:	; 1 bytes @ 0x0
	global	Display_Lower_Digit@digit
Display_Lower_Digit@digit:	; 1 bytes @ 0x0
	global	WAIT_1_SEC@j
WAIT_1_SEC@j:	; 2 bytes @ 0x0
	ds   1
	global	Display_Upper_Digit@digit
Display_Upper_Digit@digit:	; 1 bytes @ 0x1
	ds   1
??_main:	; 0 bytes @ 0x2
	global	main@i
main@i:	; 2 bytes @ 0x2
	ds   2
;!
;!Data Sizes:
;!    Strings     0
;!    Constant    0
;!    Data        10
;!    BSS         0
;!    Persistent  0
;!    Stack       0
;!
;!Auto Spaces:
;!    Space          Size  Autos    Used
;!    COMRAM          127      4      14
;!    BANK0           128      0       0
;!    BANK1           256      0       0
;!    BANK2           256      0       0
;!    BANK3           256      0       0
;!    BANK4           256      0       0
;!    BANK5           256      0       0
;!    BANK6           256      0       0
;!    BANK7           256      0       0
;!    BANK8           256      0       0
;!    BANK9           256      0       0
;!    BANK10          256      0       0
;!    BANK11          256      0       0
;!    BANK12          256      0       0
;!    BANK13          256      0       0
;!    BANK14          256      0       0
;!    BANK15          128      0       0

;!
;!Pointer List with Targets:
;!
;!    None.


;!
;!Critical Paths under _main in COMRAM
;!
;!    _main->_Display_Upper_Digit
;!    _main->_WAIT_1_SEC
;!
;!Critical Paths under _main in BANK0
;!
;!    None.
;!
;!Critical Paths under _main in BANK1
;!
;!    None.
;!
;!Critical Paths under _main in BANK2
;!
;!    None.
;!
;!Critical Paths under _main in BANK3
;!
;!    None.
;!
;!Critical Paths under _main in BANK4
;!
;!    None.
;!
;!Critical Paths under _main in BANK5
;!
;!    None.
;!
;!Critical Paths under _main in BANK6
;!
;!    None.
;!
;!Critical Paths under _main in BANK7
;!
;!    None.
;!
;!Critical Paths under _main in BANK8
;!
;!    None.
;!
;!Critical Paths under _main in BANK9
;!
;!    None.
;!
;!Critical Paths under _main in BANK10
;!
;!    None.
;!
;!Critical Paths under _main in BANK11
;!
;!    None.
;!
;!Critical Paths under _main in BANK12
;!
;!    None.
;!
;!Critical Paths under _main in BANK13
;!
;!    None.
;!
;!Critical Paths under _main in BANK14
;!
;!    None.
;!
;!Critical Paths under _main in BANK15
;!
;!    None.

;;
;;Main: autosize = 0, tempsize = 0, incstack = 0, save=0
;;

;!
;!Call Graph Tables:
;!
;! ---------------------------------------------------------------------------------
;! (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;! ---------------------------------------------------------------------------------
;! (0) _main                                                 2     2      0     150
;!                                              2 COMRAM     2     2      0
;!                _Display_Lower_Digit
;!                _Display_Upper_Digit
;!                           _Init_ADC
;!                         _WAIT_1_SEC
;! ---------------------------------------------------------------------------------
;! (1) _WAIT_1_SEC                                           2     2      0      30
;!                                              0 COMRAM     2     2      0
;! ---------------------------------------------------------------------------------
;! (1) _Init_ADC                                             0     0      0       0
;! ---------------------------------------------------------------------------------
;! (1) _Display_Upper_Digit                                  2     2      0      45
;!                                              0 COMRAM     2     2      0
;! ---------------------------------------------------------------------------------
;! (1) _Display_Lower_Digit                                  1     1      0      15
;!                                              0 COMRAM     1     1      0
;! ---------------------------------------------------------------------------------
;! Estimated maximum stack depth 1
;! ---------------------------------------------------------------------------------
;!
;! Call Graph Graphs:
;!
;! _main (ROOT)
;!   _Display_Lower_Digit
;!   _Display_Upper_Digit
;!   _Init_ADC
;!   _WAIT_1_SEC
;!

;! Address spaces:

;!Name               Size   Autos  Total    Cost      Usage
;!BIGRAM             F7F      0       0      37        0.0%
;!EEDATA             400      0       0       0        0.0%
;!BITBANK14          100      0       0      32        0.0%
;!BANK14             100      0       0      33        0.0%
;!BITBANK13          100      0       0      30        0.0%
;!BANK13             100      0       0      31        0.0%
;!BITBANK12          100      0       0      28        0.0%
;!BANK12             100      0       0      29        0.0%
;!BITBANK11          100      0       0      26        0.0%
;!BANK11             100      0       0      27        0.0%
;!BITBANK10          100      0       0      24        0.0%
;!BANK10             100      0       0      25        0.0%
;!BITBANK9           100      0       0      22        0.0%
;!BANK9              100      0       0      23        0.0%
;!BITBANK8           100      0       0      20        0.0%
;!BANK8              100      0       0      21        0.0%
;!BITBANK7           100      0       0      18        0.0%
;!BANK7              100      0       0      19        0.0%
;!BITBANK6           100      0       0      16        0.0%
;!BANK6              100      0       0      17        0.0%
;!BITBANK5           100      0       0      14        0.0%
;!BANK5              100      0       0      15        0.0%
;!BITBANK4           100      0       0      12        0.0%
;!BANK4              100      0       0      13        0.0%
;!BITBANK3           100      0       0      10        0.0%
;!BANK3              100      0       0      11        0.0%
;!BITBANK2           100      0       0       8        0.0%
;!BANK2              100      0       0       9        0.0%
;!BITBANK1           100      0       0       6        0.0%
;!BANK1              100      0       0       7        0.0%
;!BITBANK15           80      0       0      35        0.0%
;!BANK15              80      0       0      36        0.0%
;!BITBANK0            80      0       0       4        0.0%
;!BANK0               80      0       0       5        0.0%
;!BITCOMRAM           7F      0       0       0        0.0%
;!COMRAM              7F      4       E       1       11.0%
;!BITSFR               0      0       0      40        0.0%
;!SFR                  0      0       0      40        0.0%
;!STACK                0      0       0       2        0.0%
;!NULL                 0      0       0       0        0.0%
;!ABS                  0      0       E      34        0.0%
;!DATA                 0      0       E       3        0.0%
;!CODE                 0      0       0       0        0.0%

	global	_main

;; *************** function _main *****************
;; Defined at:
;;		line 25 in file "Lab5_7Seg.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  i               2    2[COMRAM] int 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr2l, fsr2h, status,2, status,0, prodl, prodh, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         2       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         2       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_Display_Lower_Digit
;;		_Display_Upper_Digit
;;		_Init_ADC
;;		_WAIT_1_SEC
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	text0,class=CODE,space=0,reloc=2
	file	"Lab5_7Seg.c"
	line	25
global __ptext0
__ptext0:
psect	text0
	file	"Lab5_7Seg.c"
	line	25
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:
;incstack = 0
	opt	stack 30
	line	28
	
l660:
	call	_Init_ADC	;wreg free
	line	29
	
l662:
	movlw	low(0Fh)
	movwf	((c:3986)),c	;volatile
	line	30
	
l664:
	movlw	low(0)
	movwf	((c:3987)),c	;volatile
	line	31
	
l666:
	movlw	low(0)
	movwf	((c:3988)),c	;volatile
	line	32
	
l668:
	movlw	low(0)
	movwf	((c:3988)),c	;volatile
	line	33
	
l670:
	movlw	low(0)
	movwf	((c:3989)),c	;volatile
	line	34
	
l672:
	movlw	low(0)
	movwf	((c:3990)),c	;volatile
	goto	l674
	line	36
	
l40:
	line	38
	
l674:
	movlw	low(0)
	movwf	((c:3968)),c	;volatile
	line	39
	
l676:
	movlw	low(0)
	movwf	((c:3969)),c	;volatile
	line	40
	
l678:
	setf	((c:3970)),c	;volatile
	line	41
	
l680:
	setf	((c:3971)),c	;volatile
	line	42
	
l682:
	setf	((c:3972)),c	;volatile
	line	44
	
l684:
	movlw	high(0)
	movwf	((c:main@i+1)),c
	movlw	low(0)
	movwf	((c:main@i)),c
	
l686:
	btfsc	((c:main@i+1)),c,7
	goto	u41
	movf	((c:main@i+1)),c,w
	bnz	u40
	movlw	10
	subwf	 ((c:main@i)),c,w
	btfss	status,0
	goto	u41
	goto	u40

u41:
	goto	l690
u40:
	goto	l674
	
l688:
	goto	l674
	line	45
	
l41:
	line	46
	
l690:
	movf	((c:main@i)),c,w
	
	call	_Display_Upper_Digit
	line	47
	movf	((c:main@i)),c,w
	
	call	_Display_Lower_Digit
	line	48
	
l692:
	call	_WAIT_1_SEC	;wreg free
	line	44
	
l694:
	infsnz	((c:main@i)),c
	incf	((c:main@i+1)),c
	
l696:
	btfsc	((c:main@i+1)),c,7
	goto	u51
	movf	((c:main@i+1)),c,w
	bnz	u50
	movlw	10
	subwf	 ((c:main@i)),c,w
	btfss	status,0
	goto	u51
	goto	u50

u51:
	goto	l690
u50:
	goto	l674
	
l42:
	goto	l674
	line	74
	
l43:
	line	36
	goto	l674
	
l44:
	line	75
	
l45:
	global	start
	goto	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
	signat	_main,88
	global	_WAIT_1_SEC

;; *************** function _WAIT_1_SEC *****************
;; Defined at:
;;		line 18 in file "Lab5_7Seg.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  j               2    0[COMRAM] int 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         2       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         2       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1,class=CODE,space=0,reloc=2
	line	18
global __ptext1
__ptext1:
psect	text1
	file	"Lab5_7Seg.c"
	line	18
	global	__size_of_WAIT_1_SEC
	__size_of_WAIT_1_SEC	equ	__end_of_WAIT_1_SEC-_WAIT_1_SEC
	
_WAIT_1_SEC:
;incstack = 0
	opt	stack 30
	line	20
	
l638:
	movlw	high(0)
	movwf	((c:WAIT_1_SEC@j+1)),c
	movlw	low(0)
	movwf	((c:WAIT_1_SEC@j)),c
	
l640:
	btfsc	((c:WAIT_1_SEC@j+1)),c,7
	goto	u11
	movlw	104
	subwf	 ((c:WAIT_1_SEC@j)),c,w
	movlw	66
	subwfb	((c:WAIT_1_SEC@j+1)),c,w
	btfss	status,0
	goto	u11
	goto	u10

u11:
	goto	l644
u10:
	goto	l35
	
l642:
	goto	l35
	
l33:
	
l644:
	infsnz	((c:WAIT_1_SEC@j)),c
	incf	((c:WAIT_1_SEC@j+1)),c
	
l646:
	btfsc	((c:WAIT_1_SEC@j+1)),c,7
	goto	u21
	movlw	104
	subwf	 ((c:WAIT_1_SEC@j)),c,w
	movlw	66
	subwfb	((c:WAIT_1_SEC@j+1)),c,w
	btfss	status,0
	goto	u21
	goto	u20

u21:
	goto	l644
u20:
	goto	l35
	
l34:
	line	21
	
l35:
	return	;funcret
	opt stack 0
GLOBAL	__end_of_WAIT_1_SEC
	__end_of_WAIT_1_SEC:
	signat	_WAIT_1_SEC,88
	global	_Init_ADC

;; *************** function _Init_ADC *****************
;; Defined at:
;;		line 77 in file "Lab5_7Seg.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text2,class=CODE,space=0,reloc=2
	line	77
global __ptext2
__ptext2:
psect	text2
	file	"Lab5_7Seg.c"
	line	77
	global	__size_of_Init_ADC
	__size_of_Init_ADC	equ	__end_of_Init_ADC-_Init_ADC
	
_Init_ADC:
;incstack = 0
	opt	stack 30
	line	79
	
l648:
	movlw	low(01Bh)
	movwf	((c:4033)),c	;volatile
	line	80
	movlw	low(0A9h)
	movwf	((c:4032)),c	;volatile
	line	81
	
l48:
	return	;funcret
	opt stack 0
GLOBAL	__end_of_Init_ADC
	__end_of_Init_ADC:
	signat	_Init_ADC,88
	global	_Display_Upper_Digit

;; *************** function _Display_Upper_Digit *****************
;; Defined at:
;;		line 83 in file "Lab5_7Seg.c"
;; Parameters:    Size  Location     Type
;;  digit           1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  digit           1    1[COMRAM] unsigned char 
;;  PE              1    0[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr2l, fsr2h, status,2, status,0, prodl, prodh
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         2       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         2       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text3,class=CODE,space=0,reloc=2
	line	83
global __ptext3
__ptext3:
psect	text3
	file	"Lab5_7Seg.c"
	line	83
	global	__size_of_Display_Upper_Digit
	__size_of_Display_Upper_Digit	equ	__end_of_Display_Upper_Digit-_Display_Upper_Digit
	
_Display_Upper_Digit:
;incstack = 0
	opt	stack 30
	movwf	((c:Display_Upper_Digit@digit)),c
	line	85
	
l650:
	movf	((c:Display_Upper_Digit@digit)),c,w
	mullw	01h
	movlw	low(_array)
	addwf	(prodl),c,w
	movwf	c:fsr2l
	movlw	high(_array)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movf	indf2,w
	andlw	low(03Fh)
	movwf	((c:3970)),c	;volatile
	line	86
	movf	((c:Display_Upper_Digit@digit)),c,w
	mullw	01h
	movlw	low(_array)
	addwf	(prodl),c,w
	movwf	c:fsr2l
	movlw	high(_array)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movf	indf2,w
	andlw	low(040h)
	movwf	((c:Display_Upper_Digit@PE)),c
	line	87
	
l652:
	movf	((c:Display_Upper_Digit@PE)),c,w
	btfss	status,2
	goto	u31
	goto	u30
u31:
	goto	l656
u30:
	
l654:
	movlw	low(0)
	movwf	((c:3972)),c	;volatile
	goto	l53
	line	88
	
l51:
	
l656:
	movlw	low(01h)
	movwf	((c:3972)),c	;volatile
	goto	l53
	
l52:
	line	89
	
l53:
	return	;funcret
	opt stack 0
GLOBAL	__end_of_Display_Upper_Digit
	__end_of_Display_Upper_Digit:
	signat	_Display_Upper_Digit,4216
	global	_Display_Lower_Digit

;; *************** function _Display_Lower_Digit *****************
;; Defined at:
;;		line 91 in file "Lab5_7Seg.c"
;; Parameters:    Size  Location     Type
;;  digit           1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  digit           1    0[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr2l, fsr2h, status,2, status,0, prodl, prodh
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         1       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         1       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text4,class=CODE,space=0,reloc=2
	line	91
global __ptext4
__ptext4:
psect	text4
	file	"Lab5_7Seg.c"
	line	91
	global	__size_of_Display_Lower_Digit
	__size_of_Display_Lower_Digit	equ	__end_of_Display_Lower_Digit-_Display_Lower_Digit
	
_Display_Lower_Digit:
;incstack = 0
	opt	stack 30
	movwf	((c:Display_Lower_Digit@digit)),c
	line	93
	
l658:
	movf	((c:Display_Lower_Digit@digit)),c,w
	mullw	01h
	movlw	low(_array)
	addwf	(prodl),c,w
	movwf	c:fsr2l
	movlw	high(_array)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movf	indf2,w
	movwf	((c:3971)),c	;volatile
	line	94
	
l56:
	return	;funcret
	opt stack 0
GLOBAL	__end_of_Display_Lower_Digit
	__end_of_Display_Lower_Digit:
	signat	_Display_Lower_Digit,4216
	GLOBAL	__activetblptr
__activetblptr	EQU	0
	psect	intsave_regs,class=BIGRAM,space=1,noexec
	PSECT	rparam,class=COMRAM,space=1,noexec
	GLOBAL	__Lrparam
	FNCONF	rparam,??,?
	GLOBAL	___rparam_used
	___rparam_used EQU 1
	GLOBAL	___param_bank
	___param_bank EQU 16
GLOBAL	__Lparam, __Hparam
GLOBAL	__Lrparam, __Hrparam
__Lparam	EQU	__Lrparam
__Hparam	EQU	__Hrparam
	end
