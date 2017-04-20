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

unsigned char deviceMemory [MAX_MEMORY];
int curFilledMemory = 0; // Indicate the curent filled memory. 
						 // Also serve as a place holder to 
						 // show the back of allocated memory

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

void SetXYInMemory(int x, int y, unsigned long deviceID)
{
	AddNewCharToMemory(FrontEndPositionOpCode);
	AddDeviceIDToMemory(deviceID);
	AddNewCharToMemory((char)4);
	AddNumberToMemoryWithSpecifiedBytes(x, 2);
	AddNumberToMemoryWithSpecifiedBytes(y, 2);
}

void SetIPInMemory(HeepIPAddress theIP, unsigned long deviceID)
{
	AddNewCharToMemory(DeviceIPOpCode);
	AddDeviceIDToMemory(deviceID);
	AddNewCharToMemory((char)4);
	AddIPToMemory(theIP);
}

void SetVertexInMemory(Vertex theVertex)
{
	AddNewCharToMemory(VertexOpCode);
	AddDeviceIDToMemory(theVertex.txID);
	AddNewCharToMemory((char)10);
	AddDeviceIDToMemory(theVertex.rxID);
	AddNewCharToMemory(theVertex.txControlID);
	AddNewCharToMemory(theVertex.rxControlID);
	AddIPToMemory(theVertex.rxIPAddress);
}
