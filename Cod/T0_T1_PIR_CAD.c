
#include <xc.h>
#pragma config WDTE = OFF 									// set Watchdog Timer Enable bit OFF - default value is ON
__PROG_CONFIG(1,0x3FE4); 									// config. uC (WDT=dis|OSC=int)

#define   		LED_DETECTIE_MISCARE		RD0
#define   		LED_DETECTIE_INTUNERIC		RD1 
#define  		LED_CONVERSIE_FINALIZATA 	RD2 
#define 		done						1

void read_ADC(void);
void init(void);

unsigned int c1=0,c2 = 0, light_intensity = 100, result_adc=0;	
char status_conversie_adc = 0;
float  voltage = 0;

void main(void)
{	
    init();
   
    while(1)
    {
	read_ADC();
	if(light_intensity < 20)
	{
		LED_DETECTIE_INTUNERIC = 1;
		INTE = 1;
	}
	else
	{
		LED_DETECTIE_MISCARE = 0;
		LED_DETECTIE_INTUNERIC = 0;
		INTE = 0;
	}
	status_conversie_adc = 0;
    }	 
}

void read_ADC(void)
{
    voltage = 5 * result_adc / 1024.0;
    if (voltage >= 1.49 && voltage <= 2.78)
		light_intensity = voltage*15.03 - 17.55;
    if (voltage > 2.78 && voltage <= 3.37)
		light_intensity = voltage*37.5 - 81.55;
    if (voltage > 3.37 && voltage <= 3.81)
		light_intensity = voltage*72 - 200.1;
    if (voltage > 3.81 && voltage <= 4.05)
		light_intensity = voltage*129.4 - 419.6;
    if (voltage > 4.05 && voltage <= 4.25)
		light_intensity = voltage*207.4 - 736.7;
    if (voltage > 4.25 && voltage <= 4.34)
	    light_intensity = voltage*308 - 1166;
}

void init (void)
{
    TRISB = 0b00000011; 									// Pinul Rb0, RB1 de intrare
    PORTB = 0b00000000;										// Initializam portul B cu valoarea 0
    TRISD = 0b00000000; 									// Toti pinii portului D de iesire
    PORTD = 0b00000000;										// Initializam portul D cu valoarea 0
    ANSELH = 0b00000100;										// RB1(AN10) --> analogic
   
    OPTION_REG = OPTION_REG & 0b11010110; 						
    OPTION_REG = OPTION_REG | 0b00000110; 						// TOCS = 0 (CLOCK intern), PSA = 0 (prescaler setat pentru timer0), PS2 = 1, PS1 = 1 , PS0 = 0 ---> (110 = PS 1 : 128)
	      
    ADCON1 = 0b10000000;										// ADFM = 1 (Right justified)
    ADCON0 = 0b01101001;										// ADCS1=0, ADCS0=1, CHS3=1, CHS2=0, CHS1=1, CHS0=0, GO/DONE=0, ADON=1
    ADIE=1; ADIF=0;
   
    T1CON &= 0b11111101; 										// TMR1CS = 0 (clock intern) 
    T1CON |= 0b00110001; 										// prescaler = 11 (8: 1), TMR1ON = 1;
    TMR1IE = 1; TMR1IF = 0;
   
    INTCON = INTCON & 0b1100000; 								
    INTCON = INTCON | 0b11000000; 								// GIE = 1,  PEIE = 1, T0IE = 0, INTE = 0, TOIF = 0, INTF =0, RBIF = 0		
}

void interrupt my_isr(void)	 									// fosc = 4Mhz, prescaler 1:128
{	
    if (TMR1IF == 1 && TMR1IE == 1)								// Intrerupere Timer1
    {
		c2++;
		TMR1 = 15536;
	    if(c2 == 6)
	    {
		  LED_CONVERSIE_FINALIZATA = 0;
	    }
	    else if(c2 == 25)
	    {
		  c2 = 0;
		  GO = 1;
	    }
	    TMR1IF = 0;
      }
      
    if (ADIF == 1 && ADIE == 1)									// Intrerupere ADC
    {	   
	    ADIF = 0;
	    result_adc = ((ADRESH << 8) + ADRESL);
	    status_conversie_adc = done;
	    INTF = 0;
	    LED_CONVERSIE_FINALIZATA = 1;
    }
	   
    if (INTE == 1 && INTF == 1 ) 								// Intrerupere externa
    {
	    c1=0;
	    LED_DETECTIE_MISCARE= 1;
	    INTE = 0;
	    INTF = 0;
	    TMR0 += 6; 
	    T0IE = 1;
    }
	   
    if (T0IF == 1 && T0IE == 1)									// Intrerupere Timer0
    {	
	    c1++;
	    if(c1 == 130)
	    {		
		  c1= 0;
		  INTF = 0;
		  PORTD = 0b00000010;							
		  T0IE = 0;
	    }
	    T0IF = 0;
    }		
}
