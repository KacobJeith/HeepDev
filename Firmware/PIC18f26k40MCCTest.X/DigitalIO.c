#include "DigitalIO.h"

void PinMode(int pin, enum pinType type)
{
    switch(pin)
    {
        case 0  : TRISAbits.TRISA0 = type == input ? 1 : 0; break;
        case 1  : TRISAbits.TRISA1 = type == input ? 1 : 0; break;
        case 2  : TRISAbits.TRISA2 = type == input ? 1 : 0; break;
        case 3  : TRISAbits.TRISA3 = type == input ? 1 : 0; break;
        case 4  : TRISAbits.TRISA4 = type == input ? 1 : 0; break;
        case 5  : TRISAbits.TRISA5 = type == input ? 1 : 0; break;
        case 6  : TRISAbits.TRISA6 = type == input ? 1 : 0; break;
        case 7  : TRISAbits.TRISA7 = type == input ? 1 : 0; break;
        case 8  : TRISCbits.TRISC0 = type == input ? 1 : 0; break;
        case 9  : TRISCbits.TRISC1 = type == input ? 1 : 0; break;
        case 10 : TRISCbits.TRISC2 = type == input ? 1 : 0; break;
        case 11 : TRISCbits.TRISC3 = type == input ? 1 : 0; break;
        case 12 : TRISCbits.TRISC4 = type == input ? 1 : 0; break;
        case 13 : TRISCbits.TRISC5 = type == input ? 1 : 0; break;
        case 14 : TRISCbits.TRISC6 = type == input ? 1 : 0; break;
        case 15 : TRISCbits.TRISC7 = type == input ? 1 : 0; break;
        case 16 : TRISBbits.TRISB0 = type == input ? 1 : 0; break;
        case 17 : TRISBbits.TRISB1 = type == input ? 1 : 0; break;
        case 18 : TRISBbits.TRISB2 = type == input ? 1 : 0; break;
        case 19 : TRISBbits.TRISB3 = type == input ? 1 : 0; break;
        case 20 : TRISBbits.TRISB4 = type == input ? 1 : 0; break;
        case 21 : TRISBbits.TRISB5 = type == input ? 1 : 0; break;
    }
    
    if(type == input_pullup)
    {
        SetPullUp(pin, 1);
    }
    else
    {
        SetPullUp(pin, 0);
    }
}

void DigitalWrite(int pin, enum outType value)
{
    switch(pin)
    {
        case 0  : LATAbits.LATA0 = value; return;
        case 1  : LATAbits.LATA1 = value; return;
        case 2  : LATAbits.LATA2 = value; return;
        case 3  : LATAbits.LATA3 = value; return;
        case 4  : LATAbits.LATA4 = value; return;
        case 5  : LATAbits.LATA5 = value; return;
        case 6  : LATAbits.LATA6 = value; return;
        case 7  : LATAbits.LATA7 = value; return;
        case 8  : LATCbits.LATC0 = value; return;
        case 9  : LATCbits.LATC1 = value; return;
        case 10 : LATCbits.LATC2 = value; return;
        case 11 : LATCbits.LATC3 = value; return;
        case 12 : LATCbits.LATC4 = value; return;
        case 13 : LATCbits.LATC5 = value; return;
        case 14 : LATCbits.LATC6 = value; return;
        case 15 : LATCbits.LATC7 = value; return;
        case 16 : LATBbits.LATB0 = value; return;
        case 17 : LATBbits.LATB1 = value; return;
        case 18 : LATBbits.LATB2 = value; return;
        case 19 : LATBbits.LATB3 = value; return;
        case 20 : LATBbits.LATB4 = value; return;
        case 21 : LATBbits.LATB5 = value; return;
    }
}

int DigitalRead(int pin)
{
    switch(pin)
    {
        case 0  : return PORTAbits.RA0;
        case 1  : return PORTAbits.RA1;
        case 2  : return PORTAbits.RA2;
        case 3  : return PORTAbits.RA3;
        case 4  : return PORTAbits.RA4;
        case 5  : return PORTAbits.RA5;
        case 6  : return PORTAbits.RA6;
        case 7  : return PORTAbits.RA7;
        case 8  : return PORTCbits.RC0;
        case 9  : return PORTCbits.RC1;
        case 10 : return PORTCbits.RC2;
        case 11 : return PORTCbits.RC3;
        case 12 : return PORTCbits.RC4;
        case 13 : return PORTCbits.RC5;
        case 14 : return PORTCbits.RC6;
        case 15 : return PORTCbits.RC7;
        case 16 : return PORTBbits.RB0;
        case 17 : return PORTBbits.RB1;
        case 18 : return PORTBbits.RB2;
        case 19 : return PORTBbits.RB3;
        case 20 : return PORTBbits.RB4;
        case 21 : return PORTBbits.RB5;
    }
    
    return 0xFF; // Error
}

void SetPullUp(int pin, int pullUp)
{
    if(pullUp)
    {
        switch(pin)
        {
            case 0  : WPUA |= (1 << 0); return;
            case 1  : WPUA |= (1 << 1); return;
            case 2  : WPUA |= (1 << 2); return;
            case 3  : WPUA |= (1 << 3); return;
            case 4  : WPUA |= (1 << 4); return;
            case 5  : WPUA |= (1 << 5); return;
            case 6  : WPUA |= (1 << 6); return;
            case 7  : WPUA |= (1 << 7); return;
            case 8  : WPUC |= (1 << 0); return;
            case 9  : WPUC |= (1 << 1); return;
            case 10 : WPUC |= (1 << 2); return;
            case 11 : WPUC |= (1 << 3); return;
            case 12 : WPUC |= (1 << 4); return;
            case 13 : WPUC |= (1 << 5); return;
            case 14 : WPUC |= (1 << 6); return;
            case 15 : WPUC |= (1 << 7); return;
            case 16 : WPUB |= (1 << 0); return;
            case 17 : WPUB |= (1 << 1); return;
            case 18 : WPUB |= (1 << 2); return;
            case 19 : WPUB |= (1 << 3); return;
            case 20 : WPUB |= (1 << 4); return;
            case 21 : WPUB |= (1 << 5); return;
        }
    }
    else
    {
        switch(pin)
        {
            case 0  : WPUA &= ~(1 << 0); return;
            case 1  : WPUA &= ~(1 << 1); return;
            case 2  : WPUA &= ~(1 << 2); return;
            case 3  : WPUA &= ~(1 << 3); return;
            case 4  : WPUA &= ~(1 << 4); return;
            case 5  : WPUA &= ~(1 << 5); return;
            case 6  : WPUA &= ~(1 << 6); return;
            case 7  : WPUA &= ~(1 << 7); return;
            case 8  : WPUC &= ~(1 << 0); return;
            case 9  : WPUC &= ~(1 << 1); return;
            case 10 : WPUC &= ~(1 << 2); return;
            case 11 : WPUC &= ~(1 << 3); return;
            case 12 : WPUC &= ~(1 << 4); return;
            case 13 : WPUC &= ~(1 << 5); return;
            case 14 : WPUC &= ~(1 << 6); return;
            case 15 : WPUC &= ~(1 << 7); return;
            case 16 : WPUB &= ~(1 << 0); return;
            case 17 : WPUB &= ~(1 << 1); return;
            case 18 : WPUB &= ~(1 << 2); return;
            case 19 : WPUB &= ~(1 << 3); return;
            case 20 : WPUB &= ~(1 << 4); return;
            case 21 : WPUB &= ~(1 << 5); return;
        }
    }
}
