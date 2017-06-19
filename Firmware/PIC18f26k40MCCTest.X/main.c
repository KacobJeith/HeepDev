#include "mcc_generated_files/mcc.h"
#include "W5500.h"

#define TEST_SERVER

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
    
    if(TestW5500RegisterWriting())
    {
        LATAbits.LA0 = 1;
    }
    else
    {
        LATAbits.LA0 = 0;
    }
    
    uint8_t myByte = ReadMR();
    uint8_t anotherByte =  ReadPHYCFGR();
    
#ifdef TEST_SERVER
    uint8_t rxBuf[200];
    Listen(5000);
#else
    uint8_t destIP [4];
    destIP[0] = 192;
    destIP[1] = 168;
    destIP[2] = 0;
    destIP[3] = 102;
    uint16_t myPort = 5000;
    uint8_t destPort[2];
    destPort[0] = myPort >> 8;
    destPort[1] = myPort & 0xFF;
    //LATAbits.LA0 = 0;
    ConnectToIP(destIP, destPort);
    LATAbits.LA0 = 0;
    
    uint8_t buf [5];
    buf[0] = 'J';
    buf[1] = 'a';
    buf[2] = 'm';
    buf[3] = 'e';
    buf[4] = 's';
    SendData(buf, 5);
#endif
    

    
    while (1)
    {
        
#ifdef TEST_SERVER
    uint16_t curData = DataAvailable();
    if(curData > 0)
    {
        ReadData(rxBuf, curData);
        LATAbits.LA0 = 0;
    }
#endif
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