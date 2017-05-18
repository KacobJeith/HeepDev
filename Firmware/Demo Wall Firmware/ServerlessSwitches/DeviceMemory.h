#include "globalDefines.h"
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

unsigned char deviceMemory [MAX_MEMORY];
unsigned int curFilledMemory = 0; // Indicate the curent filled memory. 
						 // Also serve as a place holder to 
						 // show the back of allocated memory
unsigned char memoryChanged = 0;


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
	counter += 5;

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

void GetDeviceIDOctets(unsigned long deviceID, unsigned char &octet4, unsigned char &octet3, unsigned char &octet2, unsigned char &octet1)
{
	octet1 = deviceID%256;
	octet2 = (deviceID >> 8)%256;
	octet3 = (deviceID >> 16)%256;
	octet4 = (deviceID >> 24)%256;
}

void AddNumberToMemoryWithSpecifiedBytes(unsigned int number, int numBytes)
{
	for(int i = 0; i < numBytes; i++)
	{
		char numToAdd = (number >> 8*( (numBytes-1) - i))%256;
		AddNewCharToMemory(numToAdd);
	}
}

unsigned long AddDeviceIDToBuffer(unsigned char* buffer, unsigned long startPoint, unsigned long deviceID)
{
	unsigned char DeviceID4 = 0;
	unsigned char DeviceID3 = 0;
	unsigned char DeviceID2 = 0;
	unsigned char DeviceID1 = 0;
	GetDeviceIDOctets(deviceID, DeviceID4, DeviceID3, DeviceID2, DeviceID1);

	startPoint = AddCharToBuffer(buffer, startPoint, DeviceID4);
	startPoint = AddCharToBuffer(buffer, startPoint, DeviceID3);
	startPoint = AddCharToBuffer(buffer, startPoint, DeviceID2);
	startPoint = AddCharToBuffer(buffer, startPoint, DeviceID1);

	return startPoint;
}

void AddDeviceIDToMemory(unsigned long deviceID)
{
	curFilledMemory = AddDeviceIDToBuffer(deviceMemory, curFilledMemory, deviceID);
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
	AddNewCharToMemory(DeviceNameOpCode);
	AddDeviceIDToMemory(deviceID);
	AddNewCharToMemory((char)numCharacters);

	for(int i = 0; i < numCharacters; i++)
	{
		AddNewCharToMemory(deviceName[i]);
	}
}

void SetIconIDInMemory(char iconID, unsigned long deviceID)
{
	AddNewCharToMemory(IconIDOpCode);
	AddDeviceIDToMemory(deviceID);
	AddNewCharToMemory(1);
	AddNewCharToMemory(iconID);
}

void SetIconDataInMemory(char* iconData, int numCharacters, unsigned long deviceID)
{
	AddNewCharToMemory(CustomIconDrawingOpCode); 
	AddDeviceIDToMemory(deviceID);
	AddNewCharToMemory((char)numCharacters);

	for(int i = 0; i < numCharacters; i++)
	{
		AddNewCharToMemory(iconData[i]);
	}
}

unsigned int ParseXYOpCode(int &x, int &y, unsigned long &deviceID, unsigned int counter)
{
	counter ++;

	deviceID = GetNumberFromBuffer(deviceMemory, counter, 4);
	GetNumberFromBuffer(deviceMemory, counter, 1);
	x = GetNumberFromBuffer(deviceMemory, counter, 2);
	y = GetNumberFromBuffer(deviceMemory, counter, 2);

	return counter;
}

unsigned int GetXYFromMemory(int &x, int &y, unsigned long deviceID, unsigned int &XYMemPosition)
{
	unsigned int counter = 0;

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
	AddNewCharToMemory(FrontEndPositionOpCode);
	AddDeviceIDToMemory(deviceID);
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
		deviceMemory[XYMemPosition + 6] = (x >> 8)%256;
		deviceMemory[XYMemPosition + 7] = (x%256);
		deviceMemory[XYMemPosition + 8] = (y >> 8)%256;
		deviceMemory[XYMemPosition + 9] = (y%256);
	}
	else
	{
		SetXYInMemory(x, y, deviceID);
	}

	memoryChanged = 1;
}

void SetIPInMemory(HeepIPAddress theIP, unsigned long deviceID)
{
	AddNewCharToMemory(DeviceIPOpCode);
	AddDeviceIDToMemory(deviceID);
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

	returnedVertex.txID = GetNumberFromBuffer(deviceMemory, counter, 4);
	int numBytes = GetNumberFromBuffer(deviceMemory, counter, 1);
	returnedVertex.rxID = GetNumberFromBuffer(deviceMemory, counter, 4);
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
	int beginningOfMemory = curFilledMemory;

	AddNewCharToMemory(VertexOpCode);
	AddDeviceIDToMemory(theVertex.txID);
	AddNewCharToMemory((char)10);
	AddDeviceIDToMemory(theVertex.rxID);
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

			numFragementBytes = 6 + deviceMemory[counter+5];

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
