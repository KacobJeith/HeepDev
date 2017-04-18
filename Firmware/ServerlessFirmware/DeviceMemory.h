#include "globalDefines.h"

// OPCodes
const char ClientDataOpCode = 0x01;
const char ControlOpCode = 0x02;
const char VertexOpCode = 0x03;
const char IconIDOpCode = 0x04;
const char CustomIconDrawingOpCode = 0x05;
const char DeviceNameOpCode = 0x06;
const char FrontEndPositionOpCOde = 0x07;
const char ClientIPOpCode = 0x08;

const char IsHeepDeviceOpCode = 0x09;
const char SetValueOpCode = 0x0A;
const char SetPositionOpCode = 0x0B;
const char SetVertexOpCode = 0x0C;
const char DeleteVertexOpCode = 0x0D;
const char EchoOpCode = 0x0E;

const char MemoryDumpOpCode = 0x0F;
const char SuccessOpCode = 0x10;
const char ErrorOpCode = 0x11;

const char FragmentOpCode = 0x12;

char deviceMemory [MAX_MEMORY];
int curFilledMemory = 0; // Indicate the curent filled memory. 
						 // Also serve as a place holder to 
						 // show the back of allocated memory

void AddNewCharToMemory(char newMem)
{
	deviceMemory[curFilledMemory] = newMem;
	curFilledMemory++;
}

void GetDeviceIDOctets(unsigned long deviceID, char &octet4, char &octet3, char &octet2, char &octet1)
{
	octet1 = deviceID%256;
	octet2 = (deviceID >> 8)%256;
	octet3 = (deviceID >> 16)%256;
	octet4 = (deviceID >> 24)%256;
}

void AddDeviceIDToMemory(unsigned long deviceID)
{
	char DeviceID4 = 0;
	char DeviceID3 = 0;
	char DeviceID2 = 0;
	char DeviceID1 = 0;
	GetDeviceIDOctets(deviceID, DeviceID4, DeviceID3, DeviceID2, DeviceID1);

	AddNewCharToMemory(DeviceID4);
	AddNewCharToMemory(DeviceID3);
	AddNewCharToMemory(DeviceID2);
	AddNewCharToMemory(DeviceID1);
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


