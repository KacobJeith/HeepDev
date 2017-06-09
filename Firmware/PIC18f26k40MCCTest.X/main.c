#include "mcc_generated_files/mcc.h"
#include "W5500.h"

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
    LATAbits.LA1 = 1;
    
    InitializeW5500();
    
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