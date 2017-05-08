/**
  Generated Main Source File

  Company:
    Microchip Technology Inc.

  File Name:
    main.c

  Summary:
    This is the main file generated using MPLAB(c) Code Configurator

  Description:
    This header file provides implementations for driver APIs for all modules selected in the GUI.
    Generation Information :
        Product Revision  :  MPLAB(c) Code Configurator - 4.15
        Device            :  PIC18F26K40
        Driver Version    :  2.00
    The generated drivers are tested against the following:
        Compiler          :  XC8 1.35
        MPLAB             :  MPLAB X 3.40
*/

/*
    (c) 2016 Microchip Technology Inc. and its subsidiaries. You may use this
    software and any derivatives exclusively with Microchip products.

    THIS SOFTWARE IS SUPPLIED BY MICROCHIP "AS IS". NO WARRANTIES, WHETHER
    EXPRESS, IMPLIED OR STATUTORY, APPLY TO THIS SOFTWARE, INCLUDING ANY IMPLIED
    WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY, AND FITNESS FOR A
    PARTICULAR PURPOSE, OR ITS INTERACTION WITH MICROCHIP PRODUCTS, COMBINATION
    WITH ANY OTHER PRODUCTS, OR USE IN ANY APPLICATION.

    IN NO EVENT WILL MICROCHIP BE LIABLE FOR ANY INDIRECT, SPECIAL, PUNITIVE,
    INCIDENTAL OR CONSEQUENTIAL LOSS, DAMAGE, COST OR EXPENSE OF ANY KIND
    WHATSOEVER RELATED TO THE SOFTWARE, HOWEVER CAUSED, EVEN IF MICROCHIP HAS
    BEEN ADVISED OF THE POSSIBILITY OR THE DAMAGES ARE FORESEEABLE. TO THE
    FULLEST EXTENT ALLOWED BY LAW, MICROCHIP'S TOTAL LIABILITY ON ALL CLAIMS IN
    ANY WAY RELATED TO THIS SOFTWARE WILL NOT EXCEED THE AMOUNT OF FEES, IF ANY,
    THAT YOU HAVE PAID DIRECTLY TO MICROCHIP FOR THIS SOFTWARE.

    MICROCHIP PROVIDES THIS SOFTWARE CONDITIONALLY UPON YOUR ACCEPTANCE OF THESE
    TERMS.
*/

#include "mcc_generated_files/mcc.h"

/*
                         Main application
 */

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

WriteToW5500(uint16_t addr, uint8_t controlBit, uint8_t* buf, uint16_t len)
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
    
    while (1)
    {
        // Add your application code
        LATAbits.LA0 = !LATAbits.LA0;
        SPI1_Exchange8bit(counter);
        counter++;
        
        if(counter > 9)
            counter = 0;
        
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