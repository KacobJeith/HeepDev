#include "ESP8266_NonVolatileMemory.cpp"
#include <EEPROM.h>

#define EEPROM_SIZE 512
bool EEPROMStarted = false;

void StartEEPROM()
{
	if(!EEPROMStarted)
	{
		EEPROM.begin(EEPROM_SIZE);
		EEPROMStarted = true; 
	}
}

void SaveMemory(unsigned char controlRegister, unsigned char* memoryBuffer, unsigned int bytesToWrite)
{
	StartEEPROM();

	// First store number of bytes to write
	EEPROM.write(0, controlRegister);
	EEPROM.write(1, bytesToWrite);

	for(int i = 2; i < bytesToWrite + 1; i++)
	{
		EEPROM.write(i, memoryBuffer[i-2]);
	}

 EEPROM.commit();
}

void ClearMemory()
{
	StartEEPROM();

 	for (int i = 0 ; i < EEPROM_SIZE; i++) 
 	{
    	EEPROM.write(i, 0);
  	}
}


void ReadMemory(unsigned char* controlRegister, unsigned char* memoryBuffer, unsigned int* bytesRead)
{
	StartEEPROM();

	*controlRegister = EEPROM.read(0); // Address 0 contains control register
	int numberBytesToRead = EEPROM.read(1); // Address 1 contains number of bytes
	*bytesRead = numberBytesToRead;

	for(int i = 2; i < numberBytesToRead + 1; i++)
	{
		memoryBuffer[i-2] = EEPROM.read(i);
	}
}