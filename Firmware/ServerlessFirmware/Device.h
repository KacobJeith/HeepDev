#include "DeviceMemory.h"

unsigned long deviceID;
unsigned int firmwareVersion = FIRMWARE_VERSION;

Control controlList [NUM_CONTROLS];
unsigned int numberOfControls = 0;

VertexPointer vertexPointerList[NUM_VERTICES];
unsigned int numberOfVertices = 0;

void ClearControls()
{
	numberOfControls = 0;
}

void ClearVertices()
{
	numberOfVertices = 0;
}

void ClearOutputList()
{
	for(int i = 0; i < numberOfVertices; i++)
	{
		vertexPointerList[i].SendOutput = 0;
	}
}

void AddControl(Control myControl)
{
	controlList[numberOfControls] = myControl;
	numberOfControls++;
}

void AddVertex(Vertex myVertex)
{
	unsigned int pointerToVertex = SetVertexInMemory(myVertex);
	vertexPointerList[numberOfVertices].vertexAddress = pointerToVertex;
	numberOfVertices++;
}

void SetDeviceIDAndName(unsigned long newDeviceID, char* deviceName)
{
	deviceID = newDeviceID;

	int deviceNameLength = strlen(deviceName);
	SetDeviceNameInMemory(deviceName, deviceNameLength, newDeviceID);
}

int SetControlValueByID(unsigned char controlID, unsigned int value)
{
	for(int i = 0; i < numberOfControls; i++)
	{
		if(controlList[i].controlID == controlID)
		{
			controlList[i].curValue = value;
			return 0;
		}
	}

	return 1;
}	

int GetControlValueByID(unsigned controlID)
{
	for(int i = 0; i < numberOfControls; i++)
	{
		if(controlList[i].controlID == controlID)
		{
			return controlList[i].curValue;
		}
	}

	return 0;
}
