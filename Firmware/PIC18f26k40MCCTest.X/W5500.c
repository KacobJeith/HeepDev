#include "mcc_generated_files/mcc.h"
#include "W5500.h"

// Gateway Address (GAR) - 0x0001->0x0004
#define GAR0 0x0001
// Subnet Mask Address (SUBR) - 0x0005->0x0008
#define SUBR0 0x0005
// Source Hardware Address [MAC Address] (SHAR) - 0x0009->0x000E
#define SHAR0 0x0009
// Source IP Address (SIPR) - 0x000F->0x0012
#define SIPR 0x000F

#define SS_PIN_TRIS TRISCbits.TRISC0
#define SS_PIN LATCbits.LATC0
#define RESET_PIN_TRIS TRISCbits.TRISC2
#define RESET_PIN LATCbits.LATC2
#define INT_PIN_TRIS TRISCbits.TRISC1
#define INT_PIN LATCbits.LATC1

void InitializeW5500()
{
    SS_PIN_TRIS = 0;
    RESET_PIN_TRIS = 0;
    INT_PIN_TRIS = 1;
    
    RESET_PIN = 1;
    
    ResetW5500();
}

void ResetW5500()
{   
    RESET_PIN = 0;
    
    for(unsigned long i = 0; i < 65535; i++)
    {
        Nop();
    }
    
    RESET_PIN = 1;
        
    for(unsigned long i = 0; i < 65535; i++)
    {
        Nop();
    }
}