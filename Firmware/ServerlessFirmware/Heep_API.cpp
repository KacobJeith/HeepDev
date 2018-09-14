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

enum Tasks {Defragment = 0, saveMemory = 1, PostData = 2, CheckIP = 3};
void SetupHeepTasks()
{
	ScheduleTask(Defragment);
	ScheduleTask(saveMemory);
	ScheduleTask(PostData);
	ScheduleTask(CheckIP);
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
#ifdef POST_ANALYTICS
void PostDataToFirebase()
{
	AddAnalyticsStringToOutputBufferAndDeleteMOPs();

	if(outputBufferLastByte > 0)
	{
		SendDataToFirebase(outputBuffer, outputBufferLastByte, deviceIDByte);
	}
}
#endif
#endif

void HandleIPChanges()
{
	HeepIPAddress IPFromMemory;
	HeepIPAddress CurrentIP;

	GetIPFromMemory(&IPFromMemory);
	GetCurrentIP(&CurrentIP);

	if(IPFromMemory.Octet4 != CurrentIP.Octet4
		|| IPFromMemory.Octet3 != CurrentIP.Octet3
		|| IPFromMemory.Octet2 != CurrentIP.Octet2
		|| IPFromMemory.Octet1 != CurrentIP.Octet1)
	{
		FragmentAllOfMOP(DeviceIPOpCode);
		// Handle Changed IP Address
		SetIPInMemory_Byte(CurrentIP, deviceIDByte);
		FillOutputBufferWithIPChanged();

		// Send out our change broadcast 3 times and hope someone bites
		// If they do not, a front end or sliding window protocol will handle
		for(int i = 0; i < 3; i++)
			BroadcastOutputBuffer();
	}
}

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
#ifdef POST_ANALYTICS
		else if(curTask == PostData)
		{	
			PostDataToFirebase();
		}
#endif
#endif
		else if(curTask == CheckIP)
		{
			HandleIPChanges();
		}
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

void AddMomentaryControl(char* controlName, int inputOutput)
{
	Control newControl;
	newControl.controlName = controlName;
	newControl.controlID = numberOfControls;
	newControl.controlDirection = inputOutput;
	newControl.controlType = HEEP_MOMENTARY;
	newControl.highValue = 1;
	newControl.lowValue = 0;
	newControl.curValue = 0;
	AddControl(newControl);
}

int GetControlValueByName(char* controlName)
{
	for(int i = 0; i < numberOfControls; i++)
	{
		if(strcmp(controlName, controlList[i].controlName) == 0)
		{
			int retVal = controlList[i].curValue;

			if(controlList[i].controlType == HEEP_MOMENTARY)
			{
				controlList[i].curValue = 0;
			}

			return retVal;
		}
	}

	return 0;
}

int GetControlIndexByName(char* controlName)
{
	for(int i = 0; i < numberOfControls; i++)
	{
		if(strcmp(controlName, controlList[i].controlName) == 0)
		{
			return i;
		}
	}

	return -1;
}

void HandleMomentaryOutputs(int controlIndex)
{
	if(controlList[controlIndex].controlType == HEEP_MOMENTARY)
		controlList[controlIndex].curValue = 0;
}

void SetControlValueByName(char* controlName, int newValue)
{
	int controlIndex = GetControlIndexByName(controlName);

	if(controlIndex != -1)
	{
		if(controlList[controlIndex].curValue != newValue)
		{
			controlList[controlIndex].curValue = newValue;
			SendOutputByID(controlList[controlIndex].controlID, controlList[controlIndex].curValue);
		}
		HandleMomentaryOutputs(controlIndex);
	}
}

void SetControlValueByNameAlwaysSend(char* controlName, int newValue)
{
	int controlIndex = GetControlIndexByName(controlName);

	if(controlIndex != -1)
	{
		controlList[controlIndex].curValue = newValue;
		SendOutputByID(controlList[controlIndex].controlID, controlList[controlIndex].curValue);
		HandleMomentaryOutputs(controlIndex);
	}
}

void SetControlValueByNameNoSend(char *controlName, int newValue)
{
	int controlIndex = GetControlIndexByName(controlName);

	if(controlIndex != -1)
	{
		controlList[controlIndex].curValue = newValue;
#ifdef USE_ANALYTICS
		SetAnalyticsDataControlValueInMemory_Byte(controlList[controlIndex].controlID, controlList[controlIndex].curValue, deviceIDByte);
#endif
		HandleMomentaryOutputs(controlIndex);
	}
}

void SetControlValueByNameNoAnalytics(char *controlName, int newValue)
{
	int controlIndex = GetControlIndexByName(controlName);

	if(controlIndex != -1)
	{
		if(controlList[controlIndex].curValue != newValue)
		{
			controlList[controlIndex].curValue = newValue;
			SendOutputByIDNoAnalytics(controlList[controlIndex].controlID, controlList[controlIndex].curValue);
		}
		HandleMomentaryOutputs(controlIndex);
	}
}

void SetControlValueByNameNoAnalyticsNoSend(char *controlName, int newValue)
{
	int controlIndex = GetControlIndexByName(controlName);

	if(controlIndex != -1)
	{
		controlList[controlIndex].curValue = newValue;
		HandleMomentaryOutputs(controlIndex);
	}
}

void SetControlValueByNameNoAnalyticsAlwaysSend(char *controlName, int newValue)
{
	int controlIndex = GetControlIndexByName(controlName);

	if(controlIndex != -1)
	{
		controlList[controlIndex].curValue = newValue;
		SendOutputByIDNoAnalytics(controlList[controlIndex].controlID, controlList[controlIndex].curValue);
		HandleMomentaryOutputs(controlIndex);
	}
}

#ifdef POST_ANALYTICS
void GetCurrentRealTime()
{
	uint64_t realTime = GetRealTimeFromNetwork();
	SetAnalyticsTime(realTime);
}
#endif

void StartHeep(char* deviceName, heepByte deviceIcon)
{
	SetupHeepDevice(deviceName, deviceIcon);
	SetupHeepTasks();
  	CreateInterruptServer(); 

#ifdef POST_ANALYTICS
	PostNameToFirebase(deviceName, strlen(deviceName), deviceIDByte);
	for(int i = 0; i < numberOfControls; i++)
	{
		PostControlToFirebase(controlList[i].controlID, controlList[i].controlType, controlList[i].controlDirection, controlList[i].highValue, controlList[i].lowValue, controlList[i].controlName, deviceIDByte);
	}

	GetCurrentRealTime();
#endif
}

heepByte HandleHeepCommunications()
{
	if(IsROP()) 
		return 1;

	ExecuteControlOpCodes();
	return 0;
}

unsigned long lastHeartBeat = 0;
void SendControlsOnHeartBeat(unsigned long controlSendPeriod)
{
	if(GetMillis() - lastHeartBeat > controlSendPeriod)
	{
		for(int i = 0; i < numberOfControls; i++)
		{
			if(controlList[i].controlDirection == HEEP_OUTPUT)
			{
				SendOutputByID(controlList[i].controlID, controlList[i].curValue);
			}
		}
		lastHeartBeat = GetMillis(); 
	}
}

heepByte AddUserMemory(heepByte userMemoryNumber, heepByte* buffer, int bufferLength)
{
	return AddUserMOP(userMemoryNumber, buffer, bufferLength, deviceIDByte);
}

heepByte GetUserMemory(heepByte userMemoryNumber, heepByte* buffer, int* bytesReturned)
{
	return GetUserMOP(userMemoryNumber, buffer, bytesReturned);
}