//#include <htc.h>
//
//unsigned int c; // contorul
//unsigned int ms,s; 
//
//void main(void)
//{
//	TRISB = 0b00000001;
//	TRISD = 0b00000000; // toti pinii de iesire
//	RB0 = 0;
//	RD0 = 0;
//	ANSEL = 0;
//	ANSELH = 0; // toti pinii digitali
//	OPTION_REG = OPTION_REG & 0b11010110; // TOCS = 0 --> CLOCK intern, // PSA = 0 (prescaler setat pentru oscilator intern)
//	OPTION_REG = OPTION_REG | 0b00000110;
//	INTCON = INTCON | 0b10001000; // GIE = 1, TOIE = 1, TOIF = 0
//	INTCON = INTCON & 0b10001111; // GIE = 1, TOIE = 1, TOIF = 0
//	IOCB = 0b00000001;
//	while(1)
//	{
//		// afisare
//		asm("CLRWDT");
//	}
//}
//void interrupt my_isr(void) // fosc = 4Mhz, prescaler 1:128
//{
//	if (RBIF == 1 && RBIE == 1)
//	{
//		PORTD = 1;
//		T0IE = 1;
//		RBIE = 0;
//		RBIF = 0;
//	}
//	if (T0IF == 1 && T0IE == 1)
//	{	
//		c++;
//		TMR0 += 6; 
//		if(c == 625)
//		{
//			c = 0;
//			PORTD = 0; // stingere led
//			RBIE == 1; // activare intrerupere IOC
//			T0IF = 0;
//		}
//		T0IF = 0;
//	}
//}
///////////////////////////////////////////////////////
#include <htc.h>
#define _XTAL_FREQ 4000000  // frecventa de lucru a microcontrolerului

unsigned int c=0; // contorul

void main(void)
{
	TRISB = 0b00000001; 	// Pinul Rb0 de intrare, restul pinilor de iesire
	PORTB = 0b00000000;	// Resetam portul B
	TRISD = 0b00000000; 	// Toti pinii portului D de iesire
	PORTD = 0b00000000;	// Resetam portul B
	ANSEL = 0;	// toti pinii digitali
	ANSELH = 0; 	// toti pinii digitali
	OPTION_REG = OPTION_REG & 0b11010110; // TOCS = 0 --> CLOCK intern, // PSA = 0 (prescaler setat pentru timer0)
	OPTION_REG = OPTION_REG | 0b00000110;
	INTCON = INTCON 	|    0b10001001; // GIE = 1, TOIE = 1, TOIF = 0
   	INTCON = INTCON 	&  0b10001001;
	IOCB = 0b00000001;
	while(1)
	{
		// afisare
		//asm("CLRWDT");
	}
}
void interrupt my_isr(void) // fosc = 4Mhz, prescaler 1:128
{
	if (RBIF == 1 && RBIE == 1 && RB0==1)
	{
	        RBIE = 0;
		PORTD = 1;
		T0IE = 1;
		RBIF = 0;
	}
	if (T0IF == 1 && T0IE == 1)
	{	
		c++;
		TMR0 += 6; 
		if(c == 625)
		{
			c = 0;
			PORTD = 0; // stingere led
			RBIE = 1; // activare intrerupere IOC
			T0IE = 0;
		}
		T0IF = 0;
	}
}