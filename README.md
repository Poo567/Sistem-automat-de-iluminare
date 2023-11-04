# Sistem-automat-de-iluminare
În cadrul acestui proiect se descrie un sistem automat de iluminare exterior, implementat cu ajutorul microcontrolerului PIC16F887. 
Sistemul controleaza aprinderea și stingerea unui bec într-un mod cât mai eficient, pentru a diminua pe cât de mult posibil risipa de energie. Controlerul de lumină are ca parametri de decizie datele citite de la un senzor de miscare(PIR) si un senzor de lumina(LDR). Datele sunt achiziționate periodic, cu o frecventa setata prin intermediul temporizatoarelor ( Timer0 si Timer1) si al intreruperilor externe.
