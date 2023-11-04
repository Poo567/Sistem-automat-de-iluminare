opt subtitle "HI-TECH Software Omniscient Code Generator (Lite mode) build 7503"

opt pagewidth 120

	opt lm

	processor	16F887
clrc	macro
	bcf	3,0
	endm
clrz	macro
	bcf	3,2
	endm
setc	macro
	bsf	3,0
	endm
setz	macro
	bsf	3,2
	endm
skipc	macro
	btfss	3,0
	endm
skipz	macro
	btfss	3,2
	endm
skipnc	macro
	btfsc	3,0
	endm
skipnz	macro
	btfsc	3,2
	endm
indf	equ	0
indf0	equ	0
pc	equ	2
pcl	equ	2
status	equ	3
fsr	equ	4
fsr0	equ	4
c	equ	1
z	equ	0
pclath	equ	10
	FNROOT	_main
	FNCALL	intlevel1,_my_isr
	global	intlevel1
	FNROOT	intlevel1
	global	_c
	global	_INTCON
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:
_INTCON	set	11
	global	_PORTB
_PORTB	set	6
	global	_PORTD
_PORTD	set	8
	global	_TMR0
_TMR0	set	1
	global	_RB0
_RB0	set	48
	global	_RBIE
_RBIE	set	91
	global	_RBIF
_RBIF	set	88
	global	_T0IE
_T0IE	set	93
	global	_T0IF
_T0IF	set	90
	global	_IOCB
_IOCB	set	150
	global	_OPTION_REG
_OPTION_REG	set	129
	global	_TRISB
_TRISB	set	134
	global	_TRISD
_TRISD	set	136
	global	_ANSEL
_ANSEL	set	392
	global	_ANSELH
_ANSELH	set	393
	file	"Button_20s_Timer.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	bssCOMMON,class=COMMON,space=1
global __pbssCOMMON
__pbssCOMMON:
_c:
       ds      2

; Clear objects allocated to COMMON
psect cinit,class=CODE,delta=2
	clrf	((__pbssCOMMON)+0)&07Fh
	clrf	((__pbssCOMMON)+1)&07Fh
psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?_my_isr
?_my_isr:	; 0 bytes @ 0x0
	global	??_my_isr
??_my_isr:	; 0 bytes @ 0x0
	ds	5
	global	??_main
??_main:	; 0 bytes @ 0x5
;;Data sizes: Strings 0, constant 0, data 0, bss 2, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      5       7
;; BANK0           80      0       0
;; BANK1           80      0       0
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:



;;
;; Critical Paths under _main in COMMON
;;
;;   None.
;;
;; Critical Paths under _my_isr in COMMON
;;
;;   None.
;;
;; Critical Paths under _main in BANK0
;;
;;   None.
;;
;; Critical Paths under _my_isr in BANK0
;;
;;   None.
;;
;; Critical Paths under _main in BANK1
;;
;;   None.
;;
;; Critical Paths under _my_isr in BANK1
;;
;;   None.
;;
;; Critical Paths under _main in BANK3
;;
;;   None.
;;
;; Critical Paths under _my_isr in BANK3
;;
;;   None.
;;
;; Critical Paths under _main in BANK2
;;
;;   None.
;;
;; Critical Paths under _my_isr in BANK2
;;
;;   None.

;;
;;Main: autosize = 0, tempsize = 0, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 0     0      0       0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 0
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (1) _my_isr                                               5     5      0       0
;;                                              0 COMMON     5     5      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 1
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;
;; _my_isr (ROOT)
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;COMMON               E      5       7       1       50.0%
;;BITSFR0              0      0       0       1        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;STACK                0      0       0       2        0.0%
;;ABS                  0      0       7       3        0.0%
;;BITBANK0            50      0       0       4        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;SFR3                 0      0       0       4        0.0%
;;BANK0               50      0       0       5        0.0%
;;BITSFR2              0      0       0       5        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BITBANK1            50      0       0       6        0.0%
;;BANK1               50      0       0       7        0.0%
;;BITBANK3            60      0       0       8        0.0%
;;BANK3               60      0       0       9        0.0%
;;BITBANK2            60      0       0      10        0.0%
;;BANK2               60      0       0      11        0.0%
;;DATA                 0      0       7      12        0.0%

	global	_main
