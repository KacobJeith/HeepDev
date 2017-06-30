void SaveMemory(unsigned char controlRegister, unsigned char* memoryBuffer, unsigned int bytesToWrite)
{
	// First store number of bytes to write
	DATAEE_WriteByte(0, controlRegister);
	DATAEE_WriteByte(1, bytesToWrite);

	for(int i = 2; i < bytesToWrite + 1; i++)
	{
		DATAEE_WriteByte(i, memoryBuffer[i-2]);
	}
}

void ClearMemory()
{
 for (int i = 0 ; i < 10; i++) 
 {
    DATAEE_WriteByte(i, 0);
  }
}


void ReadMemory(unsigned char* controlRegister, unsigned char* memoryBuffer, unsigned int* bytesRead)
{
	*controlRegister = DATAEE_ReadByte(0); // Address 0 contains control register
	int numberBytesToRead = DATAEE_ReadByte(1); // Address 1 contains number of bytes
	*bytesRead = numberBytesToRead;

	for(int i = 2; i < numberBytesToRead + 1; i++)
	{
		memoryBuffer[i-2] = DATAEE_ReadByte(i);
	}
}