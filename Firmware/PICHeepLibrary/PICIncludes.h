#include "W5500.h"
#include "DigitalIO.h"
#include "ioLibrary_Driver-master/Ethernet/socket.h"
#include "Heep_DHCP.h"

uint32_t (*Heep_Millis)   (void);

void WritePICByte(uint8_t byte)
{
    HEEP_SPI_Exchange_Byte(byte);
}

uint8_t ReadPICByte()
{
    uint8_t readByte = HEEP_SPI_Exchange_Byte(0);
    return readByte;
}

void delay(uint32_t theTime)
{
    uint32_t startTime = Heep_Millis();
    uint32_t endTime = startTime + theTime;
    
    while(Heep_Millis() < endTime) {}
}