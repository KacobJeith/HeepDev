#include "Scheduler.h"

#ifdef ON_PC
#include "Socket_HeepComms.h"
#include "Simulation_NonVolatileMemory.h"

#else

#ifdef ON_ARDUINO
#include "ENC28j60_HeepComms.h"
#include "Arduino_EEPROM.h"

#else
#include "Simulation_HeepComms.h"
#include "Simulation_NonVolatileMemory.h"
#endif

#endif


unsigned char clearMemory = 0;
void SetupHeepDevice(char* deviceName)
{
	if(clearMemory)
	{
		ClearMemory();
		SetDeviceName(deviceName);
	}
	else
	{
		ReadMemory(deviceMemory, curFilledMemory);
	}
}

void SendOutputByID(unsigned char controlID, unsigned int value)
{
	SetControlValueByID(controlID, value);

	Vertex newVertex;

	for(int i = 0; i < numberOfVertices; i++)
	{
		GetVertexAtPonter(vertexPointerList[i], newVertex);

		if(newVertex.txID == deviceID && newVertex.txControlID == controlID)
		{
			FillOutputBufferWithSetValCOP(newVertex.rxControlID, value);
			SendOutputBufferToIP(newVertex.rxIPAddress);
		}
	}
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
		SaveMemory(deviceMemory, curFilledMemory);
		memoryChanged = 0;
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

	CheckServerForInputs();
	ControlDaemon();
}