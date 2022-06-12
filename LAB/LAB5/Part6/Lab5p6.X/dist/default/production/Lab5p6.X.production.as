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
	FNCALL	_main,_DO_DISPLAY_D1
	FNCALL	_main,_DO_DISPLAY_D2
	FNCALL	_main,_DO_DISPLAY_D3
	FNCALL	_main,_Display_Lower_Digit
	FNCALL	_main,_Display_Upper_Digit
	FNCALL	_main,_Get_Full_ADC
	FNCALL	_main,_Init_ADC
	FNCALL	_main,_Init_TRIS
	FNCALL	_main,_Init_UART
	FNCALL	_main,_Select_ADC_Channel
	FNCALL	_main,_WAIT_1_SEC
	FNCALL	_main,___awdiv
	FNCALL	_main,___awmod
	FNCALL	_main,___awtoft
	FNCALL	_main,___ftadd
	FNCALL	_main,___ftdiv
	FNCALL	_main,___ftmul
	FNCALL	_main,___ftneg
	FNCALL	_main,___fttol
	FNCALL	_main,_printf
	FNCALL	_printf,___awdiv
	FNCALL	_printf,___ftadd
	FNCALL	_printf,___ftge
	FNCALL	_printf,___ftmul
	FNCALL	_printf,___ftneg
	FNCALL	_printf,___ftsub
	FNCALL	_printf,___fttol
	FNCALL	_printf,___lldiv
	FNCALL	_printf,___llmod
	FNCALL	_printf,___lltoft
	FNCALL	_printf,___wmul
	FNCALL	_printf,__div_to_l_
	FNCALL	_printf,__tdiv_to_l_
	FNCALL	_printf,_fround
	FNCALL	_printf,_putch
	FNCALL	_printf,_scale
	FNCALL	_scale,___awdiv
	FNCALL	_scale,___awmod
	FNCALL	_scale,___ftmul
	FNCALL	_scale,___wmul
	FNCALL	_fround,___awdiv
	FNCALL	_fround,___awmod
	FNCALL	_fround,___ftmul
	FNCALL	_fround,___wmul
	FNCALL	___ftmul,___ftpack
	FNCALL	___lltoft,___ftpack
	FNCALL	___ftsub,___ftadd
	FNCALL	___ftadd,___ftpack
	FNCALL	___ftdiv,___ftpack
	FNCALL	___awtoft,___ftpack
	FNCALL	_Init_UART,_OpenUSART
	FNCALL	_DO_DISPLAY_D3,_SET_D3_GREEN
	FNCALL	_DO_DISPLAY_D3,_SET_D3_RED
	FNCALL	_DO_DISPLAY_D3,_SET_D3_YELLOW
	FNCALL	_DO_DISPLAY_D2,___awdiv
	FNROOT	_main
	global	_array
psect	idataCOMRAM,class=CODE,space=0,delta=1,noexec
global __pidataCOMRAM
__pidataCOMRAM:
	file	"Lab5p6.c"
	line	65

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
	global	_dpowers
psect	smallconst,class=SMALLCONST,space=0,reloc=2,noexec
global __psmallconst
__psmallconst:
	db	0
	file	"D:\Program Files (x86)\Microchip\xc8\v1.34\sources\common\doprnt.c"
	line	354
_dpowers:
	dw	(01h) & 0xffff
	dw	highword(01h)
	dw	(0Ah) & 0xffff
	dw	highword(0Ah)
	dw	(064h) & 0xffff
	dw	highword(064h)
	dw	(03E8h) & 0xffff
	dw	highword(03E8h)
	dw	(02710h) & 0xffff
	dw	highword(02710h)
	dw	(0186A0h) & 0xffff
	dw	highword(0186A0h)
	dw	(0F4240h) & 0xffff
	dw	highword(0F4240h)
	dw	(0989680h) & 0xffff
	dw	highword(0989680h)
	dw	(05F5E100h) & 0xffff
	dw	highword(05F5E100h)
	dw	(03B9ACA00h) & 0xffff
	dw	highword(03B9ACA00h)
	global __end_of_dpowers
__end_of_dpowers:
	global	__npowers_
psect	smallconst
	file	"D:\Program Files (x86)\Microchip\xc8\v1.34\sources\common\powers.c"
	line	39
__npowers_:
	db	low(float24(1.0000000000000000))
	db	high(float24(1.0000000000000000))
	db	low highword(float24(1.0000000000000000))
	db	low(float24(0.10000000000000001))
	db	high(float24(0.10000000000000001))
	db	low highword(float24(0.10000000000000001))
	db	low(float24(0.010000000000000000))
	db	high(float24(0.010000000000000000))
	db	low highword(float24(0.010000000000000000))
	db	low(float24(0.0010000000000000000))
	db	high(float24(0.0010000000000000000))
	db	low highword(float24(0.0010000000000000000))
	db	low(float24(0.00010000000000000000))
	db	high(float24(0.00010000000000000000))
	db	low highword(float24(0.00010000000000000000))
	db	low(float24(1.0000000000000001e-005))
	db	high(float24(1.0000000000000001e-005))
	db	low highword(float24(1.0000000000000001e-005))
	db	low(float24(9.9999999999999995e-007))
	db	high(float24(9.9999999999999995e-007))
	db	low highword(float24(9.9999999999999995e-007))
	db	low(float24(9.9999999999999995e-008))
	db	high(float24(9.9999999999999995e-008))
	db	low highword(float24(9.9999999999999995e-008))
	db	low(float24(1.0000000000000000e-008))
	db	high(float24(1.0000000000000000e-008))
	db	low highword(float24(1.0000000000000000e-008))
	db	low(float24(1.0000000000000001e-009))
	db	high(float24(1.0000000000000001e-009))
	db	low highword(float24(1.0000000000000001e-009))
	db	low(float24(1.0000000000000000e-010))
	db	high(float24(1.0000000000000000e-010))
	db	low highword(float24(1.0000000000000000e-010))
	db	low(float24(9.9999999999999995e-021))
	db	high(float24(9.9999999999999995e-021))
	db	low highword(float24(9.9999999999999995e-021))
	db	low(float24(1.0000000000000001e-030))
	db	high(float24(1.0000000000000001e-030))
	db	low highword(float24(1.0000000000000001e-030))
	global __end_of__npowers_
__end_of__npowers_:
	global	__powers_
psect	smallconst
	file	"D:\Program Files (x86)\Microchip\xc8\v1.34\sources\common\powers.c"
	line	7
__powers_:
	db	low(float24(1.0000000000000000))
	db	high(float24(1.0000000000000000))
	db	low highword(float24(1.0000000000000000))
	db	low(float24(10.000000000000000))
	db	high(float24(10.000000000000000))
	db	low highword(float24(10.000000000000000))
	db	low(float24(100.00000000000000))
	db	high(float24(100.00000000000000))
	db	low highword(float24(100.00000000000000))
	db	low(float24(1000.0000000000000))
	db	high(float24(1000.0000000000000))
	db	low highword(float24(1000.0000000000000))
	db	low(float24(10000.000000000000))
	db	high(float24(10000.000000000000))
	db	low highword(float24(10000.000000000000))
	db	low(float24(100000.00000000000))
	db	high(float24(100000.00000000000))
	db	low highword(float24(100000.00000000000))
	db	low(float24(1000000.0000000000))
	db	high(float24(1000000.0000000000))
	db	low highword(float24(1000000.0000000000))
	db	low(float24(10000000.000000000))
	db	high(float24(10000000.000000000))
	db	low highword(float24(10000000.000000000))
	db	low(float24(100000000.00000000))
	db	high(float24(100000000.00000000))
	db	low highword(float24(100000000.00000000))
	db	low(float24(1000000000.0000000))
	db	high(float24(1000000000.0000000))
	db	low highword(float24(1000000000.0000000))
	db	low(float24(10000000000.000000))
	db	high(float24(10000000000.000000))
	db	low highword(float24(10000000000.000000))
	db	low(float24(1.0000000000000000e+020))
	db	high(float24(1.0000000000000000e+020))
	db	low highword(float24(1.0000000000000000e+020))
	db	low(float24(1.0000000000000000e+030))
	db	high(float24(1.0000000000000000e+030))
	db	low highword(float24(1.0000000000000000e+030))
	global __end_of__powers_
__end_of__powers_:
	global	_dpowers
	global	__npowers_
	global	__powers_
	global	_ADCON0
_ADCON0	set	0xFC2
	global	_ADCON0bits
_ADCON0bits	set	0xFC2
	global	_ADCON1
_ADCON1	set	0xFC1
	global	_ADCON2
_ADCON2	set	0xFC0
	global	_ADRESH
_ADRESH	set	0xFC4
	global	_ADRESL
_ADRESL	set	0xFC3
	global	_OSCCON
_OSCCON	set	0xFD3
	global	_PIE1bits
_PIE1bits	set	0xF9D
	global	_PIR1bits
_PIR1bits	set	0xF9E
	global	_PORTA
_PORTA	set	0xF80
	global	_PORTAbits
_PORTAbits	set	0xF80
	global	_PORTBbits
_PORTBbits	set	0xF81
	global	_PORTC
_PORTC	set	0xF82
	global	_PORTD
_PORTD	set	0xF83
	global	_PORTE
_PORTE	set	0xF84
	global	_RCSTA
_RCSTA	set	0xFAB
	global	_RCSTAbits
_RCSTAbits	set	0xFAB
	global	_SPBRG
_SPBRG	set	0xFAF
	global	_SPBRGH
_SPBRGH	set	0xFB0
	global	_TRISA
_TRISA	set	0xF92
	global	_TRISB
_TRISB	set	0xF93
	global	_TRISC
_TRISC	set	0xF94
	global	_TRISCbits
_TRISCbits	set	0xF94
	global	_TRISD
_TRISD	set	0xF95
	global	_TRISE
_TRISE	set	0xF96
	global	_TXREG
_TXREG	set	0xFAD
	global	_TXSTA
_TXSTA	set	0xFAC
	global	_TXSTAbits
_TXSTAbits	set	0xFAC
	global	_PORTB
_PORTB	set	0xF81
	global	_TRMT
_TRMT	set	0x7D61
	
STR_2:
	db	84	;'T'
	db	101	;'e'
	db	109	;'m'
	db	112	;'p'
	db	101	;'e'
	db	114	;'r'
	db	97	;'a'
	db	116	;'t'
	db	117	;'u'
	db	114	;'r'
	db	101	;'e'
	db	32
	db	61	;'='
	db	32
	db	37
	db	100	;'d'
	db	32
	db	70	;'F'
	db	32
	db	13
	db	10
	db	10
	db	0
	
STR_3:
	db	76	;'L'
	db	105	;'i'
	db	103	;'g'
	db	104	;'h'
	db	116	;'t'
	db	32
	db	86	;'V'
	db	111	;'o'
	db	108	;'l'
	db	116	;'t'
	db	32
	db	61	;'='
	db	32
	db	37
	db	100	;'d'
	db	32
	db	109	;'m'
	db	86	;'V'
	db	32
	db	13
	db	10
	db	10
	db	0
	
STR_1:
	db	86	;'V'
	db	111	;'o'
	db	108	;'l'
	db	116	;'t'
	db	97	;'a'
	db	103	;'g'
	db	101	;'e'
	db	32
	db	61	;'='
	db	32
	db	37
	db	102	;'f'
	db	32
	db	40
	db	109	;'m'
	db	86	;'V'
	db	41
	db	32
	db	13
	db	10
	db	0
; #config settings
global __CFG_OSC$INTIO67
__CFG_OSC$INTIO67 equ 0x0
global __CFG_BOREN$OFF
__CFG_BOREN$OFF equ 0x0
global __CFG_WDT$OFF
__CFG_WDT$OFF equ 0x0
global __CFG_LVP$OFF
__CFG_LVP$OFF equ 0x0
	file	"dist/default/production\Lab5p6.X.production.as"
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
	file	"Lab5p6.c"
	line	65
	global	_array
_array:
       ds      10
	file	"dist/default/production\Lab5p6.X.production.as"
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
__end_of__initialization:	GLOBAL	__Lmediumconst
	movlw	low highword(__Lmediumconst)
	movwf	tblptru
movlb 0
goto _main	;jump to C main() function
psect	cstackCOMRAM,class=COMRAM,space=1,noexec
global __pcstackCOMRAM
__pcstackCOMRAM:
?_OpenUSART:	; 0 bytes @ 0x0
?_Init_ADC:	; 0 bytes @ 0x0
??_Init_ADC:	; 0 bytes @ 0x0
?_Init_TRIS:	; 0 bytes @ 0x0
??_Init_TRIS:	; 0 bytes @ 0x0
?_Display_Upper_Digit:	; 0 bytes @ 0x0
??_Display_Upper_Digit:	; 0 bytes @ 0x0
?_Display_Lower_Digit:	; 0 bytes @ 0x0
??_Display_Lower_Digit:	; 0 bytes @ 0x0
?_DO_DISPLAY_D1:	; 0 bytes @ 0x0
?_DO_DISPLAY_D3:	; 0 bytes @ 0x0
?_SET_D3_RED:	; 0 bytes @ 0x0
??_SET_D3_RED:	; 0 bytes @ 0x0
?_SET_D3_GREEN:	; 0 bytes @ 0x0
??_SET_D3_GREEN:	; 0 bytes @ 0x0
?_SET_D3_YELLOW:	; 0 bytes @ 0x0
??_SET_D3_YELLOW:	; 0 bytes @ 0x0
?_Select_ADC_Channel:	; 0 bytes @ 0x0
??_Select_ADC_Channel:	; 0 bytes @ 0x0
?_putch:	; 0 bytes @ 0x0
??_putch:	; 0 bytes @ 0x0
?_Init_UART:	; 0 bytes @ 0x0
?_WAIT_1_SEC:	; 0 bytes @ 0x0
??_WAIT_1_SEC:	; 0 bytes @ 0x0
?_main:	; 0 bytes @ 0x0
?___ftge:	; 1 bit 
	global	?_Get_Full_ADC
?_Get_Full_ADC:	; 2 bytes @ 0x0
	global	?___awmod
?___awmod:	; 2 bytes @ 0x0
	global	?___ftpack
?___ftpack:	; 3 bytes @ 0x0
	global	?___ftneg
?___ftneg:	; 3 bytes @ 0x0
	global	?__tdiv_to_l_
?__tdiv_to_l_:	; 4 bytes @ 0x0
	global	?__div_to_l_
?__div_to_l_:	; 4 bytes @ 0x0
	global	?___lldiv
?___lldiv:	; 4 bytes @ 0x0
	global	Select_ADC_Channel@channel
Select_ADC_Channel@channel:	; 1 bytes @ 0x0
	global	putch@c
putch@c:	; 1 bytes @ 0x0
	global	Display_Upper_Digit@PE
Display_Upper_Digit@PE:	; 1 bytes @ 0x0
	global	Display_Lower_Digit@digit
Display_Lower_Digit@digit:	; 1 bytes @ 0x0
	global	WAIT_1_SEC@j
WAIT_1_SEC@j:	; 2 bytes @ 0x0
	global	DO_DISPLAY_D1@temp
DO_DISPLAY_D1@temp:	; 2 bytes @ 0x0
	global	DO_DISPLAY_D3@voltage
DO_DISPLAY_D3@voltage:	; 2 bytes @ 0x0
	global	OpenUSART@spbrg
OpenUSART@spbrg:	; 2 bytes @ 0x0
	global	___awmod@dividend
___awmod@dividend:	; 2 bytes @ 0x0
	global	__div_to_l_@f1
__div_to_l_@f1:	; 3 bytes @ 0x0
	global	___ftpack@arg
___ftpack@arg:	; 3 bytes @ 0x0
	global	__tdiv_to_l_@f1
__tdiv_to_l_@f1:	; 3 bytes @ 0x0
	global	___ftge@ff1
___ftge@ff1:	; 3 bytes @ 0x0
	global	___ftneg@f1
___ftneg@f1:	; 3 bytes @ 0x0
	global	___lldiv@dividend
___lldiv@dividend:	; 4 bytes @ 0x0
	ds   1
	global	Display_Upper_Digit@digit
Display_Upper_Digit@digit:	; 1 bytes @ 0x1
	ds   1
??_OpenUSART:	; 0 bytes @ 0x2
??_Get_Full_ADC:	; 0 bytes @ 0x2
??_DO_DISPLAY_D1:	; 0 bytes @ 0x2
??_DO_DISPLAY_D3:	; 0 bytes @ 0x2
	global	OpenUSART@config
OpenUSART@config:	; 1 bytes @ 0x2
	global	___awmod@divisor
___awmod@divisor:	; 2 bytes @ 0x2
	ds   1
??_Init_UART:	; 0 bytes @ 0x3
??___ftneg:	; 0 bytes @ 0x3
	global	___ftpack@exp
___ftpack@exp:	; 1 bytes @ 0x3
	global	__div_to_l_@f2
__div_to_l_@f2:	; 3 bytes @ 0x3
	global	__tdiv_to_l_@f2
__tdiv_to_l_@f2:	; 3 bytes @ 0x3
	global	___ftge@ff2
___ftge@ff2:	; 3 bytes @ 0x3
	ds   1
??___awmod:	; 0 bytes @ 0x4
	global	___awmod@counter
___awmod@counter:	; 1 bytes @ 0x4
	global	___ftpack@sign
___ftpack@sign:	; 1 bytes @ 0x4
	global	Get_Full_ADC@result
Get_Full_ADC@result:	; 2 bytes @ 0x4
	global	___lldiv@divisor
___lldiv@divisor:	; 4 bytes @ 0x4
	ds   1
??___ftpack:	; 0 bytes @ 0x5
	global	___awmod@sign
___awmod@sign:	; 1 bytes @ 0x5
	ds   1
??__tdiv_to_l_:	; 0 bytes @ 0x6
??__div_to_l_:	; 0 bytes @ 0x6
??___ftge:	; 0 bytes @ 0x6
	global	?___awdiv
?___awdiv:	; 2 bytes @ 0x6
	global	___awdiv@dividend
___awdiv@dividend:	; 2 bytes @ 0x6
	global	__div_to_l_@quot
__div_to_l_@quot:	; 4 bytes @ 0x6
	ds   2
??___lldiv:	; 0 bytes @ 0x8
	global	?___awtoft
?___awtoft:	; 3 bytes @ 0x8
	global	?___lltoft
?___lltoft:	; 3 bytes @ 0x8
	global	___awdiv@divisor
___awdiv@divisor:	; 2 bytes @ 0x8
	global	___awtoft@c
___awtoft@c:	; 2 bytes @ 0x8
	global	___lldiv@quotient
___lldiv@quotient:	; 4 bytes @ 0x8
	global	___lltoft@c
___lltoft@c:	; 4 bytes @ 0x8
	ds   1
	global	__tdiv_to_l_@quot
__tdiv_to_l_@quot:	; 4 bytes @ 0x9
	ds   1
??___awdiv:	; 0 bytes @ 0xA
	global	___awdiv@counter
___awdiv@counter:	; 1 bytes @ 0xA
	global	__div_to_l_@cntr
__div_to_l_@cntr:	; 1 bytes @ 0xA
	ds   1
??___awtoft:	; 0 bytes @ 0xB
	global	___awdiv@sign
___awdiv@sign:	; 1 bytes @ 0xB
	global	___awtoft@sign
___awtoft@sign:	; 1 bytes @ 0xB
	global	__div_to_l_@exp1
__div_to_l_@exp1:	; 1 bytes @ 0xB
	ds   1
??___lltoft:	; 0 bytes @ 0xC
	global	___lldiv@counter
___lldiv@counter:	; 1 bytes @ 0xC
	global	___awdiv@quotient
___awdiv@quotient:	; 2 bytes @ 0xC
	ds   1
	global	?___llmod
?___llmod:	; 4 bytes @ 0xD
	global	__tdiv_to_l_@cntr
__tdiv_to_l_@cntr:	; 1 bytes @ 0xD
	global	___llmod@dividend
___llmod@dividend:	; 4 bytes @ 0xD
	ds   1
?_DO_DISPLAY_D2:	; 0 bytes @ 0xE
	global	?___wmul
?___wmul:	; 2 bytes @ 0xE
	global	__tdiv_to_l_@exp1
__tdiv_to_l_@exp1:	; 1 bytes @ 0xE
	global	DO_DISPLAY_D2@temp
DO_DISPLAY_D2@temp:	; 2 bytes @ 0xE
	global	___wmul@multiplier
___wmul@multiplier:	; 2 bytes @ 0xE
	ds   2
??_DO_DISPLAY_D2:	; 0 bytes @ 0x10
	global	___lltoft@exp
___lltoft@exp:	; 1 bytes @ 0x10
	global	DO_DISPLAY_D2@T
DO_DISPLAY_D2@T:	; 2 bytes @ 0x10
	global	___wmul@multiplicand
___wmul@multiplicand:	; 2 bytes @ 0x10
	ds   1
	global	___llmod@divisor
___llmod@divisor:	; 4 bytes @ 0x11
	ds   1
??___wmul:	; 0 bytes @ 0x12
	global	___wmul@product
___wmul@product:	; 2 bytes @ 0x12
	ds   2
	global	?___ftmul
?___ftmul:	; 3 bytes @ 0x14
	global	___ftmul@f1
___ftmul@f1:	; 3 bytes @ 0x14
	ds   1
??___llmod:	; 0 bytes @ 0x15
	global	___llmod@counter
___llmod@counter:	; 1 bytes @ 0x15
	ds   2
	global	___ftmul@f2
___ftmul@f2:	; 3 bytes @ 0x17
	ds   3
??___ftmul:	; 0 bytes @ 0x1A
	ds   3
	global	___ftmul@exp
___ftmul@exp:	; 1 bytes @ 0x1D
	ds   1
	global	___ftmul@f3_as_product
___ftmul@f3_as_product:	; 3 bytes @ 0x1E
	ds   3
	global	___ftmul@cntr
___ftmul@cntr:	; 1 bytes @ 0x21
	ds   1
	global	___ftmul@sign
___ftmul@sign:	; 1 bytes @ 0x22
	ds   1
	global	?_fround
?_fround:	; 3 bytes @ 0x23
	global	?_scale
?_scale:	; 3 bytes @ 0x23
	ds   3
??_fround:	; 0 bytes @ 0x26
??_scale:	; 0 bytes @ 0x26
	global	_fround$1264
_fround$1264:	; 3 bytes @ 0x26
	global	_scale$1265
_scale$1265:	; 3 bytes @ 0x26
	ds   3
	global	scale@scl
scale@scl:	; 1 bytes @ 0x29
	global	_fround$1263
_fround$1263:	; 3 bytes @ 0x29
	ds   1
	global	?___fttol
?___fttol:	; 4 bytes @ 0x2A
	global	___fttol@f1
___fttol@f1:	; 3 bytes @ 0x2A
	ds   2
	global	fround@prec
fround@prec:	; 1 bytes @ 0x2C
	ds   1
	global	?___ftadd
?___ftadd:	; 3 bytes @ 0x2D
	global	___ftadd@f1
___ftadd@f1:	; 3 bytes @ 0x2D
	ds   1
??___fttol:	; 0 bytes @ 0x2E
	ds   2
	global	___ftadd@f2
___ftadd@f2:	; 3 bytes @ 0x30
	ds   3
??___ftadd:	; 0 bytes @ 0x33
	global	___fttol@sign1
___fttol@sign1:	; 1 bytes @ 0x33
	ds   1
	global	___fttol@lval
___fttol@lval:	; 4 bytes @ 0x34
	ds   2
	global	___ftadd@sign
___ftadd@sign:	; 1 bytes @ 0x36
	ds   1
	global	___ftadd@exp2
___ftadd@exp2:	; 1 bytes @ 0x37
	ds   1
	global	___ftadd@exp1
___ftadd@exp1:	; 1 bytes @ 0x38
	global	___fttol@exp1
___fttol@exp1:	; 1 bytes @ 0x38
	ds   1
	global	?___ftdiv
?___ftdiv:	; 3 bytes @ 0x39
	global	?___ftsub
?___ftsub:	; 3 bytes @ 0x39
	global	___ftdiv@f1
___ftdiv@f1:	; 3 bytes @ 0x39
	global	___ftsub@f1
___ftsub@f1:	; 3 bytes @ 0x39
	ds   3
	global	___ftdiv@f2
___ftdiv@f2:	; 3 bytes @ 0x3C
	global	___ftsub@f2
___ftsub@f2:	; 3 bytes @ 0x3C
	ds   3
??___ftdiv:	; 0 bytes @ 0x3F
??___ftsub:	; 0 bytes @ 0x3F
	global	?_printf
?_printf:	; 2 bytes @ 0x3F
	global	printf@f
printf@f:	; 2 bytes @ 0x3F
	ds   3
	global	___ftdiv@cntr
___ftdiv@cntr:	; 1 bytes @ 0x42
	ds   1
	global	___ftdiv@f3
___ftdiv@f3:	; 3 bytes @ 0x43
	ds   1
??_printf:	; 0 bytes @ 0x44
	ds   2
	global	___ftdiv@exp
___ftdiv@exp:	; 1 bytes @ 0x46
	ds   1
	global	___ftdiv@sign
___ftdiv@sign:	; 1 bytes @ 0x47
	ds   3
	global	_printf$1266
_printf$1266:	; 3 bytes @ 0x4A
	ds   3
	global	printf@ap
printf@ap:	; 2 bytes @ 0x4D
	ds   2
	global	printf@flag
printf@flag:	; 2 bytes @ 0x4F
	ds   2
	global	printf@prec
printf@prec:	; 2 bytes @ 0x51
	ds   2
	global	printf@val
printf@val:	; 4 bytes @ 0x53
	ds   4
	global	printf@exp
printf@exp:	; 2 bytes @ 0x57
	ds   2
	global	printf@tmpval
printf@tmpval:	; 4 bytes @ 0x59
	ds   4
	global	printf@fval
printf@fval:	; 3 bytes @ 0x5D
	ds   3
	global	printf@c
printf@c:	; 1 bytes @ 0x60
	ds   1
??_main:	; 0 bytes @ 0x61
	ds   2
	global	main@temperature_C
main@temperature_C:	; 3 bytes @ 0x63
	ds   3
	global	main@temperature_F
main@temperature_F:	; 3 bytes @ 0x66
	ds   3
	global	main@U
main@U:	; 1 bytes @ 0x69
	ds   1
	global	main@L
main@L:	; 1 bytes @ 0x6A
	ds   1
	global	main@voltage_mv
main@voltage_mv:	; 3 bytes @ 0x6B
	ds   3
	global	main@voltage_mv1
main@voltage_mv1:	; 2 bytes @ 0x6E
	ds   2
	global	main@num_step
main@num_step:	; 2 bytes @ 0x70
	ds   2
	global	main@tempF
main@tempF:	; 2 bytes @ 0x72
	ds   2
;!
;!Data Sizes:
;!    Strings     67
;!    Constant    118
;!    Data        10
;!    BSS         0
;!    Persistent  0
;!    Stack       0
;!
;!Auto Spaces:
;!    Space          Size  Autos    Used
;!    COMRAM          127    116     126
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
;!    printf@f	PTR const unsigned char  size(2) Largest target is 23
;!		 -> STR_3(CODE[23]), STR_2(CODE[23]), STR_1(CODE[21]), 
;!
;!    printf@ap	PTR void [1] size(2) Largest target is 2
;!		 -> ?_printf(COMRAM[2]), 
;!


;!
;!Critical Paths under _main in COMRAM
;!
;!    _main->_printf
;!    _printf->___ftsub
;!    _scale->___ftmul
;!    _fround->___ftmul
;!    ___wmul->___awdiv
;!    ___ftmul->___wmul
;!    ___lltoft->___ftpack
;!    ___llmod->___lldiv
;!    ___fttol->_scale
;!    ___ftsub->___ftadd
;!    ___ftadd->_fround
;!    ___ftdiv->___ftadd
;!    ___awtoft->___ftpack
;!    _Init_UART->_OpenUSART
;!    _DO_DISPLAY_D2->___awdiv
;!    ___awdiv->___awmod
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
;;Main: autosize = 0, tempsize = 2, incstack = 0, save=0
;;

