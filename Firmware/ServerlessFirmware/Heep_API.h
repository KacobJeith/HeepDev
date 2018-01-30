#include "ActionAndResponseOpCodes.h"
#include "Scheduler.h"

// Prototypes
void CommitMemory();

unsigned char clearMemory = 1;
void SetupHeepDevice(char* deviceName)
{	
	base64_encode_Heep(deviceIDByte);
	
	if(clearMemory)
	{
		ClearMemory();
		SetDeviceName(deviceName);
		CommitMemory();
	}
	else
	{
		ReadMemory(&controlRegister, deviceMemory, &curFilledMemory);
		FillVertexListFromMemory();
	}
}

void FactoryReset(char* deviceName)
{
	clearMemory = 1;
	SetupHeepDevice(deviceName);
	clearMemory = 0;
}

void SendOutputByIDNoAnalytics(unsigned char controlID, unsigned int value)
{
	SetControlValueByID(controlID, value, 0);

	struct Vertex_Byte newVertex;

	for(int i = 0; i < numberOfVertices; i++)
	{
		GetVertexAtPointer_Byte(vertexPointerList[i], &newVertex);

		if(CheckBufferEquality(newVertex.txID, deviceIDByte, STANDARD_ID_SIZE) && newVertex.txControlID == controlID)
		{
			if(CheckBufferEquality(newVertex.txID, newVertex.rxID, STANDARD_ID_SIZE))
			{
				SetControlValueByID(newVertex.rxControlID, value, 0);
			}
			else
			{
				FillOutputBufferWithSetValCOP(newVertex.rxControlID, value);
				SendOutputBufferToIP(newVertex.rxIPAddress);
			}
		}
	}
}

void SendOutputByID(unsigned char controlID, unsigned int value)
{
	SendOutputByIDNoAnalytics(controlID, value);

	SetAnalyticsDataControlValueInMemory_Byte(controlID, value, deviceIDByte);
}

void SendOutputByIDBuffer(unsigned char controlID, heepByte* buffer, int bufferLength)
{
	SetControlValueByIDBuffer(controlID, buffer, 0, bufferLength, 0);

	struct Vertex_Byte newVertex;

	for(int i = 0; i < numberOfVertices; i++)
	{
		GetVertexAtPointer_Byte(vertexPointerList[i], &newVertex);

		if(CheckBufferEquality(newVertex.txID, deviceIDByte, STANDARD_ID_SIZE) && newVertex.txControlID == controlID)
		{
			if(CheckBufferEquality(newVertex.txID, newVertex.rxID, STANDARD_ID_SIZE))
			{
				SetControlValueByIDBuffer(newVertex.rxControlID, buffer, 0, bufferLength, 0);
			}
			else
			{
				FillOutputBufferWithSetValCOPBuffer(newVertex.rxControlID, buffer, bufferLength);
				SendOutputBufferToIP(newVertex.rxIPAddress);
			}
		}
	}
}

void HandlePointersOnMemoryChange()
{
	FillVertexListFromMemory();
}

enum Tasks {Defragment = 0, saveMemory = 1};
void SetupHeepTasks()
{
	ScheduleTask(Defragment);
	ScheduleTask(saveMemory);
}	

void CommitMemory()
{
	if(memoryChanged)
	{
		SaveMemory(controlRegister, deviceMemory, curFilledMemory);
		memoryChanged = 0;

		HandlePointersOnMemoryChange();
	}
}

// Control Daemon is untimed
void ControlDaemon()
{
	for(int i = 0; i < numberOfControls; i++)
	{
		if(controlList[i].controlFlags & 0x01)
		{
			SendOutputByID(controlList[i].controlID, controlList[i].curValue);
			controlList[i].controlFlags ^= 1 << 0; // Toggle Send to 0
		}
	}
}

void PerformHeepTasks()
{
	if(IsTaskTime())
	{
		unsigned char curTask = GetCurrentTask();

		if(curTask == Defragment)
		{
			DefragmentMemory();
		}
		else if(curTask == saveMemory)
		{
			CommitMemory();
		}
	}
//
	CheckServerForInputs();
	ControlDaemon();
}