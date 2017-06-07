#include "AutoGeneratedInfo.h"
#include "CommonDataTypes.h"

// OPCodes
const unsigned char ClientDataOpCode = 0x01;
const unsigned char ControlOpCode = 0x02;
const unsigned char VertexOpCode = 0x03;
const unsigned char IconIDOpCode = 0x04;
const unsigned char CustomIconDrawingOpCode = 0x05;
const unsigned char DeviceNameOpCode = 0x06;
const unsigned char FrontEndPositionOpCode = 0x07;
const unsigned char DeviceIPOpCode = 0x08;

const unsigned char IsHeepDeviceOpCode = 0x09;
const unsigned char SetValueOpCode = 0x0A;
const unsigned char SetPositionOpCode = 0x0B;
const unsigned char SetVertexOpCode = 0x0C;
const unsigned char DeleteVertexOpCode = 0x0D;
const unsigned char EchoOpCode = 0x0E;

const unsigned char MemoryDumpOpCode = 0x0F;
const unsigned char SuccessOpCode = 0x10;
const unsigned char ErrorOpCode = 0x11;

const unsigned char FragmentOpCode = 0x12;

const unsigned char AddMOPOpCode = 0x13;
const unsigned char DynamicMemorySizeOpCode = 0x14;
const unsigned char DeleteMOPOpCode = 0x15;
const unsigned char LocalDeviceIDOpCode = 0x16;

unsigned char deviceMemory [MAX_MEMORY];
unsigned int curFilledMemory = 0; // Indicate the curent filled memory. 
						 // Also serve as a place holder to 
						 // show the back of allocated memory
unsigned char memoryChanged = 0;

unsigned char controlRegister = 0;

unsigned long GetDeviceIDFromIndex(unsigned long index);
unsigned long GetIndexedDeviceID(unsigned long deviceID);

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

void PerformPreOpCodeProcessing(unsigned long deviceID)
{
	GetIndexedDeviceID(deviceID);
}

void SetControlRegister()
{
#ifdef USE_INDEXED_IDS
		controlRegister |= 0x04;

	#if ID_SIZE == 2
		controlRegister |= 0x01;
	#elif ID_SIZE == 3
		controlRegister |= 0x02;
	#elif ID_SIZE == 4
		controlRegister |= 0x03;
	#endif
#endif
}

unsigned long GetNumberFromBuffer(unsigned char* buffer, unsigned int &counter, unsigned char numBytes)
{
	unsigned long number = 0;

	for(int i = 0; i < numBytes; i++)
	{
		int curNum = buffer[counter];
		number += curNum << (8 * (numBytes-i-1));
		counter++;
	}

	return number;
}

unsigned int SkipOpCode(unsigned int counter)
{
	counter += ID_SIZE + 1;

	unsigned int bytesToSkip = deviceMemory[counter];
	counter += bytesToSkip + 1;

	return counter;
}

void ClearDeviceMemory()
{
	curFilledMemory = 0;
}

unsigned long AddCharToBuffer(unsigned char* buffer, unsigned long startPoint, unsigned char value)
{
	buffer[startPoint] = value;
	startPoint++;
	return startPoint;
}

