#include <EEPROM.h>

void SaveMemory(unsigned char* memoryBuffer, unsigned int bytesToWrite)
{
	// First store number of bytes to write
	EEPROM.write(0, bytesToWrite);

	for(int i = 1; i < bytesToWrite + 1; i++)
	{
		EEPROM.write(i, memoryBuffer[i-1]);
	}
}

void ClearMemory()
{
 for (int i = 0 ; i < EEPROM.length() ; i++) 
 {
    EEPROM.write(i, 0);
  }
}

void ReadMemory(unsigned char* memoryBuffer)
{
	int numberBytesToRead = EEPROM.read(0); // Address 0 contains number of bytes

	for(int i = 1; i < numberBytesToRead + 1; i++)
	{
		memoryBuffer[i-1] = EEPROM.read(i);
	}
}