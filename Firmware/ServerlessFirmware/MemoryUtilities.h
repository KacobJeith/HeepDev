unsigned long GetDataFromBufferOfSpecifiedSize(heepByte* buffer, heepByte* data, unsigned long size, unsigned long counter)
{
	for(int i = 0; i < size; i++)
	{
		data[i] = buffer[counter];
		counter++;
	}

	return counter;
}

unsigned long GetFullDeviceIDFromBuffer(unsigned char* buffer, heepByte* deviceID, unsigned long counter)
{
	return GetDataFromBufferOfSpecifiedSize(buffer, deviceID, STANDARD_ID_SIZE, counter);
}

unsigned long GetDeviceIDOrLocalIDFromBuffer(unsigned char* buffer, heepByte* deviceID, unsigned long counter)
{
	return GetDataFromBufferOfSpecifiedSize(buffer, deviceID, ID_SIZE, counter);
}

int CheckBufferEquality(heepByte* buffer1, heepByte* buffer2, int numBytes)
{
	for(int i = 0; i < numBytes; i++)
	{
		if(buffer1[i] != buffer2[i])
		{
			return 0;
		}
	}

	return 1;
}

int CheckDeviceIDEquality(heepByte* deviceID1, heepByte* deviceID2)
{
	return CheckBufferEquality(deviceID1, deviceID2, STANDARD_ID_SIZE);
}

unsigned long AddDeviceIDToBuffer_Byte(unsigned char* buffer, heepByte* deviceID, unsigned long counter)
{
	for(int i = 0; i < STANDARD_ID_SIZE; i++)
	{
		buffer[counter] = deviceID[i];
		counter++;
	}

	return counter;
}

void CopyDeviceID(heepByte* idSend, heepByte* idReturn)
{
	AddDeviceIDToBuffer_Byte(idReturn, idSend, 0);
}

unsigned long GetNumberFromBuffer(unsigned char* buffer, unsigned int* counter, unsigned char numBytes)
{
	unsigned long number = 0;

	for(int i = 0; i < numBytes; i++)
	{
		int curNum = buffer[*counter];
		number += curNum << (8 * (numBytes-i-1));
		(*counter)++;
	}

	return number;
}

unsigned long AddCharToBuffer(unsigned char* buffer, unsigned long startPoint, unsigned char value)
{
	buffer[startPoint] = value;
	startPoint++;
	return startPoint;
}

unsigned long AddNumberToBufferWithSpecifiedBytes(unsigned char* buffer, unsigned long number, unsigned long startPoint, int numBytes)
{
	for(int i = 0; i < numBytes; i++)
	{
		char numToAdd = (number >> 8*( (numBytes-1) - i))%256;
		startPoint = AddCharToBuffer(buffer, startPoint, numToAdd);
	}

	return startPoint;
}

void AddBufferToBuffer(heepByte* rxBuffer, heepByte* txBuffer, heepByte size, unsigned int &rxCounter, unsigned int &txCounter)
{
	for(int i = 0; i < size; i++)
	{
		rxBuffer[rxCounter] = txBuffer[txCounter];
		rxCounter++;
		txCounter++;
	}
}