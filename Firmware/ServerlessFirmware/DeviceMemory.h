#include "globalDefines.h"

// OPCodes
const char ClientDataOpCode = 0x01;
const char ControlOpCode = 0x02;
const char VertexOpCode = 0x03;
const char IconIDOpCode = 0x04;
const char CustomIconDrawingOpCode = 0x05;
const char ClientNameOpCode = 0x06;
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

void GetClientIDOctets(unsigned long clientID, char &octet4, char &octet3, char &octet2, char &octet1)
{
	octet1 = clientID%256;
	octet2 = (clientID >> 8)%256;
	octet3 = (clientID >> 16)%256;
	octet4 = (clientID >> 24)%256;
}

void AddNewCharToMemory(char newMem)
{
	deviceMemory[curFilledMemory] = newMem;
	curFilledMemory++;
}

void SetClientNameInMemory(char* clientName, int numCharacters, unsigned long clientID)
{
	char ClientID4 = 0;
	char ClientID3 = 0;
	char ClientID2 = 0;
	char ClientID1 = 0;
	GetClientIDOctets(clientID, ClientID4, ClientID3, ClientID2, ClientID1);

	AddNewCharToMemory(ClientNameOpCode);
	AddNewCharToMemory(ClientID4);
	AddNewCharToMemory(ClientID3);
	AddNewCharToMemory(ClientID2);
	AddNewCharToMemory(ClientID1);
	AddNewCharToMemory((char)numCharacters);

	for(int i = 0; i < numCharacters; i++)
	{
		AddNewCharToMemory(clientName[i]);
	}
}

