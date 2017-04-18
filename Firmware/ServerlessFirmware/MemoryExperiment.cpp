#include <iostream>
#include "DeviceMemory.h"

#define MEMORY_SIZE 1024

using namespace std;

char miscMemory [MEMORY_SIZE];
int EndOfMemory = 0;

void ClearMemory() 
{
	for (int i = 0; i < MEMORY_SIZE; i++)
	{
		miscMemory[i] = 0x00;
	}
}

int AddThingToMemory(int thing)
{
	int pointer = EndOfMemory;
	miscMemory[EndOfMemory] = thing;
	EndOfMemory++;

	return pointer;
}

int Add4ThingsToMemory(int thing1,int thing2,int thing3, int thing4)
{
	int pointer = EndOfMemory;
	miscMemory[EndOfMemory] = thing1;
	EndOfMemory++;
	miscMemory[EndOfMemory] = thing2;
	EndOfMemory++;
	miscMemory[EndOfMemory] = thing3;
	EndOfMemory++;
	miscMemory[EndOfMemory] = thing4;
	EndOfMemory++;

	return pointer;
}

int main(void)
{
	AddThingToMemory(4);
	AddThingToMemory(1);
	int pointer = AddThingToMemory(3);
	Add4ThingsToMemory(1, 4,2,5);
	AddThingToMemory(2);

	cout << (int)miscMemory[pointer] << endl;

	unsigned char oc4 = 0;
	unsigned char oc3 = 0;
	unsigned char oc2 = 0;
	unsigned char oc1 = 0;
	GetDeviceIDOctets(0x00030201, oc4, oc3, oc2, oc1);
	cout << (int)oc4 << " " << (int)oc3 << " " << (int)oc2 << " " << (int)oc1 << endl;

	SetDeviceNameInMemory("Hello", 5, 0x05040601);
	SetIconIDInMemory(10, 0x01020304);
	SetIconDataInMemory("abcdefghijklmnopqrstuvwxyz", 25, 0x09010503);
	SetXYInMemory(257, 257, 0x03050105);

	HeepIPAddress myIP;
	myIP.Octet4 = 192;
	myIP.Octet3 = 100;
	myIP.Octet2 = 1;
	myIP.Octet1 = 100;
	SetIPInMemory(myIP, 0x01020304);

	Vertex theVertex;
	theVertex.rxID = 0x01020304;
	theVertex.txID = 0x04030201;
	theVertex.rxControlID = 0x05;
	theVertex.txControlID = 0x02;
	theVertex.rxIPAddress = myIP;
	SetVertexInMemory(theVertex);

	std::cout << std::showbase << std::hex;
	for(int i = 0; i < curFilledMemory; i++)
	{
		cout << (unsigned short)deviceMemory[i] << " ";
	}

	cout << endl;

	return 0;
}