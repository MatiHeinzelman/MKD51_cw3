#include "main.h"

unsigned char xdata PTWY _at_ 0x8008; // Rejestr portu sterujacego diodami L0-L7
unsigned int myint=1;
unsigned int direction=0;

extern unsigned int GETADC( unsigned int myint);
extern void _SL33P();

void main(void) {
	
	   while(1) {
			// SL33P();
			myint = GETADC( myint );
	
		 } 
}

 
 
