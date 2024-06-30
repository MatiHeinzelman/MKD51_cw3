#include "main.h"
#include <stdio.h> // Dodane dla funkcji sprintf()

// Prototyp funkcji disptext_led
void disptext_led(unsigned char *text);

unsigned char xdata LCDBUF[42];
unsigned char Licznik;
unsigned char ZM1 = 2;
unsigned char xdata PTSEG _at_ 0X8018;
unsigned char xdata PTIO _at_ 0x8008;
unsigned char xdata PTAC _at_ 0x8000;
unsigned char xdata PTWE _at_ 0x8008;
sbit P1_6 = P1^6;

extern unsigned char GETADC(unsigned char nr_kanalu);

void main(void) {
    unsigned int pot0_value = 0; // Zdefiniowanie zmiennej pot0_value
    unsigned int pot1_value = 0; // Zdefiniowanie zmiennej pot1_value
    unsigned int pot2_value = 0; // Zdefiniowanie zmiennej pot2_value
    unsigned char last_potentiometer = 1; // Zmienna przechowująca informację o ostatnio zmienionym potencjometrze
   
    Licznik = 0;
    prglcd();
   
    while(1) {
        WAIT_10US(25000U);
        INWERSJAP1_6();
       
        // Sprawdzenie stanu przycisków X0, X1 i X2
        if (!(PTWE & 1)) {
            // Jeśli przycisk X0 jest wciśnięty, ustaw ostatni potencjometr na POT0
            last_potentiometer = 0;
        } else if (!(PTWE & 2)) {
            // Jeśli przycisk X1 jest wciśnięty, ustaw ostatni potencjometr na POT1
            last_potentiometer = 1;
        } else if (!(PTWE & 4)) {
            // Jeśli przycisk X2 jest wciśnięty, ustaw ostatni potencjometr na POT2
            last_potentiometer = 2;
        }
       
        // Odczyt wartości z potencjometra
        if (last_potentiometer == 0) {
            pot0_value = GETADC(5) * 5UL / 255;
            sprintf(&LCDBUF[16], "POT0 value: %i     ", pot0_value);
        } else if (last_potentiometer == 1) {
            pot1_value = GETADC(6) * 5UL / 255;
            sprintf(&LCDBUF[16], "POT1 value: %i     ", pot1_value);
        } else {
            pot2_value = GETADC(7) * 5UL / 255;
            sprintf(&LCDBUF[16], "POT2 value: %i     ", pot2_value);
        }
       
        disptext(LCDBUF); // Tutaj wyświetlamy na W-LCD
    }
}

void INWERSJAP1_6() {
#ifdef ASM_EXAMPLE
    INWERSJAP1_6_ASM();
#else
    P1_6 = !P1_6;
#endif
}

void WAIT_10US(unsigned int wait) {
#ifdef ASM_EXAMPLE
    WAIT_10US_ASM(-wait);
#else
    wait = (wait * 10UL) / 11UL;
    while (--wait) _nop_();
#endif
}
