#include "Scheduler.h"

#ifdef ON_PC
#include "Socket_HeepComms.h"
#include "Simulation_NonVolatileMemory.h"
#endif

#ifdef ON_ARDUINO
#include "ENC28j60_HeepComms.h"
#include "Arduino_EEPROM.h"
#endif

#ifdef SIMULATION
#include "Simulation_HeepComms.h"
#include "Simulation_NonVolatileMemory.h"
#endif

#ifdef ON_PIC
#include "PICW5500_HeepComms.h"
#include "Simulation_NonVolatileMemory.h"
#endif

// Prototypes
void CommitMemory();

unsigned char clearMemory = 1;
void SetupHeepDevice(char* deviceName)
{
	unsigned char clearMemory = 1;
	
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

void SendOutputByID(unsigned char controlID, unsigned int value)
{
	SetControlValueByID(controlID, value, 0);

	struct Vertex_Byte newVertex;

	for(int i = 0; i < numberOfVertices; i++)
	{
		GetVertexAtPointer_Byte(vertexPointerList[i], &newVertex);

		if(CheckBufferEquality(newVertex.txID, deviceIDByte, STANDARD_ID_SIZE) && newVertex.txControlID == controlID)
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
		SaveMemory(controlRegister, deviceMemory, curFilledMemory);
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