;!
;!Call Graph Tables:
;!
;! ---------------------------------------------------------------------------------
;! (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;! ---------------------------------------------------------------------------------
;! (0) _main                                                19    19      0   56002
;!                                             97 COMRAM    19    19      0
;!                      _DO_DISPLAY_D1
;!                      _DO_DISPLAY_D2
;!                      _DO_DISPLAY_D3
;!                _Display_Lower_Digit
;!                _Display_Upper_Digit
;!                       _Get_Full_ADC
;!                           _Init_ADC
;!                          _Init_TRIS
;!                          _Init_UART
;!                 _Select_ADC_Channel
;!                         _WAIT_1_SEC
;!                            ___awdiv
;!                            ___awmod
;!                           ___awtoft
;!                            ___ftadd
;!                            ___ftdiv
;!                            ___ftmul
;!                            ___ftneg
;!                            ___fttol
;!                             _printf
;! ---------------------------------------------------------------------------------
;! (1) _printf                                              42    37      5   38551
;!                                             63 COMRAM    34    29      5
;!                            ___awdiv
;!                            ___ftadd
;!                             ___ftge
;!                            ___ftmul
;!                            ___ftneg
;!                            ___ftsub
;!                            ___fttol
;!                            ___lldiv
;!                            ___llmod
;!                           ___lltoft
;!                             ___wmul
;!                         __div_to_l_
;!                        __tdiv_to_l_
;!                             _fround
;!                              _putch
;!                              _scale
;! ---------------------------------------------------------------------------------
;! (2) _scale                                               10     7      3    9120
;!                                             35 COMRAM     7     4      3
;!                            ___awdiv
;!                            ___awmod
;!                            ___ftmul
;!                             ___wmul
;! ---------------------------------------------------------------------------------
;! (2) _putch                                                1     1      0      22
;!                                              0 COMRAM     1     1      0
;! ---------------------------------------------------------------------------------
;! (2) _fround                                              13    10      3    8922
;!                                             35 COMRAM    10     7      3
;!                            ___awdiv
;!                            ___awmod
;!                            ___ftmul
;!                             ___wmul
;! ---------------------------------------------------------------------------------
;! (3) ___wmul                                               6     2      4    1855
;!                                             14 COMRAM     6     2      4
;!                            ___awdiv (ARG)
;!                            ___awmod (ARG)
;! ---------------------------------------------------------------------------------
;! (3) ___ftmul                                             15     9      6    3848
;!                                             20 COMRAM    15     9      6
;!                            ___awdiv (ARG)
;!                            ___awmod (ARG)
;!                           ___awtoft (ARG)
;!                           ___ftpack
;!                             ___wmul (ARG)
;! ---------------------------------------------------------------------------------
;! (3) ___awmod                                              6     2      4    1356
;!                                              0 COMRAM     6     2      4
;! ---------------------------------------------------------------------------------
;! (2) __tdiv_to_l_                                         15     9      6     409
;!                                              0 COMRAM    15     9      6
;! ---------------------------------------------------------------------------------
;! (2) __div_to_l_                                          12     6      6     552
;!                                              0 COMRAM    12     6      6
;! ---------------------------------------------------------------------------------
;! (2) ___lltoft                                             9     5      4    1868
;!                                              8 COMRAM     9     5      4
;!                           ___ftpack
;! ---------------------------------------------------------------------------------
;! (2) ___llmod                                              9     1      8     583
;!                                             13 COMRAM     9     1      8
;!                            ___lldiv (ARG)
;! ---------------------------------------------------------------------------------
;! (2) ___lldiv                                             13     5      8     480
;!                                              0 COMRAM    13     5      8
;! ---------------------------------------------------------------------------------
;! (2) ___fttol                                             15    11      4     464
;!                                             42 COMRAM    15    11      4
;!                            ___ftmul (ARG)
;!                              _scale (ARG)
;! ---------------------------------------------------------------------------------
;! (2) ___ftsub                                              6     0      6    3343
;!                                             57 COMRAM     6     0      6
;!                            ___ftadd
;!                           ___lltoft (ARG)
;! ---------------------------------------------------------------------------------
;! (3) ___ftadd                                             12     6      6    3090
;!                                             45 COMRAM    12     6      6
;!                            ___ftmul (ARG)
;!                            ___ftneg (ARG)
;!                           ___ftpack
;!                             _fround (ARG)
;! ---------------------------------------------------------------------------------
;! (2) ___ftneg                                              3     0      3     151
;!                                              0 COMRAM     3     0      3
;! ---------------------------------------------------------------------------------
;! (2) ___ftge                                               9     3      6     454
;!                                              0 COMRAM     9     3      6
;! ---------------------------------------------------------------------------------
;! (1) ___ftdiv                                             15     9      6    2212
;!                                             57 COMRAM    15     9      6
;!                            ___ftadd (ARG)
;!                            ___ftneg (ARG)
;!                           ___ftpack
;! ---------------------------------------------------------------------------------
;! (1) ___awtoft                                             4     1      3    1890
;!                                              8 COMRAM     4     1      3
;!                           ___ftpack
;! ---------------------------------------------------------------------------------
;! (4) ___ftpack                                             8     3      5    1746
;!                                              0 COMRAM     8     3      5
;! ---------------------------------------------------------------------------------
;! (1) _WAIT_1_SEC                                           2     2      0      30
;!                                              0 COMRAM     2     2      0
;! ---------------------------------------------------------------------------------
;! (1) _Select_ADC_Channel                                   1     1      0      15
;!                                              0 COMRAM     1     1      0
;! ---------------------------------------------------------------------------------
;! (1) _Init_UART                                            0     0      0     273
;!                          _OpenUSART
;! ---------------------------------------------------------------------------------
;! (2) _OpenUSART                                            3     1      2     273
;!                                              0 COMRAM     3     1      2
;! ---------------------------------------------------------------------------------
;! (1) _Init_TRIS                                            0     0      0       0
;! ---------------------------------------------------------------------------------
;! (1) _Init_ADC                                             0     0      0       0
;! ---------------------------------------------------------------------------------
;! (1) _Get_Full_ADC                                         6     4      2      23
;!                                              0 COMRAM     6     4      2
;! ---------------------------------------------------------------------------------
;! (1) _Display_Upper_Digit                                  2     2      0      45
;!                                              0 COMRAM     2     2      0
;! ---------------------------------------------------------------------------------
;! (1) _Display_Lower_Digit                                  1     1      0      15
;!                                              0 COMRAM     1     1      0
;! ---------------------------------------------------------------------------------
;! (1) _DO_DISPLAY_D3                                        2     0      2     141
;!                                              0 COMRAM     2     0      2
;!                       _SET_D3_GREEN
;!                         _SET_D3_RED
;!                      _SET_D3_YELLOW
;! ---------------------------------------------------------------------------------
;! (2) _SET_D3_YELLOW                                        0     0      0       0
;! ---------------------------------------------------------------------------------
;! (2) _SET_D3_RED                                           0     0      0       0
;! ---------------------------------------------------------------------------------
;! (2) _SET_D3_GREEN                                         0     0      0       0
;! ---------------------------------------------------------------------------------
;! (1) _DO_DISPLAY_D2                                        4     2      2    1758
;!                                             14 COMRAM     4     2      2
;!                            ___awdiv
;! ---------------------------------------------------------------------------------
;! (3) ___awdiv                                              8     4      4    1572
;!                                              6 COMRAM     8     4      4
;!                            ___awmod (ARG)
;! ---------------------------------------------------------------------------------
;! (1) _DO_DISPLAY_D1                                        2     0      2     229
;!                                              0 COMRAM     2     0      2
;! ---------------------------------------------------------------------------------
;! Estimated maximum stack depth 4
;! ---------------------------------------------------------------------------------
;!
;! Call Graph Graphs:
;!
;! _main (ROOT)
;!   _DO_DISPLAY_D1
;!   _DO_DISPLAY_D2
;!     ___awdiv
;!       ___awmod (ARG)
;!   _DO_DISPLAY_D3
;!     _SET_D3_GREEN
;!     _SET_D3_RED
;!     _SET_D3_YELLOW
;!   _Display_Lower_Digit
;!   _Display_Upper_Digit
;!   _Get_Full_ADC
;!   _Init_ADC
;!   _Init_TRIS
;!   _Init_UART
;!     _OpenUSART
;!   _Select_ADC_Channel
;!   _WAIT_1_SEC
;!   ___awdiv
;!     ___awmod (ARG)
;!   ___awmod
;!   ___awtoft
;!     ___ftpack
;!   ___ftadd
;!     ___ftmul (ARG)
;!       ___awdiv (ARG)
;!         ___awmod (ARG)
;!       ___awmod (ARG)
;!       ___awtoft (ARG)
;!         ___ftpack
;!       ___ftpack (ARG)
;!       ___wmul (ARG)
;!         ___awdiv (ARG)
;!           ___awmod (ARG)
;!         ___awmod (ARG)
;!     ___ftneg (ARG)
;!     ___ftpack (ARG)
;!     _fround (ARG)
;!       ___awdiv
;!         ___awmod (ARG)
;!       ___awmod
;!       ___ftmul
;!         ___awdiv (ARG)
;!           ___awmod (ARG)
;!         ___awmod (ARG)
;!         ___awtoft (ARG)
;!           ___ftpack
;!         ___ftpack (ARG)
;!         ___wmul (ARG)
;!           ___awdiv (ARG)
;!             ___awmod (ARG)
;!           ___awmod (ARG)
;!       ___wmul
;!         ___awdiv (ARG)
;!           ___awmod (ARG)
;!         ___awmod (ARG)
;!   ___ftdiv
;!     ___ftadd (ARG)
;!       ___ftmul (ARG)
;!         ___awdiv (ARG)
;!           ___awmod (ARG)
;!         ___awmod (ARG)
;!         ___awtoft (ARG)
;!           ___ftpack
;!         ___ftpack (ARG)
;!         ___wmul (ARG)
;!           ___awdiv (ARG)
;!             ___awmod (ARG)
;!           ___awmod (ARG)
;!       ___ftneg (ARG)
;!       ___ftpack (ARG)
;!       _fround (ARG)
;!         ___awdiv
;!           ___awmod (ARG)
;!         ___awmod
;!         ___ftmul
;!           ___awdiv (ARG)
;!             ___awmod (ARG)
;!           ___awmod (ARG)
;!           ___awtoft (ARG)
;!             ___ftpack
;!           ___ftpack (ARG)
;!           ___wmul (ARG)
;!             ___awdiv (ARG)
;!               ___awmod (ARG)
;!             ___awmod (ARG)
;!         ___wmul
;!           ___awdiv (ARG)
;!             ___awmod (ARG)
;!           ___awmod (ARG)
;!     ___ftneg (ARG)
;!     ___ftpack (ARG)
;!   ___ftmul
;!     ___awdiv (ARG)
;!       ___awmod (ARG)
;!     ___awmod (ARG)
;!     ___awtoft (ARG)
;!       ___ftpack
;!     ___ftpack (ARG)
;!     ___wmul (ARG)
;!       ___awdiv (ARG)
;!         ___awmod (ARG)
;!       ___awmod (ARG)
;!   ___ftneg
;!   ___fttol
;!     ___ftmul (ARG)
;!       ___awdiv (ARG)
;!         ___awmod (ARG)
;!       ___awmod (ARG)
;!       ___awtoft (ARG)
;!         ___ftpack
;!       ___ftpack (ARG)
;!       ___wmul (ARG)
;!         ___awdiv (ARG)
;!           ___awmod (ARG)
;!         ___awmod (ARG)
;!     _scale (ARG)
;!       ___awdiv
;!         ___awmod (ARG)
;!       ___awmod
;!       ___ftmul
;!         ___awdiv (ARG)
;!           ___awmod (ARG)
;!         ___awmod (ARG)
;!         ___awtoft (ARG)
;!           ___ftpack
;!         ___ftpack (ARG)
;!         ___wmul (ARG)
;!           ___awdiv (ARG)
;!             ___awmod (ARG)
;!           ___awmod (ARG)
;!       ___wmul
;!         ___awdiv (ARG)
;!           ___awmod (ARG)
;!         ___awmod (ARG)
;!   _printf
;!     ___awdiv
;!       ___awmod (ARG)
;!     ___ftadd
;!       ___ftmul (ARG)
;!         ___awdiv (ARG)
;!           ___awmod (ARG)
;!         ___awmod (ARG)
;!         ___awtoft (ARG)
;!           ___ftpack
;!         ___ftpack (ARG)
;!         ___wmul (ARG)
;!           ___awdiv (ARG)
;!             ___awmod (ARG)
;!           ___awmod (ARG)
;!       ___ftneg (ARG)
;!       ___ftpack (ARG)
;!       _fround (ARG)
;!         ___awdiv
;!           ___awmod (ARG)
;!         ___awmod
;!         ___ftmul
;!           ___awdiv (ARG)
;!             ___awmod (ARG)
;!           ___awmod (ARG)
;!           ___awtoft (ARG)
;!             ___ftpack
;!           ___ftpack (ARG)
;!           ___wmul (ARG)
;!             ___awdiv (ARG)
;!               ___awmod (ARG)
;!             ___awmod (ARG)
;!         ___wmul
;!           ___awdiv (ARG)
;!             ___awmod (ARG)
;!           ___awmod (ARG)
;!     ___ftge
;!     ___ftmul
;!       ___awdiv (ARG)
;!         ___awmod (ARG)
;!       ___awmod (ARG)
;!       ___awtoft (ARG)
;!         ___ftpack
;!       ___ftpack (ARG)
;!       ___wmul (ARG)
;!         ___awdiv (ARG)
;!           ___awmod (ARG)
;!         ___awmod (ARG)
;!     ___ftneg
;!     ___ftsub
;!       ___ftadd
;!         ___ftmul (ARG)
;!           ___awdiv (ARG)
;!             ___awmod (ARG)
;!           ___awmod (ARG)
;!           ___awtoft (ARG)
;!             ___ftpack
;!           ___ftpack (ARG)
;!           ___wmul (ARG)
;!             ___awdiv (ARG)
;!               ___awmod (ARG)
;!             ___awmod (ARG)
;!         ___ftneg (ARG)
;!         ___ftpack (ARG)
;!         _fround (ARG)
;!           ___awdiv
;!             ___awmod (ARG)
;!           ___awmod
;!           ___ftmul
;!             ___awdiv (ARG)
;!               ___awmod (ARG)
;!             ___awmod (ARG)
;!             ___awtoft (ARG)
;!               ___ftpack
;!             ___ftpack (ARG)
;!             ___wmul (ARG)
;!               ___awdiv (ARG)
;!                 ___awmod (ARG)
;!               ___awmod (ARG)
;!           ___wmul
;!             ___awdiv (ARG)
;!               ___awmod (ARG)
;!             ___awmod (ARG)
;!       ___lltoft (ARG)
;!         ___ftpack
;!     ___fttol
;!       ___ftmul (ARG)
;!         ___awdiv (ARG)
;!           ___awmod (ARG)
;!         ___awmod (ARG)
;!         ___awtoft (ARG)
;!           ___ftpack
;!         ___ftpack (ARG)
;!         ___wmul (ARG)
;!           ___awdiv (ARG)
;!             ___awmod (ARG)
;!           ___awmod (ARG)
;!       _scale (ARG)
;!         ___awdiv
;!           ___awmod (ARG)
;!         ___awmod
;!         ___ftmul
;!           ___awdiv (ARG)
;!             ___awmod (ARG)
;!           ___awmod (ARG)
;!           ___awtoft (ARG)
;!             ___ftpack
;!           ___ftpack (ARG)
;!           ___wmul (ARG)
;!             ___awdiv (ARG)
;!               ___awmod (ARG)
;!             ___awmod (ARG)
;!         ___wmul
;!           ___awdiv (ARG)
;!             ___awmod (ARG)
;!           ___awmod (ARG)
;!     ___lldiv
;!     ___llmod
;!       ___lldiv (ARG)
;!     ___lltoft
;!       ___ftpack
;!     ___wmul
;!       ___awdiv (ARG)
;!         ___awmod (ARG)
;!       ___awmod (ARG)
;!     __div_to_l_
;!     __tdiv_to_l_
;!     _fround
;!       ___awdiv
;!         ___awmod (ARG)
;!       ___awmod
;!       ___ftmul
;!         ___awdiv (ARG)
;!           ___awmod (ARG)
;!         ___awmod (ARG)
;!         ___awtoft (ARG)
;!           ___ftpack
;!         ___ftpack (ARG)
;!         ___wmul (ARG)
;!           ___awdiv (ARG)
;!             ___awmod (ARG)
;!           ___awmod (ARG)
;!       ___wmul
;!         ___awdiv (ARG)
;!           ___awmod (ARG)
;!         ___awmod (ARG)
;!     _putch
;!     _scale
;!       ___awdiv
;!         ___awmod (ARG)
;!       ___awmod
;!       ___ftmul
;!         ___awdiv (ARG)
;!           ___awmod (ARG)
;!         ___awmod (ARG)
;!         ___awtoft (ARG)
;!           ___ftpack
;!         ___ftpack (ARG)
;!         ___wmul (ARG)
;!           ___awdiv (ARG)
;!             ___awmod (ARG)
;!           ___awmod (ARG)
;!       ___wmul
;!         ___awdiv (ARG)
;!           ___awmod (ARG)
;!         ___awmod (ARG)
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
;!COMRAM              7F     74      7E       1       99.2%
;!BITSFR               0      0       0      40        0.0%
;!SFR                  0      0       0      40        0.0%
;!STACK                0      0       0       2        0.0%
;!NULL                 0      0       0       0        0.0%
;!ABS                  0      0      7E      34        0.0%
;!DATA                 0      0      7E       3        0.0%
;!CODE                 0      0       0       0        0.0%

	global	_main

;; *************** function _main *****************
;; Defined at:
;;		line 67 in file "Lab5p6.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  voltage_mv      3  107[COMRAM] float 
;;  temperature_    3  102[COMRAM] float 
;;  temperature_    3   99[COMRAM] float 
;;  tempF           2  114[COMRAM] int 
;;  num_step        2  112[COMRAM] int 
;;  voltage_mv1     2  110[COMRAM] int 
;;  L               1  106[COMRAM] unsigned char 
;;  U               1  105[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr2l, fsr2h, status,2, status,0, tblptrl, tblptrh, tblptru, prodl, prodh, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:        17       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          2       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:        19       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:       19 bytes
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_DO_DISPLAY_D1
;;		_DO_DISPLAY_D2
;;		_DO_DISPLAY_D3
;;		_Display_Lower_Digit
;;		_Display_Upper_Digit
;;		_Get_Full_ADC
;;		_Init_ADC
;;		_Init_TRIS
;;		_Init_UART
;;		_Select_ADC_Channel
;;		_WAIT_1_SEC
;;		___awdiv
;;		___awmod
;;		___awtoft
;;		___ftadd
;;		___ftdiv
;;		___ftmul
;;		___ftneg
;;		___fttol
;;		_printf
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	text0,class=CODE,space=0,reloc=2
	file	"Lab5p6.c"
	line	67
global __ptext0
__ptext0:
psect	text0
	file	"Lab5p6.c"
	line	67
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:
;incstack = 0
	opt	stack 27
	line	69
	
l2824:
	call	_Init_UART	;wreg free
	line	70
	call	_Init_ADC	;wreg free
	line	71
	call	_Init_TRIS	;wreg free
	line	72
	
l2826:
	movlw	low(0)
	movwf	((c:3968)),c	;volatile
	line	73
	
l2828:
	movlw	low(0)
	movwf	((c:3969)),c	;volatile
	line	74
	
l2830:
	setf	((c:3970)),c	;volatile
	line	75
	
l2832:
	setf	((c:3971)),c	;volatile
	line	76
	
l2834:
	setf	((c:3972)),c	;volatile
	goto	l2836
	line	78
	
l90:
	line	80
	
l2836:
	movlw	(0)&0ffh
	
	call	_Select_ADC_Channel
	line	81
	
l2838:
	call	_Get_Full_ADC	;wreg free
	movff	0+?_Get_Full_ADC,(c:main@num_step)
	movff	1+?_Get_Full_ADC,(c:main@num_step+1)
	line	82
	
l2840:
	movff	(c:main@num_step),(c:___awtoft@c)
	movff	(c:main@num_step+1),(c:___awtoft@c+1)
	call	___awtoft	;wreg free
	movff	0+?___awtoft,(c:___ftmul@f1)
	movff	1+?___awtoft,(c:___ftmul@f1+1)
	movff	2+?___awtoft,(c:___ftmul@f1+2)
	movlw	low(float24(4.0000000000000000))
	movwf	((c:___ftmul@f2)),c
	movlw	high(float24(4.0000000000000000))
	movwf	((c:___ftmul@f2+1)),c
	movlw	low highword(float24(4.0000000000000000))
	movwf	((c:___ftmul@f2+2)),c

	call	___ftmul	;wreg free
	movff	0+?___ftmul,(c:main@voltage_mv)
	movff	1+?___ftmul,(c:main@voltage_mv+1)
	movff	2+?___ftmul,(c:main@voltage_mv+2)
	line	83
	
l2842:
	movlw	low(float24(1035.0000000000000))
	movwf	((c:___ftadd@f2)),c
	movlw	high(float24(1035.0000000000000))
	movwf	((c:___ftadd@f2+1)),c
	movlw	low highword(float24(1035.0000000000000))
	movwf	((c:___ftadd@f2+2)),c

	movff	(c:main@voltage_mv),(c:___ftneg@f1)
	movff	(c:main@voltage_mv+1),(c:___ftneg@f1+1)
	movff	(c:main@voltage_mv+2),(c:___ftneg@f1+2)
	call	___ftneg	;wreg free
	movff	0+?___ftneg,(c:___ftadd@f1)
	movff	1+?___ftneg,(c:___ftadd@f1+1)
	movff	2+?___ftneg,(c:___ftadd@f1+2)
	call	___ftadd	;wreg free
	movff	0+?___ftadd,(c:___ftdiv@f1)
	movff	1+?___ftadd,(c:___ftdiv@f1+1)
	movff	2+?___ftadd,(c:___ftdiv@f1+2)
	movlw	low(float24(5.5000000000000000))
	movwf	((c:___ftdiv@f2)),c
	movlw	high(float24(5.5000000000000000))
	movwf	((c:___ftdiv@f2+1)),c
	movlw	low highword(float24(5.5000000000000000))
	movwf	((c:___ftdiv@f2+2)),c

	call	___ftdiv	;wreg free
	movff	0+?___ftdiv,(c:main@temperature_C)
	movff	1+?___ftdiv,(c:main@temperature_C+1)
	movff	2+?___ftdiv,(c:main@temperature_C+2)
	line	84
	
l2844:
	movlw	low(float24(1.8000000000000000))
	movwf	((c:___ftmul@f2)),c
	movlw	high(float24(1.8000000000000000))
	movwf	((c:___ftmul@f2+1)),c
	movlw	low highword(float24(1.8000000000000000))
	movwf	((c:___ftmul@f2+2)),c

	movff	(c:main@temperature_C),(c:___ftmul@f1)
	movff	(c:main@temperature_C+1),(c:___ftmul@f1+1)
	movff	(c:main@temperature_C+2),(c:___ftmul@f1+2)
	call	___ftmul	;wreg free
	movff	0+?___ftmul,(c:___ftadd@f1)
	movff	1+?___ftmul,(c:___ftadd@f1+1)
	movff	2+?___ftmul,(c:___ftadd@f1+2)
	movlw	low(float24(32.000000000000000))
	movwf	((c:___ftadd@f2)),c
	movlw	high(float24(32.000000000000000))
	movwf	((c:___ftadd@f2+1)),c
	movlw	low highword(float24(32.000000000000000))
	movwf	((c:___ftadd@f2+2)),c

	call	___ftadd	;wreg free
	movff	0+?___ftadd,(c:main@temperature_F)
	movff	1+?___ftadd,(c:main@temperature_F+1)
	movff	2+?___ftadd,(c:main@temperature_F+2)
	line	85
	
l2846:
	movff	(c:main@temperature_F),(c:___fttol@f1)
	movff	(c:main@temperature_F+1),(c:___fttol@f1+1)
	movff	(c:main@temperature_F+2),(c:___fttol@f1+2)
	call	___fttol	;wreg free
	movff	0+?___fttol,(c:main@tempF)
	movff	1+?___fttol,(c:main@tempF+1)
	line	86
	
l2848:
	movff	(c:main@tempF),(c:___awdiv@dividend)
	movff	(c:main@tempF+1),(c:___awdiv@dividend+1)
	movlw	high(0Ah)
	movwf	((c:___awdiv@divisor+1)),c
	movlw	low(0Ah)
	movwf	((c:___awdiv@divisor)),c
	call	___awdiv	;wreg free
	movf	(0+?___awdiv),c,w
	movwf	((c:main@U)),c
	line	87
	
l2850:
	movff	(c:main@tempF),(c:___awmod@dividend)
	movff	(c:main@tempF+1),(c:___awmod@dividend+1)
	movlw	high(0Ah)
	movwf	((c:___awmod@divisor+1)),c
	movlw	low(0Ah)
	movwf	((c:___awmod@divisor)),c
	call	___awmod	;wreg free
	movf	(0+?___awmod),c,w
	movwf	((c:main@L)),c
	line	88
	
l2852:
	movf	((c:main@U)),c,w
	
	call	_Display_Upper_Digit
	line	89
	
l2854:
	movf	((c:main@L)),c,w
	
	call	_Display_Lower_Digit
	line	90
	
l2856:
		movlw	low(STR_1)
	movwf	((c:printf@f)),c
	movlw	high(STR_1)
	movwf	((c:printf@f+1)),c

	movff	(c:main@voltage_mv),0+((c:?_printf)+02h)
	movff	(c:main@voltage_mv+1),1+((c:?_printf)+02h)
	movff	(c:main@voltage_mv+2),2+((c:?_printf)+02h)
	call	_printf	;wreg free
	line	91
	
l2858:
		movlw	low(STR_2)
	movwf	((c:printf@f)),c
	movlw	high(STR_2)
	movwf	((c:printf@f+1)),c

	movff	(c:main@tempF),0+((c:?_printf)+02h)
	movff	(c:main@tempF+1),1+((c:?_printf)+02h)
	call	_printf	;wreg free
	line	92
	
l2860:
	movff	(c:main@tempF),(c:DO_DISPLAY_D1@temp)
	movff	(c:main@tempF+1),(c:DO_DISPLAY_D1@temp+1)
	call	_DO_DISPLAY_D1	;wreg free
	line	93
	
l2862:
	movff	(c:main@tempF),(c:DO_DISPLAY_D2@temp)
	movff	(c:main@tempF+1),(c:DO_DISPLAY_D2@temp+1)
	call	_DO_DISPLAY_D2	;wreg free
	line	95
	
l2864:
	movlw	(01h)&0ffh
	
	call	_Select_ADC_Channel
	line	96
	
l2866:
	call	_Get_Full_ADC	;wreg free
	movff	0+?_Get_Full_ADC,(c:main@num_step)
	movff	1+?_Get_Full_ADC,(c:main@num_step+1)
	line	97
	
l2868:
	movff	(c:main@num_step),??_main+0+0
	movff	(c:main@num_step+1),??_main+0+0+1
	bcf	status,0
	rlcf	(??_main+0+0),c
	rlcf	(??_main+0+1),c
	bcf	status,0
	rlcf	(??_main+0+0),c
	rlcf	(??_main+0+1),c
	movff	??_main+0+0,(c:main@voltage_mv1)
	movff	??_main+0+1,(c:main@voltage_mv1+1)
	line	98
	
l2870:
		movlw	low(STR_3)
	movwf	((c:printf@f)),c
	movlw	high(STR_3)
	movwf	((c:printf@f+1)),c

	movff	(c:main@voltage_mv1),0+((c:?_printf)+02h)
	movff	(c:main@voltage_mv1+1),1+((c:?_printf)+02h)
	call	_printf	;wreg free
	line	99
	
l2872:
	movff	(c:main@voltage_mv1),(c:DO_DISPLAY_D3@voltage)
	movff	(c:main@voltage_mv1+1),(c:DO_DISPLAY_D3@voltage+1)
	call	_DO_DISPLAY_D3	;wreg free
	line	100
	
l2874:
	call	_WAIT_1_SEC	;wreg free
	goto	l2836
	line	101
	
l91:
	line	78
	goto	l2836
	
l92:
	line	102
	
l93:
	global	start
	goto	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
	signat	_main,88
	global	_printf

;; *************** function _printf *****************
;; Defined at:
;;		line 464 in file "D:\Program Files (x86)\Microchip\xc8\v1.34\sources\common\doprnt.c"
;; Parameters:    Size  Location     Type
;;  f               2   63[COMRAM] PTR const unsigned char 
;;		 -> STR_3(23), STR_2(23), STR_1(21), 
;; Auto vars:     Size  Location     Type
;;  tmpval          4   89[COMRAM] struct .
;;  val             4   83[COMRAM] unsigned long 
;;  fval            3   93[COMRAM] unsigned long 
;;  cp              3    0        PTR const unsigned char 
;;  exp             2   87[COMRAM] int 
;;  prec            2   81[COMRAM] int 
;;  flag            2   79[COMRAM] unsigned short 
;;  ap              2   77[COMRAM] PTR void [1]
;;		 -> ?_printf(2), 
;;  len             2    0        unsigned int 
;;  width           2    0        int 
;;  c               1   96[COMRAM] char 
;;  d               1    0        unsigned char 
;; Return value:  Size  Location     Type
;;                  2   63[COMRAM] int 
;; Registers used:
;;		wreg, fsr2l, fsr2h, status,2, status,0, tblptrl, tblptrh, tblptru, prodl, prodh, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         5       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:        23       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          6       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:        34       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:       34 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		___awdiv
;;		___ftadd
;;		___ftge
;;		___ftmul
;;		___ftneg
;;		___ftsub
;;		___fttol
;;		___lldiv
;;		___llmod
;;		___lltoft
;;		___wmul
;;		__div_to_l_
;;		__tdiv_to_l_
;;		_fround
;;		_putch
;;		_scale
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1,class=CODE,space=0,reloc=2
	file	"D:\Program Files (x86)\Microchip\xc8\v1.34\sources\common\doprnt.c"
	line	464
global __ptext1
__ptext1:
psect	text1
	file	"D:\Program Files (x86)\Microchip\xc8\v1.34\sources\common\doprnt.c"
	line	464
	global	__size_of_printf
	__size_of_printf	equ	__end_of_printf-_printf
	
_printf:
;incstack = 0
	opt	stack 27
	line	533
	
l2528:
		movlw	low(?_printf+02h)
	movwf	((c:printf@ap)),c
	movlw	high(?_printf+02h)
	movwf	((c:printf@ap+1)),c

	line	536
	goto	l2710
	
l193:
	line	538
	
l2530:
		movlw	37
	xorwf	((c:printf@c)),c,w
	btfsc	status,2
	goto	u2611
	goto	u2610

u2611:
	goto	l2534
u2610:
	line	541
	
l2532:
	movf	((c:printf@c)),c,w
	
	call	_putch
	line	542
	goto	l2710
	line	543
	
l194:
	line	548
	
l2534:
	movlw	high(0)
	movwf	((c:printf@flag+1)),c
	movlw	low(0)
	movwf	((c:printf@flag)),c
	line	635
	goto	l2540
	line	637
	
l196:
	line	638
	goto	l249
	line	662
	
l198:
	line	663
	
l2536:
	bsf	(0+(10/8)+(c:printf@flag)),c,(10)&7
	line	664
	goto	l2542
	line	697
	
l200:
	goto	l2542
	line	698
	
l201:
	line	699
	goto	l2542
	line	802
	
l202:
	line	813
	goto	l2710
	line	822
	
l2538:
	goto	l2542
	line	635
	
l195:
	
l2540:
	movff	(c:printf@f),tblptrl
	movff	(c:printf@f+1),tblptrh
	infsnz	((c:printf@f)),c
	incf	((c:printf@f+1)),c
	if	0	;tblptru may be non-zero
	clrf	tblptru
	endif
	if	0	;tblptru may be non-zero
	global __mediumconst
movlw	low highword(__mediumconst)
	movwf	tblptru
	endif
	tblrd	*
	
	movff	tablat,(c:printf@c)
	movf	((c:printf@c)),c,w
	; Switch size 1, requested type "space"
; Number of cases is 4, Range of values is 0 to 105
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           13     7 (average)
;	Chosen strategy is simple_byte

	xorlw	0^0	; case 0
	skipnz
	goto	l249
	xorlw	100^0	; case 100
	skipnz
	goto	l2542
	xorlw	102^100	; case 102
	skipnz
	goto	l2536
	xorlw	105^102	; case 105
	skipnz
	goto	l2542
	goto	l2710

	line	822
	
l199:
	line	825
	
l2542:
	movlw	high(0700h)
	andwf	((c:printf@flag+1)),c,w

	btfsc	status,2
	goto	u2621
	goto	u2620
u2621:
	goto	l2674
u2620:
	line	829
	
l2544:
	movlw	high(06h)
	movwf	((c:printf@prec+1)),c
	movlw	low(06h)
	movwf	((c:printf@prec)),c
	line	830
	
l2546:
	movff	(c:printf@ap),fsr2l
	movff	(c:printf@ap+1),fsr2h
	movff	postinc2,(c:printf@fval)
	movff	postinc2,(c:printf@fval+1)
	movff	postdec2,(c:printf@fval+2)
	
l2548:
	movlw	03h
	addwf	((c:printf@ap)),c
	movlw	0
	addwfc	((c:printf@ap+1)),c
	line	831
	
l2550:
	btfsc	((c:printf@fval+2)),c,7
	goto	u2630
	goto	u2631

u2631:
	goto	l2556
u2630:
	line	832
	
l2552:
	movff	(c:printf@fval),(c:___ftneg@f1)
	movff	(c:printf@fval+1),(c:___ftneg@f1+1)
	movff	(c:printf@fval+2),(c:___ftneg@f1+2)
	call	___ftneg	;wreg free
	movff	0+?___ftneg,(c:printf@fval)
	movff	1+?___ftneg,(c:printf@fval+1)
	movff	2+?___ftneg,(c:printf@fval+2)
	line	833
	
l2554:
	movlw	03h
	iorwf	((c:printf@flag)),c
	goto	l2556
	line	834
	
l204:
	line	835
	
l2556:
	movlw	high(0)
	movwf	((c:printf@exp+1)),c
	movlw	low(0)
	movwf	((c:printf@exp)),c
	line	836
	
l2558:
	movf	((c:printf@fval)),c,w
iorwf	((c:printf@fval+1)),c,w
iorwf	((c:printf@fval+2)),c,w
	btfsc	status,2
	goto	u2641
	goto	u2640

u2641:
	goto	l2584
u2640:
	line	837
	
l2560:
	movlw	low(-126)
	movwf	(??_printf+0+0)&0ffh,c
	movlw	high(-126)
	movwf	1+(??_printf+0+0)&0ffh,c
	movff	0+((c:printf@fval)),??_printf+2+0
	movff	1+((c:printf@fval)),??_printf+2+0+1
	movff	2+((c:printf@fval)),??_printf+2+0+2
	movff	3+((c:printf@fval)),??_printf+2+0+3
	movlw	0Fh+1
	goto	u2650
u2655:
	bcf	status,0
	rrcf	(??_printf+2+3),c
	rrcf	(??_printf+2+2),c
	rrcf	(??_printf+2+1),c
	rrcf	(??_printf+2+0),c
u2650:
	decfsz	wreg
	goto	u2655
	movf	(??_printf+2+0),c,w
	addwf	(??_printf+0+0),c,w
	movwf	((c:printf@exp)),c
	movlw	0
	addwfc	(??_printf+0+1),c,w
	movwf	1+((c:printf@exp)),c
	line	838
	
l2562:
	decf	((c:printf@exp)),c
	btfss	status,0
	decf	((c:printf@exp+1)),c
	line	839
	
l2564:
	movff	(c:printf@exp),(c:___wmul@multiplier)
	movff	(c:printf@exp+1),(c:___wmul@multiplier+1)
	movlw	high(03h)
	movwf	((c:___wmul@multiplicand+1)),c
	movlw	low(03h)
	movwf	((c:___wmul@multiplicand)),c
	call	___wmul	;wreg free
	movff	0+?___wmul,(c:printf@exp)
	movff	1+?___wmul,(c:printf@exp+1)
	line	840
	
l2566:
	movff	(c:printf@exp),(c:___awdiv@dividend)
	movff	(c:printf@exp+1),(c:___awdiv@dividend+1)
	movlw	high(0Ah)
	movwf	((c:___awdiv@divisor+1)),c
	movlw	low(0Ah)
	movwf	((c:___awdiv@divisor)),c
	call	___awdiv	;wreg free
	movff	0+?___awdiv,(c:printf@exp)
	movff	1+?___awdiv,(c:printf@exp+1)
	line	841
	
l2568:
	btfsc	((c:printf@exp+1)),c,7
	goto	u2660
	goto	u2661

u2661:
	goto	l2572
u2660:
	line	842
	
l2570:
	decf	((c:printf@exp)),c
	btfss	status,0
	decf	((c:printf@exp+1)),c
	goto	l2572
	
l206:
	line	846
	
l2572:
	movf	((c:printf@exp)),c,w
	sublw	0
	
	call	_scale
	movff	0+?_scale,(c:printf@tmpval)
	movff	1+?_scale,(c:printf@tmpval+1)
	movff	2+?_scale,(c:printf@tmpval+2)
	line	847
	
l2574:
	movff	(c:printf@tmpval),(c:___ftmul@f1)
	movff	(c:printf@tmpval+1),(c:___ftmul@f1+1)
	movff	(c:printf@tmpval+2),(c:___ftmul@f1+2)
	movff	(c:printf@fval),(c:___ftmul@f2)
	movff	(c:printf@fval+1),(c:___ftmul@f2+1)
	movff	(c:printf@fval+2),(c:___ftmul@f2+2)
	call	___ftmul	;wreg free
	movff	0+?___ftmul,(c:printf@tmpval)
	movff	1+?___ftmul,(c:printf@tmpval+1)
	movff	2+?___ftmul,(c:printf@tmpval+2)
	line	848
	
l2576:
	movff	(c:printf@tmpval),(c:___ftge@ff1)
	movff	(c:printf@tmpval+1),(c:___ftge@ff1+1)
	movff	(c:printf@tmpval+2),(c:___ftge@ff1+2)
	movlw	low(float24(1.0000000000000000))
	movwf	((c:___ftge@ff2)),c
	movlw	high(float24(1.0000000000000000))
	movwf	((c:___ftge@ff2+1)),c
	movlw	low highword(float24(1.0000000000000000))
	movwf	((c:___ftge@ff2+2)),c

	call	___ftge	;wreg free
	btfsc	status,0
	goto	u2671
	goto	u2670
u2671:
	goto	l2580
u2670:
	line	849
	
l2578:
	decf	((c:printf@exp)),c
	btfss	status,0
	decf	((c:printf@exp+1)),c
	goto	l2584
	line	850
	
l207:
	
l2580:
	movff	(c:printf@tmpval),(c:___ftge@ff1)
	movff	(c:printf@tmpval+1),(c:___ftge@ff1+1)
	movff	(c:printf@tmpval+2),(c:___ftge@ff1+2)
	movlw	low(float24(10.000000000000000))
	movwf	((c:___ftge@ff2)),c
	movlw	high(float24(10.000000000000000))
	movwf	((c:___ftge@ff2+1)),c
	movlw	low highword(float24(10.000000000000000))
	movwf	((c:___ftge@ff2+2)),c

	call	___ftge	;wreg free
	btfss	status,0
	goto	u2681
	goto	u2680
u2681:
	goto	l2584
u2680:
	line	851
	
l2582:
	infsnz	((c:printf@exp)),c
	incf	((c:printf@exp+1)),c
	goto	l2584
	
l209:
	goto	l2584
	line	852
	
l208:
	goto	l2584
	
l205:
	line	1112
	
l2584:
	btfsc	((c:printf@prec+1)),c,7
	goto	u2690
	movf	((c:printf@prec+1)),c,w
	bnz	u2691
	movlw	13
	subwf	 ((c:printf@prec)),c,w
	btfsc	status,0
	goto	u2691
	goto	u2690

u2691:
	goto	l2588
u2690:
	line	1113
	
l2586:
	movff	(c:printf@fval),(c:___ftadd@f1)
	movff	(c:printf@fval+1),(c:___ftadd@f1+1)
	movff	(c:printf@fval+2),(c:___ftadd@f1+2)
	movf	((c:printf@prec)),c,w
	
	call	_fround
	movff	0+?_fround,(c:___ftadd@f2)
	movff	1+?_fround,(c:___ftadd@f2+1)
	movff	2+?_fround,(c:___ftadd@f2+2)
	call	___ftadd	;wreg free
	movff	0+?___ftadd,(c:printf@fval)
	movff	1+?___ftadd,(c:printf@fval+1)
	movff	2+?___ftadd,(c:printf@fval+2)
	goto	l2588
	
l210:
	line	1116
	
l2588:
	btfsc	((c:printf@exp+1)),c,7
	goto	u2700
	movf	((c:printf@exp+1)),c,w
	bnz	u2701
	movlw	10
	subwf	 ((c:printf@exp)),c,w
	btfsc	status,0
	goto	u2701
	goto	u2700

u2701:
	goto	l2596
u2700:
	
l2590:
	movf	((c:printf@fval)),c,w
iorwf	((c:printf@fval+1)),c,w
iorwf	((c:printf@fval+2)),c,w
	btfsc	status,2
	goto	u2711
	goto	u2710

u2711:
	goto	l2610
u2710:
	
l2592:
	movff	(c:printf@fval),(c:___fttol@f1)
	movff	(c:printf@fval+1),(c:___fttol@f1+1)
	movff	(c:printf@fval+2),(c:___fttol@f1+2)
	call	___fttol	;wreg free
	movf	(0+?___fttol),c,w
iorwf	(1+?___fttol),c,w
iorwf	(2+?___fttol),c,w
iorwf	(3+?___fttol),c,w
	btfss	status,2
	goto	u2721
	goto	u2720

u2721:
	goto	l2610
u2720:
	
l2594:
	btfsc	((c:printf@exp+1)),c,7
	goto	u2731
	movf	((c:printf@exp+1)),c,w
	bnz	u2730
	movlw	2
	subwf	 ((c:printf@exp)),c,w
	btfss	status,0
	goto	u2731
	goto	u2730

u2731:
	goto	l2610
u2730:
	goto	l2596
	
l213:
	line	1120
	
l2596:
	movff	(c:printf@tmpval),(c:___ftge@ff1)
	movff	(c:printf@tmpval+1),(c:___ftge@ff1+1)
	movff	(c:printf@tmpval+2),(c:___ftge@ff1+2)
	movlw	low(float24(4.2949672960000003))
	movwf	((c:___ftge@ff2)),c
	movlw	high(float24(4.2949672960000003))
	movwf	((c:___ftge@ff2+1)),c
	movlw	low highword(float24(4.2949672960000003))
	movwf	((c:___ftge@ff2+2)),c

	call	___ftge	;wreg free
	btfsc	status,0
	goto	u2741
	goto	u2740
u2741:
	goto	l2600
u2740:
	line	1121
	
l2598:
	movlw	low(-9)
	addwf	((c:printf@exp)),c
	movlw	high(-9)
	addwfc	((c:printf@exp+1)),c
	line	1122
	goto	l2602
	
l214:
	line	1123
	
l2600:
	movlw	low(-8)
	addwf	((c:printf@exp)),c
	movlw	high(-8)
	addwfc	((c:printf@exp+1)),c
	goto	l2602
	line	1124
	
l215:
	line	1125
	
l2602:
	movf	((c:printf@exp)),c,w
	
	call	_scale
	movff	0+?_scale,(c:printf@tmpval)
	movff	1+?_scale,(c:printf@tmpval+1)
	movff	2+?_scale,(c:printf@tmpval+2)
	line	1126
	goto	l2606
	
l2604:
	movff	(c:printf@fval),(c:__div_to_l_@f1)
	movff	(c:printf@fval+1),(c:__div_to_l_@f1+1)
	movff	(c:printf@fval+2),(c:__div_to_l_@f1+2)
	movff	(c:printf@tmpval),(c:__div_to_l_@f2)
	movff	(c:printf@tmpval+1),(c:__div_to_l_@f2+1)
	movff	(c:printf@tmpval+2),(c:__div_to_l_@f2+2)
	call	__div_to_l_	;wreg free
	movff	0+?__div_to_l_,(c:printf@val)
	movff	1+?__div_to_l_,(c:printf@val+1)
	movff	2+?__div_to_l_,(c:printf@val+2)
	movff	3+?__div_to_l_,(c:printf@val+3)
	
	goto	l2608
	
l217:
	
l2606:
	movff	(c:printf@fval),(c:__tdiv_to_l_@f1)
	movff	(c:printf@fval+1),(c:__tdiv_to_l_@f1+1)
	movff	(c:printf@fval+2),(c:__tdiv_to_l_@f1+2)
	movff	(c:printf@tmpval),(c:__tdiv_to_l_@f2)
	movff	(c:printf@tmpval+1),(c:__tdiv_to_l_@f2+1)
	movff	(c:printf@tmpval+2),(c:__tdiv_to_l_@f2+2)
	call	__tdiv_to_l_	;wreg free
	movff	0+?__tdiv_to_l_,(c:printf@val)
	movff	1+?__tdiv_to_l_,(c:printf@val+1)
	movff	2+?__tdiv_to_l_,(c:printf@val+2)
	movff	3+?__tdiv_to_l_,(c:printf@val+3)
	
	goto	l2608
	
l219:
	line	1129
	
l2608:
	movlw	low(float24(0.0000000000000000))
	movwf	((c:printf@fval)),c
	movlw	high(float24(0.0000000000000000))
	movwf	((c:printf@fval+1)),c
	movlw	low highword(float24(0.0000000000000000))
	movwf	((c:printf@fval+2)),c

	line	1130
	goto	l2614
	
l211:
	line	1131
	
l2610:
	movff	(c:printf@fval),(c:___fttol@f1)
	movff	(c:printf@fval+1),(c:___fttol@f1+1)
	movff	(c:printf@fval+2),(c:___fttol@f1+2)
	call	___fttol	;wreg free
	movff	0+?___fttol,(c:printf@val)
	movff	1+?___fttol,(c:printf@val+1)
	movff	2+?___fttol,(c:printf@val+2)
	movff	3+?___fttol,(c:printf@val+3)
	
	line	1132
	movff	(c:printf@fval),(c:___ftsub@f1)
	movff	(c:printf@fval+1),(c:___ftsub@f1+1)
	movff	(c:printf@fval+2),(c:___ftsub@f1+2)
	movff	(c:printf@val),(c:___lltoft@c)
	movff	(c:printf@val+1),(c:___lltoft@c+1)
	movff	(c:printf@val+2),(c:___lltoft@c+2)
	movff	(c:printf@val+3),(c:___lltoft@c+3)
	call	___lltoft	;wreg free
	movff	0+?___lltoft,(c:___ftsub@f2)
	movff	1+?___lltoft,(c:___ftsub@f2+1)
	movff	2+?___lltoft,(c:___ftsub@f2+2)
	call	___ftsub	;wreg free
	movff	0+?___ftsub,(c:printf@fval)
	movff	1+?___ftsub,(c:printf@fval+1)
	movff	2+?___ftsub,(c:printf@fval+2)
	line	1133
	
l2612:
	movlw	high(0)
	movwf	((c:printf@exp+1)),c
	movlw	low(0)
	movwf	((c:printf@exp)),c
	goto	l2614
	line	1134
	
l220:
	line	1136
	
l2614:
	movlw	low(01h)
	movwf	((c:printf@c)),c
	
l2616:
		movlw	10
	xorwf	((c:printf@c)),c,w
	btfss	status,2
	goto	u2751
	goto	u2750

u2751:
	goto	l2620
u2750:
	goto	l2628
	
l2618:
	goto	l2628
	line	1137
	
l221:
	
l2620:
	movf	((c:printf@c)),c,w
	mullw	04h
	movlw	low((_dpowers))
	addwf	(prodl),c,w
	movwf	tblptrl
	movlw	high((_dpowers))
	addwfc	(prodh),c,w
	movwf	tblptrh
	if	0	;There are less than 3 active tblptr bytes
	clrf	tblptru
	global __mediumconst
movlw	low highword(__mediumconst)
	addwfc	tblptru,f
	endif
		tblrd	*+
	movf	tablat,w
	subwf	((c:printf@val)),c,w
	tblrd	*+
	movf	tablat,w
	subwfb	((c:printf@val+1)),c,w
	tblrd	*+
	movf	tablat,w
	subwfb	((c:printf@val+2)),c,w
	tblrd	*+
	movf	tablat,w
	subwfb	((c:printf@val+3)),c,w
	btfsc	status,0
	goto	u2761
	goto	u2760

u2761:
	goto	l2624
u2760:
	goto	l2628
	line	1138
	
l2622:
	goto	l2628
	
l223:
	line	1136
	
l2624:
	incf	((c:printf@c)),c
	
l2626:
		movlw	10
	xorwf	((c:printf@c)),c,w
	btfss	status,2
	goto	u2771
	goto	u2770

u2771:
	goto	l2620
u2770:
	goto	l2628
	
l222:
	line	1188
	
l2628:
	movlw	03h
	andwf	((c:printf@flag)),c,w
	movwf	(??_printf+0+0)&0ffh,c
	movlw	0
	andwf	((c:printf@flag+1)),c,w
	movwf	(??_printf+0+0+1)&0ffh,c
	movf	(??_printf+0+0),c,w
iorwf	(??_printf+0+1),c,w
	btfsc	status,2
	goto	u2781
	goto	u2780

u2781:
	goto	l2638
u2780:
	line	1190
	
l2630:
	movlw	(02Dh)&0ffh
	
	call	_putch
	goto	l2638
	
l224:
	line	1196
	goto	l2638
	
l226:
	line	1201
	
l2632:
	movff	(c:printf@val),(c:___lldiv@dividend)
	movff	(c:printf@val+1),(c:___lldiv@dividend+1)
	movff	(c:printf@val+2),(c:___lldiv@dividend+2)
	movff	(c:printf@val+3),(c:___lldiv@dividend+3)
	movf	((c:printf@c)),c,w
	mullw	04h
	movlw	low((_dpowers))
	addwf	(prodl),c,w
	movwf	tblptrl
	movlw	high((_dpowers))
	addwfc	(prodh),c,w
	movwf	tblptrh
	if	0	;There are less than 3 active tblptr bytes
	clrf	tblptru
	global __mediumconst
movlw	low highword(__mediumconst)
	addwfc	tblptru,f
	endif
	tblrd*+
	
	movff	tablat,(c:___lldiv@divisor)
	tblrd*+
	
	movff	tablat,(c:___lldiv@divisor+1)
	tblrd*+
	
	movff	tablat,(c:___lldiv@divisor+2)
	tblrd*-
	
	movff	tablat,(c:___lldiv@divisor+3)
	call	___lldiv	;wreg free
	movff	0+?___lldiv,(c:printf@tmpval)
	movff	1+?___lldiv,(c:printf@tmpval+1)
	movff	2+?___lldiv,(c:printf@tmpval+2)
	movff	3+?___lldiv,(c:printf@tmpval+3)
	
	line	1202
	
l2634:
	movff	(c:printf@tmpval),(c:___llmod@dividend)
	movff	(c:printf@tmpval+1),(c:___llmod@dividend+1)
	movff	(c:printf@tmpval+2),(c:___llmod@dividend+2)
	movff	(c:printf@tmpval+3),(c:___llmod@dividend+3)
	movlw	low(0Ah)
	movwf	((c:___llmod@divisor)),c
	movlw	high(0Ah)
	movwf	((c:___llmod@divisor+1)),c
	movlw	low highword(0Ah)
	movwf	((c:___llmod@divisor+2)),c
	movlw	high highword(0Ah)
	movwf	((c:___llmod@divisor+3)),c
	call	___llmod	;wreg free
	movff	0+?___llmod,(c:printf@tmpval)
	movff	1+?___llmod,(c:printf@tmpval+1)
	movff	2+?___llmod,(c:printf@tmpval+2)
	movff	3+?___llmod,(c:printf@tmpval+3)
	
	line	1203
	
l2636:
	movf	((c:printf@tmpval)),c,w
	addlw	low(030h)
	
	call	_putch
	goto	l2638
	line	1206
	
l225:
	line	1196
	
l2638:
	decf	((c:printf@c)),c
		incf	((c:printf@c)),c,w
	btfss	status,2
	goto	u2791
	goto	u2790

u2791:
	goto	l2632
u2790:
	goto	l2644
	
l227:
	line	1207
	goto	l2644
	
l229:
	line	1208
	
l2640:
	movlw	(030h)&0ffh
	
	call	_putch
	line	1209
	
l2642:
	decf	((c:printf@exp)),c
	btfss	status,0
	decf	((c:printf@exp+1)),c
	goto	l2644
	line	1210
	
l228:
	line	1207
	
l2644:
	btfsc	((c:printf@exp+1)),c,7
	goto	u2800
	movf	((c:printf@exp+1)),c,w
	bnz	u2801
	decf	((c:printf@exp)),c,w
	btfsc	status,0
	goto	u2801
	goto	u2800

u2801:
	goto	l2640
u2800:
	goto	l2646
	
l230:
	line	1211
	
l2646:
	btfsc	((c:printf@prec+1)),c,7
	goto	u2811
	movf	((c:printf@prec+1)),c,w
	bnz	u2810
	movlw	9
	subwf	 ((c:printf@prec)),c,w
	btfss	status,0
	goto	u2811
	goto	u2810

u2811:
	goto	l231
u2810:
	line	1212
	
l2648:
	movlw	low(08h)
	movwf	((c:printf@c)),c
	goto	l2650
	line	1213
	
l231:
	line	1214
	movff	(c:printf@prec),(c:printf@c)
	goto	l2650
	
l232:
	line	1215
	
l2650:
	movf	((c:printf@c)),c,w
	subwf	((c:printf@prec)),c
	movlw	0
	btfsc	((c:printf@c)),c,7
	movlw	0ffh
	subwfb	((c:printf@prec+1)),c

	line	1219
	
l2652:
	movf	((c:printf@c)),c,w
	btfsc	status,2
	goto	u2821
	goto	u2820
u2821:
	goto	l2656
u2820:
	line	1221
	
l2654:
	movlw	(02Eh)&0ffh
	
	call	_putch
	goto	l2656
	
l233:
	line	1227
	
l2656:
	movf	((c:printf@c)),c,w
	
	call	_scale
	movff	0+?_scale,(c:_printf$1266)
	movff	1+?_scale,(c:_printf$1266+1)
	movff	2+?_scale,(c:_printf$1266+2)
	
l2658:
	movff	(c:printf@fval),(c:___ftmul@f2)
	movff	(c:printf@fval+1),(c:___ftmul@f2+1)
	movff	(c:printf@fval+2),(c:___ftmul@f2+2)
	movff	(c:_printf$1266),(c:___ftmul@f1)
	movff	(c:_printf$1266+1),(c:___ftmul@f1+1)
	movff	(c:_printf$1266+2),(c:___ftmul@f1+2)
	call	___ftmul	;wreg free
	movff	0+?___ftmul,(c:___fttol@f1)
	movff	1+?___ftmul,(c:___fttol@f1+1)
	movff	2+?___ftmul,(c:___fttol@f1+2)
	call	___fttol	;wreg free
	movff	0+?___fttol,(c:printf@val)
	movff	1+?___fttol,(c:printf@val+1)
	movff	2+?___fttol,(c:printf@val+2)
	movff	3+?___fttol,(c:printf@val+3)
	
	line	1228
	goto	l2666
	
l235:
	line	1229
	
l2660:
	movff	(c:printf@val),(c:___lldiv@dividend)
	movff	(c:printf@val+1),(c:___lldiv@dividend+1)
	movff	(c:printf@val+2),(c:___lldiv@dividend+2)
	movff	(c:printf@val+3),(c:___lldiv@dividend+3)
	movf	((c:printf@c)),c,w
	mullw	04h
	movlw	low((_dpowers))
	addwf	(prodl),c,w
	movwf	tblptrl
	movlw	high((_dpowers))
	addwfc	(prodh),c,w
	movwf	tblptrh
	if	0	;There are less than 3 active tblptr bytes
	clrf	tblptru
	global __mediumconst
movlw	low highword(__mediumconst)
	addwfc	tblptru,f
	endif
	tblrd*+
	
	movff	tablat,(c:___lldiv@divisor)
	tblrd*+
	
	movff	tablat,(c:___lldiv@divisor+1)
	tblrd*+
	
	movff	tablat,(c:___lldiv@divisor+2)
	tblrd*-
	
	movff	tablat,(c:___lldiv@divisor+3)
	call	___lldiv	;wreg free
	movff	0+?___lldiv,(c:printf@tmpval)
	movff	1+?___lldiv,(c:printf@tmpval+1)
	movff	2+?___lldiv,(c:printf@tmpval+2)
	movff	3+?___lldiv,(c:printf@tmpval+3)
	
	line	1230
	
l2662:
	movff	(c:printf@tmpval),(c:___llmod@dividend)
	movff	(c:printf@tmpval+1),(c:___llmod@dividend+1)
	movff	(c:printf@tmpval+2),(c:___llmod@dividend+2)
	movff	(c:printf@tmpval+3),(c:___llmod@dividend+3)
	movlw	low(0Ah)
	movwf	((c:___llmod@divisor)),c
	movlw	high(0Ah)
	movwf	((c:___llmod@divisor+1)),c
	movlw	low highword(0Ah)
	movwf	((c:___llmod@divisor+2)),c
	movlw	high highword(0Ah)
	movwf	((c:___llmod@divisor+3)),c
	call	___llmod	;wreg free
	movff	0+?___llmod,(c:printf@tmpval)
	movff	1+?___llmod,(c:printf@tmpval+1)
	movff	2+?___llmod,(c:printf@tmpval+2)
	movff	3+?___llmod,(c:printf@tmpval+3)
	
	line	1231
	
l2664:
	movf	((c:printf@tmpval)),c,w
	addlw	low(030h)
	
	call	_putch
	line	1232
	movff	(c:printf@val),(c:___llmod@dividend)
	movff	(c:printf@val+1),(c:___llmod@dividend+1)
	movff	(c:printf@val+2),(c:___llmod@dividend+2)
	movff	(c:printf@val+3),(c:___llmod@dividend+3)
	movf	((c:printf@c)),c,w
	mullw	04h
	movlw	low((_dpowers))
	addwf	(prodl),c,w
	movwf	tblptrl
	movlw	high((_dpowers))
	addwfc	(prodh),c,w
	movwf	tblptrh
	if	0	;There are less than 3 active tblptr bytes
	clrf	tblptru
	global __mediumconst
movlw	low highword(__mediumconst)
	addwfc	tblptru,f
	endif
	tblrd*+
	
	movff	tablat,(c:___llmod@divisor)
	tblrd*+
	
	movff	tablat,(c:___llmod@divisor+1)
	tblrd*+
	
	movff	tablat,(c:___llmod@divisor+2)
	tblrd*-
	
	movff	tablat,(c:___llmod@divisor+3)
	call	___llmod	;wreg free
	movff	0+?___llmod,(c:printf@val)
	movff	1+?___llmod,(c:printf@val+1)
	movff	2+?___llmod,(c:printf@val+2)
	movff	3+?___llmod,(c:printf@val+3)
	
	goto	l2666
	line	1233
	
l234:
	line	1228
	
l2666:
	decf	((c:printf@c)),c
		incf	((c:printf@c)),c,w
	btfss	status,2
	goto	u2831
	goto	u2830

u2831:
	goto	l2660
u2830:
	goto	l2672
	
l236:
	line	1235
	goto	l2672
	
l238:
	line	1236
	
l2668:
	movlw	(030h)&0ffh
	
	call	_putch
	line	1237
	
l2670:
	decf	((c:printf@prec)),c
	btfss	status,0
	decf	((c:printf@prec+1)),c
	goto	l2672
	line	1238
	
l237:
	line	1235
	
l2672:
	movf	((c:printf@prec)),c,w
iorwf	((c:printf@prec+1)),c,w
	btfss	status,2
	goto	u2841
	goto	u2840

u2841:
	goto	l2668
u2840:
	goto	l2710
	
l239:
	line	1245
	goto	l2710
	line	1246
	
l203:
	line	1259
	
l2674:
	movff	(c:printf@ap),fsr2l
	movff	(c:printf@ap+1),fsr2h
	movff	postinc2,(c:printf@val)
	movff	postdec2,(c:printf@val+1)
	movlw	0
	btfsc	((c:printf@val+1)),c,7
	movlw	-1
	movwf	((c:printf@val+2)),c
	movwf	((c:printf@val+3)),c
	
l2676:
	movlw	02h
	addwf	((c:printf@ap)),c
	movlw	0
	addwfc	((c:printf@ap+1)),c
	line	1261
	
l2678:
	btfsc	((c:printf@val+3)),c,7
	goto	u2850
	goto	u2851

u2851:
	goto	l2684
u2850:
	line	1262
	
l2680:
	movlw	03h
	iorwf	((c:printf@flag)),c
	line	1263
	
l2682:
	comf	((c:printf@val+3)),c
	comf	((c:printf@val+2)),c
	comf	((c:printf@val+1)),c
	negf	((c:printf@val)),c
	movlw	0
	addwfc	((c:printf@val+1)),c
	addwfc	((c:printf@val+2)),c
	addwfc	((c:printf@val+3)),c
	goto	l2684
	line	1264
	
l240:
	line	1305
	
l2684:
	movlw	low(01h)
	movwf	((c:printf@c)),c
	
l2686:
		movlw	10
	xorwf	((c:printf@c)),c,w
	btfss	status,2
	goto	u2861
	goto	u2860

u2861:
	goto	l2690
u2860:
	goto	l2698
	
l2688:
	goto	l2698
	line	1306
	
l241:
	
l2690:
	movf	((c:printf@c)),c,w
	mullw	04h
	movlw	low((_dpowers))
	addwf	(prodl),c,w
	movwf	tblptrl
	movlw	high((_dpowers))
	addwfc	(prodh),c,w
	movwf	tblptrh
	if	0	;There are less than 3 active tblptr bytes
	clrf	tblptru
	global __mediumconst
movlw	low highword(__mediumconst)
	addwfc	tblptru,f
	endif
		tblrd	*+
	movf	tablat,w
	subwf	((c:printf@val)),c,w
	tblrd	*+
	movf	tablat,w
	subwfb	((c:printf@val+1)),c,w
	tblrd	*+
	movf	tablat,w
	subwfb	((c:printf@val+2)),c,w
	tblrd	*+
	movf	tablat,w
	subwfb	((c:printf@val+3)),c,w
	btfsc	status,0
	goto	u2871
	goto	u2870

u2871:
	goto	l2694
u2870:
	goto	l2698
	line	1307
	
l2692:
	goto	l2698
	
l243:
	line	1305
	
l2694:
	incf	((c:printf@c)),c
	
l2696:
		movlw	10
	xorwf	((c:printf@c)),c,w
	btfss	status,2
	goto	u2881
	goto	u2880

u2881:
	goto	l2690
u2880:
	goto	l2698
	
l242:
	line	1438
	
l2698:
	movlw	03h
	andwf	((c:printf@flag)),c,w
	movwf	(??_printf+0+0)&0ffh,c
	movlw	0
	andwf	((c:printf@flag+1)),c,w
	movwf	(??_printf+0+0+1)&0ffh,c
	movf	(??_printf+0+0),c,w
iorwf	(??_printf+0+1),c,w
	btfsc	status,2
	goto	u2891
	goto	u2890

u2891:
	goto	l2702
u2890:
	line	1439
	
l2700:
	movlw	(02Dh)&0ffh
	
	call	_putch
	goto	l2702
	
l244:
	line	1472
	
l2702:
	movf	((c:printf@c)),c,w
	movwf	((c:printf@prec)),c
	clrf	((c:printf@prec+1)),c
	btfsc	((c:printf@prec)),c,7
	decf	((c:printf@prec+1)),c
	line	1474
	goto	l2708
	
l246:
	line	1489
	
l2704:
	movff	(c:printf@prec),??_printf+0+0
	movff	(c:printf@prec+1),??_printf+0+0+1
	bcf	status,0
	rlcf	(??_printf+0+0),c
	rlcf	(??_printf+0+1),c
	bcf	status,0
	rlcf	(??_printf+0+0),c
	rlcf	(??_printf+0+1),c
	movlw	low((_dpowers))
	addwf	(??_printf+0+0),c,w
	movwf	tblptrl
	movlw	high((_dpowers))
	addwfc	(??_printf+0+1),c,w
	movwf	tblptrh
	if	0	;There are less than 3 active tblptr bytes
	clrf	tblptru
	global __mediumconst
movlw	low highword(__mediumconst)
	addwfc	tblptru,f
	endif
	tblrd*+
	
	movff	tablat,(c:___lldiv@divisor)
	tblrd*+
	
	movff	tablat,(c:___lldiv@divisor+1)
	tblrd*+
	
	movff	tablat,(c:___lldiv@divisor+2)
	tblrd*-
	
	movff	tablat,(c:___lldiv@divisor+3)
	movff	(c:printf@val),(c:___lldiv@dividend)
	movff	(c:printf@val+1),(c:___lldiv@dividend+1)
	movff	(c:printf@val+2),(c:___lldiv@dividend+2)
	movff	(c:printf@val+3),(c:___lldiv@dividend+3)
	call	___lldiv	;wreg free
	movff	0+?___lldiv,(c:___llmod@dividend)
	movff	1+?___lldiv,(c:___llmod@dividend+1)
	movff	2+?___lldiv,(c:___llmod@dividend+2)
	movff	3+?___lldiv,(c:___llmod@dividend+3)
	
	movlw	low(0Ah)
	movwf	((c:___llmod@divisor)),c
	movlw	high(0Ah)
	movwf	((c:___llmod@divisor+1)),c
	movlw	low highword(0Ah)
	movwf	((c:___llmod@divisor+2)),c
	movlw	high highword(0Ah)
	movwf	((c:___llmod@divisor+3)),c
	call	___llmod	;wreg free
	movf	(0+?___llmod),c,w
	addlw	low(030h)
	movwf	((c:printf@c)),c
	line	1524
	
l2706:
	movf	((c:printf@c)),c,w
	
	call	_putch
	goto	l2708
	line	1525
	
l245:
	line	1474
	
l2708:
	decf	((c:printf@prec)),c
	btfss	status,0
	decf	((c:printf@prec+1)),c
		incf	((c:printf@prec)),c,w
	bnz	u2901
	incf	((c:printf@prec+1)),c,w
	btfss	status,2
	goto	u2901
	goto	u2900

u2901:
	goto	l2704
u2900:
	goto	l2710
	
l247:
	goto	l2710
	line	1533
	
l192:
	line	536
	
l2710:
	movff	(c:printf@f),tblptrl
	movff	(c:printf@f+1),tblptrh
	infsnz	((c:printf@f)),c
	incf	((c:printf@f+1)),c
	if	0	;tblptru may be non-zero
	clrf	tblptru
	endif
	if	0	;tblptru may be non-zero
	global __mediumconst
movlw	low highword(__mediumconst)
	movwf	tblptru
	endif
	tblrd	*
	
	movff	tablat,(c:printf@c)
	movf	((c:printf@c)),c,w
	btfss	status,2
	goto	u2911
	goto	u2910
u2911:
	goto	l2530
u2910:
	goto	l249
	
l248:
	goto	l249
	line	1535
	
l197:
	line	1541
;	Return value of _printf is never used
	
l249:
	return	;funcret
	opt stack 0
GLOBAL	__end_of_printf
	__end_of_printf:
	signat	_printf,602
	global	_scale

;; *************** function _scale *****************
;; Defined at:
;;		line 425 in file "D:\Program Files (x86)\Microchip\xc8\v1.34\sources\common\doprnt.c"
;; Parameters:    Size  Location     Type
;;  scl             1    wreg     char 
;; Auto vars:     Size  Location     Type
;;  scl             1   41[COMRAM] char 
;; Return value:  Size  Location     Type
;;                  3   35[COMRAM] char 
;; Registers used:
;;		wreg, status,2, status,0, tblptrl, tblptrh, tblptru, prodl, prodh, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         3       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         4       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         7       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        7 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		___awdiv
;;		___awmod
;;		___ftmul
;;		___wmul
;; This function is called by:
;;		_printf
;; This function uses a non-reentrant model
;;
psect	text2,class=CODE,space=0,reloc=2
	line	425
global __ptext2
__ptext2:
psect	text2
	file	"D:\Program Files (x86)\Microchip\xc8\v1.34\sources\common\doprnt.c"
	line	425
	global	__size_of_scale
	__size_of_scale	equ	__end_of_scale-_scale
	
_scale:
;incstack = 0
	opt	stack 27
	movwf	((c:scale@scl)),c
	line	428
	
l2238:
	btfsc	((c:scale@scl)),c,7
	goto	u2190
	goto	u2191

u2191:
	goto	l2258
u2190:
	line	429
	
l2240:
	negf	((c:scale@scl)),c
	line	430
		movf	((c:scale@scl)),c,w
	xorlw	80h
	addlw	-(80h^06Eh)
	btfss	status,0
	goto	u2201
	goto	u2200

u2201:
	goto	l2248
u2200:
	line	431
	
l2242:
	movlw	high(03h)
	movwf	((c:___wmul@multiplicand+1)),c
	movlw	low(03h)
	movwf	((c:___wmul@multiplicand)),c
	movlw	high(0Ah)
	movwf	((c:___awdiv@divisor+1)),c
	movlw	low(0Ah)
	movwf	((c:___awdiv@divisor)),c
	movlw	high(064h)
	movwf	((c:___awmod@divisor+1)),c
	movlw	low(064h)
	movwf	((c:___awmod@divisor)),c
	movf	((c:scale@scl)),c,w
	movwf	((c:___awmod@dividend)),c
	clrf	((c:___awmod@dividend+1)),c
	btfsc	((c:___awmod@dividend)),c,7
	decf	((c:___awmod@dividend+1)),c
	call	___awmod	;wreg free
	movff	0+?___awmod,(c:___awdiv@dividend)
	movff	1+?___awmod,(c:___awdiv@dividend+1)
	call	___awdiv	;wreg free
	movlw	low(09h)
	addwf	(0+?___awdiv),c,w
	movwf	((c:___wmul@multiplier)),c
	movlw	high(09h)
	addwfc	(1+?___awdiv),c,w
	movwf	1+((c:___wmul@multiplier)),c
	call	___wmul	;wreg free
	movlw	low((__npowers_))
	addwf	(0+?___wmul),c,w
	movwf	tblptrl
	movlw	high((__npowers_))
	addwfc	(1+?___wmul),c,w
	movwf	tblptrh
	if	0	;There are less than 3 active tblptr bytes
	clrf	tblptru
	global __mediumconst
movlw	low highword(__mediumconst)
	addwfc	tblptru,f
	endif
	tblrd*+
	
	movff	tablat,(c:___ftmul@f2)
	tblrd*+
	
	movff	tablat,(c:___ftmul@f2+1)
	tblrd*-
	
	movff	tablat,(c:___ftmul@f2+2)

	movlw	high(064h)
	movwf	((c:___awdiv@divisor+1)),c
	movlw	low(064h)
	movwf	((c:___awdiv@divisor)),c
	movf	((c:scale@scl)),c,w
	movwf	((c:___awdiv@dividend)),c
	clrf	((c:___awdiv@dividend+1)),c
	btfsc	((c:___awdiv@dividend)),c,7
	decf	((c:___awdiv@dividend+1)),c
	call	___awdiv	;wreg free
	movlw	low(012h)
	addwf	(0+?___awdiv),c,w
	movwf	((c:___wmul@multiplier)),c
	movlw	high(012h)
	addwfc	(1+?___awdiv),c,w
	movwf	1+((c:___wmul@multiplier)),c
	movlw	high(03h)
	movwf	((c:___wmul@multiplicand+1)),c
	movlw	low(03h)
	movwf	((c:___wmul@multiplicand)),c
	call	___wmul	;wreg free
	movlw	low((__npowers_))
	addwf	(0+?___wmul),c,w
	movwf	tblptrl
	movlw	high((__npowers_))
	addwfc	(1+?___wmul),c,w
	movwf	tblptrh
	if	0	;There are less than 3 active tblptr bytes
	clrf	tblptru
	global __mediumconst
movlw	low highword(__mediumconst)
	addwfc	tblptru,f
	endif
	tblrd*+
	
	movff	tablat,(c:___ftmul@f1)
	tblrd*+
	
	movff	tablat,(c:___ftmul@f1+1)
	tblrd*-
	
	movff	tablat,(c:___ftmul@f1+2)

	call	___ftmul	;wreg free
	movff	0+?___ftmul,(c:_scale$1265)
	movff	1+?___ftmul,(c:_scale$1265+1)
	movff	2+?___ftmul,(c:_scale$1265+2)
	movff	(c:_scale$1265),(c:___ftmul@f1)
	movff	(c:_scale$1265+1),(c:___ftmul@f1+1)
	movff	(c:_scale$1265+2),(c:___ftmul@f1+2)
	movlw	high(03h)
	movwf	((c:___wmul@multiplicand+1)),c
	movlw	low(03h)
	movwf	((c:___wmul@multiplicand)),c
	movlw	high(0Ah)
	movwf	((c:___awmod@divisor+1)),c
	movlw	low(0Ah)
	movwf	((c:___awmod@divisor)),c
	movf	((c:scale@scl)),c,w
	movwf	((c:___awmod@dividend)),c
	clrf	((c:___awmod@dividend+1)),c
	btfsc	((c:___awmod@dividend)),c,7
	decf	((c:___awmod@dividend+1)),c
	call	___awmod	;wreg free
	movff	0+?___awmod,(c:___wmul@multiplier)
	movff	1+?___awmod,(c:___wmul@multiplier+1)
	call	___wmul	;wreg free
	movlw	low((__npowers_))
	addwf	(0+?___wmul),c,w
	movwf	tblptrl
	movlw	high((__npowers_))
	addwfc	(1+?___wmul),c,w
	movwf	tblptrh
	if	0	;There are less than 3 active tblptr bytes
	clrf	tblptru
	global __mediumconst
movlw	low highword(__mediumconst)
	addwfc	tblptru,f
	endif
	tblrd*+
	
	movff	tablat,(c:___ftmul@f2)
	tblrd*+
	
	movff	tablat,(c:___ftmul@f2+1)
	tblrd*-
	
	movff	tablat,(c:___ftmul@f2+2)

	call	___ftmul	;wreg free
	movff	0+?___ftmul,(c:?_scale)
	movff	1+?___ftmul,(c:?_scale+1)
	movff	2+?___ftmul,(c:?_scale+2)
	goto	l184
	
l2244:
	goto	l184
	
l2246:
	goto	l2254
	line	432
	
l183:
	
l2248:
		movf	((c:scale@scl)),c,w
	xorlw	80h
	addlw	-(80h^0Bh)
	btfss	status,0
	goto	u2211
	goto	u2210

u2211:
	goto	l2254
u2210:
	line	433
	
l2250:
	movlw	high(0Ah)
	movwf	((c:___awdiv@divisor+1)),c
	movlw	low(0Ah)
	movwf	((c:___awdiv@divisor)),c
	movf	((c:scale@scl)),c,w
	movwf	((c:___awdiv@dividend)),c
	clrf	((c:___awdiv@dividend+1)),c
	btfsc	((c:___awdiv@dividend)),c,7
	decf	((c:___awdiv@dividend+1)),c
	call	___awdiv	;wreg free
	movlw	low(09h)
	addwf	(0+?___awdiv),c,w
	movwf	((c:___wmul@multiplier)),c
	movlw	high(09h)
	addwfc	(1+?___awdiv),c,w
	movwf	1+((c:___wmul@multiplier)),c
	movlw	high(03h)
	movwf	((c:___wmul@multiplicand+1)),c
	movlw	low(03h)
	movwf	((c:___wmul@multiplicand)),c
	call	___wmul	;wreg free
	movlw	low((__npowers_))
	addwf	(0+?___wmul),c,w
	movwf	tblptrl
	movlw	high((__npowers_))
	addwfc	(1+?___wmul),c,w
	movwf	tblptrh
	if	0	;There are less than 3 active tblptr bytes
	clrf	tblptru
	global __mediumconst
movlw	low highword(__mediumconst)
	addwfc	tblptru,f
	endif
	tblrd*+
	
	movff	tablat,(c:___ftmul@f1)
	tblrd*+
	
	movff	tablat,(c:___ftmul@f1+1)
	tblrd*-
	
	movff	tablat,(c:___ftmul@f1+2)

	movlw	high(03h)
	movwf	((c:___wmul@multiplicand+1)),c
	movlw	low(03h)
	movwf	((c:___wmul@multiplicand)),c
	movlw	high(0Ah)
	movwf	((c:___awmod@divisor+1)),c
	movlw	low(0Ah)
	movwf	((c:___awmod@divisor)),c
	movf	((c:scale@scl)),c,w
	movwf	((c:___awmod@dividend)),c
	clrf	((c:___awmod@dividend+1)),c
	btfsc	((c:___awmod@dividend)),c,7
	decf	((c:___awmod@dividend+1)),c
	call	___awmod	;wreg free
	movff	0+?___awmod,(c:___wmul@multiplier)
	movff	1+?___awmod,(c:___wmul@multiplier+1)
	call	___wmul	;wreg free
	movlw	low((__npowers_))
	addwf	(0+?___wmul),c,w
	movwf	tblptrl
	movlw	high((__npowers_))
	addwfc	(1+?___wmul),c,w
	movwf	tblptrh
	if	0	;There are less than 3 active tblptr bytes
	clrf	tblptru
	global __mediumconst
movlw	low highword(__mediumconst)
	addwfc	tblptru,f
	endif
	tblrd*+
	
	movff	tablat,(c:___ftmul@f2)
	tblrd*+
	
	movff	tablat,(c:___ftmul@f2+1)
	tblrd*-
	
	movff	tablat,(c:___ftmul@f2+2)

	call	___ftmul	;wreg free
	movff	0+?___ftmul,(c:?_scale)
	movff	1+?___ftmul,(c:?_scale+1)
	movff	2+?___ftmul,(c:?_scale+2)
	goto	l184
	
l2252:
	goto	l184
	
l186:
	goto	l2254
	line	434
	
l185:
	
l2254:
	movf	((c:scale@scl)),c,w
	mullw	03h
	movlw	low((__npowers_))
	addwf	(prodl),c,w
	movwf	tblptrl
	movlw	high((__npowers_))
	addwfc	(prodh),c,w
	movwf	tblptrh
	if	0	;There are less than 3 active tblptr bytes
	clrf	tblptru
	global __mediumconst
movlw	low highword(__mediumconst)
	addwfc	tblptru,f
	endif
	tblrd*+
	
	movff	tablat,(c:?_scale)
	tblrd*+
	
	movff	tablat,(c:?_scale+1)
	tblrd*-
	
	movff	tablat,(c:?_scale+2)

	goto	l184
	
l2256:
	goto	l184
	line	435
	
l182:
	line	436
	
l2258:
		movf	((c:scale@scl)),c,w
	xorlw	80h
	addlw	-(80h^06Eh)
	btfss	status,0
	goto	u2221
	goto	u2220

u2221:
	goto	l2266
u2220:
	line	437
	
l2260:
	movlw	high(03h)
	movwf	((c:___wmul@multiplicand+1)),c
	movlw	low(03h)
	movwf	((c:___wmul@multiplicand)),c
	movlw	high(0Ah)
	movwf	((c:___awdiv@divisor+1)),c
	movlw	low(0Ah)
	movwf	((c:___awdiv@divisor)),c
	movlw	high(064h)
	movwf	((c:___awmod@divisor+1)),c
	movlw	low(064h)
	movwf	((c:___awmod@divisor)),c
	movf	((c:scale@scl)),c,w
	movwf	((c:___awmod@dividend)),c
	clrf	((c:___awmod@dividend+1)),c
	btfsc	((c:___awmod@dividend)),c,7
	decf	((c:___awmod@dividend+1)),c
	call	___awmod	;wreg free
	movff	0+?___awmod,(c:___awdiv@dividend)
	movff	1+?___awmod,(c:___awdiv@dividend+1)
	call	___awdiv	;wreg free
	movlw	low(09h)
	addwf	(0+?___awdiv),c,w
	movwf	((c:___wmul@multiplier)),c
	movlw	high(09h)
	addwfc	(1+?___awdiv),c,w
	movwf	1+((c:___wmul@multiplier)),c
	call	___wmul	;wreg free
	movlw	low((__powers_))
	addwf	(0+?___wmul),c,w
	movwf	tblptrl
	movlw	high((__powers_))
	addwfc	(1+?___wmul),c,w
	movwf	tblptrh
	if	0	;There are less than 3 active tblptr bytes
	clrf	tblptru
	global __mediumconst
movlw	low highword(__mediumconst)
	addwfc	tblptru,f
	endif
	tblrd*+
	
	movff	tablat,(c:___ftmul@f2)
	tblrd*+
	
	movff	tablat,(c:___ftmul@f2+1)
	tblrd*-
	
	movff	tablat,(c:___ftmul@f2+2)

	movlw	high(064h)
	movwf	((c:___awdiv@divisor+1)),c
	movlw	low(064h)
	movwf	((c:___awdiv@divisor)),c
	movf	((c:scale@scl)),c,w
	movwf	((c:___awdiv@dividend)),c
	clrf	((c:___awdiv@dividend+1)),c
	btfsc	((c:___awdiv@dividend)),c,7
	decf	((c:___awdiv@dividend+1)),c
	call	___awdiv	;wreg free
	movlw	low(012h)
	addwf	(0+?___awdiv),c,w
	movwf	((c:___wmul@multiplier)),c
	movlw	high(012h)
	addwfc	(1+?___awdiv),c,w
	movwf	1+((c:___wmul@multiplier)),c
	movlw	high(03h)
	movwf	((c:___wmul@multiplicand+1)),c
	movlw	low(03h)
	movwf	((c:___wmul@multiplicand)),c
	call	___wmul	;wreg free
	movlw	low((__powers_))
	addwf	(0+?___wmul),c,w
	movwf	tblptrl
	movlw	high((__powers_))
	addwfc	(1+?___wmul),c,w
	movwf	tblptrh
	if	0	;There are less than 3 active tblptr bytes
	clrf	tblptru
	global __mediumconst
movlw	low highword(__mediumconst)
	addwfc	tblptru,f
	endif
	tblrd*+
	
	movff	tablat,(c:___ftmul@f1)
	tblrd*+
	
	movff	tablat,(c:___ftmul@f1+1)
	tblrd*-
	
	movff	tablat,(c:___ftmul@f1+2)

	call	___ftmul	;wreg free
	movff	0+?___ftmul,(c:_scale$1265)
	movff	1+?___ftmul,(c:_scale$1265+1)
	movff	2+?___ftmul,(c:_scale$1265+2)
	movff	(c:_scale$1265),(c:___ftmul@f1)
	movff	(c:_scale$1265+1),(c:___ftmul@f1+1)
	movff	(c:_scale$1265+2),(c:___ftmul@f1+2)
	movlw	high(03h)
	movwf	((c:___wmul@multiplicand+1)),c
	movlw	low(03h)
	movwf	((c:___wmul@multiplicand)),c
	movlw	high(0Ah)
	movwf	((c:___awmod@divisor+1)),c
	movlw	low(0Ah)
	movwf	((c:___awmod@divisor)),c
	movf	((c:scale@scl)),c,w
	movwf	((c:___awmod@dividend)),c
	clrf	((c:___awmod@dividend+1)),c
	btfsc	((c:___awmod@dividend)),c,7
	decf	((c:___awmod@dividend+1)),c
	call	___awmod	;wreg free
	movff	0+?___awmod,(c:___wmul@multiplier)
	movff	1+?___awmod,(c:___wmul@multiplier+1)
	call	___wmul	;wreg free
	movlw	low((__powers_))
	addwf	(0+?___wmul),c,w
	movwf	tblptrl
	movlw	high((__powers_))
	addwfc	(1+?___wmul),c,w
	movwf	tblptrh
	if	0	;There are less than 3 active tblptr bytes
	clrf	tblptru
	global __mediumconst
movlw	low highword(__mediumconst)
	addwfc	tblptru,f
	endif
	tblrd*+
	
	movff	tablat,(c:___ftmul@f2)
	tblrd*+
	
	movff	tablat,(c:___ftmul@f2+1)
	tblrd*-
	
	movff	tablat,(c:___ftmul@f2+2)

	call	___ftmul	;wreg free
	movff	0+?___ftmul,(c:?_scale)
	movff	1+?___ftmul,(c:?_scale+1)
	movff	2+?___ftmul,(c:?_scale+2)
	goto	l184
	
l2262:
	goto	l184
	
l2264:
	goto	l2272
	line	438
	
l187:
	
l2266:
		movf	((c:scale@scl)),c,w
	xorlw	80h
	addlw	-(80h^0Bh)
	btfss	status,0
	goto	u2231
	goto	u2230

u2231:
	goto	l2272
u2230:
	line	439
	
l2268:
	movlw	high(0Ah)
	movwf	((c:___awdiv@divisor+1)),c
	movlw	low(0Ah)
	movwf	((c:___awdiv@divisor)),c
	movf	((c:scale@scl)),c,w
	movwf	((c:___awdiv@dividend)),c
	clrf	((c:___awdiv@dividend+1)),c
	btfsc	((c:___awdiv@dividend)),c,7
	decf	((c:___awdiv@dividend+1)),c
	call	___awdiv	;wreg free
	movlw	low(09h)
	addwf	(0+?___awdiv),c,w
	movwf	((c:___wmul@multiplier)),c
	movlw	high(09h)
	addwfc	(1+?___awdiv),c,w
	movwf	1+((c:___wmul@multiplier)),c
	movlw	high(03h)
	movwf	((c:___wmul@multiplicand+1)),c
	movlw	low(03h)
	movwf	((c:___wmul@multiplicand)),c
	call	___wmul	;wreg free
	movlw	low((__powers_))
	addwf	(0+?___wmul),c,w
	movwf	tblptrl
	movlw	high((__powers_))
	addwfc	(1+?___wmul),c,w
	movwf	tblptrh
	if	0	;There are less than 3 active tblptr bytes
	clrf	tblptru
	global __mediumconst
movlw	low highword(__mediumconst)
	addwfc	tblptru,f
	endif
	tblrd*+
	
	movff	tablat,(c:___ftmul@f1)
	tblrd*+
	
	movff	tablat,(c:___ftmul@f1+1)
	tblrd*-
	
	movff	tablat,(c:___ftmul@f1+2)

	movlw	high(03h)
	movwf	((c:___wmul@multiplicand+1)),c
	movlw	low(03h)
	movwf	((c:___wmul@multiplicand)),c
	movlw	high(0Ah)
	movwf	((c:___awmod@divisor+1)),c
	movlw	low(0Ah)
	movwf	((c:___awmod@divisor)),c
	movf	((c:scale@scl)),c,w
	movwf	((c:___awmod@dividend)),c
	clrf	((c:___awmod@dividend+1)),c
	btfsc	((c:___awmod@dividend)),c,7
	decf	((c:___awmod@dividend+1)),c
	call	___awmod	;wreg free
	movff	0+?___awmod,(c:___wmul@multiplier)
	movff	1+?___awmod,(c:___wmul@multiplier+1)
	call	___wmul	;wreg free
	movlw	low((__powers_))
	addwf	(0+?___wmul),c,w
	movwf	tblptrl
	movlw	high((__powers_))
	addwfc	(1+?___wmul),c,w
	movwf	tblptrh
	if	0	;There are less than 3 active tblptr bytes
	clrf	tblptru
	global __mediumconst
movlw	low highword(__mediumconst)
	addwfc	tblptru,f
	endif
	tblrd*+
	
	movff	tablat,(c:___ftmul@f2)
	tblrd*+
	
	movff	tablat,(c:___ftmul@f2+1)
	tblrd*-
	
	movff	tablat,(c:___ftmul@f2+2)

	call	___ftmul	;wreg free
	movff	0+?___ftmul,(c:?_scale)
	movff	1+?___ftmul,(c:?_scale+1)
	movff	2+?___ftmul,(c:?_scale+2)
	goto	l184
	
l2270:
	goto	l184
	
l189:
	goto	l2272
	line	440
	
l188:
	
l2272:
	movf	((c:scale@scl)),c,w
	mullw	03h
	movlw	low((__powers_))
	addwf	(prodl),c,w
	movwf	tblptrl
	movlw	high((__powers_))
	addwfc	(prodh),c,w
	movwf	tblptrh
	if	0	;There are less than 3 active tblptr bytes
	clrf	tblptru
	global __mediumconst
movlw	low highword(__mediumconst)
	addwfc	tblptru,f
	endif
	tblrd*+
	
	movff	tablat,(c:?_scale)
	tblrd*+
	
	movff	tablat,(c:?_scale+1)
	tblrd*-
	
	movff	tablat,(c:?_scale+2)

	goto	l184
	
l2274:
	line	441
	
l184:
	return	;funcret
	opt stack 0
GLOBAL	__end_of_scale
	__end_of_scale:
	signat	_scale,4219
	global	_putch

;; *************** function _putch *****************
;; Defined at:
;;		line 46 in file "Lab5p6.c"
;; Parameters:    Size  Location     Type
;;  c               1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  c               1    0[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
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
;;		_printf
;; This function uses a non-reentrant model
;;
psect	text3,class=CODE,space=0,reloc=2
	file	"Lab5p6.c"
	line	46
global __ptext3
__ptext3:
psect	text3
	file	"Lab5p6.c"
	line	46
	global	__size_of_putch
	__size_of_putch	equ	__end_of_putch-_putch
	
_putch:
;incstack = 0
	opt	stack 29
	movwf	((c:putch@c)),c
	line	48
	
l2162:
	goto	l74
	
l75:
	
l74:
	btfss	c:(32097/8),(32097)&7	;volatile
	goto	u2061
	goto	u2060
u2061:
	goto	l74
u2060:
	goto	l2164
	
l76:
	line	49
	
l2164:
	movff	(c:putch@c),(c:4013)	;volatile
	line	50
	
l77:
	return	;funcret
	opt stack 0
GLOBAL	__end_of_putch
	__end_of_putch:
	signat	_putch,4216
	global	_fround

;; *************** function _fround *****************
;; Defined at:
;;		line 409 in file "D:\Program Files (x86)\Microchip\xc8\v1.34\sources\common\doprnt.c"
;; Parameters:    Size  Location     Type
;;  prec            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  prec            1   44[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;                  3   35[COMRAM] unsigned char 
;; Registers used:
;;		wreg, status,2, status,0, tblptrl, tblptrh, tblptru, prodl, prodh, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         3       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         7       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:        10       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:       10 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		___awdiv
;;		___awmod
;;		___ftmul
;;		___wmul
;; This function is called by:
;;		_printf
;; This function uses a non-reentrant model
;;
psect	text4,class=CODE,space=0,reloc=2
	file	"D:\Program Files (x86)\Microchip\xc8\v1.34\sources\common\doprnt.c"
	line	409
global __ptext4
__ptext4:
psect	text4
	file	"D:\Program Files (x86)\Microchip\xc8\v1.34\sources\common\doprnt.c"
	line	409
	global	__size_of_fround
	__size_of_fround	equ	__end_of_fround-_fround
	
_fround:
;incstack = 0
	opt	stack 27
	movwf	((c:fround@prec)),c
	line	413
	
l2216:
		movlw	06Eh-1
	cpfsgt	((c:fround@prec)),c
	goto	u2171
	goto	u2170

u2171:
	goto	l2226
u2170:
	line	414
	
l2218:
	movlw	high(03h)
	movwf	((c:___wmul@multiplicand+1)),c
	movlw	low(03h)
	movwf	((c:___wmul@multiplicand)),c
	movlw	high(0Ah)
	movwf	((c:___awdiv@divisor+1)),c
	movlw	low(0Ah)
	movwf	((c:___awdiv@divisor)),c
	movlw	high(064h)
	movwf	((c:___awmod@divisor+1)),c
	movlw	low(064h)
	movwf	((c:___awmod@divisor)),c
	movff	(c:fround@prec),(c:___awmod@dividend)
	clrf	((c:___awmod@dividend+1)),c
	call	___awmod	;wreg free
	movff	0+?___awmod,(c:___awdiv@dividend)
	movff	1+?___awmod,(c:___awdiv@dividend+1)
	call	___awdiv	;wreg free
	movlw	low(09h)
	addwf	(0+?___awdiv),c,w
	movwf	((c:___wmul@multiplier)),c
	movlw	high(09h)
	addwfc	(1+?___awdiv),c,w
	movwf	1+((c:___wmul@multiplier)),c
	call	___wmul	;wreg free
	movlw	low((__npowers_))
	addwf	(0+?___wmul),c,w
	movwf	tblptrl
	movlw	high((__npowers_))
	addwfc	(1+?___wmul),c,w
	movwf	tblptrh
	if	0	;There are less than 3 active tblptr bytes
	clrf	tblptru
	global __mediumconst
movlw	low highword(__mediumconst)
	addwfc	tblptru,f
	endif
	tblrd*+
	
	movff	tablat,(c:___ftmul@f2)
	tblrd*+
	
	movff	tablat,(c:___ftmul@f2+1)
	tblrd*-
	
	movff	tablat,(c:___ftmul@f2+2)

	movlw	high(064h)
	movwf	((c:___awdiv@divisor+1)),c
	movlw	low(064h)
	movwf	((c:___awdiv@divisor)),c
	movff	(c:fround@prec),(c:___awdiv@dividend)
	clrf	((c:___awdiv@dividend+1)),c
	call	___awdiv	;wreg free
	movlw	low(012h)
	addwf	(0+?___awdiv),c,w
	movwf	((c:___wmul@multiplier)),c
	movlw	high(012h)
	addwfc	(1+?___awdiv),c,w
	movwf	1+((c:___wmul@multiplier)),c
	movlw	high(03h)
	movwf	((c:___wmul@multiplicand+1)),c
	movlw	low(03h)
	movwf	((c:___wmul@multiplicand)),c
	call	___wmul	;wreg free
	movlw	low((__npowers_))
	addwf	(0+?___wmul),c,w
	movwf	tblptrl
	movlw	high((__npowers_))
	addwfc	(1+?___wmul),c,w
	movwf	tblptrh
	if	0	;There are less than 3 active tblptr bytes
	clrf	tblptru
	global __mediumconst
movlw	low highword(__mediumconst)
	addwfc	tblptru,f
	endif
	tblrd*+
	
	movff	tablat,(c:___ftmul@f1)
	tblrd*+
	
	movff	tablat,(c:___ftmul@f1+1)
	tblrd*-
	
	movff	tablat,(c:___ftmul@f1+2)

	call	___ftmul	;wreg free
	movff	0+?___ftmul,(c:_fround$1263)
	movff	1+?___ftmul,(c:_fround$1263+1)
	movff	2+?___ftmul,(c:_fround$1263+2)
	movlw	high(03h)
	movwf	((c:___wmul@multiplicand+1)),c
	movlw	low(03h)
	movwf	((c:___wmul@multiplicand)),c
	movlw	high(0Ah)
	movwf	((c:___awmod@divisor+1)),c
	movlw	low(0Ah)
	movwf	((c:___awmod@divisor)),c
	movff	(c:fround@prec),(c:___awmod@dividend)
	clrf	((c:___awmod@dividend+1)),c
	call	___awmod	;wreg free
	movff	0+?___awmod,(c:___wmul@multiplier)
	movff	1+?___awmod,(c:___wmul@multiplier+1)
	call	___wmul	;wreg free
	movlw	low((__npowers_))
	addwf	(0+?___wmul),c,w
	movwf	tblptrl
	movlw	high((__npowers_))
	addwfc	(1+?___wmul),c,w
	movwf	tblptrh
	if	0	;There are less than 3 active tblptr bytes
	clrf	tblptru
	global __mediumconst
movlw	low highword(__mediumconst)
	addwfc	tblptru,f
	endif
	tblrd*+
	
	movff	tablat,(c:___ftmul@f2)
	tblrd*+
	
	movff	tablat,(c:___ftmul@f2+1)
	tblrd*-
	
	movff	tablat,(c:___ftmul@f2+2)

	movff	(c:_fround$1263),(c:___ftmul@f1)
	movff	(c:_fround$1263+1),(c:___ftmul@f1+1)
	movff	(c:_fround$1263+2),(c:___ftmul@f1+2)
	call	___ftmul	;wreg free
	movff	0+?___ftmul,(c:_fround$1264)
	movff	1+?___ftmul,(c:_fround$1264+1)
	movff	2+?___ftmul,(c:_fround$1264+2)
	
l2220:
	movff	(c:_fround$1264),(c:___ftmul@f1)
	movff	(c:_fround$1264+1),(c:___ftmul@f1+1)
	movff	(c:_fround$1264+2),(c:___ftmul@f1+2)
	movlw	low(float24(0.50000000000000000))
	movwf	((c:___ftmul@f2)),c
	movlw	high(float24(0.50000000000000000))
	movwf	((c:___ftmul@f2+1)),c
	movlw	low highword(float24(0.50000000000000000))
	movwf	((c:___ftmul@f2+2)),c

	call	___ftmul	;wreg free
	movff	0+?___ftmul,(c:?_fround)
	movff	1+?___ftmul,(c:?_fround+1)
	movff	2+?___ftmul,(c:?_fround+2)
	goto	l177
	
l2222:
	goto	l177
	
l2224:
	goto	l2234
	line	415
	
l176:
	
l2226:
		movlw	0Bh-1
	cpfsgt	((c:fround@prec)),c
	goto	u2181
	goto	u2180

u2181:
	goto	l2234
u2180:
	line	416
	
l2228:
	movlw	high(03h)
	movwf	((c:___wmul@multiplicand+1)),c
	movlw	low(03h)
	movwf	((c:___wmul@multiplicand)),c
	movlw	high(0Ah)
	movwf	((c:___awmod@divisor+1)),c
	movlw	low(0Ah)
	movwf	((c:___awmod@divisor)),c
	movff	(c:fround@prec),(c:___awmod@dividend)
	clrf	((c:___awmod@dividend+1)),c
	call	___awmod	;wreg free
	movff	0+?___awmod,(c:___wmul@multiplier)
	movff	1+?___awmod,(c:___wmul@multiplier+1)
	call	___wmul	;wreg free
	movlw	low((__npowers_))
	addwf	(0+?___wmul),c,w
	movwf	tblptrl
	movlw	high((__npowers_))
	addwfc	(1+?___wmul),c,w
	movwf	tblptrh
	if	0	;There are less than 3 active tblptr bytes
	clrf	tblptru
	global __mediumconst
movlw	low highword(__mediumconst)
	addwfc	tblptru,f
	endif
	tblrd*+
	
	movff	tablat,(c:___ftmul@f2)
	tblrd*+
	
	movff	tablat,(c:___ftmul@f2+1)
	tblrd*-
	
	movff	tablat,(c:___ftmul@f2+2)

	movlw	high(0Ah)
	movwf	((c:___awdiv@divisor+1)),c
	movlw	low(0Ah)
	movwf	((c:___awdiv@divisor)),c
	movff	(c:fround@prec),(c:___awdiv@dividend)
	clrf	((c:___awdiv@dividend+1)),c
	call	___awdiv	;wreg free
	movlw	low(09h)
	addwf	(0+?___awdiv),c,w
	movwf	((c:___wmul@multiplier)),c
	movlw	high(09h)
	addwfc	(1+?___awdiv),c,w
	movwf	1+((c:___wmul@multiplier)),c
	movlw	high(03h)
	movwf	((c:___wmul@multiplicand+1)),c
	movlw	low(03h)
	movwf	((c:___wmul@multiplicand)),c
	call	___wmul	;wreg free
	movlw	low((__npowers_))
	addwf	(0+?___wmul),c,w
	movwf	tblptrl
	movlw	high((__npowers_))
	addwfc	(1+?___wmul),c,w
	movwf	tblptrh
	if	0	;There are less than 3 active tblptr bytes
	clrf	tblptru
	global __mediumconst
movlw	low highword(__mediumconst)
	addwfc	tblptru,f
	endif
	tblrd*+
	
	movff	tablat,(c:___ftmul@f1)
	tblrd*+
	
	movff	tablat,(c:___ftmul@f1+1)
	tblrd*-
	
	movff	tablat,(c:___ftmul@f1+2)

	call	___ftmul	;wreg free
	movff	0+?___ftmul,(c:_fround$1263)
	movff	1+?___ftmul,(c:_fround$1263+1)
	movff	2+?___ftmul,(c:_fround$1263+2)
	
l2230:
	movff	(c:_fround$1263),(c:___ftmul@f1)
	movff	(c:_fround$1263+1),(c:___ftmul@f1+1)
	movff	(c:_fround$1263+2),(c:___ftmul@f1+2)
	movlw	low(float24(0.50000000000000000))
	movwf	((c:___ftmul@f2)),c
	movlw	high(float24(0.50000000000000000))
	movwf	((c:___ftmul@f2+1)),c
	movlw	low highword(float24(0.50000000000000000))
	movwf	((c:___ftmul@f2+2)),c

	call	___ftmul	;wreg free
	movff	0+?___ftmul,(c:?_fround)
	movff	1+?___ftmul,(c:?_fround+1)
	movff	2+?___ftmul,(c:?_fround+2)
	goto	l177
	
l2232:
	goto	l177
	
l179:
	goto	l2234
	line	417
	
l178:
	
l2234:
	movf	((c:fround@prec)),c,w
	mullw	03h
	movlw	low((__npowers_))
	addwf	(prodl),c,w
	movwf	tblptrl
	movlw	high((__npowers_))
	addwfc	(prodh),c,w
	movwf	tblptrh
	if	0	;There are less than 3 active tblptr bytes
	clrf	tblptru
	global __mediumconst
movlw	low highword(__mediumconst)
	addwfc	tblptru,f
	endif
	tblrd*+
	
	movff	tablat,(c:___ftmul@f1)
	tblrd*+
	
	movff	tablat,(c:___ftmul@f1+1)
	tblrd*-
	
	movff	tablat,(c:___ftmul@f1+2)

	movlw	low(float24(0.50000000000000000))
	movwf	((c:___ftmul@f2)),c
	movlw	high(float24(0.50000000000000000))
	movwf	((c:___ftmul@f2+1)),c
	movlw	low highword(float24(0.50000000000000000))
	movwf	((c:___ftmul@f2+2)),c

	call	___ftmul	;wreg free
	movff	0+?___ftmul,(c:?_fround)
	movff	1+?___ftmul,(c:?_fround+1)
	movff	2+?___ftmul,(c:?_fround+2)
	goto	l177
	
l2236:
	line	418
	
l177:
	return	;funcret
	opt stack 0
GLOBAL	__end_of_fround
	__end_of_fround:
	signat	_fround,4219
	global	___wmul

;; *************** function ___wmul *****************
;; Defined at:
;;		line 15 in file "D:\Program Files (x86)\Microchip\xc8\v1.34\sources\common\Umul16.c"
;; Parameters:    Size  Location     Type
;;  multiplier      2   14[COMRAM] unsigned int 
;;  multiplicand    2   16[COMRAM] unsigned int 
;; Auto vars:     Size  Location     Type
;;  product         2   18[COMRAM] unsigned int 
;; Return value:  Size  Location     Type
;;                  2   14[COMRAM] unsigned int 
;; Registers used:
;;		wreg, status,2, status,0, prodl, prodh
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         4       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         2       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         6       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_fround
;;		_scale
;;		_printf
;; This function uses a non-reentrant model
;;
psect	text5,class=CODE,space=0,reloc=2
	file	"D:\Program Files (x86)\Microchip\xc8\v1.34\sources\common\Umul16.c"
	line	15
global __ptext5
__ptext5:
psect	text5
	file	"D:\Program Files (x86)\Microchip\xc8\v1.34\sources\common\Umul16.c"
	line	15
	global	__size_of___wmul
	__size_of___wmul	equ	__end_of___wmul-___wmul
	
___wmul:
;incstack = 0
	opt	stack 28
	line	37
	
l1958:
	movf	((c:___wmul@multiplier)),c,w
	mulwf	((c:___wmul@multiplicand)),c
	movff	prodl,(c:___wmul@product)
	movff	prodh,(c:___wmul@product+1)
	line	38
	movf	((c:___wmul@multiplier)),c,w
	mulwf	(0+((c:___wmul@multiplicand)+01h)),c
	movf	(prodl),c,w
	addwf	((c:___wmul@product+1)),c

	line	39
	movf	(0+((c:___wmul@multiplier)+01h)),c,w
	mulwf	((c:___wmul@multiplicand)),c
	movf	(prodl),c,w
	addwf	((c:___wmul@product+1)),c

	line	52
	
l1960:
	movff	(c:___wmul@product),(c:?___wmul)
	movff	(c:___wmul@product+1),(c:?___wmul+1)
	goto	l285
	
l1962:
	line	53
	
l285:
	return	;funcret
	opt stack 0
GLOBAL	__end_of___wmul
	__end_of___wmul:
	signat	___wmul,8314
	global	___ftmul

;; *************** function ___ftmul *****************
;; Defined at:
;;		line 62 in file "D:\Program Files (x86)\Microchip\xc8\v1.34\sources\common\ftmul.c"
;; Parameters:    Size  Location     Type
;;  f1              3   20[COMRAM] float 
;;  f2              3   23[COMRAM] float 
;; Auto vars:     Size  Location     Type
;;  f3_as_produc    3   30[COMRAM] unsigned um
;;  sign            1   34[COMRAM] unsigned char 
;;  cntr            1   33[COMRAM] unsigned char 
;;  exp             1   29[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;                  3   20[COMRAM] float 
;; Registers used:
;;		wreg, status,2, status,0, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         6       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         6       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          3       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:        15       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:       15 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		___ftpack
;; This function is called by:
;;		_main
;;		_fround
;;		_scale
;;		_printf
;; This function uses a non-reentrant model
;;
psect	text6,class=CODE,space=0,reloc=2
	file	"D:\Program Files (x86)\Microchip\xc8\v1.34\sources\common\ftmul.c"
	line	62
global __ptext6
__ptext6:
psect	text6
	file	"D:\Program Files (x86)\Microchip\xc8\v1.34\sources\common\ftmul.c"
	line	62
	global	__size_of___ftmul
	__size_of___ftmul	equ	__end_of___ftmul-___ftmul
	
___ftmul:
;incstack = 0
	opt	stack 27
	line	67
	
l2034:
	movff	(c:___ftmul@f1+2),??___ftmul+0+0
	clrf	(??___ftmul+0+0+1)&0ffh,c
	clrf	(??___ftmul+0+0+2)&0ffh,c
	rlcf	((c:___ftmul@f1+1)),c,w
	rlcf	(??___ftmul+0+0)&0ffh,c
	bnc	u1881
	bsf	(??___ftmul+0+0+1)&0ffh,c,0
u1881:
	movf	(??___ftmul+0+0),c,w
	movwf	((c:___ftmul@exp)),c
	movf	((c:___ftmul@exp)),c,w
	btfss	status,2
	goto	u1891
	goto	u1890
u1891:
	goto	l2040
u1890:
	line	68
	
l2036:
	movlw	low(float24(0.0000000000000000))
	movwf	((c:?___ftmul)),c
	movlw	high(float24(0.0000000000000000))
	movwf	((c:?___ftmul+1)),c
	movlw	low highword(float24(0.0000000000000000))
	movwf	((c:?___ftmul+2)),c

	goto	l714
	
l2038:
	goto	l714
	
l713:
	line	69
	
l2040:
	movff	(c:___ftmul@f2+2),??___ftmul+0+0
	clrf	(??___ftmul+0+0+1)&0ffh,c
	clrf	(??___ftmul+0+0+2)&0ffh,c
	rlcf	((c:___ftmul@f2+1)),c,w
	rlcf	(??___ftmul+0+0)&0ffh,c
	bnc	u1901
	bsf	(??___ftmul+0+0+1)&0ffh,c,0
u1901:
	movf	(??___ftmul+0+0),c,w
	movwf	((c:___ftmul@sign)),c
	movf	((c:___ftmul@sign)),c,w
	btfss	status,2
	goto	u1911
	goto	u1910
u1911:
	goto	l2046
u1910:
	line	70
	
l2042:
	movlw	low(float24(0.0000000000000000))
	movwf	((c:?___ftmul)),c
	movlw	high(float24(0.0000000000000000))
	movwf	((c:?___ftmul+1)),c
	movlw	low highword(float24(0.0000000000000000))
	movwf	((c:?___ftmul+2)),c

	goto	l714
	
l2044:
	goto	l714
	
l715:
	line	71
	
l2046:
	movf	((c:___ftmul@sign)),c,w
	addlw	low(07Bh)
	addwf	((c:___ftmul@exp)),c
	line	72
	
l2048:
	movff	0+2+(c:___ftmul@f1),(c:___ftmul@sign)
	line	73
	movf	(0+2+(c:___ftmul@f2)),c,w
	xorwf	((c:___ftmul@sign)),c
	line	74
	movlw	(080h)&0ffh
	andwf	((c:___ftmul@sign)),c
	line	75
	
l2050:
	bsf	(0+(15/8)+(c:___ftmul@f1)),c,(15)&7
	line	77
	
l2052:
	bsf	(0+(15/8)+(c:___ftmul@f2)),c,(15)&7
	line	78
	
l2054:
	movlw	low(0FFFFh)
	andwf	((c:___ftmul@f2)),c
	movlw	high(0FFFFh)
	andwf	((c:___ftmul@f2+1)),c
	movlw	low highword(0FFFFh)
	andwf	((c:___ftmul@f2+2)),c

	line	79
	
l2056:
	movlw	low(0)
	movwf	((c:___ftmul@f3_as_product)),c
	movlw	high(0)
	movwf	((c:___ftmul@f3_as_product+1)),c
	movlw	low highword(0)
	movwf	((c:___ftmul@f3_as_product+2)),c

	line	134
	
l2058:
	movlw	low(07h)
	movwf	((c:___ftmul@cntr)),c
	goto	l2060
	line	135
	
l716:
	line	136
	
l2060:
	
	btfss	((c:___ftmul@f1)),c,(0)&7
	goto	u1921
	goto	u1920
u1921:
	goto	l2064
u1920:
	line	137
	
l2062:
	movf	((c:___ftmul@f2)),c,w
	addwf	((c:___ftmul@f3_as_product)),c
	movf	((c:___ftmul@f2+1)),c,w
	addwfc	((c:___ftmul@f3_as_product+1)),c
	movf	((c:___ftmul@f2+2)),c,w
	addwfc	((c:___ftmul@f3_as_product+2)),c

	goto	l2064
	
l717:
	line	138
	
l2064:
	bcf	status,0
	rrcf	((c:___ftmul@f1+2)),c
	rrcf	((c:___ftmul@f1+1)),c
	rrcf	((c:___ftmul@f1)),c
	line	139
	bcf	status,0
	rlcf	((c:___ftmul@f2)),c
	rlcf	((c:___ftmul@f2+1)),c
	rlcf	((c:___ftmul@f2+2)),c
	line	140
	
l2066:
	decfsz	((c:___ftmul@cntr)),c
	
	goto	l2060
	goto	l2068
	
l718:
	line	143
	
l2068:
	movlw	low(09h)
	movwf	((c:___ftmul@cntr)),c
	goto	l2070
	line	144
	
l719:
	line	145
	
l2070:
	
	btfss	((c:___ftmul@f1)),c,(0)&7
	goto	u1931
	goto	u1930
u1931:
	goto	l2074
u1930:
	line	146
	
l2072:
	movf	((c:___ftmul@f2)),c,w
	addwf	((c:___ftmul@f3_as_product)),c
	movf	((c:___ftmul@f2+1)),c,w
	addwfc	((c:___ftmul@f3_as_product+1)),c
	movf	((c:___ftmul@f2+2)),c,w
	addwfc	((c:___ftmul@f3_as_product+2)),c

	goto	l2074
	
l720:
	line	147
	
l2074:
	bcf	status,0
	rrcf	((c:___ftmul@f1+2)),c
	rrcf	((c:___ftmul@f1+1)),c
	rrcf	((c:___ftmul@f1)),c
	line	148
	bcf	status,0
	rrcf	((c:___ftmul@f3_as_product+2)),c
	rrcf	((c:___ftmul@f3_as_product+1)),c
	rrcf	((c:___ftmul@f3_as_product)),c
	line	149
	
l2076:
	decfsz	((c:___ftmul@cntr)),c
	
	goto	l2070
	goto	l2078
	
l721:
	line	156
	
l2078:
	movff	(c:___ftmul@f3_as_product),(c:___ftpack@arg)
	movff	(c:___ftmul@f3_as_product+1),(c:___ftpack@arg+1)
	movff	(c:___ftmul@f3_as_product+2),(c:___ftpack@arg+2)
	movff	(c:___ftmul@exp),(c:___ftpack@exp)
	movff	(c:___ftmul@sign),(c:___ftpack@sign)
	call	___ftpack	;wreg free
	movff	0+?___ftpack,(c:?___ftmul)
	movff	1+?___ftpack,(c:?___ftmul+1)
	movff	2+?___ftpack,(c:?___ftmul+2)
	goto	l714
	
l2080:
	line	157
	
l714:
	return	;funcret
	opt stack 0
GLOBAL	__end_of___ftmul
	__end_of___ftmul:
	signat	___ftmul,8315
	global	___awmod

;; *************** function ___awmod *****************
;; Defined at:
;;		line 8 in file "D:\Program Files (x86)\Microchip\xc8\v1.34\sources\common\awmod.c"
;; Parameters:    Size  Location     Type
;;  dividend        2    0[COMRAM] int 
;;  divisor         2    2[COMRAM] int 
;; Auto vars:     Size  Location     Type
;;  sign            1    5[COMRAM] unsigned char 
;;  counter         1    4[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    0[COMRAM] int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         4       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         2       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         6       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;;		_fround
;;		_scale
;; This function uses a non-reentrant model
;;
psect	text7,class=CODE,space=0,reloc=2
	file	"D:\Program Files (x86)\Microchip\xc8\v1.34\sources\common\awmod.c"
	line	8
global __ptext7
__ptext7:
psect	text7
	file	"D:\Program Files (x86)\Microchip\xc8\v1.34\sources\common\awmod.c"
	line	8
	global	__size_of___awmod
	__size_of___awmod	equ	__end_of___awmod-___awmod
	
___awmod:
;incstack = 0
	opt	stack 28
	line	13
	
l2126:
	movlw	low(0)
	movwf	((c:___awmod@sign)),c
	line	14
	
l2128:
	btfsc	((c:___awmod@dividend+1)),c,7
	goto	u2000
	goto	u2001

u2001:
	goto	l2134
u2000:
	line	15
	
l2130:
	negf	((c:___awmod@dividend)),c
	comf	((c:___awmod@dividend+1)),c
	btfsc	status,0
	incf	((c:___awmod@dividend+1)),c
	line	16
	
l2132:
	movlw	low(01h)
	movwf	((c:___awmod@sign)),c
	goto	l2134
	line	17
	
l481:
	line	18
	
l2134:
	btfsc	((c:___awmod@divisor+1)),c,7
	goto	u2010
	goto	u2011

u2011:
	goto	l2138
u2010:
	line	19
	
l2136:
	negf	((c:___awmod@divisor)),c
	comf	((c:___awmod@divisor+1)),c
	btfsc	status,0
	incf	((c:___awmod@divisor+1)),c
	goto	l2138
	
l482:
	line	20
	
l2138:
	movf	((c:___awmod@divisor)),c,w
iorwf	((c:___awmod@divisor+1)),c,w
	btfsc	status,2
	goto	u2021
	goto	u2020

u2021:
	goto	l2154
u2020:
	line	21
	
l2140:
	movlw	low(01h)
	movwf	((c:___awmod@counter)),c
	line	22
	goto	l2144
	
l485:
	line	23
	
l2142:
	bcf	status,0
	rlcf	((c:___awmod@divisor)),c
	rlcf	((c:___awmod@divisor+1)),c
	line	24
	incf	((c:___awmod@counter)),c
	goto	l2144
	line	25
	
l484:
	line	22
	
l2144:
	
	btfss	((c:___awmod@divisor+1)),c,(15)&7
	goto	u2031
	goto	u2030
u2031:
	goto	l2142
u2030:
	goto	l2146
	
l486:
	goto	l2146
	line	26
	
l487:
	line	27
	
l2146:
		movf	((c:___awmod@divisor)),c,w
	subwf	((c:___awmod@dividend)),c,w
	movf	((c:___awmod@divisor+1)),c,w
	subwfb	((c:___awmod@dividend+1)),c,w
	btfss	status,0
	goto	u2041
	goto	u2040

u2041:
	goto	l2150
u2040:
	line	28
	
l2148:
	movf	((c:___awmod@divisor)),c,w
	subwf	((c:___awmod@dividend)),c
	movf	((c:___awmod@divisor+1)),c,w
	subwfb	((c:___awmod@dividend+1)),c

	goto	l2150
	
l488:
	line	29
	
l2150:
	bcf	status,0
	rrcf	((c:___awmod@divisor+1)),c
	rrcf	((c:___awmod@divisor)),c
	line	30
	
l2152:
	decfsz	((c:___awmod@counter)),c
	
	goto	l2146
	goto	l2154
	
l489:
	goto	l2154
	line	31
	
l483:
	line	32
	
l2154:
	movf	((c:___awmod@sign)),c,w
	btfsc	status,2
	goto	u2051
	goto	u2050
u2051:
	goto	l2158
u2050:
	line	33
	
l2156:
	negf	((c:___awmod@dividend)),c
	comf	((c:___awmod@dividend+1)),c
	btfsc	status,0
	incf	((c:___awmod@dividend+1)),c
	goto	l2158
	
l490:
	line	34
	
l2158:
	movff	(c:___awmod@dividend),(c:?___awmod)
	movff	(c:___awmod@dividend+1),(c:?___awmod+1)
	goto	l491
	
l2160:
	line	35
	
l491:
	return	;funcret
	opt stack 0
GLOBAL	__end_of___awmod
	__end_of___awmod:
	signat	___awmod,8314
	global	__tdiv_to_l_

;; *************** function __tdiv_to_l_ *****************
;; Defined at:
;;		line 60 in file "D:\Program Files (x86)\Microchip\xc8\v1.34\sources\common\ftdivl.c"
;; Parameters:    Size  Location     Type
;;  f1              3    0[COMRAM] float 
;;  f2              3    3[COMRAM] float 
;; Auto vars:     Size  Location     Type
;;  quot            4    9[COMRAM] unsigned long 
;;  exp1            1   14[COMRAM] unsigned char 
;;  cntr            1   13[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;                  4    0[COMRAM] unsigned long 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         6       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         6       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          3       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:        15       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:       15 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_printf
;; This function uses a non-reentrant model
;;
psect	text8,class=CODE,space=0,reloc=2
	file	"D:\Program Files (x86)\Microchip\xc8\v1.34\sources\common\ftdivl.c"
	line	60
global __ptext8
__ptext8:
psect	text8
	file	"D:\Program Files (x86)\Microchip\xc8\v1.34\sources\common\ftdivl.c"
	line	60
	global	__size_of__tdiv_to_l_
	__size_of__tdiv_to_l_	equ	__end_of__tdiv_to_l_-__tdiv_to_l_
	
__tdiv_to_l_:
;incstack = 0
	opt	stack 29
	line	66
	
l2276:
	movff	(c:__tdiv_to_l_@f1+2),??__tdiv_to_l_+0+0
	clrf	(??__tdiv_to_l_+0+0+1)&0ffh,c
	clrf	(??__tdiv_to_l_+0+0+2)&0ffh,c
	rlcf	((c:__tdiv_to_l_@f1+1)),c,w
	rlcf	(??__tdiv_to_l_+0+0)&0ffh,c
	bnc	u2241
	bsf	(??__tdiv_to_l_+0+0+1)&0ffh,c,0
u2241:
	movf	(??__tdiv_to_l_+0+0),c,w
	movwf	((c:__tdiv_to_l_@exp1)),c
	movf	((c:__tdiv_to_l_@exp1)),c,w
	btfss	status,2
	goto	u2251
	goto	u2250
u2251:
	goto	l2282
u2250:
	line	67
	
l2278:
	movlw	low(0)
	movwf	((c:?__tdiv_to_l_)),c
	movlw	high(0)
	movwf	((c:?__tdiv_to_l_+1)),c
	movlw	low highword(0)
	movwf	((c:?__tdiv_to_l_+2)),c
	movlw	high highword(0)
	movwf	((c:?__tdiv_to_l_+3)),c
	goto	l690
	
l2280:
	goto	l690
	
l689:
	line	68
	
l2282:
	movff	(c:__tdiv_to_l_@f2+2),??__tdiv_to_l_+0+0
	clrf	(??__tdiv_to_l_+0+0+1)&0ffh,c
	clrf	(??__tdiv_to_l_+0+0+2)&0ffh,c
	rlcf	((c:__tdiv_to_l_@f2+1)),c,w
	rlcf	(??__tdiv_to_l_+0+0)&0ffh,c
	bnc	u2261
	bsf	(??__tdiv_to_l_+0+0+1)&0ffh,c,0
u2261:
	movf	(??__tdiv_to_l_+0+0),c,w
	movwf	((c:__tdiv_to_l_@cntr)),c
	movf	((c:__tdiv_to_l_@cntr)),c,w
	btfss	status,2
	goto	u2271
	goto	u2270
u2271:
	goto	l2288
u2270:
	line	69
	
l2284:
	movlw	low(0)
	movwf	((c:?__tdiv_to_l_)),c
	movlw	high(0)
	movwf	((c:?__tdiv_to_l_+1)),c
	movlw	low highword(0)
	movwf	((c:?__tdiv_to_l_+2)),c
	movlw	high highword(0)
	movwf	((c:?__tdiv_to_l_+3)),c
	goto	l690
	
l2286:
	goto	l690
	
l691:
	line	70
	
l2288:
	bsf	(0+(15/8)+(c:__tdiv_to_l_@f1)),c,(15)&7
	line	71
	
l2290:
	movlw	low(0FFFFh)
	andwf	((c:__tdiv_to_l_@f1)),c
	movlw	high(0FFFFh)
	andwf	((c:__tdiv_to_l_@f1+1)),c
	movlw	low highword(0FFFFh)
	andwf	((c:__tdiv_to_l_@f1+2)),c

	line	72
	bsf	(0+(15/8)+(c:__tdiv_to_l_@f2)),c,(15)&7
	line	73
	
l2292:
	movlw	low(0FFFFh)
	andwf	((c:__tdiv_to_l_@f2)),c
	movlw	high(0FFFFh)
	andwf	((c:__tdiv_to_l_@f2+1)),c
	movlw	low highword(0FFFFh)
	andwf	((c:__tdiv_to_l_@f2+2)),c

	line	74
	
l2294:
	movlw	low(0)
	movwf	((c:__tdiv_to_l_@quot)),c
	movlw	high(0)
	movwf	((c:__tdiv_to_l_@quot+1)),c
	movlw	low highword(0)
	movwf	((c:__tdiv_to_l_@quot+2)),c
	movlw	high highword(0)
	movwf	((c:__tdiv_to_l_@quot+3)),c
	line	75
	
l2296:
	movlw	(07Fh)&0ffh
	subwf	((c:__tdiv_to_l_@exp1)),c
	line	76
	
l2298:
	movf	((c:__tdiv_to_l_@cntr)),c,w
	addlw	low(098h)
	subwf	((c:__tdiv_to_l_@exp1)),c
	line	77
	
l2300:
	movlw	low(018h)
	movwf	((c:__tdiv_to_l_@cntr)),c
	line	78
	
l692:
	line	79
	bcf	status,0
	rlcf	((c:__tdiv_to_l_@quot)),c
	rlcf	((c:__tdiv_to_l_@quot+1)),c
	rlcf	((c:__tdiv_to_l_@quot+2)),c
	rlcf	((c:__tdiv_to_l_@quot+3)),c
	line	80
	
l2302:
		movf	((c:__tdiv_to_l_@f2)),c,w
	subwf	((c:__tdiv_to_l_@f1)),c,w
	movf	((c:__tdiv_to_l_@f2+1)),c,w
	subwfb	((c:__tdiv_to_l_@f1+1)),c,w
	movf	((c:__tdiv_to_l_@f2+2)),c,w
	subwfb	((c:__tdiv_to_l_@f1+2)),c,w
	btfss	status,0
	goto	u2281
	goto	u2280

u2281:
	goto	l693
u2280:
	line	81
	
l2304:
	movf	((c:__tdiv_to_l_@f2)),c,w
	subwf	((c:__tdiv_to_l_@f1)),c
	movf	((c:__tdiv_to_l_@f2+1)),c,w
	subwfb	((c:__tdiv_to_l_@f1+1)),c
	movf	((c:__tdiv_to_l_@f2+2)),c,w
	subwfb	((c:__tdiv_to_l_@f1+2)),c

	line	82
	
l2306:
	bsf	(0+(0/8)+(c:__tdiv_to_l_@quot)),c,(0)&7
	line	83
	
l693:
	line	84
	bcf	status,0
	rlcf	((c:__tdiv_to_l_@f1)),c
	rlcf	((c:__tdiv_to_l_@f1+1)),c
	rlcf	((c:__tdiv_to_l_@f1+2)),c
	line	85
	
l2308:
	decfsz	((c:__tdiv_to_l_@cntr)),c
	
	goto	l692
	goto	l2310
	
l694:
	line	86
	
l2310:
	btfsc	((c:__tdiv_to_l_@exp1)),c,7
	goto	u2290
	goto	u2291

u2291:
	goto	l2322
u2290:
	line	87
	
l2312:
		movf	((c:__tdiv_to_l_@exp1)),c,w
	xorlw	80h
	addlw	-(80h^-23)
	btfsc	status,0
	goto	u2301
	goto	u2300

u2301:
	goto	l2318
u2300:
	line	88
	
l2314:
	movlw	low(0)
	movwf	((c:?__tdiv_to_l_)),c
	movlw	high(0)
	movwf	((c:?__tdiv_to_l_+1)),c
	movlw	low highword(0)
	movwf	((c:?__tdiv_to_l_+2)),c
	movlw	high highword(0)
	movwf	((c:?__tdiv_to_l_+3)),c
	goto	l690
	
l2316:
	goto	l690
	
l696:
	goto	l2318
	line	89
	
l697:
	line	90
	
l2318:
	bcf	status,0
	rrcf	((c:__tdiv_to_l_@quot+3)),c
	rrcf	((c:__tdiv_to_l_@quot+2)),c
	rrcf	((c:__tdiv_to_l_@quot+1)),c
	rrcf	((c:__tdiv_to_l_@quot)),c
	line	91
	
l2320:
	incfsz	((c:__tdiv_to_l_@exp1)),c
	
	goto	l2318
	goto	l699
	
l698:
	line	92
	goto	l699
	
l695:
	line	93
	
l2322:
		movlw	018h-1
	cpfsgt	((c:__tdiv_to_l_@exp1)),c
	goto	u2311
	goto	u2310

u2311:
	goto	l2330
u2310:
	line	94
	
l2324:
	movlw	low(0)
	movwf	((c:?__tdiv_to_l_)),c
	movlw	high(0)
	movwf	((c:?__tdiv_to_l_+1)),c
	movlw	low highword(0)
	movwf	((c:?__tdiv_to_l_+2)),c
	movlw	high highword(0)
	movwf	((c:?__tdiv_to_l_+3)),c
	goto	l690
	
l2326:
	goto	l690
	
l700:
	line	95
	goto	l2330
	
l702:
	line	96
	
l2328:
	bcf	status,0
	rlcf	((c:__tdiv_to_l_@quot)),c
	rlcf	((c:__tdiv_to_l_@quot+1)),c
	rlcf	((c:__tdiv_to_l_@quot+2)),c
	rlcf	((c:__tdiv_to_l_@quot+3)),c
	line	97
	decf	((c:__tdiv_to_l_@exp1)),c
	goto	l2330
	line	98
	
l701:
	line	95
	
l2330:
	movf	((c:__tdiv_to_l_@exp1)),c,w
	btfss	status,2
	goto	u2321
	goto	u2320
u2321:
	goto	l2328
u2320:
	goto	l699
	
l703:
	line	99
	
l699:
	line	100
	movff	(c:__tdiv_to_l_@quot),(c:?__tdiv_to_l_)
	movff	(c:__tdiv_to_l_@quot+1),(c:?__tdiv_to_l_+1)
	movff	(c:__tdiv_to_l_@quot+2),(c:?__tdiv_to_l_+2)
	movff	(c:__tdiv_to_l_@quot+3),(c:?__tdiv_to_l_+3)
	line	101
	
l690:
	return	;funcret
	opt stack 0
GLOBAL	__end_of__tdiv_to_l_
	__end_of__tdiv_to_l_:
	signat	__tdiv_to_l_,8316
	global	__div_to_l_

;; *************** function __div_to_l_ *****************
;; Defined at:
;;		line 60 in file "D:\Program Files (x86)\Microchip\xc8\v1.34\sources\common\fldivl.c"
;; Parameters:    Size  Location     Type
;;  f1              3    0[COMRAM] unsigned long 
;;  f2              3    3[COMRAM] unsigned long 
;; Auto vars:     Size  Location     Type
;;  quot            4    6[COMRAM] unsigned long 
;;  exp1            1   11[COMRAM] unsigned char 
;;  cntr            1   10[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;                  4    0[COMRAM] unsigned long 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         6       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         6       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:        12       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:       12 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_printf
;; This function uses a non-reentrant model
;;
psect	text9,class=CODE,space=0,reloc=2
	file	"D:\Program Files (x86)\Microchip\xc8\v1.34\sources\common\fldivl.c"
	line	60
global __ptext9
__ptext9:
psect	text9
	file	"D:\Program Files (x86)\Microchip\xc8\v1.34\sources\common\fldivl.c"
	line	60
	global	__size_of__div_to_l_
	__size_of__div_to_l_	equ	__end_of__div_to_l_-__div_to_l_
	
__div_to_l_:
;incstack = 0
	opt	stack 29
	line	66
	
l2332:
	rlcf	(2+((c:__div_to_l_@f1))),c,w
	rlcf	(3+((c:__div_to_l_@f1))),c,w
	movwf	((c:__div_to_l_@exp1)),c
	movf	((c:__div_to_l_@exp1)),c,w
	btfss	status,2
	goto	u2331
	goto	u2330
u2331:
	goto	l2338
u2330:
	line	67
	
l2334:
	movlw	low(0)
	movwf	((c:?__div_to_l_)),c
	movlw	high(0)
	movwf	((c:?__div_to_l_+1)),c
	movlw	low highword(0)
	movwf	((c:?__div_to_l_+2)),c
	movlw	high highword(0)
	movwf	((c:?__div_to_l_+3)),c
	goto	l569
	
l2336:
	goto	l569
	
l568:
	line	68
	
l2338:
	rlcf	(2+((c:__div_to_l_@f2))),c,w
	rlcf	(3+((c:__div_to_l_@f2))),c,w
	movwf	((c:__div_to_l_@cntr)),c
	movf	((c:__div_to_l_@cntr)),c,w
	btfss	status,2
	goto	u2341
	goto	u2340
u2341:
	goto	l2344
u2340:
	line	69
	
l2340:
	movlw	low(0)
	movwf	((c:?__div_to_l_)),c
	movlw	high(0)
	movwf	((c:?__div_to_l_+1)),c
	movlw	low highword(0)
	movwf	((c:?__div_to_l_+2)),c
	movlw	high highword(0)
	movwf	((c:?__div_to_l_+3)),c
	goto	l569
	
l2342:
	goto	l569
	
l570:
	line	70
	
l2344:
	bsf	(0+(23/8)+0+((c:__div_to_l_@f1))),c,(23)&7
	line	71
	
l2346:
	movlw	0FFh
	andwf	(0+((c:__div_to_l_@f1))),c
	movlw	0FFh
	andwf	(1+((c:__div_to_l_@f1))),c
	movlw	0FFh
	andwf	(2+((c:__div_to_l_@f1))),c
	movlw	0
	andwf	(3+((c:__div_to_l_@f1))),c
	line	72
	
l2348:
	bsf	(0+(23/8)+0+((c:__div_to_l_@f2))),c,(23)&7
	line	73
	movlw	0FFh
	andwf	(0+((c:__div_to_l_@f2))),c
	movlw	0FFh
	andwf	(1+((c:__div_to_l_@f2))),c
	movlw	0FFh
	andwf	(2+((c:__div_to_l_@f2))),c
	movlw	0
	andwf	(3+((c:__div_to_l_@f2))),c
	line	74
	
l2350:
	movlw	low(0)
	movwf	((c:__div_to_l_@quot)),c
	movlw	high(0)
	movwf	((c:__div_to_l_@quot+1)),c
	movlw	low highword(0)
	movwf	((c:__div_to_l_@quot+2)),c
	movlw	high highword(0)
	movwf	((c:__div_to_l_@quot+3)),c
	line	75
	
l2352:
	movlw	(07Fh)&0ffh
	subwf	((c:__div_to_l_@exp1)),c
	line	76
	
l2354:
	movf	((c:__div_to_l_@cntr)),c,w
	addlw	low(0A0h)
	subwf	((c:__div_to_l_@exp1)),c
	line	77
	
l2356:
	movlw	low(020h)
	movwf	((c:__div_to_l_@cntr)),c
	goto	l2358
	line	78
	
l571:
	line	79
	
l2358:
	bcf	status,0
	rlcf	((c:__div_to_l_@quot)),c
	rlcf	((c:__div_to_l_@quot+1)),c
	rlcf	((c:__div_to_l_@quot+2)),c
	rlcf	((c:__div_to_l_@quot+3)),c
	line	80
	
l2360:
		movf	(0+((c:__div_to_l_@f2))),c,w
	subwf	(0+((c:__div_to_l_@f1))),c,w
	movf	(1+((c:__div_to_l_@f2))),c,w
	subwfb	(1+((c:__div_to_l_@f1))),c,w
	movf	(2+((c:__div_to_l_@f2))),c,w
	subwfb	(2+((c:__div_to_l_@f1))),c,w
	movf	(3+((c:__div_to_l_@f2))),c,w
	subwfb	(3+((c:__div_to_l_@f1))),c,w
	btfss	status,0
	goto	u2351
	goto	u2350

u2351:
	goto	l2366
u2350:
	line	81
	
l2362:
	movf	(0+((c:__div_to_l_@f2))),c,w
	subwf	(0+((c:__div_to_l_@f1))),c
	movf	(1+((c:__div_to_l_@f2))),c,w
	subwfb	(1+((c:__div_to_l_@f1))),c
	movf	(2+((c:__div_to_l_@f2))),c,w
	subwfb	(2+((c:__div_to_l_@f1))),c
	movf	(3+((c:__div_to_l_@f2))),c,w
	subwfb	(3+((c:__div_to_l_@f1))),c
	line	82
	
l2364:
	bsf	(0+(0/8)+(c:__div_to_l_@quot)),c,(0)&7
	goto	l2366
	line	83
	
l572:
	line	84
	
l2366:
	bcf	status,0
	rlcf	(0+((c:__div_to_l_@f1))),c
	rlcf	(1+((c:__div_to_l_@f1))),c
	rlcf	(2+((c:__div_to_l_@f1))),c
	rlcf	(3+((c:__div_to_l_@f1))),c
	line	85
	
l2368:
	decfsz	((c:__div_to_l_@cntr)),c
	
	goto	l2358
	goto	l2370
	
l573:
	line	86
	
l2370:
	btfsc	((c:__div_to_l_@exp1)),c,7
	goto	u2360
	goto	u2361

u2361:
	goto	l2382
u2360:
	line	87
	
l2372:
		movf	((c:__div_to_l_@exp1)),c,w
	xorlw	80h
	addlw	-(80h^-31)
	btfsc	status,0
	goto	u2371
	goto	u2370

u2371:
	goto	l2378
u2370:
	line	88
	
l2374:
	movlw	low(0)
	movwf	((c:?__div_to_l_)),c
	movlw	high(0)
	movwf	((c:?__div_to_l_+1)),c
	movlw	low highword(0)
	movwf	((c:?__div_to_l_+2)),c
	movlw	high highword(0)
	movwf	((c:?__div_to_l_+3)),c
	goto	l569
	
l2376:
	goto	l569
	
l575:
	goto	l2378
	line	89
	
l576:
	line	90
	
l2378:
	bcf	status,0
	rrcf	((c:__div_to_l_@quot+3)),c
	rrcf	((c:__div_to_l_@quot+2)),c
	rrcf	((c:__div_to_l_@quot+1)),c
	rrcf	((c:__div_to_l_@quot)),c
	line	91
	
l2380:
	incfsz	((c:__div_to_l_@exp1)),c
	
	goto	l2378
	goto	l578
	
l577:
	line	92
	goto	l578
	
l574:
	line	93
	
l2382:
		movlw	020h-1
	cpfsgt	((c:__div_to_l_@exp1)),c
	goto	u2381
	goto	u2380

u2381:
	goto	l2390
u2380:
	line	94
	
l2384:
	movlw	low(0)
	movwf	((c:?__div_to_l_)),c
	movlw	high(0)
	movwf	((c:?__div_to_l_+1)),c
	movlw	low highword(0)
	movwf	((c:?__div_to_l_+2)),c
	movlw	high highword(0)
	movwf	((c:?__div_to_l_+3)),c
	goto	l569
	
l2386:
	goto	l569
	
l579:
	line	95
	goto	l2390
	
l581:
	line	96
	
l2388:
	bcf	status,0
	rlcf	((c:__div_to_l_@quot)),c
	rlcf	((c:__div_to_l_@quot+1)),c
	rlcf	((c:__div_to_l_@quot+2)),c
	rlcf	((c:__div_to_l_@quot+3)),c
	line	97
	decf	((c:__div_to_l_@exp1)),c
	goto	l2390
	line	98
	
l580:
	line	95
	
l2390:
	movf	((c:__div_to_l_@exp1)),c,w
	btfss	status,2
	goto	u2391
	goto	u2390
u2391:
	goto	l2388
u2390:
	goto	l578
	
l582:
	line	99
	
l578:
	line	100
	movff	(c:__div_to_l_@quot),(c:?__div_to_l_)
	movff	(c:__div_to_l_@quot+1),(c:?__div_to_l_+1)
	movff	(c:__div_to_l_@quot+2),(c:?__div_to_l_+2)
	movff	(c:__div_to_l_@quot+3),(c:?__div_to_l_+3)
	line	101
	
l569:
	return	;funcret
	opt stack 0
GLOBAL	__end_of__div_to_l_
	__end_of__div_to_l_:
	signat	__div_to_l_,8316
	global	___lltoft

;; *************** function ___lltoft *****************
;; Defined at:
;;		line 35 in file "D:\Program Files (x86)\Microchip\xc8\v1.34\sources\common\lltoft.c"
;; Parameters:    Size  Location     Type
;;  c               4    8[COMRAM] unsigned long 
;; Auto vars:     Size  Location     Type
;;  exp             1   16[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;                  3    8[COMRAM] float 
;; Registers used:
;;		wreg, status,2, status,0, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         4       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         1       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          4       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         9       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        9 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		___ftpack
;; This function is called by:
;;		_printf
;; This function uses a non-reentrant model
;;
psect	text10,class=CODE,space=0,reloc=2
	file	"D:\Program Files (x86)\Microchip\xc8\v1.34\sources\common\lltoft.c"
	line	35
global __ptext10
__ptext10:
psect	text10
	file	"D:\Program Files (x86)\Microchip\xc8\v1.34\sources\common\lltoft.c"
	line	35
	global	__size_of___lltoft
	__size_of___lltoft	equ	__end_of___lltoft-___lltoft
	
___lltoft:
;incstack = 0
	opt	stack 28
	line	38
	
l2506:
	movlw	low(08Eh)
	movwf	((c:___lltoft@exp)),c
	line	41
	goto	l2510
	
l802:
	line	42
	
l2508:
	bcf	status,0
	rrcf	((c:___lltoft@c+3)),c
	rrcf	((c:___lltoft@c+2)),c
	rrcf	((c:___lltoft@c+1)),c
	rrcf	((c:___lltoft@c)),c
	line	43
	incf	((c:___lltoft@exp)),c
	goto	l2510
	line	44
	
l801:
	line	41
	
l2510:
	movlw	0
	andwf	((c:___lltoft@c)),c,w
	movwf	(??___lltoft+0+0)&0ffh,c
	movlw	0
	andwf	((c:___lltoft@c+1)),c,w
	movwf	1+(??___lltoft+0+0)&0ffh,c
	
	movlw	0
	andwf	((c:___lltoft@c+2)),c,w
	movwf	2+(??___lltoft+0+0)&0ffh,c
	
	movlw	0FFh
	andwf	((c:___lltoft@c+3)),c,w
	movwf	3+(??___lltoft+0+0)&0ffh,c
	movf	(??___lltoft+0+0),c,w
iorwf	(??___lltoft+0+1),c,w
iorwf	(??___lltoft+0+2),c,w
iorwf	(??___lltoft+0+3),c,w
	btfss	status,2
	goto	u2591
	goto	u2590

u2591:
	goto	l2508
u2590:
	goto	l2512
	
l803:
	line	45
	
l2512:
	movff	(c:___lltoft@c),(c:___ftpack@arg)
	movff	(c:___lltoft@c+1),(c:___ftpack@arg+1)
	movff	(c:___lltoft@c+2),(c:___ftpack@arg+2)
	movff	(c:___lltoft@exp),(c:___ftpack@exp)
	movlw	low(0)
	movwf	((c:___ftpack@sign)),c
	call	___ftpack	;wreg free
	movff	0+?___ftpack,(c:?___lltoft)
	movff	1+?___ftpack,(c:?___lltoft+1)
	movff	2+?___ftpack,(c:?___lltoft+2)
	goto	l804
	
l2514:
	line	46
	
l804:
	return	;funcret
	opt stack 0
GLOBAL	__end_of___lltoft
	__end_of___lltoft:
	signat	___lltoft,4219
	global	___llmod

;; *************** function ___llmod *****************
;; Defined at:
;;		line 8 in file "D:\Program Files (x86)\Microchip\xc8\v1.34\sources\common\llmod.c"
;; Parameters:    Size  Location     Type
;;  dividend        4   13[COMRAM] unsigned long 
;;  divisor         4   17[COMRAM] unsigned long 
;; Auto vars:     Size  Location     Type
;;  counter         1   21[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;                  4   13[COMRAM] unsigned long 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         8       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         1       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         9       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        9 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_printf
;; This function uses a non-reentrant model
;;
psect	text11,class=CODE,space=0,reloc=2
	file	"D:\Program Files (x86)\Microchip\xc8\v1.34\sources\common\llmod.c"
	line	8
global __ptext11
__ptext11:
psect	text11
	file	"D:\Program Files (x86)\Microchip\xc8\v1.34\sources\common\llmod.c"
	line	8
	global	__size_of___llmod
	__size_of___llmod	equ	__end_of___llmod-___llmod
	
___llmod:
;incstack = 0
	opt	stack 29
	line	13
	
l2490:
	movf	((c:___llmod@divisor)),c,w
iorwf	((c:___llmod@divisor+1)),c,w
iorwf	((c:___llmod@divisor+2)),c,w
iorwf	((c:___llmod@divisor+3)),c,w
	btfsc	status,2
	goto	u2561
	goto	u2560

u2561:
	goto	l784
u2560:
	line	14
	
l2492:
	movlw	low(01h)
	movwf	((c:___llmod@counter)),c
	line	15
	goto	l2496
	
l786:
	line	16
	
l2494:
	bcf	status,0
	rlcf	((c:___llmod@divisor)),c
	rlcf	((c:___llmod@divisor+1)),c
	rlcf	((c:___llmod@divisor+2)),c
	rlcf	((c:___llmod@divisor+3)),c
	line	17
	incf	((c:___llmod@counter)),c
	goto	l2496
	line	18
	
l785:
	line	15
	
l2496:
	
	btfss	((c:___llmod@divisor+3)),c,(31)&7
	goto	u2571
	goto	u2570
u2571:
	goto	l2494
u2570:
	goto	l2498
	
l787:
	goto	l2498
	line	19
	
l788:
	line	20
	
l2498:
		movf	((c:___llmod@divisor)),c,w
	subwf	((c:___llmod@dividend)),c,w
	movf	((c:___llmod@divisor+1)),c,w
	subwfb	((c:___llmod@dividend+1)),c,w
	movf	((c:___llmod@divisor+2)),c,w
	subwfb	((c:___llmod@dividend+2)),c,w
	movf	((c:___llmod@divisor+3)),c,w
	subwfb	((c:___llmod@dividend+3)),c,w
	btfss	status,0
	goto	u2581
	goto	u2580

u2581:
	goto	l2502
u2580:
	line	21
	
l2500:
	movf	((c:___llmod@divisor)),c,w
	subwf	((c:___llmod@dividend)),c
	movf	((c:___llmod@divisor+1)),c,w
	subwfb	((c:___llmod@dividend+1)),c
	movf	((c:___llmod@divisor+2)),c,w
	subwfb	((c:___llmod@dividend+2)),c
	movf	((c:___llmod@divisor+3)),c,w
	subwfb	((c:___llmod@dividend+3)),c
	goto	l2502
	
l789:
	line	22
	
l2502:
	bcf	status,0
	rrcf	((c:___llmod@divisor+3)),c
	rrcf	((c:___llmod@divisor+2)),c
	rrcf	((c:___llmod@divisor+1)),c
	rrcf	((c:___llmod@divisor)),c
	line	23
	
l2504:
	decfsz	((c:___llmod@counter)),c
	
	goto	l2498
	goto	l784
	
l790:
	line	24
	
l784:
	line	25
	movff	(c:___llmod@dividend),(c:?___llmod)
	movff	(c:___llmod@dividend+1),(c:?___llmod+1)
	movff	(c:___llmod@dividend+2),(c:?___llmod+2)
	movff	(c:___llmod@dividend+3),(c:?___llmod+3)
	line	26
	
l791:
	return	;funcret
	opt stack 0
GLOBAL	__end_of___llmod
	__end_of___llmod:
	signat	___llmod,8316
	global	___lldiv

;; *************** function ___lldiv *****************
;; Defined at:
;;		line 8 in file "D:\Program Files (x86)\Microchip\xc8\v1.34\sources\common\lldiv.c"
;; Parameters:    Size  Location     Type
;;  dividend        4    0[COMRAM] unsigned long 
;;  divisor         4    4[COMRAM] unsigned long 
;; Auto vars:     Size  Location     Type
;;  quotient        4    8[COMRAM] unsigned long 
;;  counter         1   12[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;                  4    0[COMRAM] unsigned long 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         8       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         5       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:        13       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:       13 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_printf
;; This function uses a non-reentrant model
;;
psect	text12,class=CODE,space=0,reloc=2
	file	"D:\Program Files (x86)\Microchip\xc8\v1.34\sources\common\lldiv.c"
	line	8
global __ptext12
__ptext12:
psect	text12
	file	"D:\Program Files (x86)\Microchip\xc8\v1.34\sources\common\lldiv.c"
	line	8
	global	__size_of___lldiv
	__size_of___lldiv	equ	__end_of___lldiv-___lldiv
	
___lldiv:
;incstack = 0
	opt	stack 29
	line	14
	
l2468:
	movlw	low(0)
	movwf	((c:___lldiv@quotient)),c
	movlw	high(0)
	movwf	((c:___lldiv@quotient+1)),c
	movlw	low highword(0)
	movwf	((c:___lldiv@quotient+2)),c
	movlw	high highword(0)
	movwf	((c:___lldiv@quotient+3)),c
	line	15
	
l2470:
	movf	((c:___lldiv@divisor)),c,w
iorwf	((c:___lldiv@divisor+1)),c,w
iorwf	((c:___lldiv@divisor+2)),c,w
iorwf	((c:___lldiv@divisor+3)),c,w
	btfsc	status,2
	goto	u2531
	goto	u2530

u2531:
	goto	l774
u2530:
	line	16
	
l2472:
	movlw	low(01h)
	movwf	((c:___lldiv@counter)),c
	line	17
	goto	l2476
	
l776:
	line	18
	
l2474:
	bcf	status,0
	rlcf	((c:___lldiv@divisor)),c
	rlcf	((c:___lldiv@divisor+1)),c
	rlcf	((c:___lldiv@divisor+2)),c
	rlcf	((c:___lldiv@divisor+3)),c
	line	19
	incf	((c:___lldiv@counter)),c
	goto	l2476
	line	20
	
l775:
	line	17
	
l2476:
	
	btfss	((c:___lldiv@divisor+3)),c,(31)&7
	goto	u2541
	goto	u2540
u2541:
	goto	l2474
u2540:
	goto	l2478
	
l777:
	goto	l2478
	line	21
	
l778:
	line	22
	
l2478:
	bcf	status,0
	rlcf	((c:___lldiv@quotient)),c
	rlcf	((c:___lldiv@quotient+1)),c
	rlcf	((c:___lldiv@quotient+2)),c
	rlcf	((c:___lldiv@quotient+3)),c
	line	23
	
l2480:
		movf	((c:___lldiv@divisor)),c,w
	subwf	((c:___lldiv@dividend)),c,w
	movf	((c:___lldiv@divisor+1)),c,w
	subwfb	((c:___lldiv@dividend+1)),c,w
	movf	((c:___lldiv@divisor+2)),c,w
	subwfb	((c:___lldiv@dividend+2)),c,w
	movf	((c:___lldiv@divisor+3)),c,w
	subwfb	((c:___lldiv@dividend+3)),c,w
	btfss	status,0
	goto	u2551
	goto	u2550

u2551:
	goto	l2486
u2550:
	line	24
	
l2482:
	movf	((c:___lldiv@divisor)),c,w
	subwf	((c:___lldiv@dividend)),c
	movf	((c:___lldiv@divisor+1)),c,w
	subwfb	((c:___lldiv@dividend+1)),c
	movf	((c:___lldiv@divisor+2)),c,w
	subwfb	((c:___lldiv@dividend+2)),c
	movf	((c:___lldiv@divisor+3)),c,w
	subwfb	((c:___lldiv@dividend+3)),c
	line	25
	
l2484:
	bsf	(0+(0/8)+(c:___lldiv@quotient)),c,(0)&7
	goto	l2486
	line	26
	
l779:
	line	27
	
l2486:
	bcf	status,0
	rrcf	((c:___lldiv@divisor+3)),c
	rrcf	((c:___lldiv@divisor+2)),c
	rrcf	((c:___lldiv@divisor+1)),c
	rrcf	((c:___lldiv@divisor)),c
	line	28
	
l2488:
	decfsz	((c:___lldiv@counter)),c
	
	goto	l2478
	goto	l774
	
l780:
	line	29
	
l774:
	line	30
	movff	(c:___lldiv@quotient),(c:?___lldiv)
	movff	(c:___lldiv@quotient+1),(c:?___lldiv+1)
	movff	(c:___lldiv@quotient+2),(c:?___lldiv+2)
	movff	(c:___lldiv@quotient+3),(c:?___lldiv+3)
	line	31
	
l781:
	return	;funcret
	opt stack 0
GLOBAL	__end_of___lldiv
	__end_of___lldiv:
	signat	___lldiv,8316
	global	___fttol

;; *************** function ___fttol *****************
;; Defined at:
;;		line 44 in file "D:\Program Files (x86)\Microchip\xc8\v1.34\sources\common\fttol.c"
;; Parameters:    Size  Location     Type
;;  f1              3   42[COMRAM] float 
;; Auto vars:     Size  Location     Type
;;  lval            4   52[COMRAM] unsigned long 
;;  exp1            1   56[COMRAM] unsigned char 
;;  sign1           1   51[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;                  4   42[COMRAM] long 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         4       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         6       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          5       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:        15       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:       15 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;;		_printf
;; This function uses a non-reentrant model
;;
psect	text13,class=CODE,space=0,reloc=2
	file	"D:\Program Files (x86)\Microchip\xc8\v1.34\sources\common\fttol.c"
	line	44
global __ptext13
__ptext13:
psect	text13
	file	"D:\Program Files (x86)\Microchip\xc8\v1.34\sources\common\fttol.c"
	line	44
	global	__size_of___fttol
	__size_of___fttol	equ	__end_of___fttol-___fttol
	
___fttol:
;incstack = 0
	opt	stack 29
	line	49
	
l2422:
	movff	(c:___fttol@f1+2),??___fttol+0+0
	clrf	(??___fttol+0+0+1)&0ffh,c
	clrf	(??___fttol+0+0+2)&0ffh,c
	rlcf	((c:___fttol@f1+1)),c,w
	rlcf	(??___fttol+0+0)&0ffh,c
	bnc	u2451
	bsf	(??___fttol+0+0+1)&0ffh,c,0
u2451:
	movf	(??___fttol+0+0),c,w
	movwf	((c:___fttol@exp1)),c
	movf	((c:___fttol@exp1)),c,w
	btfss	status,2
	goto	u2461
	goto	u2460
u2461:
	goto	l2428
u2460:
	line	50
	
l2424:
	movlw	low(0)
	movwf	((c:?___fttol)),c
	movlw	high(0)
	movwf	((c:?___fttol+1)),c
	movlw	low highword(0)
	movwf	((c:?___fttol+2)),c
	movlw	high highword(0)
	movwf	((c:?___fttol+3)),c
	goto	l735
	
l2426:
	goto	l735
	
l734:
	line	51
	
l2428:
	movlw	(017h)&0ffh
	movwf	(??___fttol+0+0)&0ffh,c
	movff	(c:___fttol@f1),??___fttol+1+0
	movff	(c:___fttol@f1+1),??___fttol+1+0+1
	movff	(c:___fttol@f1+2),??___fttol+1+0+2
	incf	((??___fttol+0+0)),c,w
	movwf	(??___fttol+4+0)&0ffh,c
	goto	u2470
u2475:
	bcf	status,0
	rrcf	(??___fttol+1+2),c
	rrcf	(??___fttol+1+1),c
	rrcf	(??___fttol+1+0),c
u2470:
	decfsz	(??___fttol+4+0)&0ffh,c
	goto	u2475
	movf	(??___fttol+1+0),c,w
	movwf	((c:___fttol@sign1)),c
	line	52
	
l2430:
	bsf	(0+(15/8)+(c:___fttol@f1)),c,(15)&7
	line	53
	
l2432:
	movlw	low(0FFFFh)
	andwf	((c:___fttol@f1)),c
	movlw	high(0FFFFh)
	andwf	((c:___fttol@f1+1)),c
	movlw	low highword(0FFFFh)
	andwf	((c:___fttol@f1+2)),c

	line	54
	
l2434:
	movf	((c:___fttol@f1)),c,w
	movwf	((c:___fttol@lval)),c
	movf	((c:___fttol@f1+1)),c,w
	movwf	1+((c:___fttol@lval)),c
	
	movf	((c:___fttol@f1+2)),c,w
	movwf	2+((c:___fttol@lval)),c
	
	clrf	3+((c:___fttol@lval)),c
	line	55
	
l2436:
	movlw	(08Eh)&0ffh
	subwf	((c:___fttol@exp1)),c
	line	56
	
l2438:
	btfsc	((c:___fttol@exp1)),c,7
	goto	u2480
	goto	u2481

u2481:
	goto	l2450
u2480:
	line	57
	
l2440:
		movf	((c:___fttol@exp1)),c,w
	xorlw	80h
	addlw	-(80h^-15)
	btfsc	status,0
	goto	u2491
	goto	u2490

u2491:
	goto	l2446
u2490:
	line	58
	
l2442:
	movlw	low(0)
	movwf	((c:?___fttol)),c
	movlw	high(0)
	movwf	((c:?___fttol+1)),c
	movlw	low highword(0)
	movwf	((c:?___fttol+2)),c
	movlw	high highword(0)
	movwf	((c:?___fttol+3)),c
	goto	l735
	
l2444:
	goto	l735
	
l737:
	goto	l2446
	line	59
	
l738:
	line	60
	
l2446:
	bcf	status,0
	rrcf	((c:___fttol@lval+3)),c
	rrcf	((c:___fttol@lval+2)),c
	rrcf	((c:___fttol@lval+1)),c
	rrcf	((c:___fttol@lval)),c
	line	61
	
l2448:
	incfsz	((c:___fttol@exp1)),c
	
	goto	l2446
	goto	l2460
	
l739:
	line	62
	goto	l2460
	
l736:
	line	63
	
l2450:
		movlw	018h-1
	cpfsgt	((c:___fttol@exp1)),c
	goto	u2501
	goto	u2500

u2501:
	goto	l2458
u2500:
	line	64
	
l2452:
	movlw	low(0)
	movwf	((c:?___fttol)),c
	movlw	high(0)
	movwf	((c:?___fttol+1)),c
	movlw	low highword(0)
	movwf	((c:?___fttol+2)),c
	movlw	high highword(0)
	movwf	((c:?___fttol+3)),c
	goto	l735
	
l2454:
	goto	l735
	
l741:
	line	65
	goto	l2458
	
l743:
	line	66
	
l2456:
	bcf	status,0
	rlcf	((c:___fttol@lval)),c
	rlcf	((c:___fttol@lval+1)),c
	rlcf	((c:___fttol@lval+2)),c
	rlcf	((c:___fttol@lval+3)),c
	line	67
	decf	((c:___fttol@exp1)),c
	goto	l2458
	line	68
	
l742:
	line	65
	
l2458:
	movf	((c:___fttol@exp1)),c,w
	btfss	status,2
	goto	u2511
	goto	u2510
u2511:
	goto	l2456
u2510:
	goto	l2460
	
l744:
	goto	l2460
	line	69
	
l740:
	line	70
	
l2460:
	movf	((c:___fttol@sign1)),c,w
	btfsc	status,2
	goto	u2521
	goto	u2520
u2521:
	goto	l2464
u2520:
	line	71
	
l2462:
	comf	((c:___fttol@lval+3)),c
	comf	((c:___fttol@lval+2)),c
	comf	((c:___fttol@lval+1)),c
	negf	((c:___fttol@lval)),c
	movlw	0
	addwfc	((c:___fttol@lval+1)),c
	addwfc	((c:___fttol@lval+2)),c
	addwfc	((c:___fttol@lval+3)),c
	goto	l2464
	
l745:
	line	72
	
l2464:
	movff	(c:___fttol@lval),(c:?___fttol)
	movff	(c:___fttol@lval+1),(c:?___fttol+1)
	movff	(c:___fttol@lval+2),(c:?___fttol+2)
	movff	(c:___fttol@lval+3),(c:?___fttol+3)
	goto	l735
	
l2466:
	line	73
	
l735:
	return	;funcret
	opt stack 0
GLOBAL	__end_of___fttol
	__end_of___fttol:
	signat	___fttol,4220
	global	___ftsub

;; *************** function ___ftsub *****************
;; Defined at:
;;		line 20 in file "D:\Program Files (x86)\Microchip\xc8\v1.34\sources\common\ftsub.c"
;; Parameters:    Size  Location     Type
;;  f1              3   57[COMRAM] float 
;;  f2              3   60[COMRAM] float 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  3   57[COMRAM] float 
;; Registers used:
;;		wreg, status,2, status,0, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         6       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         6       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		___ftadd
;; This function is called by:
;;		_printf
;; This function uses a non-reentrant model
;;
psect	text14,class=CODE,space=0,reloc=2
	file	"D:\Program Files (x86)\Microchip\xc8\v1.34\sources\common\ftsub.c"
	line	20
global __ptext14
__ptext14:
psect	text14
	file	"D:\Program Files (x86)\Microchip\xc8\v1.34\sources\common\ftsub.c"
	line	20
	global	__size_of___ftsub
	__size_of___ftsub	equ	__end_of___ftsub-___ftsub
	
___ftsub:
;incstack = 0
	opt	stack 27
	line	23
	
l2392:
	movf	((c:___ftsub@f2)),c,w
iorwf	((c:___ftsub@f2+1)),c,w
iorwf	((c:___ftsub@f2+2)),c,w
	btfsc	status,2
	goto	u2401
	goto	u2400

u2401:
	goto	l2396
u2400:
	line	24
	
l2394:
	movlw	low(0800000h)
	xorwf	((c:___ftsub@f2)),c
	movlw	high(0800000h)
	xorwf	((c:___ftsub@f2+1)),c
	movlw	low highword(0800000h)
	xorwf	((c:___ftsub@f2+2)),c

	goto	l2396
	line	25
	
l730:
	line	26
	
l2396:
	movff	(c:___ftsub@f1),(c:___ftadd@f1)
	movff	(c:___ftsub@f1+1),(c:___ftadd@f1+1)
	movff	(c:___ftsub@f1+2),(c:___ftadd@f1+2)
	movff	(c:___ftsub@f2),(c:___ftadd@f2)
	movff	(c:___ftsub@f2+1),(c:___ftadd@f2+1)
	movff	(c:___ftsub@f2+2),(c:___ftadd@f2+2)
	call	___ftadd	;wreg free
	movff	0+?___ftadd,(c:?___ftsub)
	movff	1+?___ftadd,(c:?___ftsub+1)
	movff	2+?___ftadd,(c:?___ftsub+2)
	goto	l731
	
l2398:
	line	27
	
l731:
	return	;funcret
	opt stack 0
GLOBAL	__end_of___ftsub
	__end_of___ftsub:
	signat	___ftsub,8315
	global	___ftadd

;; *************** function ___ftadd *****************
;; Defined at:
;;		line 86 in file "D:\Program Files (x86)\Microchip\xc8\v1.34\sources\common\ftadd.c"
;; Parameters:    Size  Location     Type
;;  f1              3   45[COMRAM] float 
;;  f2              3   48[COMRAM] float 
;; Auto vars:     Size  Location     Type
;;  exp1            1   56[COMRAM] unsigned char 
;;  exp2            1   55[COMRAM] unsigned char 
;;  sign            1   54[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;                  3   45[COMRAM] float 
;; Registers used:
;;		wreg, status,2, status,0, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         6       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         3       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          3       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:        12       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:       12 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		___ftpack
;; This function is called by:
;;		_main
;;		_printf
;;		___ftsub
;; This function uses a non-reentrant model
;;
psect	text15,class=CODE,space=0,reloc=2
	file	"D:\Program Files (x86)\Microchip\xc8\v1.34\sources\common\ftadd.c"
	line	86
global __ptext15
__ptext15:
psect	text15
	file	"D:\Program Files (x86)\Microchip\xc8\v1.34\sources\common\ftadd.c"
	line	86
	global	__size_of___ftadd
	__size_of___ftadd	equ	__end_of___ftadd-___ftadd
	
___ftadd:
;incstack = 0
	opt	stack 27
	line	90
	
l1964:
	movff	(c:___ftadd@f1+2),??___ftadd+0+0
	clrf	(??___ftadd+0+0+1)&0ffh,c
	clrf	(??___ftadd+0+0+2)&0ffh,c
	rlcf	((c:___ftadd@f1+1)),c,w
	rlcf	(??___ftadd+0+0)&0ffh,c
	bnc	u1671
	bsf	(??___ftadd+0+0+1)&0ffh,c,0
u1671:
	movf	(??___ftadd+0+0),c,w
	movwf	((c:___ftadd@exp1)),c
	line	91
	movff	(c:___ftadd@f2+2),??___ftadd+0+0
	clrf	(??___ftadd+0+0+1)&0ffh,c
	clrf	(??___ftadd+0+0+2)&0ffh,c
	rlcf	((c:___ftadd@f2+1)),c,w
	rlcf	(??___ftadd+0+0)&0ffh,c
	bnc	u1681
	bsf	(??___ftadd+0+0+1)&0ffh,c,0
u1681:
	movf	(??___ftadd+0+0),c,w
	movwf	((c:___ftadd@exp2)),c
	line	92
	
l1966:
	movf	((c:___ftadd@exp1)),c,w
	btfsc	status,2
	goto	u1691
	goto	u1690
u1691:
	goto	l650
u1690:
	
l1968:
		movf	((c:___ftadd@exp2)),c,w
	subwf	((c:___ftadd@exp1)),c,w
	btfsc	status,0
	goto	u1701
	goto	u1700

u1701:
	goto	l1972
u1700:
	
l1970:
	movf	((c:___ftadd@exp1)),c,w
	sublw	0
	addwf	((c:___ftadd@exp2)),c,w
	movwf	(??___ftadd+0+0)&0ffh,c
		movlw	019h-1
	cpfsgt	((??___ftadd+0+0)),c
	goto	u1711
	goto	u1710

u1711:
	goto	l1972
u1710:
	
l650:
	line	93
	movff	(c:___ftadd@f2),(c:?___ftadd)
	movff	(c:___ftadd@f2+1),(c:?___ftadd+1)
	movff	(c:___ftadd@f2+2),(c:?___ftadd+2)
	goto	l651
	
l648:
	line	94
	
l1972:
	movf	((c:___ftadd@exp2)),c,w
	btfsc	status,2
	goto	u1721
	goto	u1720
u1721:
	goto	l654
u1720:
	
l1974:
		movf	((c:___ftadd@exp1)),c,w
	subwf	((c:___ftadd@exp2)),c,w
	btfsc	status,0
	goto	u1731
	goto	u1730

u1731:
	goto	l1978
u1730:
	
l1976:
	movf	((c:___ftadd@exp2)),c,w
	sublw	0
	addwf	((c:___ftadd@exp1)),c,w
	movwf	(??___ftadd+0+0)&0ffh,c
		movlw	019h-1
	cpfsgt	((??___ftadd+0+0)),c
	goto	u1741
	goto	u1740

u1741:
	goto	l1978
u1740:
	
l654:
	line	95
	movff	(c:___ftadd@f1),(c:?___ftadd)
	movff	(c:___ftadd@f1+1),(c:?___ftadd+1)
	movff	(c:___ftadd@f1+2),(c:?___ftadd+2)
	goto	l651
	
l652:
	line	96
	
l1978:
	movlw	low(06h)
	movwf	((c:___ftadd@sign)),c
	line	97
	
l1980:
	
	btfss	((c:___ftadd@f1+2)),c,(23)&7
	goto	u1751
	goto	u1750
u1751:
	goto	l1984
u1750:
	line	98
	
l1982:
	bsf	(0+(7/8)+(c:___ftadd@sign)),c,(7)&7
	goto	l1984
	
l655:
	line	99
	
l1984:
	
	btfss	((c:___ftadd@f2+2)),c,(23)&7
	goto	u1761
	goto	u1760
u1761:
	goto	l656
u1760:
	line	100
	
l1986:
	bsf	(0+(6/8)+(c:___ftadd@sign)),c,(6)&7
	
l656:
	line	101
	bsf	(0+(15/8)+(c:___ftadd@f1)),c,(15)&7
	line	102
	
l1988:
	movlw	low(0FFFFh)
	andwf	((c:___ftadd@f1)),c
	movlw	high(0FFFFh)
	andwf	((c:___ftadd@f1+1)),c
	movlw	low highword(0FFFFh)
	andwf	((c:___ftadd@f1+2)),c

	line	103
	bsf	(0+(15/8)+(c:___ftadd@f2)),c,(15)&7
	line	104
	
l1990:
	movlw	low(0FFFFh)
	andwf	((c:___ftadd@f2)),c
	movlw	high(0FFFFh)
	andwf	((c:___ftadd@f2+1)),c
	movlw	low highword(0FFFFh)
	andwf	((c:___ftadd@f2+2)),c

	line	106
	
l1992:
		movf	((c:___ftadd@exp2)),c,w
	subwf	((c:___ftadd@exp1)),c,w
	btfsc	status,0
	goto	u1771
	goto	u1770

u1771:
	goto	l2004
u1770:
	goto	l1994
	line	109
	
l658:
	line	110
	
l1994:
	bcf	status,0
	rlcf	((c:___ftadd@f2)),c
	rlcf	((c:___ftadd@f2+1)),c
	rlcf	((c:___ftadd@f2+2)),c
	line	111
	decf	((c:___ftadd@exp2)),c
	line	112
	
l1996:
	movf	((c:___ftadd@exp1)),c,w
xorwf	((c:___ftadd@exp2)),c,w
	btfsc	status,2
	goto	u1781
	goto	u1780

u1781:
	goto	l2002
u1780:
	
l1998:
	decf	((c:___ftadd@sign)),c
	movff	(c:___ftadd@sign),??___ftadd+0+0
	movlw	07h
	andwf	(??___ftadd+0+0),c
	btfss	status,2
	goto	u1791
	goto	u1790
u1791:
	goto	l1994
u1790:
	goto	l2002
	
l660:
	goto	l2002
	
l661:
	line	113
	goto	l2002
	
l663:
	line	114
	
l2000:
	bcf	status,0
	rrcf	((c:___ftadd@f1+2)),c
	rrcf	((c:___ftadd@f1+1)),c
	rrcf	((c:___ftadd@f1)),c
	line	115
	incf	((c:___ftadd@exp1)),c
	goto	l2002
	line	116
	
l662:
	line	113
	
l2002:
	movf	((c:___ftadd@exp2)),c,w
xorwf	((c:___ftadd@exp1)),c,w
	btfss	status,2
	goto	u1801
	goto	u1800

u1801:
	goto	l2000
u1800:
	goto	l665
	
l664:
	line	117
	goto	l665
	
l657:
	
l2004:
		movf	((c:___ftadd@exp1)),c,w
	subwf	((c:___ftadd@exp2)),c,w
	btfsc	status,0
	goto	u1811
	goto	u1810

u1811:
	goto	l665
u1810:
	goto	l2006
	line	120
	
l667:
	line	121
	
l2006:
	bcf	status,0
	rlcf	((c:___ftadd@f1)),c
	rlcf	((c:___ftadd@f1+1)),c
	rlcf	((c:___ftadd@f1+2)),c
	line	122
	decf	((c:___ftadd@exp1)),c
	line	123
	
l2008:
	movf	((c:___ftadd@exp1)),c,w
xorwf	((c:___ftadd@exp2)),c,w
	btfsc	status,2
	goto	u1821
	goto	u1820

u1821:
	goto	l2014
u1820:
	
l2010:
	decf	((c:___ftadd@sign)),c
	movff	(c:___ftadd@sign),??___ftadd+0+0
	movlw	07h
	andwf	(??___ftadd+0+0),c
	btfss	status,2
	goto	u1831
	goto	u1830
u1831:
	goto	l2006
u1830:
	goto	l2014
	
l669:
	goto	l2014
	
l670:
	line	124
	goto	l2014
	
l672:
	line	125
	
l2012:
	bcf	status,0
	rrcf	((c:___ftadd@f2+2)),c
	rrcf	((c:___ftadd@f2+1)),c
	rrcf	((c:___ftadd@f2)),c
	line	126
	incf	((c:___ftadd@exp2)),c
	goto	l2014
	line	127
	
l671:
	line	124
	
l2014:
	movf	((c:___ftadd@exp2)),c,w
xorwf	((c:___ftadd@exp1)),c,w
	btfss	status,2
	goto	u1841
	goto	u1840

u1841:
	goto	l2012
u1840:
	goto	l665
	
l673:
	goto	l665
	line	128
	
l666:
	line	129
	
l665:
	
	btfss	((c:___ftadd@sign)),c,(7)&7
	goto	u1851
	goto	u1850
u1851:
	goto	l674
u1850:
	line	131
	
l2016:
	movlw	low(0FFFFFFh)
	xorwf	((c:___ftadd@f1)),c
	movlw	high(0FFFFFFh)
	xorwf	((c:___ftadd@f1+1)),c
	movlw	low highword(0FFFFFFh)
	xorwf	((c:___ftadd@f1+2)),c

	line	132
	movlw	low(01h)
	addwf	((c:___ftadd@f1)),c
	movlw	high(01h)
	addwfc	((c:___ftadd@f1+1)),c
	movlw	low highword(01h)
	addwfc	((c:___ftadd@f1+2)),c

	line	133
	
l674:
	line	134
	
	btfss	((c:___ftadd@sign)),c,(6)&7
	goto	u1861
	goto	u1860
u1861:
	goto	l2020
u1860:
	line	136
	
l2018:
	movlw	low(0FFFFFFh)
	xorwf	((c:___ftadd@f2)),c
	movlw	high(0FFFFFFh)
	xorwf	((c:___ftadd@f2+1)),c
	movlw	low highword(0FFFFFFh)
	xorwf	((c:___ftadd@f2+2)),c

	line	137
	movlw	low(01h)
	addwf	((c:___ftadd@f2)),c
	movlw	high(01h)
	addwfc	((c:___ftadd@f2+1)),c
	movlw	low highword(01h)
	addwfc	((c:___ftadd@f2+2)),c

	goto	l2020
	line	138
	
l675:
	line	139
	
l2020:
	movlw	low(0)
	movwf	((c:___ftadd@sign)),c
	line	140
	
l2022:
	movf	((c:___ftadd@f1)),c,w
	addwf	((c:___ftadd@f2)),c
	movf	((c:___ftadd@f1+1)),c,w
	addwfc	((c:___ftadd@f2+1)),c
	movf	((c:___ftadd@f1+2)),c,w
	addwfc	((c:___ftadd@f2+2)),c

	line	141
	
l2024:
	
	btfss	((c:___ftadd@f2+2)),c,(23)&7
	goto	u1871
	goto	u1870
u1871:
	goto	l2030
u1870:
	line	142
	
l2026:
	movlw	low(0FFFFFFh)
	xorwf	((c:___ftadd@f2)),c
	movlw	high(0FFFFFFh)
	xorwf	((c:___ftadd@f2+1)),c
	movlw	low highword(0FFFFFFh)
	xorwf	((c:___ftadd@f2+2)),c

	line	143
	movlw	low(01h)
	addwf	((c:___ftadd@f2)),c
	movlw	high(01h)
	addwfc	((c:___ftadd@f2+1)),c
	movlw	low highword(01h)
	addwfc	((c:___ftadd@f2+2)),c

	line	144
	
l2028:
	movlw	low(01h)
	movwf	((c:___ftadd@sign)),c
	goto	l2030
	line	145
	
l676:
	line	146
	
l2030:
	movff	(c:___ftadd@f2),(c:___ftpack@arg)
	movff	(c:___ftadd@f2+1),(c:___ftpack@arg+1)
	movff	(c:___ftadd@f2+2),(c:___ftpack@arg+2)
	movff	(c:___ftadd@exp1),(c:___ftpack@exp)
	movff	(c:___ftadd@sign),(c:___ftpack@sign)
	call	___ftpack	;wreg free
	movff	0+?___ftpack,(c:?___ftadd)
	movff	1+?___ftpack,(c:?___ftadd+1)
	movff	2+?___ftpack,(c:?___ftadd+2)
	goto	l651
	
l2032:
	line	148
	
l651:
	return	;funcret
	opt stack 0
GLOBAL	__end_of___ftadd
	__end_of___ftadd:
	signat	___ftadd,8315
	global	___ftneg

;; *************** function ___ftneg *****************
;; Defined at:
;;		line 15 in file "D:\Program Files (x86)\Microchip\xc8\v1.34\sources\common\ftneg.c"
;; Parameters:    Size  Location     Type
;;  f1              3    0[COMRAM] float 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  3    0[COMRAM] float 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         3       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         3       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;;		_printf
;; This function uses a non-reentrant model
;;
psect	text16,class=CODE,space=0,reloc=2
	file	"D:\Program Files (x86)\Microchip\xc8\v1.34\sources\common\ftneg.c"
	line	15
global __ptext16
__ptext16:
psect	text16
	file	"D:\Program Files (x86)\Microchip\xc8\v1.34\sources\common\ftneg.c"
	line	15
	global	__size_of___ftneg
	__size_of___ftneg	equ	__end_of___ftneg-___ftneg
	
___ftneg:
;incstack = 0
	opt	stack 29
	line	17
	
l2418:
	movf	((c:___ftneg@f1)),c,w
iorwf	((c:___ftneg@f1+1)),c,w
iorwf	((c:___ftneg@f1+2)),c,w
	btfsc	status,2
	goto	u2441
	goto	u2440

u2441:
	goto	l724
u2440:
	line	18
	
l2420:
	movlw	low(0800000h)
	xorwf	((c:___ftneg@f1)),c
	movlw	high(0800000h)
	xorwf	((c:___ftneg@f1+1)),c
	movlw	low highword(0800000h)
	xorwf	((c:___ftneg@f1+2)),c

	
l724:
	line	19
	movff	(c:___ftneg@f1),(c:?___ftneg)
	movff	(c:___ftneg@f1+1),(c:?___ftneg+1)
	movff	(c:___ftneg@f1+2),(c:?___ftneg+2)
	line	20
	
l725:
	return	;funcret
	opt stack 0
GLOBAL	__end_of___ftneg
	__end_of___ftneg:
	signat	___ftneg,4219
	global	___ftge

;; *************** function ___ftge *****************
;; Defined at:
;;		line 4 in file "D:\Program Files (x86)\Microchip\xc8\v1.34\sources\common\ftge.c"
;; Parameters:    Size  Location     Type
;;  ff1             3    0[COMRAM] float 
;;  ff2             3    3[COMRAM] float 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         6       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          3       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         9       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        9 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_printf
;; This function uses a non-reentrant model
;;
psect	text17,class=CODE,space=0,reloc=2
	file	"D:\Program Files (x86)\Microchip\xc8\v1.34\sources\common\ftge.c"
	line	4
global __ptext17
__ptext17:
psect	text17
	file	"D:\Program Files (x86)\Microchip\xc8\v1.34\sources\common\ftge.c"
	line	4
	global	__size_of___ftge
	__size_of___ftge	equ	__end_of___ftge-___ftge
	
___ftge:
;incstack = 0
	opt	stack 29
	line	6
	
l2400:
	
	btfss	((c:___ftge@ff1+2)),c,(23)&7
	goto	u2411
	goto	u2410
u2411:
	goto	l2404
u2410:
	line	7
	
l2402:
	movff	(c:___ftge@ff1),??___ftge+0+0
	movff	(c:___ftge@ff1+1),??___ftge+0+0+1
	movff	(c:___ftge@ff1+2),??___ftge+0+0+2
	comf	(??___ftge+0+0),c
	comf	(??___ftge+0+1),c
	comf	(??___ftge+0+2),c
	incf	(??___ftge+0+0),c
	movlw	0
	addwfc	(??___ftge+0+1),c
	addwfc	(??___ftge+0+2),c

	movlw	low(0800000h)
	addwf	(??___ftge+0+0),c,w
	movwf	((c:___ftge@ff1)),c
	movlw	0
	addwfc	(??___ftge+0+1),c,w
	movwf	1+((c:___ftge@ff1)),c
	
	movlw	080h
	addwfc	(??___ftge+0+2),c,w
	movwf	2+((c:___ftge@ff1)),c
	goto	l2404
	
l706:
	line	8
	
l2404:
	
	btfss	((c:___ftge@ff2+2)),c,(23)&7
	goto	u2421
	goto	u2420
u2421:
	goto	l2408
u2420:
	line	9
	
l2406:
	movff	(c:___ftge@ff2),??___ftge+0+0
	movff	(c:___ftge@ff2+1),??___ftge+0+0+1
	movff	(c:___ftge@ff2+2),??___ftge+0+0+2
	comf	(??___ftge+0+0),c
	comf	(??___ftge+0+1),c
	comf	(??___ftge+0+2),c
	incf	(??___ftge+0+0),c
	movlw	0
	addwfc	(??___ftge+0+1),c
	addwfc	(??___ftge+0+2),c

	movlw	low(0800000h)
	addwf	(??___ftge+0+0),c,w
	movwf	((c:___ftge@ff2)),c
	movlw	0
	addwfc	(??___ftge+0+1),c,w
	movwf	1+((c:___ftge@ff2)),c
	
	movlw	080h
	addwfc	(??___ftge+0+2),c,w
	movwf	2+((c:___ftge@ff2)),c
	goto	l2408
	
l707:
	line	10
	
l2408:
	movlw	low(0800000h)
	xorwf	((c:___ftge@ff1)),c
	movlw	high(0800000h)
	xorwf	((c:___ftge@ff1+1)),c
	movlw	low highword(0800000h)
	xorwf	((c:___ftge@ff1+2)),c

	line	11
	
l2410:
	movlw	low(0800000h)
	xorwf	((c:___ftge@ff2)),c
	movlw	high(0800000h)
	xorwf	((c:___ftge@ff2+1)),c
	movlw	low highword(0800000h)
	xorwf	((c:___ftge@ff2+2)),c

	line	12
		movf	((c:___ftge@ff2)),c,w
	subwf	((c:___ftge@ff1)),c,w
	movf	((c:___ftge@ff2+1)),c,w
	subwfb	((c:___ftge@ff1+1)),c,w
	movf	((c:___ftge@ff2+2)),c,w
	subwfb	((c:___ftge@ff1+2)),c,w
	btfsc	status,0
	goto	u2431
	goto	u2430

u2431:
	goto	l2414
u2430:
	
l2412:
	bcf	status,0
	goto	l708
	
l1918:
	
l2414:
	bsf	status,0
	goto	l708
	
l1920:
	goto	l708
	
l2416:
	line	13
	
l708:
	return	;funcret
	opt stack 0
GLOBAL	__end_of___ftge
	__end_of___ftge:
	signat	___ftge,8312
	global	___ftdiv

;; *************** function ___ftdiv *****************
;; Defined at:
;;		line 54 in file "D:\Program Files (x86)\Microchip\xc8\v1.34\sources\common\ftdiv.c"
;; Parameters:    Size  Location     Type
;;  f1              3   57[COMRAM] float 
;;  f2              3   60[COMRAM] float 
;; Auto vars:     Size  Location     Type
;;  f3              3   67[COMRAM] float 
;;  sign            1   71[COMRAM] unsigned char 
;;  exp             1   70[COMRAM] unsigned char 
;;  cntr            1   66[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;                  3   57[COMRAM] float 
;; Registers used:
;;		wreg, status,2, status,0, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         6       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         6       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          3       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:        15       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:       15 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		___ftpack
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text18,class=CODE,space=0,reloc=2
	file	"D:\Program Files (x86)\Microchip\xc8\v1.34\sources\common\ftdiv.c"
	line	54
global __ptext18
__ptext18:
psect	text18
	file	"D:\Program Files (x86)\Microchip\xc8\v1.34\sources\common\ftdiv.c"
	line	54
	global	__size_of___ftdiv
	__size_of___ftdiv	equ	__end_of___ftdiv-___ftdiv
	
___ftdiv:
;incstack = 0
	opt	stack 29
	line	63
	
l2766:
	movff	(c:___ftdiv@f1+2),??___ftdiv+0+0
	clrf	(??___ftdiv+0+0+1)&0ffh,c
	clrf	(??___ftdiv+0+0+2)&0ffh,c
	rlcf	((c:___ftdiv@f1+1)),c,w
	rlcf	(??___ftdiv+0+0)&0ffh,c
	bnc	u3081
	bsf	(??___ftdiv+0+0+1)&0ffh,c,0
u3081:
	movf	(??___ftdiv+0+0),c,w
	movwf	((c:___ftdiv@exp)),c
	movf	((c:___ftdiv@exp)),c,w
	btfss	status,2
	goto	u3091
	goto	u3090
u3091:
	goto	l2772
u3090:
	line	64
	
l2768:
	movlw	low(float24(0.0000000000000000))
	movwf	((c:?___ftdiv)),c
	movlw	high(float24(0.0000000000000000))
	movwf	((c:?___ftdiv+1)),c
	movlw	low highword(float24(0.0000000000000000))
	movwf	((c:?___ftdiv+2)),c

	goto	l682
	
l2770:
	goto	l682
	
l681:
	line	65
	
l2772:
	movff	(c:___ftdiv@f2+2),??___ftdiv+0+0
	clrf	(??___ftdiv+0+0+1)&0ffh,c
	clrf	(??___ftdiv+0+0+2)&0ffh,c
	rlcf	((c:___ftdiv@f2+1)),c,w
	rlcf	(??___ftdiv+0+0)&0ffh,c
	bnc	u3101
	bsf	(??___ftdiv+0+0+1)&0ffh,c,0
u3101:
	movf	(??___ftdiv+0+0),c,w
	movwf	((c:___ftdiv@sign)),c
	movf	((c:___ftdiv@sign)),c,w
	btfss	status,2
	goto	u3111
	goto	u3110
u3111:
	goto	l2778
u3110:
	line	66
	
l2774:
	movlw	low(float24(0.0000000000000000))
	movwf	((c:?___ftdiv)),c
	movlw	high(float24(0.0000000000000000))
	movwf	((c:?___ftdiv+1)),c
	movlw	low highword(float24(0.0000000000000000))
	movwf	((c:?___ftdiv+2)),c

	goto	l682
	
l2776:
	goto	l682
	
l683:
	line	67
	
l2778:
	movlw	low(0)
	movwf	((c:___ftdiv@f3)),c
	movlw	high(0)
	movwf	((c:___ftdiv@f3+1)),c
	movlw	low highword(0)
	movwf	((c:___ftdiv@f3+2)),c

	line	68
	
l2780:
	movf	((c:___ftdiv@sign)),c,w
	addlw	low(089h)
	subwf	((c:___ftdiv@exp)),c
	line	69
	
l2782:
	movff	0+2+(c:___ftdiv@f1),(c:___ftdiv@sign)
	line	70
	
l2784:
	movf	(0+2+(c:___ftdiv@f2)),c,w
	xorwf	((c:___ftdiv@sign)),c
	line	71
	
l2786:
	movlw	(080h)&0ffh
	andwf	((c:___ftdiv@sign)),c
	line	72
	
l2788:
	bsf	(0+(15/8)+(c:___ftdiv@f1)),c,(15)&7
	line	73
	
l2790:
	movlw	low(0FFFFh)
	andwf	((c:___ftdiv@f1)),c
	movlw	high(0FFFFh)
	andwf	((c:___ftdiv@f1+1)),c
	movlw	low highword(0FFFFh)
	andwf	((c:___ftdiv@f1+2)),c

	line	74
	
l2792:
	bsf	(0+(15/8)+(c:___ftdiv@f2)),c,(15)&7
	line	75
	
l2794:
	movlw	low(0FFFFh)
	andwf	((c:___ftdiv@f2)),c
	movlw	high(0FFFFh)
	andwf	((c:___ftdiv@f2+1)),c
	movlw	low highword(0FFFFh)
	andwf	((c:___ftdiv@f2+2)),c

	line	76
	
l2796:
	movlw	low(018h)
	movwf	((c:___ftdiv@cntr)),c
	goto	l2798
	line	77
	
l684:
	line	78
	
l2798:
	bcf	status,0
	rlcf	((c:___ftdiv@f3)),c
	rlcf	((c:___ftdiv@f3+1)),c
	rlcf	((c:___ftdiv@f3+2)),c
	line	79
	
l2800:
		movf	((c:___ftdiv@f2)),c,w
	subwf	((c:___ftdiv@f1)),c,w
	movf	((c:___ftdiv@f2+1)),c,w
	subwfb	((c:___ftdiv@f1+1)),c,w
	movf	((c:___ftdiv@f2+2)),c,w
	subwfb	((c:___ftdiv@f1+2)),c,w
	btfss	status,0
	goto	u3121
	goto	u3120

u3121:
	goto	l685
u3120:
	line	80
	
l2802:
	movf	((c:___ftdiv@f2)),c,w
	subwf	((c:___ftdiv@f1)),c
	movf	((c:___ftdiv@f2+1)),c,w
	subwfb	((c:___ftdiv@f1+1)),c
	movf	((c:___ftdiv@f2+2)),c,w
	subwfb	((c:___ftdiv@f1+2)),c

	line	81
	
l2804:
	bsf	(0+(0/8)+(c:___ftdiv@f3)),c,(0)&7
	line	82
	
l685:
	line	83
	bcf	status,0
	rlcf	((c:___ftdiv@f1)),c
	rlcf	((c:___ftdiv@f1+1)),c
	rlcf	((c:___ftdiv@f1+2)),c
	line	84
	
l2806:
	decfsz	((c:___ftdiv@cntr)),c
	
	goto	l2798
	goto	l2808
	
l686:
	line	85
	
l2808:
	movff	(c:___ftdiv@f3),(c:___ftpack@arg)
	movff	(c:___ftdiv@f3+1),(c:___ftpack@arg+1)
	movff	(c:___ftdiv@f3+2),(c:___ftpack@arg+2)
	movff	(c:___ftdiv@exp),(c:___ftpack@exp)
	movff	(c:___ftdiv@sign),(c:___ftpack@sign)
	call	___ftpack	;wreg free
	movff	0+?___ftpack,(c:?___ftdiv)
	movff	1+?___ftpack,(c:?___ftdiv+1)
	movff	2+?___ftpack,(c:?___ftdiv+2)
	goto	l682
	
l2810:
	line	86
	
l682:
	return	;funcret
	opt stack 0
GLOBAL	__end_of___ftdiv
	__end_of___ftdiv:
	signat	___ftdiv,8315
	global	___awtoft

;; *************** function ___awtoft *****************
;; Defined at:
;;		line 32 in file "D:\Program Files (x86)\Microchip\xc8\v1.34\sources\common\awtoft.c"
;; Parameters:    Size  Location     Type
;;  c               2    8[COMRAM] int 
;; Auto vars:     Size  Location     Type
;;  sign            1   11[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;                  3    8[COMRAM] float 
;; Registers used:
;;		wreg, status,2, status,0, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         3       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         1       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         4       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		___ftpack
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text19,class=CODE,space=0,reloc=2
	file	"D:\Program Files (x86)\Microchip\xc8\v1.34\sources\common\awtoft.c"
	line	32
global __ptext19
__ptext19:
psect	text19
	file	"D:\Program Files (x86)\Microchip\xc8\v1.34\sources\common\awtoft.c"
	line	32
	global	__size_of___awtoft
	__size_of___awtoft	equ	__end_of___awtoft-___awtoft
	
___awtoft:
;incstack = 0
	opt	stack 29
	line	36
	
l2812:
	movlw	low(0)
	movwf	((c:___awtoft@sign)),c
	line	37
	
l2814:
	btfsc	((c:___awtoft@c+1)),c,7
	goto	u3130
	goto	u3131

u3131:
	goto	l2820
u3130:
	line	38
	
l2816:
	negf	((c:___awtoft@c)),c
	comf	((c:___awtoft@c+1)),c
	btfsc	status,0
	incf	((c:___awtoft@c+1)),c
	line	39
	
l2818:
	movlw	low(01h)
	movwf	((c:___awtoft@sign)),c
	goto	l2820
	line	40
	
l502:
	line	41
	
l2820:
	movff	(c:___awtoft@c),(c:___ftpack@arg)
	movff	(c:___awtoft@c+1),(c:___ftpack@arg+1)
	clrf	((c:___ftpack@arg+2)),c
	movlw	low(08Eh)
	movwf	((c:___ftpack@exp)),c
	movff	(c:___awtoft@sign),(c:___ftpack@sign)
	call	___ftpack	;wreg free
	movff	0+?___ftpack,(c:?___awtoft)
	movff	1+?___ftpack,(c:?___awtoft+1)
	movff	2+?___ftpack,(c:?___awtoft+2)
	goto	l503
	
l2822:
	line	42
	
l503:
	return	;funcret
	opt stack 0
GLOBAL	__end_of___awtoft
	__end_of___awtoft:
	signat	___awtoft,4219
	global	___ftpack

;; *************** function ___ftpack *****************
;; Defined at:
;;		line 62 in file "D:\Program Files (x86)\Microchip\xc8\v1.34\sources\common\float.c"
;; Parameters:    Size  Location     Type
;;  arg             3    0[COMRAM] unsigned um
;;  exp             1    3[COMRAM] unsigned char 
;;  sign            1    4[COMRAM] unsigned char 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  3    0[COMRAM] float 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         5       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          3       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         8       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        8 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		___awtoft
;;		___ftadd
;;		___ftdiv
;;		___ftmul
;;		___lltoft
;; This function uses a non-reentrant model
;;
psect	text20,class=CODE,space=0,reloc=2
	file	"D:\Program Files (x86)\Microchip\xc8\v1.34\sources\common\float.c"
	line	62
global __ptext20
__ptext20:
psect	text20
	file	"D:\Program Files (x86)\Microchip\xc8\v1.34\sources\common\float.c"
	line	62
	global	__size_of___ftpack
	__size_of___ftpack	equ	__end_of___ftpack-___ftpack
	
___ftpack:
;incstack = 0
	opt	stack 27
	line	64
	
l1922:
	movf	((c:___ftpack@exp)),c,w
	btfsc	status,2
	goto	u1591
	goto	u1590
u1591:
	goto	l1926
u1590:
	
l1924:
	movf	((c:___ftpack@arg)),c,w
iorwf	((c:___ftpack@arg+1)),c,w
iorwf	((c:___ftpack@arg+2)),c,w
	btfss	status,2
	goto	u1601
	goto	u1600

u1601:
	goto	l1932
u1600:
	goto	l1926
	
l609:
	line	65
	
l1926:
	movlw	low(float24(0.0000000000000000))
	movwf	((c:?___ftpack)),c
	movlw	high(float24(0.0000000000000000))
	movwf	((c:?___ftpack+1)),c
	movlw	low highword(float24(0.0000000000000000))
	movwf	((c:?___ftpack+2)),c

	goto	l610
	
l1928:
	goto	l610
	
l607:
	line	66
	goto	l1932
	
l612:
	line	67
	
l1930:
	incf	((c:___ftpack@exp)),c
	line	68
	bcf	status,0
	rrcf	((c:___ftpack@arg+2)),c
	rrcf	((c:___ftpack@arg+1)),c
	rrcf	((c:___ftpack@arg)),c
	goto	l1932
	line	69
	
l611:
	line	66
	
l1932:
	movlw	low(0FE0000h)
	andwf	((c:___ftpack@arg)),c,w
	movwf	(??___ftpack+0+0)&0ffh,c
	movlw	0
	andwf	((c:___ftpack@arg+1)),c,w
	movwf	1+(??___ftpack+0+0)&0ffh,c
	
	movlw	0FEh
	andwf	((c:___ftpack@arg+2)),c,w
	movwf	2+(??___ftpack+0+0)&0ffh,c

	movf	(??___ftpack+0+0),c,w
iorwf	(??___ftpack+0+1),c,w
iorwf	(??___ftpack+0+2),c,w
	btfss	status,2
	goto	u1611
	goto	u1610

u1611:
	goto	l1930
u1610:
	goto	l1938
	
l613:
	line	70
	goto	l1938
	
l615:
	line	71
	
l1934:
	incf	((c:___ftpack@exp)),c
	line	72
	
l1936:
	movlw	low(01h)
	addwf	((c:___ftpack@arg)),c
	movlw	high(01h)
	addwfc	((c:___ftpack@arg+1)),c
	movlw	low highword(01h)
	addwfc	((c:___ftpack@arg+2)),c

	line	73
	bcf	status,0
	rrcf	((c:___ftpack@arg+2)),c
	rrcf	((c:___ftpack@arg+1)),c
	rrcf	((c:___ftpack@arg)),c
	goto	l1938
	line	74
	
l614:
	line	70
	
l1938:
	movlw	low(0FF0000h)
	andwf	((c:___ftpack@arg)),c,w
	movwf	(??___ftpack+0+0)&0ffh,c
	movlw	0
	andwf	((c:___ftpack@arg+1)),c,w
	movwf	1+(??___ftpack+0+0)&0ffh,c
	
	movlw	0FFh
	andwf	((c:___ftpack@arg+2)),c,w
	movwf	2+(??___ftpack+0+0)&0ffh,c

	movf	(??___ftpack+0+0),c,w
iorwf	(??___ftpack+0+1),c,w
iorwf	(??___ftpack+0+2),c,w
	btfss	status,2
	goto	u1621
	goto	u1620

u1621:
	goto	l1934
u1620:
	goto	l1942
	
l616:
	line	75
	goto	l1942
	
l618:
	line	76
	
l1940:
	decf	((c:___ftpack@exp)),c
	line	77
	bcf	status,0
	rlcf	((c:___ftpack@arg)),c
	rlcf	((c:___ftpack@arg+1)),c
	rlcf	((c:___ftpack@arg+2)),c
	goto	l1942
	line	78
	
l617:
	line	75
	
l1942:
	
	btfsc	((c:___ftpack@arg+1)),c,(15)&7
	goto	u1631
	goto	u1630
u1631:
	goto	l621
u1630:
	
l1944:
		movlw	02h-0
	cpfslt	((c:___ftpack@exp)),c
	goto	u1641
	goto	u1640

u1641:
	goto	l1940
u1640:
	goto	l621
	
l620:
	
l621:
	line	79
	
	btfsc	((c:___ftpack@exp)),c,(0)&7
	goto	u1651
	goto	u1650
u1651:
	goto	l1948
u1650:
	line	80
	
l1946:
	bcf	(0+(15/8)+(c:___ftpack@arg)),c,(15)&7
	goto	l1948
	
l622:
	line	81
	
l1948:
	bcf status,0
	rrcf	((c:___ftpack@exp)),c

	line	82
	movf	((c:___ftpack@exp)),c,w
	iorwf	((c:___ftpack@arg+2)),c

	line	83
	
l1950:
	movf	((c:___ftpack@sign)),c,w
	btfsc	status,2
	goto	u1661
	goto	u1660
u1661:
	goto	l1954
u1660:
	line	84
	
l1952:
	bsf	(0+(23/8)+(c:___ftpack@arg)),c,(23)&7
	goto	l1954
	
l623:
	line	85
	
l1954:
	movff	(c:___ftpack@arg),(c:?___ftpack)
	movff	(c:___ftpack@arg+1),(c:?___ftpack+1)
	movff	(c:___ftpack@arg+2),(c:?___ftpack+2)
	goto	l610
	
l1956:
	line	86
	
l610:
	return	;funcret
	opt stack 0
GLOBAL	__end_of___ftpack
	__end_of___ftpack:
	signat	___ftpack,12411
	global	_WAIT_1_SEC

;; *************** function _WAIT_1_SEC *****************
;; Defined at:
;;		line 60 in file "Lab5p6.c"
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
psect	text21,class=CODE,space=0,reloc=2
	file	"Lab5p6.c"
	line	60
global __ptext21
__ptext21:
psect	text21
	file	"Lab5p6.c"
	line	60
	global	__size_of_WAIT_1_SEC
	__size_of_WAIT_1_SEC	equ	__end_of_WAIT_1_SEC-_WAIT_1_SEC
	
_WAIT_1_SEC:
;incstack = 0
	opt	stack 30
	line	62
	
l1528:
	movlw	high(0)
	movwf	((c:WAIT_1_SEC@j+1)),c
	movlw	low(0)
	movwf	((c:WAIT_1_SEC@j)),c
	
l1530:
	btfsc	((c:WAIT_1_SEC@j+1)),c,7
	goto	u1021
	movlw	104
	subwf	 ((c:WAIT_1_SEC@j)),c,w
	movlw	66
	subwfb	((c:WAIT_1_SEC@j+1)),c,w
	btfss	status,0
	goto	u1021
	goto	u1020

u1021:
	goto	l1534
u1020:
	goto	l85
	
l1532:
	goto	l85
	
l83:
	
l1534:
	infsnz	((c:WAIT_1_SEC@j)),c
	incf	((c:WAIT_1_SEC@j+1)),c
	
l1536:
	btfsc	((c:WAIT_1_SEC@j+1)),c,7
	goto	u1031
	movlw	104
	subwf	 ((c:WAIT_1_SEC@j)),c,w
	movlw	66
	subwfb	((c:WAIT_1_SEC@j+1)),c,w
	btfss	status,0
	goto	u1031
	goto	u1030

u1031:
	goto	l1534
u1030:
	goto	l85
	
l84:
	line	63
	
l85:
	return	;funcret
	opt stack 0
GLOBAL	__end_of_WAIT_1_SEC
	__end_of_WAIT_1_SEC:
	signat	_WAIT_1_SEC,88
	global	_Select_ADC_Channel

;; *************** function _Select_ADC_Channel *****************
;; Defined at:
;;		line 41 in file "Lab5p6.c"
;; Parameters:    Size  Location     Type
;;  channel         1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  channel         1    0[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, prodl, prodh
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
psect	text22,class=CODE,space=0,reloc=2
	line	41
global __ptext22
__ptext22:
psect	text22
	file	"Lab5p6.c"
	line	41
	global	__size_of_Select_ADC_Channel
	__size_of_Select_ADC_Channel	equ	__end_of_Select_ADC_Channel-_Select_ADC_Channel
	
_Select_ADC_Channel:
;incstack = 0
	opt	stack 30
	movwf	((c:Select_ADC_Channel@channel)),c
	line	43
	
l1522:
	movf	((c:Select_ADC_Channel@channel)),c,w
	mullw	04h
	incf	(prodl),c,w
	movwf	((c:4034)),c	;volatile
	line	44
	
l71:
	return	;funcret
	opt stack 0
GLOBAL	__end_of_Select_ADC_Channel
	__end_of_Select_ADC_Channel:
	signat	_Select_ADC_Channel,4216
	global	_Init_UART

;; *************** function _Init_UART *****************
;; Defined at:
;;		line 52 in file "Lab5p6.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, cstack
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
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_OpenUSART
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text23,class=CODE,space=0,reloc=2
	line	52
global __ptext23
__ptext23:
psect	text23
	file	"Lab5p6.c"
	line	52
	global	__size_of_Init_UART
	__size_of_Init_UART	equ	__end_of_Init_UART-_Init_UART
	
_Init_UART:
;incstack = 0
	opt	stack 29
	line	56
	
l2516:
	movlw	high(019h)
	movwf	((c:OpenUSART@spbrg+1)),c
	movlw	low(019h)
	movwf	((c:OpenUSART@spbrg)),c
	movlw	(03Ch)&0ffh
	
	call	_OpenUSART
	line	57
	
l2518:
	movlw	low(060h)
	movwf	((c:4051)),c	;volatile
	line	58
	
l80:
	return	;funcret
	opt stack 0
GLOBAL	__end_of_Init_UART
	__end_of_Init_UART:
	signat	_Init_UART,88
	global	_OpenUSART

;; *************** function _OpenUSART *****************
;; Defined at:
;;		line 73 in file "D:\Program Files (x86)\Microchip\xc8\v1.34\sources\pic18\plib\USART\uopen.c"
;; Parameters:    Size  Location     Type
;;  config          1    wreg     unsigned char 
;;  spbrg           2    0[COMRAM] unsigned int 
;; Auto vars:     Size  Location     Type
;;  config          1    2[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         2       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         1       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         3       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_Init_UART
;; This function uses a non-reentrant model
;;
psect	text24,class=CODE,space=0,reloc=2
	file	"D:\Program Files (x86)\Microchip\xc8\v1.34\sources\pic18\plib\USART\uopen.c"
	line	73
global __ptext24
__ptext24:
psect	text24
	file	"D:\Program Files (x86)\Microchip\xc8\v1.34\sources\pic18\plib\USART\uopen.c"
	line	73
	global	__size_of_OpenUSART
	__size_of_OpenUSART	equ	__end_of_OpenUSART-_OpenUSART
	
_OpenUSART:
;incstack = 0
	opt	stack 29
	movwf	((c:OpenUSART@config)),c
	line	75
	
l2166:
	movlw	low(0)
	movwf	((c:4012)),c	;volatile
	line	76
	movlw	low(0)
	movwf	((c:4011)),c	;volatile
	line	78
	
l2168:
	
	btfss	((c:OpenUSART@config)),c,(0)&7
	goto	u2071
	goto	u2070
u2071:
	goto	l2172
u2070:
	line	79
	
l2170:
	bsf	((c:4012)),c,4	;volatile
	goto	l2172
	
l270:
	line	81
	
l2172:
	
	btfss	((c:OpenUSART@config)),c,(1)&7
	goto	u2081
	goto	u2080
u2081:
	goto	l2176
u2080:
	line	83
	
l2174:
	bsf	((c:4012)),c,6	;volatile
	line	84
	bsf	((c:4011)),c,6	;volatile
	goto	l2176
	line	85
	
l271:
	line	87
	
l2176:
	
	btfss	((c:OpenUSART@config)),c,(2)&7
	goto	u2091
	goto	u2090
u2091:
	goto	l2180
u2090:
	line	88
	
l2178:
	bsf	((c:4012)),c,7	;volatile
	goto	l2180
	
l272:
	line	90
	
l2180:
	
	btfss	((c:OpenUSART@config)),c,(3)&7
	goto	u2101
	goto	u2100
u2101:
	goto	l273
u2100:
	line	91
	
l2182:
	bsf	((c:4011)),c,4	;volatile
	goto	l2184
	line	92
	
l273:
	line	93
	bsf	((c:4011)),c,5	;volatile
	goto	l2184
	
l274:
	line	95
	
l2184:
	
	btfss	((c:OpenUSART@config)),c,(4)&7
	goto	u2111
	goto	u2110
u2111:
	goto	l275
u2110:
	line	96
	
l2186:
	bsf	((c:4012)),c,2	;volatile
	
l275:
	line	98
	bcf	((c:3998)),c,4	;volatile
	line	100
	
l2188:
	
	btfss	((c:OpenUSART@config)),c,(5)&7
	goto	u2121
	goto	u2120
u2121:
	goto	l2192
u2120:
	line	101
	
l2190:
	bsf	((c:4011)),c,3	;volatile
	goto	l2192
	
l276:
	line	103
	
l2192:
	
	btfss	((c:OpenUSART@config)),c,(6)&7
	goto	u2131
	goto	u2130
u2131:
	goto	l277
u2130:
	line	104
	
l2194:
	bsf	((c:3997)),c,5	;volatile
	goto	l278
	line	105
	
l277:
	line	106
	bcf	((c:3997)),c,5	;volatile
	
l278:
	line	108
	bcf	((c:3998)),c,5	;volatile
	line	110
	
l2196:
	
	btfss	((c:OpenUSART@config)),c,(7)&7
	goto	u2141
	goto	u2140
u2141:
	goto	l279
u2140:
	line	111
	
l2198:
	bsf	((c:3997)),c,4	;volatile
	goto	l280
	line	112
	
l279:
	line	113
	bcf	((c:3997)),c,4	;volatile
	
l280:
	line	115
	movff	(c:OpenUSART@spbrg),(c:4015)	;volatile
	line	116
	
l2200:
	movf	((c:OpenUSART@spbrg+1)),c,w
	movwf	((c:4016)),c	;volatile
	line	118
	
l2202:
	bsf	((c:4012)),c,5	;volatile
	line	119
	
l2204:
	bsf	((c:4011)),c,7	;volatile
	line	137
	
l2206:
	bcf	((c:3988)),c,6	;volatile
	
l2208:
	bsf	((c:3988)),c,7	;volatile
	line	138
	
l2210:
	btfss	((c:4012)),c,4	;volatile
	goto	u2151
	goto	u2150
u2151:
	goto	l282
u2150:
	
l2212:
	btfsc	((c:4012)),c,7	;volatile
	goto	u2161
	goto	u2160
u2161:
	goto	l282
u2160:
	line	139
	
l2214:
	bsf	((c:3988)),c,6	;volatile
	goto	l282
	
l281:
	line	143
	
l282:
	return	;funcret
	opt stack 0
GLOBAL	__end_of_OpenUSART
	__end_of_OpenUSART:
	signat	_OpenUSART,8312
	global	_Init_TRIS

;; *************** function _Init_TRIS *****************
;; Defined at:
;;		line 104 in file "Lab5p6.c"
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
psect	text25,class=CODE,space=0,reloc=2
	file	"Lab5p6.c"
	line	104
global __ptext25
__ptext25:
psect	text25
	file	"Lab5p6.c"
	line	104
	global	__size_of_Init_TRIS
	__size_of_Init_TRIS	equ	__end_of_Init_TRIS-_Init_TRIS
	
_Init_TRIS:
;incstack = 0
	opt	stack 30
	line	106
	
l1540:
	movlw	low(0Fh)
	movwf	((c:3986)),c	;volatile
	line	107
	movlw	low(0)
	movwf	((c:3987)),c	;volatile
	line	108
	movlw	low(0)
	movwf	((c:3988)),c	;volatile
	line	109
	movlw	low(0)
	movwf	((c:3989)),c	;volatile
	line	110
	movlw	low(0)
	movwf	((c:3990)),c	;volatile
	line	111
	
l96:
	return	;funcret
	opt stack 0
GLOBAL	__end_of_Init_TRIS
	__end_of_Init_TRIS:
	signat	_Init_TRIS,88
	global	_Init_ADC

;; *************** function _Init_ADC *****************
;; Defined at:
;;		line 112 in file "Lab5p6.c"
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
psect	text26,class=CODE,space=0,reloc=2
	line	112
global __ptext26
__ptext26:
psect	text26
	file	"Lab5p6.c"
	line	112
	global	__size_of_Init_ADC
	__size_of_Init_ADC	equ	__end_of_Init_ADC-_Init_ADC
	
_Init_ADC:
;incstack = 0
	opt	stack 30
	line	114
	
l1538:
	movlw	low(01h)
	movwf	((c:4034)),c	;volatile
	line	115
	movlw	low(01Bh)
	movwf	((c:4033)),c	;volatile
	line	116
	movlw	low(0A9h)
	movwf	((c:4032)),c	;volatile
	line	117
	
l99:
	return	;funcret
	opt stack 0
GLOBAL	__end_of_Init_ADC
	__end_of_Init_ADC:
	signat	_Init_ADC,88
	global	_Get_Full_ADC

;; *************** function _Get_Full_ADC *****************
;; Defined at:
;;		line 119 in file "Lab5p6.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  result          2    4[COMRAM] int 
;; Return value:  Size  Location     Type
;;                  2    0[COMRAM] unsigned int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         2       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         2       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          2       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         6       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text27,class=CODE,space=0,reloc=2
	line	119
global __ptext27
__ptext27:
psect	text27
	file	"Lab5p6.c"
	line	119
	global	__size_of_Get_Full_ADC
	__size_of_Get_Full_ADC	equ	__end_of_Get_Full_ADC-_Get_Full_ADC
	
_Get_Full_ADC:
;incstack = 0
	opt	stack 30
	line	122
	
l2520:
	bsf	((c:4034)),c,1	;volatile
	line	123
	goto	l102
	
l103:
	
l102:
	btfsc	((c:4034)),c,1	;volatile
	goto	u2601
	goto	u2600
u2601:
	goto	l102
u2600:
	goto	l2522
	
l104:
	line	124
	
l2522:
	movf	((c:4036)),c,w	;volatile
	movwf	(??_Get_Full_ADC+0+0+1)&0ffh,c
	clrf	(??_Get_Full_ADC+0+0)&0ffh,c
	movf	((c:4035)),c,w	;volatile
	addwf	(??_Get_Full_ADC+0+0),c,w
	movwf	((c:Get_Full_ADC@result)),c
	movlw	0
	addwfc	(??_Get_Full_ADC+0+1),c,w
	movwf	1+((c:Get_Full_ADC@result)),c
	line	126
	
l2524:
	movff	(c:Get_Full_ADC@result),(c:?_Get_Full_ADC)
	movff	(c:Get_Full_ADC@result+1),(c:?_Get_Full_ADC+1)
	goto	l105
	
l2526:
	line	127
	
l105:
	return	;funcret
	opt stack 0
GLOBAL	__end_of_Get_Full_ADC
	__end_of_Get_Full_ADC:
	signat	_Get_Full_ADC,90
	global	_Display_Upper_Digit

;; *************** function _Display_Upper_Digit *****************
;; Defined at:
;;		line 129 in file "Lab5p6.c"
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
psect	text28,class=CODE,space=0,reloc=2
	line	129
global __ptext28
__ptext28:
psect	text28
	file	"Lab5p6.c"
	line	129
	global	__size_of_Display_Upper_Digit
	__size_of_Display_Upper_Digit	equ	__end_of_Display_Upper_Digit-_Display_Upper_Digit
	
_Display_Upper_Digit:
;incstack = 0
	opt	stack 30
	movwf	((c:Display_Upper_Digit@digit)),c
	line	131
	
l1550:
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
	line	132
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
	line	133
	
l1552:
	movf	((c:Display_Upper_Digit@PE)),c,w
	btfss	status,2
	goto	u1051
	goto	u1050
u1051:
	goto	l1556
u1050:
	
l1554:
	movlw	low(0)
	movwf	((c:3972)),c	;volatile
	goto	l110
	line	134
	
l108:
	
l1556:
	movlw	low(03h)
	movwf	((c:3972)),c	;volatile
	goto	l110
	
l109:
	line	135
	
l110:
	return	;funcret
	opt stack 0
GLOBAL	__end_of_Display_Upper_Digit
	__end_of_Display_Upper_Digit:
	signat	_Display_Upper_Digit,4216
	global	_Display_Lower_Digit

;; *************** function _Display_Lower_Digit *****************
;; Defined at:
;;		line 137 in file "Lab5p6.c"
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
psect	text29,class=CODE,space=0,reloc=2
	line	137
global __ptext29
__ptext29:
psect	text29
	file	"Lab5p6.c"
	line	137
	global	__size_of_Display_Lower_Digit
	__size_of_Display_Lower_Digit	equ	__end_of_Display_Lower_Digit-_Display_Lower_Digit
	
_Display_Lower_Digit:
;incstack = 0
	opt	stack 30
	movwf	((c:Display_Lower_Digit@digit)),c
	line	139
	
l1558:
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
	line	140
	
l113:
	return	;funcret
	opt stack 0
GLOBAL	__end_of_Display_Lower_Digit
	__end_of_Display_Lower_Digit:
	signat	_Display_Lower_Digit,4216
	global	_DO_DISPLAY_D3

;; *************** function _DO_DISPLAY_D3 *****************
;; Defined at:
;;		line 189 in file "Lab5p6.c"
;; Parameters:    Size  Location     Type
;;  voltage         2    0[COMRAM] int 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         2       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         2       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_SET_D3_GREEN
;;		_SET_D3_RED
;;		_SET_D3_YELLOW
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text30,class=CODE,space=0,reloc=2
	line	189
global __ptext30
__ptext30:
psect	text30
	file	"Lab5p6.c"
	line	189
	global	__size_of_DO_DISPLAY_D3
	__size_of_DO_DISPLAY_D3	equ	__end_of_DO_DISPLAY_D3-_DO_DISPLAY_D3
	
_DO_DISPLAY_D3:
;incstack = 0
	opt	stack 29
	line	191
	
l2752:
	btfsc	((c:DO_DISPLAY_D3@voltage+1)),c,7
	goto	u3040
	movlw	196
	subwf	 ((c:DO_DISPLAY_D3@voltage)),c,w
	movlw	9
	subwfb	((c:DO_DISPLAY_D3@voltage+1)),c,w
	btfsc	status,0
	goto	u3041
	goto	u3040

u3041:
	goto	l2756
u3040:
	line	193
	
l2754:
	call	_SET_D3_RED	;wreg free
	goto	l2756
	line	194
	
l130:
	line	195
	
l2756:
	btfsc	((c:DO_DISPLAY_D3@voltage+1)),c,7
	goto	u3051
	movlw	196
	subwf	 ((c:DO_DISPLAY_D3@voltage)),c,w
	movlw	9
	subwfb	((c:DO_DISPLAY_D3@voltage+1)),c,w
	btfss	status,0
	goto	u3051
	goto	u3050

u3051:
	goto	l2762
u3050:
	
l2758:
	btfsc	((c:DO_DISPLAY_D3@voltage+1)),c,7
	goto	u3060
	movlw	172
	subwf	 ((c:DO_DISPLAY_D3@voltage)),c,w
	movlw	13
	subwfb	((c:DO_DISPLAY_D3@voltage+1)),c,w
	btfsc	status,0
	goto	u3061
	goto	u3060

u3061:
	goto	l2762
u3060:
	line	197
	
l2760:
	call	_SET_D3_GREEN	;wreg free
	goto	l2762
	line	198
	
l131:
	line	199
	
l2762:
	btfsc	((c:DO_DISPLAY_D3@voltage+1)),c,7
	goto	u3071
	movlw	172
	subwf	 ((c:DO_DISPLAY_D3@voltage)),c,w
	movlw	13
	subwfb	((c:DO_DISPLAY_D3@voltage+1)),c,w
	btfss	status,0
	goto	u3071
	goto	u3070

u3071:
	goto	l133
u3070:
	line	201
	
l2764:
	call	_SET_D3_YELLOW	;wreg free
	goto	l133
	line	202
	
l132:
	line	203
	
l133:
	return	;funcret
	opt stack 0
GLOBAL	__end_of_DO_DISPLAY_D3
	__end_of_DO_DISPLAY_D3:
	signat	_DO_DISPLAY_D3,4216
	global	_SET_D3_YELLOW

;; *************** function _SET_D3_YELLOW *****************
;; Defined at:
;;		line 252 in file "Lab5p6.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		None
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
;;		_DO_DISPLAY_D3
;; This function uses a non-reentrant model
;;
psect	text31,class=CODE,space=0,reloc=2
	line	252
global __ptext31
__ptext31:
psect	text31
	file	"Lab5p6.c"
	line	252
	global	__size_of_SET_D3_YELLOW
	__size_of_SET_D3_YELLOW	equ	__end_of_SET_D3_YELLOW-_SET_D3_YELLOW
	
_SET_D3_YELLOW:
;incstack = 0
	opt	stack 29
	line	254
	
l1220:
	bsf	((c:3968)),c,4	;volatile
	line	255
	bsf	((c:3968)),c,5	;volatile
	line	256
	
l157:
	return	;funcret
	opt stack 0
GLOBAL	__end_of_SET_D3_YELLOW
	__end_of_SET_D3_YELLOW:
	signat	_SET_D3_YELLOW,88
	global	_SET_D3_RED

;; *************** function _SET_D3_RED *****************
;; Defined at:
;;		line 240 in file "Lab5p6.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		None
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
;;		_DO_DISPLAY_D3
;; This function uses a non-reentrant model
;;
psect	text32,class=CODE,space=0,reloc=2
	line	240
global __ptext32
__ptext32:
psect	text32
	file	"Lab5p6.c"
	line	240
	global	__size_of_SET_D3_RED
	__size_of_SET_D3_RED	equ	__end_of_SET_D3_RED-_SET_D3_RED
	
_SET_D3_RED:
;incstack = 0
	opt	stack 29
	line	242
	
l1216:
	bsf	((c:3968)),c,4	;volatile
	line	243
	bcf	((c:3968)),c,5	;volatile
	line	244
	
l151:
	return	;funcret
	opt stack 0
GLOBAL	__end_of_SET_D3_RED
	__end_of_SET_D3_RED:
	signat	_SET_D3_RED,88
	global	_SET_D3_GREEN

;; *************** function _SET_D3_GREEN *****************
;; Defined at:
;;		line 246 in file "Lab5p6.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		None
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
;;		_DO_DISPLAY_D3
;; This function uses a non-reentrant model
;;
psect	text33,class=CODE,space=0,reloc=2
	line	246
global __ptext33
__ptext33:
psect	text33
	file	"Lab5p6.c"
	line	246
	global	__size_of_SET_D3_GREEN
	__size_of_SET_D3_GREEN	equ	__end_of_SET_D3_GREEN-_SET_D3_GREEN
	
_SET_D3_GREEN:
;incstack = 0
	opt	stack 29
	line	248
	
l1218:
	bcf	((c:3968)),c,4	;volatile
	line	249
	bsf	((c:3968)),c,5	;volatile
	line	250
	
l154:
	return	;funcret
	opt stack 0
GLOBAL	__end_of_SET_D3_GREEN
	__end_of_SET_D3_GREEN:
	signat	_SET_D3_GREEN,88
	global	_DO_DISPLAY_D2

;; *************** function _DO_DISPLAY_D2 *****************
;; Defined at:
;;		line 171 in file "Lab5p6.c"
;; Parameters:    Size  Location     Type
;;  temp            2   14[COMRAM] int 
;; Auto vars:     Size  Location     Type
;;  T               2   16[COMRAM] int 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         2       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         2       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         4       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		___awdiv
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text34,class=CODE,space=0,reloc=2
	line	171
global __ptext34
__ptext34:
psect	text34
	file	"Lab5p6.c"
	line	171
	global	__size_of_DO_DISPLAY_D2
	__size_of_DO_DISPLAY_D2	equ	__end_of_DO_DISPLAY_D2-_DO_DISPLAY_D2
	
_DO_DISPLAY_D2:
;incstack = 0
	opt	stack 29
	line	173
	
l2738:
	movff	(c:DO_DISPLAY_D2@temp),(c:___awdiv@dividend)
	movff	(c:DO_DISPLAY_D2@temp+1),(c:___awdiv@dividend+1)
	movlw	high(0Ah)
	movwf	((c:___awdiv@divisor+1)),c
	movlw	low(0Ah)
	movwf	((c:___awdiv@divisor)),c
	call	___awdiv	;wreg free
	movff	0+?___awdiv,(c:DO_DISPLAY_D2@T)
	movff	1+?___awdiv,(c:DO_DISPLAY_D2@T+1)
	line	174
	
l2740:
	btfsc	((c:DO_DISPLAY_D2@T+1)),c,7
	goto	u3001
	movf	((c:DO_DISPLAY_D2@T+1)),c,w
	bnz	u3000
	decf	((c:DO_DISPLAY_D2@T)),c,w
	btfss	status,0
	goto	u3001
	goto	u3000

u3001:
	goto	l124
u3000:
	
l2742:
	btfsc	((c:DO_DISPLAY_D2@T+1)),c,7
	goto	u3010
	movf	((c:DO_DISPLAY_D2@T+1)),c,w
	bnz	u3011
	movlw	8
	subwf	 ((c:DO_DISPLAY_D2@T)),c,w
	btfsc	status,0
	goto	u3011
	goto	u3010

u3011:
	goto	l124
u3010:
	line	176
	
l2744:
	movf	((c:3969)),c,w	;volatile
	iorwf	((c:DO_DISPLAY_D2@T)),c,w
	movwf	((c:3969)),c	;volatile
	line	177
	
l124:
	line	178
	btfsc	((c:DO_DISPLAY_D2@T+1)),c,7
	goto	u3020
	movf	((c:DO_DISPLAY_D2@T+1)),c,w
	bnz	u3021
	decf	((c:DO_DISPLAY_D2@T)),c,w
	btfsc	status,0
	goto	u3021
	goto	u3020

u3021:
	goto	l2748
u3020:
	line	180
	
l2746:
	movlw	low(0)
	movwf	((c:3969)),c	;volatile
	goto	l2748
	line	181
	
l125:
	line	182
	
l2748:
	btfsc	((c:DO_DISPLAY_D2@T+1)),c,7
	goto	u3031
	movf	((c:DO_DISPLAY_D2@T+1)),c,w
	bnz	u3030
	movlw	8
	subwf	 ((c:DO_DISPLAY_D2@T)),c,w
	btfss	status,0
	goto	u3031
	goto	u3030

u3031:
	goto	l127
u3030:
	line	184
	
l2750:
	movf	((c:3969)),c,w	;volatile
	iorlw	low(07h)
	movwf	((c:3969)),c	;volatile
	goto	l127
	line	186
	
l126:
	line	187
	
l127:
	return	;funcret
	opt stack 0
GLOBAL	__end_of_DO_DISPLAY_D2
	__end_of_DO_DISPLAY_D2:
	signat	_DO_DISPLAY_D2,4216
	global	___awdiv

;; *************** function ___awdiv *****************
;; Defined at:
;;		line 8 in file "D:\Program Files (x86)\Microchip\xc8\v1.34\sources\common\awdiv.c"
;; Parameters:    Size  Location     Type
;;  dividend        2    6[COMRAM] int 
;;  divisor         2    8[COMRAM] int 
;; Auto vars:     Size  Location     Type
;;  quotient        2   12[COMRAM] int 
;;  sign            1   11[COMRAM] unsigned char 
;;  counter         1   10[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    6[COMRAM] int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         4       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         4       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         8       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        8 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;;		_DO_DISPLAY_D2
;;		_fround
;;		_scale
;;		_printf
;; This function uses a non-reentrant model
;;
psect	text35,class=CODE,space=0,reloc=2
	file	"D:\Program Files (x86)\Microchip\xc8\v1.34\sources\common\awdiv.c"
	line	8
global __ptext35
__ptext35:
psect	text35
	file	"D:\Program Files (x86)\Microchip\xc8\v1.34\sources\common\awdiv.c"
	line	8
	global	__size_of___awdiv
	__size_of___awdiv	equ	__end_of___awdiv-___awdiv
	
___awdiv:
;incstack = 0
	opt	stack 28
	line	14
	
l2082:
	movlw	low(0)
	movwf	((c:___awdiv@sign)),c
	line	15
	
l2084:
	btfsc	((c:___awdiv@divisor+1)),c,7
	goto	u1940
	goto	u1941

u1941:
	goto	l2090
u1940:
	line	16
	
l2086:
	negf	((c:___awdiv@divisor)),c
	comf	((c:___awdiv@divisor+1)),c
	btfsc	status,0
	incf	((c:___awdiv@divisor+1)),c
	line	17
	
l2088:
	movlw	low(01h)
	movwf	((c:___awdiv@sign)),c
	goto	l2090
	line	18
	
l468:
	line	19
	
l2090:
	btfsc	((c:___awdiv@dividend+1)),c,7
	goto	u1950
	goto	u1951

u1951:
	goto	l2096
u1950:
	line	20
	
l2092:
	negf	((c:___awdiv@dividend)),c
	comf	((c:___awdiv@dividend+1)),c
	btfsc	status,0
	incf	((c:___awdiv@dividend+1)),c
	line	21
	
l2094:
	movlw	(01h)&0ffh
	xorwf	((c:___awdiv@sign)),c
	goto	l2096
	line	22
	
l469:
	line	23
	
l2096:
	movlw	high(0)
	movwf	((c:___awdiv@quotient+1)),c
	movlw	low(0)
	movwf	((c:___awdiv@quotient)),c
	line	24
	
l2098:
	movf	((c:___awdiv@divisor)),c,w
iorwf	((c:___awdiv@divisor+1)),c,w
	btfsc	status,2
	goto	u1961
	goto	u1960

u1961:
	goto	l2118
u1960:
	line	25
	
l2100:
	movlw	low(01h)
	movwf	((c:___awdiv@counter)),c
	line	26
	goto	l2104
	
l472:
	line	27
	
l2102:
	bcf	status,0
	rlcf	((c:___awdiv@divisor)),c
	rlcf	((c:___awdiv@divisor+1)),c
	line	28
	incf	((c:___awdiv@counter)),c
	goto	l2104
	line	29
	
l471:
	line	26
	
l2104:
	
	btfss	((c:___awdiv@divisor+1)),c,(15)&7
	goto	u1971
	goto	u1970
u1971:
	goto	l2102
u1970:
	goto	l2106
	
l473:
	goto	l2106
	line	30
	
l474:
	line	31
	
l2106:
	bcf	status,0
	rlcf	((c:___awdiv@quotient)),c
	rlcf	((c:___awdiv@quotient+1)),c
	line	32
	
l2108:
		movf	((c:___awdiv@divisor)),c,w
	subwf	((c:___awdiv@dividend)),c,w
	movf	((c:___awdiv@divisor+1)),c,w
	subwfb	((c:___awdiv@dividend+1)),c,w
	btfss	status,0
	goto	u1981
	goto	u1980

u1981:
	goto	l2114
u1980:
	line	33
	
l2110:
	movf	((c:___awdiv@divisor)),c,w
	subwf	((c:___awdiv@dividend)),c
	movf	((c:___awdiv@divisor+1)),c,w
	subwfb	((c:___awdiv@dividend+1)),c

	line	34
	
l2112:
	bsf	(0+(0/8)+(c:___awdiv@quotient)),c,(0)&7
	goto	l2114
	line	35
	
l475:
	line	36
	
l2114:
	bcf	status,0
	rrcf	((c:___awdiv@divisor+1)),c
	rrcf	((c:___awdiv@divisor)),c
	line	37
	
l2116:
	decfsz	((c:___awdiv@counter)),c
	
	goto	l2106
	goto	l2118
	
l476:
	goto	l2118
	line	38
	
l470:
	line	39
	
l2118:
	movf	((c:___awdiv@sign)),c,w
	btfsc	status,2
	goto	u1991
	goto	u1990
u1991:
	goto	l2122
u1990:
	line	40
	
l2120:
	negf	((c:___awdiv@quotient)),c
	comf	((c:___awdiv@quotient+1)),c
	btfsc	status,0
	incf	((c:___awdiv@quotient+1)),c
	goto	l2122
	
l477:
	line	41
	
l2122:
	movff	(c:___awdiv@quotient),(c:?___awdiv)
	movff	(c:___awdiv@quotient+1),(c:?___awdiv+1)
	goto	l478
	
l2124:
	line	42
	
l478:
	return	;funcret
	opt stack 0
GLOBAL	__end_of___awdiv
	__end_of___awdiv:
	signat	___awdiv,8314
	global	_DO_DISPLAY_D1

;; *************** function _DO_DISPLAY_D1 *****************
;; Defined at:
;;		line 142 in file "Lab5p6.c"
;; Parameters:    Size  Location     Type
;;  temp            2    0[COMRAM] int 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         2       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
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
psect	text36,class=CODE,space=0,reloc=2
	file	"Lab5p6.c"
	line	142
global __ptext36
__ptext36:
psect	text36
	file	"Lab5p6.c"
	line	142
	global	__size_of_DO_DISPLAY_D1
	__size_of_DO_DISPLAY_D1	equ	__end_of_DO_DISPLAY_D1-_DO_DISPLAY_D1
	
_DO_DISPLAY_D1:
;incstack = 0
	opt	stack 30
	line	144
	
l2712:
	btfsc	((c:DO_DISPLAY_D1@temp+1)),c,7
	goto	u2920
	movf	((c:DO_DISPLAY_D1@temp+1)),c,w
	bnz	u2921
	movlw	46
	subwf	 ((c:DO_DISPLAY_D1@temp)),c,w
	btfsc	status,0
	goto	u2921
	goto	u2920

u2921:
	goto	l2716
u2920:
	line	146
	
l2714:
	movlw	low(0)
	movwf	((c:3969)),c	;volatile
	goto	l2716
	line	148
	
l116:
	line	149
	
l2716:
	btfsc	((c:DO_DISPLAY_D1@temp+1)),c,7
	goto	u2931
	movf	((c:DO_DISPLAY_D1@temp+1)),c,w
	bnz	u2930
	movlw	46
	subwf	 ((c:DO_DISPLAY_D1@temp)),c,w
	btfss	status,0
	goto	u2931
	goto	u2930

u2931:
	goto	l2722
u2930:
	
l2718:
	btfsc	((c:DO_DISPLAY_D1@temp+1)),c,7
	goto	u2940
	movf	((c:DO_DISPLAY_D1@temp+1)),c,w
	bnz	u2941
	movlw	56
	subwf	 ((c:DO_DISPLAY_D1@temp)),c,w
	btfsc	status,0
	goto	u2941
	goto	u2940

u2941:
	goto	l2722
u2940:
	line	151
	
l2720:
	movlw	low(020h)
	movwf	((c:3969)),c	;volatile
	goto	l2722
	line	153
	
l117:
	line	154
	
l2722:
	btfsc	((c:DO_DISPLAY_D1@temp+1)),c,7
	goto	u2951
	movf	((c:DO_DISPLAY_D1@temp+1)),c,w
	bnz	u2950
	movlw	56
	subwf	 ((c:DO_DISPLAY_D1@temp)),c,w
	btfss	status,0
	goto	u2951
	goto	u2950

u2951:
	goto	l2728
u2950:
	
l2724:
	btfsc	((c:DO_DISPLAY_D1@temp+1)),c,7
	goto	u2960
	movf	((c:DO_DISPLAY_D1@temp+1)),c,w
	bnz	u2961
	movlw	66
	subwf	 ((c:DO_DISPLAY_D1@temp)),c,w
	btfsc	status,0
	goto	u2961
	goto	u2960

u2961:
	goto	l2728
u2960:
	line	156
	
l2726:
	movlw	low(040h)
	movwf	((c:3969)),c	;volatile
	goto	l2728
	line	158
	
l118:
	line	159
	
l2728:
	btfsc	((c:DO_DISPLAY_D1@temp+1)),c,7
	goto	u2971
	movf	((c:DO_DISPLAY_D1@temp+1)),c,w
	bnz	u2970
	movlw	66
	subwf	 ((c:DO_DISPLAY_D1@temp)),c,w
	btfss	status,0
	goto	u2971
	goto	u2970

u2971:
	goto	l2734
u2970:
	
l2730:
	btfsc	((c:DO_DISPLAY_D1@temp+1)),c,7
	goto	u2980
	movf	((c:DO_DISPLAY_D1@temp+1)),c,w
	bnz	u2981
	movlw	76
	subwf	 ((c:DO_DISPLAY_D1@temp)),c,w
	btfsc	status,0
	goto	u2981
	goto	u2980

u2981:
	goto	l2734
u2980:
	line	161
	
l2732:
	movlw	low(080h)
	movwf	((c:3969)),c	;volatile
	goto	l2734
	line	163
	
l119:
	line	164
	
l2734:
	btfsc	((c:DO_DISPLAY_D1@temp+1)),c,7
	goto	u2991
	movf	((c:DO_DISPLAY_D1@temp+1)),c,w
	bnz	u2990
	movlw	76
	subwf	 ((c:DO_DISPLAY_D1@temp)),c,w
	btfss	status,0
	goto	u2991
	goto	u2990

u2991:
	goto	l121
u2990:
	line	166
	
l2736:
	movlw	low(0E0h)
	movwf	((c:3969)),c	;volatile
	goto	l121
	line	168
	
l120:
	line	169
	
l121:
	return	;funcret
	opt stack 0
GLOBAL	__end_of_DO_DISPLAY_D1
	__end_of_DO_DISPLAY_D1:
	signat	_DO_DISPLAY_D1,4216
psect	smallconst
	db 0	; dummy byte at the end
	global	__smallconst
	global	__mediumconst
	GLOBAL	__activetblptr
__activetblptr	EQU	2
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
