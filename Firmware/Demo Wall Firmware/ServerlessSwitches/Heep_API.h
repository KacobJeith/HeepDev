#include "Scheduler.h"

#ifdef ON_ARDUINO
#include "ENC28j60_HeepComms.h"
#include "Arduino_EEPROM.h"
#else
#include "Simulation_HeepComms.h"
#include "Simulation_NonVolatileMemory.h"
#endif

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
}