void AddNewCharToMemory(unsigned char newMem)
{
	curFilledMemory = AddCharToBuffer(deviceMemory, curFilledMemory, newMem);
	memoryChanged = 1;
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

void CreateBufferFromNumber(heepByte* buffer, unsigned long number, heepByte size)
{
	AddNumberToBufferWithSpecifiedBytes(buffer, number, 0, size);
}

void AddNumberToMemoryWithSpecifiedBytes(unsigned long number, int numBytes)
{
	curFilledMemory = AddNumberToBufferWithSpecifiedBytes(deviceMemory, number, curFilledMemory, numBytes);
}

// DEPRECATE * 
unsigned long AddDeviceIDToBuffer(unsigned char* buffer, unsigned long startPoint, unsigned long deviceID) 
{
	return AddNumberToBufferWithSpecifiedBytes(buffer, deviceID, startPoint, STANDARD_ID_SIZE);
}

// DEPRECATE
void AddIndexToMemory(unsigned long deviceIndex)
{
	AddNumberToMemoryWithSpecifiedBytes(deviceIndex, ID_SIZE);
}

void AddDeviceIDToMemory_Byte(heepByte* deviceID)
{
	curFilledMemory = AddDeviceIDToBuffer_Byte(deviceMemory, deviceID, curFilledMemory);
}

// Deprecate
void AddDeviceIDToMemory(unsigned long deviceID)
{
	curFilledMemory = AddDeviceIDToBuffer(deviceMemory, curFilledMemory, deviceID);
}

void AddIndexOrDeviceIDToMemory(unsigned long deviceID)
{
	unsigned long index = GetIndexedDeviceID(deviceID);
	AddIndexToMemory(index);
}

void AddIPToMemory(HeepIPAddress theIP)
{
	AddNewCharToMemory(theIP.Octet4);
	AddNewCharToMemory(theIP.Octet3);
	AddNewCharToMemory(theIP.Octet2);
	AddNewCharToMemory(theIP.Octet1);
}

void SetDeviceNameInMemory(char* deviceName, int numCharacters, unsigned long deviceID)
{
	PerformPreOpCodeProcessing(deviceID);

	AddNewCharToMemory(DeviceNameOpCode);
	AddIndexOrDeviceIDToMemory(deviceID);
	AddNewCharToMemory((char)numCharacters);

	for(int i = 0; i < numCharacters; i++)
	{
		AddNewCharToMemory(deviceName[i]);
	}
}

void SetIconIDInMemory(char iconID, unsigned long deviceID)
{
	PerformPreOpCodeProcessing(deviceID);

	AddNewCharToMemory(IconIDOpCode);
	AddIndexOrDeviceIDToMemory(deviceID);
	AddNewCharToMemory(1);
	AddNewCharToMemory(iconID);
}

void SetIconDataInMemory(char* iconData, int numCharacters, unsigned long deviceID)
{
	PerformPreOpCodeProcessing(deviceID);

	AddNewCharToMemory(CustomIconDrawingOpCode); 
	AddIndexOrDeviceIDToMemory(deviceID);
	AddNewCharToMemory((char)numCharacters);

	for(int i = 0; i < numCharacters; i++)
	{
		AddNewCharToMemory(iconData[i]);
	}
}

unsigned int ParseXYOpCode(int &x, int &y, unsigned long &deviceID, unsigned int counter)
{
	counter ++;

	deviceID = GetNumberFromBuffer(deviceMemory, counter, ID_SIZE);
	GetNumberFromBuffer(deviceMemory, counter, 1);
	x = GetNumberFromBuffer(deviceMemory, counter, 2);
	y = GetNumberFromBuffer(deviceMemory, counter, 2);

	return counter;
}

unsigned int GetXYFromMemory(int &x, int &y, unsigned long deviceID, unsigned int &XYMemPosition)
{
	unsigned int counter = 0;

	deviceID = GetIndexedDeviceID(deviceID);

	while(counter < curFilledMemory)
	{
		if(deviceMemory[counter] == FrontEndPositionOpCode)
		{
			XYMemPosition = counter;

			unsigned long tempDeviceID = 0;
			counter = ParseXYOpCode(x, y, tempDeviceID, counter);

			if(tempDeviceID == deviceID)
			{
				return 0;
			}
		}
		else
		{
			counter = SkipOpCode(counter);
		}
	}

	return 1;
}

void SetXYInMemory(int x, int y, unsigned long deviceID)
{
	PerformPreOpCodeProcessing(deviceID);

	AddNewCharToMemory(FrontEndPositionOpCode);
	AddIndexOrDeviceIDToMemory(deviceID);
	AddNewCharToMemory((char)4);
	AddNumberToMemoryWithSpecifiedBytes(x, 2);
	AddNumberToMemoryWithSpecifiedBytes(y, 2);
}

void UpdateXYInMemory(int x, int y, unsigned long deviceID)
{
	int curX = 0; int curY = 0; 
	unsigned int XYMemPosition = 0;
	unsigned int success = GetXYFromMemory(curX, curY, deviceID, XYMemPosition);

	if(success == 0)
	{
		deviceMemory[XYMemPosition + ID_SIZE + 2] = (x >> 8)%256;
		deviceMemory[XYMemPosition + ID_SIZE + 3] = (x%256);
		deviceMemory[XYMemPosition + ID_SIZE + 4] = (y >> 8)%256;
		deviceMemory[XYMemPosition + ID_SIZE + 5] = (y%256);
	}
	else
	{
		SetXYInMemory(x, y, deviceID);
	}

	memoryChanged = 1;
}

void SetIPInMemory(HeepIPAddress theIP, unsigned long deviceID)
{
	PerformPreOpCodeProcessing(deviceID);

	AddNewCharToMemory(DeviceIPOpCode);
	AddIndexOrDeviceIDToMemory(deviceID);
	AddNewCharToMemory((char)4);
	AddIPToMemory(theIP);
}

void DeleteVertexAtPointer(unsigned long pointer)
{
	deviceMemory[pointer] = FragmentOpCode;
	memoryChanged = 1;
}

int GetVertexAtPonter(unsigned long pointer, Vertex &returnedVertex)
{
	if(deviceMemory[pointer] != VertexOpCode)
		return 1;

	unsigned int counter = pointer + 1;

	returnedVertex.txID = GetDeviceIDFromIndex(GetNumberFromBuffer(deviceMemory, counter, ID_SIZE));
	int numBytes = GetNumberFromBuffer(deviceMemory, counter, 1);
	returnedVertex.rxID = GetDeviceIDFromIndex(GetNumberFromBuffer(deviceMemory, counter, ID_SIZE));
	returnedVertex.txControlID = GetNumberFromBuffer(deviceMemory, counter, 1);
	returnedVertex.rxControlID = GetNumberFromBuffer(deviceMemory, counter, 1);
	returnedVertex.rxIPAddress.Octet4 = GetNumberFromBuffer(deviceMemory, counter, 1);
	returnedVertex.rxIPAddress.Octet3 = GetNumberFromBuffer(deviceMemory, counter, 1);
	returnedVertex.rxIPAddress.Octet2 = GetNumberFromBuffer(deviceMemory, counter, 1);
	returnedVertex.rxIPAddress.Octet1 = GetNumberFromBuffer(deviceMemory, counter, 1);

	return 0;
}

int SetVertexInMemory(Vertex theVertex)
{
	PerformPreOpCodeProcessing(theVertex.rxID);
	PerformPreOpCodeProcessing(theVertex.txID);

	int beginningOfMemory = curFilledMemory;

	AddNewCharToMemory(VertexOpCode);
	AddIndexOrDeviceIDToMemory(theVertex.txID);
	AddNewCharToMemory((char)ID_SIZE+6);
	AddIndexOrDeviceIDToMemory(theVertex.rxID);
	AddNewCharToMemory(theVertex.txControlID);
	AddNewCharToMemory(theVertex.rxControlID);
	AddIPToMemory(theVertex.rxIPAddress);

	memoryChanged = 1;

	return beginningOfMemory;
}

int GetNextVertexPointer(unsigned int &pointer,unsigned int &counter)
{
	while(counter < curFilledMemory)
	{
		if(deviceMemory[counter] == VertexOpCode)
		{
			pointer = counter;

			counter = SkipOpCode(counter);
			return 0;
		}
		else
		{
			counter = SkipOpCode(counter);
		}
	}

	return 1;
}

unsigned int GetFragmentFromMemory(int &pointerToFragment, int &numFragementBytes)
{
	unsigned int counter = 0;

	while(counter < curFilledMemory)
	{
		if(deviceMemory[counter] == FragmentOpCode)
		{
			pointerToFragment = counter;

			numFragementBytes = 2 + ID_SIZE + deviceMemory[counter + ID_SIZE + 1];

			return 0;
		}
		else
		{
			counter = SkipOpCode(counter);
		}
	}

	return 1;
}

void RemoveUnusedBytesAtPointer(int pointer, int numBytes)
{
	for(int i = 0; i < curFilledMemory - numBytes - pointer; i++)
	{
		deviceMemory[pointer+i] = deviceMemory[pointer+numBytes+i];
	}

	curFilledMemory -= numBytes;
}

void DefragmentMemory()
{
	int isFragmentFound = 0;
	do
	{
		int pointerToFragment = 0; int numFragementBytes = 0;
		isFragmentFound = GetFragmentFromMemory(pointerToFragment, numFragementBytes);

		if(isFragmentFound == 0)
		{
			RemoveUnusedBytesAtPointer(pointerToFragment, numFragementBytes);
			memoryChanged = 1;
		}

	}while(isFragmentFound == 0);
}

// Returns True if Index ID Used. Returns False if True ID Used
// Always expects true ID as input
heepByte GetIndexedDeviceID_Byte(heepByte* deviceID, unsigned long &localID)
{
#ifdef USE_INDEXED_IDS
	unsigned int counter = 0;
	unsigned long topIndex = 0;

	// Find Indexed ID
	while(counter < curFilledMemory)
	{
		if(deviceMemory[counter] == LocalDeviceIDOpCode)
		{
			counter++;
			unsigned long indexedValue = GetNumberFromBuffer(deviceMemory, counter, ID_SIZE);
			counter++;

			heepByte foundID [STANDARD_ID_SIZE];
			counter = GetFullDeviceIDFromBuffer(deviceMemory, foundID, counter);

			if(indexedValue == topIndex)
			{
				topIndex = indexedValue + 1;
			}

			// cout << "Counter: " << counter << endl;
			// cout << "Cur Index: " << indexedValue << endl;
			// cout << "Found: ";
			// for(int i = 0; i < STANDARD_ID_SIZE; i++)
			// {
			// 	cout << (int)foundID[i] << ' ';
			// }
			// cout << endl;

			// cout << "Want: ";
			// for(int i = 0; i < STANDARD_ID_SIZE; i++)
			// {
			// 	cout << (int)deviceID[i] << ' ';
			// }
			// cout << endl;

			if(CheckBufferEquality(deviceID, foundID, STANDARD_ID_SIZE))
			{
				localID = indexedValue;
				return 1;
			}
		}
		else
		{
			counter = SkipOpCode(counter);
		}
	}

	// If Not Indexed, then index it!
	AddNewCharToMemory(LocalDeviceIDOpCode);
	AddIndexToMemory(topIndex);
	AddNewCharToMemory(STANDARD_ID_SIZE);
	AddDeviceIDToMemory_Byte(deviceID);

	localID = topIndex;
	return 1;
#else 
	return 0;
#endif
}

// DEPRECATE
unsigned long GetIndexedDeviceID(unsigned long deviceID)
{
#ifdef USE_INDEXED_IDS
	unsigned int counter = 0;
	unsigned long topIndex = 0;

	// Find Indexed ID
	while(counter < curFilledMemory)
	{
		if(deviceMemory[counter] == LocalDeviceIDOpCode)
		{
			counter++;
			unsigned long indexedValue = GetNumberFromBuffer(deviceMemory, counter, ID_SIZE);
			counter++;
			unsigned long foundID = GetNumberFromBuffer(deviceMemory, counter, STANDARD_ID_SIZE);

			if(indexedValue == topIndex)
			{
				topIndex = indexedValue + 1;
			}

			if(foundID == deviceID)
				return indexedValue;
		}
		else
		{
			counter = SkipOpCode(counter);
		}
	}

	// If Not Indexed, then index it!
	AddNewCharToMemory(LocalDeviceIDOpCode);
	AddIndexToMemory(topIndex);
	AddNewCharToMemory(STANDARD_ID_SIZE);
	AddDeviceIDToMemory(deviceID);

	return topIndex;
#else 
	return deviceID; // Index is just device ID
#endif
}

unsigned long GetDeviceIDFromIndex(unsigned long index)
{
#ifdef USE_INDEXED_IDS

	unsigned int counter = 0;

	// Find Indexed ID
	while(counter < curFilledMemory)
	{
		if(deviceMemory[counter] == LocalDeviceIDOpCode)
		{
			counter++;
			unsigned long indexedValue = GetNumberFromBuffer(deviceMemory, counter, ID_SIZE);
			counter++;
			unsigned long foundID = GetNumberFromBuffer(deviceMemory, counter, STANDARD_ID_SIZE);

			if(indexedValue == index)
			{
				return foundID;
			}
		}
		else
		{
			counter = SkipOpCode(counter);
		}
	}

	return 0;

#else
	return index; // Index is just device ID!
#endif
}
