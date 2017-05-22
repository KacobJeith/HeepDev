#include <EEPROM.h>

void SaveMemory(unsigned char controlRegister, unsigned char* memoryBuffer, unsigned int bytesToWrite)
{
	// First store number of bytes to write
	EEPROM.write(0, controlRegister);
	EEPROM.write(1, bytesToWrite);

	for(int i = 2; i < bytesToWrite + 1; i++)
	{
		EEPROM.write(i, memoryBuffer[i-2]);
	}
}

void ClearMemory()
{
 for (int i = 0 ; i < EEPROM.length() ; i++) 
 {
    EEPROM.write(i, 0);
  }
}


void ReadMemory(unsigned char &controlRegister, unsigned char* memoryBuffer, unsigned int &bytesRead)
{
	controlRegister = EEPROM.read(0); // Address 0 contains control register
	int numberBytesToRead = EEPROM.read(1); // Address 1 contains number of bytes
	bytesRead = numberBytesToRead;

	for(int i = 2; i < numberBytesToRead + 1; i++)
	{
		memoryBuffer[i-2] = EEPROM.read(i);
	}
}