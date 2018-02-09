#include "DeviceMemory.h"

unsigned int firmwareVersion = FIRMWARE_VERSION;

struct Control controlList [NUM_CONTROLS];
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

void AddControl(struct Control myControl)
{
	controlList[numberOfControls] = myControl;
	numberOfControls++;
}

unsigned char isVertexEqual(struct Vertex_Byte* vertex1, struct Vertex_Byte* vertex2)
{
	unsigned char vertexIsEqual = 1;

	if(CheckBufferEquality((*vertex1).txID, (*vertex2).txID, STANDARD_ID_SIZE) == 0)
		vertexIsEqual = 0;

	if(CheckBufferEquality((*vertex1).rxID, (*vertex2).rxID, STANDARD_ID_SIZE) == 0)
		vertexIsEqual = 0;

	if((*vertex1).rxControlID != (*vertex2).rxControlID)
		vertexIsEqual = 0;

	if((*vertex1).txControlID != (*vertex2).txControlID)
		vertexIsEqual = 0;

	return vertexIsEqual;
}

void AddVertexPointer(unsigned int pointer)
{
	vertexPointerList[numberOfVertices] = pointer;
	numberOfVertices++;
}

void AddVertex(struct Vertex_Byte myVertex)
{
	unsigned int pointerToVertex = SetVertexInMemory_Byte(myVertex);
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

int DeleteVertex(struct Vertex_Byte myVertex)
{
	for(int i = 0; i < numberOfVertices; i++)
	{
		struct Vertex_Byte newVertex;
		if(GetVertexAtPointer_Byte(vertexPointerList[i], &newVertex) == 0)
		{
			if(isVertexEqual(&myVertex, &newVertex))
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
	numberOfVertices = 0;

	unsigned int pointer = 0;
	unsigned int counter = 0;

	while(GetNextVertexPointer(&pointer, &counter) == 0)
	{
		AddVertexPointer(pointer);
	}
}

void SetDeviceName(char* deviceName)
{
	int deviceNameLength = strlen(deviceName);
	SetDeviceNameInMemory_Byte(deviceName, deviceNameLength, deviceIDByte);
}

void SetDeviceIcon(char deviceIcon)
{
	SetIconIDInMemory_Byte(deviceIcon, deviceIDByte);
}

int SetControlValueByID(unsigned char controlID, unsigned int value, unsigned char setFromNetwork)
{
	for(int i = 0; i < numberOfControls; i++)
	{
		if(controlList[i].controlID == controlID)
		{
			controlList[i].curValue = value;

#ifdef USE_ANALYTICS
			SetAnalyticsDataControlValueInMemory_Byte(controlID, value, deviceIDByte);
#endif

			if(setFromNetwork)
				controlList[i].controlFlags = 0x01;

			return 0;
		}
	}

	return 1;
}	

heepByte GetControlTypeFromControlID(heepByte controlID)
{
	for(int i = 0; i < numberOfControls; i++)
	{
		if(controlList[i].controlID == controlID)
		{
			return controlList[i].controlType;
		}
	}

	return 0; // ToDo: Make return something invalid
}

int SetControlValueByIDBuffer(unsigned char controlID, heepByte* buffer, int bufferStartPoint, int bufferLength, unsigned char setFromNetwork)
{
	for(int i = 0; i < numberOfControls; i++)
	{
		if(controlList[i].controlID == controlID)
		{
			for(int j = 0; j < bufferLength; j++)
			{
				controlList[i].controlBuffer[j] = buffer[j + bufferStartPoint];
			}

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

int SetControlValueByIDFromNetworkBuffer(unsigned char controlID, heepByte* buffer, int bufferStartPoint, int bufferLength)
{
	return SetControlValueByIDBuffer(controlID, buffer, bufferStartPoint, bufferLength, 1);
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
