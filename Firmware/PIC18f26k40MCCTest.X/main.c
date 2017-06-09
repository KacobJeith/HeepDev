#include "mcc_generated_files/mcc.h"

/* 
 * SPI on W5500 works in 3 phases.
 * 1. Address Phase
 * 2. Control Phase
 * 3. Data Phase
 */

void SetW5500SS()
{
    LATCbits.LATC0 = 0;
}

void ResetW5500SS()
{
    LATCbits.LATC0 = 1;
}

void InitializeW5500SS()
{
    TRISCbits.TRISC0 = 0;
}

// Gateway Address (GAR) - 0x0001->0x0004
#define GAR0 0x0001

// Subnet Mask Address (SUBR) - 0x0005->0x0008
#define SUBR0 0x0005

// Source Hardware Address [MAC Address] (SHAR) - 0x0009->0x000E
#define SHAR0 0x0009

// Source IP Address (SIPR) - 0x000F->0x0012
#define SIPR 0x000F

void ReadFromW5500(uint16_t addr, uint8_t controlBit, uint8_t* buf, uint16_t len)
{
    SetW5500SS();
    
    SPI1_Exchange8bit(addr >> 8); // Get High Byte
    SPI1_Exchange8bit(addr & 0xff); // Get Low Byte
    SPI1_Exchange8bit(controlBit);
    
    uint16_t i = 0;
    for(i = 0; i < len; i++)
    {
        buf[i] = SPI1_Exchange8bit(0);
    }
    
    ResetW5500SS();
}

void WriteToW5500(uint16_t addr, uint8_t controlBit, uint8_t* buf, uint16_t len)
{
    SetW5500SS();
    
    SPI1_Exchange8bit(addr >> 8); // Get High Byte
    SPI1_Exchange8bit(addr & 0xff); // Get Low Byte
    SPI1_Exchange8bit(controlBit);
    
    uint16_t i = 0;
    for(i = 0; i < len; i++)
    {
        SPI1_Exchange8bit(buf[i]);
    }
    
    ResetW5500SS();
}

void WriteSubnetMask(uint8_t* buf)
{
    WriteToW5500(SUBR0, 0b00000100, buf, 4);
}

void ReadSubnetMask(uint8_t* buf)
{
    ReadFromW5500(SUBR0, 0x00, buf, 4);
}

void main(void)
{
    // Initialize the device
    SYSTEM_Initialize();

    // If using interrupts in PIC18 High/Low Priority Mode you need to enable the Global High and Low Interrupts
    // If using interrupts in PIC Mid-Range Compatibility Mode you need to enable the Global and Peripheral Interrupts
    // Use the following macros to:

    // Enable high priority global interrupts
    //INTERRUPT_GlobalInterruptHighEnable();

    // Enable low priority global interrupts.
    //INTERRUPT_GlobalInterruptLowEnable();

    // Disable high priority global interrupts
    //INTERRUPT_GlobalInterruptHighDisable();

    // Disable low priority global interrupts.
    //INTERRUPT_GlobalInterruptLowDisable();

    // Enable the Global Interrupts
    //INTERRUPT_GlobalInterruptEnable();

    // Enable the Peripheral Interrupts
    //INTERRUPT_PeripheralInterruptEnable();

    // Disable the Global Interrupts
    //INTERRUPT_GlobalInterruptDisable();

    // Disable the Peripheral Interrupts
    //INTERRUPT_PeripheralInterruptDisable();
    uint8_t counter = 0;
    TRISA = 0x00;
    InitializeW5500SS();
    
    uint8_t writeSubBuff [4];
    writeSubBuff[0] = 255;
    writeSubBuff[1] = 255;
    writeSubBuff[2] = 14;
    writeSubBuff[3] = 0;
    
    uint8_t readSubBuf [4];
    uint8_t success = 1;
    
    WriteSubnetMask(writeSubBuff);
    ReadSubnetMask(readSubBuf);
    
    if(readSubBuf[0] != writeSubBuff[0])
    {
        success = 0;
    }
    if(readSubBuf[1] != writeSubBuff[1])
    {
        success = 0;
    }
    if(readSubBuf[2] != writeSubBuff[2])
    {
        success = 0;
    }
    if(readSubBuf[3] != writeSubBuff[3])
    {
        success = 0;
    }
    
    if(success)
    {
        LATAbits.LA0 = 1;
    }
    else
    {
        LATAbits.LA0 = 0;
    }
    
    while (1)
    {
        // Add your application code
       // LATAbits.LA0 = !LATAbits.LA0;
        //SPI1_Exchange8bit(counter);
        //counter++;
        
        //if(counter > 9)
          //  counter = 0;
        
//        unsigned long loopValue = 100000;
//        for(unsigned long i = 0; i < loopValue; i++)
//        {
//            Nop();
//        }
    }
}
/**
 End of File
*/