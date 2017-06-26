#include "DigitalIO.h"

void PinMode(int pin, enum pinType type)
{
    if(pin == 0)
    {
        TRISAbits.TRISA0 = type == input ? 1 : 0;
    }
    else if(pin == 1)
    {
        TRISAbits.TRISA1 = type == input ? 1 : 0;
    }
    else if(pin == 2)
    {
        TRISAbits.TRISA2 = type == input ? 1 : 0;
    }
    else if(pin == 3)
    {
        TRISAbits.TRISA3 = type == input ? 1 : 0;
    }
    else if(pin == 4)
    {
        TRISAbits.TRISA4 = type == input ? 1 : 0;
    }
    else if(pin == 5)
    {
        TRISAbits.TRISA5 = type == input ? 1 : 0;
    }
    else if(pin == 6)
    {
        TRISAbits.TRISA6 = type == input ? 1 : 0;
    }
    else if(pin == 7)
    {
        TRISAbits.TRISA7 = type == input ? 1 : 0;
    }
    
    else if(pin == 8)
    {
        TRISCbits.TRISC0 = type == input ? 1 : 0;
    }
    else if(pin == 9)
    {
        TRISCbits.TRISC1 = type == input ? 1 : 0;
    }
    else if(pin == 10)
    {
    TRISCbits.TRISC2 = type == input ? 1 : 0;
    }
    else if(pin == 11)
    {
        TRISCbits.TRISC3 = type == input ? 1 : 0;
    }
    else if(pin == 12)
    {
        TRISCbits.TRISC4 = type == input ? 1 : 0;
    }
    else if(pin == 13)
    {
        TRISCbits.TRISC5 = type == input ? 1 : 0;
    }
    else if(pin == 14)
    {
        TRISCbits.TRISC6 = type == input ? 1 : 0;
    }
    else if(pin == 15)
    {
        TRISCbits.TRISC7 = type == input ? 1 : 0;
    }
    
    else if(pin == 16)
    {
        TRISBbits.TRISB0 = type == input ? 1 : 0;
    }
    else if(pin == 17)
    {
        TRISBbits.TRISB1 = type == input ? 1 : 0;
    }
    else if(pin == 18)
    {
        TRISBbits.TRISB2 = type == input ? 1 : 0;
    }
    else if(pin == 19)
    {
        TRISBbits.TRISB3 = type == input ? 1 : 0;
    }
    else if(pin == 20)
    {
        TRISBbits.TRISB4 = type == input ? 1 : 0;
    }
    else if(pin == 21)
    {
        TRISBbits.TRISB5 = type == input ? 1 : 0;
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


