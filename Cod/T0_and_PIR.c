
#include <xc.h>
#define _XTAL_FREQ 4000000 // frecventa de lucru a microcontrolerului
#pragma config WDTE = OFF // set Watchdog Timer Enable bit OFF - default value is ON
__PROG_CONFIG(1,0x3FE4); 	// config. uC (WDT=dis|OSC=int)

unsigned int c=0; // contorul

void main(void)
{
        
	ANSEL = 0;	// toti pinii digitali
	TRISB =   0b00000001; 			// Pinul Rb0 de intrare(valoare PIR), restul pinilor de iesire
	PORTB = 0b00000000;			// Initializam portul B cu valoarea 0
	TRISD =   0b00000000; 			// Toti pinii portului D de iesire
	PORTD = 0b00000000;			// Initializam portul D cu valoarea 0
	ANSELH = 0; 					// toti pinii digitali
        OSCCON = OSCCON | 0b01100000; OSCCON = OSCCON & 0b11101111;		// IRCF2 = 1, IRCF1 = 1, IRCF0 = 0 ---> fosc = 4Mhz
	OPTION_REG = OPTION_REG & 0b11010110; 							// TOCS = 0 (CLOCK intern), PSA = 0 (prescaler setat pentru timer0), PS0 = 0
	OPTION_REG = OPTION_REG | 0b00000110; 							// PS2 = 1, PS1 = 1 ---> (110 = PS 1 : 128)
	IOCB = 0b00000001;
   	INTCON = INTCON 	&  0b10001000; 									// PEIE = 0, T0IE = 0, INTE = 0, TOIF = 0, INTF =0, RBIF = 0
        INTCON = INTCON 	|    0b10001000; 									// GIE = 1, RBIE = 1
	
	while(1)
	{
		if(RD0 == 0)
		{
		  RD1 = 0;
		}
		
	       
	}
}
void interrupt my_isr(void) // fosc = 4Mhz, prescaler 1:128
{	
	if (RBIF == 1 && RBIE == 1 && RB0==1) 
	{
	        RBIE = 0;
		PORTD = 0b00000011;
		RBIF = 0;
	        RB0 = 0;
	        T0IE = 1;
	}
	if (T0IF == 1 && T0IE == 1)
	{	
		c++;
		TMR0 += 6; 
		if(c == 625)
		{
			RBIF = 0;
		        RB0 = 0;
			c = 0;
			PORTD = 0b00000010; // stingere led
			RBIE = 1; // activare intrerupere IOC
			T0IE = 0;
		}
		T0IF = 0;
	}
}