psect	maintext

;; *************** function _main *****************
;; Defined at:
;;		line 55 in file "E:\UNIVERSITATE\Master\Anul 1, Semetrul1\AHSCTCM\Proiect_final\MPLAB simulation\Button_20s_Timer.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"E:\UNIVERSITATE\Master\Anul 1, Semetrul1\AHSCTCM\Proiect_final\MPLAB simulation\Button_20s_Timer.c"
	line	55
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 7
; Regs used in _main: [wreg+status,2]
	line	56
	
l1405:	
;Button_20s_Timer.c: 56: TRISB = 0b00000001;
	movlw	(01h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(134)^080h	;volatile
	line	57
	
l1407:	
;Button_20s_Timer.c: 57: PORTB = 0b00000000;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(6)	;volatile
	line	58
	
l1409:	
;Button_20s_Timer.c: 58: TRISD = 0b00000000;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(136)^080h	;volatile
	line	59
	
l1411:	
;Button_20s_Timer.c: 59: PORTD = 0b00000000;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(8)	;volatile
	line	60
	
l1413:	
;Button_20s_Timer.c: 60: ANSEL = 0;
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	clrf	(392)^0180h	;volatile
	line	61
	
l1415:	
;Button_20s_Timer.c: 61: ANSELH = 0;
	clrf	(393)^0180h	;volatile
	line	62
;Button_20s_Timer.c: 62: OPTION_REG = OPTION_REG & 0b11010110;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(129)^080h,w
	andlw	0D6h
	movwf	(129)^080h	;volatile
	line	63
;Button_20s_Timer.c: 63: OPTION_REG = OPTION_REG | 0b00000110;
	movf	(129)^080h,w	;volatile
	iorlw	06h
	movwf	(129)^080h	;volatile
	line	64
;Button_20s_Timer.c: 64: INTCON = INTCON | 0b10001001;
	movf	(11),w	;volatile
	iorlw	089h
	movwf	(11)	;volatile
	line	65
;Button_20s_Timer.c: 65: INTCON = INTCON & 0b10001001;
	movf	(11),w
	andlw	089h
	movwf	(11)	;volatile
	line	66
	
l1417:	
;Button_20s_Timer.c: 66: IOCB = 0b00000001;
	movlw	(01h)
	movwf	(150)^080h	;volatile
	goto	l1028
	line	67
;Button_20s_Timer.c: 67: while(1)
	
l1027:	
	line	71
;Button_20s_Timer.c: 68: {
	
l1028:	
	line	67
	goto	l1028
	
l1029:	
	line	72
	
l1030:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_my_isr
psect	text55,local,class=CODE,delta=2
global __ptext55
__ptext55:

;; *************** function _my_isr *****************
;; Defined at:
;;		line 74 in file "E:\UNIVERSITATE\Master\Anul 1, Semetrul1\AHSCTCM\Proiect_final\MPLAB simulation\Button_20s_Timer.c"
;; Parameters:    Size  Location     Type
;;		None
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
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          5       0       0       0       0
;;      Totals:         5       0       0       0       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		Interrupt level 1
;; This function uses a non-reentrant model
;;
psect	text55
	file	"E:\UNIVERSITATE\Master\Anul 1, Semetrul1\AHSCTCM\Proiect_final\MPLAB simulation\Button_20s_Timer.c"
	line	74
	global	__size_of_my_isr
	__size_of_my_isr	equ	__end_of_my_isr-_my_isr
	
_my_isr:	
	opt	stack 7
; Regs used in _my_isr: [wreg+status,2+status,0]
psect	intentry,class=CODE,delta=2
global __pintentry
__pintentry:
global interrupt_function
interrupt_function:
	global saved_w
	saved_w	set	btemp+0
	movwf	saved_w
	swapf	status,w
	movwf	(??_my_isr+1)
	movf	fsr0,w
	movwf	(??_my_isr+2)
	movf	pclath,w
	movwf	(??_my_isr+3)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	btemp+1,w
	movwf	(??_my_isr+4)
	ljmp	_my_isr
psect	text55
	line	75
	
i1l1419:	
;Button_20s_Timer.c: 75: if (RBIF == 1 && RBIE == 1 && RB0==1)
	btfss	(88/8),(88)&7
	goto	u1_21
	goto	u1_20
u1_21:
	goto	i1l1433
u1_20:
	
i1l1421:	
	btfss	(91/8),(91)&7
	goto	u2_21
	goto	u2_20
u2_21:
	goto	i1l1433
u2_20:
	
i1l1423:	
	btfss	(48/8),(48)&7
	goto	u3_21
	goto	u3_20
u3_21:
	goto	i1l1433
u3_20:
	line	77
	
i1l1425:	
;Button_20s_Timer.c: 76: {
;Button_20s_Timer.c: 77: RBIE = 0;
	bcf	(91/8),(91)&7
	line	78
	
i1l1427:	
;Button_20s_Timer.c: 78: PORTD = 1;
	movlw	(01h)
	movwf	(8)	;volatile
	line	79
	
i1l1429:	
;Button_20s_Timer.c: 79: T0IE = 1;
	bsf	(93/8),(93)&7
	line	80
	
i1l1431:	
;Button_20s_Timer.c: 80: RBIF = 0;
	bcf	(88/8),(88)&7
	goto	i1l1433
	line	81
	
i1l1033:	
	line	82
	
i1l1433:	
;Button_20s_Timer.c: 81: }
;Button_20s_Timer.c: 82: if (T0IF == 1 && T0IE == 1)
	btfss	(90/8),(90)&7
	goto	u4_21
	goto	u4_20
u4_21:
	goto	i1l1036
u4_20:
	
i1l1435:	
	btfss	(93/8),(93)&7
	goto	u5_21
	goto	u5_20
u5_21:
	goto	i1l1036
u5_20:
	line	84
	
i1l1437:	
;Button_20s_Timer.c: 83: {
;Button_20s_Timer.c: 84: c++;
	movlw	low(01h)
	addwf	(_c),f
	skipnc
	incf	(_c+1),f
	movlw	high(01h)
	addwf	(_c+1),f
	line	85
	
i1l1439:	
;Button_20s_Timer.c: 85: TMR0 += 6;
	movlw	(06h)
	movwf	(??_my_isr+0)+0
	movf	(??_my_isr+0)+0,w
	addwf	(1),f	;volatile
	line	86
	
i1l1441:	
;Button_20s_Timer.c: 86: if(c == 625)
	movlw	high(0271h)
	xorwf	(_c+1),w
	skipz
	goto	u6_25
	movlw	low(0271h)
	xorwf	(_c),w
u6_25:

	skipz
	goto	u6_21
	goto	u6_20
u6_21:
	goto	i1l1449
u6_20:
	line	88
	
i1l1443:	
;Button_20s_Timer.c: 87: {
;Button_20s_Timer.c: 88: c = 0;
	clrf	(_c)
	clrf	(_c+1)
	line	89
;Button_20s_Timer.c: 89: PORTD = 0;
	clrf	(8)	;volatile
	line	90
	
i1l1445:	
;Button_20s_Timer.c: 90: RBIE = 1;
	bsf	(91/8),(91)&7
	line	91
	
i1l1447:	
;Button_20s_Timer.c: 91: T0IE = 0;
	bcf	(93/8),(93)&7
	goto	i1l1449
	line	92
	
i1l1035:	
	line	93
	
i1l1449:	
;Button_20s_Timer.c: 92: }
;Button_20s_Timer.c: 93: T0IF = 0;
	bcf	(90/8),(90)&7
	goto	i1l1036
	line	94
	
i1l1034:	
	line	95
	
i1l1036:	
	movf	(??_my_isr+4),w
	movwf	btemp+1
	movf	(??_my_isr+3),w
	movwf	pclath
	movf	(??_my_isr+2),w
	movwf	fsr0
	swapf	(??_my_isr+1)^0FFFFFF80h,w
	movwf	status
	swapf	saved_w,f
	swapf	saved_w,w
	retfie
	opt stack 0
GLOBAL	__end_of_my_isr
	__end_of_my_isr:
;; =============== function _my_isr ends ============

	signat	_my_isr,88
psect	text56,local,class=CODE,delta=2
global __ptext56
__ptext56:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
