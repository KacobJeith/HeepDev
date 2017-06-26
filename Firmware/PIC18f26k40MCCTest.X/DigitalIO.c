#include "DigitalIO.h"

void PinMode(int pin, enum pinType type)
{
    if(type == input)
    {
        
    }
    else
    {
        
    }
}

void DigitalWrite(int pin, int value)
{
    
}

int DigitalRead(int pin)
{
    return 0;
}

uint8_t GetPortFromPinNumber(int pinNumber)
{
    LATAbits.LATA0 = 1;
    
    return PORTAbits.RA0;
    
       
//    switch(pinNumber)
//    {
//        case: 0 return PORTAbits.RA0;
//        case: 1 return PORTAbits.RA1;
//        case: 2 return PORTAbits.RA2;
//        case: 3 return PORTAbits.RA3;
//        case: 4 return PORTAbits.RA4;
//        case: 5 return PORTAbits.RA5;
//        case: 6 return PORTAbits.RA6;
//        case: 7 return PORTAbits.RA7;
//        case: 8  return PORTAbits.RC0;
//        case: 9  return PORTAbits.RC1;
//        case: 10 return PORTAbits.RC2;
//        case: 11 return PORTAbits.RC3;
//        case: 12 return PORTAbits.RC4;
//        case: 13 return PORTAbits.RC5;
//        case: 14 return PORTAbits.RC6;
//        case: 15 return PORTAbits.RC7;
//        case: 16 return PORTAbits.RB0;
//        case: 17 return PORTAbits.RB1;
//        case: 18 return PORTAbits.RB2;
//        case: 19 return PORTAbits.RB3;
//        case: 20 return PORTAbits.RB4;
//        case: 21 return PORTAbits.RB5;
//    }
//    return 0xFF; // Error
}


