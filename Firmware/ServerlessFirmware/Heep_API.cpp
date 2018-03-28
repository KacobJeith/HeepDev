#include "Heep_API.h"
#include "MemoryUtilities.h"
#include "DeviceMemory.h"
#include "Device.h"
#include "Scheduler.h"
#include <string.h>

void SetupHeepDevice(char* deviceName, char deviceIcon)
{	
#ifdef USE_ANALYTICS
	base64_encode_Heep(deviceIDByte);
#endif
	
	if(clearMemory)
	{
		ClearMemory();
		SetDeviceName(deviceName);
		SetDeviceIcon(deviceIcon);
		CommitMemory();
	}
	else
	{
		ReadMemory(&controlRegister, deviceMemory, &curFilledMemory);
		FillVertexListFromMemory();
	}
}

void FactoryReset(char* deviceName, char iconEnum)
{
	clearMemory = 1;
	SetupHeepDevice(deviceName, iconEnum);
	clearMemory = 0;
}

void SendOutputByIDNoAnalytics(unsigned char controlID, unsigned int value)
{
	SetControlValueByID(controlID, value, 0);

	struct Vertex_Byte newVertex;

	int i;
	for(i = 0; i < numberOfVertices; i++)
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

#ifdef USE_ANALYTICS
	SetAnalyticsDataControlValueInMemory_Byte(controlID, value, deviceIDByte);
#endif
}

void SendOutputByIDBuffer(unsigned char controlID, heepByte* buffer, int bufferLength)
{
	SetControlValueByIDBuffer(controlID, buffer, 0, bufferLength, 0);

	struct Vertex_Byte newVertex;

	int i;
	for(i = 0; i < numberOfVertices; i++)
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

enum Tasks {Defragment = 0, saveMemory = 1, PostData = 2};
void SetupHeepTasks()
{
	ScheduleTask(Defragment);
	ScheduleTask(saveMemory);
	ScheduleTask(PostData);
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

#ifdef USE_ANALYTICS
void PostDataToFirebase()
{
	AddAnalyticsStringToOutputBufferAndDeleteMOPs();

	if(outputBufferLastByte > 0)
	{
		SendDataToFirebase(outputBuffer, outputBufferLastByte, base64DeviceIDByte, STANDARD_ID_SIZE_BASE_64);
	}
}
#endif

// Control Daemon is untimed
void ControlDaemon()
{
	int i;
	for(i = 0; i < numberOfControls; i++)
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
	if(resetHeepNetwork)
	{
		CreateInterruptServer();
		resetHeepNetwork = 0;
	}

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
#ifdef USE_ANALYTICS
		else if(curTask == PostData)
		{
			PostDataToFirebase();
		}
#endif
	}

	CheckServerForInputs();
	ControlDaemon();
}

void AddRangeControl(char* controlName, int inputOutput, int highValue, int lowValue, int startingValue)
{
	Control newControl;
	newControl.controlName = controlName;
	newControl.controlID = numberOfControls;
	newControl.controlDirection = inputOutput;
	newControl.controlType = HEEP_RANGE;
	newControl.highValue = highValue;
	newControl.lowValue = lowValue;
	newControl.curValue = startingValue;
	AddControl(newControl);
}

void AddOnOffControl(char* controlName, int inputOutput, int startingValue)
{
	Control newControl;
	newControl.controlName = controlName;
	newControl.controlID = numberOfControls;
	newControl.controlDirection = inputOutput;
	newControl.controlType = HEEP_ONOFF;
	newControl.highValue = 1;
	newControl.lowValue = 0;
	newControl.curValue = startingValue;
	AddControl(newControl);
}

int GetControlValueByName(char* controlName)
{
	for(int i = 0; i < numberOfControls; i++)
	{
		if(strcmp(controlName, controlList[i].controlName) == 0)
		{
			return controlList[i].curValue;
		}
	}

	return 0;
}

void SetControlValueByName(char* controlName, int newValue)
{
	for(int i = 0; i < numberOfControls; i++)
	{
		if(strcmp(controlName, controlList[i].controlName) == 0)
		{
			if(controlList[i].curValue != newValue)
			{
				controlList[i].curValue = newValue;
				SendOutputByID(controlList[i].controlID, controlList[i].curValue);
			}
		}
	}
}

void StartHeep(char* deviceName, heepByte deviceIcon)
{
	SetupHeepDevice(deviceName, deviceIcon);
	SetupHeepTasks();
  	CreateInterruptServer(); 
}