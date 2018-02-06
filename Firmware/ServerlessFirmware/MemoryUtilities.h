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

unsigned long AddNumberToBufferWithSpecifiedBytes64Bit(unsigned char* buffer, uint64_t number, unsigned long startPoint, int numBytes)
{
	for(int i = 0; i < numBytes; i++)
	{
		char numToAdd = (number >> 8*( (numBytes-1) - i))%256;
		startPoint = AddCharToBuffer(buffer, startPoint, numToAdd);
	}

	return startPoint;
}

heepByte GetNumBytes64Bit(uint64_t number)
{
	heepByte numBytes = 0;
	while( (number >> numBytes*8) > 0)
	{
		numBytes++;
	}

	return numBytes;
}

void AddBufferToBuffer(heepByte* rxBuffer, heepByte* txBuffer, heepByte size, unsigned int *rxCounter, unsigned int *txCounter)
{
	for(int i = 0; i < size; i++)
	{
		rxBuffer[*rxCounter] = txBuffer[*txCounter];
		(*rxCounter)++;
		(*txCounter)++;
	}
}

#ifdef USE_ANALYTICS

static const char* base64_chars = 
             "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
             "abcdefghijklmnopqrstuvwxyz"
             "0123456789+/";

void base64_encode_Heep(heepByte* deviceID) {

	int in_len = STANDARD_ID_SIZE;
  	int base64PositionCounter = 0;
  	int i = 0;
  	int j = 0;
  	unsigned char char_array_3[3];
  	unsigned char char_array_4[4];
	
  	while (in_len--) {
    	char_array_3[i++] = *(deviceID++);
    	if (i == 3) {
      		char_array_4[0] = (char_array_3[0] & 0xfc) >> 2;
      		char_array_4[1] = ((char_array_3[0] & 0x03) << 4) + ((char_array_3[1] & 0xf0) >> 4);
      		char_array_4[2] = ((char_array_3[1] & 0x0f) << 2) + ((char_array_3[2] & 0xc0) >> 6);
      		char_array_4[3] = char_array_3[2] & 0x3f;
		
      		for(i = 0; (i <4) ; i++)
      		{
      			base64DeviceIDByte[base64PositionCounter] = base64_chars[char_array_4[i]];
      			base64PositionCounter++;
      		}
      		  
      		i = 0;
    	}
  }

  if (i)
  {
    	for(j = i; j < 3; j++)
    	  	char_array_3[j] = '\0';
	
    	char_array_4[0] = ( char_array_3[0] & 0xfc) >> 2;
    	char_array_4[1] = ((char_array_3[0] & 0x03) << 4) + ((char_array_3[1] & 0xf0) >> 4);
    	char_array_4[2] = ((char_array_3[1] & 0x0f) << 2) + ((char_array_3[2] & 0xc0) >> 6);
	
    	for (j = 0; (j < i + 1); j++)
    	{
    		base64DeviceIDByte[base64PositionCounter] = base64_chars[char_array_4[j]];
    		base64PositionCounter++;
    	}
	
    	while((i++ < 3))
    	{
    	  	base64DeviceIDByte[base64PositionCounter] = '=';
    	  	base64PositionCounter++;
    	}
  }

}

#endif