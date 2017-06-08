#include "DeviceMemory.h"

unsigned int firmwareVersion = FIRMWARE_VERSION;

Control controlList [NUM_CONTROLS];
unsigned int numberOfControls = 0;

unsigned int vertexPointerList[NUM_VERTICES];
unsigned int numberOfVertices = 0;

void ClearControls()
{
	numberOfControls = 0;
}

void ClearVertices()
{
	numberOfVertices = 0;
}

void AddControl(Control myControl)
{
	controlList[numberOfControls] = myControl;
	numberOfControls++;
}

unsigned char isVertexEqual(Vertex &vertex1, Vertex &vertex2)
{
	unsigned char vertexIsEqual = 1;

	if(vertex1.txID != vertex2.txID)
		vertexIsEqual = 0;

	if(vertex1.rxID != vertex2.rxID)
		vertexIsEqual = 0;

	if(vertex1.rxControlID != vertex2.rxControlID)
		vertexIsEqual = 0;

	if(vertex1.txControlID != vertex2.txControlID)
		vertexIsEqual = 0;

	return vertexIsEqual;
}

void AddVertexPointer(unsigned int pointer)
{
	vertexPointerList[numberOfVertices] = pointer;
	numberOfVertices++;
}

void AddVertex(Vertex myVertex)
{
	unsigned int pointerToVertex = SetVertexInMemory(myVertex);
	AddVertexPointer(pointerToVertex);
}

void RemoveVertexListEntry(unsigned int pointer)
{
	for(int i = pointer; i < numberOfVertices-1; i++)
	{
		vertexPointerList[i] = vertexPointerList[i+1];
	}

	numberOfVertices--;
}

int DeleteVertex(Vertex myVertex)
{
	for(int i = 0; i < numberOfVertices; i++)
	{
		Vertex newVertex;
		if(GetVertexAtPonter(vertexPointerList[i], newVertex) == 0)
		{
			if(isVertexEqual(myVertex, newVertex))
			{
				DeleteVertexAtPointer(vertexPointerList[i]);
				RemoveVertexListEntry(i);
				return 0;
			}
		}
	}

	return 1;
}

void FillVertexListFromMemory()
{
	unsigned int pointer = 0;
	unsigned int counter = 0;

	while(GetNextVertexPointer(pointer, counter) == 0)
	{
		AddVertexPointer(pointer);
	}
}

void SetDeviceName(char* deviceName)
{
	int deviceNameLength = strlen(deviceName);
	SetDeviceNameInMemory(deviceName, deviceNameLength, deviceID);
}

int SetControlValueByID(unsigned char controlID, unsigned int value, unsigned char setFromNetwork = 0)
{
	for(int i = 0; i < numberOfControls; i++)
	{
		if(controlList[i].controlID == controlID)
		{
			controlList[i].curValue = value;

			if(setFromNetwork)
				controlList[i].controlFlags = 0x01;

			return 0;
		}
	}

	return 1;
}	

int SetControlValueByIDFromNetwork(unsigned char controlID, unsigned int value)
{
	return SetControlValueByID(controlID, value, 1);
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
