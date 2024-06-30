#include "main.h"

unsigned char xdata PTWY _at_ 0x8008; // Rejestr portu sterujacego diodami L0-L7
short int myint=3;


extern unsigned char GETADC(unsigned char myint);

void main(void) {
	
		myint = GETADC( myint );
	//		PTWY=1;
//    WAIT_10US(100U);
//			PTWY=2;
	
 //   while(1) {
      //WAIT_10US(10U);
	//		GETADC();
  //  }
}

 
 
